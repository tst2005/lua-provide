--[[--------------------------------------------------------
	-- Dragoon Framework - A Framework for Lua/LOVE --
	-- Copyright (c) 2014-2015 TsT worldmaster.fr --
--]]--------------------------------------------------------

local provide = require("provide")
local preload = provide.preload

preload("toto", function() return {toto = "ok"} end)
assert(package.loaded.toto == nil)
assert(require("toto").toto == "ok")
print("ok: toto")

provide("io2", 'io')
assert(require("io2") == require("io"))
print("ok: io2")

provide("io2", 'string', "force")
assert(require("io2") == require("string"))
print("ok: io2 overwritten")

preload("io3", function() return require("table") end, "force")
assert(require("io3") == require("table"))
print("ok: io3")

preload("mod3", function() return {me="mod3"} end)
preload("mod2", "mod3")
local ok, res = pcall(require, "mod2")
if not ok then
	print("FAIL: mod2 via mod3 : ", res)
else
	print("ok: mod2 via mod3")
end


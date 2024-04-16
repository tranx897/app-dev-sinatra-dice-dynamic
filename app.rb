require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

# Dynamic path segment
get("/dice/:number_of_dice/:how_many_sides") do 
  @num_dice = params["number_of_dice"].to_i
  @sides = params["how_many_sides"].to_i
  @rolls = []

  @num_dice.times do
    die = rand(1..@sides)
    @rolls.push(die)
  end

  erb(:flexible)
end

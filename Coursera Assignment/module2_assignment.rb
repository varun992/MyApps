
class LineAnalyzer
 
  attr_reader :highest_wf_count ,:highest_wf_words , :content , :line_number

 
	  def initialize(line, line_no)  
		@content = line
		@line_number = line_no
		self.calculate_word_frequency 
	end


	def calculate_word_frequency
		
		@word_frequency = Hash.new(0)
		@content.split.each do |word|
		@word_frequency[word.downcase]+=1
		end
		@highest_wf_count=@word_frequency.max_by{ |k,v| v }[1]
		@highest_wf_words = []
		@word_frequency.each  do |k,v|
			if(@word_frequency[k]==@highest_wf_count)
				@highest_wf_words << k
			
			end
			
		end	
		
	end

end

#  Implement a class called Solution. 
class Solution


	attr_reader :analyzers , :highest_count_across_lines,:highest_count_words_across_lines

	def analyze_file()
		@analyzers= []
		File.foreach('test.txt') do |line|
		#p $.
		@analyzers .push(LineAnalyzer.new(line.chomp,$.))
		#puts "  #{@analyzers[$.-1].highest_wf_words}  "
		puts " #{@analyzers[$.-1].highest_wf_count}   #{@analyzers[$.-1].highest_wf_words} "
		end
		
	end
			

  
  def calculate_line_with_highest_frequency()
	@highest_count_words_across_lines = []
	@check_count = @analyzers.max_by{|e| e.highest_wf_count}
	@check = @analyzers.find_all{|e| e.highest_wf_count==@check_count.highest_wf_count}
	 @highest_count_across_lines = @check_count.highest_wf_count
	@check.each {|item| item.highest_wf_words.each{|word| @highest_count_words_across_lines << word}}
	
	end
	
  	def print_highest_word_frequency_across_lines
		puts "highest count words accross lines is #{@highest_count_across_lines} for the words : #{@highest_count_words_across_lines}"
	end
  
end

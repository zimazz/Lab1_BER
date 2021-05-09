function rec_bit_seq = DecodeBitsFromSamples(rec_sample_seq,case_type,fs)
%
% Inputs:
%   rec_sample_seq: The input sample sequence to the channel
%   case_type:      The sampling frequency used to generate the sample sequence
%   fs:             The bit flipping probability
% Outputs:
%   rec_sample_seq: The sequence of sample sequence after passing through the channel
%
% This function takes the sample sequence after passing through the
% channel, and decodes from it the sequence of bits based on the considered
% case and the sampling frequence

if (nargin <= 2)
    fs = 1;
end

switch case_type
    
    case 'part_1'
        %%% WRITE YOUR CODE FOR PART 1 HERE
        rec_bit_seq = zeros(size(rec_sample_seq));
        reciever_effect = rand(size(rec_bit_seq))>=fs;
        rec_bit_seq = xor(rec_sample_seq,reciever_effect);
        %%%
    case 'part_2'
        %%% WRITE YOUR CODE FOR PART 2 HERE
        ones_ = 0;
        zeros_ = 0;
        rec_bit_seq = [];
        for i = 1:length(rec_sample_seq)
          if rec_sample_seq(i) == 1
            ones_ = ones_ + 1;
          else
            zeros_ = zeros_ + 1;
          endif
          if mod(i,fs) == 0
            if ones_ > zeros_
              rec_bit_seq = horzcat(rec_bit_seq,1);
              ones_ = 0;
              zeros_ = 0;
            else
              rec_bit_seq = horzcat(rec_bit_seq,0);
              ones_ = 0;
              zeros_ = 0;
            endif
          endif
        endfor  
        %%%
    case 'part_3'
        %%% WRITE YOUR CODE FOR PART 3 HERE
        rec_bit_seq = [];
        for i = fs : fs : length(rec_sample_seq)
          rec_bit_seq =  horzcat(rec_bit_seq,rec_sample_seq(i));     
        endfor
        
        %%%
end
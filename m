Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1338860F63E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 13:32:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo17M-0000yu-Rw; Thu, 27 Oct 2022 07:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo16o-0000Cs-4q
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:31:41 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo16k-0003QM-Jf
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:31:36 -0400
Received: by mail-pg1-x52b.google.com with SMTP id h185so1052056pgc.10
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 04:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R8Ng0A0lfaW9uhiIVB7shfeN8TBveELP0M2tsYgSEdQ=;
 b=py4/B0PYiazeNJ+qGpZlau3G9FDl+EDpLH7vzCqV/9cTIqIppwOfywvuGTgoWKmYhz
 PrjvmHbmtqfKsNbK37OeLH2LBqAq/T7CYLqqUGFKLtO2GS6L48niYs3Ankscc/gJGDgM
 8p0uM0qL0RPboXIJkrOnju2ubYV6ZYpikIUIrEvCx71zyUA1k/OZMezlALG3thhAp8lI
 ZoHgnrXRXqLjAtUag8Frqcym4h9Y8E52Y1BGxjG+NvKZ9Ukzt0e9F8xZA0tNPfv0vaYt
 OnD+uFOT9LcVzUUbroC/uf3sdo7xFQrZ5VPNcO21lzI/J/0FvgSwUyBsb55oum2jbKOv
 G2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R8Ng0A0lfaW9uhiIVB7shfeN8TBveELP0M2tsYgSEdQ=;
 b=HMZJvBvCVeBYtlKCqWvIcbSKO5TOW5WLNY7f0piqryPtVTPGG+D0Tkgeuf880omcbr
 GKDZwbbnVDFGcreCwVrYtevY7Mcyc6+AOb/SHwMR9pWfOhti1dV8w9EmpRvOCzQXmS1K
 K+0GApB7qIAQwNvq+BQ2uMRnU+kGNlgF0ho0BNnR8pJTdvnT4SjymWDvMdukuEJKGcjE
 vi5/M0fuQx5jWkZw8wgHGp0huW5IcVto6IY4UZ0/4gzmahYvuRhWtbtrj21aBidiAThN
 GdNY3tjwHH3XWlfQA2H8FCYr+GO0LmdaJyFkuEMEk+WA73bL1X/iv69oQRyLVnXqpzWv
 kdQw==
X-Gm-Message-State: ACrzQf0c6j8KEwIQV5zAjw39GrLkHSXQN+s9ck526H78w09q3VKD4q7/
 uXUdXGuhM9S0yY74IvVHIJzEHg==
X-Google-Smtp-Source: AMsMyM43j1HJF1hctM1PUspHHkGdGpbR/5oPoJosoZEKVKBUmzXDAnYsjfqU+LCoSoq1sZWikEay/A==
X-Received: by 2002:a05:6a02:11a:b0:441:9db5:e8cc with SMTP id
 bg26-20020a056a02011a00b004419db5e8ccmr40781483pgb.345.1666870292981; 
 Thu, 27 Oct 2022 04:31:32 -0700 (PDT)
Received: from ?IPV6:2001:8003:501a:d301:3a91:9408:3918:55a?
 ([2001:8003:501a:d301:3a91:9408:3918:55a])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a170903124f00b00186c41bd213sm1013269plh.177.2022.10.27.04.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 04:31:32 -0700 (PDT)
Message-ID: <d0bdf6cf-06ef-85fb-3237-61e08c9f8efb@linaro.org>
Date: Thu, 27 Oct 2022 21:31:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 8/9] target/s390x: Use Int128 for returning float128
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-9-richard.henderson@linaro.org>
 <20221027111802.t7p2txte5qbdtoyz@heavy>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221027111802.t7p2txte5qbdtoyz@heavy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/27/22 21:18, Ilya Leoshkevich wrote:
> On Fri, Oct 21, 2022 at 05:30:05PM +1000, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/s390x/helper.h          | 22 +++++++--------
>>   target/s390x/tcg/fpu_helper.c  | 29 ++++++++++----------
>>   target/s390x/tcg/translate.c   | 49 +++++++++++++++++++---------------
>>   target/s390x/tcg/insn-data.def | 20 +++++++-------
>>   4 files changed, 63 insertions(+), 57 deletions(-)
>>
> 
>> @@ -2032,7 +2031,7 @@ static DisasJumpType op_cxlgb(DisasContext *s, DisasOps *o)
>>       if (!m34) {
>>           return DISAS_NORETURN;
>>       }
>> -    gen_helper_cxlgb(o->out, cpu_env, o->in2, m34);
>> +    gen_helper_cxlgb(o->out_128, cpu_env, o->in2, m34);
>>       tcg_temp_free_i32(m34);
>>       return_low128(o->out2);
>>       return DISAS_NEXT;
> 
> Do we still need return_low128() here?
> 
>>   static DisasJumpType op_lxeb(DisasContext *s, DisasOps *o)
>>   {
>> -    gen_helper_lxeb(o->out, cpu_env, o->in2);
>> +    gen_helper_lxeb(o->out_128, cpu_env, o->in2);
>>       return_low128(o->out2);
>>       return DISAS_NEXT;
>>   }
> 
> Same question.

Nope, that should have gone away.  Oops.


r~


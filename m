Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ECE6A28CE
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 11:11:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVrVE-0006GJ-T9; Sat, 25 Feb 2023 05:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVrVC-0006Es-VU
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 05:10:02 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVrVB-0000f4-CS
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 05:10:02 -0500
Received: by mail-pl1-x62e.google.com with SMTP id c1so1966695plg.4
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 02:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ixkypcc2ZW3co0yamMPocQq8bnB59YTEjjpaNfWlY1w=;
 b=x94UIpeC5zEMFPBsdbNMbs7EIbyhEbn8ppG/+qaEP6+d7juLUxkk+fKgyv4UG50P3z
 AoPvGZweTSt3v9samMKEHxjAottaMjUoVsIKnp3NMlRzL0C8PPD0Q5H3ybI3ZrpzS+LE
 bYWQ0GywnCoPQIP0V3kgXKYj6jeDqOrUSP6J3889O1etFWklxLdNTPdrlta21QMH56xF
 nq6+x40KuhogkZjo+8hvzl/EIV93VhTjPRSjm/KvX6O7ggIGTvufRF8yT6APXBRcrnv7
 vSQm2qfUAtqdCsp/7aD7wIXENqrdeLfEsUgwiQGdnmI3Sw2qfJ3tGIawDdK6qWALx6cd
 na+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ixkypcc2ZW3co0yamMPocQq8bnB59YTEjjpaNfWlY1w=;
 b=a32jXQxKy2NJ4UmIk0/7R13VVGvG9Z1oqPLr8C1XQWC8s4VmSyc6bXkz+uumqhGMot
 GB5LKGweDn0DoJHetmpZZyrcwobSrG6bsvkaarX89Msu9W9xR9e6PbKjqwu+yCR6rmtl
 62x/uSp0ODdg3s8sbFGnKMYjto7sp2ocLg40AdVKxXuwGBQHq8IqKY+d4k8xNPTq8KHt
 dektp/Ukv7dMe/IwZUhJp8RLFRypy+nO+mYrh/Wqoe1Obqchb8RZcUCuejLn3/LbrTKc
 wthI181U3R7/E8xejUE9mmZh/wvYJVzqyvAvgxM69UtOrjC8DnohqA+oVr/eOpq23p3B
 s94w==
X-Gm-Message-State: AO0yUKVCicNzzzm2uEBOqsHaashvQmy3wky7BEIM1ELkkJ2OYScxK5Bf
 96ibGIWXZTYCkZsaJRxvn5F+sg==
X-Google-Smtp-Source: AK7set+TlWwhqaxovWnQ9SPW/GNY328DuizTvVutGf0mEadALLR52K+f5uqu710O7h27CyQONPs1IA==
X-Received: by 2002:a17:903:22c8:b0:19b:64bb:d547 with SMTP id
 y8-20020a17090322c800b0019b64bbd547mr20082295plg.62.1677319799554; 
 Sat, 25 Feb 2023 02:09:59 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 p12-20020a170902eacc00b0019bd934434esm933447pld.53.2023.02.25.02.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:09:59 -0800 (PST)
Message-ID: <fd2c7018-ab20-efa6-fe46-23e857c46843@linaro.org>
Date: Sat, 25 Feb 2023 00:09:55 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 20/30] target/arm: Don't use tcg_temp_local_new_*
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
 <20230225085945.1798188-21-richard.henderson@linaro.org>
 <93fb111c-818e-d644-d132-41b6d0cd0fb9@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <93fb111c-818e-d644-d132-41b6d0cd0fb9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/25/23 00:05, Philippe Mathieu-Daudé wrote:
> On 25/2/23 09:59, Richard Henderson wrote:
>> Since tcg_temp_new_* is now identical, use those.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/translate-sve.c | 6 +++---
>>   target/arm/translate.c     | 6 +++---
>>   2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
>> index 02150d93e8..718a5bce1b 100644
>> --- a/target/arm/translate-sve.c
>> +++ b/target/arm/translate-sve.c
> 
> 
>> @@ -4342,7 +4342,7 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
>>           tcg_temp_free_i64(t0);
>>       } else {
>>           TCGLabel *loop = gen_new_label();
>> -        TCGv_ptr tp, i = tcg_const_local_ptr(0);
>> +        TCGv_ptr tp, i = tcg_const_ptr(0);
> 
> Can we directly switch to tcg_constant_ptr(NULL)?

No, i is written.  This ought to get changed to tcg_temp_new + tcg_gen_movi, but that'll 
wait for a different patch set.


r~


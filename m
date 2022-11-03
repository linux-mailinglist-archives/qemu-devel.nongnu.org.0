Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34F8618C9D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 00:12:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqjMs-0007Ad-MH; Thu, 03 Nov 2022 19:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqjH7-0003C0-Tr
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 19:05:37 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqjH4-0003oO-RF
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 19:05:29 -0400
Received: by mail-pl1-x632.google.com with SMTP id y4so3344662plb.2
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 16:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y4L3MaUWBMpKGLLcm8nD2+P3BLH28a3zXSJn6PxSv5Y=;
 b=kM5xmgYTY43P2srX3wP9YJa6/xfYEbLpfNRVcOCtVA/lvMjMmAZ+ieQAczJwXghqtH
 u1JBejgk+GPBAc/NAvR8X/MhEYkYz81jmyGmzCivJE4/E3Fc2DVNEhUZqdyGEQB2SYE8
 dk1mJv66RoWTnHTy+lmTfdbYTJwSYYfJqgSOifm0EM5j8/myRF4gMzqJVSe+uiQDnH7b
 7qVT6FPaHmJJllMmKwhGoZqAIDNa+Xg7sparfFMkioflGwFtIN1guwoy8hVLpM5O9/4l
 iy5vpCeLaFgbuoC6VQkaxliYejI42OrpXnEm1Eb46U8D9J78pjdoHqS67Ei8WWL0JuGX
 5zyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4L3MaUWBMpKGLLcm8nD2+P3BLH28a3zXSJn6PxSv5Y=;
 b=mBcMD9De9mwpmZ3SdVQPrxDOMRHdNlq7yhYA0g+7HYCrx6AQFfV/3gpKI3P2LKQ8SP
 O3EhN7dSL3o1uBZPK+GNIdLPD+sjeTJDF9h7c+5uKqGU3D9MWXhAt/V6IUKw+za4D5MI
 gWNHheJSobDpaOWZ1ZZDwgMUACIatDGSJT3vD8wZQv8/JPJWMONSUj5OfVfw6WIylqeR
 6Pl52syfJFb9uXwySc3598dk5VmAnQDgRV8euYkakjZle2h87NnYAlUiqKtJ0NJisFfI
 cOqj0nCD1zRvxmrKyITYboij94NU2SWTsnkVjNECuka6DT2/aHSC0FLyPxxUsHh+G0GO
 +R0Q==
X-Gm-Message-State: ACrzQf1bDSQIZ5zcuynPruBQboqKVw+WXbAfO7EH7MtmodFXZz0KOaOz
 D4EXh+JMj5nGez3idOAUXtiDCyPmCIBauk5t
X-Google-Smtp-Source: AMsMyM415SsYP+BF3tRjGDRqrsQUNJ2jmbK7HWAdM/9AOSDFTZvEKpFdXV5ML7vtb6nWGbnZ5Ltm8A==
X-Received: by 2002:a17:903:3293:b0:186:867b:e24 with SMTP id
 jh19-20020a170903329300b00186867b0e24mr32137457plb.127.1667516725162; 
 Thu, 03 Nov 2022 16:05:25 -0700 (PDT)
Received: from [192.168.229.227] ([206.83.113.103])
 by smtp.gmail.com with ESMTPSA id
 h16-20020aa796d0000000b0056cea9530b9sm1237885pfq.200.2022.11.03.16.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 16:05:23 -0700 (PDT)
Message-ID: <36c5ba4b-c506-6304-3e9c-c9a04807c37d@linaro.org>
Date: Fri, 4 Nov 2022 10:05:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 04/26] target/s390x: Use tcg_constant_* in
 translate_vx.c.inc
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-5-richard.henderson@linaro.org>
 <20221103110418.ou6uj6k26fzookxr@heavy>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221103110418.ou6uj6k26fzookxr@heavy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

On 11/3/22 22:04, Ilya Leoshkevich wrote:
> On Wed, Oct 05, 2022 at 08:43:59PM -0700, Richard Henderson wrote:
>> In most cases, this is a simple local allocate and free
>> replaced by tcg_constant_*.  In three cases, a variable
>> temp was initialized with a constant value -- reorg to
>> localize the constant.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/s390x/tcg/translate_vx.c.inc | 45 +++++++++++++----------------
>>   1 file changed, 20 insertions(+), 25 deletions(-)
> 
> ...
> 
>> @@ -1359,7 +1359,7 @@ static DisasJumpType op_va(DisasContext *s, DisasOps *o)
>>   static void gen_acc(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, uint8_t es)
>>   {
>>       const uint8_t msb_bit_nr = NUM_VEC_ELEMENT_BITS(es) - 1;
>> -    TCGv_i64 msb_mask = tcg_const_i64(dup_const(es, 1ull << msb_bit_nr));
>> +    TCGv_i64 msb_mask = tcg_constant_i64(dup_const(es, 1ull << msb_bit_nr));
>>       TCGv_i64 t1 = tcg_temp_new_i64();
>>       TCGv_i64 t2 = tcg_temp_new_i64();
>>       TCGv_i64 t3 = tcg_temp_new_i64();
> 
> This also fixes a leak, right?

Yes.


r~


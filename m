Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCF15B1CDA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 14:24:18 +0200 (CEST)
Received: from localhost ([::1]:43360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWGZs-0001pA-Pz
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 08:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWGQA-00013J-CW
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:14:14 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWGQ7-0005Kh-I1
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 08:14:13 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso1565122wmc.0
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 05:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+JvgUo+Hqe/ZbKSNni+t+XJlO0htHrZm+6bjlI8rlL8=;
 b=i/YoUhO/d2DBRvRGJv9qhH9+UVFrXg2qUlnhU7oB8X/6tCeTW+mfzQcxUhbMpEIt+9
 IwqvQSYFqskwnf4U17sPONuiE22ZnlJfLj6lqcb5YZTsXMUq5JNM4TZN1vN9X7+ybwVI
 9mC7Hcdu0ec5KsPPC5YQp23t651whBdlVaCOCczak2CIGPeJqVhm05ZZLFYznOT1u8Z9
 gOVzxE7DELN1JwTckBoqpsLaqTUkTipSyZewqQ/fByS7re16vBrTcK6daJSZ9fhhreRH
 NMT0s35TMuNUxqjYqSEylPYNbgogCn0NIMz2PbEL8Ictd5xaMiaT9y0UKc8peH7VAQ9n
 W/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+JvgUo+Hqe/ZbKSNni+t+XJlO0htHrZm+6bjlI8rlL8=;
 b=a2r48IxaNMMZhvlyVaagQkNRETE32BhogM5G82AVAIYXRk6AhPmJGZKOjRhzovK+4X
 etfu41A+56JTNqnm4h6STyWI2n8kwAxSO6KPVpwCaKYkzPt9uULlAnVgrZwPr+E9gXZm
 AvnzMRxIksE8zkXQWTqcWAL1mmc9NvUfSswv6Hh/7oHOkgv4BvQ1w3pU/p+Y6p1c4+S7
 2+gZQR2+o55vABnNy/yOS3Bj0bfV1mZ2xUaJ3j5J5r/Vm+MxQsElWKKnIFDxaM5LTq6e
 P/F2KH4syiW8JoxHBkpBa6d6bTe/FBsZmc1cqWLRkvs5K6j+++fsMrxlX+HbF0OOn6ir
 P76A==
X-Gm-Message-State: ACgBeo2Mf4zhpqLvmtkTQHfuqT3l9GdC+Dom+wTUXdmyvne11aHby6eD
 BQUAd+bEanXulq3Cnvjq/3nRjw==
X-Google-Smtp-Source: AA6agR4dvByOOTCTlzF5NS69lyfyTStaHbP+f50E/zhsDCk8Yr1QGdnRqSlPl2Q9aZQ+DQLFuYBXDw==
X-Received: by 2002:a05:600c:b47:b0:3a5:a431:ce36 with SMTP id
 k7-20020a05600c0b4700b003a5a431ce36mr2128589wmr.89.1662639249048; 
 Thu, 08 Sep 2022 05:14:09 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a05600c35cb00b003b31fc77407sm2342381wmq.30.2022.09.08.05.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 05:14:08 -0700 (PDT)
Message-ID: <6f8145a0-b479-5624-3158-18fee240b24c@linaro.org>
Date: Thu, 8 Sep 2022 13:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 02/23] target/i386: Return bool from disas_insn
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-3-richard.henderson@linaro.org>
 <b0adb12e-56d7-76ca-0eed-ec4938ffcb58@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b0adb12e-56d7-76ca-0eed-ec4938ffcb58@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/22 15:42, Philippe Mathieu-Daudé wrote:
> On 6/9/22 12:09, Richard Henderson wrote:
>> Instead of returning the new pc, which is present in
>> DisasContext, return true if an insn was translated.
>> This is false when we detect a page crossing and must
>> undo the insn under translation.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/i386/tcg/translate.c | 42 +++++++++++++++++++------------------
>>   1 file changed, 22 insertions(+), 20 deletions(-)
>>
>> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
>> index 1e24bb2985..46300ffd91 100644
>> --- a/target/i386/tcg/translate.c
>> +++ b/target/i386/tcg/translate.c
>> @@ -4665,7 +4665,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
>>   /* convert one instruction. s->base.is_jmp is set if the translation must
>>      be stopped. Return the next pc value */
>> -static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>> +static bool disas_insn(DisasContext *s, CPUState *cpu)
>>   {
>>       CPUX86State *env = cpu->env_ptr;
>>       int b, prefixes;
>> @@ -4695,12 +4695,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>>           return s->pc;
> 
> Shouldn't we return 'true' here?

Whoops, yes.


r~


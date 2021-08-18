Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28653F0DA9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:48:26 +0200 (CEST)
Received: from localhost ([::1]:55964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTQ9-0001Wv-Dr
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGT9q-0001ju-P1
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:31:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGT9p-0007Na-7m
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:31:34 -0400
Received: by mail-wm1-x32f.google.com with SMTP id f10so2498975wml.2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XetYpCU5uTQx1aMWCfxWWbdU81YqeB4V1kUnBWlM/xs=;
 b=c4Oo3vLjoPbj/48tn5Vkl917o12lK3bx3DeaA4sf5Xzs05I4CTgoMKMjHyTm0uNnP5
 Md879X7oeaUpfS7CXmySuQcXosEq6ldzVP0FaPQjm4AgHO+H9olFvGu+h4HioW00GlL0
 RVf6QMXcGXKBQHdNBZo2Hsa9AS08IXr9goBOvyLAkAgIpUIMO7bwMi9NvxF0+YPbNXVy
 xHZurCtBozSXM25VNo8nH0fEZULb/Op2pAEYngb+5H5qplLHfp37VASD+t2C3eDW/Lyz
 ZD4Pj9c5JQq8K6G4FqADWyI6flARWYDyv19Yna+SKz3yWI2JH/UY7nlttMVIlqE06YlY
 oX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XetYpCU5uTQx1aMWCfxWWbdU81YqeB4V1kUnBWlM/xs=;
 b=DGpdGSYx+QHtCTBi1yOKTFnjAi+RWavEpC90dcvu5g13RcgGC/0zv/jqEX2GN2VcsQ
 I2JIihmzbQRqFKuywwKuCjtsPSDmVzcUqzlErNR6kFe2ROoyhH5/XYb5IsJAUk6lP4aS
 uG2YiH8c+RJ7aYGiBkziu8qkdEPylqKrZ97+pRzh5jhUKSQgzApTS2PsumLh1/+u3hJ/
 QPo9RHviZGWgxgaCLbBq6PlK78VRu475ACeKZaiwmj5nNyN0bANmmBXSh1xsLGov8hx7
 fLZ/Ur6d3F+++12knEpWE/ijKmKVb09IRQ3BUzOvvAR4mdOOUQOfjDDHqffvojC/vWL2
 o2XQ==
X-Gm-Message-State: AOAM5331gdFIUSnp1u/qLxe0sgN5VPe2ToGJwdbKvCBe2Q7IS5hlTzH6
 SvfhPhnd4/jj0nUUKHhi6rw=
X-Google-Smtp-Source: ABdhPJxyQhI6bqsi5Bm2GMCIiQ2cfSSVct+ZAjITcrHEI40OdXJR2H+uNJ+KKgTLH0yZwwJrVZDfsg==
X-Received: by 2002:a1c:10e:: with SMTP id 14mr10338651wmb.93.1629322291336;
 Wed, 18 Aug 2021 14:31:31 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g12sm993912wru.85.2021.08.18.14.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 14:31:30 -0700 (PDT)
Subject: Re: [PATCH 1/5] target/mips: Replace GET_OFFSET() macro by
 get_offset() function
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818164321.2474534-1-f4bug@amsat.org>
 <20210818164321.2474534-2-f4bug@amsat.org>
 <eb7b7211-def7-b2fb-e843-57d0266ea20a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d50fcef1-c2c3-e68a-7ae1-96ba566a4a64@amsat.org>
Date: Wed, 18 Aug 2021 23:31:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <eb7b7211-def7-b2fb-e843-57d0266ea20a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 6:56 PM, Richard Henderson wrote:
> On 8/18/21 6:43 AM, Philippe Mathieu-Daudé wrote:
>> The target endianess information is stored in the BigEndian
>> bit of the Config0 register in CP0.
>>
>> As a first step, replace the GET_OFFSET() macro by an inlined
>> get_offset() function, passing CPUMIPSState as argument.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   target/mips/tcg/ldst_helper.c | 57 +++++++++++++++++++++--------------
>>   1 file changed, 35 insertions(+), 22 deletions(-)
>>
>> diff --git a/target/mips/tcg/ldst_helper.c
>> b/target/mips/tcg/ldst_helper.c
>> index d42812b8a6a..97e7ad7d7a4 100644
>> --- a/target/mips/tcg/ldst_helper.c
>> +++ b/target/mips/tcg/ldst_helper.c
>> @@ -52,31 +52,44 @@ HELPER_LD_ATOMIC(lld, ldq, 0x7, (target_ulong))
>>     #endif /* !CONFIG_USER_ONLY */
>>   +static inline bool cpu_is_bigendian(CPUMIPSState *env)
>> +{
>> +    return extract32(env->CP0_Config0, CP0C0_BE, 1);
>> +}
>> +
>>   #ifdef TARGET_WORDS_BIGENDIAN
>>   #define GET_LMASK(v) ((v) & 3)
>> -#define GET_OFFSET(addr, offset) (addr + (offset))
>>   #else
>>   #define GET_LMASK(v) (((v) & 3) ^ 3)
>> -#define GET_OFFSET(addr, offset) (addr - (offset))
>>   #endif
>>   +static inline target_ulong get_offset(CPUMIPSState *env,
>> +                                      target_ulong addr, int offset)
>> +{
>> +    if (cpu_is_bigendian(env)) {
>> +        return addr + offset;
>> +    } else {
>> +        return addr - offset;
>> +    }
>> +}
>> +
>>   void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong
>> arg2,
>>                   int mem_idx)
>>   {
>>       cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 24), mem_idx,
>> GETPC());
>>         if (GET_LMASK(arg2) <= 2) {
>> -        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >>
>> 16),
>> +        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 1),
>> (uint8_t)(arg1 >> 16),
>>                             mem_idx, GETPC());
>>       }
>>         if (GET_LMASK(arg2) <= 1) {
>> -        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >>
>> 8),
>> +        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 2),
>> (uint8_t)(arg1 >> 8),
>>                             mem_idx, GETPC());
> 
> So... yes, this is an improvement, but it's now substituting a constant
> for a runtime variable many times over.

Oops indeed.

>  I think you should drop
> get_offset() entirely and replace it with
> 
>     int dir = cpu_is_bigendian(env) ? 1 : -1;
> 
>     stb(env, arg2 + 1 * dir, data);
> 
>     stb(env, arg2 + 2 * dir, data);
> 
> Alternately, bite the bullet and split the function(s) into two,
> explicitly endian versions: helper_swl_be, helper_swl_le, etc.

I'll go for the easier path ;)


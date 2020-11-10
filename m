Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6F22AD211
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:08:23 +0100 (CET)
Received: from localhost ([::1]:51812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcPdW-0003f3-7v
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcPbu-0002mR-Cp; Tue, 10 Nov 2020 04:06:43 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcPbr-0002FG-Qs; Tue, 10 Nov 2020 04:06:41 -0500
Received: by mail-wr1-x444.google.com with SMTP id o15so3962989wru.6;
 Tue, 10 Nov 2020 01:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=074JOHKkvyezn24pio0e3nSgFMmkqEACFoq6hj+qxyA=;
 b=GVDEJToRkodDB3j/7ZQYvDGW6uReYL2SHX3FEqFhd9o33ujGI+/+2cn6Z39upq6XOI
 3RYLBO2cxBL99q74suf4hanI2WK/5gE8U1nZd2CWyt7uMbyG5J0Vwv1obf4mmALvnR5i
 5f9mES0ga1TltXh7vsx7pQTqQg8KgRNiJSaD/r1aw4OeJ8Iio84wKKROtrcPr7fnxTIl
 qRxAuVq4CkWrA2YqhZu0n1yxEYq2CY3u2YbP4giXylbhHh1JjfxRsV+wywwJuUs4YGfn
 S15poMjnli6YYODgP03o+mWQ3MWCt5sTzBHB43GYJmLez7xC7QXWdlSt07jkdXNFTe2/
 Nz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=074JOHKkvyezn24pio0e3nSgFMmkqEACFoq6hj+qxyA=;
 b=bWyFi86jIWALhFsI9fzaWNhkgupBMI5FZLWGdUI7Uy2O0xlCFs2S0dBOZ009WUhDRS
 0bzxynTO1gxgMH4RtTiGQczuJR/lXINjPSPLZeolf2F9ADjK6HW2eht3A9B624ydolbi
 4JJnaAR9mqH0lHuzLPtk4Bb7s358HuNIFBymlLlNCoulLhoWDJmO/Eue5KO812Uq42oQ
 +vEuwmWr1eBOFa0vw12IzxnZMbUQ8Q1oxxGEmItm3HgPd+1UJ6J/t5ZSlNn6G5sLO91J
 xM3/1S4ginb6X3q83hm0DnvJAikzJTzLM4W/74jedv9ZfnZF0rWzVZ4YTDVets0JNdEg
 ppJQ==
X-Gm-Message-State: AOAM533iLBbANjARW7b93AKjOfJg86oGALvSAPYE16sK4EBPLsbH8OEl
 luLkA5gjncf0VcprydPD0vnXs43IJ+E5GA==
X-Google-Smtp-Source: ABdhPJwLrH35s+JwC5XvbIRAGd+66+bBmWwlOb2aZZH6s66EHg1TSt311cp1ZwUUQeuCcGpW2nmxyA==
X-Received: by 2002:adf:c14c:: with SMTP id w12mr23828169wre.40.1604999197423; 
 Tue, 10 Nov 2020 01:06:37 -0800 (PST)
Received: from [192.168.1.103] ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id p4sm2458370wmc.46.2020.11.10.01.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 01:06:36 -0800 (PST)
Subject: Re: [PATCH] ppc/translate: Fix unordered f64/f128 comparisons
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201109102147.31747-1-thatlemon@gmail.com>
 <99c83004-82ef-882b-b41d-a163b0966aa4@linaro.org>
From: LemonBoy <thatlemon@gmail.com>
Message-ID: <75f8984e-7753-f3a8-a0d7-ef4adbd55790@gmail.com>
Date: Tue, 10 Nov 2020 10:06:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <99c83004-82ef-882b-b41d-a163b0966aa4@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=thatlemon@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/20 04:24, Richard Henderson wrote:
> On 11/9/20 2:21 AM, LemonBoy wrote:
>> According to the PowerISA v3.1 reference, Table 68 "Actions for xscmpudp
>> - Part 1: Compare Unordered", whenever one of the two operands is a NaN
>> the SO bit is set while the other three bits are cleared.
>>
>> Apply the same change to xscmpuqp.
>>
>> The respective ordered counterparts are unaffected.
>>
>> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
>> ---
>>  target/ppc/fpu_helper.c | 32 ++++++++++++++++++++++----------
>>  1 file changed, 22 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
>> index 9b8c8b70b6..b07ff66375 100644
>> --- a/target/ppc/fpu_helper.c
>> +++ b/target/ppc/fpu_helper.c
>> @@ -2479,13 +2479,11 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                      \
>>      if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||        \
>>          float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {        \
>>          vxsnan_flag = true;                                              \
>> -        cc = CRF_SO;                                                     \
>>          if (fpscr_ve == 0 && ordered) {                                  \
>>              vxvc_flag = true;                                            \
>>          }                                                                \
>>      } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||     \
>>                 float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {     \
>> -        cc = CRF_SO;                                                     \
>>          if (ordered) {                                                   \
>>              vxvc_flag = true;                                            \
>>          }                                                                \
>> @@ -2497,12 +2495,19 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                      \
>>          float_invalid_op_vxvc(env, 0, GETPC());                          \
>>      }                                                                    \
>>                                                                           \
>> -    if (float64_lt(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {         \
>> +    switch (float64_compare(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {\
>> +    case float_relation_less:                                            \
>>          cc |= CRF_LT;                                                    \
>> -    } else if (!float64_le(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) { \
>> -        cc |= CRF_GT;                                                    \
>> -    } else {                                                             \
>> +        break;                                                           \
>> +    case float_relation_equal:                                           \
>>          cc |= CRF_EQ;                                                    \
>> +        break;                                                           \
>> +    case float_relation_greater:                                         \
>> +        cc |= CRF_GT;                                                    \
>> +        break;                                                           \
>> +    case float_relation_unordered:                                       \
>> +        cc |= CRF_SO;                                                    \
>> +        break;                                                           \
>>      }                          
> 
> This needs some more cleanup.  There's no point in checking for nans first;
> wait until you get to float_relation_unordered.
> 
> These macros should be made into straight functions.
> 

Will do, I tried to keep the amount of changed lines as small as possible
but I'm happy to nuke that macro: aligning the trailing slashes took more
time than finding and fixing the bug :)

> 
> r~
> 


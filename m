Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D050265AF5D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 11:11:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCHmS-0005IM-7M; Mon, 02 Jan 2023 05:10:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pCHmQ-0005IB-Ah
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:10:54 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pCHmO-0004x2-F7
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g76O1wQAFu+oxZFZjvGDOw77DJG6PDjnibB1IPc97fA=; b=GLcu4PsA+/dpcbCwH0Jz5g7QAP
 IxLy+vJZlpULZaKEIcKwnHg7dET58GqroCc+EdHiwmfExrzfYpVu0vHKg0AtsT7ruHXzG6fWseceo
 hbZO+LXszzTGoRFMubDYW+0DHQASJcwIMtYfFmdU3rayd67rCrD5f1dZjhcTqbevAHWAFYpJUCfbQ
 x0P26YAoLlzkjFNCnGstO3tWMwmrB0PHdnBwIehiLA9P3qOnztAm3R+YLeN/9fX2YstNFYZaZ9jmD
 Zw3Kdwa/nSRcQ/axu1UT5E5vUMK1w6aPyCdG23sQE5p1n9b0j0iUWjiAV+lyElehB5oEgwnfm8/qC
 FY76itVzjGObBMHJB8MgylnWP/FOv6LXxsWoOZfZvXSQPGznj1Ofc7Fl8RoiKZ/PyEGAD+AQL+3Mw
 DVzVzsEPfczGyDdd5Rz1Zj/gaG1Qv+7TT8OEkzvfoo0pPbgavDdheu9zEAGTfYMOr++pdEZ8FJT2a
 GUIHmnLIG0b4sM+g75qSRFIYXR92+CH3di2RmMnbYQwbeMDWjiTJQNqHLQNoX/JW4X00c+aCHBXE9
 jEuUpZ1eqN+/Sv58z1o4F12kyA5cJWEBschiKH+KMORTrJL3grIszONUgWruCFC2j2Krx0Juea3Cn
 MpIGNdMWV6OwcsK511MWlP+GEN55mNXNb7wROqp6s=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pCHlz-00083Z-5F; Mon, 02 Jan 2023 10:10:31 +0000
Message-ID: <004c686f-b5ed-be4f-087d-2736bedd57b9@ilande.co.uk>
Date: Mon, 2 Jan 2023 10:10:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
 <20230101144339.60307-3-mark.cave-ayland@ilande.co.uk>
 <0e418e12-2738-133e-e212-7c7dbbc241c8@vivier.eu>
 <8d716112-ea5b-d294-55bd-61798f12648b@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <8d716112-ea5b-d294-55bd-61798f12648b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/4] target/m68k: pass sign directly into make_quotient()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.802,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 01/01/2023 18:53, Richard Henderson wrote:

> On 1/1/23 09:26, Laurent Vivier wrote:
>> Le 01/01/2023 à 15:43, Mark Cave-Ayland a écrit :
>>> This enables the quotient parameter to be changed from int32_t to uint32_t and
>>> also allows the extra sign logic in make_quotient() to be removed.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   target/m68k/fpu_helper.c | 15 +++++----------
>>>   1 file changed, 5 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
>>> index 0932c464fd..ae839785fa 100644
>>> --- a/target/m68k/fpu_helper.c
>>> +++ b/target/m68k/fpu_helper.c
>>> @@ -515,15 +515,8 @@ uint32_t HELPER(fmovemd_ld_postinc)(CPUM68KState *env, 
>>> uint32_t addr,
>>>       return fmovem_postinc(env, addr, mask, cpu_ld_float64_ra);
>>>   }
>>> -static void make_quotient(CPUM68KState *env, int32_t quotient)
>>> +static void make_quotient(CPUM68KState *env, int sign, uint32_t quotient)
>>>   {
>>> -    int sign;
>>> -
>>> -    sign = quotient < 0;
>>> -    if (sign) {
>>> -        quotient = -quotient;
>>> -    }
>>> -
>>>       quotient = (sign << 7) | (quotient & 0x7f);
>>>       env->fpsr = (env->fpsr & ~FPSR_QT_MASK) | (quotient << FPSR_QT_SHIFT);
>>>   }
>>> @@ -536,7 +529,8 @@ void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, 
>>> FPReg *val1)
>>>           return;
>>>       }
>>> -    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
>>> +    make_quotient(env, extractFloatx80Sign(res->d),
>>> +                  floatx80_to_int32(res->d, &env->fp_status));
>>>   }
>>>   void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
>>> @@ -547,7 +541,8 @@ void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, 
>>> FPReg *val1)
>>>           return;
>>>       }
>>> -    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
>>> +    make_quotient(env, extractFloatx80Sign(res->d),
>>> +                  floatx80_to_int32(res->d, &env->fp_status));
>>>   }
>>>   void HELPER(fgetexp)(CPUM68KState *env, FPReg *res, FPReg *val)
>>
>> I think you need an "abs(floatx80_to_int32())" in both cases as you do in PATCH 4
> 
> Or in fact
> 
>      sign = extractFloatx80Sign(res);
>      quot = floatx80_to_int32(floatx80_abs(res->d), status);
>      make_quotient(env, sign, quot);

Thanks for the suggestion. Just out of curiosity, how does moving the abs to before 
the integer conversion make a difference here? Is it because floatx80_to_int32() can 
fail in some circumstances because of the sign of the result?


ATB,

Mark.


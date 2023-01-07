Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4E9661278
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 00:02:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEIBW-0002TA-Fa; Sat, 07 Jan 2023 18:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEIBT-0002Ry-G0
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 18:01:03 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEIBQ-0002cp-8O
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 18:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yhCzQNxWYzG72mzaQ5XkqJhGIaoYmf/DjK4bts7DL5c=; b=EJ8MFmosdpyOcEU9sxct9CRUYg
 sCBqt2Cz/o0K7CnjUpw70KR9PlAjVDLpgt6G9ukwZBvdOnSEwI6loFhuKipEYpW1clhPTfkX60Noi
 Rp4Scd7JEJPj2Jo49e0HfXbv//wAQU0ufEkJtREKV4NUn+KhlWFdOz5OYe4ZgJWpEOOYH2i0KRiT2
 f4I1ZYieHBV0DZOhVWJGErLAvgfSMjyLLjKk+bt7vuEmeqpGniWntU5MxwjbLcPfki2VSD3+mKteA
 phRWxbz4D/SFZ/K1gbH+Hhuimrf61neStXeGLX1u3/6OUxC01CxxEnv/24oT4WwJYP9ZpEHIvndPu
 49Q8r3pcYe+3IuoxKOQF8GzugQJzgWcaOBfsoNrB3Wh2CWzA1RmLl7qSYthOCS65PAKmqevomD23X
 3HKakk6dqgelO6Dn3InyIZEP2qAkNTfWF4UBbppI0ssIgRkI4ze5W9ss8KUZPLDXkxk3AjTPs227z
 5U+7QmO/tjgFkC1x/Zj6FEgMEGwOARjd3PCmyhPi/Q5ZmEXUqM8R3n/ZkVwXsOCS/0CeBzN/MetLq
 vg3ccNFpSbZzuWaf1slieODAbrce4FhhR96xkW8TOHao1JsNCtV6nkFm4SIMar6DXU23lRXSVt/dQ
 x1mcn0JO0Eh47bRs6NKJSsaNCi3kYMF4p7BD0IUMU=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEIAx-000B9J-Mg; Sat, 07 Jan 2023 23:00:35 +0000
Message-ID: <312b1b75-e74e-c107-ec98-c05476e9125a@ilande.co.uk>
Date: Sat, 7 Jan 2023 23:00:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, laurent@vivier.eu,
 qemu-devel@nongnu.org
References: <20230104134554.138012-1-mark.cave-ayland@ilande.co.uk>
 <20230104134554.138012-5-mark.cave-ayland@ilande.co.uk>
 <51da8243-885d-a98e-deb6-746383da1d7d@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <51da8243-885d-a98e-deb6-746383da1d7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 4/4] target/m68k: fix FPSR quotient byte for frem
 instruction
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.114,
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

On 04/01/2023 18:04, Richard Henderson wrote:

> On 1/4/23 05:45, Mark Cave-Ayland wrote:
>> The FPSR quotient byte should be set to the value of the quotient and not the
>> result. Manually calculate the quotient in the frem helper in round to nearest
>> even mode (note this is different from the quotient calculated internally for
>> fmod), and use it to set the quotient byte accordingly.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1314
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>   target/m68k/fpu_helper.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
>> index 5fd094a33c..56f7400140 100644
>> --- a/target/m68k/fpu_helper.c
>> +++ b/target/m68k/fpu_helper.c
>> @@ -538,17 +538,25 @@ void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, 
>> FPReg *val1)
>>   void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
>>   {
>> +    float_status fp_status;
>> +    FPReg fp_quot;
>>       uint32_t quotient;
>>       int sign;
>> +    /* Calculate quotient directly using round to nearest mode */
>> +    set_float_rounding_mode(float_round_nearest_even, &fp_status);
>> +    set_floatx80_rounding_precision(
>> +        get_floatx80_rounding_precision(&env->fp_status), &fp_status);
>> +    fp_quot.d = floatx80_div(val1->d, val0->d, &fp_status);
>> +
>>       res->d = floatx80_rem(val1->d, val0->d, &env->fp_status);
>> -    if (floatx80_is_any_nan(res->d)) {
>> +    if (floatx80_is_any_nan(fp_quot.d)) {
> 
> I think you should leave this line unchanged, and move the div afterward.
> I also think you should completely initialize the local fp_status = { }.
> 
> With that,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I can leave the floatx80_is_any_nan() line above unchanged and also initialise the 
local fp_status, however the floatx80_div() has to happen before floatx80_rem() 
function is called. This is because the fmod and frem instructions write the result 
back to one of the input registers, which then causes the subsequent floatx80_div() 
to return an incorrect result.

Would just these 2 changes be enough to keep your R-B tag for a v3?


ATB,

Mark.


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC9765AB0A
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 19:55:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pC3Sj-0004ke-DF; Sun, 01 Jan 2023 13:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pC3Sg-0004kO-D7
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 13:53:34 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pC3Se-0005rN-Dm
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 13:53:34 -0500
Received: by mail-pl1-x631.google.com with SMTP id m4so27297365pls.4
 for <qemu-devel@nongnu.org>; Sun, 01 Jan 2023 10:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ii74BP6RbrdleJJdELdb38eQcLR4Kkbk6+4Bf2ZsBNs=;
 b=aeQPCySAjtVNGX3sZ+6d0FTWs6O88srOzkA0aJi0pUOq9sfMHwnvbGftdbQ4PERE/q
 sp8GRoHr7lJceqsBwnwzGqXiZHwgNs7dLcRP+0dmsJITnPoEyOjuHxC5BmJgtPyqWkrw
 8mOn2YnT0xa+tYkC23P4Brp7CqZwv3gC9EMgxG09ZKl9W6tsFVbQh0eI1I6GWXUEeYAu
 kpG8BRCnzNZpT4LfpvBFPMOMWXvnaKyWB7J6Ei20tLrdyPrbwshlwSb4FAsePYeY/tqX
 6BpyVxxMw1JEOwVGj1fhUB2dRCvZlNRC69Dct67B4cfCOXjQTIW+Se8zaqe5erSvBL7V
 mgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ii74BP6RbrdleJJdELdb38eQcLR4Kkbk6+4Bf2ZsBNs=;
 b=u29spQ9ipP3M6fkWqIIAa0dCpWFVq14+z/yGgJSsUgHGIYo19VjyWoePwHgKmA/2om
 QrfBkIujA1dZOTSzu5+009GZt7aNrxHFPxxZXdgp/kiCRz0kG9Q+rP3cDm3nRQ5bIeab
 HQvX+nWFilXmV8GCyaZ7aR2xIIGBAcNkJKxzkx+rxwZGqVDF5XdavCQpt/8PgSLTAsvB
 9h/rxdqCAZCo/98knbD4asyV6DZOk7CSQlukhoqwrIgwdNOOyFd2iP8QCJv+apy+KskD
 CYbWPAfOFIS0VX9EZ6I6Y/i9avNEMpcPud5jPG4pn3sHTeLD836g5s5FWW/CohYc8khB
 OVjw==
X-Gm-Message-State: AFqh2kq/0UeDWkqk6v59JDlO3W2dQuUzrEsC6MgK6lH7ZGigfokCjHKq
 5Ia0OXJflxLxagQRUm+Y0Ke+Lw==
X-Google-Smtp-Source: AMrXdXvLunfIWdS0xXD4DXVMmUiXFnxR0nY6qopRIpx+mM8kC741NofQ+wRLAqtgU2c7QE3A7Zir2A==
X-Received: by 2002:a17:90a:7e8c:b0:226:164d:a19a with SMTP id
 j12-20020a17090a7e8c00b00226164da19amr17466984pjl.49.1672599201027; 
 Sun, 01 Jan 2023 10:53:21 -0800 (PST)
Received: from ?IPV6:2601:1c0:5e81:b50:2c4:da40:1bc7:f418?
 ([2601:1c0:5e81:b50:2c4:da40:1bc7:f418])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a17090a6d0300b00225daca646csm12978713pjj.34.2023.01.01.10.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Jan 2023 10:53:20 -0800 (PST)
Message-ID: <8d716112-ea5b-d294-55bd-61798f12648b@linaro.org>
Date: Sun, 1 Jan 2023 10:53:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] target/m68k: pass sign directly into make_quotient()
To: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
 <20230101144339.60307-3-mark.cave-ayland@ilande.co.uk>
 <0e418e12-2738-133e-e212-7c7dbbc241c8@vivier.eu>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <0e418e12-2738-133e-e212-7c7dbbc241c8@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.802,
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

On 1/1/23 09:26, Laurent Vivier wrote:
> Le 01/01/2023 à 15:43, Mark Cave-Ayland a écrit :
>> This enables the quotient parameter to be changed from int32_t to uint32_t and
>> also allows the extra sign logic in make_quotient() to be removed.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   target/m68k/fpu_helper.c | 15 +++++----------
>>   1 file changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
>> index 0932c464fd..ae839785fa 100644
>> --- a/target/m68k/fpu_helper.c
>> +++ b/target/m68k/fpu_helper.c
>> @@ -515,15 +515,8 @@ uint32_t HELPER(fmovemd_ld_postinc)(CPUM68KState *env, uint32_t addr,
>>       return fmovem_postinc(env, addr, mask, cpu_ld_float64_ra);
>>   }
>> -static void make_quotient(CPUM68KState *env, int32_t quotient)
>> +static void make_quotient(CPUM68KState *env, int sign, uint32_t quotient)
>>   {
>> -    int sign;
>> -
>> -    sign = quotient < 0;
>> -    if (sign) {
>> -        quotient = -quotient;
>> -    }
>> -
>>       quotient = (sign << 7) | (quotient & 0x7f);
>>       env->fpsr = (env->fpsr & ~FPSR_QT_MASK) | (quotient << FPSR_QT_SHIFT);
>>   }
>> @@ -536,7 +529,8 @@ void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg 
>> *val1)
>>           return;
>>       }
>> -    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
>> +    make_quotient(env, extractFloatx80Sign(res->d),
>> +                  floatx80_to_int32(res->d, &env->fp_status));
>>   }
>>   void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
>> @@ -547,7 +541,8 @@ void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg 
>> *val1)
>>           return;
>>       }
>> -    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
>> +    make_quotient(env, extractFloatx80Sign(res->d),
>> +                  floatx80_to_int32(res->d, &env->fp_status));
>>   }
>>   void HELPER(fgetexp)(CPUM68KState *env, FPReg *res, FPReg *val)
> 
> I think you need an "abs(floatx80_to_int32())" in both cases as you do in PATCH 4

Or in fact

     sign = extractFloatx80Sign(res);
     quot = floatx80_to_int32(floatx80_abs(res->d), status);
     make_quotient(env, sign, quot);


r~


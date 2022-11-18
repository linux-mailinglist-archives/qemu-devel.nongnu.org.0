Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637B962F2B3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 11:37:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovyj4-0004yX-Ol; Fri, 18 Nov 2022 05:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovyim-0004y7-6P
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 05:35:44 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovyic-0001oE-3Z
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 05:35:40 -0500
Received: by mail-pl1-x631.google.com with SMTP id p12so4200971plq.4
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 02:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C2ZdR4Kaz0OPb4haBCpP0iFg/uxapzFZONCF2mjcQmQ=;
 b=zYIhwpRUEi5vUDgEO5iPW/QAWk/+CQowI8aaXRKGpAadvBb8f0OcmHA/QAH4XaAa/t
 Ka7O0Dye0Obult9Xo2nKePqtpeJBJVp1cKWe4j7yzuV46/6m2BGNA0z3jhgODDtwYKC9
 A0wu1nGDBFJgRWmvv7GEwjQbcFz7Ckb3BLrdYg3b+qIIlxO6DjkRqj7voNevm4wiSIEh
 rRJJ/UjMLDoQoM/ZIeVQSLU0RwJZba/ChnfjxCcJPotsBikuDyhrpyJEIDwCi+HMExeJ
 8QKbfKKqxVsAvzdhijgwHyIPxUJylfNFLydtnw7vCF8J07pNdhkDzVc5OkJxlJW9YvsO
 cDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C2ZdR4Kaz0OPb4haBCpP0iFg/uxapzFZONCF2mjcQmQ=;
 b=Ee1OeYXiO829+J9SHbRiycpfy6+jz/nTofYXw/Fc1W4Lip1geJybBSOEE0vdm9RYw1
 iiBtD5t3UVAadqXcgSR7IAdT9c7Fct2d7mxcLKJwzy6pkwwEBlI3T7hQxcMgFXB6QgUU
 /fZWFthiinQjiu/0MgJ3iWTe/Q/T2phh0vEc06wzljf/LOY/IZZEy5VCnDV3nFnfFa3u
 jGhqsDDSOy2TeAxhrEUQItueoAg0IzTj/FvISXxWHL9SZduBt1rTNIzXA7eLSaW6kdBe
 mU7C6RX1yg9zUMCm5Rc13EtNC6z4zLlnBrj6Wn2W2SqqvUmT66G2hy3Vf0DfjSYslwjo
 Nrhg==
X-Gm-Message-State: ANoB5pnlMnPWUHHTZ2KgzvwVk96pUt3Tq7JbTZyEK8nvUEBaLGT6Tnq7
 ieNxSkeZYbnFhTNROX/5CcXMkg==
X-Google-Smtp-Source: AA0mqf4pbIK/GSMzMOJ1e8WjZNjlP6iAlce8uFw97WP0LcfUT55Ut5wCX4bQk7iUZdeKwTYBQctKpg==
X-Received: by 2002:a17:90a:b382:b0:213:1fcb:3ce1 with SMTP id
 e2-20020a17090ab38200b002131fcb3ce1mr7100965pjr.58.1668767732323; 
 Fri, 18 Nov 2022 02:35:32 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:90b2:345f:bf0a:c412?
 ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a170902e84200b00185507b5ef8sm3313421plg.50.2022.11.18.02.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 02:35:31 -0800 (PST)
Message-ID: <dda2786a-cbd9-b323-e389-04dd2dd02771@linaro.org>
Date: Fri, 18 Nov 2022 02:35:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 4/7] target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 cpu_interrupt_exittb
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-5-richard.henderson@linaro.org>
 <ad98f01d-2db3-b119-dd9a-6b52f9b2f6ee@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ad98f01d-2db3-b119-dd9a-6b52f9b2f6ee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/18/22 02:13, Daniel Henrique Barboza wrote:
> 
> 
> On 11/18/22 06:18, Richard Henderson wrote:
>> In addition, use tcg_enabled instead of !kvm_enabled.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
> Should we strive for this change (tcg_enabled instead of !kvm_enabled)
> everywhere when applicable? There's a lot of places in the ppc code where
> this can be done.

I think it's better style, since that's generally what is meant.

It's important when the target supports multiple accelerators.  A test for !kvm begs the 
question of why we aren't also testing for e.g. !hvf.  I've noticed a couple of these in 
the code base.


r~

> 
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> 
>> Cc: qemu-ppc@nongnu.org
>> ---
>>   target/ppc/helper_regs.c | 14 ++++----------
>>   1 file changed, 4 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
>> index c0aee5855b..779e7db513 100644
>> --- a/target/ppc/helper_regs.c
>> +++ b/target/ppc/helper_regs.c
>> @@ -22,6 +22,7 @@
>>   #include "qemu/main-loop.h"
>>   #include "exec/exec-all.h"
>>   #include "sysemu/kvm.h"
>> +#include "sysemu/tcg.h"
>>   #include "helper_regs.h"
>>   #include "power8-pmu.h"
>>   #include "cpu-models.h"
>> @@ -203,17 +204,10 @@ void cpu_interrupt_exittb(CPUState *cs)
>>   {
>>       /*
>>        * We don't need to worry about translation blocks
>> -     * when running with KVM.
>> +     * unless running with TCG.
>>        */
>> -    if (kvm_enabled()) {
>> -        return;
>> -    }
>> -
>> -    if (!qemu_mutex_iothread_locked()) {
>> -        qemu_mutex_lock_iothread();
>> -        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
>> -        qemu_mutex_unlock_iothread();
>> -    } else {
>> +    if (tcg_enabled()) {
>> +        QEMU_IOTHREAD_LOCK_GUARD();
>>           cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
>>       }
>>   }



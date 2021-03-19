Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5803426EC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 21:31:30 +0100 (CET)
Received: from localhost ([::1]:60166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNLmL-0004a8-J9
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 16:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNLfq-00065v-Iw
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 16:24:46 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:38457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNLfl-0001ld-Lx
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 16:24:46 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so9729939otk.5
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 13:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E6ky6tK1daP3TetAERWckLy+AlZziuPEx2vt1lKxAks=;
 b=T68jS8lSXcXyOaOztwOdgHYO7F9U8waSr2c/hKqbem24Tsmn4FUcA9VJkM2fzm3oR9
 CEw2+qzWdmlVwiFNSpIR0u87bM8VAVf5nuk/zq1imG2g1eBvliocmnXAfupD+GSyuDJg
 T5k7YBv4Z4PlfZKBS7POpE+htpqg6Ph38O8jnpZ5W2ZQ4gHc9RIp0HTPgRQlw82w7Mfq
 jOycQCuuVXMPjBE4UWrFk3FQru6ZMJzlPJTEyLnkmjYtDYWECPbZJOvkLyRkIEryFzS6
 FysmGRf5VmXlh3p+R/MBeiFYJPbBI3iHvkUqNWwUz5NAf3lZTWBiJaf7xpdisVFIbww+
 vAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E6ky6tK1daP3TetAERWckLy+AlZziuPEx2vt1lKxAks=;
 b=BVA7ykLtjj6oc0XIsAM84/ypGyUmpX5X33utxcZcnYSrmTyAnSlbdcXjFd9VKGoEUB
 eN2jvJNmnwSOwdRCx47zBAdHZmTuVFy/ceYs+fm/z8SOspByjOS9PQneJZ1n8/v36qhz
 +xHuImvzx6FTg4eq0uabXmXwKPDc4DISOCYCugLBqNlYwG5iOrX8diXfg2H4BWmLperO
 XCEjzbRoUzmyx4AAho2ijh2bAq6nemeYppfxikeSt2/fylXV+aW9rk4iFWJA+ulx90JW
 bQo5TCvSwXGJ43y/KTwam7A8t1GVo0kHU1k2F18rDs6nkqvQ6YSha9yVBdgUUcD7Z6+Q
 dW3g==
X-Gm-Message-State: AOAM531TzklqKz8ohho0mzeVA3r8YTzyLz7Sg1MA/KUIxamLtO0kqENq
 dzgrrQ0v8rQpeZ7uSp6updAJ5bNjDm/yM9AN
X-Google-Smtp-Source: ABdhPJwDetrmQn+SNwsh+4o6VQ1HYA5MQgfHlAGVXHajlu4mnA8RhQ4yGJ5JkpgyhZa27nz1jT+gQQ==
X-Received: by 2002:a05:6830:1e51:: with SMTP id
 e17mr2433907otj.292.1616185479835; 
 Fri, 19 Mar 2021 13:24:39 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z6sm1463608otq.48.2021.03.19.13.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 13:24:39 -0700 (PDT)
Subject: Re: [PULL 26/40] linux-user/aarch64: Pass syndrome to EXC_*_ABORT
To: Laurent Vivier <laurent@vivier.eu>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
 <20210216161658.29881-27-peter.maydell@linaro.org>
 <f484737b-8dc1-fc16-06a5-753500104bf0@vivier.eu>
 <d7e3c7d3-e21e-8549-70a2-e6997e95b4f7@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57cb906c-7540-f568-b458-b8952fb0fb7d@linaro.org>
Date: Fri, 19 Mar 2021 14:24:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d7e3c7d3-e21e-8549-70a2-e6997e95b4f7@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 1:19 PM, Laurent Vivier wrote:
> Richard,
> 
> do you have any idea how to fix this problem?

Oops, started building ltp, then forgot about it.  Looking now.


r~

> 
> Thanks,
> Laurent
> 
> Le 12/03/2021 à 12:09, Laurent Vivier a écrit :
>> Hi,
>>
>> On 16/02/2021 17:16, Peter Maydell wrote:
>>> From: Richard Henderson <richard.henderson@linaro.org>
>>>
>>> A proper syndrome is required to fill in the proper si_code.
>>> Use page_get_flags to determine permission vs translation for user-only.
>>>
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> Message-id: 20210212184902.1251044-27-richard.henderson@linaro.org
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>   linux-user/aarch64/cpu_loop.c | 24 +++++++++++++++++++++---
>>>   target/arm/tlb_helper.c       | 15 +++++++++------
>>>   2 files changed, 30 insertions(+), 9 deletions(-)
>>
>> While I was testing my next linux-user pull request I found this patch breaks something.
>>
>> Following LTP tests are broken:
>>
>> mmap05
>> mprotect02
>> mprotect03
>> mprotect04
>> shmat01
>>
>> with arm64/sid, arm64/trusty, arm64/bionic
>>
>> Bisecting only using mmap05 test I find this patch.
>>
>> Symptoms are:
>>
>> $ sudo unshare --time --ipc --uts --pid --fork --kill-child --mount --mount-proc --root
>> chroot/arm64/sid /opt/ltp/testcases/bin/mmap05
>> **
>> ERROR:../../../Projects/qemu/linux-user/aarch64/cpu_loop.c:141:cpu_loop: code should not
>> be reached
>> Bail out! ERROR:../../../Projects/qemu/linux-user/aarch64/cpu_loop.c:141:cpu_loop: code
>> should not be reached
>> qemu:handle_cpu_signal received signal outside vCPU context @ pc=0x7f45c1cd9706
>>
>> Expected result is:
>>
>> mmap05      1  TPASS  :  Got SIGSEGV as expected
>>
>> Thanks,
>> Laurent
>>
>>>
>>> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
>>> index 42b9c15f536..4e43906e66a 100644
>>> --- a/linux-user/aarch64/cpu_loop.c
>>> +++ b/linux-user/aarch64/cpu_loop.c
>>> @@ -23,6 +23,7 @@
>>>   #include "cpu_loop-common.h"
>>>   #include "qemu/guest-random.h"
>>>   #include "hw/semihosting/common-semi.h"
>>> +#include "target/arm/syndrome.h"
>>>   
>>>   #define get_user_code_u32(x, gaddr, env)                \
>>>       ({ abi_long __r = get_user_u32((x), (gaddr));       \
>>> @@ -76,7 +77,7 @@
>>>   void cpu_loop(CPUARMState *env)
>>>   {
>>>       CPUState *cs = env_cpu(env);
>>> -    int trapnr;
>>> +    int trapnr, ec, fsc;
>>>       abi_long ret;
>>>       target_siginfo_t info;
>>>   
>>> @@ -117,9 +118,26 @@ void cpu_loop(CPUARMState *env)
>>>           case EXCP_DATA_ABORT:
>>>               info.si_signo = TARGET_SIGSEGV;
>>>               info.si_errno = 0;
>>> -            /* XXX: check env->error_code */
>>> -            info.si_code = TARGET_SEGV_MAPERR;
>>>               info._sifields._sigfault._addr = env->exception.vaddress;
>>> +
>>> +            /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
>>> +            ec = syn_get_ec(env->exception.syndrome);
>>> +            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
>>> +
>>> +            /* Both EC have the same format for FSC, or close enough. */
>>> +            fsc = extract32(env->exception.syndrome, 0, 6);
>>> +            switch (fsc) {
>>> +            case 0x04 ... 0x07: /* Translation fault, level {0-3} */
>>> +                info.si_code = TARGET_SEGV_MAPERR;
>>> +                break;
>>> +            case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
>>> +            case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
>>> +                info.si_code = TARGET_SEGV_ACCERR;
>>> +                break;
>>> +            default:
>>> +                g_assert_not_reached();
>>> +            }
>>> +
>>>               queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>>>               break;
>>>           case EXCP_DEBUG:
>>> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
>>> index df85079d9f0..9609333cbdf 100644
>>> --- a/target/arm/tlb_helper.c
>>> +++ b/target/arm/tlb_helper.c
>>> @@ -154,21 +154,24 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>>                         bool probe, uintptr_t retaddr)
>>>   {
>>>       ARMCPU *cpu = ARM_CPU(cs);
>>> +    ARMMMUFaultInfo fi = {};
>>>   
>>>   #ifdef CONFIG_USER_ONLY
>>> -    cpu->env.exception.vaddress = address;
>>> -    if (access_type == MMU_INST_FETCH) {
>>> -        cs->exception_index = EXCP_PREFETCH_ABORT;
>>> +    int flags = page_get_flags(useronly_clean_ptr(address));
>>> +    if (flags & PAGE_VALID) {
>>> +        fi.type = ARMFault_Permission;
>>>       } else {
>>> -        cs->exception_index = EXCP_DATA_ABORT;
>>> +        fi.type = ARMFault_Translation;
>>>       }
>>> -    cpu_loop_exit_restore(cs, retaddr);
>>> +
>>> +    /* now we have a real cpu fault */
>>> +    cpu_restore_state(cs, retaddr, true);
>>> +    arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
>>>   #else
>>>       hwaddr phys_addr;
>>>       target_ulong page_size;
>>>       int prot, ret;
>>>       MemTxAttrs attrs = {};
>>> -    ARMMMUFaultInfo fi = {};
>>>       ARMCacheAttrs cacheattrs = {};
>>>   
>>>       /*
>>>
>>
>>
> 



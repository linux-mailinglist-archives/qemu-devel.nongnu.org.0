Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7FA3DAB63
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 20:53:09 +0200 (CEST)
Received: from localhost ([::1]:45072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9B9Y-0006Jb-1Z
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 14:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9B8Y-0005R4-WF
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 14:52:07 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9B8W-00042n-KF
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 14:52:06 -0400
Received: by mail-pl1-x634.google.com with SMTP id e5so8043353pld.6
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 11:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+DxOKe3/E6gEKl5nvpUDjx9yDlNFjtyvBIpuMhRbKbI=;
 b=p2NcOG6H8/k4RGFtygz1iz1S9fMtsyw0AP5A86EXBos+ghppia7I1yQP5O+xu7wLNA
 k7KkpN6VJ13O+QhhOyxDYyU5p/vFVOYhmKehmJdRReqy3gQPY2MxwcXWBDPTJXHRIrWC
 lo27UwtxFnsutiEfHGuDYCgUN/iJ0m67F/ceAzNAC+tbbWgATFxtewlP6BwjHGZafeL4
 Kw6+86wpOSEvBWrLQ1hO3rbgj8A4EzrRW1AEhCfgpk8Su09uxu0xk5KPB9KZBq7xluTQ
 rpqvmcx31723NoXCyyJFUumtCZmR3wQJNBqWTxxx3JS14rYnMnxEsmIp9xWoQMEUxPyp
 BHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+DxOKe3/E6gEKl5nvpUDjx9yDlNFjtyvBIpuMhRbKbI=;
 b=CbpFBsY1mNlOhmjG1JLg0+/4TjgddZtMB6U6MNgIg+7j0q3tzJLEZ0lLLaHcuUIDZs
 Oy+NGuUYK3gHhR5F7yBQ1eiN3WUxL+ZRl9dYeewGIgE5bKnZwsHnfjwpraDb6Knlc1GJ
 gJnpwHzsgEbqOq94xEui7CKglWJR1mkNPkvEAB6VAJlrcVdPx6oRhmrVGzLGGmdV83Fo
 tzdcoz0VMRi4XIaRFTYHQ/F6kdOilQ2D07yrBFeuC6BledcCV9VVv+Kv+vOaSC8IrUBy
 PARclh81TblaQKjyX+5LiZwrSJi8yDhbPo66NhIawiRzy5oD/Bg9DL6dChxRrMBAU411
 YiFA==
X-Gm-Message-State: AOAM532Mp3mH0xVEctEu17o+7TBiHZQEl916wO4XaSOwFRkku2y6Iz4f
 djhaU/apO69hrrOsmfgdk7jz5A==
X-Google-Smtp-Source: ABdhPJztPKKvKy6QvTNV+VY4Kg7OsXPCsBA8ErDJ3Wsb0vwcpC34KooMZvu+1QztA9YbSj4ylUDWrw==
X-Received: by 2002:aa7:8185:0:b029:3aa:29a2:39d3 with SMTP id
 g5-20020aa781850000b02903aa29a239d3mr2702483pfi.28.1627584722967; 
 Thu, 29 Jul 2021 11:52:02 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id d2sm401952pjs.28.2021.07.29.11.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 11:52:02 -0700 (PDT)
Subject: Re: [PATCH for-6.2 03/43] target/arm: Implement do_unaligned_access
 for user-only
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-4-richard.henderson@linaro.org>
 <CAFEAcA9ZZK2FhCptvypviDOoC-SQkP1rfANrPWZJH1F99GV87Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38180886-99b6-af82-1b95-ba0d250d06f5@linaro.org>
Date: Thu, 29 Jul 2021 08:51:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ZZK2FhCptvypviDOoC-SQkP1rfANrPWZJH1F99GV87Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 3:14 AM, Peter Maydell wrote:
> On Thu, 29 Jul 2021 at 01:47, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/aarch64/cpu_loop.c |  4 ++++
>>   linux-user/arm/cpu_loop.c     | 43 +++++++++++++++++++++++++++--------
>>   target/arm/cpu.c              |  2 +-
>>   target/arm/cpu_tcg.c          |  2 +-
>>   4 files changed, 40 insertions(+), 11 deletions(-)
>>
>> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
>> index ee72a1c20f..998831f87f 100644
>> --- a/linux-user/aarch64/cpu_loop.c
>> +++ b/linux-user/aarch64/cpu_loop.c
>> @@ -137,6 +137,10 @@ void cpu_loop(CPUARMState *env)
>>               case 0x11: /* Synchronous Tag Check Fault */
>>                   info.si_code = TARGET_SEGV_MTESERR;
>>                   break;
>> +            case 0x21: /* Alignment fault */
>> +                info.si_signo = TARGET_SIGBUS;
>> +                info.si_code = TARGET_BUS_ADRALN;
>> +                break;
>>               default:
>>                   g_assert_not_reached();
>>               }
>> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
>> index 69632d15be..da7da6a0c1 100644
>> --- a/linux-user/arm/cpu_loop.c
>> +++ b/linux-user/arm/cpu_loop.c
>> @@ -23,6 +23,7 @@
>>   #include "elf.h"
>>   #include "cpu_loop-common.h"
>>   #include "semihosting/common-semi.h"
>> +#include "target/arm/syndrome.h"
> 
> Not a huge fan of linux-user files pulling in target/arm headers, but
> I guess we do it already in aarch64/cpu_loop.c. (Though that is afaict
> the only other place ATM...)
> 
>>
>>   #define get_user_code_u32(x, gaddr, env)                \
>>       ({ abi_long __r = get_user_u32((x), (gaddr));       \
>> @@ -286,9 +287,8 @@ void cpu_loop(CPUARMState *env)
>>   {
>>       CPUState *cs = env_cpu(env);
>>       int trapnr;
>> -    unsigned int n, insn;
>> +    unsigned int n, insn, ec, fsc;
>>       target_siginfo_t info;
>> -    uint32_t addr;
>>       abi_ulong ret;
>>
>>       for(;;) {
>> @@ -437,15 +437,40 @@ void cpu_loop(CPUARMState *env)
>>               break;
>>           case EXCP_PREFETCH_ABORT:
>>           case EXCP_DATA_ABORT:
>> -            addr = env->exception.vaddress;
>> -            {
>> -                info.si_signo = TARGET_SIGSEGV;
>> -                info.si_errno = 0;
>> -                /* XXX: check env->error_code */
>> +            info.si_signo = TARGET_SIGSEGV;
>> +            info.si_errno = 0;
>> +            info._sifields._sigfault._addr = env->exception.vaddress;
>> +            /*
>> +             * We should only arrive here with EC in {DATAABORT, INSNABORT},
>> +             * and short-form FSC, which then tells us to look at the FSR.
>> +             * ??? arm_cpu_reset never sets TTBCR_EAE, so we always get
>> +             * short-form FSC.
>> +             */
>> +            ec = syn_get_ec(env->exception.syndrome);
>> +            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
>> +            fsc = extract32(env->exception.syndrome, 0, 6);
>> +            assert(fsc == 0x3f);
>> +            switch (env->exception.fsr & 0x1f) {
>> +            case 0x1: /* Alignment */
>> +                info.si_signo = TARGET_SIGBUS;
>> +                info.si_code = TARGET_BUS_ADRALN;
>> +                break;
>> +            case 0x3: /* Access flag fault, level 1 */
>> +            case 0x6: /* Access flag fault, level 2 */
>> +            case 0x9: /* Domain fault, level 1 */
>> +            case 0xb: /* Domain fault, level 2 */
>> +            case 0xd: /* Permision fault, level 1 */
>> +            case 0xf: /* Permision fault, level 2 */
>> +                info.si_code = TARGET_SEGV_ACCERR;
>> +                break;
>> +            case 0x5: /* Translation fault, level 1 */
>> +            case 0x7: /* Translation fault, level 2 */
>>                   info.si_code = TARGET_SEGV_MAPERR;
>> -                info._sifields._sigfault._addr = addr;
>> -                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>> +                break;
>> +            default:
>> +                g_assert_not_reached();
>>               }
>> +            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>>               break;
> 
> It's slightly sad that we start off with a nicely symbolic
> ArmMMUFaultInfo type enum value, carefully encode it into a
> numeric value and then have to switch on the numeric value here,
> but I can see why we end up this way...

We don't have to leave it that way.

We could move the ARMMMUFaultInfo out of internals.h, create special user-only copies of 
arm_cpu_tlb_fill and arm_cpu_do_unaligned_access, create a new function to raise the MTE 
exception, and place the proper enumeraor into env->error_code instead of the hw syndrome.

What we have seemed cleaner on the target/arm/ side at the time.


r~


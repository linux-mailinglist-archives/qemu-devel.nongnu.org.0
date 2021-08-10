Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33953E84E7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 23:03:48 +0200 (CEST)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDYuZ-00075c-Ag
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 17:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDYtd-000682-3Y; Tue, 10 Aug 2021 17:02:49 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:56196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDYtb-0003fy-2f; Tue, 10 Aug 2021 17:02:48 -0400
Received: by mail-pj1-x1035.google.com with SMTP id w14so4393580pjh.5;
 Tue, 10 Aug 2021 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z7CpASAbeHN25srdkhEMxbH1TEGqECdfG4thBn+8zr8=;
 b=QGwj1H81kHZ0Kk9ar05n0zUNxBYlBcx4jbNmuA69r8JvUuzgdCqy14KxXcjd5xO1+k
 5qkg5ttWHQxIyEJukqn6j+xGx3BfvSlPW42+wqEJ5dJYcEeeaWo0heNyb7wLJcOigCit
 q3+0LmJC1mAKgZxQWZEgtNBQuYMWJSmGImEpjTdvOYBbCIWCUZhv09blm1vqJsAhK01q
 tpaCqUBxCQaiGYAz4jfhTAgAstZiC5LM/wquX2Iy1YD6qd3ffu8Pk+zFbrlQQj48heAA
 9T3SGHs9P5oDWejLS9hSATNc5GjAxPqlU1VFP97ojXR6vTWb9jxXjqreGunld5x60alE
 KEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z7CpASAbeHN25srdkhEMxbH1TEGqECdfG4thBn+8zr8=;
 b=I9mcu7l6FAsGq9NhBn4mjpvPCvYqe/B9iVZBmL2MZME+XPM6/43AwDyiuGGJU5g0G0
 3eIJe4GPGaxBu+1ewy7uqDZ3hZG0FwCniOW9ALejVj7IgmQQCbTFYAVbP0TOi39YtWIM
 9AOWlCeB3tRPZ5rwyloosXBWiqPZ8T4hQ4xK4HlBGK0oiuIkFJfbsaCZ2fttrwcRQ+0O
 VPsl/aYJa5xW+5/+O6TeQSsyj0Rlg4wmdgEnCcPHoGh5yY5gY9oqlM0qNq2KFDKxCQwJ
 JRzvY4w5dkvHb9VXIzPlOmpfPYAxQMwb5p7x+mqJkLca8kySgP/gxC5MV2HLsogEQP4i
 ybYQ==
X-Gm-Message-State: AOAM533E1UY74SZvsbTsea+SANoJno1My9610YceyBQ7O3F337dzagI5
 uDSTd7giLwnLOXZ3K8snZpg=
X-Google-Smtp-Source: ABdhPJzUFsGJWZFs+uS9I1+0I7CGwMi5XEn4e5hzIM8C3oMG1ky10nlpkQ+riuDliRM6820vUF3HVw==
X-Received: by 2002:a17:902:7294:b029:12d:2434:6d26 with SMTP id
 d20-20020a1709027294b029012d24346d26mr2897026pll.59.1628629365184; 
 Tue, 10 Aug 2021 14:02:45 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id 26sm29646079pgx.72.2021.08.10.14.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 14:02:44 -0700 (PDT)
Subject: Re: [PATCH 15/19] target/ppc/pmu_book3s_helper: enable counter
 negative for all PMCs
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-16-danielhb413@gmail.com> <YRH8dz8SLDFWTe1m@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <9fd156de-d882-9a6e-508d-392944a1bf70@gmail.com>
Date: Tue, 10 Aug 2021 18:02:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRH8dz8SLDFWTe1m@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=danielhb413@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/10/21 1:11 AM, David Gibson wrote:
> On Mon, Aug 09, 2021 at 10:10:53AM -0300, Daniel Henrique Barboza wrote:
>> All performance monitor counters can trigger a counter negative
>> condition if the proper MMCR0 bits are set. This patch does that by
>> doing the following:
>>
>> - pmc_counter_negative_enabled() will check whether a given PMC is
>> eligible to trigger the counter negative alert;
>>
>> - get_counter_neg_timeout() will return the timeout for the counter
>> negative condition for a given PMC, or -1 if the PMC is not able to
>> trigger this alert;
>>
>> - the existing counter_negative_cond_enabled() now must consider the
>> counter negative bit for PMCs 2-6, MMCR0_PMCjCE;
>>
>> - set_PMU_excp_timer() will now search all existing PMCs for the
>> shortest counter negative timeout. The shortest timeout will be used to
>> set the PMC interrupt timer.
>>
>> This change makes most EBB powepc kernel tests pass, validating that the
>> existing EBB logic is consistent. There are a few tests that aren't passing
>> due to additional PMU bits and perf events that aren't covered yet.
>> We'll attempt to cover some of those in the next patches.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/cpu.h               |  1 +
>>   target/ppc/pmu_book3s_helper.c | 96 ++++++++++++++++++++++++++++++----
>>   2 files changed, 87 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 5c81d459f4..1aa1fd42af 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -351,6 +351,7 @@ typedef struct ppc_v3_pate_t {
>>   #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
>>   #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
>>   #define MMCR0_PMC1CE PPC_BIT(48)
>> +#define MMCR0_PMCjCE PPC_BIT(49)
>>   
>>   #define MMCR1_PMC1SEL_SHIFT (63 - 39)
>>   #define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
>> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
>> index 7126e9b3d5..c5c5ab38c9 100644
>> --- a/target/ppc/pmu_book3s_helper.c
>> +++ b/target/ppc/pmu_book3s_helper.c
>> @@ -143,22 +143,98 @@ static int64_t get_CYC_timeout(CPUPPCState *env, int sprn)
>>       return muldiv64(remaining_cyc, NANOSECONDS_PER_SECOND, PPC_CPU_FREQ);
>>   }
>>   
>> -static void set_PMU_excp_timer(CPUPPCState *env)
>> +static bool pmc_counter_negative_enabled(CPUPPCState *env, int sprn)
>>   {
>> -    uint64_t timeout, now;
>> +    switch (sprn) {
>> +    case SPR_POWER_PMC1:
>> +        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE;
>>   
>> -    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE)) {
>> -        return;
>> +    case SPR_POWER_PMC2:
>> +    case SPR_POWER_PMC3:
>> +    case SPR_POWER_PMC4:
>> +    case SPR_POWER_PMC5:
>> +    case SPR_POWER_PMC6:
>> +        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
>> +
>> +    default:
>> +        break;
>>       }
>>   
>> -    switch (get_PMC_event(env, SPR_POWER_PMC1)) {
>> -    case 0x2:
>> -        timeout = get_INST_CMPL_timeout(env, SPR_POWER_PMC1);
>> +    return false;
>> +}
>> +
>> +static int64_t get_counter_neg_timeout(CPUPPCState *env, int sprn)
>> +{
>> +    int64_t timeout = -1;
>> +
>> +    if (!pmc_counter_negative_enabled(env, sprn)) {
>> +        return -1;
>> +    }
>> +
>> +    if (env->spr[sprn] >= COUNTER_NEGATIVE_VAL) {
>> +        return 0;
>> +    }
>> +
>> +    switch (sprn) {
>> +    case SPR_POWER_PMC1:
>> +    case SPR_POWER_PMC2:
>> +    case SPR_POWER_PMC3:
>> +    case SPR_POWER_PMC4:
>> +        switch (get_PMC_event(env, sprn)) {
>> +        case 0x2:
>> +            timeout = get_INST_CMPL_timeout(env, sprn);
>> +            break;
>> +        case 0x1E:
>> +            timeout = get_CYC_timeout(env, sprn);
>> +            break;
>> +        }
>> +
>>           break;
>> -    case 0x1e:
>> -        timeout = get_CYC_timeout(env, SPR_POWER_PMC1);
>> +    case SPR_POWER_PMC5:
>> +        timeout = get_INST_CMPL_timeout(env, sprn);
>> +        break;
>> +    case SPR_POWER_PMC6:
>> +        timeout = get_CYC_timeout(env, sprn);
>>           break;
>>       default:
>> +        break;
>> +    }
>> +
>> +    return timeout;
>> +}
>> +
>> +static void set_PMU_excp_timer(CPUPPCState *env)
>> +{
>> +    int64_t timeout = -1;
>> +    uint64_t now;
>> +    int i;
>> +
>> +    /*
>> +     * Scroll through all PMCs and check which one is closer to a
>> +     * counter negative timeout.
> 
> I'm wondering if it would be simpler to use a separate timer for each
> PMC: after all the core timer logic must have already implemented this
> "who fires first" logic.

The first draft had 6 timers, one for each PMC. It would make this step to
determine the lowest timeout unnecessary.

I gave it up because we would need to pause the running timers of the other
PMCs when the PPC_INTERRUPT_PMC happens with MMCR0_FCECE (frozen counters on
Enabled Condition or Event) set. Resuming the timers back would require to
update the PMCs (which would now have different icount_bases).

For our current usage this single timer approach seems less complicated. And
the ISA allows for multiple/concurrent overflows to be reported at the same
alert:

"An enabled condition or event causes a Perfor-
mance Monitor alert if Performance Monitor alerts
are enabled by the corresponding “Enable” bit in
MMCR0. (..) A single Performance Monitor alert may
reflect multiple enabled conditions and events."

So a single timer can report more than one c.n. overflows that might happen
at the same time. E.g. in this timeout logic below, if PMC1 is already
overflown, we will trigger the PMC interrupt. Since we're updating all
PMCs, if more counters are also overflown the application can read them
all in the same interrupt/exception.


Thanks,


Daniel



> 
>> +     */
>> +    for (i = SPR_POWER_PMC1; i <= SPR_POWER_PMC6; i++) {
>> +        int64_t curr_timeout = get_counter_neg_timeout(env, i);
>> +
>> +        if (curr_timeout == -1) {
>> +            continue;
>> +        }
>> +
>> +        if (curr_timeout == 0) {
>> +            timeout = 0;
>> +            break;
>> +        }
>> +
>> +        if (timeout == -1 || timeout > curr_timeout) {
>> +            timeout = curr_timeout;
>> +        }
>> +    }
>> +
>> +    /*
>> +     * This can happen if counter negative conditions were enabled
>> +     * without any events to be sampled.
>> +     */
>> +    if (timeout == -1) {
>>           return;
>>       }
>>   
>> @@ -204,7 +280,7 @@ void cpu_ppc_pmu_timer_init(CPUPPCState *env)
>>   
>>   static bool counter_negative_cond_enabled(uint64_t mmcr0)
>>   {
>> -    return mmcr0 & MMCR0_PMC1CE;
>> +    return mmcr0 & (MMCR0_PMC1CE | MMCR0_PMCjCE);
>>   }
>>   
>>   void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
> 


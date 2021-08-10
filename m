Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760273E844D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 22:27:08 +0200 (CEST)
Received: from localhost ([::1]:56680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDYL5-00052d-0I
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 16:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDYKG-0004BQ-A6; Tue, 10 Aug 2021 16:26:16 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDYKE-0002Vk-Bv; Tue, 10 Aug 2021 16:26:16 -0400
Received: by mail-pl1-x631.google.com with SMTP id j3so22919202plx.4;
 Tue, 10 Aug 2021 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nAcgyxhmjL7mKOQIzEZNbTcReXLt3pP0IQX/F9cEWO4=;
 b=m4se/VdMrij5U/9IlThvfRgpnry2M61k/JzCNDk9QBEPlELqVRgyKV1QHCB9gkh16I
 JAoUARwfUm61KCv5lX/wXBwDeGbOlTpZniOjMu1L8aGisNNJIVInb+F94sUSC8AdbS64
 Rva5oXGHzp62Ha47BT/1HPA7J02rnjT7N+EgTkrMbNS4gP91ZTNYeOWEpwruTPG3UHK2
 YnDJaPyoXlyq8tlAdKdjB0zGiC5p8Qk5yq/Vq79B/UQOgiAG4EoGXRXunerI1eJkaI59
 0aq3OV0wdQXfu80tgX2H9IhrJeIek/6yZWhfXeDRijLcgMSeejSnLi3L+VtUuCm/0a2a
 dFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nAcgyxhmjL7mKOQIzEZNbTcReXLt3pP0IQX/F9cEWO4=;
 b=mPchlvewCOaLAPl/3Saju83XmWYUPEafRccLOkTmaw05uggKQqIj+zF+zqHv9P1Ing
 9ypEEx1mifH5d1AnzhDjA9duka+LFkkdaVqWrNBnfDFU9Ys9zMuV6ErgrklFohNN6jta
 nh5CWyxtGJ7fRSzCT7CLaP/lOlQOEGjyNNgfxlHrm0YYaHZwfZjUVlmeepR4d7lAA2/J
 suQeT4CzArwbRmjbnuGCXzCq/X8QCDkuCL3iwElEJAzN+goq1zDALcuh+ZBd7g9fSFru
 Ud1lALStP7bva9ceQSAAeGl1dyK6N+o3aMM6RVLYADRHyD9ZW1B0NsgoMgWBiIcYCIU7
 FRag==
X-Gm-Message-State: AOAM533qWbT9xk7QDjpIfwnQqfu7zQbzyXE2BZDXU1y27ScwhaiS2czi
 QxxV8lx3HZiHf0iZqpVHfmY=
X-Google-Smtp-Source: ABdhPJw4vD220nWQu5fB5ttPNWYGypQ3IVv/3jnkQBZx9V4lr8tOEEoL7lA6p182ajc/phLfZ5nEsw==
X-Received: by 2002:aa7:8116:0:b029:346:8678:ce26 with SMTP id
 b22-20020aa781160000b02903468678ce26mr25055062pfi.15.1628627172505; 
 Tue, 10 Aug 2021 13:26:12 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id y7sm23826685pfi.204.2021.08.10.13.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 13:26:12 -0700 (PDT)
Subject: Re: [PATCH 12/19] target/ppc/pmu_book3s_helper.c: enable PMC1 counter
 negative EBB
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-13-danielhb413@gmail.com> <YRH6IysrDvn/GJvQ@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <6a10c0a7-1c4f-0d24-f2cc-12666e590739@gmail.com>
Date: Tue, 10 Aug 2021 17:26:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRH6IysrDvn/GJvQ@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=danielhb413@gmail.com; helo=mail-pl1-x631.google.com
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



On 8/10/21 1:01 AM, David Gibson wrote:
> On Mon, Aug 09, 2021 at 10:10:50AM -0300, Daniel Henrique Barboza wrote:
>> This patch starts the counter negative EBB support by enabling PMC1
>> counter negative condition.
>>
>> A counter negative condition happens when a performance monitor counter
>> reaches the value 0x80000000. When that happens, if a counter negative
>> condition is enabled in that counter, a performance monitor alert is
>> triggered. For PMC1, this condition is enabled by MMCR0_PMC1CE.
>>
>> An icount-based logic is used to predict when we need to wake up the timer
>> to trigger the alert in both PM_INST_CMPL (0x2) and PM_CYC (0x1E) events.
>> The timer callback will then trigger a PPC_INTERRUPT_PMC which will become a
>> event-based exception later.
>>
>> Some EBB powerpc kernel selftests are passing after this patch, but a
>> substancial amount of them relies on other PMCs to be enabled and events
>> that we don't support at this moment. We'll address that in the next
>> patches.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/cpu.h               |   1 +
>>   target/ppc/pmu_book3s_helper.c | 127 +++++++++++++++++++++++----------
>>   2 files changed, 92 insertions(+), 36 deletions(-)
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 1d38b8cf7a..5c81d459f4 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -350,6 +350,7 @@ typedef struct ppc_v3_pate_t {
>>   #define MMCR0_EBE   PPC_BIT(43)         /* Perf Monitor EBB Enable */
>>   #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
>>   #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
>> +#define MMCR0_PMC1CE PPC_BIT(48)
>>   
>>   #define MMCR1_PMC1SEL_SHIFT (63 - 39)
>>   #define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
>> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
>> index 43cc0eb722..58ae65e22b 100644
>> --- a/target/ppc/pmu_book3s_helper.c
>> +++ b/target/ppc/pmu_book3s_helper.c
>> @@ -25,6 +25,7 @@
>>    * and SPAPR code.
>>    */
>>   #define PPC_CPU_FREQ 1000000000
>> +#define COUNTER_NEGATIVE_VAL 0x80000000
>>   
>>   static uint64_t get_cycles(uint64_t icount_delta)
>>   {
>> @@ -32,22 +33,9 @@ static uint64_t get_cycles(uint64_t icount_delta)
>>                       NANOSECONDS_PER_SECOND);
>>   }
>>   
>> -static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
>> -                                    uint64_t icount_delta)
>> -{
>> -    env->spr[sprn] += icount_delta;
>> -}
>> -
>> -static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
>> -                              uint64_t icount_delta)
>> -{
>> -    env->spr[sprn] += get_cycles(icount_delta);
>> -}
>> -
>> -static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
>> -                                        uint64_t icount_delta)
>> +static uint8_t get_PMC_event(CPUPPCState *env, int sprn)
>>   {
>> -    int event;
>> +    int event = 0x0;
>>   
>>       switch (sprn) {
>>       case SPR_POWER_PMC1:
>> @@ -65,11 +53,35 @@ static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
>>       case SPR_POWER_PMC4:
>>           event = MMCR1_PMC4SEL & env->spr[SPR_POWER_MMCR1];
>>           break;
>> +    case SPR_POWER_PMC5:
>> +        event = 0x2;
>> +        break;
>> +    case SPR_POWER_PMC6:
>> +        event = 0x1E;
>> +        break;
> 
> This looks like a nice cleanup that would be better folded into an
> earlier patch.
> 
>>       default:
>> -        return;
>> +        break;
>>       }
>>   
>> -    switch (event) {
>> +    return event;
>> +}
>> +
>> +static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
>> +                                    uint64_t icount_delta)
>> +{
>> +    env->spr[sprn] += icount_delta;
>> +}
>> +
>> +static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
>> +                              uint64_t icount_delta)
>> +{
>> +    env->spr[sprn] += get_cycles(icount_delta);
>> +}
>> +
>> +static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
>> +                                        uint64_t icount_delta)
>> +{
>> +    switch (get_PMC_event(env, sprn)) {
>>       case 0x2:
>>           update_PMC_PM_INST_CMPL(env, sprn, icount_delta);
>>           break;
>> @@ -99,30 +111,57 @@ static void update_PMCs(CPUPPCState *env, uint64_t icount_delta)
>>       update_PMC_PM_CYC(env, SPR_POWER_PMC6, icount_delta);
>>   }
>>   
>> +static void set_PMU_excp_timer(CPUPPCState *env)
>> +{
>> +    uint64_t timeout, now, remaining_val;
>> +
>> +    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE)) {
>> +        return;
>> +    }
>> +
>> +    remaining_val = COUNTER_NEGATIVE_VAL - env->spr[SPR_POWER_PMC1];
>> +
>> +    switch (get_PMC_event(env, SPR_POWER_PMC1)) {
>> +    case 0x2:
>> +        timeout = icount_to_ns(remaining_val);
>> +        break;
>> +    case 0x1e:
>> +        timeout = muldiv64(remaining_val, NANOSECONDS_PER_SECOND,
>> +                           PPC_CPU_FREQ);
> 
> So.. this appears to be simulating to the guest that cycles are
> occurring at a constant rate, consistent with the advertised CPU
> frequency.  Which sounds right, except... it's not clear to me that
> you're using the same logic to generate the values you read from the
> cycles PMC (in that case it shouldn't need to reference icount at all,
> right?).

'remaining_val' meaning depends on the event being sampled in the PMC
in that moment. PMCs 1 to 4 can have a multitude of events, PMC5 is always
count instructions and PMC6 is always counting cycles.

For 0x02, env->spr[SPR_POWER_PMC1] contains instructions. remaining_val is
the remaining insns for the counter negative condition, and icount_to_ns()
is the timeout estimation for that. The value of the PMC1 will be set
via update_PMC_PM_INST_CMPL(), which in turn is just a matter of summing
the elapsed icount delta between start and freeze into the PMC.

For 0x1e, env->spr[SPR_POWER_PMC1] contains cycles. remaining_val is
the remaining cycles for counter negative cycles, and this muldiv64 calc
is the timeout estimation in this case. The PMC value is set via
update_PMC_PM_CYC(), which in turn does a math with the current icount
delta in get_cycles(icount_delta) to get the current PMC value.

All the metrics implemented in this PMU relies on 'icount_delta', the
amount of icount units between the change states of MMCR0_FC (and other
freeze counter bits like patch 17).


Thanks,


Daniel



> 
>> +        break;
>> +    default:
>> +        return;
>> +    }
>> +
>> +    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +
>> +    timer_mod(env->pmu_intr_timer, now + timeout);
>> +}
>> +
>>   static void cpu_ppc_pmu_timer_cb(void *opaque)
>>   {
>>       PowerPCCPU *cpu = opaque;
>>       CPUPPCState *env = &cpu->env;
>> -    uint64_t mmcr0;
>> -
>> -    mmcr0 = env->spr[SPR_POWER_MMCR0];
>> -    if (env->spr[SPR_POWER_MMCR0] & MMCR0_EBE) {
>> -        /* freeeze counters if needed */
>> -        if (mmcr0 & MMCR0_FCECE) {
>> -            mmcr0 &= ~MMCR0_FCECE;
>> -            mmcr0 |= MMCR0_FC;
>> -        }
>> +    uint64_t icount_delta = (uint64_t)icount_get_raw() - env->pmu_base_icount;
>>   
>> -        /* Clear PMAE and set PMAO */
>> -        if (mmcr0 & MMCR0_PMAE) {
>> -            mmcr0 &= ~MMCR0_PMAE;
>> -            mmcr0 |= MMCR0_PMAO;
>> -        }
>> -        env->spr[SPR_POWER_MMCR0] = mmcr0;
>> +    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_EBE)) {
>> +        return;
>> +    }
>> +
>> +    update_PMCs(env, icount_delta);
>> +
>> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
>> +        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_FCECE;
>> +        env->spr[SPR_POWER_MMCR0] |= MMCR0_FC;
>> +    }
>>   
>> -        /* Fire the PMC hardware exception */
>> -        ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
>> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
>> +        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_PMAE;
>> +        env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
>>       }
>> +
>> +    /* Fire the PMC hardware exception */
>> +    ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
>>   }
>>   
>>   void cpu_ppc_pmu_timer_init(CPUPPCState *env)
>> @@ -134,12 +173,19 @@ void cpu_ppc_pmu_timer_init(CPUPPCState *env)
>>       env->pmu_intr_timer = timer;
>>   }
>>   
>> +static bool mmcr0_counter_neg_cond_enabled(uint64_t mmcr0)
>> +{
>> +    return mmcr0 & MMCR0_PMC1CE;
>> +}
>> +
>>   void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
>>   {
>>       uint64_t curr_icount = (uint64_t)icount_get_raw();
>>       bool curr_FC = env->spr[SPR_POWER_MMCR0] & MMCR0_FC;
>>       bool new_FC = value & MMCR0_FC;
>>   
>> +    env->spr[SPR_POWER_MMCR0] = value;
>> +
>>       /*
>>        * In an frozen count (FC) bit change:
>>        *
>> @@ -163,10 +209,19 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
>>                * until the freeze.
>>                */
>>               update_PMCs(env, icount_delta);
>> +
>> +            /* delete pending timer */
>> +            timer_del(env->pmu_intr_timer);
>>           } else {
>>               env->pmu_base_icount = curr_icount;
>> +
>> +            /*
>> +             * Start performance monitor alert timer for counter negative
>> +             * events, if needed.
>> +             */
>> +            if (mmcr0_counter_neg_cond_enabled(env->spr[SPR_POWER_MMCR0])) {
>> +                set_PMU_excp_timer(env);
>> +            }
>>           }
>>       }
>> -
>> -    env->spr[SPR_POWER_MMCR0] = value;
>>   }
> 


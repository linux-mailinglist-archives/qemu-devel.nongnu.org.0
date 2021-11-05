Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A104463C1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 14:03:04 +0100 (CET)
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miys3-00088h-4D
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 09:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1miyn5-0005FY-6Y; Fri, 05 Nov 2021 08:57:55 -0400
Received: from [201.28.113.2] (port=5311 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1miymu-0006Gh-W2; Fri, 05 Nov 2021 08:57:54 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 5 Nov 2021 09:56:39 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 951E0800AC7;
 Fri,  5 Nov 2021 09:56:39 -0300 (-03)
Subject: Re: [PATCH v5 03/10] target/ppc: enable PMU counter overflow with
 cycle events
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20211101235642.926773-1-danielhb413@gmail.com>
 <20211101235642.926773-4-danielhb413@gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <a29aa8b5-fb45-5924-5cdc-3b6c0c3f52b0@eldorado.org.br>
Date: Fri, 5 Nov 2021 09:56:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101235642.926773-4-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 05 Nov 2021 12:56:39.0952 (UTC)
 FILETIME=[932CE100:01D7D244]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.093,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/11/2021 20:56, Daniel Henrique Barboza wrote:
> The PowerISA v3.1 defines that if the proper bits are set (MMCR0_PMC1CE
> for PMC1 and MMCR0_PMCjCE for the remaining PMCs), counter negative
> conditions are enabled. This means that if the counter value overflows
> (i.e. exceeds 0x80000000) a performance monitor alert will occur. This alert
> can trigger an event-based exception (to be implemented in the next patches)
> if the MMCR0_EBE bit is set.
> 
> For now, overflowing the counter when the PMC is counting cycles will
> just trigger a performance monitor alert. This is done by starting the
> overflow timer to expire in the moment the overflow would be occuring. The
> timer will call fire_PMC_interrupt() (via cpu_ppc_pmu_timer_cb) which will
> trigger the PMU alert and, if the conditions are met, an EBB exception.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/cpu.h        |  2 +
>   target/ppc/power8-pmu.c | 86 ++++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 86 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 6c4643044b..bf718334a5 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -363,6 +363,8 @@ typedef enum {
>   #define MMCR0_PMCC   PPC_BITMASK(44, 45) /* PMC Control */
>   #define MMCR0_FC14   PPC_BIT(58)         /* PMC Freeze Counters 1-4 bit */
>   #define MMCR0_FC56   PPC_BIT(59)         /* PMC Freeze Counters 5-6 bit */
> +#define MMCR0_PMC1CE PPC_BIT(48)         /* MMCR0 PMC1 Condition Enabled */
> +#define MMCR0_PMCjCE PPC_BIT(49)         /* MMCR0 PMCj Condition Enabled */
>   /* MMCR0 userspace r/w mask */
>   #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
>   /* MMCR2 userspace r/w mask */
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index a0a42b666c..fdc94d40b2 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -23,6 +23,8 @@
> 
>   #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> 
> +#define COUNTER_NEGATIVE_VAL 0x80000000
> +

Since this value will be compared to some env->spr (that is 
target_ulong), it's probably a good idea to define it as unsigned. Also, 
you could prefix the name to indicate that it's PMU related, e.g.:

#defne PMC_COUNTER_NEGATIVE_VAL 0x80000000UL

>   /*
>    * For PMCs 1-4, IBM POWER chips has support for an implementation
>    * dependent event, 0x1E, that enables cycle counting. The Linux kernel
> @@ -93,6 +95,15 @@ static bool pmc_is_active(CPUPPCState *env, int sprn)
>       return !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC56);
>   }
> 
> +static bool pmc_has_overflow_enabled(CPUPPCState *env, int sprn)
> +{
> +    if (sprn == SPR_POWER_PMC1) {
> +        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE;
> +    }
> +
> +    return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
> +}
> +
>   static void pmu_update_cycles(CPUPPCState *env)
>   {
>       uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> @@ -121,6 +132,63 @@ static void pmu_update_cycles(CPUPPCState *env)
>       }
>   }
> 
> +static void pmu_delete_timers(CPUPPCState *env)
> +{
> +    int i;
> +
> +    for (i = 0; i < PMU_TIMERS_NUM; i++) {
> +        timer_del(env->pmu_cyc_overflow_timers[i]);
> +    }
> +}
> +
> +/*
> + * Helper function to retrieve the cycle overflow timer of the
> + * 'sprn' counter. Given that PMC5 doesn't have a timer, the
> + * amount of timers is less than the total counters and the PMC6
> + * timer is the last of the array.
> + */
> +static QEMUTimer *get_cyc_overflow_timer(CPUPPCState *env, int sprn)
> +{
> +    if (sprn == SPR_POWER_PMC5) {
> +        return NULL;
> +    }
> +
> +    if (sprn == SPR_POWER_PMC6) {
> +        return env->pmu_cyc_overflow_timers[PMU_TIMERS_NUM - 1];
> +    }
> +
> +    return env->pmu_cyc_overflow_timers[sprn - SPR_POWER_PMC1];
> +}
> +
> +static void pmu_start_overflow_timers(CPUPPCState *env)
> +{
> +    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    int64_t timeout;
> +    int sprn;
> +
> +    env->pmu_base_time = now;
> +
> +    /*
> +     * Scroll through all PMCs ad start counter overflow timers for

s/ad/and/

> +     * PM_CYC events, if needed.
> +     */
> +    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
> +        if (!pmc_is_active(env, sprn) ||
> +            !(getPMUEventType(env, sprn) == PMU_EVENT_CYCLES) ||
> +            !pmc_has_overflow_enabled(env, sprn)) {
> +            continue;
> +        }
> +
> +        if (env->spr[sprn] >= COUNTER_NEGATIVE_VAL) {
> +            timeout =  0;
> +        } else {
> +            timeout  = COUNTER_NEGATIVE_VAL - env->spr[sprn];

extra space between timeout and = ...

> +        }
> +
> +        timer_mod(get_cyc_overflow_timer(env, sprn), now + timeout);

but maybe you can just use timer_mod_anticipate?

> +    }
> +}
> +
>   /*
>    * A cycle count session consists of the basic operations we
>    * need to do to support PM_CYC events: redefine a new base_time
> @@ -128,8 +196,22 @@ static void pmu_update_cycles(CPUPPCState *env)
>    */
>   static void start_cycle_count_session(CPUPPCState *env)
>   {
> -    /* Just define pmu_base_time for now */
> -    env->pmu_base_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    bool overflow_enabled = env->spr[SPR_POWER_MMCR0] &
> +                            (MMCR0_PMC1CE | MMCR0_PMCjCE);
> +
> +    /*
> +     * Always delete existing overflow timers when starting a
> +     * new cycle counting session.
> +     */
> +    pmu_delete_timers(env);
> +
> +    if (!overflow_enabled) {
> +        /* Define pmu_base_time and leave */
> +        env->pmu_base_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        return;
> +    }
> +
> +    pmu_start_overflow_timers(env);
>   }
> 
>   void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
> --
> 2.31.1
> 
-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


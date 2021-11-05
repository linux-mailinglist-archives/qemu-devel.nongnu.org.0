Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982964463BC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 14:02:32 +0100 (CET)
Received: from localhost ([::1]:59878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miyrS-0007aU-CU
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 09:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1miylf-0004TA-SR; Fri, 05 Nov 2021 08:56:27 -0400
Received: from [201.28.113.2] (port=59140 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1miyld-0005m5-Jb; Fri, 05 Nov 2021 08:56:27 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 5 Nov 2021 09:56:20 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id DD554800AC7;
 Fri,  5 Nov 2021 09:56:19 -0300 (-03)
Subject: Re: [PATCH v5 02/10] target/ppc: PMU basic cycle count for pseries TCG
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20211101235642.926773-1-danielhb413@gmail.com>
 <20211101235642.926773-3-danielhb413@gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <8fab8324-d26d-6d6f-4ba8-47616b064873@eldorado.org.br>
Date: Fri, 5 Nov 2021 09:56:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101235642.926773-3-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 05 Nov 2021 12:56:20.0276 (UTC)
 FILETIME=[87728F40:01D7D244]
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
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index 3c2f73896f..a0a42b666c 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c

<snip>

> +static bool pmc_is_active(CPUPPCState *env, int sprn)
> +{
> +    if (sprn < SPR_POWER_PMC5) {
> +        return !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC14);
> +    }
> +
> +    return !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC56);
> +}
> +
> +static void pmu_update_cycles(CPUPPCState *env)
> +{
> +    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    uint64_t time_delta = now - env->pmu_base_time;
> +    int sprn;
> +
> +    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
> +        if (!pmc_is_active(env, sprn) ||
> +            getPMUEventType(env, sprn) != PMU_EVENT_CYCLES) {
> +            continue;
> +        }
> +
> +        /*
> +         * The pseries and powernv clock runs at 1Ghz, meaning
> +         * that 1 nanosec equals 1 cycle.
> +         */
> +        env->spr[sprn] += time_delta;
> +    }
> +
> +    /*
> +     * Update base_time for future calculations if we updated
> +     * the PMCs while the PMU was running.
> +     */
> +    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_FC)) {
> +        env->pmu_base_time = now;
> +    }
> +}
> +
> +/*
> + * A cycle count session consists of the basic operations we
> + * need to do to support PM_CYC events: redefine a new base_time
> + * to be used to calculate PMC values and start overflow timers.
> + */
> +static void start_cycle_count_session(CPUPPCState *env)
> +{
> +    /* Just define pmu_base_time for now */
> +    env->pmu_base_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +}
> +
> +void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
> +{
> +    target_ulong curr_value = env->spr[SPR_POWER_MMCR0];
> +    bool curr_FC = curr_value & MMCR0_FC;
> +    bool new_FC = value & MMCR0_FC;
> +
> +    env->spr[SPR_POWER_MMCR0] = value;

I'm not sure if this is the right place to update MMCR0. If we set both 
FC and FC14 in one write, the code will call pmu_update_cycles, but PMCs 
1-4 will not be updated because pmc_is_active will use the new value to 
check if the PMCs are frozen.

> +
> +    /* MMCR0 writes can change HFLAGS_PMCCCLEAR and HFLAGS_MMCR0FC */
> +    if (((curr_value & MMCR0_PMCC) != (value & MMCR0_PMCC)) ||
> +        (curr_FC != new_FC)) {
> +        hreg_compute_hflags(env);
> +    }
> +
> +    /*
> +     * In an frozen count (FC) bit change:
> +     *
> +     * - if PMCs were running (curr_FC = false) and we're freezing
> +     * them (new_FC = true), save the PMCs values in the registers.
> +     *
> +     * - if PMCs were frozen (curr_FC = true) and we're activating
> +     * them (new_FC = false), set the new base_time for future cycle
> +     * calculations.
> +     */
> +    if (curr_FC != new_FC) {
> +        if (!curr_FC) { > +            pmu_update_cycles(env);
> +        } else {
> +            start_cycle_count_session(env);
> +        }
> +    }
> +}

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


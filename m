Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E77449CB3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 20:53:12 +0100 (CET)
Received: from localhost ([::1]:39408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkAhb-0003hQ-Da
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 14:53:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mkAdJ-0001an-HN; Mon, 08 Nov 2021 14:48:45 -0500
Received: from [201.28.113.2] (port=36856 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mkAdH-0005kG-B6; Mon, 08 Nov 2021 14:48:45 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 8 Nov 2021 16:48:39 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id EAD90800B36;
 Mon,  8 Nov 2021 16:48:38 -0300 (-03)
Subject: Re: [PATCH v5 09/10] target/ppc: PMU Event-Based exception support
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20211101235642.926773-1-danielhb413@gmail.com>
 <20211101235642.926773-10-danielhb413@gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <5734c880-562c-7808-1d21-bfb1d1ccfced@eldorado.org.br>
Date: Mon, 8 Nov 2021 16:48:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101235642.926773-10-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 08 Nov 2021 19:48:39.0377 (UTC)
 FILETIME=[A0570C10:01D7D4D9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.06,
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
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Gustavo Romero <gromero@linux.ibm.com>, richard.henderson@linaro.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/11/2021 20:56, Daniel Henrique Barboza wrote:
> From: Gustavo Romero <gromero@linux.ibm.com>
> 
> Following up the rfebb implementation, this patch adds the EBB exception
> support that are triggered by Performance Monitor alerts. This exception
> occurs when an enabled PMU condition or event happens and both MMCR0_EBE
> and BESCR_PME are set.
> 
> The supported PM alerts will consist of counter negative conditions of
> the PMU counters. This will be achieved by a timer mechanism that will
> predict when a counter becomes negative. The PMU timer callback will set
> the appropriate bits in MMCR0 and fire a PMC interrupt. The EBB
> exception code will then set the appropriate BESCR bits, set the next
> instruction pointer to the address pointed by the return register
> (SPR_EBBRR), and redirect execution to the handler (pointed by
> SPR_EBBHR).
> 
> CC: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/cpu.h         |  5 ++++-
>   target/ppc/excp_helper.c | 28 ++++++++++++++++++++++++++++
>   target/ppc/power8-pmu.c  | 26 ++++++++++++++++++++++++--
>   3 files changed, 56 insertions(+), 3 deletions(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 8f545ff482..592031ce54 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -129,8 +129,10 @@ enum {
>       /* ISA 3.00 additions */
>       POWERPC_EXCP_HVIRT    = 101,
>       POWERPC_EXCP_SYSCALL_VECTORED = 102, /* scv exception                     */
> +    POWERPC_EXCP_EBB = 103, /* Event-based branch exception                  */
> +
>       /* EOL                                                                   */
> -    POWERPC_EXCP_NB       = 103,
> +    POWERPC_EXCP_NB       = 104,
>       /* QEMU exceptions: special cases we want to stop translation            */
>       POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
>   };
> @@ -2455,6 +2457,7 @@ enum {
>       PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
>       PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
>       PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
> +    PPC_INTERRUPT_PMC,            /* Hypervisor virtualization interrupt  */
>   };
> 
>   /* Processor Compatibility mask (PCR) */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 7be334e007..88aa0a84f8 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -797,6 +797,22 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>           cpu_abort(cs, "Non maskable external exception "
>                     "is not implemented yet !\n");
>           break;
> +    case POWERPC_EXCP_EBB:       /* Event-based branch exception             */
> +        if ((env->spr[SPR_BESCR] & BESCR_GE) &&
> +            (env->spr[SPR_BESCR] & BESCR_PME)) {

Do we need to check FSCR[EBB] here?

> +            target_ulong nip;
> +
> +            env->spr[SPR_BESCR] &= ~BESCR_GE;   /* Clear GE */
> +            env->spr[SPR_BESCR] |= BESCR_PMEO;  /* Set PMEO */
> +            env->spr[SPR_EBBRR] = env->nip;     /* Save NIP for rfebb insn */
> +            nip = env->spr[SPR_EBBHR];          /* EBB handler */
> +            powerpc_set_excp_state(cpu, nip, env->msr);
> +        }
> +        /*
> +         * This interrupt is handled by userspace. No need
> +         * to proceed.
> +         */
> +        return;
>       default:
>       excp_invalid:
>           cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> @@ -1044,6 +1060,18 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>               powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_THERM);
>               return;
>           }
> +        /* PMC -> Event-based branch exception */
> +        if (env->pending_interrupts & (1 << PPC_INTERRUPT_PMC)) {
> +            /*
> +             * Performance Monitor event-based exception can only
> +             * occur in problem state.
> +             */
> +            if (msr_pr == 1) {
> +                env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PMC);
> +                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_EBB);
> +                return;
> +            }
> +        }
>       }
> 
>       if (env->resume_as_sreset) {
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index aa10233b29..ca3954ff0e 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -323,8 +323,30 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
>           return;
>       }
> 
> -    /* PMC interrupt not implemented yet */
> -    return;
> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
> +        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_FCECE;
> +        env->spr[SPR_POWER_MMCR0] |= MMCR0_FC;
> +
> +        /* Changing MMCR0_FC demands a new hflags compute */
> +        hreg_compute_hflags(env);
> +
> +        /*
> +         * Delete all pending timers if we need to freeze
> +         * the PMC. We'll restart them when the PMC starts
> +         * running again.
> +         */
> +        pmu_delete_timers(env);
> +    }
> +
> +    pmu_update_cycles(env);
> +
> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
> +        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_PMAE;
> +        env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
> +    }
> +
> +    /* Fire the PMC hardware exception */
> +    ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
>   }
> 
>   /* This helper assumes that the PMC is running. */
> --
> 2.31.1
> 


-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


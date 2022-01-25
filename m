Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7C649B407
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 13:32:22 +0100 (CET)
Received: from localhost ([::1]:37412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCKzl-00071V-31
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 07:32:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCKdo-0004kv-Lz
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:09:43 -0500
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:53921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCKdm-0001Ka-38
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:09:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.174])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 240822064B;
 Tue, 25 Jan 2022 12:09:35 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 25 Jan
 2022 13:09:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0062d7703cf-7e65-4e24-89bf-d381ec44cac6,
 81DEFC5675B4A2B0B4575F732D37872089199EF9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f2009594-f2a9-3b85-757d-16224027f13c@kaod.org>
Date: Tue, 25 Jan 2022 13:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/5] target/ppc: Simplify powerpc_excp_books
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220124184605.999353-1-farosas@linux.ibm.com>
 <20220124184605.999353-3-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220124184605.999353-3-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c5b48013-6280-4b78-8ee7-9388e43e06ff
X-Ovh-Tracer-Id: 16753109139148409763
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/22 19:46, Fabiano Rosas wrote:
> Differences from the generic powerpc_excp code:
> 
> - Not BookE, so some MSR bits are cleared at interrupt dispatch;
> - Always uses HV_EMU if the CPU has MSR_HV;
> - Exceptions always delivered in 64 bit.
> 
> Exceptions used:
> 
> POWERPC_EXCP_ALIGN
> POWERPC_EXCP_DECR
> POWERPC_EXCP_DSEG
> POWERPC_EXCP_DSI
> POWERPC_EXCP_EXTERNAL
> POWERPC_EXCP_FPU
> POWERPC_EXCP_FU
> POWERPC_EXCP_HDECR
> POWERPC_EXCP_HDSI
> POWERPC_EXCP_HISI
> POWERPC_EXCP_HVIRT
> POWERPC_EXCP_HV_EMU
> POWERPC_EXCP_HV_FU
> POWERPC_EXCP_ISEG
> POWERPC_EXCP_ISI
> POWERPC_EXCP_MAINT
> POWERPC_EXCP_MCHECK
> POWERPC_EXCP_PERFM
> POWERPC_EXCP_PROGRAM
> POWERPC_EXCP_RESET
> POWERPC_EXCP_SDOOR_HV
> POWERPC_EXCP_SYSCALL
> POWERPC_EXCP_SYSCALL_VECTORED
> POWERPC_EXCP_THERM
> POWERPC_EXCP_TRACE
> POWERPC_EXCP_VPU
> POWERPC_EXCP_VPUA
> POWERPC_EXCP_VSXU
> 
> POWERPC_EXCP_HV_MAINT
> POWERPC_EXCP_SDOOR
> 
> (I added the two above that were not being considered. They used to be
> "Invalid exception". Now they become "Unimplemented exception" which
> is more accurate.)
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

I would prefer 'powerpc_excp_book3s' but no need to resend for that.
I will change it.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/excp_helper.c | 161 ++++-----------------------------------
>   1 file changed, 14 insertions(+), 147 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 08aca37f0a..0d27dfb2c5 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -551,6 +551,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>       powerpc_set_excp_state(cpu, vector, new_msr);
>   }
>   
> +#ifdef TARGET_PPC64
>   static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>   {
>       CPUState *cs = CPU(cpu);
> @@ -568,11 +569,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>                     excp, env->error_code);
>   
>       /* new srr1 value excluding must-be-zero bits */
> -    if (excp_model == POWERPC_EXCP_BOOKE) {
> -        msr = env->msr;
> -    } else {
> -        msr = env->msr & ~0x783f0000ULL;
> -    }
> +    msr = env->msr & ~0x783f0000ULL;
>   
>       /*
>        * new interrupt handler msr preserves existing HV and ME unless
> @@ -593,29 +590,13 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>       }
>   
>       /*
> -     * Hypervisor emulation assistance interrupt only exists on server
> -     * arch 2.05 server or later. We also don't want to generate it if
> -     * we don't have HVB in msr_mask (PAPR mode).
> +     * We don't want to generate a Hypervisor Emulation Assistance
> +     * Interrupt if we don't have HVB in msr_mask (PAPR mode).
>        */
> -    if (excp == POWERPC_EXCP_HV_EMU
> -#if defined(TARGET_PPC64)
> -        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
> -#endif /* defined(TARGET_PPC64) */
> -
> -    ) {
> +    if (excp == POWERPC_EXCP_HV_EMU && !(env->msr_mask & MSR_HVB)) {
>           excp = POWERPC_EXCP_PROGRAM;
>       }
>   
> -#ifdef TARGET_PPC64
> -    /*
> -     * SPEU and VPU share the same IVOR but they exist in different
> -     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
> -     */
> -    if (excp_model == POWERPC_EXCP_BOOKE && excp == POWERPC_EXCP_VPU) {
> -        excp = POWERPC_EXCP_SPEU;
> -    }
> -#endif
> -
>       vector = env->excp_vectors[excp];
>       if (vector == (target_ulong)-1ULL) {
>           cpu_abort(cs, "Raised an exception without defined vector %d\n",
> @@ -625,22 +606,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>       vector |= env->excp_prefix;
>   
>       switch (excp) {
> -    case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_40x:
> -            srr0 = SPR_40x_SRR2;
> -            srr1 = SPR_40x_SRR3;
> -            break;
> -        case POWERPC_EXCP_BOOKE:
> -            srr0 = SPR_BOOKE_CSRR0;
> -            srr1 = SPR_BOOKE_CSRR1;
> -            break;
> -        case POWERPC_EXCP_G2:
> -            break;
> -        default:
> -            goto excp_invalid;
> -        }
> -        break;
>       case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
>           if (msr_me == 0) {
>               /*
> @@ -817,50 +782,8 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>           env->ctr = msr;
>           break;
>       case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
> -    case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
>       case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
>           break;
> -    case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt           */
> -        /* FIT on 4xx */
> -        trace_ppc_excp_print("FIT");
> -        break;
> -    case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt                 */
> -        trace_ppc_excp_print("WDT");
> -        switch (excp_model) {
> -        case POWERPC_EXCP_BOOKE:
> -            srr0 = SPR_BOOKE_CSRR0;
> -            srr1 = SPR_BOOKE_CSRR1;
> -            break;
> -        default:
> -            break;
> -        }
> -        break;
> -    case POWERPC_EXCP_DTLB:      /* Data TLB error                           */
> -    case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
> -        break;
> -    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                          */
> -        if (env->flags & POWERPC_FLAG_DE) {
> -            /* FIXME: choose one or the other based on CPU type */
> -            srr0 = SPR_BOOKE_DSRR0;
> -            srr1 = SPR_BOOKE_DSRR1;
> -
> -            env->spr[SPR_BOOKE_CSRR0] = env->nip;
> -            env->spr[SPR_BOOKE_CSRR1] = msr;
> -
> -            /* DBSR already modified by caller */
> -        } else {
> -            cpu_abort(cs, "Debug exception triggered on unsupported model\n");
> -        }
> -        break;
> -    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
> -        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
> -        break;
> -    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
> -        break;
> -    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
> -        srr0 = SPR_BOOKE_CSRR0;
> -        srr1 = SPR_BOOKE_CSRR1;
> -        break;
>       case POWERPC_EXCP_RESET:     /* System reset exception                   */
>           /* A power-saving exception sets ME, otherwise it is unchanged */
>           if (msr_pow) {
> @@ -890,8 +813,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>           /* fall through */
>       case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
>       case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
> -    case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception        */
> -    case POWERPC_EXCP_HISEG:     /* Hypervisor instruction segment exception */
>       case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt            */
>       case POWERPC_EXCP_HV_EMU:
>       case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
> @@ -903,70 +824,25 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>       case POWERPC_EXCP_VPU:       /* Vector unavailable exception             */
>       case POWERPC_EXCP_VSXU:       /* VSX unavailable exception               */
>       case POWERPC_EXCP_FU:         /* Facility unavailable exception          */
> -#ifdef TARGET_PPC64
>           env->spr[SPR_FSCR] |= ((target_ulong)env->error_code << 56);
> -#endif
>           break;
>       case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exception */
> -#ifdef TARGET_PPC64
>           env->spr[SPR_HFSCR] |= ((target_ulong)env->error_code << FSCR_IC_POS);
>           srr0 = SPR_HSRR0;
>           srr1 = SPR_HSRR1;
>           new_msr |= (target_ulong)MSR_HVB;
>           new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
> -#endif
>           break;
> -    case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
> -        trace_ppc_excp_print("PIT");
> -        break;
> -    case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
> -    case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
> -    case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_602:
> -        case POWERPC_EXCP_603:
> -        case POWERPC_EXCP_G2:
> -            /* Swap temporary saved registers with GPRs */
> -            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
> -                new_msr |= (target_ulong)1 << MSR_TGPR;
> -                hreg_swap_gpr_tgpr(env);
> -            }
> -            /* fall through */
> -        case POWERPC_EXCP_7x5:
> -            ppc_excp_debug_sw_tlb(env, excp);
> -
> -            msr |= env->crf[0] << 28;
> -            msr |= env->error_code; /* key, D/I, S/L bits */
> -            /* Set way using a LRU mechanism */
> -            msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
> -            break;
> -        default:
> -            cpu_abort(cs, "Invalid TLB miss exception\n");
> -            break;
> -        }
> -        break;
> -    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
> -    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interrupt  */
> -    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interrupt   */
> -    case POWERPC_EXCP_IO:        /* IO error exception                       */
> -    case POWERPC_EXCP_RUNM:      /* Run mode exception                       */
> -    case POWERPC_EXCP_EMUL:      /* Emulation trap exception                 */
> -    case POWERPC_EXCP_FPA:       /* Floating-point assist exception          */
> -    case POWERPC_EXCP_DABR:      /* Data address breakpoint                  */
> -    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
> -    case POWERPC_EXCP_SMI:       /* System management interrupt              */
>       case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
>       case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
>       case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
> -    case POWERPC_EXCP_SOFTP:     /* Soft patch exception                     */
>       case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
> -    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint             */
> -    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint         */
> +    case POWERPC_EXCP_SDOOR:     /* Doorbell interrupt                       */
> +    case POWERPC_EXCP_HV_MAINT:  /* Hypervisor Maintenance exception         */
>           cpu_abort(cs, "%s exception not implemented\n",
>                     powerpc_excp_name(excp));
>           break;
>       default:
> -    excp_invalid:
>           cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
>           break;
>       }
> @@ -991,22 +867,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>           new_msr |= (target_ulong)1 << MSR_LE;
>       }
>   
> -#if defined(TARGET_PPC64)
> -    if (excp_model == POWERPC_EXCP_BOOKE) {
> -        if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
> -            /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
> -            new_msr |= (target_ulong)1 << MSR_CM;
> -        } else {
> -            vector = (uint32_t)vector;
> -        }
> -    } else {
> -        if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
> -            vector = (uint32_t)vector;
> -        } else {
> -            new_msr |= (target_ulong)1 << MSR_SF;
> -        }
> -    }
> -#endif
> +    new_msr |= (target_ulong)1 << MSR_SF;
>   
>       if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
>           /* Save PC */
> @@ -1021,6 +882,12 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>   
>       powerpc_set_excp_state(cpu, vector, new_msr);
>   }
> +#else
> +static inline void powerpc_excp_books(PowerPCCPU *cpu, int excp)
> +{
> +    g_assert_not_reached();
> +}
> +#endif
>   
>   /*
>    * Note that this function should be greatly optimized when called
> 



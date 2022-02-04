Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7416E4A99D1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 14:19:58 +0100 (CET)
Received: from localhost ([::1]:46480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFyVJ-0000uL-Aj
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 08:19:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nFyHl-0001eF-4f; Fri, 04 Feb 2022 08:06:00 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:25907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nFyHa-0001gK-JM; Fri, 04 Feb 2022 08:05:52 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2DF3E746377;
 Fri,  4 Feb 2022 14:05:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EEFDD746324; Fri,  4 Feb 2022 14:05:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EDC6F7457E7;
 Fri,  4 Feb 2022 14:05:31 +0100 (CET)
Date: Fri, 4 Feb 2022 14:05:31 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 03/10] target/ppc: Simplify powerpc_excp_7xx
In-Reply-To: <20220203224246.1446652-4-farosas@linux.ibm.com>
Message-ID: <b39f22a-d58f-1faa-3777-66ccbbc7b9dd@eik.bme.hu>
References: <20220203224246.1446652-1-farosas@linux.ibm.com>
 <20220203224246.1446652-4-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Feb 2022, Fabiano Rosas wrote:
> Differences from the generic powerpc_excp code:
>
> - Not BookE, so some MSR bits are cleared at interrupt dispatch;
> - No MSR_HV;
> - No power saving states;
> - No Hypervisor Emulation Assistance;

The pegasos2 can run with -cpu G3 as the real hardware had a processor 
card either with a G3 or a G4 so this will break VOF with that. I'm not 
sure if it's worth keeping support for this though as long as the default 
G4 works because most people would want to use a G4 anyway and those who 
want a G3 for some reason could still use a firmware rom image instead but 
I wonder if there's another better place where sc 1 could be handled so it 
could work for these cpus without needing to change these excp helpers.

Regards,
BALATON Zoltan

> - Not 64 bits;
> - No System call vectored;
> - No Alternate Interrupt Location.
>
> Exceptions used:
>
> POWERPC_EXCP_ALIGN
> POWERPC_EXCP_DECR
> POWERPC_EXCP_DLTLB
> POWERPC_EXCP_DSI
> POWERPC_EXCP_DSTLB
> POWERPC_EXCP_EXTERNAL
> POWERPC_EXCP_FPU
> POWERPC_EXCP_IABR
> POWERPC_EXCP_IFTLB
> POWERPC_EXCP_ISI
> POWERPC_EXCP_MCHECK
> POWERPC_EXCP_PERFM
> POWERPC_EXCP_PROGRAM
> POWERPC_EXCP_RESET
> POWERPC_EXCP_SMI
> POWERPC_EXCP_SYSCALL
> POWERPC_EXCP_THERM
> POWERPC_EXCP_TRACE
>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
> target/ppc/excp_helper.c | 185 ++-------------------------------------
> 1 file changed, 9 insertions(+), 176 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index df96f620b2..358c3f6206 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -758,54 +758,26 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
>                   excp, env->error_code);
>
>     /* new srr1 value excluding must-be-zero bits */
> -    if (excp_model == POWERPC_EXCP_BOOKE) {
> -        msr = env->msr;
> -    } else {
> -        msr = env->msr & ~0x783f0000ULL;
> -    }
> +    msr = env->msr & ~0x783f0000ULL;
>
>     /*
> -     * new interrupt handler msr preserves existing HV and ME unless
> +     * new interrupt handler msr preserves existing ME unless
>      * explicitly overriden
>      */
> -    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
> +    new_msr = env->msr & ((target_ulong)1 << MSR_ME);
>
>     /* target registers */
>     srr0 = SPR_SRR0;
>     srr1 = SPR_SRR1;
>
> -    /*
> -     * check for special resume at 0x100 from doze/nap/sleep/winkle on
> -     * P7/P8/P9
> -     */
> -    if (env->resume_as_sreset) {
> -        excp = powerpc_reset_wakeup(cs, env, excp, &msr);
> -    }
> -
>     /*
>      * Hypervisor emulation assistance interrupt only exists on server
> -     * arch 2.05 server or later. We also don't want to generate it if
> -     * we don't have HVB in msr_mask (PAPR mode).
> +     * arch 2.05 server or later.
>      */
> -    if (excp == POWERPC_EXCP_HV_EMU
> -#if defined(TARGET_PPC64)
> -        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
> -#endif /* defined(TARGET_PPC64) */
> -
> -    ) {
> +    if (excp == POWERPC_EXCP_HV_EMU) {
>         excp = POWERPC_EXCP_PROGRAM;
>     }
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
>     vector = env->excp_vectors[excp];
>     if (vector == (target_ulong)-1ULL) {
>         cpu_abort(cs, "Raised an exception without defined vector %d\n",
> @@ -815,22 +787,6 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
>     vector |= env->excp_prefix;
>
>     switch (excp) {
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
> -        case POWERPC_EXCP_6xx:
> -            break;
> -        default:
> -            goto excp_invalid;
> -        }
> -        break;
>     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
>         if (msr_me == 0) {
>             /*
> @@ -994,63 +950,9 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
>             new_msr |= (target_ulong)MSR_HVB;
>         }
>         break;
> -    case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                     */
> -        lev = env->error_code;
> -        dump_syscall(env);
> -        env->nip += 4;
> -        new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
> -        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
> -
> -        vector += lev * 0x20;
> -
> -        env->lr = env->nip;
> -        env->ctr = msr;
> -        break;
>     case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
> -    case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
>     case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
>         break;
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
>     case POWERPC_EXCP_RESET:     /* System reset exception                   */
>         /* A power-saving exception sets ME, otherwise it is unchanged */
>         if (msr_pow) {
> @@ -1071,44 +973,8 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
>             }
>         }
>         break;
> -    case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
> -    case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
>     case POWERPC_EXCP_TRACE:     /* Trace exception                          */
>         break;
> -    case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage exception */
> -        msr |= env->error_code;
> -        /* fall through */
> -    case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
> -    case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
> -    case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception        */
> -    case POWERPC_EXCP_HISEG:     /* Hypervisor instruction segment exception */
> -    case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt            */
> -    case POWERPC_EXCP_HV_EMU:
> -    case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
> -        srr0 = SPR_HSRR0;
> -        srr1 = SPR_HSRR1;
> -        new_msr |= (target_ulong)MSR_HVB;
> -        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
> -        break;
> -    case POWERPC_EXCP_VPU:       /* Vector unavailable exception             */
> -    case POWERPC_EXCP_VSXU:       /* VSX unavailable exception               */
> -    case POWERPC_EXCP_FU:         /* Facility unavailable exception          */
> -#ifdef TARGET_PPC64
> -        env->spr[SPR_FSCR] |= ((target_ulong)env->error_code << 56);
> -#endif
> -        break;
> -    case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exception */
> -#ifdef TARGET_PPC64
> -        env->spr[SPR_HFSCR] |= ((target_ulong)env->error_code << FSCR_IC_POS);
> -        srr0 = SPR_HSRR0;
> -        srr1 = SPR_HSRR1;
> -        new_msr |= (target_ulong)MSR_HVB;
> -        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
> -#endif
> -        break;
> -    case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
> -        trace_ppc_excp_print("PIT");
> -        break;
>     case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
>     case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
>     case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
> @@ -1133,25 +999,14 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
>             break;
>         }
>         break;
> -    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
> -    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interrupt  */
> -    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interrupt   */
> -    case POWERPC_EXCP_FPA:       /* Floating-point assist exception          */
> -    case POWERPC_EXCP_DABR:      /* Data address breakpoint                  */
>     case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
>     case POWERPC_EXCP_SMI:       /* System management interrupt              */
>     case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
>     case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
> -    case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
> -    case POWERPC_EXCP_SOFTP:     /* Soft patch exception                     */
> -    case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
> -    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint             */
> -    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint         */
>         cpu_abort(cs, "%s exception not implemented\n",
>                   powerpc_excp_name(excp));
>         break;
>     default:
> -    excp_invalid:
>         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
>         break;
>     }
> @@ -1176,33 +1031,11 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
>         new_msr |= (target_ulong)1 << MSR_LE;
>     }
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
> +    /* Save PC */
> +    env->spr[srr0] = env->nip;
>
> -    if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
> -        /* Save PC */
> -        env->spr[srr0] = env->nip;
> -
> -        /* Save MSR */
> -        env->spr[srr1] = msr;
> -    }
> -
> -    /* This can update new_msr and vector if AIL applies */
> -    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
> +    /* Save MSR */
> +    env->spr[srr1] = msr;
>
>     powerpc_set_excp_state(cpu, vector, new_msr);
> }
>


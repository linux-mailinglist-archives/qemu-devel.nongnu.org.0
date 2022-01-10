Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1AB489FC3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:02:07 +0100 (CET)
Received: from localhost ([::1]:47162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6zvi-0003Vd-Jw
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:02:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n6zlw-0004wH-3T; Mon, 10 Jan 2022 13:52:01 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:49730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n6zls-0000K6-U5; Mon, 10 Jan 2022 13:51:59 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B73E874570D;
 Mon, 10 Jan 2022 19:51:53 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 81A7F745709; Mon, 10 Jan 2022 19:51:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7FDF27456B4;
 Mon, 10 Jan 2022 19:51:53 +0100 (CET)
Date: Mon, 10 Jan 2022 19:51:53 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 4/8] squash target/ppc: Introduce powerpc_excp_40x
In-Reply-To: <20220110181546.4131853-5-farosas@linux.ibm.com>
Message-ID: <17495cce-79f1-1483-aab3-86ffcde7492e@eik.bme.hu>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
 <20220110181546.4131853-5-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Jan 2022, Fabiano Rosas wrote:
> Introduce a new exception dispatcher for 40x CPUs.
>
> Differences from the generic powerpc_excp code:
>
> - Not BookE, so some MSR bits are cleared at interrupt dispatch;
> - No MSR_HV or MSR_LE;
> - No power saving states;
> - No Hypervisor Emulation Assistance;
> - Not 64 bits;
> - No System call vectored;
> - No Interrupts Little Endian;
> - No Alternate Interrupt Location.
>
> Exceptions used:
>
> POWERPC_EXCP_ALIGN
> POWERPC_EXCP_APU
> POWERPC_EXCP_CRITICAL
> POWERPC_EXCP_DEBUG
> POWERPC_EXCP_DSI
> POWERPC_EXCP_DTLB
> POWERPC_EXCP_EXTERNAL
> POWERPC_EXCP_FIT
> POWERPC_EXCP_FPU
> POWERPC_EXCP_ISI
> POWERPC_EXCP_ITLB
> POWERPC_EXCP_MCHECK
> POWERPC_EXCP_PIT
> POWERPC_EXCP_PROGRAM
> POWERPC_EXCP_SYSCALL
> POWERPC_EXCP_WDT
>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
> target/ppc/excp_helper.c | 165 +++------------------------------------
> 1 file changed, 13 insertions(+), 152 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 12ab5e1b34..1d997c4d6b 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -409,54 +409,18 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
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
> -     * explicitly overriden
> +     * new interrupt handler msr preserves existing ME unless
> +     * explicitly overriden.
>      */
> -    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
> +    new_msr = env->msr & (((target_ulong)1 << MSR_ME));
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
> -    /*
> -     * Hypervisor emulation assistance interrupt only exists on server
> -     * arch 2.05 server or later. We also don't want to generate it if
> -     * we don't have HVB in msr_mask (PAPR mode).
> -     */
> -    if (excp == POWERPC_EXCP_HV_EMU
> -#if defined(TARGET_PPC64)
> -        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
> -#endif /* defined(TARGET_PPC64) */
> -
> -    ) {
> -        excp = POWERPC_EXCP_PROGRAM;
> -    }
> -
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
> @@ -581,6 +545,11 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>          */
>         env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
>         break;
> +    case POWERPC_EXCP_HV_EMU:
> +        /*
> +         * Hypervisor emulation assistance interrupt only exists on server
> +         * arch 2.05 server or later.
> +         */
>     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
>         switch (env->error_code & ~0xF) {
>         case POWERPC_EXCP_FP:
> @@ -645,22 +614,8 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
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
>     case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
> -    case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
> -        break;

Removing the break here makes FPU and APU fall through to FIT. Is that 
intentional?

Regards,
BALATON Zoltan

>     case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt           */
>         /* FIT on 4xx */
>         trace_ppc_excp_print("FIT");
> @@ -693,70 +648,6 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>             cpu_abort(cs, "Debug exception triggered on unsupported model\n");
>         }
>         break;
> -    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
> -        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
> -        break;
> -    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
> -        break;
> -    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
> -        srr0 = SPR_BOOKE_CSRR0;
> -        srr1 = SPR_BOOKE_CSRR1;
> -        break;
> -    case POWERPC_EXCP_RESET:     /* System reset exception                   */
> -        /* A power-saving exception sets ME, otherwise it is unchanged */
> -        if (msr_pow) {
> -            /* indicate that we resumed from power save mode */
> -            msr |= 0x10000;
> -            new_msr |= ((target_ulong)1 << MSR_ME);
> -        }
> -        if (env->msr_mask & MSR_HVB) {
> -            /*
> -             * ISA specifies HV, but can be delivered to guest with HV
> -             * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
> -             */
> -            new_msr |= (target_ulong)MSR_HVB;
> -        } else {
> -            if (msr_pow) {
> -                cpu_abort(cs, "Trying to deliver power-saving system reset "
> -                          "exception %d with no HV support\n", excp);
> -            }
> -        }
> -        break;
> -    case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
> -    case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
> -    case POWERPC_EXCP_TRACE:     /* Trace exception                          */
> -        break;
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
>     case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
>         trace_ppc_excp_print("PIT");
>         break;
> @@ -824,41 +715,11 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>         }
>     }
>
> -    /*
> -     * Sort out endianness of interrupt, this differs depending on the
> -     * CPU, the HV mode, etc...
> -     */
> -    if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
> -        new_msr |= (target_ulong)1 << MSR_LE;
> -    }
> +    /* Save PC */
> +    env->spr[srr0] = env->nip;
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
> -
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


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7930449B390
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 13:15:55 +0100 (CET)
Received: from localhost ([::1]:40076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCKjq-0006QN-9i
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 07:15:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCKbH-0002Ct-91
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:07:03 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:48507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCKb8-0000gs-9W
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:07:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.250])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1AAA1D9E4009;
 Tue, 25 Jan 2022 13:06:51 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 25 Jan
 2022 13:06:50 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004c41b2e59-6a8e-48c6-8636-5f5db0fb4cc9,
 81DEFC5675B4A2B0B4575F732D37872089199EF9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <89146b10-0681-fc6c-5745-4f61b8acccc7@kaod.org>
Date: Tue, 25 Jan 2022 13:06:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/5] target/ppc: Introduce powerpc_excp_books
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220124184605.999353-1-farosas@linux.ibm.com>
 <20220124184605.999353-2-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220124184605.999353-2-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: aded46c7-95fc-4646-8890-a8336a2e3cd3
X-Ovh-Tracer-Id: 16706665768108460963
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> Introduce a new powerpc_excp function specific for BookS CPUs. This
> commit copies powerpc_excp_legacy verbatim so the next one has a clean
> diff.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/excp_helper.c | 478 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 478 insertions(+)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a0c932cd16..08aca37f0a 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -551,6 +551,477 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>       powerpc_set_excp_state(cpu, vector, new_msr);
>   }
>   
> +static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
> +{
> +    CPUState *cs = CPU(cpu);
> +    CPUPPCState *env = &cpu->env;
> +    int excp_model = env->excp_model;
> +    target_ulong msr, new_msr, vector;
> +    int srr0, srr1, lev = -1;
> +
> +    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
> +        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> +    }
> +
> +    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
> +                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
> +                  excp, env->error_code);
> +
> +    /* new srr1 value excluding must-be-zero bits */
> +    if (excp_model == POWERPC_EXCP_BOOKE) {
> +        msr = env->msr;
> +    } else {
> +        msr = env->msr & ~0x783f0000ULL;
> +    }
> +
> +    /*
> +     * new interrupt handler msr preserves existing HV and ME unless
> +     * explicitly overriden
> +     */
> +    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
> +
> +    /* target registers */
> +    srr0 = SPR_SRR0;
> +    srr1 = SPR_SRR1;
> +
> +    /*
> +     * check for special resume at 0x100 from doze/nap/sleep/winkle on
> +     * P7/P8/P9
> +     */
> +    if (env->resume_as_sreset) {
> +        excp = powerpc_reset_wakeup(cs, env, excp, &msr);
> +    }
> +
> +    /*
> +     * Hypervisor emulation assistance interrupt only exists on server
> +     * arch 2.05 server or later. We also don't want to generate it if
> +     * we don't have HVB in msr_mask (PAPR mode).
> +     */
> +    if (excp == POWERPC_EXCP_HV_EMU
> +#if defined(TARGET_PPC64)
> +        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
> +#endif /* defined(TARGET_PPC64) */
> +
> +    ) {
> +        excp = POWERPC_EXCP_PROGRAM;
> +    }
> +
> +#ifdef TARGET_PPC64
> +    /*
> +     * SPEU and VPU share the same IVOR but they exist in different
> +     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
> +     */
> +    if (excp_model == POWERPC_EXCP_BOOKE && excp == POWERPC_EXCP_VPU) {
> +        excp = POWERPC_EXCP_SPEU;
> +    }
> +#endif
> +
> +    vector = env->excp_vectors[excp];
> +    if (vector == (target_ulong)-1ULL) {
> +        cpu_abort(cs, "Raised an exception without defined vector %d\n",
> +                  excp);
> +    }
> +
> +    vector |= env->excp_prefix;
> +
> +    switch (excp) {
> +    case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
> +        switch (excp_model) {
> +        case POWERPC_EXCP_40x:
> +            srr0 = SPR_40x_SRR2;
> +            srr1 = SPR_40x_SRR3;
> +            break;
> +        case POWERPC_EXCP_BOOKE:
> +            srr0 = SPR_BOOKE_CSRR0;
> +            srr1 = SPR_BOOKE_CSRR1;
> +            break;
> +        case POWERPC_EXCP_G2:
> +            break;
> +        default:
> +            goto excp_invalid;
> +        }
> +        break;
> +    case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
> +        if (msr_me == 0) {
> +            /*
> +             * Machine check exception is not enabled.  Enter
> +             * checkstop state.
> +             */
> +            fprintf(stderr, "Machine check while not allowed. "
> +                    "Entering checkstop state\n");
> +            if (qemu_log_separate()) {
> +                qemu_log("Machine check while not allowed. "
> +                        "Entering checkstop state\n");
> +            }
> +            cs->halted = 1;
> +            cpu_interrupt_exittb(cs);
> +        }
> +        if (env->msr_mask & MSR_HVB) {
> +            /*
> +             * ISA specifies HV, but can be delivered to guest with HV
> +             * clear (e.g., see FWNMI in PAPR).
> +             */
> +            new_msr |= (target_ulong)MSR_HVB;
> +        }
> +
> +        /* machine check exceptions don't have ME set */
> +        new_msr &= ~((target_ulong)1 << MSR_ME);
> +
> +        /* XXX: should also have something loaded in DAR / DSISR */
> +        switch (excp_model) {
> +        case POWERPC_EXCP_40x:
> +            srr0 = SPR_40x_SRR2;
> +            srr1 = SPR_40x_SRR3;
> +            break;
> +        case POWERPC_EXCP_BOOKE:
> +            /* FIXME: choose one or the other based on CPU type */
> +            srr0 = SPR_BOOKE_MCSRR0;
> +            srr1 = SPR_BOOKE_MCSRR1;
> +
> +            env->spr[SPR_BOOKE_CSRR0] = env->nip;
> +            env->spr[SPR_BOOKE_CSRR1] = msr;
> +            break;
> +        default:
> +            break;
> +        }
> +        break;
> +    case POWERPC_EXCP_DSI:       /* Data storage exception                   */
> +        trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
> +        break;
> +    case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
> +        trace_ppc_excp_isi(msr, env->nip);
> +        msr |= env->error_code;
> +        break;
> +    case POWERPC_EXCP_EXTERNAL:  /* External input                           */
> +    {
> +        bool lpes0;
> +
> +        cs = CPU(cpu);
> +
> +        /*
> +         * Exception targeting modifiers
> +         *
> +         * LPES0 is supported on POWER7/8/9
> +         * LPES1 is not supported (old iSeries mode)
> +         *
> +         * On anything else, we behave as if LPES0 is 1
> +         * (externals don't alter MSR:HV)
> +         */
> +#if defined(TARGET_PPC64)
> +        if (excp_model == POWERPC_EXCP_POWER7 ||
> +            excp_model == POWERPC_EXCP_POWER8 ||
> +            excp_model == POWERPC_EXCP_POWER9 ||
> +            excp_model == POWERPC_EXCP_POWER10) {
> +            lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
> +        } else
> +#endif /* defined(TARGET_PPC64) */
> +        {
> +            lpes0 = true;
> +        }
> +
> +        if (!lpes0) {
> +            new_msr |= (target_ulong)MSR_HVB;
> +            new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
> +            srr0 = SPR_HSRR0;
> +            srr1 = SPR_HSRR1;
> +        }
> +        if (env->mpic_proxy) {
> +            /* IACK the IRQ on delivery */
> +            env->spr[SPR_BOOKE_EPR] = ldl_phys(cs->as, env->mpic_iack);
> +        }
> +        break;
> +    }
> +    case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
> +        /* Get rS/rD and rA from faulting opcode */
> +        /*
> +         * Note: the opcode fields will not be set properly for a
> +         * direct store load/store, but nobody cares as nobody
> +         * actually uses direct store segments.
> +         */
> +        env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
> +        break;
> +    case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
> +        switch (env->error_code & ~0xF) {
> +        case POWERPC_EXCP_FP:
> +            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
> +                trace_ppc_excp_fp_ignore();
> +                cs->exception_index = POWERPC_EXCP_NONE;
> +                env->error_code = 0;
> +                return;
> +            }
> +
> +            /*
> +             * FP exceptions always have NIP pointing to the faulting
> +             * instruction, so always use store_next and claim we are
> +             * precise in the MSR.
> +             */
> +            msr |= 0x00100000;
> +            env->spr[SPR_BOOKE_ESR] = ESR_FP;
> +            break;
> +        case POWERPC_EXCP_INVAL:
> +            trace_ppc_excp_inval(env->nip);
> +            msr |= 0x00080000;
> +            env->spr[SPR_BOOKE_ESR] = ESR_PIL;
> +            break;
> +        case POWERPC_EXCP_PRIV:
> +            msr |= 0x00040000;
> +            env->spr[SPR_BOOKE_ESR] = ESR_PPR;
> +            break;
> +        case POWERPC_EXCP_TRAP:
> +            msr |= 0x00020000;
> +            env->spr[SPR_BOOKE_ESR] = ESR_PTR;
> +            break;
> +        default:
> +            /* Should never occur */
> +            cpu_abort(cs, "Invalid program exception %d. Aborting\n",
> +                      env->error_code);
> +            break;
> +        }
> +        break;
> +    case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
> +        lev = env->error_code;
> +
> +        if ((lev == 1) && cpu->vhyp) {
> +            dump_hcall(env);
> +        } else {
> +            dump_syscall(env);
> +        }
> +
> +        /*
> +         * We need to correct the NIP which in this case is supposed
> +         * to point to the next instruction
> +         */
> +        env->nip += 4;
> +
> +        /* "PAPR mode" built-in hypercall emulation */
> +        if ((lev == 1) && cpu->vhyp) {
> +            PPCVirtualHypervisorClass *vhc =
> +                PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
> +            vhc->hypercall(cpu->vhyp, cpu);
> +            return;
> +        }
> +        if (lev == 1) {
> +            new_msr |= (target_ulong)MSR_HVB;
> +        }
> +        break;
> +    case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                     */
> +        lev = env->error_code;
> +        dump_syscall(env);
> +        env->nip += 4;
> +        new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
> +        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
> +
> +        vector += lev * 0x20;
> +
> +        env->lr = env->nip;
> +        env->ctr = msr;
> +        break;
> +    case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
> +    case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
> +    case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
> +        break;
> +    case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt           */
> +        /* FIT on 4xx */
> +        trace_ppc_excp_print("FIT");
> +        break;
> +    case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt                 */
> +        trace_ppc_excp_print("WDT");
> +        switch (excp_model) {
> +        case POWERPC_EXCP_BOOKE:
> +            srr0 = SPR_BOOKE_CSRR0;
> +            srr1 = SPR_BOOKE_CSRR1;
> +            break;
> +        default:
> +            break;
> +        }
> +        break;
> +    case POWERPC_EXCP_DTLB:      /* Data TLB error                           */
> +    case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
> +        break;
> +    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                          */
> +        if (env->flags & POWERPC_FLAG_DE) {
> +            /* FIXME: choose one or the other based on CPU type */
> +            srr0 = SPR_BOOKE_DSRR0;
> +            srr1 = SPR_BOOKE_DSRR1;
> +
> +            env->spr[SPR_BOOKE_CSRR0] = env->nip;
> +            env->spr[SPR_BOOKE_CSRR1] = msr;
> +
> +            /* DBSR already modified by caller */
> +        } else {
> +            cpu_abort(cs, "Debug exception triggered on unsupported model\n");
> +        }
> +        break;
> +    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
> +        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
> +        break;
> +    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
> +        break;
> +    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
> +        srr0 = SPR_BOOKE_CSRR0;
> +        srr1 = SPR_BOOKE_CSRR1;
> +        break;
> +    case POWERPC_EXCP_RESET:     /* System reset exception                   */
> +        /* A power-saving exception sets ME, otherwise it is unchanged */
> +        if (msr_pow) {
> +            /* indicate that we resumed from power save mode */
> +            msr |= 0x10000;
> +            new_msr |= ((target_ulong)1 << MSR_ME);
> +        }
> +        if (env->msr_mask & MSR_HVB) {
> +            /*
> +             * ISA specifies HV, but can be delivered to guest with HV
> +             * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
> +             */
> +            new_msr |= (target_ulong)MSR_HVB;
> +        } else {
> +            if (msr_pow) {
> +                cpu_abort(cs, "Trying to deliver power-saving system reset "
> +                          "exception %d with no HV support\n", excp);
> +            }
> +        }
> +        break;
> +    case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
> +    case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
> +    case POWERPC_EXCP_TRACE:     /* Trace exception                          */
> +        break;
> +    case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage exception */
> +        msr |= env->error_code;
> +        /* fall through */
> +    case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
> +    case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
> +    case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception        */
> +    case POWERPC_EXCP_HISEG:     /* Hypervisor instruction segment exception */
> +    case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt            */
> +    case POWERPC_EXCP_HV_EMU:
> +    case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
> +        srr0 = SPR_HSRR0;
> +        srr1 = SPR_HSRR1;
> +        new_msr |= (target_ulong)MSR_HVB;
> +        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
> +        break;
> +    case POWERPC_EXCP_VPU:       /* Vector unavailable exception             */
> +    case POWERPC_EXCP_VSXU:       /* VSX unavailable exception               */
> +    case POWERPC_EXCP_FU:         /* Facility unavailable exception          */
> +#ifdef TARGET_PPC64
> +        env->spr[SPR_FSCR] |= ((target_ulong)env->error_code << 56);
> +#endif
> +        break;
> +    case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exception */
> +#ifdef TARGET_PPC64
> +        env->spr[SPR_HFSCR] |= ((target_ulong)env->error_code << FSCR_IC_POS);
> +        srr0 = SPR_HSRR0;
> +        srr1 = SPR_HSRR1;
> +        new_msr |= (target_ulong)MSR_HVB;
> +        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
> +#endif
> +        break;
> +    case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
> +        trace_ppc_excp_print("PIT");
> +        break;
> +    case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
> +    case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
> +    case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
> +        switch (excp_model) {
> +        case POWERPC_EXCP_602:
> +        case POWERPC_EXCP_603:
> +        case POWERPC_EXCP_G2:
> +            /* Swap temporary saved registers with GPRs */
> +            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
> +                new_msr |= (target_ulong)1 << MSR_TGPR;
> +                hreg_swap_gpr_tgpr(env);
> +            }
> +            /* fall through */
> +        case POWERPC_EXCP_7x5:
> +            ppc_excp_debug_sw_tlb(env, excp);
> +
> +            msr |= env->crf[0] << 28;
> +            msr |= env->error_code; /* key, D/I, S/L bits */
> +            /* Set way using a LRU mechanism */
> +            msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
> +            break;
> +        default:
> +            cpu_abort(cs, "Invalid TLB miss exception\n");
> +            break;
> +        }
> +        break;
> +    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
> +    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interrupt  */
> +    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interrupt   */
> +    case POWERPC_EXCP_IO:        /* IO error exception                       */
> +    case POWERPC_EXCP_RUNM:      /* Run mode exception                       */
> +    case POWERPC_EXCP_EMUL:      /* Emulation trap exception                 */
> +    case POWERPC_EXCP_FPA:       /* Floating-point assist exception          */
> +    case POWERPC_EXCP_DABR:      /* Data address breakpoint                  */
> +    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
> +    case POWERPC_EXCP_SMI:       /* System management interrupt              */
> +    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
> +    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
> +    case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
> +    case POWERPC_EXCP_SOFTP:     /* Soft patch exception                     */
> +    case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
> +    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint             */
> +    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint         */
> +        cpu_abort(cs, "%s exception not implemented\n",
> +                  powerpc_excp_name(excp));
> +        break;
> +    default:
> +    excp_invalid:
> +        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> +        break;
> +    }
> +
> +    /* Sanity check */
> +    if (!(env->msr_mask & MSR_HVB)) {
> +        if (new_msr & MSR_HVB) {
> +            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
> +                      "no HV support\n", excp);
> +        }
> +        if (srr0 == SPR_HSRR0) {
> +            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
> +                      "no HV support\n", excp);
> +        }
> +    }
> +
> +    /*
> +     * Sort out endianness of interrupt, this differs depending on the
> +     * CPU, the HV mode, etc...
> +     */
> +    if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
> +        new_msr |= (target_ulong)1 << MSR_LE;
> +    }
> +
> +#if defined(TARGET_PPC64)
> +    if (excp_model == POWERPC_EXCP_BOOKE) {
> +        if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
> +            /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
> +            new_msr |= (target_ulong)1 << MSR_CM;
> +        } else {
> +            vector = (uint32_t)vector;
> +        }
> +    } else {
> +        if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
> +            vector = (uint32_t)vector;
> +        } else {
> +            new_msr |= (target_ulong)1 << MSR_SF;
> +        }
> +    }
> +#endif
> +
> +    if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
> +        /* Save PC */
> +        env->spr[srr0] = env->nip;
> +
> +        /* Save MSR */
> +        env->spr[srr1] = msr;
> +    }
> +
> +    /* This can update new_msr and vector if AIL applies */
> +    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
> +
> +    powerpc_set_excp_state(cpu, vector, new_msr);
> +}
> +
>   /*
>    * Note that this function should be greatly optimized when called
>    * with a constant excp, from ppc_hw_interrupt
> @@ -1034,6 +1505,13 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
>       case POWERPC_EXCP_40x:
>           powerpc_excp_40x(cpu, excp);
>           break;
> +    case POWERPC_EXCP_970:
> +    case POWERPC_EXCP_POWER7:
> +    case POWERPC_EXCP_POWER8:
> +    case POWERPC_EXCP_POWER9:
> +    case POWERPC_EXCP_POWER10:
> +        powerpc_excp_books(cpu, excp);
> +        break;
>       default:
>           powerpc_excp_legacy(cpu, excp);
>       }
> 



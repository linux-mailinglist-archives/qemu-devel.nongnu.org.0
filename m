Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7909C4C9873
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:43:06 +0100 (CET)
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPBCy-00013x-EI
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:43:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nPB6a-0003yD-0F; Tue, 01 Mar 2022 17:36:28 -0500
Received: from [2001:738:2001:2001::2001] (port=14396 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nPB6W-0007hE-5O; Tue, 01 Mar 2022 17:36:27 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D92AA746399;
 Tue,  1 Mar 2022 23:36:17 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A20B7746381; Tue,  1 Mar 2022 23:36:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9F4E8746353;
 Tue,  1 Mar 2022 23:36:17 +0100 (CET)
Date: Tue, 1 Mar 2022 23:36:17 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 03/17] target/ppc: Move 40x CPUs code to their own file
In-Reply-To: <20220301135620.2411952-4-farosas@linux.ibm.com>
Message-ID: <941e7add-aa94-d6d8-11dc-6eb8dffc3c@eik.bme.hu>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
 <20220301135620.2411952-4-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, 1 Mar 2022, Fabiano Rosas wrote:
> Affects the 405 CPU.
>
> This moves init_proc, init_excp and register_*sprs functions that are
> related to the 40x CPUs (currently only 405) into a separate file.
>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
> target/ppc/cpu_40x.c   | 263 +++++++++++++++++++++++++++++++++++++++++
> target/ppc/cpu_init.c  | 250 ---------------------------------------
> target/ppc/meson.build |   1 +
> 3 files changed, 264 insertions(+), 250 deletions(-)
> create mode 100644 target/ppc/cpu_40x.c
>
> diff --git a/target/ppc/cpu_40x.c b/target/ppc/cpu_40x.c
> new file mode 100644
> index 0000000000..4ed2cbc305
> --- /dev/null
> +++ b/target/ppc/cpu_40x.c
> @@ -0,0 +1,263 @@
> +/*
> + * CPU initialization for PowerPC 40x CPUs
> + *
> + *  Copyright IBM Corp. 2022

I think you can't replace the copyright when moving code. You have to 
retain the original header and maybe you can add your own if you change or 
rewrite it. You can only drop old copyright it you've completely replaced 
the content.

Regards,
BALATON Zoltan

> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/ppc/ppc.h"
> +#include "cpu.h"
> +#include "spr_common.h"
> +
> +/* SPR shared between PowerPC 40x implementations */
> +static void register_40x_sprs(CPUPPCState *env)
> +{
> +    /* Cache */
> +    /* not emulated, as QEMU do not emulate caches */
> +    spr_register(env, SPR_40x_DCCR, "DCCR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    /* not emulated, as QEMU do not emulate caches */
> +    spr_register(env, SPR_40x_ICCR, "ICCR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    /* not emulated, as QEMU do not emulate caches */
> +    spr_register(env, SPR_BOOKE_ICDBDR, "ICDBDR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, SPR_NOACCESS,
> +                 0x00000000);
> +    /* Exception */
> +    spr_register(env, SPR_40x_DEAR, "DEAR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_40x_ESR, "ESR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_40x_EVPR, "EVPR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_excp_prefix,
> +                 0x00000000);
> +    spr_register(env, SPR_40x_SRR2, "SRR2",
> +                 &spr_read_generic, &spr_write_generic,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_40x_SRR3, "SRR3",
> +                 &spr_read_generic, &spr_write_generic,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    /* Timers */
> +    spr_register(env, SPR_40x_PIT, "PIT",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_40x_pit, &spr_write_40x_pit,
> +                 0x00000000);
> +    spr_register(env, SPR_40x_TCR, "TCR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_40x_tcr,
> +                 0x00000000);
> +    spr_register(env, SPR_40x_TSR, "TSR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_40x_tsr,
> +                 0x00000000);
> +}
> +
> +/* SPR specific to PowerPC 405 implementation */
> +static void register_405_sprs(CPUPPCState *env)
> +{
> +    /* MMU */
> +    spr_register(env, SPR_40x_PID, "PID",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_40x_pid,
> +                 0x00000000);
> +    spr_register(env, SPR_4xx_CCR0, "CCR0",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00700000);
> +    /* Debug interface */
> +    spr_register(env, SPR_40x_DBCR0, "DBCR0",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_40x_dbcr0,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_405_DBCR1, "DBCR1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_40x_DBSR, "DBSR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_clear,
> +                 /* Last reset was system reset */
> +                 0x00000300);
> +
> +    spr_register(env, SPR_40x_DAC1, "DAC1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_40x_DAC2, "DAC2",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_405_DVC1, "DVC1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_405_DVC2, "DVC2",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_40x_IAC1, "IAC1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_40x_IAC2, "IAC2",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_405_IAC3, "IAC3",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_405_IAC4, "IAC4",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    /* Storage control */
> +    spr_register(env, SPR_405_SLER, "SLER",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_40x_sler,
> +                 0x00000000);
> +    spr_register(env, SPR_40x_ZPR, "ZPR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_405_SU0R, "SU0R",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    /* SPRG */
> +    spr_register(env, SPR_USPRG0, "USPRG0",
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 0x00000000);
> +    spr_register(env, SPR_SPRG4, "SPRG4",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_SPRG5, "SPRG5",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_SPRG6, "SPRG6",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_SPRG7, "SPRG7",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    /* Bus access control */
> +    /* not emulated, as QEMU never does speculative access */
> +    spr_register(env, SPR_40x_SGR, "SGR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0xFFFFFFFF);
> +    /* not emulated, as QEMU do not emulate caches */
> +    spr_register(env, SPR_40x_DCWR, "DCWR",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +}
> +
> +static void init_excp_4xx_softmmu(CPUPPCState *env)
> +{
> +#if !defined(CONFIG_USER_ONLY)
> +    env->excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000100;
> +    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
> +    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000300;
> +    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000400;
> +    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
> +    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
> +    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
> +    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
> +    env->excp_vectors[POWERPC_EXCP_PIT]      = 0x00001000;
> +    env->excp_vectors[POWERPC_EXCP_FIT]      = 0x00001010;
> +    env->excp_vectors[POWERPC_EXCP_WDT]      = 0x00001020;
> +    env->excp_vectors[POWERPC_EXCP_DTLB]     = 0x00001100;
> +    env->excp_vectors[POWERPC_EXCP_ITLB]     = 0x00001200;
> +    env->excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00002000;
> +    env->ivor_mask = 0x0000FFF0UL;
> +    env->ivpr_mask = 0xFFFF0000UL;
> +    /* Hardware reset vector */
> +    env->hreset_vector = 0xFFFFFFFCUL;
> +#endif
> +}
> +
> +static void init_proc_405(CPUPPCState *env)
> +{
> +    register_40x_sprs(env);
> +    register_405_sprs(env);
> +    register_usprgh_sprs(env);
> +
> +    /* Memory management */
> +#if !defined(CONFIG_USER_ONLY)
> +    env->nb_tlb = 64;
> +    env->nb_ways = 1;
> +    env->id_tlbs = 0;
> +    env->tlb_type = TLB_EMB;
> +#endif
> +    init_excp_4xx_softmmu(env);
> +    env->dcache_line_size = 32;
> +    env->icache_line_size = 32;
> +    /* Allocate hardware IRQ controller */
> +    ppc40x_irq_init(env_archcpu(env));
> +
> +    SET_FIT_PERIOD(8, 12, 16, 20);
> +    SET_WDT_PERIOD(16, 20, 24, 28);
> +}
> +
> +POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
> +
> +    dc->desc = "PowerPC 405";
> +    pcc->init_proc = init_proc_405;
> +    pcc->check_pow = check_pow_nocheck;
> +    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
> +                       PPC_DCR | PPC_WRTEE |
> +                       PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
> +                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
> +                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> +                       PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
> +                       PPC_4xx_COMMON | PPC_405_MAC | PPC_40x_EXCP;
> +    pcc->msr_mask = (1ull << MSR_WE) |
> +                    (1ull << MSR_CE) |
> +                    (1ull << MSR_EE) |
> +                    (1ull << MSR_PR) |
> +                    (1ull << MSR_FP) |
> +                    (1ull << MSR_ME) |
> +                    (1ull << MSR_DWE) |
> +                    (1ull << MSR_DE) |
> +                    (1ull << MSR_IR) |
> +                    (1ull << MSR_DR);
> +    pcc->mmu_model = POWERPC_MMU_SOFT_4xx;
> +    pcc->excp_model = POWERPC_EXCP_40x;
> +    pcc->bus_model = PPC_FLAGS_INPUT_405;
> +    pcc->bfd_mach = bfd_mach_ppc_403;
> +    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DWE |
> +                 POWERPC_FLAG_DE | POWERPC_FLAG_BUS_CLK;
> +}
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 073fd10168..28c017b048 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -1081,177 +1081,6 @@ static void register_440_sprs(CPUPPCState *env)
>                  0x00000000);
> }
>
> -/* SPR shared between PowerPC 40x implementations */
> -static void register_40x_sprs(CPUPPCState *env)
> -{
> -    /* Cache */
> -    /* not emulated, as QEMU do not emulate caches */
> -    spr_register(env, SPR_40x_DCCR, "DCCR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* not emulated, as QEMU do not emulate caches */
> -    spr_register(env, SPR_40x_ICCR, "ICCR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* not emulated, as QEMU do not emulate caches */
> -    spr_register(env, SPR_BOOKE_ICDBDR, "ICDBDR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, SPR_NOACCESS,
> -                 0x00000000);
> -    /* Exception */
> -    spr_register(env, SPR_40x_DEAR, "DEAR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_40x_ESR, "ESR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_40x_EVPR, "EVPR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_excp_prefix,
> -                 0x00000000);
> -    spr_register(env, SPR_40x_SRR2, "SRR2",
> -                 &spr_read_generic, &spr_write_generic,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_40x_SRR3, "SRR3",
> -                 &spr_read_generic, &spr_write_generic,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* Timers */
> -    spr_register(env, SPR_40x_PIT, "PIT",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_40x_pit, &spr_write_40x_pit,
> -                 0x00000000);
> -    spr_register(env, SPR_40x_TCR, "TCR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_40x_tcr,
> -                 0x00000000);
> -    spr_register(env, SPR_40x_TSR, "TSR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_40x_tsr,
> -                 0x00000000);
> -}
> -
> -/* SPR specific to PowerPC 405 implementation */
> -static void register_405_sprs(CPUPPCState *env)
> -{
> -    /* MMU */
> -    spr_register(env, SPR_40x_PID, "PID",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_40x_pid,
> -                 0x00000000);
> -    spr_register(env, SPR_4xx_CCR0, "CCR0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00700000);
> -    /* Debug interface */
> -    spr_register(env, SPR_40x_DBCR0, "DBCR0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_40x_dbcr0,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_405_DBCR1, "DBCR1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_40x_DBSR, "DBSR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_clear,
> -                 /* Last reset was system reset */
> -                 0x00000300);
> -
> -    spr_register(env, SPR_40x_DAC1, "DAC1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_40x_DAC2, "DAC2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_405_DVC1, "DVC1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_405_DVC2, "DVC2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_40x_IAC1, "IAC1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_40x_IAC2, "IAC2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_405_IAC3, "IAC3",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_405_IAC4, "IAC4",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* Storage control */
> -    spr_register(env, SPR_405_SLER, "SLER",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_40x_sler,
> -                 0x00000000);
> -    spr_register(env, SPR_40x_ZPR, "ZPR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_405_SU0R, "SU0R",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* SPRG */
> -    spr_register(env, SPR_USPRG0, "USPRG0",
> -                 &spr_read_ureg, SPR_NOACCESS,
> -                 &spr_read_ureg, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_SPRG4, "SPRG4",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_SPRG5, "SPRG5",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_SPRG6, "SPRG6",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_SPRG7, "SPRG7",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    /* Bus access control */
> -    /* not emulated, as QEMU never does speculative access */
> -    spr_register(env, SPR_40x_SGR, "SGR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0xFFFFFFFF);
> -    /* not emulated, as QEMU do not emulate caches */
> -    spr_register(env, SPR_40x_DCWR, "DCWR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -}
> -
> -
> static void register_5xx_8xx_sprs(CPUPPCState *env)
> {
>     /* Exception processing */
> @@ -1637,29 +1466,6 @@ static void register_8xx_sprs(CPUPPCState *env)
>
> /*****************************************************************************/
> /* Exception vectors models                                                  */
> -static void init_excp_4xx_softmmu(CPUPPCState *env)
> -{
> -#if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_PIT]      = 0x00001000;
> -    env->excp_vectors[POWERPC_EXCP_FIT]      = 0x00001010;
> -    env->excp_vectors[POWERPC_EXCP_WDT]      = 0x00001020;
> -    env->excp_vectors[POWERPC_EXCP_DTLB]     = 0x00001100;
> -    env->excp_vectors[POWERPC_EXCP_ITLB]     = 0x00001200;
> -    env->excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00002000;
> -    env->ivor_mask = 0x0000FFF0UL;
> -    env->ivpr_mask = 0xFFFF0000UL;
> -    /* Hardware reset vector */
> -    env->hreset_vector = 0xFFFFFFFCUL;
> -#endif
> -}
>
> static void init_excp_MPC5xx(CPUPPCState *env)
> {
> @@ -2102,62 +1908,6 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
>     return 0;
> }
>
> -static void init_proc_405(CPUPPCState *env)
> -{
> -    register_40x_sprs(env);
> -    register_405_sprs(env);
> -    register_usprgh_sprs(env);
> -
> -    /* Memory management */
> -#if !defined(CONFIG_USER_ONLY)
> -    env->nb_tlb = 64;
> -    env->nb_ways = 1;
> -    env->id_tlbs = 0;
> -    env->tlb_type = TLB_EMB;
> -#endif
> -    init_excp_4xx_softmmu(env);
> -    env->dcache_line_size = 32;
> -    env->icache_line_size = 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc40x_irq_init(env_archcpu(env));
> -
> -    SET_FIT_PERIOD(8, 12, 16, 20);
> -    SET_WDT_PERIOD(16, 20, 24, 28);
> -}
> -
> -POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc = "PowerPC 405";
> -    pcc->init_proc = init_proc_405;
> -    pcc->check_pow = check_pow_nocheck;
> -    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
> -                       PPC_DCR | PPC_WRTEE |
> -                       PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
> -                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
> -                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
> -                       PPC_4xx_COMMON | PPC_405_MAC | PPC_40x_EXCP;
> -    pcc->msr_mask = (1ull << MSR_WE) |
> -                    (1ull << MSR_CE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_FP) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_DWE) |
> -                    (1ull << MSR_DE) |
> -                    (1ull << MSR_IR) |
> -                    (1ull << MSR_DR);
> -    pcc->mmu_model = POWERPC_MMU_SOFT_4xx;
> -    pcc->excp_model = POWERPC_EXCP_40x;
> -    pcc->bus_model = PPC_FLAGS_INPUT_405;
> -    pcc->bfd_mach = bfd_mach_ppc_403;
> -    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DWE |
> -                 POWERPC_FLAG_DE | POWERPC_FLAG_BUS_CLK;
> -}
> -
> static void init_proc_440EP(CPUPPCState *env)
> {
>     register_BookE_sprs(env, 0x000000000000FFFFULL);
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index 79beaff147..45f7802da5 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -3,6 +3,7 @@ ppc_ss.add(files(
>   'cpu-models.c',
>   'cpu.c',
>   'cpu_init.c',
> +  'cpu_40x.c',
>   'excp_helper.c',
>   'gdbstub.c',
>   'helper_regs.c',
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B52473547
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 20:53:29 +0100 (CET)
Received: from localhost ([::1]:47202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwrO4-0006eM-T5
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 14:53:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mwrM6-0004tV-3C; Mon, 13 Dec 2021 14:51:26 -0500
Received: from [2001:738:2001:2001::2001] (port=14578 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mwrM2-0002Dx-Uk; Mon, 13 Dec 2021 14:51:25 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1896B7475FA;
 Mon, 13 Dec 2021 20:51:16 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D7FD57463B7; Mon, 13 Dec 2021 20:51:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D6C4E746333;
 Mon, 13 Dec 2021 20:51:15 +0100 (CET)
Date: Mon, 13 Dec 2021 20:51:15 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH] target/ppc: Fix e6500 boot
In-Reply-To: <20211213133542.2608540-1-farosas@linux.ibm.com>
Message-ID: <724f7563-f36c-2c37-3b94-951c3d922861@eik.bme.hu>
References: <20211213133542.2608540-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mario@locati.it, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Dec 2021, Fabiano Rosas wrote:
> When Altivec support was added to the e6500 kernel in 2012[1], the
> QEMU code was not changed, so we don't register the VPU/VPUA
> exceptions for the e6500:
>
>  qemu: fatal: Raised an exception without defined vector 73
>
> Note that the error message says 73, instead of 32, which is the IVOR
> for VPU. This is because QEMU knows only knows about the VPU interrupt

The word "knows" is repeated in the above line.

> for the 7400s. In theory, we should not be raising _that_ VPU
> interrupt, but instead another one specific for the e6500.
>
> We unfortunately cannot register e6500-specific VPU/VPUA interrupts
> because the SPEU/EFPDI interrupts also use IVOR32/33. These are
> present only in the e500v1/2 versions. From the user manual:
>
> e500v1, e500v2: only SPEU/EFPDI/EFPRI
> e500mc, e5500:  no SPEU/EFPDI/EFPRI/VPU/VPUA
> e6500:          only VPU/VPUA
>
> So I'm leaving IVOR32/33 as SPEU/EFPDI, but altering the dispatch code
> to convert the VPU #73 to a #32 when we're in the e6500. Since the
> handling for SPEU and VPU is the same this is the only change that's
> needed. The EFPDI is not implemented and will cause an abort. I don't
> think it worth it changing the error message to take VPUA into
> consideration, so I'm not changing anything there.
>
> This bug was discussed in the thread:
> https://lists.gnu.org/archive/html/qemu-ppc/2021-06/msg00222.html
>
> 1- https://git.kernel.org/torvalds/c/cd66cc2ee52
>
> Reported-by: <mario@locati.it>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
> target/ppc/cpu_init.c    |  6 ++++++
> target/ppc/excp_helper.c | 12 +++++++++++-
> 2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 6695985e9b..d8efcb24ed 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -2273,8 +2273,14 @@ static void init_excp_e200(CPUPPCState *env, target_ulong ivpr_mask)
>     env->excp_vectors[POWERPC_EXCP_DTLB]     = 0x00000000;
>     env->excp_vectors[POWERPC_EXCP_ITLB]     = 0x00000000;
>     env->excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00000000;
> +    /*
> +     * These two are the same IVOR as POWERPC_EXCP_VPU and

Maybe clearar to say "The next two" or even "SPEU and EFPDI are the 
same..." then no need for the extra empty line but not a big deal.

Regards,
BALATON Zoltan

> +     * POWERPC_EXCP_VPUA. We deal with that when dispatching at
> +     * powerpc_excp().
> +     */
>     env->excp_vectors[POWERPC_EXCP_SPEU]     = 0x00000000;
>     env->excp_vectors[POWERPC_EXCP_EFPDI]    = 0x00000000;
> +
>     env->excp_vectors[POWERPC_EXCP_EFPRI]    = 0x00000000;
>     env->ivor_mask = 0x0000FFF7UL;
>     env->ivpr_mask = ivpr_mask;
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 17607adbe4..7bb170f440 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -344,6 +344,16 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>         excp = POWERPC_EXCP_PROGRAM;
>     }
>
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
>     switch (excp) {
>     case POWERPC_EXCP_NONE:
>         /* Should never happen */
> @@ -569,7 +579,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>             cpu_abort(cs, "Debug exception triggered on unsupported model\n");
>         }
>         break;
> -    case POWERPC_EXCP_SPEU:      /* SPE/embedded floating-point unavailable  */
> +    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
>         env->spr[SPR_BOOKE_ESR] = ESR_SPV;
>         break;
>     case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626049EE06
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 23:23:35 +0100 (CET)
Received: from localhost ([::1]:52842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDDAz-0000cg-Sp
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 17:23:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDD7t-0007xr-Ux; Thu, 27 Jan 2022 17:20:22 -0500
Received: from [2001:738:2001:2001::2001] (port=62831 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDD7q-0000VD-Pc; Thu, 27 Jan 2022 17:20:21 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BFC207457EF;
 Thu, 27 Jan 2022 23:20:14 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4B7457456FE; Thu, 27 Jan 2022 23:20:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 498697456E3;
 Thu, 27 Jan 2022 23:20:14 +0100 (CET)
Date: Thu, 27 Jan 2022 23:20:14 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 6/8] target/ppc: 74xx: System Call exception cleanup
In-Reply-To: <20220127201116.1154733-7-farosas@linux.ibm.com>
Message-ID: <2438a5e8-31e8-d6be-39f6-6ec047c9abb5@eik.bme.hu>
References: <20220127201116.1154733-1-farosas@linux.ibm.com>
 <20220127201116.1154733-7-farosas@linux.ibm.com>
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022, Fabiano Rosas wrote:
> Remove the BookE code and add a comment explaining why we need to keep
> hypercall support even though this CPU does not have a hypervisor
> mode.

Thanks, this should do it. Just some small comments below.

> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
> target/ppc/excp_helper.c | 17 +++++++++++------
> 1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index bb17b65dc0..396e25ed35 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -556,7 +556,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
>     CPUState *cs = CPU(cpu);
>     CPUPPCState *env = &cpu->env;
>     target_ulong msr, new_msr, vector;
> -    int srr0, srr1, lev = -1;
> +    int srr0, srr1;
>
>     if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
>         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> @@ -669,7 +669,8 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
>         }
>         break;
>     case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
> -        lev = env->error_code;
> +    {
> +        int lev = env->error_code;
>
>         if ((lev == 1) && cpu->vhyp) {

In case you'll have another version, maybe drop the extra parenthesis 
around lev == here and below...

>             dump_hcall(env);
> @@ -683,17 +684,21 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
>          */
>         env->nip += 4;
>
> -        /* "PAPR mode" built-in hypercall emulation */
> +        /*
> +         * The Virtual Open Firmware (VOF) relies on the 'sc 1'
> +         * instruction to communicate with QEMU. The pegasos2 machine
> +         * uses VOF and the 74xx CPUs, so although the 74xx don't have
> +         * HV mode, we need to keep hypercall support.
> +         */
>         if ((lev == 1) && cpu->vhyp) {

...here. Or maybe even drop the lev local variable and just use 
env->error_code in the ifs directly? Only apprears twice now so could do 
without copying it to a local. But not a big deal so it's not worth a 
respin only for this.

Regards,
BALATON Zoltan

>             PPCVirtualHypervisorClass *vhc =
>                 PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
>             vhc->hypercall(cpu->vhyp, cpu);
>             return;
>         }
> -        if (lev == 1) {
> -            new_msr |= (target_ulong)MSR_HVB;
> -        }
> +
>         break;
> +    }
>     case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
>     case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
>         break;
>


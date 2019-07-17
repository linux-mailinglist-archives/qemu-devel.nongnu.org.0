Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B4D6C06D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 19:30:55 +0200 (CEST)
Received: from localhost ([::1]:59306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnnlV-00068M-VN
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 13:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40466)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <groug@kaod.org>) id 1hnnlH-0005bM-Qp
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 13:30:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1hnnlG-0002ir-Mu
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 13:30:39 -0400
Received: from 9.mo179.mail-out.ovh.net ([46.105.76.148]:42783)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1hnnlG-0002h4-F8
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 13:30:38 -0400
Received: from player728.ha.ovh.net (unknown [10.108.57.38])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id CC51613AF0C
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 19:30:35 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id 07F987F693B3;
 Wed, 17 Jul 2019 17:30:28 +0000 (UTC)
Date: Wed, 17 Jul 2019 19:30:27 +0200
From: Greg Kurz <groug@kaod.org>
To: Nicholas Piggin <npiggin@gmail.com>
Message-ID: <20190717193027.0fce5b06@bahia.lab.toulouse-stg.fr.ibm.com>
In-Reply-To: <20190717053952.13729-5-npiggin@gmail.com>
References: <20190717053952.13729-1-npiggin@gmail.com>
 <20190717053952.13729-5-npiggin@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6573848084541446595
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrieefgdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.76.148
Subject: Re: [Qemu-devel] [PATCH v5 4/4] spapr: Implement H_JOIN
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Jul 2019 15:39:52 +1000
Nicholas Piggin <npiggin@gmail.com> wrote:

> This has been useful to modify and test the Linux pseries suspend
> code but it requires modification to the guest to call it (due to
> being gated by other unimplemented features). It is not otherwise
> used by Linux yet, but work is slowly progressing there.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Changes since v4:
> - Style
> 
>  hw/ppc/spapr.c       |  1 +
>  hw/ppc/spapr_hcall.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 13c423347e..59cd24f9c3 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1066,6 +1066,7 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
>      add_str(hypertas, "hcall-tce");
>      add_str(hypertas, "hcall-vio");
>      add_str(hypertas, "hcall-splpar");
> +    add_str(hypertas, "hcall-join");
>      add_str(hypertas, "hcall-bulk");
>      add_str(hypertas, "hcall-set-mode");
>      add_str(hypertas, "hcall-sprg0");
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 5e655172b2..57c1ee0fe1 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1069,6 +1069,48 @@ static target_ulong h_cede(PowerPCCPU *cpu, SpaprMachineState *spapr,
>      return H_SUCCESS;
>  }
>  
> +static target_ulong h_join(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                           target_ulong opcode, target_ulong *args)
> +{
> +    CPUPPCState *env = &cpu->env;
> +    CPUState *cs;
> +    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
> +    bool last_unjoined = true;
> +
> +    if (env->msr & (1ULL << MSR_EE)) {
> +        return H_BAD_MODE;
> +    }
> +
> +    if (spapr_cpu->prod) {
> +        spapr_cpu->prod = false;
> +        return H_SUCCESS;
> +    }
> +

PAPR says that H_JOIN "performs the equivalent of a H_CONFER (proc=self)",
unless called by the last unjoined thread, in which case H_CONTINUE
should be returned. It thus seems that the spapr_cpu->prod check should
be done after the loop below otherwise if the last active thread was
just prodded (can happen?), it won't return the expected value, and...

> +    CPU_FOREACH(cs) {
> +        PowerPCCPU *c = POWERPC_CPU(cs);
> +        CPUPPCState *e = &c->env;
> +        if (c == cpu) {
> +            continue;
> +        }
> +
> +        /* Don't have a way to indicate joined, so use halted && MSR[EE]=0 */
> +        if (!cs->halted || (e->msr & (1ULL << MSR_EE))) {
> +            last_unjoined = false;
> +            break;
> +        }
> +    }
> +    if (last_unjoined) {
> +        return H_CONTINUE;
> +    }
> +
> +    cs = CPU(cpu);
> +    cs->halted = 1;
> +    cs->exception_index = EXCP_HALTED;
> +    cs->exit_request = 1;
> +
> +    return H_SUCCESS;

... then, you can maybe factor out this code to an h_confer_self()
helper to be called by h_join() and h_confer() ?

> +}
> +
>  static target_ulong h_confer(PowerPCCPU *cpu, SpaprMachineState *spapr,
>                             target_ulong opcode, target_ulong *args)
>  {
> @@ -1979,6 +2021,9 @@ static void hypercall_register_types(void)
>      spapr_register_hypercall(H_CONFER, h_confer);
>      spapr_register_hypercall(H_PROD, h_prod);
>  
> +    /* hcall-join */
> +    spapr_register_hypercall(H_JOIN, h_join);
> +
>      spapr_register_hypercall(H_SIGNAL_SYS_RESET, h_signal_sys_reset);
>  
>      /* processor register resource access h-calls */



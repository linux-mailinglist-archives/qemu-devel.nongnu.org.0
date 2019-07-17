Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E59E6BD15
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 15:34:24 +0200 (CEST)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnk4c-0008RP-Ez
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 09:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52673)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hnk4M-0007rO-Sc
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:34:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hnk4L-0005cD-Ta
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:34:06 -0400
Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]:45657)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hnk4L-0005bQ-MJ
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:34:05 -0400
Received: from player758.ha.ovh.net (unknown [10.108.54.209])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 346EC1A43E3
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 15:34:02 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 4B59B81088C0;
 Wed, 17 Jul 2019 13:33:55 +0000 (UTC)
To: Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20190717053952.13729-1-npiggin@gmail.com>
 <20190717053952.13729-3-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <87ead8b1-45a6-28ff-2ba6-d1afc5326ec0@kaod.org>
Date: Wed, 17 Jul 2019 15:33:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717053952.13729-3-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2578592263001443225
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrieefgdegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.63.121
Subject: Re: [Qemu-devel] [PATCH v5 2/4] spapr: Implement H_PROD
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/07/2019 07:39, Nicholas Piggin wrote:
> H_PROD is added, and H_CEDE is modified to test the prod bit
> according to PAPR.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  hw/ppc/spapr_hcall.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index e615881ac4..8b208ab259 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1050,14 +1050,41 @@ static target_ulong h_cede(PowerPCCPU *cpu, SpaprMachineState *spapr,
>  {
>      CPUPPCState *env = &cpu->env;
>      CPUState *cs = CPU(cpu);
> +    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
>  
>      env->msr |= (1ULL << MSR_EE);
>      hreg_compute_hflags(env);
> +
> +    if (spapr_cpu->prod) {
> +        spapr_cpu->prod = false;
> +        return H_SUCCESS;
> +    }
> +
>      if (!cpu_has_work(cs)) {
>          cs->halted = 1;
>          cs->exception_index = EXCP_HLT;

Shouldn't that be EXCP_HALTED instead ? 

commit 1dd088946cf4 seems to say that h_cede is equivalent to the hlt 
instruction on x86 but in 7 years things have changed.

C. 

>          cs->exit_request = 1;
>      }
> +
> +    return H_SUCCESS;
> +}
> +
> +static target_ulong h_prod(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                           target_ulong opcode, target_ulong *args)
> +{
> +    target_long target = args[0];
> +    CPUState *cs;
> +    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
> +
> +    cs = CPU(spapr_find_cpu(target));
> +    if (!cs) {
> +        return H_PARAMETER;
> +    }
> +
> +    spapr_cpu->prod = true;
> +    cs->halted = 0;
> +    qemu_cpu_kick(cs);
> +
>      return H_SUCCESS;
>  }
>  
> @@ -1882,6 +1909,8 @@ static void hypercall_register_types(void)
>      /* hcall-splpar */
>      spapr_register_hypercall(H_REGISTER_VPA, h_register_vpa);
>      spapr_register_hypercall(H_CEDE, h_cede);
> +    spapr_register_hypercall(H_PROD, h_prod);
> +
>      spapr_register_hypercall(H_SIGNAL_SYS_RESET, h_signal_sys_reset);
>  
>      /* processor register resource access h-calls */
> 



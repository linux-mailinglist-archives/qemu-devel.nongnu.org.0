Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3271A17F0B4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 07:42:45 +0100 (CET)
Received: from localhost ([::1]:54146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBYbE-00057Z-2e
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 02:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44465)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jBYaT-0004br-SM
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 02:41:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jBYaS-0005qb-EM
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 02:41:57 -0400
Received: from 6.mo179.mail-out.ovh.net ([46.105.56.76]:53412)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jBYaS-0005m1-8q
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 02:41:56 -0400
Received: from player739.ha.ovh.net (unknown [10.110.171.125])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 733C815E58C
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 07:41:54 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player739.ha.ovh.net (Postfix) with ESMTPSA id 2EE93C36DBE7;
 Tue, 10 Mar 2020 06:41:47 +0000 (UTC)
Subject: Re: [PATCH qemu v8 1/3] ppc/spapr: Move GPRs setup to one place
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org
References: <20200310050733.29805-1-aik@ozlabs.ru>
 <20200310050733.29805-2-aik@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0365dff7-7135-7118-3e12-e07472e9937d@kaod.org>
Date: Tue, 10 Mar 2020 07:41:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310050733.29805-2-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 3941212626391436262
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudduledgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.56.76
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/20 6:07 AM, Alexey Kardashevskiy wrote:
> At the moment "pseries" starts in SLOF which only expects the FDT blob
> pointer in r3. As we are going to introduce a OpenFirmware support in
> QEMU, we will be booting OF clients directly and these expect a stack
> pointer in r1, Linux looks at r3/r4 for the initramdisk location
> (although vmlinux can find this from the device tree but zImage from
> distro kernels cannot).
> 
> This extends spapr_cpu_set_entry_state() to take more registers. This
> should cause no behavioral change.

LGTM, one question below.

> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> Changes:
> v7:
> * removed r5 as it points to prom entry which is now provided by
> a new firmware in later patches
> ---
>  include/hw/ppc/spapr_cpu_core.h | 4 +++-
>  hw/ppc/spapr.c                  | 2 +-
>  hw/ppc/spapr_cpu_core.c         | 6 +++++-
>  hw/ppc/spapr_rtas.c             | 2 +-
>  4 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
> index 1c4cc6559c52..7aed8f555b4f 100644
> --- a/include/hw/ppc/spapr_cpu_core.h
> +++ b/include/hw/ppc/spapr_cpu_core.h
> @@ -40,7 +40,9 @@ typedef struct SpaprCpuCoreClass {
>  } SpaprCpuCoreClass;
>  
>  const char *spapr_get_cpu_core_type(const char *cpu_type);
> -void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip, target_ulong r3);
> +void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip,
> +                               target_ulong r1, target_ulong r3,
> +                               target_ulong r4);
>  
>  typedef struct SpaprCpuState {
>      uint64_t vpa_addr;
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 2eb0d8f70de6..64bc8b83e91e 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1698,7 +1698,7 @@ static void spapr_machine_reset(MachineState *machine)
>      spapr->fdt_blob = fdt;
>  
>      /* Set up the entry state */
> -    spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT, fdt_addr);
> +    spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT, 0, fdt_addr, 0);
>      first_ppc_cpu->env.gpr[5] = 0;


Why is this done in the machine reset handler and not in the CPU reset 
handler ? 

C. 


>      spapr->cas_reboot = false;
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 36ed3a2b665b..ac1c10942771 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -76,13 +76,17 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
>      spapr_irq_cpu_intc_reset(spapr, cpu);
>  }
>  
> -void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip, target_ulong r3)
> +void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip,
> +                               target_ulong r1, target_ulong r3,
> +                               target_ulong r4)
>  {
>      PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
>      CPUPPCState *env = &cpu->env;
>  
>      env->nip = nip;
> +    env->gpr[1] = r1;
>      env->gpr[3] = r3;
> +    env->gpr[4] = r4;
>      kvmppc_set_reg_ppc_online(cpu, 1);
>      CPU(cpu)->halted = 0;
>      /* Enable Power-saving mode Exit Cause exceptions */
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 656fdd221665..fe83b50c6629 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -190,7 +190,7 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
>       */
>      newcpu->env.tb_env->tb_offset = callcpu->env.tb_env->tb_offset;
>  
> -    spapr_cpu_set_entry_state(newcpu, start, r3);
> +    spapr_cpu_set_entry_state(newcpu, start, 0, r3, 0);
>  
>      qemu_cpu_kick(CPU(newcpu));
>  
> 



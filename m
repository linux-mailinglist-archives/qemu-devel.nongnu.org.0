Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7821192F07
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 18:19:07 +0100 (CET)
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH9gI-0004lW-Rf
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 13:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58681)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1jH9fF-00042M-CF
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 13:18:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1jH9fD-0006ti-Uj
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 13:18:01 -0400
Received: from 8.mo4.mail-out.ovh.net ([188.165.33.112]:53902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1jH9fD-0006sZ-Ob
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 13:17:59 -0400
Received: from player716.ha.ovh.net (unknown [10.108.54.141])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id A147922C1B7
 for <qemu-devel@nongnu.org>; Wed, 25 Mar 2020 18:17:57 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player716.ha.ovh.net (Postfix) with ESMTPSA id 926FA10B7BFEC;
 Wed, 25 Mar 2020 17:17:48 +0000 (UTC)
Date: Wed, 25 Mar 2020 18:17:47 +0100
From: Greg Kurz <groug@kaod.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/4] ppc/spapr: KVM FWNMI should not be enabled until
 guest requests it
Message-ID: <20200325181747.3d6a7a2c@bahia.lan>
In-Reply-To: <20200325142906.221248-2-npiggin@gmail.com>
References: <20200325142906.221248-1-npiggin@gmail.com>
 <20200325142906.221248-2-npiggin@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10539830503800674755
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudehgedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.33.112
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Mar 2020 00:29:03 +1000
Nicholas Piggin <npiggin@gmail.com> wrote:

> The KVM FWNMI capability should be enabled with the "ibm,nmi-register"
> rtas call. Although MCEs from KVM will be delivered as architected
> interrupts to the guest before "ibm,nmi-register" is called, KVM has
> different behaviour depending on whether the guest has enabled FWNMI
> (it attempts to do more recovery on behalf of a non-FWNMI guest).
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_caps.c  | 7 ++++---
>  hw/ppc/spapr_rtas.c  | 7 +++++++
>  target/ppc/kvm.c     | 7 +++++++
>  target/ppc/kvm_ppc.h | 6 ++++++
>  4 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 679ae7959f..eb54f94227 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -517,9 +517,10 @@ static void cap_fwnmi_apply(SpaprMachineState *spapr, uint8_t val,
>      }
>  
>      if (kvm_enabled()) {
> -        if (kvmppc_set_fwnmi() < 0) {
> -            error_setg(errp, "Firmware Assisted Non-Maskable Interrupts(FWNMI) "
> -                             "not supported by KVM");
> +        if (!kvmppc_get_fwnmi()) {
> +            error_setg(errp,
> +"Firmware Assisted Non-Maskable Interrupts(FWNMI) not supported by KVM.");
> +            error_append_hint(errp, "Try appending -machine cap-fwnmi=off\n");
>          }
>      }
>  }
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 9fb8c8632a..29abe66d01 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -437,6 +437,13 @@ static void rtas_ibm_nmi_register(PowerPCCPU *cpu,
>          return;
>      }
>  
> +    if (kvm_enabled()) {
> +        if (kvmppc_set_fwnmi() < 0) {
> +            rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
> +            return;
> +        }
> +    }
> +
>      spapr->fwnmi_system_reset_addr = sreset_addr;
>      spapr->fwnmi_machine_check_addr = mce_addr;
>  
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 597f72be1b..03d0667e8f 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -88,6 +88,7 @@ static int cap_ppc_safe_indirect_branch;
>  static int cap_ppc_count_cache_flush_assist;
>  static int cap_ppc_nested_kvm_hv;
>  static int cap_large_decr;
> +static int cap_fwnmi;
>  
>  static uint32_t debug_inst_opcode;
>  
> @@ -136,6 +137,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>      kvmppc_get_cpu_characteristics(s);
>      cap_ppc_nested_kvm_hv = kvm_vm_check_extension(s, KVM_CAP_PPC_NESTED_HV);
>      cap_large_decr = kvmppc_get_dec_bits();
> +    cap_fwnmi = kvm_vm_check_extension(s, KVM_CAP_PPC_FWNMI);
>      /*
>       * Note: setting it to false because there is not such capability
>       * in KVM at this moment.
> @@ -2064,6 +2066,11 @@ void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy)
>      }
>  }
>  
> +bool kvmppc_get_fwnmi(void)
> +{
> +    return cap_fwnmi;
> +}
> +
>  int kvmppc_set_fwnmi(void)
>  {
>      PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index 332fa0aa1c..fcaf745516 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -27,6 +27,7 @@ void kvmppc_enable_h_page_init(void);
>  void kvmppc_set_papr(PowerPCCPU *cpu);
>  int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
>  void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
> +bool kvmppc_get_fwnmi(void);
>  int kvmppc_set_fwnmi(void);
>  int kvmppc_smt_threads(void);
>  void kvmppc_error_append_smt_possible_hint(Error *const *errp);
> @@ -163,6 +164,11 @@ static inline void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy)
>  {
>  }
>  
> +static inline bool kvmppc_get_fwnmi(void)
> +{
> +    return false;
> +}
> +
>  static inline int kvmppc_set_fwnmi(void)
>  {
>      return -1;



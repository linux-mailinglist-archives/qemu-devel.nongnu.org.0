Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA59612481F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 14:24:03 +0100 (CET)
Received: from localhost ([::1]:54388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihZJ4-0005Ex-KQ
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 08:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ihZI8-0004en-CW
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 08:23:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ihZI6-0004pj-SM
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 08:23:03 -0500
Received: from 5.mo6.mail-out.ovh.net ([46.105.54.31]:48813)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ihZI6-0004by-Fg
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 08:23:02 -0500
Received: from player692.ha.ovh.net (unknown [10.108.1.191])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 0908D1EF6EA
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 14:22:59 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player692.ha.ovh.net (Postfix) with ESMTPSA id 4A2D8D50F8FB;
 Wed, 18 Dec 2019 13:22:50 +0000 (UTC)
Date: Wed, 18 Dec 2019 14:22:49 +0100
From: Greg Kurz <groug@kaod.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v3 ppc-for-5.0 2/2] ppc/spapr: Support reboot of secure
 pseries guest
Message-ID: <20191218142249.6bcf5ab4@bahia.lan>
In-Reply-To: <20191218043208.28613-3-bharata@linux.ibm.com>
References: <20191218043208.28613-1-bharata@linux.ibm.com>
 <20191218043208.28613-3-bharata@linux.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2896658987212970486
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddtledggeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelvddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.54.31
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
Cc: paulus@ozlabs.org, qemu-ppc@nongnu.org, linuxram@us.ibm.com,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Dec 2019 10:02:08 +0530
Bharata B Rao <bharata@linux.ibm.com> wrote:

> A pseries guest can be run as a secure guest on Ultravisor-enabled
> POWER platforms. When such a secure guest is reset, we need to
> release/reset a few resources both on ultravisor and hypervisor side.
> This is achieved by invoking this new ioctl KVM_PPC_SVM_OFF from the
> machine reset path.
> 
> As part of this ioctl, the secure guest is essentially transitioned
> back to normal mode so that it can reboot like a regular guest and
> become secure again.
> 
> This ioctl has no effect when invoked for a normal guest. If this ioctl
> fails for a secure guest, the guest is terminated.
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  hw/ppc/spapr.c       |  1 +
>  target/ppc/kvm.c     | 15 +++++++++++++++
>  target/ppc/kvm_ppc.h |  6 ++++++
>  3 files changed, 22 insertions(+)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index f11422fc41..e62c89b3dd 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1597,6 +1597,7 @@ static void spapr_machine_reset(MachineState *machine)
>      void *fdt;
>      int rc;
>  
> +    kvmppc_svm_off(&error_fatal);
>      spapr_caps_apply(spapr);
>  
>      first_ppc_cpu = POWERPC_CPU(first_cpu);
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 7406d18945..ae920ec310 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2900,3 +2900,18 @@ void kvmppc_set_reg_tb_offset(PowerPCCPU *cpu, int64_t tb_offset)
>          kvm_set_one_reg(cs, KVM_REG_PPC_TB_OFFSET, &tb_offset);
>      }
>  }
> +
> +/*
> + * Don't set error if KVM_PPC_SVM_OFF ioctl is invoked on kernels
> + * that don't support this ioctl.
> + */
> +void kvmppc_svm_off(Error **errp)
> +{
> +    int rc;
> +    KVMState *s = KVM_STATE(current_machine->accelerator);
> +
> +    rc = kvm_vm_ioctl(s, KVM_PPC_SVM_OFF);
> +    if (rc && rc != -ENOTTY) {
> +        error_setg(errp, "KVM_PPC_SVM_OFF ioctl failed");

It could have made sense to use error_setg_errno(errp, -rc, ...) here
but never mind.

Reviewed-by: Greg Kurz <groug@kaod.org>

> +    }
> +}
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index 47b08a4030..9a9bca1b72 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -37,6 +37,7 @@ int kvmppc_booke_watchdog_enable(PowerPCCPU *cpu);
>  target_ulong kvmppc_configure_v3_mmu(PowerPCCPU *cpu,
>                                       bool radix, bool gtse,
>                                       uint64_t proc_tbl);
> +void kvmppc_svm_off(Error **errp);
>  #ifndef CONFIG_USER_ONLY
>  bool kvmppc_spapr_use_multitce(void);
>  int kvmppc_spapr_enable_inkernel_multitce(void);
> @@ -201,6 +202,11 @@ static inline target_ulong kvmppc_configure_v3_mmu(PowerPCCPU *cpu,
>      return 0;
>  }
>  
> +static inline void kvmppc_svm_off(Error **errp)
> +{
> +    return;
> +}
> +
>  static inline void kvmppc_set_reg_ppc_online(PowerPCCPU *cpu,
>                                               unsigned int online)
>  {



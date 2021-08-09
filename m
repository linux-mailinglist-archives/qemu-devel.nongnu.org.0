Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB5E3E3E7C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 05:54:53 +0200 (CEST)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCwNI-0002ye-QZ
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 23:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mCwIt-0001J3-5L; Sun, 08 Aug 2021 23:50:19 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mCwIq-00017g-Q3; Sun, 08 Aug 2021 23:50:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GjhtY2rgcz9sWl; Mon,  9 Aug 2021 13:50:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628481013;
 bh=Bwl8eGvNGPeAGil9mEddDn39hwKRyp8R0fhRpXwSkOw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NIybHZJVLXMUgp41GlGbE6ILKDJHFAg41THiN8uCUeAJdwPjJmNzR5nCQrYYFXOki
 n+xJ06I6eHRM1LPGkFcRS2IScyjVEHkDQOEL9n8HbdeKl/gpFJuX23tXxIhQRDR7nY
 UFHrFIqbJPyw5RnnTru28iwAD2FWCBfvgX11bzRA=
Date: Mon, 9 Aug 2021 13:49:54 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [RFC PATCH v0 1/2] spapr: Add H_REG_SNS hcall
Message-ID: <YRCl4n25l8szLQVC@yekko>
References: <20210805073228.502292-1-bharata@linux.ibm.com>
 <20210805073228.502292-2-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VZOEgd+ZGM0scQR5"
Content-Disposition: inline
In-Reply-To: <20210805073228.502292-2-bharata@linux.ibm.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: aneesh.kumar@linux.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VZOEgd+ZGM0scQR5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 05, 2021 at 01:02:27PM +0530, Bharata B Rao wrote:
> Add support for H_REG_SNS hcall so that asynchronous page
> fault mechanism can be supported on PowerKVM guests.
>=20
> This hcall essentially issues KVM_PPC_SET_SNS to let the
> host map and pin the memory containing the Subvention
> Notification Structure. It also claims SPAPR_IRQ_SNS to
> be used as subvention notification interrupt.
>=20
> Note: Updates to linux-headers/linux/kvm.h are temporary
> pending headers update.
>=20
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  hw/ppc/spapr.c                  |  3 ++
>  hw/ppc/spapr_hcall.c            | 56 +++++++++++++++++++++++++++++++++
>  include/hw/ppc/spapr.h          |  3 ++
>  include/hw/ppc/spapr_irq.h      |  1 +
>  linux-headers/asm-powerpc/kvm.h |  6 ++++
>  linux-headers/linux/kvm.h       |  1 +
>  target/ppc/kvm.c                | 14 +++++++++
>  target/ppc/kvm_ppc.h            | 10 ++++++
>  8 files changed, 94 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 81699d4f8b..5f1f75826d 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2830,6 +2830,9 @@ static void spapr_machine_init(MachineState *machin=
e)
> =20
>          /* Enable H_PAGE_INIT */
>          kvmppc_enable_h_page_init();
> +
> +        /* Enable H_REG_SNS */
> +        kvmppc_enable_h_reg_sns();
>      }
> =20
>      /* map RAM */
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 0e9a5b2e40..957edecb13 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1405,6 +1405,59 @@ static target_ulong h_update_dt(PowerPCCPU *cpu, S=
paprMachineState *spapr,
>      return H_SUCCESS;
>  }
> =20
> +static target_ulong deregister_sns(PowerPCCPU *cpu, SpaprMachineState *s=
papr)
> +{
> +    spapr->sns_addr =3D -1;
> +    spapr->sns_len =3D 0;
> +    spapr_irq_free(spapr, SPAPR_IRQ_SNS, 1);
> +
> +    return H_SUCCESS;
> +}
> +
> +static target_ulong h_reg_sns(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                              target_ulong opcode, target_ulong *args)
> +{
> +    target_ulong addr =3D args[0];
> +    target_ulong len =3D args[1];
> +
> +    if (addr =3D=3D -1) {
> +        return deregister_sns(cpu, spapr);
> +    }
> +
> +    /*
> +     * If SNS area is already registered, can't register again before
> +     * deregistering it first.
> +     */
> +    if (spapr->sns_addr =3D=3D -1) {

As Fabiano says, it looks like the logic is reversed here.

> +        return H_PARAMETER;

Also, H_PARAMETER doesn't seem like the right error for this case.
H_BUSY, maybe?

> +    }
> +
> +    if (!QEMU_IS_ALIGNED(addr, 4096)) {

What's the significance of 4096 here?  Should this be one of the page
size defines instead?

> +        return H_PARAMETER;
> +    }
> +
> +    if (len < 256) {

A defined constant (SPAPR_MIN_SNS_SIZE?) would be worthwhile here, I think.

> +        return H_P2;
> +    }
> +
> +    /* TODO: SNS area is not allowed to cross a page boundary */
> +
> +    /* KVM_PPC_SET_SNS ioctl */
> +    if (kvmppc_set_sns_reg(addr, len)) {

What will happen if you attempt this on a TCG system?

> +        return H_PARAMETER;
> +    }
> +
> +    /* Record SNS addr and len */
> +    spapr->sns_addr =3D addr;
> +    spapr->sns_len =3D len;
> +
> +    /* Register irq source for sending ESN notification */
> +    spapr_irq_claim(spapr, SPAPR_IRQ_SNS, false, &error_fatal);

I don't think &error_fatal can be right here.  AFAICT this must be one
of two cases:
   1) This should never fail, no matter what the guest does.  If it
      does fail, that indicates a qemu bug.  In that case &error_abort is
      more appropriate
   2) This could fail for certain sequences of guest actions.  If
      that's the case, we shouldn't kill qemu, but should return
      H_HARDWARE (or something) instead.

> +    args[1] =3D SPAPR_IRQ_SNS; /* irq no in R5 */
> +
> +    return H_SUCCESS;
> +}
> +
>  static spapr_hcall_fn papr_hypercall_table[(MAX_HCALL_OPCODE / 4) + 1];
>  static spapr_hcall_fn kvmppc_hypercall_table[KVMPPC_HCALL_MAX - KVMPPC_H=
CALL_BASE + 1];
>  static spapr_hcall_fn svm_hypercall_table[(SVM_HCALL_MAX - SVM_HCALL_BAS=
E) / 4 + 1];
> @@ -1545,6 +1598,9 @@ static void hypercall_register_types(void)
>      spapr_register_hypercall(KVMPPC_H_CAS, h_client_architecture_support=
);
> =20
>      spapr_register_hypercall(KVMPPC_H_UPDATE_DT, h_update_dt);
> +
> +    /* SNS memory area registration */
> +    spapr_register_hypercall(H_REG_SNS, h_reg_sns);

You definitely need a machine parameter to enable this, and you should
only enable it by default for newer machine types.  Otherwise you will
cause migration breakages.

>  }
> =20
>  type_init(hypercall_register_types)
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 637652ad16..934f9e066e 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -252,6 +252,8 @@ struct SpaprMachineState {
>      uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE=
];
> =20
>      Error *fwnmi_migration_blocker;
> +    uint64_t sns_addr;
> +    uint64_t sns_len;
>  };
> =20
>  #define H_SUCCESS         0
> @@ -549,6 +551,7 @@ struct SpaprMachineState {
>  #define H_SCM_UNBIND_MEM        0x3F0
>  #define H_SCM_UNBIND_ALL        0x3FC
>  #define H_SCM_HEALTH            0x400
> +#define H_REG_SNS               0x41C
>  #define H_RPT_INVALIDATE        0x448
> =20
>  #define MAX_HCALL_OPCODE        H_RPT_INVALIDATE
> diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
> index c22a72c9e2..26c680f065 100644
> --- a/include/hw/ppc/spapr_irq.h
> +++ b/include/hw/ppc/spapr_irq.h
> @@ -21,6 +21,7 @@
>  #define SPAPR_XIRQ_BASE      XICS_IRQ_BASE /* 0x1000 */
>  #define SPAPR_IRQ_EPOW       (SPAPR_XIRQ_BASE + 0x0000)
>  #define SPAPR_IRQ_HOTPLUG    (SPAPR_XIRQ_BASE + 0x0001)
> +#define SPAPR_IRQ_SNS        (SPAPR_XIRQ_BASE + 0x0002)
>  #define SPAPR_IRQ_VIO        (SPAPR_XIRQ_BASE + 0x0100)  /* 256 VIO devi=
ces */
>  #define SPAPR_IRQ_PCI_LSI    (SPAPR_XIRQ_BASE + 0x0200)  /* 32+ PHBs dev=
ices */
> =20
> diff --git a/linux-headers/asm-powerpc/kvm.h b/linux-headers/asm-powerpc/=
kvm.h
> index 9f18fa090f..d72739126a 100644
> --- a/linux-headers/asm-powerpc/kvm.h
> +++ b/linux-headers/asm-powerpc/kvm.h
> @@ -470,6 +470,12 @@ struct kvm_ppc_cpu_char {
>  #define KVM_PPC_CPU_BEHAV_BNDS_CHK_SPEC_BAR	(1ULL << 61)
>  #define KVM_PPC_CPU_BEHAV_FLUSH_COUNT_CACHE	(1ull << 58)
> =20
> +/* For KVM_PPC_SET_SNS */
> +struct kvm_ppc_sns_reg {
> +	__u64 addr;
> +	__u64 len;
> +};
> +

Updates to linux-headers/ should be done as a separate preliminary
patch, listing the specific kernel commit that you're updating too.

>  /* Per-vcpu XICS interrupt controller state */
>  #define KVM_REG_PPC_ICP_STATE	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x8c)
> =20
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index bcaf66cc4d..a76945fcbc 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1458,6 +1458,7 @@ struct kvm_s390_ucas_mapping {
>  #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_even=
t_filter)
>  #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
>  #define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_m=
te_tags)
> +#define KVM_PPC_SET_SNS		  _IOR(KVMIO,  0xb5, struct kvm_ppc_sns_reg)
> =20
>  /* ioctl for vm fd */
>  #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index dc93b99189..330985c8a0 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2047,6 +2047,11 @@ void kvmppc_enable_h_rpt_invalidate(void)
>      kvmppc_enable_hcall(kvm_state, H_RPT_INVALIDATE);
>  }
> =20
> +void kvmppc_enable_h_reg_sns(void)
> +{
> +    kvmppc_enable_hcall(kvm_state, H_REG_SNS);
> +}
> +
>  void kvmppc_set_papr(PowerPCCPU *cpu)
>  {
>      CPUState *cs =3D CPU(cpu);
> @@ -2959,3 +2964,12 @@ bool kvm_arch_cpu_check_are_resettable(void)
>  {
>      return true;
>  }
> +
> +int kvmppc_set_sns_reg(target_ulong addr, target_ulong len)
> +{
> +    struct kvm_ppc_sns_reg sns_reg;
> +
> +    sns_reg.addr =3D addr;
> +    sns_reg.len =3D len;
> +    return kvm_vm_ioctl(kvm_state, KVM_PPC_SET_SNS, &sns_reg);
> +}
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index ee9325bf9a..c22bc3253e 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -25,6 +25,7 @@ void kvmppc_enable_set_mode_hcall(void);
>  void kvmppc_enable_clear_ref_mod_hcalls(void);
>  void kvmppc_enable_h_page_init(void);
>  void kvmppc_enable_h_rpt_invalidate(void);
> +void kvmppc_enable_h_reg_sns(void);
>  void kvmppc_set_papr(PowerPCCPU *cpu);
>  int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
>  void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
> @@ -87,6 +88,7 @@ void kvmppc_set_reg_ppc_online(PowerPCCPU *cpu, unsigne=
d int online);
>  void kvmppc_set_reg_tb_offset(PowerPCCPU *cpu, int64_t tb_offset);
> =20
>  int kvm_handle_nmi(PowerPCCPU *cpu, struct kvm_run *run);
> +int kvmppc_set_sns_reg(target_ulong addr, target_ulong len);
> =20
>  #else
> =20
> @@ -157,6 +159,10 @@ static inline void kvmppc_enable_h_rpt_invalidate(vo=
id)
>      g_assert_not_reached();
>  }
> =20
> +static inline void kvmppc_enable_h_reg_sns(void)
> +{
> +}
> +
>  static inline void kvmppc_set_papr(PowerPCCPU *cpu)
>  {
>  }
> @@ -430,6 +436,10 @@ static inline bool kvmppc_pvr_workaround_required(Po=
werPCCPU *cpu)
>      return false;
>  }
> =20
> +int kvmppc_set_sns_reg(target_ulong addr, target_ulong len)
> +{
> +    return -ENOSYS;
> +}
>  #endif
> =20
>  #ifndef CONFIG_KVM

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VZOEgd+ZGM0scQR5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEQpeIACgkQbDjKyiDZ
s5In6BAAtKuOEG83Q9CTpgd1PPHdo/fp6ZGgNptgQT5iCAtFlWq1Oq0YAKyFG6iS
DiQpCsoMqyPB5uUE632NYFcxOl4kvlmjLsFTfCbfD+A5AcH6dwkdHZlcyNGvPSft
xpSTH076euaAwk32Z40MLRxd3b0S6Z5weNWQrtgRz83wBj2K7MyJY+H65NftiiLU
EOJQ6lr9k+yy6GC24iX6xkkbQJJA2ahFxziut4ELlfKgJiQX1Eu8yGY0Td92vssq
aoD7v5Y8eqLeTU4V6cD30Kh911Od1FRFu/NuSNWN0eCHSeLcDJLYkYaR8UqFSh83
eXObuXUoH1zXjGQxx0H8KmOFOGS6mf7HO85Vp+kJfVwoEJ0oKUlRlZiW0+Z3llKU
CgKBktxDlfYK+zSYOs35PnJTiptrmInmrNbSyJF1kmkqs9ja0S7mMBbpl12pPdNU
h+QGctvir1py56zBkqt2abhzOy29tMwLc3kEZagOwACXGBlsvM7JSs23oSh33J3h
IP7dR8+KCNQuP6Iosx1wCLc9Tz8pHHVJotyCvFV+uRKFqpuzcMR8524DcAFubP9M
yxOWxBWk5wet35Ku1V1hfC8L1LgcMO/JM4NqlmtI/K2OR5JsMwmAnyFZidEfNBDv
RpiexnO8I/0mTgQ2X8k73W6wtzvrd57S5XltU/vPkB7M9JMWNCo=
=Q9cz
-----END PGP SIGNATURE-----

--VZOEgd+ZGM0scQR5--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B18A3C1CF2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 03:10:27 +0200 (CEST)
Received: from localhost ([::1]:51346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1f2A-0000se-Ky
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 21:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1eyw-0006nN-7T; Thu, 08 Jul 2021 21:07:06 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:49853 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1eys-0003Cy-Dn; Thu, 08 Jul 2021 21:07:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLZkT5PCwz9srX; Fri,  9 Jul 2021 11:06:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625792817;
 bh=x4WAdeqGAgCnIsBilGTutM83zvwpDwKxK9AEhCgA03A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lw/VX9idddCTRzACp+xnrQsphEY9L/LuKZmlhSayI72YOKHr9/xg3UxnDqZ7N1PCX
 vqp1Uk4xmGvj6JCuFAqPy8TX085Aaf3RyVNMr4hAjQ1yVclVh3fv6y9uU2dIPF64vm
 rn+s2e9kP69wiA7q2cB22lJ5nZDZzA4AUpBQ6cVo=
Date: Fri, 9 Jul 2021 11:01:22 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v1 2/2] target/ppc: Support for H_RPT_INVALIDATE hcall
Message-ID: <YOef4q9A6TUMe7vj@yekko>
References: <20210706112440.1449562-1-bharata@linux.ibm.com>
 <20210706112440.1449562-3-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RQBVJ8osfURThJDD"
Content-Disposition: inline
In-Reply-To: <20210706112440.1449562-3-bharata@linux.ibm.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RQBVJ8osfURThJDD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 04:54:40PM +0530, Bharata B Rao wrote:
> If KVM_CAP_RPT_INVALIDATE KVM capability is enabled, then
>=20
> - indicate the availability of H_RPT_INVALIDATE hcall to the guest via
>   ibm,hypertas-functions property.
> - Enable the hcall
>=20
> Both the above are done only if the new sPAPR machine capability
> cap-rpt-invalidate is set.
>=20
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>

Applied to ppc-for-6.1, but one note below.

> ---
>  hw/ppc/spapr.c         |  6 ++++++
>  hw/ppc/spapr_caps.c    | 41 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/ppc/spapr.h |  8 ++++++--
>  target/ppc/kvm.c       | 12 ++++++++++++
>  target/ppc/kvm_ppc.h   | 12 ++++++++++++
>  5 files changed, 77 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 4dd90b75cc..2b96b03673 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -880,6 +880,10 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, =
void *fdt)
>      add_str(hypertas, "hcall-copy");
>      add_str(hypertas, "hcall-debug");
>      add_str(hypertas, "hcall-vphn");
> +    if (spapr_get_cap(spapr, SPAPR_CAP_RPT_INVALIDATE) =3D=3D SPAPR_CAP_=
ON) {
> +        add_str(hypertas, "hcall-rpt-invalidate");
> +    }
> +
>      add_str(qemu_hypertas, "hcall-memop1");
> =20
>      if (!kvm_enabled() || kvmppc_spapr_use_multitce()) {
> @@ -2018,6 +2022,7 @@ static const VMStateDescription vmstate_spapr =3D {
>          &vmstate_spapr_cap_ccf_assist,
>          &vmstate_spapr_cap_fwnmi,
>          &vmstate_spapr_fwnmi,
> +        &vmstate_spapr_cap_rpt_invalidate,
>          NULL
>      }
>  };
> @@ -4573,6 +4578,7 @@ static void spapr_machine_class_init(ObjectClass *o=
c, void *data)
>      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] =3D SPAPR_CAP_ON;
>      smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] =3D SPAPR_CAP_ON;
>      smc->default_caps.caps[SPAPR_CAP_FWNMI] =3D SPAPR_CAP_ON;
> +    smc->default_caps.caps[SPAPR_CAP_RPT_INVALIDATE] =3D SPAPR_CAP_OFF;
>      spapr_caps_add_properties(smc);
>      smc->irq =3D &spapr_irq_dual;
>      smc->dr_phb_enabled =3D true;
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index d0c419b392..ed7c077a0d 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -582,6 +582,37 @@ static void cap_fwnmi_apply(SpaprMachineState *spapr=
, uint8_t val,
>      }
>  }
> =20
> +static void cap_rpt_invalidate_apply(SpaprMachineState *spapr,
> +                                     uint8_t val, Error **errp)
> +{
> +    ERRP_GUARD();
> +
> +    if (!val) {
> +        /* capability disabled by default */
> +        return;
> +    }
> +
> +    if (tcg_enabled()) {
> +        error_setg(errp, "No H_RPT_INVALIDATE support in TCG");

This will need to be fixed before the default can be changed to on.

> +        error_append_hint(errp,
> +                          "Try appending -machine cap-rpt-invalidate=3Do=
ff\n");
> +    } else if (kvm_enabled()) {
> +        if (!kvmppc_has_cap_mmu_radix()) {
> +            error_setg(errp, "H_RPT_INVALIDATE only supported on Radix");
> +            return;
> +        }
> +
> +        if (!kvmppc_has_cap_rpt_invalidate()) {
> +            error_setg(errp,
> +                       "KVM implementation does not support H_RPT_INVALI=
DATE");
> +            error_append_hint(errp,
> +                              "Try appending -machine cap-rpt-invalidate=
=3Doff\n");
> +        } else {
> +            kvmppc_enable_h_rpt_invalidate();
> +        }
> +    }
> +}
> +
>  SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] =3D {
>      [SPAPR_CAP_HTM] =3D {
>          .name =3D "htm",
> @@ -690,6 +721,15 @@ SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] =
=3D {
>          .type =3D "bool",
>          .apply =3D cap_fwnmi_apply,
>      },
> +    [SPAPR_CAP_RPT_INVALIDATE] =3D {
> +        .name =3D "rpt-invalidate",
> +        .description =3D "Allow H_RPT_INVALIDATE",
> +        .index =3D SPAPR_CAP_RPT_INVALIDATE,
> +        .get =3D spapr_cap_get_bool,
> +        .set =3D spapr_cap_set_bool,
> +        .type =3D "bool",
> +        .apply =3D cap_rpt_invalidate_apply,
> +    },
>  };
> =20
>  static SpaprCapabilities default_caps_with_cpu(SpaprMachineState *spapr,
> @@ -830,6 +870,7 @@ SPAPR_CAP_MIG_STATE(nested_kvm_hv, SPAPR_CAP_NESTED_K=
VM_HV);
>  SPAPR_CAP_MIG_STATE(large_decr, SPAPR_CAP_LARGE_DECREMENTER);
>  SPAPR_CAP_MIG_STATE(ccf_assist, SPAPR_CAP_CCF_ASSIST);
>  SPAPR_CAP_MIG_STATE(fwnmi, SPAPR_CAP_FWNMI);
> +SPAPR_CAP_MIG_STATE(rpt_invalidate, SPAPR_CAP_RPT_INVALIDATE);
> =20
>  void spapr_caps_init(SpaprMachineState *spapr)
>  {
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index f05219f75e..b18d407c1a 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -74,8 +74,10 @@ typedef enum {
>  #define SPAPR_CAP_CCF_ASSIST            0x09
>  /* Implements PAPR FWNMI option */
>  #define SPAPR_CAP_FWNMI                 0x0A
> +/* Support H_RPT_INVALIDATE */
> +#define SPAPR_CAP_RPT_INVALIDATE        0x0B
>  /* Num Caps */
> -#define SPAPR_CAP_NUM                   (SPAPR_CAP_FWNMI + 1)
> +#define SPAPR_CAP_NUM                   (SPAPR_CAP_RPT_INVALIDATE + 1)
> =20
>  /*
>   * Capability Values
> @@ -542,8 +544,9 @@ struct SpaprMachineState {
>  #define H_SCM_UNBIND_MEM        0x3F0
>  #define H_SCM_UNBIND_ALL        0x3FC
>  #define H_SCM_HEALTH            0x400
> +#define H_RPT_INVALIDATE        0x448
> =20
> -#define MAX_HCALL_OPCODE        H_SCM_HEALTH
> +#define MAX_HCALL_OPCODE        H_RPT_INVALIDATE
> =20
>  /* The hcalls above are standardized in PAPR and implemented by pHyp
>   * as well.
> @@ -932,6 +935,7 @@ extern const VMStateDescription vmstate_spapr_cap_nes=
ted_kvm_hv;
>  extern const VMStateDescription vmstate_spapr_cap_large_decr;
>  extern const VMStateDescription vmstate_spapr_cap_ccf_assist;
>  extern const VMStateDescription vmstate_spapr_cap_fwnmi;
> +extern const VMStateDescription vmstate_spapr_cap_rpt_invalidate;
> =20
>  static inline uint8_t spapr_get_cap(SpaprMachineState *spapr, int cap)
>  {
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 104a308abb..dc93b99189 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -89,6 +89,7 @@ static int cap_ppc_count_cache_flush_assist;
>  static int cap_ppc_nested_kvm_hv;
>  static int cap_large_decr;
>  static int cap_fwnmi;
> +static int cap_rpt_invalidate;
> =20
>  static uint32_t debug_inst_opcode;
> =20
> @@ -152,6 +153,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>          exit(1);
>      }
> =20
> +    cap_rpt_invalidate =3D kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INV=
ALIDATE);
>      kvm_ppc_register_host_cpu_type();
> =20
>      return 0;
> @@ -2040,6 +2042,11 @@ void kvmppc_enable_h_page_init(void)
>      kvmppc_enable_hcall(kvm_state, H_PAGE_INIT);
>  }
> =20
> +void kvmppc_enable_h_rpt_invalidate(void)
> +{
> +    kvmppc_enable_hcall(kvm_state, H_RPT_INVALIDATE);
> +}
> +
>  void kvmppc_set_papr(PowerPCCPU *cpu)
>  {
>      CPUState *cs =3D CPU(cpu);
> @@ -2551,6 +2558,11 @@ int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, =
int enable)
>      return 0;
>  }
> =20
> +int kvmppc_has_cap_rpt_invalidate(void)
> +{
> +    return cap_rpt_invalidate;
> +}
> +
>  PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void)
>  {
>      uint32_t host_pvr =3D mfpvr();
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index 989f61ace0..ee9325bf9a 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -24,6 +24,7 @@ void kvmppc_enable_logical_ci_hcalls(void);
>  void kvmppc_enable_set_mode_hcall(void);
>  void kvmppc_enable_clear_ref_mod_hcalls(void);
>  void kvmppc_enable_h_page_init(void);
> +void kvmppc_enable_h_rpt_invalidate(void);
>  void kvmppc_set_papr(PowerPCCPU *cpu);
>  int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
>  void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
> @@ -71,6 +72,7 @@ bool kvmppc_has_cap_nested_kvm_hv(void);
>  int kvmppc_set_cap_nested_kvm_hv(int enable);
>  int kvmppc_get_cap_large_decr(void);
>  int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable);
> +int kvmppc_has_cap_rpt_invalidate(void);
>  int kvmppc_enable_hwrng(void);
>  int kvmppc_put_books_sregs(PowerPCCPU *cpu);
>  PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void);
> @@ -150,6 +152,11 @@ static inline void kvmppc_enable_h_page_init(void)
>  {
>  }
> =20
> +static inline void kvmppc_enable_h_rpt_invalidate(void)
> +{
> +    g_assert_not_reached();
> +}
> +
>  static inline void kvmppc_set_papr(PowerPCCPU *cpu)
>  {
>  }
> @@ -381,6 +388,11 @@ static inline int kvmppc_enable_cap_large_decr(Power=
PCCPU *cpu, int enable)
>      return -1;
>  }
> =20
> +static inline int kvmppc_has_cap_rpt_invalidate(void)
> +{
> +    return false;
> +}
> +
>  static inline int kvmppc_enable_hwrng(void)
>  {
>      return -1;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RQBVJ8osfURThJDD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDnn+IACgkQbDjKyiDZ
s5K/AxAA2dGg/klqAwX3yY2CnodAsfc0wCnPKLteLC855VKaXfj+aqnJcYC69tKR
OrDe5fLM/1hn4m9vVJKU1iB+nb5UpWEIcnnrRoy0NrLMiZRBIv74XfNcxCI8vAf6
nD2MpSS5A+wlbIK+Cf/sM4icAR4IX4Esvo7oEiuU5Y08egcEh1CzxEZzQATfnVmQ
ZNOCP5vaiSWPSmbDwDiHRpawNzGu7atrcAxQp7i0GINuDk2XRqCXYb9e5+pcWCgx
SZFOtBwAYQyKuQjNciaGAB1iGOFEBJ7zgq0hxcfJmrqIPR6egkMf/99SxMq9pwWN
ZOj1r5cGLqwQP4KI4qH4nOn/UIDv+0JuNej2F4tr/+e9HVctbhe0BKgQZpR3r/Fy
AJLzq7g3N98VW15ONELT791aBPx/L3SkGujYc7paGnEhmc0kuBjLshCUyOU90V7Q
Q6hEi7Q3jsFy/im4Y0Ug8KDegOH+eVFGN6QpvkDCaf62qZHqz3OIxNXvglpZn2mP
h9MzotDjecCe+92qdaWmufRWR9w69epQ/aMg12fVAkYgrL4CzATEEv9Qz7A2guyT
f/FGK4KGL/4Ag+NjSQdWUZP5wbrPx0iWtgoOYlJlw/8m2ijZME8CNGnTPxIfEj1m
8vwmDvMpZarbMzbUKpM3u/VCftclVdHvd3X8wNGI4RrUjtV41k0=
=wAvy
-----END PGP SIGNATURE-----

--RQBVJ8osfURThJDD--


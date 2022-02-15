Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215034B5FFA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 02:25:59 +0100 (CET)
Received: from localhost ([::1]:44108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJmbM-0006uf-IH
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 20:25:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nJmOh-0005kR-2F; Mon, 14 Feb 2022 20:12:51 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:57473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nJmOZ-0001Lj-Ii; Mon, 14 Feb 2022 20:12:50 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JyNNn2ZKrz4xsm; Tue, 15 Feb 2022 12:12:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644887545;
 bh=eDkSB5XCTpHKsRgSTeQSwoiemJ9BRmJQey8eWub2x6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HzhCta444rSpe+xhUqFvb0Xum++VaIskEOAF3o7JlOMBPZusoY3Ntt4UGFrhluiy+
 DqOa0AZoC2jENuyOt7dv+Nl2aGpeXh+1XC6MoOKeBn/7u6KJp7BLHmwJKcXJjBYN+c
 u8SengFGHx0STurnt493hUWShBRcpyU8UN+g84Hg=
Date: Tue, 15 Feb 2022 12:10:17 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] spapr: Add SPAPR_CAP_AIL_MODE_3 for AIL mode 3
 support for H_SET_MODE hcall
Message-ID: <Ygr9eYymaFJb0nEI@yekko>
References: <20220214111749.1542196-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cN8ik1bBkERO3gFk"
Content-Disposition: inline
In-Reply-To: <20220214111749.1542196-1-npiggin@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cN8ik1bBkERO3gFk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 09:17:48PM +1000, Nicholas Piggin wrote:
> The behaviour of the Address Translation Mode on Interrupt resource is
> not consistently supported by all CPU versions or all KVM versions. In
> particular KVM HV only supports mode 0 on POWER7 processors and some
> early POWER9 processors, and does not support mode 2 anywhere. KVM PR
> only supports mode 0. TCG supports all modes (0, 2, 3).
>=20
> This leads to inconsistencies in guest behaviour and could cause
> problems migrating guests. This was not noticable for Linux guests for a
> long time because the kernel only uses modes 0 and 3, and it used to
> consider AIL-3 to be advisory in that it would always keep the AIL-0
> vectors around. KVM for a long time would not always honor the AIL mode,
> contrary to architecture.
>=20
> Recent Linux guests depend on the AIL mode working as specified in order
> to support the SCV facility interrupt. If AIL-3 can not be provided,
> then Linux must be given an error so it can disable the SCV facility,
> rather than silently failing.
>=20
> Add the ail-mode-3 capability to specify that AIL-3 is supported. AIL-0
> is implied as the baseline. AIL-2 is no longer supported by spapr. It
> is not known to be used by any software, but support in TCG could be
> restored with an ail-mode-2 capability quite easily if a regression is
> reported.
>=20
> Modify the H_SET_MODE Address Translation Mode on Interrupt resource
> handler to check capabilities and correctly return error if not
> supported.
>=20
> A heuristic is added for KVM to determine AIL-3 support before the
> introduction of a new KVM CAP.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Since the RFC, I made this a single mode cap for ail-3, suggested
> by David. Also split out the KVM CAP into patch 2 because that is
> not ready for merge yet (this patch can go in ahead of it).
>=20
> Thanks,
> Nick
>=20
>  hw/ppc/spapr.c         |  6 ++++++
>  hw/ppc/spapr_caps.c    | 23 +++++++++++++++++++++++
>  hw/ppc/spapr_hcall.c   | 23 +++++++++++++----------
>  include/hw/ppc/spapr.h |  4 +++-
>  target/ppc/kvm.c       | 23 +++++++++++++++++++++++
>  target/ppc/kvm_ppc.h   |  6 ++++++
>  6 files changed, 74 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 3d6ec309dd..15a02d3e78 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4606,6 +4606,12 @@ static void spapr_machine_class_init(ObjectClass *=
oc, void *data)
>      smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] =3D SPAPR_CAP_ON;
>      smc->default_caps.caps[SPAPR_CAP_FWNMI] =3D SPAPR_CAP_ON;
>      smc->default_caps.caps[SPAPR_CAP_RPT_INVALIDATE] =3D SPAPR_CAP_OFF;
> +
> +    /* This cap specifies whether the AIL 3 mode for H_SET_RESOURCE is
> +     * supported. Default to true, (PR KVM, POWER7 and earlier, and KVM =
on
> +     * some early POWER9s only support 0).
> +     */
> +    smc->default_caps.caps[SPAPR_CAP_AIL_MODE_3] =3D SPAPR_CAP_ON;
>      spapr_caps_add_properties(smc);
>      smc->irq =3D &spapr_irq_dual;
>      smc->dr_phb_enabled =3D true;
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index ed7c077a0d..5fd4a53c33 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -613,6 +613,20 @@ static void cap_rpt_invalidate_apply(SpaprMachineSta=
te *spapr,
>      }
>  }
> =20
> +static void cap_ail_mode_3_apply(SpaprMachineState *spapr,
> +                                     uint8_t val, Error **errp)
> +{
> +    ERRP_GUARD();
> +
> +    if (kvm_enabled()) {
> +        if (!kvmppc_supports_ail_3()) {
> +            error_setg(errp, "KVM implementation does not support cap-ai=
l-mode-3");
> +            error_append_hint(errp, "Try appending -machine cap-ail-mode=
-3=3Doff\n");
> +            return;
> +        }
> +    }
> +}
> +
>  SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] =3D {
>      [SPAPR_CAP_HTM] =3D {
>          .name =3D "htm",
> @@ -730,6 +744,15 @@ SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] =
=3D {
>          .type =3D "bool",
>          .apply =3D cap_rpt_invalidate_apply,
>      },
> +    [SPAPR_CAP_AIL_MODE_3] =3D {
> +        .name =3D "ail-mode-3",
> +        .description =3D "Alternate Interrupt Location (AIL) mode 3 supp=
ort",
> +        .index =3D SPAPR_CAP_AIL_MODE_3,
> +        .get =3D spapr_cap_get_bool,
> +        .set =3D spapr_cap_set_bool,
> +        .type =3D "bool",
> +        .apply =3D cap_ail_mode_3_apply,
> +    },
>  };
> =20
>  static SpaprCapabilities default_caps_with_cpu(SpaprMachineState *spapr,
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 222c1b6bbd..5dec056796 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -811,32 +811,35 @@ static target_ulong h_set_mode_resource_le(PowerPCC=
PU *cpu,
>  }
> =20
>  static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
> +                                                        SpaprMachineStat=
e *spapr,
>                                                          target_ulong mfl=
ags,
>                                                          target_ulong val=
ue1,
>                                                          target_ulong val=
ue2)
>  {
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> -
> -    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
> -        return H_P2;
> -    }
>      if (value1) {
>          return H_P3;
>      }
> +
>      if (value2) {
>          return H_P4;
>      }
> =20
> -    if (mflags =3D=3D 1) {
> -        /* AIL=3D1 is reserved in POWER8/POWER9/POWER10 */
> +    /* AIL-1 is not architected, and AIL-2 is not supported by QEMU. */
> +    if (mflags =3D=3D 1 || mflags =3D=3D 2) {

This test is redundant with the one below, isn't it?

>          return H_UNSUPPORTED_FLAG;
>      }
> =20
> -    if (mflags =3D=3D 2 && (pcc->insns_flags2 & PPC2_ISA310)) {
> -        /* AIL=3D2 is reserved in POWER10 (ISA v3.1) */
> +    /* Only 0 and 3 are possible */
> +    if (mflags !=3D 0 && mflags !=3D 3) {
>          return H_UNSUPPORTED_FLAG;
>      }
> =20
> +    if (mflags =3D=3D 3) {
> +        if (!spapr_get_cap(spapr, SPAPR_CAP_AIL_MODE_3)) {
> +            return H_UNSUPPORTED_FLAG;
> +        }
> +    }
> +
>      spapr_set_all_lpcrs(mflags << LPCR_AIL_SHIFT, LPCR_AIL);
> =20
>      return H_SUCCESS;
> @@ -853,7 +856,7 @@ static target_ulong h_set_mode(PowerPCCPU *cpu, Spapr=
MachineState *spapr,
>          ret =3D h_set_mode_resource_le(cpu, spapr, args[0], args[2], arg=
s[3]);
>          break;
>      case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
> -        ret =3D h_set_mode_resource_addr_trans_mode(cpu, args[0],
> +        ret =3D h_set_mode_resource_addr_trans_mode(cpu, spapr, args[0],
>                                                    args[2], args[3]);
>          break;
>      }
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index ee7504b976..edbf3eeed0 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -77,8 +77,10 @@ typedef enum {
>  #define SPAPR_CAP_FWNMI                 0x0A
>  /* Support H_RPT_INVALIDATE */
>  #define SPAPR_CAP_RPT_INVALIDATE        0x0B
> +/* Support for AIL modes */
> +#define SPAPR_CAP_AIL_MODE_3            0x0C
>  /* Num Caps */
> -#define SPAPR_CAP_NUM                   (SPAPR_CAP_RPT_INVALIDATE + 1)
> +#define SPAPR_CAP_NUM                   (SPAPR_CAP_AIL_MODE_3 + 1)
> =20
>  /*
>   * Capability Values
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index dc93b99189..128bc530d4 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2563,6 +2563,29 @@ int kvmppc_has_cap_rpt_invalidate(void)
>      return cap_rpt_invalidate;
>  }
> =20
> +int kvmppc_supports_ail_3(void)

Returning bool would make more sense, no?

> +{
> +    PowerPCCPUClass *pcc =3D kvm_ppc_get_host_cpu_class();
> +
> +    /*
> +     * KVM PR only supports AIL-0
> +     */
> +    if (kvmppc_is_pr(kvm_state)) {
> +        return 0;
> +    }
> +
> +    /*
> +     * KVM HV hosts support AIL-3 on POWER8 and above, except for radix
> +     * mode on some early POWER9s, but it's not clear how to cover those
> +     * without disabling the feature for many.
> +     */
> +    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {

This effectively means that the pseries machine type simply won't
start with a !PPC2_ISA207S cpu model.  I'm not sure if we support any
such CPUs in any case.  If we do, we should probably change the
default value for this cap based on cpu model in
default_caps_with_cpu().

> +        return 0;
> +    }
> +
> +    return 1;
> +}
> +
>  PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void)
>  {
>      uint32_t host_pvr =3D mfpvr();
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index ee9325bf9a..d9d1c54955 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -73,6 +73,7 @@ int kvmppc_set_cap_nested_kvm_hv(int enable);
>  int kvmppc_get_cap_large_decr(void);
>  int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable);
>  int kvmppc_has_cap_rpt_invalidate(void);
> +int kvmppc_supports_ail_3(void);
>  int kvmppc_enable_hwrng(void);
>  int kvmppc_put_books_sregs(PowerPCCPU *cpu);
>  PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void);
> @@ -393,6 +394,11 @@ static inline int kvmppc_has_cap_rpt_invalidate(void)
>      return false;
>  }
> =20
> +static inline int kvmppc_supports_ail_3(void)
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

--cN8ik1bBkERO3gFk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIK/XAACgkQgypY4gEw
YSK8qA//YQV1xXDxU9GMf9r1ld8SjVC/qKjIOEbh360jqkvzpkWBefL157x3/rHy
cFNnq7QwTMgDTGIGq2NeKwQteQMMxm186cIaLWD+gSRP2B4AoogXD0xT1uYm7DGZ
5igPPoKWEvCJRS0B6HSO5TS69gqLm8M5zYS61mMSsVmjYEQ9EoqyCw8bihZcjfRx
QSZHA+SRkyi0ukzb4USG1F2BJnRPeuWjALVYefyBKSDdwlpFKgU5vbzgyYIY/vj9
C74peFHnQlJt+/mLrbUft2BKAMotMBHmYfLKVrErBstblr8j7HSpuh0sLWGQLvxU
dlocGgTPoSpCRY2pgo2BTA6MqFlr4If+1Vn2+4QgAziL8KXU61kdxlVIh6N2gHmS
RrRcD+QD28uYxVWsnqa4L131Humgxk6GYMTc5Z+oIGzGzUizrmScWELqXPdeizfY
oWcvx5EDK5leOe8VijCL2baQt5V7vl+3hFMya4CCRAJQPntOI4/8PexdZpgtQBvr
eF9htwRKuIIV7PGQhB2y+l1RIVFA14mBhveEw4s4mxyPgsfBUEfr8b+U3glDHbgD
Q8ptvPH9OtImVI1SqcZXxil7fIkAcQyQp5kgScIcdDKh5tQ1aBq91rqvPhygS49C
OizH2d0FE/TZi6Bst9+FY/rvnj4s/KaI9Mlk5obkr7ylc+3GvnU=
=v/ZE
-----END PGP SIGNATURE-----

--cN8ik1bBkERO3gFk--


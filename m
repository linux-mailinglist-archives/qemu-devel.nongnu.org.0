Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ACF4C3CDD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 05:02:32 +0100 (CET)
Received: from localhost ([::1]:56076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNRoN-0002JJ-6z
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 23:02:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nNRhO-0007s0-KS; Thu, 24 Feb 2022 22:55:20 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:36747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nNRhF-0001PR-Er; Thu, 24 Feb 2022 22:55:18 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4K4bWm209Nz4xdl; Fri, 25 Feb 2022 14:55:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1645761300;
 bh=fZU4l/lw5PJwsM0nn9BSh0JbLRu/YbVeZY6JNx5LkqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WKixeD2EvHocaHlvG4NaVP2yVG10WzSUgiO3StrhWtpU3ZUnAOBnYqkyCwzeH5dEH
 xG3ArGRa48JyXTP8Q1TXGuQT0CeWI5EqL91lfZ20l2uby09pU7lOGDbhdEWL7PB1ou
 FTVuexEBXNL6zBgQRXL6Jb8aPovEukz0hDFVR5tA=
Date: Fri, 25 Feb 2022 14:42:16 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 4/4] spapr: Add KVM-on-TCG migration support
Message-ID: <YhhQGKL2mZDN2mtx@yekko>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
 <20220224185817.2207228-5-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g5A1Q2krK7+cmyOG"
Content-Disposition: inline
In-Reply-To: <20220224185817.2207228-5-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: aik@ozlabs.ru, danielhb413@gmail.com, qemu-devel@nongnu.org,
 npiggin@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--g5A1Q2krK7+cmyOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 03:58:17PM -0300, Fabiano Rosas wrote:
> This adds migration support for TCG pseries machines running a KVM-HV
> guest.
>=20
> The state that needs to be migrated is:
>=20
> - the nested PTCR value;
> - the in_nested flag;
> - the nested_tb_offset.
> - the saved host CPUPPCState structure;
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>=20
> ---
> (this migrates just fine with L2 running stress and 1 VCPU in L1. With
> 32 VCPUs in L1 there's crashes which I still don't understand. They might
> be related to L1 migration being flaky right now)
> ---
>  hw/ppc/spapr.c          | 19 +++++++++++
>  hw/ppc/spapr_cpu_core.c | 76 +++++++++++++++++++++++++++++++++++++++++
>  target/ppc/machine.c    | 44 ++++++++++++++++++++++++
>  3 files changed, 139 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index f0b75b22bb..6e87c515db 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1934,6 +1934,13 @@ static bool spapr_patb_entry_needed(void *opaque)
>      return !!spapr->patb_entry;
>  }
> =20
> +static bool spapr_nested_ptcr_needed(void *opaque)
> +{
> +    SpaprMachineState *spapr =3D opaque;
> +
> +    return !!spapr->nested_ptcr;
> +}
> +
>  static const VMStateDescription vmstate_spapr_patb_entry =3D {
>      .name =3D "spapr_patb_entry",
>      .version_id =3D 1,
> @@ -1945,6 +1952,17 @@ static const VMStateDescription vmstate_spapr_patb=
_entry =3D {
>      },
>  };
> =20
> +static const VMStateDescription vmstate_spapr_nested_ptcr =3D {
> +    .name =3D "spapr_nested_ptcr",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D spapr_nested_ptcr_needed,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT64(nested_ptcr, SpaprMachineState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
>  static bool spapr_irq_map_needed(void *opaque)
>  {
>      SpaprMachineState *spapr =3D opaque;
> @@ -2069,6 +2087,7 @@ static const VMStateDescription vmstate_spapr =3D {
>          &vmstate_spapr_cap_fwnmi,
>          &vmstate_spapr_fwnmi,
>          &vmstate_spapr_cap_rpt_invalidate,
> +        &vmstate_spapr_nested_ptcr,

Ok, the nested_ptcr stuff looks good.

>          NULL
>      }
>  };
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index efda7730f1..3ec13c0660 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -25,6 +25,7 @@
>  #include "sysemu/reset.h"
>  #include "sysemu/hw_accel.h"
>  #include "qemu/error-report.h"
> +#include "migration/cpu.h"
> =20
>  static void spapr_reset_vcpu(PowerPCCPU *cpu)
>  {
> @@ -174,6 +175,80 @@ static const VMStateDescription vmstate_spapr_cpu_vp=
a =3D {
>      }
>  };
> =20
> +static bool nested_needed(void *opaque)
> +{
> +    SpaprCpuState *spapr_cpu =3D opaque;
> +
> +    return spapr_cpu->in_nested;
> +}
> +
> +static int nested_state_pre_save(void *opaque)
> +{
> +    CPUPPCState *env =3D opaque;
> +
> +    env->spr[SPR_LR] =3D env->lr;
> +    env->spr[SPR_CTR] =3D env->ctr;
> +    env->spr[SPR_XER] =3D cpu_read_xer(env);
> +    env->spr[SPR_CFAR] =3D env->cfar;
> +    return 0;
> +}
> +
> +static int nested_state_post_load(void *opaque, int version_id)
> +{
> +    CPUPPCState *env =3D opaque;
> +
> +    env->lr =3D env->spr[SPR_LR];
> +    env->ctr =3D env->spr[SPR_CTR];
> +    cpu_write_xer(env, env->spr[SPR_XER]);
> +    env->cfar =3D env->spr[SPR_CFAR];
> +
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_nested_host_state =3D {
> +    .name =3D "spapr_nested_host_state",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .pre_save =3D nested_state_pre_save,
> +    .post_load =3D nested_state_post_load,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINTTL_ARRAY(gpr, CPUPPCState, 32),
> +        VMSTATE_UINTTL_ARRAY(spr, CPUPPCState, 1024),
> +        VMSTATE_UINT32_ARRAY(crf, CPUPPCState, 8),
> +        VMSTATE_UINTTL(nip, CPUPPCState),
> +        VMSTATE_UINTTL(msr, CPUPPCState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static int nested_cpu_pre_load(void *opaque)
> +{
> +    SpaprCpuState *spapr_cpu =3D opaque;
> +
> +    spapr_cpu->nested_host_state =3D g_try_malloc(sizeof(CPUPPCState));
> +    if (!spapr_cpu->nested_host_state) {
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_spapr_cpu_nested =3D {
> +    .name =3D "spapr_cpu/nested",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D nested_needed,
> +    .pre_load =3D nested_cpu_pre_load,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_BOOL(in_nested, SpaprCpuState),
> +        VMSTATE_INT64(nested_tb_offset, SpaprCpuState),
> +        VMSTATE_STRUCT_POINTER_V(nested_host_state, SpaprCpuState, 1,
> +                                 vmstate_nested_host_state, CPUPPCState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
>  static const VMStateDescription vmstate_spapr_cpu_state =3D {
>      .name =3D "spapr_cpu",
>      .version_id =3D 1,
> @@ -184,6 +259,7 @@ static const VMStateDescription vmstate_spapr_cpu_sta=
te =3D {
>      },
>      .subsections =3D (const VMStateDescription * []) {
>          &vmstate_spapr_cpu_vpa,
> +        &vmstate_spapr_cpu_nested,
>          NULL
>      }

The vmstate_spapr_cpu_nested stuff looks good too, this is real
information that we weren't migrating and can't be recovered from elsewhere.

>  };
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 7ee1984500..ae09b1bcfe 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -10,6 +10,7 @@
>  #include "kvm_ppc.h"
>  #include "power8-pmu.h"
>  #include "hw/ppc/ppc.h"
> +#include "hw/ppc/spapr_cpu_core.h"
> =20
>  static void post_load_update_msr(CPUPPCState *env)
>  {
> @@ -679,6 +680,48 @@ static const VMStateDescription vmstate_tb_env =3D {
>      }
>  };
> =20
> +static const VMStateDescription vmstate_hdecr =3D {
> +    .name =3D "cpu/hdecr",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT64(hdecr_next, ppc_tb_t),
> +        VMSTATE_TIMER_PTR(hdecr_timer, ppc_tb_t),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static bool nested_needed(void *opaque)
> +{
> +    PowerPCCPU *cpu =3D opaque;
> +    SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
> +
> +    return spapr_cpu->in_nested;
> +}
> +
> +static int nested_pre_load(void *opaque)
> +{
> +    PowerPCCPU *cpu =3D opaque;
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    cpu_ppc_hdecr_init(env);
> +
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_nested =3D {
> +    .name =3D "cpu/nested-guest",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D nested_needed,
> +    .pre_load =3D nested_pre_load,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_STRUCT_POINTER_V(env.tb_env, PowerPCCPU, 1,
> +                                 vmstate_hdecr, ppc_tb_t),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_ppc_cpu =3D {
>      .name =3D "cpu",
>      .version_id =3D 5,
> @@ -734,6 +777,7 @@ const VMStateDescription vmstate_ppc_cpu =3D {
>          &vmstate_tlbemb,
>          &vmstate_tlbmas,
>          &vmstate_compat,
> +        &vmstate_nested,

The hdecr stuff doesn't seem quite right.  Notionally the L1 cpu,
since it is in PAPR mode, doesn't *have* an HDECR.  It's only the L0
nested-KVM extensions that allow it to kind of fake access to an
HDECR.  We're kind of abusing the HDECR fields in the cpu structure
for this.  At the very least I think the fake-HDECR migration stuff
needs to go in the spapr_cpu_state not the general cpu state, since it
would make no sense if the L1 were a powernv system.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--g5A1Q2krK7+cmyOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIYUBEACgkQgypY4gEw
YSL5ihAAwafHlv19kax56gPadqdsNOhC+NgDZEdwmjiZdOu6kk8KszOlIsXqPanv
qN9fnnHbJO3HLZ3p3IXipd81RI7MkCQlbjON1jhhUiW5LS2lKmNFch7qQvk2+cjg
xXH7vpGk8YplNsxjY6Gs1KkO7QpTqPwc8ztruc5x1brXetyG8T8CAFNoFsfzTWDe
euHjV0s+lyuaQKivBJwh1sTX7K3ggWuz9W0mKyqRM1t/l62fWsm5sPG0quHKSsLY
rbjgd+0QOC3ZUNl/puRT7CeB6Q4YzKmBSgfY8dh+lLwLRZhYbtkIR9fcf600zrom
7CDvUhQP73Wmb1F+ye8OG35kT1G61/iWxuKkUGeEKp9AXoknrOVP8HVuLOMlzUfy
kEl18nd59PBYDEjXmt0mCYMtLHY5Cm5gkulIxsYHB44WQ8DF9DqFLF7hzIwRPdnU
USxFU2Dd0dcpP9Gul8iTpZYqTrmjJ+ALgOIaOr8gHxYoTthHQMDkk9WNlAE0nr/u
ZYb78jJJEAaqopy0eQxN22uL38cHlUI8MKS2nDz2jr4wFQw3kft/lzm4ElD3NN3L
ljPaCw7wi/NHLmJiShNfn9WZCjct4JIpke95ftdNItDA8O0vt8QucAHJihOslLNv
y3JXumOSwqvGuULiaL24DJVGUp8VVz6mCJKR+VM3XdtdS59Ap1k=
=uRNh
-----END PGP SIGNATURE-----

--g5A1Q2krK7+cmyOG--


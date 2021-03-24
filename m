Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E161346EF0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:39:19 +0100 (CET)
Received: from localhost ([::1]:35948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsUQ-0000GD-I0
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPs-0004HS-1a; Tue, 23 Mar 2021 21:34:36 -0400
Received: from ozlabs.org ([203.11.71.1]:48967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPn-0001hK-UC; Tue, 23 Mar 2021 21:34:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4rPZ6D1Fz9sWf; Wed, 24 Mar 2021 12:34:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616549666;
 bh=VI6IIzDEviw+PKFQi8D66uyFR9t3Dx5W9273voKTw40=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iKirFB+YkJozios0QgWwDAG+w8yprK/AYwvsUD/R6MwfquvdEkkAJkUTBl02KmEpc
 1dds2z8oh6Vvi5DhLBIbloZjHyWQBxedBDuCPZJBJV3LCOU1ZmtbvZpXv1lOu0NKz/
 b0uSdY2b9Xl+PaL7iX+E+Ezk/Brgr5sf114efE8U=
Date: Wed, 24 Mar 2021 11:00:09 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 01/10] target/ppc: Extract post_load_update_msr
Message-ID: <YFqBCddzvRkaaq09@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9rqakZopOD/N8b8R"
Content-Disposition: inline
In-Reply-To: <20210323184340.619757-2-richard.henderson@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9rqakZopOD/N8b8R
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 12:43:31PM -0600, Richard Henderson wrote:
> Extract post_load_update_msr to share between cpu_load_old
> and cpu_post_load in updating the msr.
>=20
> Suggested-by: C=E9dric Le Goater <clg@kaod.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0.

> ---
>  target/ppc/machine.c | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
>=20
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 1f7a353c78..09c5765a87 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -10,6 +10,18 @@
>  #include "kvm_ppc.h"
>  #include "exec/helper-proto.h"
> =20
> +static void post_load_update_msr(CPUPPCState *env)
> +{
> +    target_ulong msr =3D env->msr;
> +
> +    /*
> +     * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
> +     * before restoring.  Note that this recomputes hflags and mem_idx.
> +     */
> +    env->msr ^=3D env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
> +    ppc_store_msr(env, msr);
> +}
> +
>  static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
>  {
>      PowerPCCPU *cpu =3D opaque;
> @@ -21,7 +33,6 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int =
version_id)
>      int32_t slb_nr;
>  #endif
>      target_ulong xer;
> -    target_ulong msr;
> =20
>      for (i =3D 0; i < 32; i++) {
>          qemu_get_betls(f, &env->gpr[i]);
> @@ -117,13 +128,7 @@ static int cpu_load_old(QEMUFile *f, void *opaque, i=
nt version_id)
>      qemu_get_sbe32(f); /* Discard unused mmu_idx */
>      qemu_get_sbe32(f); /* Discard unused power_mode */
> =20
> -    /*
> -     * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
> -     * before restoring.  Note that this recomputes hflags and mem_idx.
> -     */
> -    msr =3D env->msr;
> -    env->msr ^=3D env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
> -    ppc_store_msr(env, msr);
> +    post_load_update_msr(env);
> =20
>      return 0;
>  }
> @@ -343,7 +348,6 @@ static int cpu_post_load(void *opaque, int version_id)
>      PowerPCCPU *cpu =3D opaque;
>      CPUPPCState *env =3D &cpu->env;
>      int i;
> -    target_ulong msr;
> =20
>      /*
>       * If we're operating in compat mode, we should be ok as long as
> @@ -417,13 +421,7 @@ static int cpu_post_load(void *opaque, int version_i=
d)
>          ppc_store_sdr1(env, env->spr[SPR_SDR1]);
>      }
> =20
> -    /*
> -     * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
> -     * before restoring.  Note that this recomputes hflags and mem_idx.
> -     */
> -    msr =3D env->msr;
> -    env->msr ^=3D env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
> -    ppc_store_msr(env, msr);
> +    post_load_update_msr(env);
> =20
>      return 0;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9rqakZopOD/N8b8R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBagQcACgkQbDjKyiDZ
s5Lt8Q//Sd1hfURNfUQTfUW/nZyA/Ip+Ac3oYxgqQ1G24oI4ib2u/aUTf1cNe7Wk
cxCBMQdj/gwygxUU9Zn643Q87vXC/rptMT1ZSCxinC7Qq7vbJEnNQ/+pGh5w1oKO
AwEPAXPaAc0rpF3MWtRJZaJnuIOL185ox0D5EMg5lSw18BNyfVq1UTsXlTA2joMh
rzi9JdWbp7yrwFKgtvuX9KQW9aezY8NhER3iBmI2dw9cb0Y8QvaY1bNa7EGu7B3o
+WP2STpxxvUOc/BP0yDo7rLHyR+7TZJmpYuhC+ZniydZlaqUUk2pYc+jEho2DPmH
eJneaK0ObdYUxNrtHyengZoJ5z4XfEwB+9G8LZv67MJ5OHCIYCnuGqBBPLmH4WMB
8x7iF5Bowfyhhhi+BqZINg6UbujimBPPZvJ4jzM4TXbDCIcKiUEOxla8j24oKyNE
6X6GYwpGfP7gtij526k+qtJqzb9VoDfL58T0/QzvTKHL8SS8VuDR8F/1UiZH0vdH
wLto0wRDmjP2FE3P5d3SKnMNl4KaW+3c9kJzHygCSzu+i9gw1PYB8kcM3dq1PV6a
pwqnxJ4AP3LUlYKnqgrL1ZXw7y/VNlD76hDeSOOZPOcbhEzYsHUa27zvDUB4Esuq
frVLKRx/LakXlnW3MkA5ctmY8sXXk6+w1/r7op0RLiUbdpr5VWE=
=g3mo
-----END PGP SIGNATURE-----

--9rqakZopOD/N8b8R--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED9C346EF7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:42:28 +0100 (CET)
Received: from localhost ([::1]:43026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsXT-0003KH-0N
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPs-0004Hb-4j; Tue, 23 Mar 2021 21:34:36 -0400
Received: from ozlabs.org ([203.11.71.1]:39709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPn-0001hT-TB; Tue, 23 Mar 2021 21:34:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4rPb5Mbzz9sWk; Wed, 24 Mar 2021 12:34:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616549667;
 bh=9qkqQMcgah+UhkhCwhdi7Imq6jIomFlwaSuhyldnr80=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JT8mv6W/7e0G49oMqrMj4Od+GCpXMGEnmqhXSmcAVqJJknhl/mNcyT/bclPmbAUpg
 NAmNW5EHpqrcEyV9J6uxN821/BqccuAh3GOHl/EvQ/nkHSf1luBgHZtzXR86/29bQI
 2e00ZwApI/N9p3VlNnIx+kCrunG0JKljzRyYmgC8=
Date: Wed, 24 Mar 2021 11:04:11 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 04/10] target/ppc: Put dbcr0 single-step bits into
 hflags
Message-ID: <YFqB+11z5BNk+m+g@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-5-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x4IgZrYlyjfmh+sF"
Content-Disposition: inline
In-Reply-To: <20210323184340.619757-5-richard.henderson@linaro.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--x4IgZrYlyjfmh+sF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 12:43:34PM -0600, Richard Henderson wrote:
> Because these bits were not in hflags, the code generated
> for single-stepping on BookE was essentially random.
> Recompute hflags when storing to dbcr0.
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0.

> ---
>  target/ppc/helper_regs.c | 24 +++++++++++++++++-------
>  target/ppc/misc_helper.c |  3 +++
>  target/ppc/translate.c   | 11 -----------
>  3 files changed, 20 insertions(+), 18 deletions(-)
>=20
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index df9673b90f..e345966b6b 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -114,13 +114,23 @@ void hreg_compute_hflags(CPUPPCState *env)
>          hflags |=3D le << MSR_LE;
>      }
> =20
> -    if (ppc_flags & POWERPC_FLAG_BE) {
> -        QEMU_BUILD_BUG_ON(MSR_BE !=3D HFLAGS_BE);
> -        msr_mask |=3D 1 << MSR_BE;
> -    }
> -    if (ppc_flags & POWERPC_FLAG_SE) {
> -        QEMU_BUILD_BUG_ON(MSR_SE !=3D HFLAGS_SE);
> -        msr_mask |=3D 1 << MSR_SE;
> +    if (ppc_flags & POWERPC_FLAG_DE) {
> +        target_ulong dbcr0 =3D env->spr[SPR_BOOKE_DBCR0];
> +        if (dbcr0 & DBCR0_ICMP) {
> +            hflags |=3D 1 << HFLAGS_SE;
> +        }
> +        if (dbcr0 & DBCR0_BRT) {
> +            hflags |=3D 1 << HFLAGS_BE;
> +        }
> +    } else {
> +        if (ppc_flags & POWERPC_FLAG_BE) {
> +            QEMU_BUILD_BUG_ON(MSR_BE !=3D HFLAGS_BE);
> +            msr_mask |=3D 1 << MSR_BE;
> +        }
> +        if (ppc_flags & POWERPC_FLAG_SE) {
> +            QEMU_BUILD_BUG_ON(MSR_SE !=3D HFLAGS_SE);
> +            msr_mask |=3D 1 << MSR_SE;
> +        }
>      }
> =20
>      if (msr_is_64bit(env, msr)) {
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index b04b4d7c6e..002958be26 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -215,6 +215,9 @@ void helper_store_403_pbr(CPUPPCState *env, uint32_t =
num, target_ulong value)
> =20
>  void helper_store_40x_dbcr0(CPUPPCState *env, target_ulong val)
>  {
> +    /* Bits 26 & 27 affect single-stepping. */
> +    hreg_compute_hflags(env);
> +    /* Bits 28 & 29 affect reset or shutdown. */
>      store_40x_dbcr0(env, val);
>  }
> =20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index a85b890bb0..7912495f28 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7923,17 +7923,6 @@ static void ppc_tr_init_disas_context(DisasContext=
Base *dcbase, CPUState *cs)
>      if ((hflags >> HFLAGS_BE) & 1) {
>          ctx->singlestep_enabled |=3D CPU_BRANCH_STEP;
>      }
> -    if ((env->flags & POWERPC_FLAG_DE) && msr_de) {
> -        ctx->singlestep_enabled =3D 0;
> -        target_ulong dbcr0 =3D env->spr[SPR_BOOKE_DBCR0];
> -        if (dbcr0 & DBCR0_ICMP) {
> -            ctx->singlestep_enabled |=3D CPU_SINGLE_STEP;
> -        }
> -        if (dbcr0 & DBCR0_BRT) {
> -            ctx->singlestep_enabled |=3D CPU_BRANCH_STEP;
> -        }
> -
> -    }
>      if (unlikely(ctx->base.singlestep_enabled)) {
>          ctx->singlestep_enabled |=3D GDBSTUB_SINGLE_STEP;
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--x4IgZrYlyjfmh+sF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBagfsACgkQbDjKyiDZ
s5LreQ//R00lqvoyjzG5aukYJphsaBo16WMimYT/20IzqMNhEKuAA+ssfDnxpLko
AuR+fAjkuDBgxI5ayAPDBKWwPCk/F1dZ4FLhf4xSD52VRFMxbyQm1wKakxObrQ20
pznTEMktbg+mhjLcg5txRK3c4sXsSYgLRRHp52rAj6K+I30m7iUnHyUQ1102f2LS
LE7HXdSeXBHoQp2zPBgtGlQAMA301veQiRTfjisYXfs9zN38K35JWL9sAe8EnrAT
Bj5l+HQSBI9hHPZ+2rOnVvg3MnanfG4KUmStxNUKiQ1L2N0e4J0Lnyl/xWkXTDsS
Z1x0rkpRI9lULKOrilLjQeIs2Ja5JxCPxQ5Ks3zf/0ptC5gGMc26d8vQHPxKy5mC
7m5jYFUHD3ZoetLiD0MCWnaeSo2zj7d9FL8qan8otPdDN+lUUu3vVFwMdll9ewBv
FGJVzGElpAoBbnaLbtdgZ9ghMhps+pTjvm/XiNrCyckZEf+6xQYnOPAO1lczUo3Y
IQY5i6IKM80zUnjznswyuUQmxw9rbmiJhXwTglDFqfa4h2XYlLIn6T0fvTIbdNkJ
t2TaRXH5dDWHUk4Jasc1KRWMUShY7wmTlG0nxzq0T604OrRkc6A1Vua68qqjA1hy
VPCJnVGua5tcnR69JCLaHq/VCmbM+ug6m/tHyojo1HMBRCROlhM=
=2/Fl
-----END PGP SIGNATURE-----

--x4IgZrYlyjfmh+sF--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C3F3437E1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 05:24:15 +0100 (CET)
Received: from localhost ([::1]:38192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOC6w-00015v-9R
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 00:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv9-0006PX-69; Mon, 22 Mar 2021 00:12:03 -0400
Received: from ozlabs.org ([203.11.71.1]:35179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv3-0004kY-54; Mon, 22 Mar 2021 00:11:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzz2x6Nz9sXL; Mon, 22 Mar 2021 15:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386303;
 bh=6KDyu9tewzANOS4AzC/7UZYo6uiFabqy/rs6Je0wdfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mMZC2BngoKADayd6ChRBtB0PPTkVXwRtSB4tQyybVVYjkZ0BGkBQ/44XesQLNLiIa
 bznXFAdW2dR9d4IpLBXI2LQafQ7FbXAe98m0YHAlWZWUz+sgpHRvrCEkr4yi8QdNsb
 8qNpIUuUR6RIUJI9xkNaxQnSM5TAO7HoGnSZR3os=
Date: Mon, 22 Mar 2021 14:55:21 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 09/17] target/ppc: Put dbcr0 single-step bits into
 hflags
Message-ID: <YFgVKQMcSQG+dHwJ@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-10-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Zl1pRtzvy4LD+wV2"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-10-richard.henderson@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


--Zl1pRtzvy4LD+wV2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:07PM -0600, Richard Henderson wrote:
> Because these bits were not in hflags, the code generated
> for single-stepping on BookE was essentially random.
> Recompute hflags when storing to dbcr0.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/helper_regs.c | 20 +++++++++++++++-----
>  target/ppc/misc_helper.c |  3 +++
>  target/ppc/translate.c   | 11 -----------
>  3 files changed, 18 insertions(+), 16 deletions(-)
>=20
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 0a746bffd7..c735540333 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -107,11 +107,21 @@ void hreg_compute_hflags(CPUPPCState *env)
>          hflags |=3D le << MSR_LE;
>      }
> =20
> -    if (ppc_flags & POWERPC_FLAG_BE) {
> -        msr_mask |=3D 1 << MSR_BE;
> -    }
> -    if (ppc_flags & POWERPC_FLAG_SE) {
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
> +            msr_mask |=3D 1 << MSR_BE;
> +        }
> +        if (ppc_flags & POWERPC_FLAG_SE) {
> +            msr_mask |=3D 1 << MSR_SE;
> +        }
>      }
> =20
>      if (msr_is_64bit(env, msr)) {
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index b04b4d7c6e..a5ee1fd63c 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -215,6 +215,9 @@ void helper_store_403_pbr(CPUPPCState *env, uint32_t =
num, target_ulong value)
> =20
>  void helper_store_40x_dbcr0(CPUPPCState *env, target_ulong val)
>  {
> +    /* Bits 26 & 27 affect single-stepping */
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

--Zl1pRtzvy4LD+wV2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYFSkACgkQbDjKyiDZ
s5JwwhAAoaiRLZlZ6G5LpnNAmDdo48ythGwmbiEdb+Fi/fCVugdD5cDcXEBq+cih
uPEm65KBirgbmZ1hL9rMwNtRaGJphHbdKV1yWk9bHFspjmroYWY+FTFjccg31WuT
ME4A/DvciwqogFByMwtv9Rv5ZcQnYm0vTUJkb2SVesGkgXNinBgDqu3JF5I+cEva
27iDxPw5MFaul4o3pS/7UUfXBr9DoCtbBG9s08vEWUQIutlyQmbGDy8yR9+dsfqD
fdma2s04K4DkXcGMG1q3RqYvw1OcuD8hR8Uz+/ZLMDCrSOd4W9kbpKBW0lYfKVWi
O88/xV3tNaNAs+2GuiGa8D0kwuk2h+9H4OqZxR24ORQMa9C4wIB1FmX6tOuzKjvI
xOgqVo9NTNar5Q4TOCakyh9fZQaEC3aB0DoivWnL6Wh+jMf5bwHbCWQA83Ov3TJQ
CsQPwYBn06LxcTE/2NgCVnY+hFsr//7xQASPRCQDH1Htms3pO872GU6uprnCGLxl
UvmbWDHRK2Is0CIGPFCULUrgVRWxJ6mCAElM2pBxMMHdgJFIE4Jv7Y1Nyl+0KVyJ
KDd/JVYzda0KPak7ttcjqSxsx29jK6uMNy5U0hjjdzvbElahO9Gmvr63UX/XbVMy
NxeSDC4kLITL/yKyw+XMO9nE5sDX1iWT5Y5Y32HfRJghxC7dP80=
=5lGh
-----END PGP SIGNATURE-----

--Zl1pRtzvy4LD+wV2--


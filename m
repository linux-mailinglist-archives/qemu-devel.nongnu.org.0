Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0441343835
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 06:17:22 +0100 (CET)
Received: from localhost ([::1]:57998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOCwL-0006P2-SH
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 01:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOCu0-0004Ho-RA; Mon, 22 Mar 2021 01:14:56 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:47913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOCtw-0004av-38; Mon, 22 Mar 2021 01:14:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3jNk20X1z9sW4; Mon, 22 Mar 2021 16:14:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616390086;
 bh=Sc43U40EIJLMjKzOPvvBNDpbVWduT22HHdc1Ieq5mkQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AeJCd6zB5WSzmsjjZOC3A6Ss8yTYIM9X/QP4PYrY4mk3LMR7RBtNtOY679FQhhWd+
 YrAqw32EjVD0kNk0W4qahHgePa6/f8Rn2p5LrrDM7qM48u44DUSFiMO3QPuAm1Z+zx
 SiA/rPnCwjeMrbG65YhzUqZGO6KGeZBg/huLu6DI=
Date: Mon, 22 Mar 2021 15:18:08 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 11/17] target/ppc: Put LPCR[GTSE] in hflags
Message-ID: <YFgagAGVqu4dI1qF@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-12-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="phqNXId0FBSdPJCa"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-12-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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


--phqNXId0FBSdPJCa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:09PM -0600, Richard Henderson wrote:
> Because this bit was not in hflags, the privilege check
> for tlb instructions was essentially random.
> Recompute hflags when storing to LPCR.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Ouch.  Unlike the others which come from ancient strata of qemu code,
this one is pretty recent, and demonstrates that I don't really
understand how hflags and TCG code generation work.  Anyway,

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu.h         | 1 +
>  target/ppc/helper_regs.c | 3 +++
>  target/ppc/mmu-hash64.c  | 3 +++
>  target/ppc/translate.c   | 2 +-
>  4 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 2abaf56869..07a4331eec 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -603,6 +603,7 @@ enum {
>      HFLAGS_TM =3D 8,   /* computed from MSR_TM */
>      HFLAGS_BE =3D 9,   /* MSR_BE -- from elsewhere on embedded ppc */
>      HFLAGS_SE =3D 10,  /* MSR_SE -- from elsewhere on embedded ppc */
> +    HFLAGS_GTSE =3D 11, /* computed from SPR_LPCR[GTSE] */
>      HFLAGS_FP =3D 13,  /* MSR_FP */
>      HFLAGS_SA =3D 22,  /* MSR_SA */
>      HFLAGS_AP =3D 23,  /* MSR_AP */
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index c735540333..8479789e24 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -139,6 +139,9 @@ void hreg_compute_hflags(CPUPPCState *env)
>      if ((ppc_flags & POWERPC_FLAG_TM) && (msr & (1ull << MSR_TM))) {
>          hflags |=3D 1 << HFLAGS_TM;
>      }
> +    if (env->spr[SPR_LPCR] & LPCR_GTSE) {
> +        hflags |=3D 1 << HFLAGS_GTSE;
> +    }
> =20
>  #ifndef CONFIG_USER_ONLY
>      if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 0fabc10302..d517a99832 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -30,6 +30,7 @@
>  #include "exec/log.h"
>  #include "hw/hw.h"
>  #include "mmu-book3s-v3.h"
> +#include "helper_regs.h"
> =20
>  /* #define DEBUG_SLB */
> =20
> @@ -1125,6 +1126,8 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong v=
al)
>      CPUPPCState *env =3D &cpu->env;
> =20
>      env->spr[SPR_LPCR] =3D val & pcc->lpcr_mask;
> +    /* The gtse bit affects hflags */
> +    hreg_compute_hflags(env);
>  }
> =20
>  void helper_store_lpcr(CPUPPCState *env, target_ulong val)
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index d48c554290..5e629291d3 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7908,7 +7908,7 @@ static void ppc_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
>      ctx->altivec_enabled =3D (hflags >> HFLAGS_VR) & 1;
>      ctx->vsx_enabled =3D (hflags >> HFLAGS_VSX) & 1;
>      ctx->tm_enabled =3D (hflags >> HFLAGS_TM) & 1;
> -    ctx->gtse =3D !!(env->spr[SPR_LPCR] & LPCR_GTSE);
> +    ctx->gtse =3D (hflags >> HFLAGS_GTSE) & 1;
> =20
>      ctx->singlestep_enabled =3D 0;
>      if ((hflags >> HFLAGS_SE) & 1) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--phqNXId0FBSdPJCa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYGoAACgkQbDjKyiDZ
s5K1uw/+J3erl0WzQr8GyO/kqnijftyPY8T+Pmn//KBwnwh9+7fOEof5HGIzrHvh
cmbbS++JYDszbdFhB8LaWCbhG6IWHYgceoHOEMmaeav5u9ktdukszYjTJSxN8fHG
qKLxZJH/zq4TdNz37mw8PxBTWQ8ORmOB0xlppWqnxZt6cCYjwebuIizaRh0W8dRu
LhpnpmNsxNNGDpsbWsLLWVRwBfGxnt8h2y+J7hK9X1X4qUFX2COQj2Pq6ZoOseF8
ss823VTNxC9kzUZkv1v9JxLK2LUOy7cNgrZvHkEg/pM8NOlX30u2ws8ETJcaE+mV
HTLb03uZNdMV1TzBxX9RONDKW2crjidYZ799HHYwrMa9bAIv6Wrty3zV/ARaRiQz
EH7lQI8iJYKY0QldffKrm8xcumEiRcdLlKlwYGqtusW2BteABk7s4szwPKczHdss
PzQN3CAOaIY36X0puRiYfBLF0isyTH8i9cEP6fG7x4mHhOTAh4mWUjiVrbcJDSiV
VlU+nXkLM+1O6XHeUsfEM7IXe4M4KEMiS0XTWh1E56XjhIDoE3/hYKnLfawwz30L
U2TrgP3/9Y9IW1PmRk2NXQJ/bW+n85GlS53hNxATpRISWlSG1kmCxP29667gsH+J
zRaf77UHivy/4W5pWMtvkCGwOG8XuK3OG0m8S+l6QKEfPFeD0NE=
=DScZ
-----END PGP SIGNATURE-----

--phqNXId0FBSdPJCa--


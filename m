Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A67A346EF8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:42:49 +0100 (CET)
Received: from localhost ([::1]:43560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsXo-0003bD-Dc
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPu-0004NC-TU; Tue, 23 Mar 2021 21:34:38 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57467 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPs-0001lg-Tq; Tue, 23 Mar 2021 21:34:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4rPc100Gz9sWr; Wed, 24 Mar 2021 12:34:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616549668;
 bh=49MrUU3LzhRvLJJvYEW+UfGbn+JgZ/9+wI8k2/XInmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jpqpN9itDDdnO/NJ6ZYOAt125o0yvJ2vxUNelpUnXi8WO+zNSgf007AJk1kApNSTz
 akf8CBSiMGKSpYQgt4JGELPEn2ruQnxLSsca79kLbfMOKZRtkwqOYA9mPdFVsKviBH
 rq1OoaafKQFS5BpX+9AQk9kD9NUdEVcFXE6SQOfE=
Date: Wed, 24 Mar 2021 11:06:24 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 06/10] target/ppc: Put LPCR[GTSE] in hflags
Message-ID: <YFqCgBjjYCFxKKEP@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-7-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Rb90YTesYsWGhNXF"
Content-Disposition: inline
In-Reply-To: <20210323184340.619757-7-richard.henderson@linaro.org>
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


--Rb90YTesYsWGhNXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 12:43:36PM -0600, Richard Henderson wrote:
> Because this bit was not in hflags, the privilege check
> for tlb instructions was essentially random.
> Recompute hflags when storing to LPCR.
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0, thanks.

> ---
>  target/ppc/cpu.h         | 1 +
>  target/ppc/helper_regs.c | 3 +++
>  target/ppc/mmu-hash64.c  | 3 +++
>  target/ppc/translate.c   | 2 +-
>  4 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index d5f362506a..3c28ddb331 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -596,6 +596,7 @@ enum {
>      HFLAGS_LE =3D 0,   /* MSR_LE -- comes from elsewhere on 601 */
>      HFLAGS_HV =3D 1,   /* computed from MSR_HV and other state */
>      HFLAGS_64 =3D 2,   /* computed from MSR_CE and MSR_SF */
> +    HFLAGS_GTSE =3D 3, /* computed from SPR_LPCR[GTSE] */
>      HFLAGS_DR =3D 4,   /* MSR_DR */
>      HFLAGS_IR =3D 5,   /* MSR_IR */
>      HFLAGS_SPE =3D 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ =
MSR_VR */
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index e345966b6b..f85bb14d1d 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -149,6 +149,9 @@ void hreg_compute_hflags(CPUPPCState *env)
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

--Rb90YTesYsWGhNXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBagoAACgkQbDjKyiDZ
s5KVDA//WAH1YK5HyExpJ7IbhFWMPOYhsubExFW5Ls37ilX6q/Xs2KbXDm86yPp/
XPPXDe7xxPrJ76nhWz/bspsluv8VhOYU3o0N6ojMc+xqRz1vFn1tOxJ7PwrB8tTN
MjxNIoM+ylMuEciVT212quiVwQL3zfhy+YWw+W1uz5br2GRebp2fhIzH2PM/738L
EiU1tcLeWZjgstOPUOD0+WXcqnsmDaVaNCOoeqIbVbGMKwxNTIvFkZ23NHEilSbp
KyeF8holqnjHenDo8rkul544ECICe30P3qyowyAb8BlbX6rpMjZUwRaaNL6V3iuZ
WqF3WjQAkCvZCRvvwzQgV6JjxNTFG0x6Zy0VykqkjiYXC/OVd6IKb7MRL7mt2HUD
X1RMeO0oEEdD/CL1WqFUDmm/w6OOxr2Q9GnRX4H5b/kfEEWLMHjyIiOkZ95eC+kQ
lwOxnTn4im4AI3NhUyLVhenKoRjddTicu/m7wAzV3P8Txs6yOHiEl+sJ9HNBhenr
3BJN1xQXZATAM7TXAJJ7I2n9iqIl/jTo3jmTFZKBOegGYP5FjHt6UYHbpm8bZlx/
zvaMSh35WiHDJVO875bHeo1kGhL/CaR2VXfsTaK5guyy5Q1itYf8MzT6EqNQDiQZ
cyc0SHxsWvyilzcTaGlLLkGqmcrw1wjsRS8c+R1kLPI8h5U9GX8=
=nZ56
-----END PGP SIGNATURE-----

--Rb90YTesYsWGhNXF--


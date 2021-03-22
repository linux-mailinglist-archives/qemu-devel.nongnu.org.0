Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA07E3437D0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 05:16:19 +0100 (CET)
Received: from localhost ([::1]:46862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOBzG-00013D-O8
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 00:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv9-0006Pd-7q; Mon, 22 Mar 2021 00:12:03 -0400
Received: from ozlabs.org ([203.11.71.1]:34263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv3-0004kN-5q; Mon, 22 Mar 2021 00:11:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzz23jVz9sXG; Mon, 22 Mar 2021 15:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386303;
 bh=doG+BKcYEoK9YJsoKogarPOaKJkxH/ix2dEDR1RDgn4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OSiSdEWc7i3tA4zlJV5E9dVd7pvqO5F+UOrF+OpqRkfK1kl3HYQiI0Rt7EJLvmpQs
 z6tzx7F1ityt3nXXX89F2eT5HrYMDFoDABlSA8ycj/qnu/VrfR69DQtecExIzAGHNB
 n7CWl0pam0T5YirPyPOXnWJJ+1iDg0tpB1vyzBzg=
Date: Mon, 22 Mar 2021 14:52:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 07/17] target/ppc: Disconnect hflags from MSR
Message-ID: <YFgUkS3iyr/k9/hE@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-8-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6bIDz1p3fDlJDboF"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-8-richard.henderson@linaro.org>
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6bIDz1p3fDlJDboF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:05PM -0600, Richard Henderson wrote:
> Copying flags directly from msr has drawbacks: (1) msr bits
> mean different things per cpu, (2) msr has 64 bits on 64 cpus
> while tb->flags has only 32 bits.
>=20
> Create a enum to define these bits.  Document the origin of each bit.
> This fixes the truncation of env->hflags to tb->flags, because we no
> longer have hflags bits set above bit 31.
>=20
> Most of the code in ppc_tr_init_disas_context is moved over to
> hreg_compute_hflags.  Some of it is simple extractions from msr,
> some requires examining other cpu flags.  Anything that is moved
> becomes a simple extract from hflags in ppc_tr_init_disas_context.
>=20
> Several existing bugs are left in ppc_tr_init_disas_context, where
> additional changes are required -- to be addressed in future patches.
>=20
> Remove a broken #if 0 block.
>=20
> Reported-by: Ivan Warren <ivan@vmfacility.fr>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/cpu.h         | 24 ++++++++++++++++++
>  target/ppc/helper_regs.c | 55 ++++++++++++++++++++++++++++++++--------
>  target/ppc/translate.c   | 55 ++++++++++++----------------------------
>  3 files changed, 84 insertions(+), 50 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index fd13489dce..39f35b570c 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -585,6 +585,30 @@ enum {
>      POWERPC_FLAG_HID0_LE  =3D 0x00400000,
>  };
> =20
> +/*
> + * Bits for env->hflags.
> + *
> + * Most of these bits overlap with corresponding bits in MSR,
> + * but some come from other sources.  Be cautious when modifying.

Yeah.. I'm not sure "be cautious" is enough of a warning.  The exact
value of some but not all of these flags must equal that for the
corresponding MSR bits, which is terrifyingly subtle.

> + */
> +enum {
> +    HFLAGS_LE =3D 0,   /* MSR_LE -- comes from elsewhere on 601 */
> +    HFLAGS_HV =3D 1,   /* computed from MSR_HV and other state */
> +    HFLAGS_64 =3D 2,   /* computed from MSR_CE and MSR_SF */
> +    HFLAGS_PR =3D 3,   /* MSR_PR */
> +    HFLAGS_DR =3D 4,   /* MSR_DR */
> +    HFLAGS_IR =3D 5,   /* MSR_IR */
> +    HFLAGS_SPE =3D 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ =
MSR_VR */
> +    HFLAGS_VSX =3D 7,  /* from MSR_VSX if cpu has VSX; avoid overlap w/ =
MSR_AP */
> +    HFLAGS_TM =3D 8,   /* computed from MSR_TM */
> +    HFLAGS_BE =3D 9,   /* MSR_BE -- from elsewhere on embedded ppc */
> +    HFLAGS_SE =3D 10,  /* MSR_SE -- from elsewhere on embedded ppc */
> +    HFLAGS_FP =3D 13,  /* MSR_FP */
> +    HFLAGS_SA =3D 22,  /* MSR_SA */
> +    HFLAGS_AP =3D 23,  /* MSR_AP */
> +    HFLAGS_VR =3D 25,  /* MSR_VR if cpu has VRE */
> +};
> +
>  /***********************************************************************=
******/
>  /* Floating point status and control register                           =
     */
>  #define FPSCR_DRN2   34 /* Decimal Floating-Point rounding control      =
     */
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index a87e354ca2..0a746bffd7 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -18,6 +18,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "cpu.h"
>  #include "qemu/main-loop.h"
>  #include "exec/exec-all.h"
>  #include "sysemu/kvm.h"
> @@ -87,24 +88,56 @@ void hreg_compute_mem_idx(CPUPPCState *env)
> =20
>  void hreg_compute_hflags(CPUPPCState *env)
>  {
> -    target_ulong hflags_mask;
> +    target_ulong msr =3D env->msr;
> +    uint32_t ppc_flags =3D env->flags;
> +    uint32_t hflags =3D 0;
> +    uint32_t msr_mask;
> =20
> -    /* We 'forget' FE0 & FE1: we'll never generate imprecise exceptions =
*/
> -    hflags_mask =3D (1 << MSR_VR) | (1 << MSR_AP) | (1 << MSR_SA) |
> -        (1 << MSR_PR) | (1 << MSR_FP) | (1 << MSR_SE) | (1 << MSR_BE) |
> -        (1 << MSR_LE) | (1 << MSR_VSX) | (1 << MSR_IR) | (1 << MSR_DR);
> -    hflags_mask |=3D (1ULL << MSR_CM) | (1ULL << MSR_SF) | MSR_HVB;
> -    hreg_compute_mem_idx(env);
> -    env->hflags =3D env->msr & hflags_mask;
> +    /* Some bits come straight across from MSR. */
> +    msr_mask =3D ((1 << MSR_LE) | (1 << MSR_PR) |
> +                (1 << MSR_DR) | (1 << MSR_IR) |
> +                (1 << MSR_FP) | (1 << MSR_SA) | (1 << MSR_AP));
> =20
> -    if (env->flags & POWERPC_FLAG_HID0_LE) {
> +    if (ppc_flags & POWERPC_FLAG_HID0_LE) {
>          /*
>           * Note that MSR_LE is not set in env->msr_mask for this cpu,
> -         * and so will never be set in msr or hflags at this point.
> +         * and so will never be set in msr.
>           */
>          uint32_t le =3D extract32(env->spr[SPR_HID0], 3, 1);
> -        env->hflags |=3D le << MSR_LE;
> +        hflags |=3D le << MSR_LE;
>      }
> +
> +    if (ppc_flags & POWERPC_FLAG_BE) {
> +        msr_mask |=3D 1 << MSR_BE;
> +    }
> +    if (ppc_flags & POWERPC_FLAG_SE) {
> +        msr_mask |=3D 1 << MSR_SE;
> +    }
> +
> +    if (msr_is_64bit(env, msr)) {
> +        hflags |=3D 1 << HFLAGS_64;
> +    }
> +    if ((ppc_flags & POWERPC_FLAG_SPE) && (msr & (1 << MSR_SPE))) {
> +        hflags |=3D 1 << HFLAGS_SPE;
> +    }
> +    if (ppc_flags & POWERPC_FLAG_VRE) {
> +        msr_mask |=3D 1 << MSR_VR;
> +    }
> +    if ((ppc_flags & POWERPC_FLAG_VSX) && (msr & (1 << MSR_VSX))) {
> +        hflags |=3D 1 << HFLAGS_VSX;
> +    }
> +    if ((ppc_flags & POWERPC_FLAG_TM) && (msr & (1ull << MSR_TM))) {
> +        hflags |=3D 1 << HFLAGS_TM;
> +    }
> +
> +#ifndef CONFIG_USER_ONLY
> +    if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
> +        hflags |=3D 1 << HFLAGS_HV;
> +    }
> +#endif
> +
> +    env->hflags =3D hflags | (msr & msr_mask);

I feel like it would be better to explicitly translate *all* the bits,
so that the hflags bits numbers really are disentangled from the MSR
bit numbers.  Or if we really must do this, then have some build time
asserts to ensure that (MSR_LE =3D=3D HFLAGS_LE) and so forth.

> +    hreg_compute_mem_idx(env);
>  }
> =20
>  void cpu_interrupt_exittb(CPUState *cs)
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 0984ce637b..a9325a12e5 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7879,67 +7879,48 @@ static void ppc_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>  {
>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
>      CPUPPCState *env =3D cs->env_ptr;
> +    uint32_t hflags =3D ctx->base.tb->flags;
>      int bound;
> =20
>      ctx->exception =3D POWERPC_EXCP_NONE;
>      ctx->spr_cb =3D env->spr_cb;
> -    ctx->pr =3D msr_pr;
> +    ctx->pr =3D (hflags >> HFLAGS_PR) & 1;
>      ctx->mem_idx =3D env->dmmu_idx;
> -    ctx->dr =3D msr_dr;
> -#if !defined(CONFIG_USER_ONLY)
> -    ctx->hv =3D msr_hv || !env->has_hv_mode;
> -#endif
> +    ctx->dr =3D (hflags >> HFLAGS_DR) & 1;
> +    ctx->hv =3D (hflags >> HFLAGS_HV) & 1;
>      ctx->insns_flags =3D env->insns_flags;
>      ctx->insns_flags2 =3D env->insns_flags2;
>      ctx->access_type =3D -1;
>      ctx->need_access_type =3D !mmu_is_64bit(env->mmu_model);
> -    ctx->le_mode =3D !!(env->hflags & (1 << MSR_LE));
> +    ctx->le_mode =3D (hflags >> HFLAGS_LE) & 1;
>      ctx->default_tcg_memop_mask =3D ctx->le_mode ? MO_LE : MO_BE;
>      ctx->flags =3D env->flags;
>  #if defined(TARGET_PPC64)
> -    ctx->sf_mode =3D msr_is_64bit(env, env->msr);
> +    ctx->sf_mode =3D (hflags >> HFLAGS_64) & 1;
>      ctx->has_cfar =3D !!(env->flags & POWERPC_FLAG_CFAR);
>  #endif
>      ctx->lazy_tlb_flush =3D env->mmu_model =3D=3D POWERPC_MMU_32B
>          || env->mmu_model =3D=3D POWERPC_MMU_601
>          || env->mmu_model & POWERPC_MMU_64;
> =20
> -    ctx->fpu_enabled =3D !!msr_fp;
> -    if ((env->flags & POWERPC_FLAG_SPE) && msr_spe) {
> -        ctx->spe_enabled =3D !!msr_spe;
> -    } else {
> -        ctx->spe_enabled =3D false;
> -    }
> -    if ((env->flags & POWERPC_FLAG_VRE) && msr_vr) {
> -        ctx->altivec_enabled =3D !!msr_vr;
> -    } else {
> -        ctx->altivec_enabled =3D false;
> -    }
> -    if ((env->flags & POWERPC_FLAG_VSX) && msr_vsx) {
> -        ctx->vsx_enabled =3D !!msr_vsx;
> -    } else {
> -        ctx->vsx_enabled =3D false;
> -    }
> +    ctx->fpu_enabled =3D (hflags >> HFLAGS_FP) & 1;
> +    ctx->spe_enabled =3D (hflags >> HFLAGS_SPE) & 1;
> +    ctx->altivec_enabled =3D (hflags >> HFLAGS_VR) & 1;
> +    ctx->vsx_enabled =3D (hflags >> HFLAGS_VSX) & 1;
>      if ((env->flags & POWERPC_FLAG_SCV)
>          && (env->spr[SPR_FSCR] & (1ull << FSCR_SCV))) {
>          ctx->scv_enabled =3D true;
>      } else {
>          ctx->scv_enabled =3D false;
>      }
> -#if defined(TARGET_PPC64)
> -    if ((env->flags & POWERPC_FLAG_TM) && msr_tm) {
> -        ctx->tm_enabled =3D !!msr_tm;
> -    } else {
> -        ctx->tm_enabled =3D false;
> -    }
> -#endif
> +    ctx->tm_enabled =3D (hflags >> HFLAGS_TM) & 1;
>      ctx->gtse =3D !!(env->spr[SPR_LPCR] & LPCR_GTSE);
> -    if ((env->flags & POWERPC_FLAG_SE) && msr_se) {
> -        ctx->singlestep_enabled =3D CPU_SINGLE_STEP;
> -    } else {
> -        ctx->singlestep_enabled =3D 0;
> +
> +    ctx->singlestep_enabled =3D 0;
> +    if ((hflags >> HFLAGS_SE) & 1) {
> +        ctx->singlestep_enabled |=3D CPU_SINGLE_STEP;
>      }
> -    if ((env->flags & POWERPC_FLAG_BE) && msr_be) {
> +    if ((hflags >> HFLAGS_BE) & 1) {
>          ctx->singlestep_enabled |=3D CPU_BRANCH_STEP;
>      }
>      if ((env->flags & POWERPC_FLAG_DE) && msr_de) {
> @@ -7956,10 +7937,6 @@ static void ppc_tr_init_disas_context(DisasContext=
Base *dcbase, CPUState *cs)
>      if (unlikely(ctx->base.singlestep_enabled)) {
>          ctx->singlestep_enabled |=3D GDBSTUB_SINGLE_STEP;
>      }
> -#if defined(DO_SINGLE_STEP) && 0
> -    /* Single step trace mode */
> -    msr_se =3D 1;
> -#endif
> =20
>      bound =3D -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
>      ctx->base.max_insns =3D MIN(ctx->base.max_insns, bound);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6bIDz1p3fDlJDboF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYFI8ACgkQbDjKyiDZ
s5IJCRAAws9UeeBzhHLmqH6hNXBenkLFnY4RwlwI5HK1BLqyu0w2tTNjax7XeeoH
DpqOcg3vXKyfToYAbjhyHT2jBQNlaYPWLA8AQeTqvCOjnscqQxvTyyNIu9eDjsP7
U1fNJjWs0Ob8jX021RNZVkb598rjXTjtEn/QLmXRyRo5RuqsseI3LbRXv/LBV97c
zIbrHsln8YNTDHVn72etZeEd7b6OrW5B0J8Na1Qy9sZibnuJkV4jjEhDbPPN1J7A
cb+YXZ0V4EmmeLDA+iDbn9StT1XsFxCg9HAiCZlSZYjrJChRY5rZo5k1hZD69Yo/
vUHq7ZrsaSWdC38Z8vSo491vqWKj/2hYNJbl8uk6IIwN4h6jlrU6vAcxA+35RvMD
EwQygAZ/PwrXyuR6w1EmopfYnq+NkjvyoyEr9oQCMzTZuLkjhJsWBsZRqC4SuESz
nWPx6izDEywF/Gqxt6HP4HD7ieStYawC6g5d0A1EA8ZXarBmLLVTehYAU0F6v/p6
qR1TebjJjTLt+59/f58NDb24yYBKOY8ujr0wpO3/kPPfMqJ5imI4GMrtLs+4GpdP
LL8FCkyQrm6iBlxwBzFWvzFVHg2135keeqzdZLS+1UBzrX12T4nDxE8xqp/f2uPr
qpol6anSCvsCYAfAPdFGpC4RXvZSDOCAgfzestmpWofeVlcCi/c=
=fHSI
-----END PGP SIGNATURE-----

--6bIDz1p3fDlJDboF--


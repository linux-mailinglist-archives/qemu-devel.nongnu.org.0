Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EB2343833
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 06:17:03 +0100 (CET)
Received: from localhost ([::1]:57276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOCw2-00066C-QO
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 01:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOCu1-0004I8-G4; Mon, 22 Mar 2021 01:14:57 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:60989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOCtw-0004at-7R; Mon, 22 Mar 2021 01:14:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3jNk2cQ6z9sWC; Mon, 22 Mar 2021 16:14:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616390086;
 bh=V10qC79S4NThnqd6sQt700Gz4clhT9YTZtnAFtLecLQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IGJp/pYnNTuLbhsMNUrxwkJviaNhh1hMc1/+7ALZfz7iQ/OMBijD2OlCHg3OZ3ksH
 TcqBLuqaHb8MxsGKVC++fypeLfqk7XHIt+UUQKmbi0X3DfDhq5H8u6FeckrgMuFrVY
 KOmOy8BtR8dDGfM4SF2CQDswA6vM+jNYZrAX13WY=
Date: Mon, 22 Mar 2021 15:26:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 13/17] target/ppc: Remove env->immu_idx and
 env->dmmu_idx
Message-ID: <YFgcbsRHrTxRqKI8@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-14-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z39XsVp1o80oH+u/"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-14-richard.henderson@linaro.org>
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


--z39XsVp1o80oH+u/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:11PM -0600, Richard Henderson wrote:
> We weren't recording MSR_GS in hflags, which means that BookE
> memory accesses were essentially random vs Guest State.
>=20
> Instead of adding this bit directly, record the completed mmu
> indexes instead.  This makes it obvious that we are recording
> exactly the information that we need.
>=20
> This also means that we can stop directly recording MSR_IR.

What still uses MSR_DR, that you can't also drop it?

>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu.h         | 12 ++++--
>  target/ppc/helper_regs.h |  1 -
>  target/ppc/helper_regs.c | 88 ++++++++++++++++++++--------------------
>  target/ppc/mem_helper.c  |  2 +-
>  target/ppc/translate.c   |  6 +--
>  5 files changed, 55 insertions(+), 54 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 23ff16c154..2f8d7fa13c 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -597,7 +597,6 @@ enum {
>      HFLAGS_64 =3D 2,   /* computed from MSR_CE and MSR_SF */
>      HFLAGS_PR =3D 3,   /* MSR_PR */
>      HFLAGS_DR =3D 4,   /* MSR_DR */
> -    HFLAGS_IR =3D 5,   /* MSR_IR */
>      HFLAGS_SPE =3D 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ =
MSR_VR */
>      HFLAGS_TM =3D 8,   /* computed from MSR_TM */
>      HFLAGS_BE =3D 9,   /* MSR_BE -- from elsewhere on embedded ppc */
> @@ -606,6 +605,9 @@ enum {
>      HFLAGS_FP =3D 13,  /* MSR_FP */
>      HFLAGS_VSX =3D 23, /* MSR_VSX if cpu has VSX */
>      HFLAGS_VR =3D 25,  /* MSR_VR if cpu has VRE */
> +
> +    HFLAGS_IMMU_IDX =3D 26, /* 26..28 -- the composite immu_idx */
> +    HFLAGS_DMMU_IDX =3D 29, /* 29..31 -- the composite dmmu_idx */
>  };
> =20
>  /***********************************************************************=
******/
> @@ -1130,8 +1132,6 @@ struct CPUPPCState {
>      /* These resources are used only in TCG */
>      uint32_t hflags;
>      target_ulong hflags_compat_nmsr; /* for migration compatibility */
> -    int immu_idx;     /* precomputed MMU index to speed up insn accesses=
 */
> -    int dmmu_idx;     /* precomputed MMU index to speed up data accesses=
 */
> =20
>      /* Power management */
>      int (*check_pow)(CPUPPCState *env);
> @@ -1367,7 +1367,11 @@ int ppc_dcr_write(ppc_dcr_t *dcr_env, int dcrn, ui=
nt32_t val);
>  #define MMU_USER_IDX 0
>  static inline int cpu_mmu_index(CPUPPCState *env, bool ifetch)
>  {
> -    return ifetch ? env->immu_idx : env->dmmu_idx;
> +#ifdef CONFIG_USER_ONLY
> +    return MMU_USER_IDX;
> +#else
> +    return (env->hflags >> (ifetch ? HFLAGS_IMMU_IDX : HFLAGS_DMMU_IDX))=
 & 7;
> +#endif
>  }
> =20
>  /* Compatibility modes */
> diff --git a/target/ppc/helper_regs.h b/target/ppc/helper_regs.h
> index 4148a442b3..42f26870b9 100644
> --- a/target/ppc/helper_regs.h
> +++ b/target/ppc/helper_regs.h
> @@ -21,7 +21,6 @@
>  #define HELPER_REGS_H
> =20
>  void hreg_swap_gpr_tgpr(CPUPPCState *env);
> -void hreg_compute_mem_idx(CPUPPCState *env);
>  void hreg_compute_hflags(CPUPPCState *env);
>  void cpu_interrupt_exittb(CPUState *cs);
>  int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv);
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index d62921c322..b28037ca24 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -43,49 +43,6 @@ void hreg_swap_gpr_tgpr(CPUPPCState *env)
>      env->tgpr[3] =3D tmp;
>  }
> =20
> -void hreg_compute_mem_idx(CPUPPCState *env)
> -{
> -    /*
> -     * This is our encoding for server processors. The architecture
> -     * specifies that there is no such thing as userspace with
> -     * translation off, however it appears that MacOS does it and some
> -     * 32-bit CPUs support it. Weird...
> -     *
> -     *   0 =3D Guest User space virtual mode
> -     *   1 =3D Guest Kernel space virtual mode
> -     *   2 =3D Guest User space real mode
> -     *   3 =3D Guest Kernel space real mode
> -     *   4 =3D HV User space virtual mode
> -     *   5 =3D HV Kernel space virtual mode
> -     *   6 =3D HV User space real mode
> -     *   7 =3D HV Kernel space real mode
> -     *
> -     * For BookE, we need 8 MMU modes as follow:
> -     *
> -     *  0 =3D AS 0 HV User space
> -     *  1 =3D AS 0 HV Kernel space
> -     *  2 =3D AS 1 HV User space
> -     *  3 =3D AS 1 HV Kernel space
> -     *  4 =3D AS 0 Guest User space
> -     *  5 =3D AS 0 Guest Kernel space
> -     *  6 =3D AS 1 Guest User space
> -     *  7 =3D AS 1 Guest Kernel space
> -     */
> -    if (env->mmu_model & POWERPC_MMU_BOOKE) {
> -        env->immu_idx =3D env->dmmu_idx =3D msr_pr ? 0 : 1;
> -        env->immu_idx +=3D msr_is ? 2 : 0;
> -        env->dmmu_idx +=3D msr_ds ? 2 : 0;
> -        env->immu_idx +=3D msr_gs ? 4 : 0;
> -        env->dmmu_idx +=3D msr_gs ? 4 : 0;
> -    } else {
> -        env->immu_idx =3D env->dmmu_idx =3D msr_pr ? 0 : 1;
> -        env->immu_idx +=3D msr_ir ? 0 : 2;
> -        env->dmmu_idx +=3D msr_dr ? 0 : 2;
> -        env->immu_idx +=3D msr_hv ? 4 : 0;
> -        env->dmmu_idx +=3D msr_hv ? 4 : 0;
> -    }
> -}
> -
>  void hreg_compute_hflags(CPUPPCState *env)
>  {
>      target_ulong msr =3D env->msr;
> @@ -95,7 +52,7 @@ void hreg_compute_hflags(CPUPPCState *env)
> =20
>      /* Some bits come straight across from MSR. */
>      msr_mask =3D ((1 << MSR_LE) | (1 << MSR_PR) |
> -                (1 << MSR_DR) | (1 << MSR_IR) | (1 << MSR_FP));
> +                (1 << MSR_DR) | (1 << MSR_FP));
> =20
>      if (ppc_flags & POWERPC_FLAG_HID0_LE) {
>          /*
> @@ -146,10 +103,51 @@ void hreg_compute_hflags(CPUPPCState *env)
>      if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
>          hflags |=3D 1 << HFLAGS_HV;
>      }
> +
> +    /*
> +     * This is our encoding for server processors. The architecture
> +     * specifies that there is no such thing as userspace with
> +     * translation off, however it appears that MacOS does it and some
> +     * 32-bit CPUs support it. Weird...
> +     *
> +     *   0 =3D Guest User space virtual mode
> +     *   1 =3D Guest Kernel space virtual mode
> +     *   2 =3D Guest User space real mode
> +     *   3 =3D Guest Kernel space real mode
> +     *   4 =3D HV User space virtual mode
> +     *   5 =3D HV Kernel space virtual mode
> +     *   6 =3D HV User space real mode
> +     *   7 =3D HV Kernel space real mode
> +     *
> +     * For BookE, we need 8 MMU modes as follow:
> +     *
> +     *  0 =3D AS 0 HV User space
> +     *  1 =3D AS 0 HV Kernel space
> +     *  2 =3D AS 1 HV User space
> +     *  3 =3D AS 1 HV Kernel space
> +     *  4 =3D AS 0 Guest User space
> +     *  5 =3D AS 0 Guest Kernel space
> +     *  6 =3D AS 1 Guest User space
> +     *  7 =3D AS 1 Guest Kernel space
> +     */
> +    unsigned immu_idx, dmmu_idx;
> +    dmmu_idx =3D msr & (1 << MSR_PR) ? 0 : 1;
> +    if (env->mmu_model & POWERPC_MMU_BOOKE) {
> +        dmmu_idx |=3D msr & (1 << MSR_GS) ? 4 : 0;
> +        immu_idx =3D dmmu_idx;
> +        immu_idx |=3D msr & (1 << MSR_IS) ? 2 : 0;
> +        dmmu_idx |=3D msr & (1 << MSR_DS) ? 2 : 0;
> +    } else {
> +        dmmu_idx |=3D msr & (1ull << MSR_HV) ? 4 : 0;
> +        immu_idx =3D dmmu_idx;
> +        immu_idx |=3D msr & (1 << MSR_IR) ? 0 : 2;
> +        dmmu_idx |=3D msr & (1 << MSR_DR) ? 0 : 2;
> +    }
> +    hflags |=3D immu_idx << HFLAGS_IMMU_IDX;
> +    hflags |=3D dmmu_idx << HFLAGS_DMMU_IDX;
>  #endif
> =20
>      env->hflags =3D hflags | (msr & msr_mask);
> -    hreg_compute_mem_idx(env);
>  }
> =20
>  void cpu_interrupt_exittb(CPUState *cs)
> diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
> index f4f7e730de..444b2a30ef 100644
> --- a/target/ppc/mem_helper.c
> +++ b/target/ppc/mem_helper.c
> @@ -278,7 +278,7 @@ static void dcbz_common(CPUPPCState *env, target_ulon=
g addr,
>      target_ulong mask, dcbz_size =3D env->dcache_line_size;
>      uint32_t i;
>      void *haddr;
> -    int mmu_idx =3D epid ? PPC_TLB_EPID_STORE : env->dmmu_idx;
> +    int mmu_idx =3D epid ? PPC_TLB_EPID_STORE : cpu_mmu_index(env, false=
);
> =20
>  #if defined(TARGET_PPC64)
>      /* Check for dcbz vs dcbzl on 970 */
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 5e629291d3..a53463b9b8 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7658,8 +7658,8 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int =
flags)
>                   cs->cpu_index);
>      qemu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
>                   "%08x iidx %d didx %d\n",
> -                 env->msr, env->spr[SPR_HID0],
> -                 env->hflags, env->immu_idx, env->dmmu_idx);
> +                 env->msr, env->spr[SPR_HID0], env->hflags,
> +                 cpu_mmu_index(env, true), cpu_mmu_index(env, false));
>  #if !defined(NO_TIMER_DUMP)
>      qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
>  #if !defined(CONFIG_USER_ONLY)
> @@ -7885,7 +7885,7 @@ static void ppc_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
>      ctx->exception =3D POWERPC_EXCP_NONE;
>      ctx->spr_cb =3D env->spr_cb;
>      ctx->pr =3D (hflags >> HFLAGS_PR) & 1;
> -    ctx->mem_idx =3D env->dmmu_idx;
> +    ctx->mem_idx =3D (hflags >> HFLAGS_DMMU_IDX) & 7;
>      ctx->dr =3D (hflags >> HFLAGS_DR) & 1;
>      ctx->hv =3D (hflags >> HFLAGS_HV) & 1;
>      ctx->insns_flags =3D env->insns_flags;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--z39XsVp1o80oH+u/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYHG4ACgkQbDjKyiDZ
s5L0pw//SzFlPPT9nrFGoQV4NwQBYw6aCYDM9TA40e6UjJu784bRTGN0d+FzUEyO
olrgbA5PtO5H0QWfcXIqy7LahOJqxBPeVe0oMDjBjipDZvWXdOAO4htMLhJQnmHV
PigaE7P4nApdsn6QtO8a1asePQZ5tLdOBpvWackYEiUSC8DOo0EgwTsD6QjDxiZI
yKiezvaBD/anZkxszlQWlSENSfH7VJhcKoxPRBJbLCxYSi9OriAXkRhgOO7qKS9v
akbjVS0UjxR6B4+OYk+TgL7wp0lkCM+ycFlYziYgNmEbdEMKop0Wuv7qgybgGqAC
g3pfOeOQWa6wLFxFps/6ydME4jLP3+mSXK8bW3foec5RbQrIINGu1BqbYZJFPhqg
0yOmCo1c6MDHsshFN7DcNDe61kUT9kPPDejCDmZv2WArnJwX5dWRG9h4TY2HANvw
l5IH70x+5Xj85HittPncYmjB+tGBqVtrfe6/KLXhcT7rSNYzAsQ8PWywrpjhcCX8
0n4ajt/BWG5L0OojvgGt30eJjcJE/ReflGLegfE39AMhwx/F6eZck+GUOryCwZGX
h0KZQJqrCJdwXx+TxK4akdN/qz+xPDCRUTvM2zpBC0V5WpdN0eDJsV5vVvcoH0ho
sbWqaq1hzWu4gHZzPUh4O98sOzZTVVcuCaxDST6r9pybYRwPpIs=
=qzf0
-----END PGP SIGNATURE-----

--z39XsVp1o80oH+u/--


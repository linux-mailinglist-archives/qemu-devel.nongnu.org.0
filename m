Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CC8346EF9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:43:10 +0100 (CET)
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsY9-00046y-5M
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPy-0004U1-0T; Tue, 23 Mar 2021 21:34:42 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:38681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPu-0001m9-Lu; Tue, 23 Mar 2021 21:34:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4rPc4FBgz9sWw; Wed, 24 Mar 2021 12:34:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616549668;
 bh=8kmji6ejcM9UfuN5cRrCRF2/Q8foMZ69SyMFPgjSa8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gd4vddvosX4UZZKMqd6hF+os1n8D9eEQpMN6LwHCdIhldsZclU8z7kNCEXHe1OlSZ
 6uLWcayjK3WGPn2YmB2MpR1+dATnGUQMw9K9Teg3VebGaAEYRsO3jmXGivfPfJVCHq
 WVKBnmGrQ0rsV1i66FgxIOmtrLlns0qeIios+vLk=
Date: Wed, 24 Mar 2021 11:09:06 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 08/10] target/ppc: Remove env->immu_idx and
 env->dmmu_idx
Message-ID: <YFqDIp4jjGGfKlk0@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-9-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cSqZyGi59cV3YnaC"
Content-Disposition: inline
In-Reply-To: <20210323184340.619757-9-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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


--cSqZyGi59cV3YnaC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 12:43:38PM -0600, Richard Henderson wrote:
> We weren't recording MSR_GS in hflags, which means that BookE
> memory accesses were essentially random vs Guest State.
>=20
> Instead of adding this bit directly, record the completed mmu
> indexes instead.  This makes it obvious that we are recording
> exactly the information that we need.
>=20
> This also means that we can stop directly recording MSR_IR.
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0.

> ---
>  target/ppc/cpu.h         | 12 ++++--
>  target/ppc/helper_regs.h |  1 -
>  target/ppc/helper_regs.c | 89 +++++++++++++++++++---------------------
>  target/ppc/machine.c     |  2 +-
>  target/ppc/mem_helper.c  |  2 +-
>  target/ppc/translate.c   |  6 +--
>  6 files changed, 56 insertions(+), 56 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 2f72f83ee3..3d021f61f3 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -598,7 +598,6 @@ enum {
>      HFLAGS_64 =3D 2,   /* computed from MSR_CE and MSR_SF */
>      HFLAGS_GTSE =3D 3, /* computed from SPR_LPCR[GTSE] */
>      HFLAGS_DR =3D 4,   /* MSR_DR */
> -    HFLAGS_IR =3D 5,   /* MSR_IR */
>      HFLAGS_SPE =3D 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ =
MSR_VR */
>      HFLAGS_TM =3D 8,   /* computed from MSR_TM */
>      HFLAGS_BE =3D 9,   /* MSR_BE -- from elsewhere on embedded ppc */
> @@ -607,6 +606,9 @@ enum {
>      HFLAGS_PR =3D 14,  /* MSR_PR */
>      HFLAGS_VSX =3D 23, /* MSR_VSX if cpu has VSX */
>      HFLAGS_VR =3D 25,  /* MSR_VR if cpu has VRE */
> +
> +    HFLAGS_IMMU_IDX =3D 26, /* 26..28 -- the composite immu_idx */
> +    HFLAGS_DMMU_IDX =3D 29, /* 29..31 -- the composite dmmu_idx */
>  };
> =20
>  /***********************************************************************=
******/
> @@ -1131,8 +1133,6 @@ struct CPUPPCState {
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
> @@ -1368,7 +1368,11 @@ int ppc_dcr_write(ppc_dcr_t *dcr_env, int dcrn, ui=
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
> index dd3cd770a3..5411a67e9a 100644
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
> @@ -97,10 +54,9 @@ void hreg_compute_hflags(CPUPPCState *env)
>      QEMU_BUILD_BUG_ON(MSR_LE !=3D HFLAGS_LE);
>      QEMU_BUILD_BUG_ON(MSR_PR !=3D HFLAGS_PR);
>      QEMU_BUILD_BUG_ON(MSR_DR !=3D HFLAGS_DR);
> -    QEMU_BUILD_BUG_ON(MSR_IR !=3D HFLAGS_IR);
>      QEMU_BUILD_BUG_ON(MSR_FP !=3D HFLAGS_FP);
>      msr_mask =3D ((1 << MSR_LE) | (1 << MSR_PR) |
> -                (1 << MSR_DR) | (1 << MSR_IR) | (1 << MSR_FP));
> +                (1 << MSR_DR) | (1 << MSR_FP));
> =20
>      if (ppc_flags & POWERPC_FLAG_HID0_LE) {
>          /*
> @@ -155,10 +111,51 @@ void hreg_compute_hflags(CPUPPCState *env)
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
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 09c5765a87..e5bffbe365 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -16,7 +16,7 @@ static void post_load_update_msr(CPUPPCState *env)
> =20
>      /*
>       * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
> -     * before restoring.  Note that this recomputes hflags and mem_idx.
> +     * before restoring.  Note that this recomputes hflags.
>       */
>      env->msr ^=3D env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
>      ppc_store_msr(env, msr);
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

--cSqZyGi59cV3YnaC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBagyIACgkQbDjKyiDZ
s5ImVA/+J+T3eKjKGGzgmKZc7w2agBC2e5moaDsOYtX5ZAWg19R1bCcMi+wsFQX4
jCBb2DVXzoAZffoFOrPTg5kA8LjqhyB3Muus4sX2ZM+GSz9nisfEry8ToSmW2XzL
eUAycNp3sJTTrktckWknk7m0qpwybiiwprmebbLsXyUg9AI4gTy2z3nj3+K8/cih
n5jOfD3rSAbBreiNqxpHsSnYVeuuK7cArMy9Rn5gyCJr5ZvDRfty38/RfWpZkYB4
/niT18inQpEtMSf4YQtpZux6NmQlrESGWB6T0TrQlJBcgMyHoTTis9bKj/ZKoqLn
qHhcxD6ljM3SsGd6sGO7FUQbL4VWAkFFxO8TyHrFAjwrEOaNBcACe7EQtLwWMrJl
Jhh9pJn6Qye8ed5x7J8KqTR+n+xi0nf9+UgxbHvNFk2eNUe8n29UNrU2H6mKwJbz
96mb3cjP4dvzOi3v58gM9iJ+ZC95U3fZHTgFrOpPhqw2SuqeNaMfVfnX8FtYc6Aq
NJo0MTSGJiwgUkb7/LV2vnuzHCdjdw0GBNfyWh0uAXs6r2UXuhTrXOY8p4z/WkbE
px/BUhDRdIWG2OrMqZM3Pb/0w356Qk4+/PD3ACG/P6rSFus0imyrhA3QHAG92WGa
sDuLdSwftHsz83t8IxmQqswjtZinL5I/xy4C4NSH+rEFYO8dqyA=
=FyRN
-----END PGP SIGNATURE-----

--cSqZyGi59cV3YnaC--


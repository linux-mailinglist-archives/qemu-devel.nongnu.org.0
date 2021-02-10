Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA06315E57
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 05:51:00 +0100 (CET)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9hSt-0005gF-65
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 23:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9hRh-00059z-3o; Tue, 09 Feb 2021 23:49:45 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52155 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9hRd-0006wZ-KI; Tue, 09 Feb 2021 23:49:44 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db6k46SGcz9sVR; Wed, 10 Feb 2021 15:49:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612932572;
 bh=9ZPVON8URKcNAYxlYsi1jG887E4DXQfJRPQX83qKTVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AZvW40NzKL58Q5kxQfM3sm0UQdbjBZdhDzd3D20utT0iCd+HluAVMUaPeZxmdsv0H
 t/LfaagC6/M59CSW/JchSRbFFwupaRNsa1eE/NKyDLdaoPklao4FgBDMSDEz2JRwDV
 4sMd85JznPGgLFPl7MxNFwoGEyrOUVF5ntWriOCc=
Date: Wed, 10 Feb 2021 15:34:53 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/ppc: Fix truncation of env->hflags
Message-ID: <20210210043453.GI4450@yekko.fritz.box>
References: <20210124032422.2113565-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UthUFkbMtH2ceUK2"
Content-Disposition: inline
In-Reply-To: <20210124032422.2113565-1-richard.henderson@linaro.org>
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UthUFkbMtH2ceUK2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 23, 2021 at 05:24:22PM -1000, Richard Henderson wrote:
> Use the cs_base field, because it happens to be the same
> size as hflags (and MSR, from which hflags is derived).
>=20
> In translate, extract most bits from a local hflags variable.
> Mark several cases where code generation is *not* derived from
> data stored within the hashed elements of the TranslationBlock.
>=20
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Reported-by: Ivan Warren <ivan@vmfacility.fr>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Well, I don't know why, but somehow this patch is breaking one of the
acceptance tests:

 (043/134) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc=
64_e500: INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: T=
imeout reached\nOriginal status: ERROR\n{'name': '043-tests/acceptance/boot=
_linux_console.py:BootLinuxConsole.test_ppc64_e500', 'logdir': '/home/dwg/s=
rc/qemu/build/normal/tests/results/job-2021-02-10T15.04... (90.26 s)

=46rom that timeout, I'm guessing something about this is causing the
boot to wedge.

So, I've removed this from my tree for now, I'll need a fixed version
to proceed with.


> ---
>  target/ppc/cpu.h       |  4 +--
>  target/ppc/translate.c | 64 ++++++++++++++++--------------------------
>  2 files changed, 26 insertions(+), 42 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 2609e4082e..4a05e4e544 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2396,8 +2396,8 @@ static inline void cpu_get_tb_cpu_state(CPUPPCState=
 *env, target_ulong *pc,
>                                          target_ulong *cs_base, uint32_t =
*flags)
>  {
>      *pc =3D env->nip;
> -    *cs_base =3D 0;
> -    *flags =3D env->hflags;
> +    *cs_base =3D env->hflags;
> +    *flags =3D 0;
>  }
> =20
>  void QEMU_NORETURN raise_exception(CPUPPCState *env, uint32_t exception);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 0984ce637b..1eb2e1b0c6 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7879,47 +7879,37 @@ static void ppc_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>  {
>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
>      CPUPPCState *env =3D cs->env_ptr;
> +    target_ulong hflags =3D ctx->base.tb->cs_base;
>      int bound;
> =20
>      ctx->exception =3D POWERPC_EXCP_NONE;
>      ctx->spr_cb =3D env->spr_cb;
> -    ctx->pr =3D msr_pr;
> +    ctx->pr =3D (hflags >> MSR_PR) & 1;
>      ctx->mem_idx =3D env->dmmu_idx;
> -    ctx->dr =3D msr_dr;
> -#if !defined(CONFIG_USER_ONLY)
> -    ctx->hv =3D msr_hv || !env->has_hv_mode;
> +    ctx->dr =3D (hflags >> MSR_DR) & 1;
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +    ctx->hv =3D (hflags >> MSR_HV) & 1;
>  #endif
>      ctx->insns_flags =3D env->insns_flags;
>      ctx->insns_flags2 =3D env->insns_flags2;
>      ctx->access_type =3D -1;
>      ctx->need_access_type =3D !mmu_is_64bit(env->mmu_model);
> -    ctx->le_mode =3D !!(env->hflags & (1 << MSR_LE));
> +    ctx->le_mode =3D (hflags >> MSR_LE) & 1;
>      ctx->default_tcg_memop_mask =3D ctx->le_mode ? MO_LE : MO_BE;
>      ctx->flags =3D env->flags;
>  #if defined(TARGET_PPC64)
> -    ctx->sf_mode =3D msr_is_64bit(env, env->msr);
> +    ctx->sf_mode =3D (hflags >> MSR_SF) & 1;
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
> +    ctx->fpu_enabled =3D (hflags >> MSR_FP) & 1;
> +    ctx->spe_enabled =3D (hflags >> MSR_SPE) & 1;
> +    ctx->altivec_enabled =3D (hflags >> MSR_VR) & 1;
> +    ctx->vsx_enabled =3D (hflags >> MSR_VSX) & 1;
> +    /* FIXME: This needs to be stored in env->hflags_nmsr. */
>      if ((env->flags & POWERPC_FLAG_SCV)
>          && (env->spr[SPR_FSCR] & (1ull << FSCR_SCV))) {
>          ctx->scv_enabled =3D true;
> @@ -7927,23 +7917,21 @@ static void ppc_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>          ctx->scv_enabled =3D false;
>      }
>  #if defined(TARGET_PPC64)
> -    if ((env->flags & POWERPC_FLAG_TM) && msr_tm) {
> -        ctx->tm_enabled =3D !!msr_tm;
> -    } else {
> -        ctx->tm_enabled =3D false;
> -    }
> +    ctx->tm_enabled =3D (hflags >> MSR_TM) & 1;
>  #endif
> +    /* FIXME: This needs to be stored in env->hflags_nmsr. */
>      ctx->gtse =3D !!(env->spr[SPR_LPCR] & LPCR_GTSE);
> -    if ((env->flags & POWERPC_FLAG_SE) && msr_se) {
> -        ctx->singlestep_enabled =3D CPU_SINGLE_STEP;
> -    } else {
> -        ctx->singlestep_enabled =3D 0;
> -    }
> -    if ((env->flags & POWERPC_FLAG_BE) && msr_be) {
> -        ctx->singlestep_enabled |=3D CPU_BRANCH_STEP;
> -    }
> -    if ((env->flags & POWERPC_FLAG_DE) && msr_de) {
> +
> +    ctx->singlestep_enabled =3D ((hflags >> MSR_SE) & 1 ? CPU_SINGLE_STE=
P : 0)
> +                            | ((hflags >> MSR_BE) & 1 ? CPU_BRANCH_STEP =
: 0);
> +
> +    if ((hflags >> MSR_DE) & 1) {
>          ctx->singlestep_enabled =3D 0;
> +        /*
> +         * FIXME: This needs to be stored in env->hflags_nmsr,
> +         * probably overlapping MSR_SE/MSR_BE like we do for
> +         * MSR_LE and the ppc 601.
> +         */
>          target_ulong dbcr0 =3D env->spr[SPR_BOOKE_DBCR0];
>          if (dbcr0 & DBCR0_ICMP) {
>              ctx->singlestep_enabled |=3D CPU_SINGLE_STEP;
> @@ -7956,10 +7944,6 @@ static void ppc_tr_init_disas_context(DisasContext=
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

--UthUFkbMtH2ceUK2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAjYmsACgkQbDjKyiDZ
s5IEmxAAj/0ehk4CqXdWbGqfcyzhHscXubcO2J+pl2vojpU0sBMdSNlp/bZBTkJT
y2HmtoUDBugQ441K1cW+nnRQbx5M34ubfWm1MuX7QrECIehR/rhVHxy8tLmLJ/o2
onJPTKAE2WvIw0gzXEA7WMg4n+9oKnC5ixAc8FdX0SKt3faQtDt4ZmGgGAmJwRnT
yM+E1e40HNh7K5SP/Ftsq3d5OuvPUjBlR4QYOSU2/dzWEC1MMQLpaUfv0qQToucF
iVJrcjYBJnTbcfPE0WsY88EMvM9HbtHC9+BHyGGvaF3O3HMpiNKyUIe0mLXA10OK
w+lqkMfFNWb3I6wAaqSRahQE3fOWAcO0J3zOqDUl58Zc6TUp7CHRmFV71keZPKbm
xURto1MdzzQ8o4n+Zshh5asadisGSxWWtkXTVxyG1zNqaO3K/cyHUTCSZjU8zsCJ
E3WuSQHJKJ5FeCBBbfI4rrQH9cUAnzpAnr9WIBXuLLeqSDbxHSi0VKfIh+CArJw+
vCIiZGwHN55I0XXEkIC4J/nxvpx6glhBlYXrATzCE0H/vlTMXl+0eN5Ko6/uBE1l
80Cb+m3vZsf9dVgf0dcd6hSxu1PRz2x6N6VKfuimjvzrRBb3pBSNEFLvIZ/Mr2rC
wOEoXkAYE7FWy8dg1fakDsYdNzklRkJQThuXGd1BzWIZFYOIl9o=
=a3X1
-----END PGP SIGNATURE-----

--UthUFkbMtH2ceUK2--


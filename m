Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A207C346EEF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:38:22 +0100 (CET)
Received: from localhost ([::1]:33204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsTV-0007ah-Lq
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPs-0004Hc-5p; Tue, 23 Mar 2021 21:34:36 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42549 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPn-0001hO-SH; Tue, 23 Mar 2021 21:34:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4rPb6kgtz9sWm; Wed, 24 Mar 2021 12:34:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616549667;
 bh=i4R9kqhe7rtBHW0m5wltviSZ/wLPZGWkqENri00PCI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XDuE1J9ODDTgPPxRIMV/TlGt721rgxRhtSMV6sJDbDDpesIs1OhSa4pf9DNfJNn+1
 pN4S2LCLrz7Uu95S1IGo0WHJR8iFAsqUOt5v/vO8gHKIq+El9VwoELhkgKuFY47nQb
 GqtTG86tTzIFf3eMp6mekQ2ANID5TWIJTusJ9n6s=
Date: Wed, 24 Mar 2021 11:05:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 05/10] target/ppc: Create helper_scv
Message-ID: <YFqCZgkO3FeDdaVU@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-6-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dawkN7m+AtnER+SO"
Content-Disposition: inline
In-Reply-To: <20210323184340.619757-6-richard.henderson@linaro.org>
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


--dawkN7m+AtnER+SO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 12:43:35PM -0600, Richard Henderson wrote:
> Perform the test against FSCR_SCV at runtime, in the helper.
>=20
> This means we can remove the incorrect set against SCV in
> ppc_tr_init_disas_context and do not need to add an HFLAGS bit.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0.

> ---
>  target/ppc/helper.h      |  1 +
>  target/ppc/excp_helper.c |  9 +++++++++
>  target/ppc/translate.c   | 20 +++++++-------------
>  3 files changed, 17 insertions(+), 13 deletions(-)
>=20
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 6a4dccf70c..513066d54d 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -13,6 +13,7 @@ DEF_HELPER_1(rfci, void, env)
>  DEF_HELPER_1(rfdi, void, env)
>  DEF_HELPER_1(rfmci, void, env)
>  #if defined(TARGET_PPC64)
> +DEF_HELPER_2(scv, noreturn, env, i32)
>  DEF_HELPER_2(pminsn, void, env, i32)
>  DEF_HELPER_1(rfid, void, env)
>  DEF_HELPER_1(rfscv, void, env)
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 85de7e6c90..5c95e0c103 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1130,6 +1130,15 @@ void helper_store_msr(CPUPPCState *env, target_ulo=
ng val)
>  }
> =20
>  #if defined(TARGET_PPC64)
> +void helper_scv(CPUPPCState *env, uint32_t lev)
> +{
> +    if (env->spr[SPR_FSCR] & (1ull << FSCR_SCV)) {
> +        raise_exception_err(env, POWERPC_EXCP_SYSCALL_VECTORED, lev);
> +    } else {
> +        raise_exception_err(env, POWERPC_EXCP_FU, FSCR_IC_SCV);
> +    }
> +}
> +
>  void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
>  {
>      CPUState *cs;
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 7912495f28..d48c554290 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -173,7 +173,6 @@ struct DisasContext {
>      bool vsx_enabled;
>      bool spe_enabled;
>      bool tm_enabled;
> -    bool scv_enabled;
>      bool gtse;
>      ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
>      int singlestep_enabled;
> @@ -4081,15 +4080,16 @@ static void gen_sc(DisasContext *ctx)
>  #if !defined(CONFIG_USER_ONLY)
>  static void gen_scv(DisasContext *ctx)
>  {
> -    uint32_t lev;
> +    uint32_t lev =3D (ctx->opcode >> 5) & 0x7F;
> =20
> -    if (unlikely(!ctx->scv_enabled)) {
> -        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_SCV);
> -        return;
> +    /* Set the PC back to the faulting instruction. */
> +    if (ctx->exception =3D=3D POWERPC_EXCP_NONE) {
> +        gen_update_nip(ctx, ctx->base.pc_next - 4);
>      }
> +    gen_helper_scv(cpu_env, tcg_constant_i32(lev));
> =20
> -    lev =3D (ctx->opcode >> 5) & 0x7F;
> -    gen_exception_err(ctx, POWERPC_SYSCALL_VECTORED, lev);
> +    /* This need not be exact, just not POWERPC_EXCP_NONE */
> +    ctx->exception =3D POWERPC_SYSCALL_VECTORED;
>  }
>  #endif
>  #endif
> @@ -7907,12 +7907,6 @@ static void ppc_tr_init_disas_context(DisasContext=
Base *dcbase, CPUState *cs)
>      ctx->spe_enabled =3D (hflags >> HFLAGS_SPE) & 1;
>      ctx->altivec_enabled =3D (hflags >> HFLAGS_VR) & 1;
>      ctx->vsx_enabled =3D (hflags >> HFLAGS_VSX) & 1;
> -    if ((env->flags & POWERPC_FLAG_SCV)
> -        && (env->spr[SPR_FSCR] & (1ull << FSCR_SCV))) {
> -        ctx->scv_enabled =3D true;
> -    } else {
> -        ctx->scv_enabled =3D false;
> -    }
>      ctx->tm_enabled =3D (hflags >> HFLAGS_TM) & 1;
>      ctx->gtse =3D !!(env->spr[SPR_LPCR] & LPCR_GTSE);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dawkN7m+AtnER+SO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBagmYACgkQbDjKyiDZ
s5JwBxAAnDnOWV0w1qMLFtjje5gmgBbl5/n0xrcTN9znfmEDUFPiO7lYB5whKLoM
VFo25ynHJ2lAih7qdHPChOIXqmNVz96tjmJrAlgleGpSSt4idm3+oEP40s9Xssb/
HR8dnwANsOhryDYefw8u82I50ZfiZtdgwUAt2W8e51ZBJD4HbZV0GNgcX35dropC
6S/nOPTwfRJtWbF0mGB25gBKku4snkGXWB1EGk3wtx1nyaJKNS/3ZbdAjgjw7g2Q
iLpEggeXWC+VjGKwihbRJ4VXqRDo/sDAYHmlZV3entAaMq7sPdndjgSgCjERHMxb
kDnG0c18n1qWJuPOnEl2RVSgsXGw2Mvcu9r/vJO9qKzXGTpcjN4ENVghs/1uVDkN
RGfOb+zHkZ4ZuuHP42p7n/Ytfv5SI7o1zsFqCp0UaSgDAAY/3Vx/PPrhZGqelinO
1Xi2xm/D03wCRBOnGfEAmy9DVvxylfRFrL1k9MQF+c9+zerJW3FaAM4J/Pxy6K8A
OUFvrrfaiQF5JdbayUzmkpIAeL6x5iz+XDoPwwO1lOTp1yqJODBKTCh37FKR4tDi
2kjHCG1j0kdrbAgZ9EsPc5km6E+BHFkxJ9BBJBh3Lr+9VSeQ3Zp3iy9JSzfXm816
J+1FNjQ+ftRfWKETIVHsStKI6V9U2bCAU2df1FFPwp95oMczhps=
=RDw1
-----END PGP SIGNATURE-----

--dawkN7m+AtnER+SO--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8513437E8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 05:29:37 +0100 (CET)
Received: from localhost ([::1]:47608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOCC7-0005FC-UH
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 00:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBvA-0006Tm-NM; Mon, 22 Mar 2021 00:12:04 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55741 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv3-0004ku-M7; Mon, 22 Mar 2021 00:12:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzz3Fr9z9sXM; Mon, 22 Mar 2021 15:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386303;
 bh=bOT190nzx8WfxK3q/b0xIai1Lh21nmYciEw5Gta/sPI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OZ3sDF7kVYuSkPlgDUk70i2uVu+ARyb6bvLTBJ/ZS1HyO70PfzLtVrEDVSiCKPSUP
 qDO/pMI1edKyZp9xBID2jM9NgPnJYiWp9y8EfZtzmWF8407Tt8P5i5oMHbnL6xnKBq
 ZOR8giKIeFeAX8obumrHOCcYxpHpmX4YarQSdqFw=
Date: Mon, 22 Mar 2021 15:00:33 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 10/17] target/ppc: Create helper_scv
Message-ID: <YFgWYQ8tPzWfwxDl@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-11-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DlcEFU0pcae8bIkJ"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-11-richard.henderson@linaro.org>
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


--DlcEFU0pcae8bIkJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:08PM -0600, Richard Henderson wrote:
> Perform the test against FSCR_SCV at runtime, in the helper.
>=20
> This means we can remove the incorrect set against SCV in
> ppc_tr_init_disas_context and do not need to add an HFLAGS bit.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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

I don't quite understand this.  Don't we need the NIP to be on the scv
instruction itself for the case where we get a facility unavailable
exception, but on the next instruction if we actually take the system
call?  This appears to be unconditional.

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

--DlcEFU0pcae8bIkJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYFmEACgkQbDjKyiDZ
s5Lxdg//RigoisgxdDdv0CjEkjivSlTIgjvDzMSqEnfM/8Z8uW/rD+8XZaW4mLYh
s3TvR1DA/gVUVIAr3mO/Y9WXGj4gI4db6mjr4f+ASTaGNKzoJ++Qy5a0baP/FtcT
SKPAHjk1qF0+nbxOt+MTa50r+xijYADID45q00XySKSsufShr17n/WfLgk9pVRYt
sOq/elG0OUsQkCoJTuTZW7Scl/TSLLNQhorWYaOv74u2FwgZQ4ZWKcAqZ6Qt3yTM
lK74NzjRfkBCoilplaCOA3UrknXcsmGysA/0jUtuLEhuaeJyk9dxny+Hrea2KNJQ
CNqN4JpQTco6lWwFRUQ8K8DOM8Rl1hIqkHnJe10uA5jsXSBSlGXl7lpVg1EpriIT
wzljqLWvrOkbsihTh6n4HYpLQ/71QzxPPaC+ixJzWRY+Wu//26KFG0vLptMr8hXA
NS6mH44XVWqOYvgcc8SNeNggpN+TZagyOlZZWOkb5+OTUG9RsTIr+UnMdZgCSoU3
gi2SzzJ+gL9nKMHKVEZreqc2OOQuOhtNdIFF5ozgS4uEsmNIv01YNxMDO1qnMSgO
H7uYlD2lo580YPWQZLhCdsKKAFPchEnGb7kTII6U77lspFJALorfZDxrnwyWsc3S
pmHqIU1K7eVcrXkmOUWo5DWWCQhqspD8BHczV9d0+xr/J8ahmI4=
=MvZ6
-----END PGP SIGNATURE-----

--DlcEFU0pcae8bIkJ--


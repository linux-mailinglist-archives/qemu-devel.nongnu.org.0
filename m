Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4CA430E10
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 05:07:44 +0200 (CEST)
Received: from localhost ([::1]:38764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcJ02-00044j-L4
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 23:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mcIw7-00033j-2S; Sun, 17 Oct 2021 23:03:40 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:44291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mcIw2-0005EE-1h; Sun, 17 Oct 2021 23:03:38 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HXhXB2bydz4xd9; Mon, 18 Oct 2021 14:03:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634526202;
 bh=zyWxJMD0aEmNUAC8e9860gXYU8pj4p6jP0BOT4QPGUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K5eXems6dPYK66TpuLVkp2gHoYdTpFAuHLcZsBj+6noLrI+sMFLJCRUyywUklX78f
 SxtciPpOKu4CuQ9Fs2VdlvfJ9HnLC1o8FCDMEWbsCIob00eTm+Fc/hfddFFq2iEzaS
 yuq7FmuYW4Fo54Sr3N+pgUp3+/PVnXC/5qZXZ/kw=
Date: Mon, 18 Oct 2021 12:23:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH] target/ppc: Filter mtmsr[d] input before setting MSR
Message-ID: <YWzMo6Eh9quYhCj3@yekko>
References: <20211015181940.197982-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/ahMj7qrwrhhESpq"
Content-Disposition: inline
In-Reply-To: <20211015181940.197982-1-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: alfredo.junior@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/ahMj7qrwrhhESpq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2021 at 03:19:40PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> PowerISA says that mtmsr[d] "does not alter MSR[HV], MSR[S], MSR[ME], or
> MSR[LE]", but the current code only filters the GPR-provided value if
> L=3D1. This behavior caused some problems in FreeBSD, and a build option
> was added to work around the issue [1], but it seems that the bug was
> not reported in launchpad/gitlab. This patch address the issue in qemu,
> so the option on FreeBSD should no longer be required.
>=20
> [1] https://cgit.freebsd.org/src/commit/?id=3D4efb1ca7d2a44cfb33d7f9e18bd=
92f8d68dcfee0
>=20
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.2, thanks.

> ---
>  target/ppc/cpu.h       |  1 +
>  target/ppc/translate.c | 73 +++++++++++++++++++++++-------------------
>  2 files changed, 41 insertions(+), 33 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index baa4e7c34d..e94e82297b 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -314,6 +314,7 @@ typedef struct ppc_v3_pate_t {
>  #define MSR_AP   23 /* Access privilege state on 602                  hf=
lags */
>  #define MSR_VSX  23 /* Vector Scalar Extension (ISA 2.06 and later) x hf=
lags */
>  #define MSR_SA   22 /* Supervisor access mode on 602                  hf=
lags */
> +#define MSR_S    22 /* Secure state                                     =
     */
>  #define MSR_KEY  19 /* key bit on 603e                                  =
     */
>  #define MSR_POW  18 /* Power management                                 =
     */
>  #define MSR_TGPR 17 /* TGPR usage on 602/603                        x   =
     */
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index b985e9e55b..a5ebe03e2a 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4940,32 +4940,40 @@ static void gen_mtmsrd(DisasContext *ctx)
>      CHK_SV;
> =20
>  #if !defined(CONFIG_USER_ONLY)
> +    TCGv t0, t1;
> +    target_ulong mask;
> +
> +    t0 =3D tcg_temp_new();
> +    t1 =3D tcg_temp_new();
> +
>      gen_icount_io_start(ctx);
> +
>      if (ctx->opcode & 0x00010000) {
>          /* L=3D1 form only updates EE and RI */
> -        TCGv t0 =3D tcg_temp_new();
> -        TCGv t1 =3D tcg_temp_new();
> -        tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
> -                        (1 << MSR_RI) | (1 << MSR_EE));
> -        tcg_gen_andi_tl(t1, cpu_msr,
> -                        ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
> -        tcg_gen_or_tl(t1, t1, t0);
> -
> -        gen_helper_store_msr(cpu_env, t1);
> -        tcg_temp_free(t0);
> -        tcg_temp_free(t1);
> -
> +        mask =3D (1ULL << MSR_RI) | (1ULL << MSR_EE);
>      } else {
> +        /* mtmsrd does not alter HV, S, ME, or LE */
> +        mask =3D ~((1ULL << MSR_LE) | (1ULL << MSR_ME) | (1ULL << MSR_S)=
 |
> +                 (1ULL << MSR_HV));
>          /*
>           * XXX: we need to update nip before the store if we enter
>           *      power saving mode, we will exit the loop directly from
>           *      ppc_store_msr
>           */
>          gen_update_nip(ctx, ctx->base.pc_next);
> -        gen_helper_store_msr(cpu_env, cpu_gpr[rS(ctx->opcode)]);
>      }
> +
> +    tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)], mask);
> +    tcg_gen_andi_tl(t1, cpu_msr, ~mask);
> +    tcg_gen_or_tl(t0, t0, t1);
> +
> +    gen_helper_store_msr(cpu_env, t0);
> +
>      /* Must stop the translation as machine state (may have) changed */
>      ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
>  #endif /* !defined(CONFIG_USER_ONLY) */
>  }
>  #endif /* defined(TARGET_PPC64) */
> @@ -4975,23 +4983,19 @@ static void gen_mtmsr(DisasContext *ctx)
>      CHK_SV;
> =20
>  #if !defined(CONFIG_USER_ONLY)
> +    TCGv t0, t1;
> +    target_ulong mask =3D 0xFFFFFFFF;
> +
> +    t0 =3D tcg_temp_new();
> +    t1 =3D tcg_temp_new();
> +
>      gen_icount_io_start(ctx);
>      if (ctx->opcode & 0x00010000) {
>          /* L=3D1 form only updates EE and RI */
> -        TCGv t0 =3D tcg_temp_new();
> -        TCGv t1 =3D tcg_temp_new();
> -        tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
> -                        (1 << MSR_RI) | (1 << MSR_EE));
> -        tcg_gen_andi_tl(t1, cpu_msr,
> -                        ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
> -        tcg_gen_or_tl(t1, t1, t0);
> -
> -        gen_helper_store_msr(cpu_env, t1);
> -        tcg_temp_free(t0);
> -        tcg_temp_free(t1);
> -
> +        mask &=3D (1ULL << MSR_RI) | (1ULL << MSR_EE);
>      } else {
> -        TCGv msr =3D tcg_temp_new();
> +        /* mtmsr does not alter S, ME, or LE */
> +        mask &=3D ~((1ULL << MSR_LE) | (1ULL << MSR_ME) | (1ULL << MSR_S=
));
> =20
>          /*
>           * XXX: we need to update nip before the store if we enter
> @@ -4999,16 +5003,19 @@ static void gen_mtmsr(DisasContext *ctx)
>           *      ppc_store_msr
>           */
>          gen_update_nip(ctx, ctx->base.pc_next);
> -#if defined(TARGET_PPC64)
> -        tcg_gen_deposit_tl(msr, cpu_msr, cpu_gpr[rS(ctx->opcode)], 0, 32=
);
> -#else
> -        tcg_gen_mov_tl(msr, cpu_gpr[rS(ctx->opcode)]);
> -#endif
> -        gen_helper_store_msr(cpu_env, msr);
> -        tcg_temp_free(msr);
>      }
> +
> +    tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)], mask);
> +    tcg_gen_andi_tl(t1, cpu_msr, ~mask);
> +    tcg_gen_or_tl(t0, t0, t1);
> +
> +    gen_helper_store_msr(cpu_env, t0);
> +
>      /* Must stop the translation as machine state (may have) changed */
>      ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
>  #endif
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/ahMj7qrwrhhESpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFszKEACgkQbDjKyiDZ
s5KaFQ//XsBXO7YZUhoL4sQlfHC1LYuKoYUjAMneytihgVglwP2oA9VtvEm4dbvt
scjJdC4DZG/4cKXS8vdqclLprGphBX/ay9RdJY9XvO3rrzeUxOT+ZJmqEAWQUuqh
1zD+pDTH0VDnovmxA2hw1fE7QTpev5PAX2/3B5tJXEX6KD9QMzpJ1DEf5wsq6ZZA
z6m/f2NPea2snwJ5/IenGmU4bu7vz+DKG57smr5aKIanJYWP7dkJW+g0b4z4JqEF
c78Tc/yn3wOAU9UzBxUhkzJP9Zr4WQaM/5jLfxgPxgHKgI15PyA3uSKcaTgkaW44
XSrMiIQmnqbRmJH845r9AskLxzq2ey6bvq/kP1KLmmokIssvyQS4N9Zt+t7MaCsd
XLQGgJSKmrw92sPOn+J5UPI9HK0bUT9yKVnA4k8SmG/yEtaOL2je8bnX/ZToPShT
Hjp0LGQshrV43PT4SBSmz7Rsa7IaWScwKuVrQHECgfwBLuZEjPH8yv4CwxHnNzyL
+XqXQsqwH5Ef/5/UPabsbk4GPihngYYdictyr7x9+/7/ae9usyVUQJiNnBruG8Zx
abO0pBlhTRfjtQpNax2625PZ+71xrgIUduty9+g6C+mPgRvb91gQlU8ZsArxYwhe
6sHpDwXqFAVSMDXgChNv3khJSuMupiU3z9fsl8ALzcgkyTPK7a8=
=Kz0m
-----END PGP SIGNATURE-----

--/ahMj7qrwrhhESpq--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70BD3710F7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:37:39 +0200 (CEST)
Received: from localhost ([::1]:46580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQKv-0000sp-6G
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJK-0007Yz-QH; Mon, 03 May 2021 00:35:58 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55179 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJI-0002BW-3W; Mon, 03 May 2021 00:35:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FYVXQ6WwDz9sPf; Mon,  3 May 2021 14:35:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620016550;
 bh=NJO5+EW4kA2WAGAqt/uxq7POm/14L/camMUmNoFhY+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d4rRBDaXJ6EMUdBuzdYu2/NkPClyssQpdwu5y4WtxQ2jkzJ20iQ15+ZOCR1KsBYij
 U/ZVS2YhGLwiulNClM6e5krvg5ZQmrA2yAxkSPB8mnqMlrnKWm5MoFHCeMZi59OUbX
 piyBSAzVBRNh5AyvXz8jF9HFtGJrWOX/+Kr6RFng=
Date: Mon, 3 May 2021 13:47:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/2] target/ppc: Clean up _spr_register et al
Message-ID: <YI9yYIqx0dSLTVlB@yekko>
References: <20210501022923.1179736-1-richard.henderson@linaro.org>
 <20210501022923.1179736-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yIeHPIDA7HCuHk88"
Content-Disposition: inline
In-Reply-To: <20210501022923.1179736-2-richard.henderson@linaro.org>
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
Cc: qemu-ppc@nongnu.org, luis.pires@eldorado.org.br,
 matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yIeHPIDA7HCuHk88
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 07:29:22PM -0700, Richard Henderson wrote:
> Introduce 3 helper macros to elide arguments that we cannot supply.
> This reduces the repetition required to get the job done.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate_init.c.inc | 154 +++++++++++++++-----------------
>  1 file changed, 74 insertions(+), 80 deletions(-)
>=20
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index c03a7c4f52..49a92b20b4 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -721,104 +721,98 @@ static inline void vscr_init(CPUPPCState *env, uin=
t32_t val)
>      helper_mtvscr(env, val);
>  }
> =20
> -#ifdef CONFIG_USER_ONLY
> -#define spr_register_kvm(env, num, name, uea_read, uea_write,           =
       \
> -                         oea_read, oea_write, one_reg_id, initial_value)=
       \
> -    _spr_register(env, num, name, uea_read, uea_write, initial_value)
> -#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,        =
       \
> -                            oea_read, oea_write, hea_read, hea_write,   =
       \
> -                            one_reg_id, initial_value)                  =
       \
> -    _spr_register(env, num, name, uea_read, uea_write, initial_value)
> +/**
> + * _spr_register
> + *
> + * Register an SPR with all the callbacks required for tcg,
> + * and the ID number for KVM.
> + *
> + * The reason for the conditional compilation is that the tcg functions
> + * may be compiled out, and the system kvm header may not be available
> + * for supplying the ID numbers.  This is ugly, but the best we can do.
> + */
> +
> +#ifdef CONFIG_TCG
> +# define USR_ARG(X)    X,
> +# ifdef CONFIG_USER_ONLY
> +#  define SYS_ARG(X)
> +# else
> +#  define SYS_ARG(X)   X,
> +# endif
>  #else
> -#if !defined(CONFIG_KVM)
> -#define spr_register_kvm(env, num, name, uea_read, uea_write,           =
       \
> -                         oea_read, oea_write, one_reg_id, initial_value)=
       \
> -    _spr_register(env, num, name, uea_read, uea_write,                  =
       \
> -                  oea_read, oea_write, oea_read, oea_write, initial_valu=
e)
> -#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,        =
       \
> -                            oea_read, oea_write, hea_read, hea_write,   =
       \
> -                            one_reg_id, initial_value)                  =
       \
> -    _spr_register(env, num, name, uea_read, uea_write,                  =
       \
> -                  oea_read, oea_write, hea_read, hea_write, initial_valu=
e)
> +# define USR_ARG(X)
> +# define SYS_ARG(X)
> +#endif
> +#ifdef CONFIG_KVM
> +# define KVM_ARG(X)    X,
>  #else
> -#define spr_register_kvm(env, num, name, uea_read, uea_write,           =
       \
> -                         oea_read, oea_write, one_reg_id, initial_value)=
       \
> -    _spr_register(env, num, name, uea_read, uea_write,                  =
       \
> -                  oea_read, oea_write, oea_read, oea_write,             =
       \
> -                  one_reg_id, initial_value)
> -#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,        =
       \
> -                            oea_read, oea_write, hea_read, hea_write,   =
       \
> -                            one_reg_id, initial_value)                  =
       \
> -    _spr_register(env, num, name, uea_read, uea_write,                  =
       \
> -                  oea_read, oea_write, hea_read, hea_write,             =
       \
> -                  one_reg_id, initial_value)
> -#endif
> +# define KVM_ARG(X)
>  #endif
> =20
> -#define spr_register(env, num, name, uea_read, uea_write,               =
       \
> -                     oea_read, oea_write, initial_value)                =
       \
> -    spr_register_kvm(env, num, name, uea_read, uea_write,               =
       \
> -                     oea_read, oea_write, 0, initial_value)
> +typedef void spr_callback(DisasContext *, int, int);
> =20
> -#define spr_register_hv(env, num, name, uea_read, uea_write,            =
       \
> -                        oea_read, oea_write, hea_read, hea_write,       =
       \
> -                        initial_value)                                  =
       \
> -    spr_register_kvm_hv(env, num, name, uea_read, uea_write,            =
       \
> -                        oea_read, oea_write, hea_read, hea_write,       =
       \
> -                        0, initial_value)
> -
> -static inline void _spr_register(CPUPPCState *env, int num,
> -                                 const char *name,
> -                                 void (*uea_read)(DisasContext *ctx,
> -                                                  int gprn, int sprn),
> -                                 void (*uea_write)(DisasContext *ctx,
> -                                                   int sprn, int gprn),
> -#if !defined(CONFIG_USER_ONLY)
> -
> -                                 void (*oea_read)(DisasContext *ctx,
> -                                                  int gprn, int sprn),
> -                                 void (*oea_write)(DisasContext *ctx,
> -                                                   int sprn, int gprn),
> -                                 void (*hea_read)(DisasContext *opaque,
> -                                                  int gprn, int sprn),
> -                                 void (*hea_write)(DisasContext *opaque,
> -                                                   int sprn, int gprn),
> -#endif
> -#if defined(CONFIG_KVM)
> -                                 uint64_t one_reg_id,
> -#endif
> -                                 target_ulong initial_value)
> +static void _spr_register(CPUPPCState *env, int num, const char *name,
> +                          USR_ARG(spr_callback *uea_read)
> +                          USR_ARG(spr_callback *uea_write)
> +                          SYS_ARG(spr_callback *oea_read)
> +                          SYS_ARG(spr_callback *oea_write)
> +                          SYS_ARG(spr_callback *hea_read)
> +                          SYS_ARG(spr_callback *hea_write)
> +                          KVM_ARG(uint64_t one_reg_id)
> +                          target_ulong initial_value)
>  {
> -    ppc_spr_t *spr;
> +    ppc_spr_t *spr =3D &env->spr_cb[num];
> +
> +    /* No SPR should be registered twice. */
> +    assert(spr->name =3D=3D NULL);
> +    assert(name !=3D NULL);
> =20
> -    spr =3D &env->spr_cb[num];
> -    if (spr->name !=3D NULL || env->spr[num] !=3D 0x00000000 ||
> -#if !defined(CONFIG_USER_ONLY)
> -        spr->oea_read !=3D NULL || spr->oea_write !=3D NULL ||
> -#endif
> -        spr->uea_read !=3D NULL || spr->uea_write !=3D NULL) {
> -        printf("Error: Trying to register SPR %d (%03x) twice !\n", num,=
 num);
> -        exit(1);
> -    }
> -#if defined(PPC_DEBUG_SPR)
> -    printf("*** register spr %d (%03x) %s val " TARGET_FMT_lx "\n", num,=
 num,
> -           name, initial_value);
> -#endif
>      spr->name =3D name;
> +    spr->default_value =3D initial_value;
> +    env->spr[num] =3D initial_value;
> +
> +#ifdef CONFIG_TCG
>      spr->uea_read =3D uea_read;
>      spr->uea_write =3D uea_write;
> -#if !defined(CONFIG_USER_ONLY)
> +# ifndef CONFIG_USER_ONLY
>      spr->oea_read =3D oea_read;
>      spr->oea_write =3D oea_write;
>      spr->hea_read =3D hea_read;
>      spr->hea_write =3D hea_write;
> +# endif
>  #endif
> -#if defined(CONFIG_KVM)
> -    spr->one_reg_id =3D one_reg_id,
> +#ifdef CONFIG_KVM
> +    spr->one_reg_id =3D one_reg_id;
>  #endif
> -    env->spr[num] =3D spr->default_value =3D initial_value;
>  }
> =20
> +/* spr_register_kvm_hv passes all required arguments. */
> +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,        =
     \
> +                            oea_read, oea_write, hea_read, hea_write,   =
     \
> +                            one_reg_id, initial_value)                  =
     \
> +    _spr_register(env, num, name,                                       =
     \
> +                  USR_ARG(uea_read) USR_ARG(uea_write)                  =
     \
> +                  SYS_ARG(oea_read) SYS_ARG(oea_write)                  =
     \
> +                  SYS_ARG(hea_read) SYS_ARG(hea_write)                  =
     \
> +                  KVM_ARG(one_reg_id) initial_value)
> +
> +/* spr_register_kvm duplicates the oea callbacks to the hea callbacks. */
> +#define spr_register_kvm(env, num, name, uea_read, uea_write,           =
     \
> +                         oea_read, oea_write, one_reg_id, ival)         =
     \
> +    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,  =
     \
> +                        oea_write, oea_read, oea_write, one_reg_id, ival)
> +
> +/* spr_register_hv and spr_register are similar, except there is no kvm =
id. */
> +#define spr_register_hv(env, num, name, uea_read, uea_write,            =
     \
> +                        oea_read, oea_write, hea_read, hea_write, ival) =
     \
> +    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,  =
     \
> +                        oea_write, hea_read, hea_write, 0, ival)
> +
> +#define spr_register(env, num, name, uea_read, uea_write,               =
     \
> +                     oea_read, oea_write, ival)                         =
     \
> +    spr_register_kvm(env, num, name, uea_read, uea_write,               =
     \
> +                     oea_read, oea_write, 0, ival)
> +
>  /* Generic PowerPC SPRs */
>  static void gen_spr_generic(CPUPPCState *env)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yIeHPIDA7HCuHk88
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCPcl8ACgkQbDjKyiDZ
s5IO8hAAkoBc0HfbiH8z4RtrCNqmivkRuOT3MDVbRsOr/cLUxUVcSN1xvCGlNYsv
svNDi1iERErUM1Jl3KVZGUobkf+dqTRWr1PLZWEvHA8pJdaRQ8BwlkqU8qnfnru4
kpYdrdXJ61hB0oZsc3cezoX532YhLGlseEZR5cHqHFrw93+UWDg824dvUzbWBxlE
sNwTMyAv5Hbvyj9hT3L9QP31Xi5ylibPSLfxz6Kkqu8w4lch1/qsH+LRXfiWTrwf
F6HupC4uzohW4S6WXxWosUWp+v7bmA2jYH5Y8qCteaoN6sxiLyIuWDCFscy72i3d
1sOQyBg7T1bWHQ8ayKyHbjlPS+bsjk3uDDQvJP0vdQKiIwVarqCZl9A9PiXwuHxe
Q1e5lgwfAmxarKJc/ND7GGoVpIj/LkR2LMEJi/KTytvbdRS4jTGpiW22IKUTyFsE
+3qBaTDll3klsbVpbrzHGuWOw0tdoS4IBn/3jBCJ9BvgfJCm9tMmRfQ1K4PUrCq1
qJ1StutU8yZYZi7iwUPw7DsKAEs3cGLnlS72e31FKqYok3WkIEOYN1wVE4zf4TpZ
X+uXICz+70HXfnOFbbYcRcuwPlSQKuiWadpObMAChyV0iFRQ5Sd3fCAk/04Cx80v
EQnDRwiSyeutjYcxGlnS9iGFlyADP54c41DnQIwErFRdeGyzxJc=
=/NBJ
-----END PGP SIGNATURE-----

--yIeHPIDA7HCuHk88--


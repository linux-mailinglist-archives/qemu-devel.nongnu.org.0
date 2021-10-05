Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0B3421B6E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 03:09:11 +0200 (CEST)
Received: from localhost ([::1]:56254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXYxC-0000aV-A8
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 21:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mXYtc-0007HX-9z; Mon, 04 Oct 2021 21:05:28 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:55439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mXYtX-0003XQ-4q; Mon, 04 Oct 2021 21:05:26 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HNfWx1jSrz4xbb; Tue,  5 Oct 2021 12:05:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1633395917;
 bh=VQNh4thgyu/XEVs4OYnOrRN3mtZIynWu4ytpmCt7jJY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qge04Rw7jt9NjNW4FEAc3BcOrFAM5rgjSwvcYpyccY1c7YjX7uydhUnS8oobw1lUO
 76/cWg5XDrIww8io9ux7PaNc8uvK2cFIxPJsf2NHi8mS2XWb/dbFtt8opGXpjTJF3I
 lmtyDBlxwWoWp2tchmF7XiMsjWnRl3v/71RqXX3k=
Date: Tue, 5 Oct 2021 11:46:02 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/2] target/ppc: Use tcg_constant_i32() in gen_setb()
Message-ID: <YVugSuz+LtDYYvD1@yekko>
References: <20211003141711.3673181-1-f4bug@amsat.org>
 <20211003141711.3673181-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZFTqTEp9tajDdmWP"
Content-Disposition: inline
In-Reply-To: <20211003141711.3673181-2-f4bug@amsat.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZFTqTEp9tajDdmWP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 03, 2021 at 04:17:10PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Avoid using TCG temporaries for the -1 and 8 constant values.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Both patches applied to ppc-for-6.2, thanks.

> ---
>  target/ppc/translate.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index b985e9e55bc..193d8e89152 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -5074,19 +5074,15 @@ static void gen_mtspr(DisasContext *ctx)
>  static void gen_setb(DisasContext *ctx)
>  {
>      TCGv_i32 t0 =3D tcg_temp_new_i32();
> -    TCGv_i32 t8 =3D tcg_temp_new_i32();
> -    TCGv_i32 tm1 =3D tcg_temp_new_i32();
> +    TCGv_i32 t8 =3D tcg_constant_i32(8);
> +    TCGv_i32 tm1 =3D tcg_constant_i32(-1);
>      int crf =3D crfS(ctx->opcode);
> =20
>      tcg_gen_setcondi_i32(TCG_COND_GEU, t0, cpu_crf[crf], 4);
> -    tcg_gen_movi_i32(t8, 8);
> -    tcg_gen_movi_i32(tm1, -1);
>      tcg_gen_movcond_i32(TCG_COND_GEU, t0, cpu_crf[crf], t8, tm1, t0);
>      tcg_gen_ext_i32_tl(cpu_gpr[rD(ctx->opcode)], t0);
> =20
>      tcg_temp_free_i32(t0);
> -    tcg_temp_free_i32(t8);
> -    tcg_temp_free_i32(tm1);
>  }
>  #endif
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZFTqTEp9tajDdmWP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFboEoACgkQbDjKyiDZ
s5IZaRAAvUfvDp9NgUv9B6nlf/Cufr+QvzxbAKg0f5mgUR4RLqiNZYf1xZzFFHt8
OQMgL5qjjV2zJpw7vLf9QB6YowcUyjsfXps54W7p8g0xMWjm/nL4cGcTFrPfBMxR
O/OM1JWcN26v0ON5BYZiRKRRo8zEyow/E7SN/8sXfofL5kJwOmfzCl66IjtL5Lfq
km6qgLxWXQupvlScbclv8Rhj8wBITAkSIPmk2jzNhlqyKPXLf3Px9qxwyM6t/L6N
Xp5XHw1HqhuQAghtvm2FN+8ddsOWSu/hL5fyzrszoFKI1Tewjqz0LzjkkQb7BgCx
TTtYlGpVb+DCgRvrb24lJ2o6/C7jRJtL4gJn4aJiELQHlw4+Tt8vrA0kAvUD8Vtu
7SUrJxfgzPbFB60zId6r8qHmvhk25dutieaINT5jfd0uJ2Xd8fyOUIvT0AKZPJmA
51CLEVQOos7wFh6lhGRKPf+robCIhc6YaA+XhF5wJOj7w0vObtXvYq8CqlL0rwr8
eRZbAlFESkGwtbqj7/eLaMa+ScJ7TXE1fhfIUmPwZ09EZCIDDVfnB23ApEArvuwG
seLNpjEFKwM5PbRBJpjWI5gPHRAdFfxiUj+y7Ae+keuH5+V8nB7Aq3KNeuFroh7g
nZWK4/sXgh1oXw2DPi0D1odjpyZbgCJg6zUOOFhj4HQTPkSui90=
=xpqs
-----END PGP SIGNATURE-----

--ZFTqTEp9tajDdmWP--


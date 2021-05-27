Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95069392851
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:15:10 +0200 (CEST)
Received: from localhost ([::1]:46746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAEX-000192-Gj
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmABy-0006lN-Ra; Thu, 27 May 2021 03:12:30 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:49873 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmABw-0004eY-L7; Thu, 27 May 2021 03:12:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FrJsw5xHnz9sVt; Thu, 27 May 2021 17:12:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622099540;
 bh=QLaEq1xLwtX3yes8Y4Ux8P2XxeTO4nHGjSJ7NJQWUK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IutJ8NXmABgn1K6D4vAADo4w9THRQ/4J+CSuyViMrv8VAvlFPugvc51gP02381aU7
 uykedv+9gkzqrBvmkjhJW3R5h2HBALDcmgkz+lrgt0bDx9ideWKANj+/7und7EpHxl
 Xb38k/QHmunvx9JDFjsxRdXdYNJ+fimzmw4FAi4Q=
Date: Thu, 27 May 2021 14:13:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v5 1/4] target/ppc: used ternary operator when
 registering MAS
Message-ID: <YK8cXQEp1sNWgVqN@yekko>
References: <20210525115355.8254-1-bruno.larsen@eldorado.org.br>
 <20210525115355.8254-2-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TBmC+fSWkp8l2R2j"
Content-Disposition: inline
In-Reply-To: <20210525115355.8254-2-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TBmC+fSWkp8l2R2j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 08:53:52AM -0300, Bruno Larsen (billionai) wrote:
> The write calback decision when registering the MAS SPR has been turned
> into a ternary operation, rather than an if-then-else block.
>=20
> This was done because when building without TCG, even though the
> compiler will optimize away the pointers to spr_write_generic*, it
> doesn't optimize away the decision and assignment to the local pointer,
> creating compiler errors. This cleanup looked better than using ifdefs,
> so  we decided to with it.
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/cpu_init.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index b696469d1a..40719f6480 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -1205,15 +1205,12 @@ static void register_BookE206_sprs(CPUPPCState *e=
nv, uint32_t mas_mask,
>      /* TLB assist registers */
>      /* XXX : not implemented */
>      for (i =3D 0; i < 8; i++) {
> -        void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =3D
> -            &spr_write_generic32;
> -        if (i =3D=3D 2 && (mas_mask & (1 << i)) && (env->insns_flags & P=
PC_64B)) {
> -            uea_write =3D &spr_write_generic;
> -        }
>          if (mas_mask & (1 << i)) {
>              spr_register(env, mas_sprn[i], mas_names[i],
>                           SPR_NOACCESS, SPR_NOACCESS,
> -                         &spr_read_generic, uea_write,
> +                         &spr_read_generic,
> +                         (i =3D=3D 2 && (env->insns_flags & PPC_64B))
> +                         ? &spr_write_generic : &spr_write_generic32,
>                           0x00000000);
>          }
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TBmC+fSWkp8l2R2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCvHFsACgkQbDjKyiDZ
s5JyDw/+Nt9vm4lCYsD8Qble8pa8vSg9oH3yf2ZfEQRiUBGDPA4oKc1Ft+FebGaF
Wrk6lUSlq/8RjQzGYHGqqaEoU+eujWXqn2AOU8YpcZJY6Wx2WZknZwFEGqNaeUSZ
EgddRKUEWWGXqzhtsZdvYAIU6WQI2kbK3G54QrhrPKitBt7hoM10EvRIGBJI1Ry7
+xMPZWD0sqtREdDqGPH2kVe4qfOisKfstUu9JEKd71d81OlQEMtbkiUBGf6RvuJu
JrR64Aseati8QQ4Q0DehMUn484X+6mmiOSKvrkeu86h4mU9g1Ple/EcI0Rpgj5pi
Qyu3AprdiW9gmeDpaSYm9oS6Dtr/OruRNy++wHfv8Muj2MnWLEg+FwAdPyEJ6QLL
/78dhV5+tJ7zX61Pygo3eIXVFr5puDG3hjuSAqIeRXZWFC1eLPb+jx4QlQE4TylP
5aueN/+ROVZsuK7OnYzdN9eA+g6s0SXN7qfKwXG7OuzalhBpBzsBTCOgZra3em8v
+PH8cBU/E6gx8PQ2MuKkG6z7SHazltVKGjBPaBsVFxnJV0iTUzGHx3xu/hHvpDRb
O2NlkfNVDiCKYHNbmEUjexAwCjS9qYxvpecVjn9B1/JzFKh+fqfDubRbpop/CPpj
MSUB+ef6rcivrfeXZZERyQlI+s8MiXhsMcBP1qgeFYFrH0rfHJ0=
=2sLJ
-----END PGP SIGNATURE-----

--TBmC+fSWkp8l2R2j--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31DB398508
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:14:26 +0200 (CEST)
Received: from localhost ([::1]:54442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loMxF-00043t-91
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loMvx-0002Th-28; Wed, 02 Jun 2021 05:13:05 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37835 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loMvu-0007fq-FH; Wed, 02 Jun 2021 05:13:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fw3GK2yxnz9sSs; Wed,  2 Jun 2021 19:12:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622625177;
 bh=ZIkkMuasJeLKtqu5tGfhuqkUbHFvOJbu5/f2DHFrWNY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m4a28/TKtyuJo1pCp5kl74n6B80OI2NISNLUwA3oKZIUlRerN2haCXUU/9xgoune6
 dmV3/Fy7W3MavrtaER1lqEeaRMu7y6tqlBNfwv+4JeCwPFClfi28/efxkg5SbCeKTm
 CYRr8/723CHItY9yu4Bx9wF2cQ9X8I5PpJXoz1yc=
Date: Wed, 2 Jun 2021 18:55:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/ppc: fix single-step exception regression
Message-ID: <YLdHZuIlK4VEBlWf@yekko>
References: <20210601180237.296402-1-luis.pires@eldorado.org.br>
 <aa0c8f49-38d3-4ca0-89b8-0807cb57558f@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OJs/uQJ15Ki8Seyd"
Content-Disposition: inline
In-Reply-To: <aa0c8f49-38d3-4ca0-89b8-0807cb57558f@linaro.org>
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
Cc: matheus.ferst@eldorado.org.br, Luis Pires <luis.pires@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OJs/uQJ15Ki8Seyd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 01:27:20PM -0700, Richard Henderson wrote:
> On 6/1/21 11:02 AM, Luis Pires wrote:
> > +            if (is_jmp =3D=3D DISAS_EXIT || is_jmp =3D=3D DISAS_CHAIN)=
 {
> > +                /* We have not updated nip yet, so do it now */
> > +                gen_update_nip(ctx, nip);
> > +            }
>=20
> This is incorrect.  Both EXIT and CHAIN *have* updated nip, but to someth=
ing
> that isn't the next instruction.  E.g. return from interrupt.

Any theories on what's actually causing the regression, then?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OJs/uQJ15Ki8Seyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC3R2UACgkQbDjKyiDZ
s5LVQhAA0dBUmHkfQK8VXQeOGjT5WUh1tiCYsP0wDyQm5ON1Wl5XlgUtn75gq41E
OkhaYG0UTfMKh9VEIYL+ilSZbQwIplH4Y5nIfn+eeJNv0r5zItDY1nK9uGCnuvyt
eeWrGRoy9XPFmCfyaYBdjd/cmi9Nad6kY9GFEa2u4UKnLwjKQFa6aSK8FOYmUzZz
8VhwaPt6S4oB9AtkazDunQ8eIS83Z7qKcS8Pp1GmoRBW21jg+Gn2dlEENjebnTlu
soq5OiVt+0BSP+JCioy2ZUI/XCgaFu4Qu4Tp+mH3o/KgBK4OhWKQorYwJuFcTwvO
VOJEddaHjIv5fpJr+HmtWBHYVk4Otqzavd1WhFcyBjT0RKwgul2vyiuvDXrpfRSU
lkFs/jROduZrQiqBapvY7JvgfyLjlauymofLrvI/KZ2HvXoVNqVoZRrtUjHE5319
v0kOOUUmF+HvLaPZ4T564CPHEgeHUQx38F9rMWJJkeqLxEfsctjC4XR1kcHkSOJs
DJTiUweToslN/uh6A7wM3hHYTp1shGoFBOOyo61rb1+g8qiqs9EnRbBkL3d1SzxV
vBptXV82Pr3q5LrcUElAE7iU49BUKNgs/A8KcSmhTRyA1LLtcS0ESotn5ERhEHIx
rzJ+jeDOTKD4UiQyPg2lHaQ+wdKSgrrclSKD0RHzlmPynV1wjSo=
=YC/6
-----END PGP SIGNATURE-----

--OJs/uQJ15Ki8Seyd--


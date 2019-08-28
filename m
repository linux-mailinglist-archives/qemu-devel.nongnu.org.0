Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D0E9F874
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 04:52:01 +0200 (CEST)
Received: from localhost ([::1]:60438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2o40-0006z9-1l
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 22:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43707)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i2o1k-0005D3-1h
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 22:49:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i2o1g-00073e-TV
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 22:49:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47745 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1i2o1f-0006zs-SS
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 22:49:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46J9F43g31z9sDQ; Wed, 28 Aug 2019 12:49:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566960568;
 bh=fTkqhxsU8PeUq+BVtY08ySvLoyu1zZEIXzelypJWMXE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fge0hFn3Wi4UeT4FX3DXslc0g7aLUFrUzReCGLyL+zyZCtF2bUHEvUSaoYZ+ffZtA
 QT7fj/y4wRnqPpKh3XvTlAYTHLiqake5HPyBPI/HAt0y7JtwCSh0NH6uPZP/vEz97o
 KoZBPT/yx+/VJ7jZJfHcKSEPWaIwUIWEd6r8sIBM=
Date: Wed, 28 Aug 2019 10:42:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20190828004255.GA16825@umbus.fritz.box>
References: <1566898663-25858-1-git-send-email-stefan.brankovic@rt-rk.com>
 <1566898663-25858-4-git-send-email-stefan.brankovic@rt-rk.com>
 <bc4e313b-9454-62d2-de82-3887f5d59a64@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <bc4e313b-9454-62d2-de82-3887f5d59a64@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PATCH v6 3/3] target/ppc: Refactor emulation of
 vmrgew and vmrgow instructions
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
Cc: Stefan Brankovic <stefan.brankovic@rt-rk.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2019 at 12:19:27PM -0700, Richard Henderson wrote:
> On 8/27/19 2:37 AM, Stefan Brankovic wrote:
> > Since I found this two instructions implemented with tcg, I refactored
> > them so they are consistent with other similar implementations that
> > I introduced in this patch.
> >=20
> > Also, a new dual macro GEN_VXFORM_TRANS_DUAL is added. This macro is
> > used if one instruction is realized with direct translation, and second
> > one with a helper.
> >=20
> > Signed-off-by: Stefan Brankovic <stefan.brankovic@rt-rk.com>
> > ---
> >  target/ppc/translate/vmx-impl.inc.c | 66 +++++++++++++++++++++--------=
--------
> >  1 file changed, 37 insertions(+), 29 deletions(-)
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-4.2, thanks.

>=20
>=20
> r~
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1lzgwACgkQbDjKyiDZ
s5LA1RAAtdGDFta1s21T49UYQWAunXEBas+NC64cDI+fSZzU0s6cXBqABM2lI/E5
iINhBHxb82NIBqXtA3+a5rs4jqxA0s162+6r+qMiWQYdhFoBZ/hEjdhemt/TdhYO
r+hFUk1MhjLkHxvfmwDrcbB0IbevTCh1X8VKh9+TnPsWrbje34FwP7MDDGJfRZZa
SLu7DGqQWihpLESLCGDQwLoyGIEm13oXluWTXU8gVtui84MQhtUMJL3+EoWUn2yp
L6SuHdx0ymWdP3hgLxjZiUzZAzhpBh4CriYzXEE5zyZ8Qg5c9aMF6PSTxKwsgJB5
s9Yl3BrLcbiCb6Bs9Lgsbtm1QyndlCZW/J/kVE+4rSBgOORLQwnvBF+ZUie1EJUi
K7UdAKZDdbyq0MKq9hXpv5A5odJnnuXsjliah8TzZR5HlihHb5rk1GZ0vEnZW+rf
s2tU9C84d615+8H1QqSg1vNPE1QE99eOUsOAmIffGyorjJ0DCxCDNoatcaX/fUze
pKGzuStj5BkJYSpkVnh2eV73VEar7OgLoXgKoCCIoFr9aqyJNB7Fly6NDvRfc7EC
p1iqQCsMjJTaUj72lj4+cw4cipMVL+Ei+7MmK6lzMIaqS3keeBinvLP1lHzCJtlj
Wsx73yQYD0Kqe6JrmUAs+sVCHCguE48rnP03Zdq8o3Q+hC7kv2s=
=C7+6
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--


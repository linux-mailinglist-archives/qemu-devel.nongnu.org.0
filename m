Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835B6CCD81
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Oct 2019 02:35:30 +0200 (CEST)
Received: from localhost ([::1]:59542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGuWH-0006n5-J3
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 20:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGuUl-0005j4-IR
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 20:33:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGuUk-0001mR-9l
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 20:33:55 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:46433 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGuUi-0001jE-7i; Sat, 05 Oct 2019 20:33:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46m4NS6whgz9sPZ; Sun,  6 Oct 2019 11:33:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570322024;
 bh=vZOaaC4Z1O1WVUpE4oA2ivH+PXKawBBHWPS/hgkWAu0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pYJ6sM8wiNs9xI176bjQC2fR99WKLr6zOBwMwqZ7AOyCZ2u35vKr9uHiL+BkYETth
 fqepXhxxMstD5hoD//WOOKHy/cIeHMl9ExhA+/ENKvBAqtwQmC1Gk7LFCCN2NP1PsE
 lghRZA5ieWbDHsQq0T+u9Z24NfI65bYPFPJMHxa0=
Date: Sat, 5 Oct 2019 20:21:00 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] xive: Make some device types not user creatable
Message-ID: <20191005102100.GD29310@umbus.fritz.box>
References: <157017473006.331610.2983143972519884544.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9l24NVCWtSuIVIod"
Content-Disposition: inline
In-Reply-To: <157017473006.331610.2983143972519884544.stgit@bahia.lan>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9l24NVCWtSuIVIod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2019 at 09:38:50AM +0200, Greg Kurz wrote:
65;5603;1c> Some device types of the XIVE model are exposed to the QEMU com=
mand
> line:
>=20
> $ ppc64-softmmu/qemu-system-ppc64 -device help | grep xive
> name "xive-end-source", desc "XIVE END Source"
> name "xive-source", desc "XIVE Interrupt Source"
> name "xive-tctx", desc "XIVE Interrupt Thread Context"
>=20
> These are internal devices that shouldn't be instantiable by the
> user. By the way, they can't be because their respective realize
> functions expect link properties that can't be set from the command
> line:
>=20
> qemu-system-ppc64: -device xive-source: required link 'xive' not found:
>  Property '.xive' not found
> qemu-system-ppc64: -device xive-end-source: required link 'xive' not foun=
d:
>  Property '.xive' not found
> qemu-system-ppc64: -device xive-tctx: required link 'cpu' not found:
>  Property '.cpu' not found
>=20
> Hide them by setting dc->user_creatable to false in their respective
> class init functions.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-4.2.

> ---
>  hw/intc/xive.c |    3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index 29df06df1136..6c54a35fd4bb 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -670,6 +670,7 @@ static void xive_tctx_class_init(ObjectClass *klass, =
void *data)
>      dc->realize =3D xive_tctx_realize;
>      dc->unrealize =3D xive_tctx_unrealize;
>      dc->vmsd =3D &vmstate_xive_tctx;
> +    dc->user_creatable =3D false;
>  }
> =20
>  static const TypeInfo xive_tctx_info =3D {
> @@ -1118,6 +1119,7 @@ static void xive_source_class_init(ObjectClass *kla=
ss, void *data)
>      dc->props   =3D xive_source_properties;
>      dc->realize =3D xive_source_realize;
>      dc->vmsd    =3D &vmstate_xive_source;
> +    dc->user_creatable =3D false;
>  }
> =20
>  static const TypeInfo xive_source_info =3D {
> @@ -1853,6 +1855,7 @@ static void xive_end_source_class_init(ObjectClass =
*klass, void *data)
>      dc->desc    =3D "XIVE END Source";
>      dc->props   =3D xive_end_source_properties;
>      dc->realize =3D xive_end_source_realize;
> +    dc->user_creatable =3D false;
>  }
> =20
>  static const TypeInfo xive_end_source_info =3D {
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9l24NVCWtSuIVIod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl2YbokACgkQbDjKyiDZ
s5J8yBAAxcqQPRwd9yzbWxySbZTAHJyxtfRdCN0cIEqvjzxRts9JqwfbHTGTUnvF
6isqb75PwUpiaLxxivqoV18NSHauax7idU/61o3v27OomRJNj9rP2hkLTDHv01+k
vXsz+pjtzO8UM8WmUe01BRQYgvWChQFotGgbkHygiR9IYg5+FTlV4D0xy+hLavZY
YGZZSEBDo/pAEcunN1MHfSxj61ZALT0XRxR6vC7p5v4uvduVgHSrRuFcFUb60rC1
XzSAyBCnaGbASTFDE3Kk49p1i9gQlEUOkgYubnZlTwtgbOMkfuyDjNQ8fCZU0ywq
w+HE2Yh5mn6c9LSrl9vkF79a3EqREq366Y+tYknLEYFrONxuEzL8y7Yt3pcvAHtZ
1N2LfKz/ONs+AdF8mCzv5E+NBgCHjkgitQBxr2JoEyKxawV8dCAXRgZQmGpVdOVx
pfErgjWGqJ5DUvPqCefrXnEOdmfoEk2qBBJggFW0wMlUQSrhTBrE6qH/O25EFucJ
HaZ7A1569Do+7s72DXIeYC5VCRhraF32hhtJnpiKKEUYpwVHxG4aAmXseq2T9cJV
Jz02th4sEYsHCmKW88JAG9r8rhN27jexGpDe+x5s9RgxFW8mS1ENR0cL8ETkHHlC
i6FMzZOhl+0356nQkWHvdfixpc4HAJS70i0fBBEn1oqZ8iaoZnE=
=R3cu
-----END PGP SIGNATURE-----

--9l24NVCWtSuIVIod--


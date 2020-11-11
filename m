Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4693F2B2BFD
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 08:39:32 +0100 (CET)
Received: from localhost ([::1]:49122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdq9i-0005sL-QX
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 02:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kdq8X-0004ol-EI; Sat, 14 Nov 2020 02:38:17 -0500
Received: from ozlabs.org ([203.11.71.1]:57091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kdq8U-0005Ae-8b; Sat, 14 Nov 2020 02:38:16 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CY6cz1Bb1z9sVC; Sat, 14 Nov 2020 18:37:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1605339475;
 bh=V8sWMKaU2YDbAcMeC33hScRVXmLQz8ucK2NL/3SPp0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OmqRc/cO4aIdSXl83D4dhG3P4FJw4z9/2DJc4ZoXmgU5Ukvy0A84T7w5Cqsw7bJrJ
 4O7+tGux+y32Rh2ZslEchfuzqKyDIT/Yf3kjkpGTBfItpUFSSHqnpvjEH3fFlF7U8R
 EylDAjlT49U0qTB8q3KgBl91vTrgmMd9k9l+Muho=
Date: Wed, 11 Nov 2020 17:20:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2-for-5.2] macio: set user_creatable to false in
 macio_class_init()
Message-ID: <20201111062037.GA396466@yekko.fritz.box>
References: <20201110103111.18395-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <20201110103111.18395-1-mark.cave-ayland@ilande.co.uk>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 02:37:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: qemu-trivial@nongnu.org, thuth@redhat.com, qemu-ppc@nongnu.org,
 armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 10:31:11AM +0000, Mark Cave-Ayland wrote:
> Commit 348b8d1a76 "macio: don't reference serial_hd() directly within the=
 device"
> removed the setting of user_creatable to false on the basis that the rest=
riction
> was due to the use of serial_hd() in macio_instance_init().
>=20
> Unfortunately this isn't the full story since the PIC object property lin=
ks
> must still be set before the device is realized. Whilst it is possible to=
 update
> the macio device and Mac machines to resolve this, the fix is too invasiv=
e at
> this point in the release cycle.
>=20
> For now simply set user_creatable back to false in macio_class_init() to
> prevent QEMU from segfaulting in anticipation of the proper fix arriving =
in
> QEMU 6.0.
>=20
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/misc/macio/macio.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> v2:
> - Rebase onto master
> - Add for-5.2 into subject prefix
> - Add R-B tags from Philippe and Thomas
>=20
>=20
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index 51368884d0..bb601f782c 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -456,6 +456,8 @@ static void macio_class_init(ObjectClass *klass, void=
 *data)
>      k->class_id =3D PCI_CLASS_OTHERS << 8;
>      device_class_set_props(dc, macio_properties);
>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +    /* Reason: requires PIC property links to be set in macio_*_realize(=
) */
> +    dc->user_creatable =3D false;
>  }
> =20
>  static const TypeInfo macio_bus_info =3D {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+rgrIACgkQbDjKyiDZ
s5KoCw/9GhUSQf6iKXSg9wfx1UY1mv27envv8xbxNfm7AWCdu1aaiaSucGg2T/oV
m2p+vaPa8RTGPPDrW14zdT0lGOTOW2qp9XvsrpbWx1LiHWLQqw/CAbJRX3khFOoL
hzOsnvEG8We4EYs/FQIfJnd573cAl/r4bmJNBitqmfMbH33UFUOnqIMTobY0ftcd
HWn+gYAXY4YPXrBdw+d3xNT3yVqblT4jRAZdGWJEd+nh44M9uFN7vQLbHIQfRT7Z
oIGOZBCf63sCZ8WeGCBEvOvzm7nRCLAZYofpHSLLjbbfRy4qK9JbuiSYGKjd1+LT
Dds6iZZQx19JvtegJ3aX9qX09MLo1d0geUZdg++bD49nLh5p2igQQKcBZhaQ0RSU
6w7Fk2VTmMCs+3lYvrmSVMhnUrIeW15UbIY6coMNbmAkVjji1QSGBRMCsOedFpxT
+qF5H9e5NitgdJAkMwwlC7+Atu8qKUbaG+ah4P3fIJ+fd4yEzfNYwEllEQ5wY32k
pBqDla0hQNA26TSPlvf0pQG2umi4vuwCAsSiQyFdqN2I+6EKt6yaJxJ/KAUWEP6E
K1wh2IlSMVivQ2RFXBfC14hO7R0tMf1x5dRoLWaHROIhwFqkuEmq2ADc1l9jV6cu
GMxtkFgJkjX5wwMA/LMP9UXaFUiq6F9uo+fNBi+La7el/Yp+tYA=
=7zQh
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--


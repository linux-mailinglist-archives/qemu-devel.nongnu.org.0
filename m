Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94A21389E8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 04:48:10 +0100 (CET)
Received: from localhost ([::1]:45240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqqi1-0007xy-RI
	for lists+qemu-devel@lfdr.de; Sun, 12 Jan 2020 22:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49820)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iqqgY-0006al-SJ
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 22:46:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iqqgX-0006LJ-G1
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 22:46:38 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:41971 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iqqgW-0006HU-CN; Sun, 12 Jan 2020 22:46:37 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47wzzB6fBYz9sR1; Mon, 13 Jan 2020 14:46:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578887190;
 bh=lUJPfLjfSBCh4kW8KjBXZ6xA5wcCpesjSc/uoqseyGI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K5RSe649Tp625nPxgUm40Ue6ewCLQycD2rOS1gRlYFl/sGZL81w1xx1WyX5Eiq+Zo
 yt0P6Q9ndY5fzCWAnM3W7Qu4FHc6We03UjeEg/UhoEDxUIIi/CXbo000Ni53Wj/fQQ
 Jc+KwbeleYeMhWp0mI6lNIfc7Wggq64K5wwBa+0E=
Date: Mon, 13 Jan 2020 13:46:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v2 09/10] target/ppc: Correct RMLS table
Message-ID: <20200113034617.GC19995@umbus>
References: <20200107044827.471355-1-david@gibson.dropbear.id.au>
 <20200107044827.471355-10-david@gibson.dropbear.id.au>
 <b4f4b0f9-759d-637d-9b40-d0fd3c0c21f6@kaod.org>
 <20200108010604.GI2137@umbus.fritz.box>
 <bc71d9cf-591b-76c6-d746-091800bb990a@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline
In-Reply-To: <bc71d9cf-591b-76c6-d746-091800bb990a@ozlabs.ru>
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
Cc: lvivier@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 groug@kaod.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, paulus@samba.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 06:46:19PM +1100, Alexey Kardashevskiy wrote:
>=20
>=20
> On 08/01/2020 12:06, David Gibson wrote:
> > On Tue, Jan 07, 2020 at 03:21:42PM +0100, C=C3=A9dric Le Goater wrote:
> >> On 1/7/20 5:48 AM, David Gibson wrote:
> >>> The table of RMA limits based on the LPCR[RMLS] field is slightly wro=
ng.
> >>> We're missing the RMLS =3D=3D 0 =3D> 256 GiB RMA option, which is ava=
ilable on
> >>> POWER8, so add that.
> >>
> >> Where is this defined ?
> >=20
> > It's in the Book4, so not easily available, unfortunately :(.
>=20
>=20
> It is in "User=E2=80=99s Manual Single-Chip Module POWER8 Processor" whic=
h is
> public.

Oh, excellent!  Looks like it can be downloaded from openpower.org

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4b6AkACgkQbDjKyiDZ
s5LYGA/8D58N7fR/kScgmsyJ3B18iVTyiv7mMXRImaAlaCyZGRQzBGL/0KOajfbr
zof7E8nNqIGfGxpibGk9EjQw5TV40SsqgZ4o29N7185+mospjuP4lBQ0ueBO14d1
4c1BG13YrG/GxJfc4mcfNAaTspnEHB+oMwwZIU0JOyQrAgfJyAT9fRLhfBFJqnWS
LMK7Ck9CrSOmzaqkejVg8F9C3YQ1NkM+l27433QUGbYXEdoB6RVknQwgHqAgwBzX
jmQw0ff/tVouUWIA1YVNmTuUBcq84rATHUdSkmmDHHV+Fc+PDwQqJfExcgFm3gnF
g9ojSWd3yck2yxUMxDpdcYo6vDS9z/o6qhEl7x0I4SFtr4Mukj4E5+Umk62Rzv3V
zbbOPDCUwoMXr7+aSR5gS0JvYyAgDpAD+aRhgFOCpFjxomxWS+Mk0JzVoigpIV4O
OF/WUnrFVvni/hTSApfP76koX7i6DI1MfBP9L7ozw2106ovVyxZehq59HcD8Y6TF
3qK7uGr+Mj27FMj+W8pyFdiq04jnqqwjLn+DgTdn5F8nSUrAw2ysEeg//4S23Pg7
HMNWSzkz0kvy441QRO/UKOHyjMfVzwNcVtTiavqFfh8tLfxvZ6xZK8OpTKXESloP
/rOe0yhxnXkj0GEhL6Qx3/kpM7wj+S+L0cRKb8roh8b21hUXBjc=
=npkR
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--


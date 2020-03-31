Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6737198900
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 02:47:19 +0200 (CEST)
Received: from localhost ([::1]:58814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJ53m-0001yD-DE
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 20:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jJ52O-0001PQ-0c
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 20:45:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jJ52M-000739-EM
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 20:45:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60653 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jJ52L-0006pm-Ch; Mon, 30 Mar 2020 20:45:50 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48rrGc6LlKz9sSJ; Tue, 31 Mar 2020 11:45:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1585615544;
 bh=XIAOaYxrJ42DjZpqX/WHbI0MMedE0G8gcp/SuCQL8QY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AzvQprmYtAiK7cIRt9j3BCJDBSQQTQ2BhzGzOoq7mn+nIMwvqNye9vMoL2CvzE/5M
 Uvf3LQzq0GfS4qKTGsy9DV9h2K1SCS6K3y1UceFsiZ7pGIdeFN/YJrMwbrcJHoQvH5
 kKuoKOBJHm8TxuXE2nluCUi4owDsgYdKKYvQ/aaE=
Date: Tue, 31 Mar 2020 11:44:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 0/4] spapr: Get rid of CAS reboot flag
Message-ID: <20200331004415.GC47772@umbus.fritz.box>
References: <158514992409.478799.6718223069768660390.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline
In-Reply-To: <158514992409.478799.6718223069768660390.stgit@bahia.lan>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 04:25:24PM +0100, Greg Kurz wrote:
> The CAS reboot flag was introduced in QEMU 2.10 to allow the guest
> to be presented a new boot-time device tree after CAS negotiation.
> CAS-generated resets rely on qemu_system_reset_request() which has
> the particularity of dropping the main loop lock at some point. This
> opens a window where migration can happen, hence promotting the CAS
> reboot flag to actual state that we should also migrate. In practice,
> this can't happen anymore since we have eliminated the scenario of
> the XICS/XIVE switch and the much less frequent scenario of device
> plug/unplug before CAS.
>=20
> We still have much of the CAS reboot bits around though. The full FDT
> rendering we do at CAS is enough to get rid of them once and far all.
>=20
> Some preliminary cleanup is made before going for the full removal,
> for easier reviewing. At some point I had the need to move some code
> around in CAS, and Alexey's patch from the "spapr: kill SLOF" (v8)
> series proved to be helpful so I've reused it in this patchset.
>=20
> This series applies cleanly on both ppc-for-5.0 and ppc-for-5.1.
> Since it doesn't fix any actual bug, I think this can be delayed
> to 5.1.

Applied to ppc-for-5.1.

>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6CklwACgkQbDjKyiDZ
s5IbEBAAhvkw8jgQZ0YmOmOAV30Gimcmc2fBZu0TgrIUYF/QXE4tmdeyHilvaEad
GToGdVQfw08NadyJ2/ri21q3vxhCUBuQL786tpr/r7vCWjsv2qRtAJJixO5y2OgM
+NS3OciquWfGy+hz134Iy6IF6KBI5jMvVHaovTlc/ma8R6kQoFIz4CUI9KQpFbjh
bbVBF6IU6ilBWMHPtwqLOSu6uMlNoz9h7gyNMFjVxw91sWKK/QdufucUYBLwuKxo
jDc+ZAl/bDFaTuag6EkyT2191+wYvGk9rjAz9qfgHwJpepBHWH8bXjt5RVTJBdr6
8KgRPhfLeGn3MbwkAbfr7qSq3Oz3yAXq4xwfks9SU8HHOkslCvcU0OZKuwkcfznH
Dz6bIjpnOAt7YP5r5XTpTcEkgQXDDEZMFUR9h/3rAehtxzD04GAM5I/bMWXWYKEQ
vlct5IkTHs3qa1qPMTeCWhHa/sNU8xbZkjX76Fiq3Fbu6fCo0F6aDXG97RKZSrCX
O0bn0umqFeE6iTdjhMLOhyYCPi7d4wzQOvTFvsNxM2AuT3diLM5g/hifDSVhftYC
czU9Yy13n3Cbt9lEvb5e4ieH7rCAaI2x4lofWAZrdQlPZtxCMAXO4qhJTIGhdBpe
UyCk0XjZvEF3ua8SgtPRH4Rl6tEQjLNOFA//Yi2luGsOpfp66F0=
=jkPk
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--


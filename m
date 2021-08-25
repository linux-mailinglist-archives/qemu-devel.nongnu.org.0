Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F33F6E3C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:21:17 +0200 (CEST)
Received: from localhost ([::1]:45910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkPc-0003Rt-UF
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGa-0000cS-97; Wed, 25 Aug 2021 00:11:56 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:53563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGW-0007CC-50; Wed, 25 Aug 2021 00:11:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvXbt4lmWz9ssP; Wed, 25 Aug 2021 14:11:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629864698;
 bh=uTnBymX6NYgxLYg8brHgB7MrP2Z1XMmOZHp6aElqG/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ciuX0KXzkaWSzQbr0u+IshstwBwMSW147yaIgNwVSYL+Cc8wCQpQdZxjNvOGGEHIT
 sJmbyAj/IGkLJgdwRmcQln7OJYLdJzB4Q7Lc3gteILSRJsE6r9CQcNZTI1I36mhC1w
 soomuCkDxUwoLjEl1c1h8hM295CflUgryu1cp5CE=
Date: Wed, 25 Aug 2021 13:11:25 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Finn Thain <fthain@linux-m68k.org>
Subject: Re: [RFC 00/10] hw/mos6522: VIA timer emulation fixes and improvements
Message-ID: <YSW03VVo3jKhnj3L@yekko>
References: <cover.1629799776.git.fthain@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PjEqvMBor5O+YTHG"
Content-Disposition: inline
In-Reply-To: <cover.1629799776.git.fthain@linux-m68k.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PjEqvMBor5O+YTHG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 08:09:36PM +1000, Finn Thain wrote:
> This is a patch series that I started last year. The aim was to try to=20
> get a monotonic clocksource for Linux/m68k guests. That aim hasn't been=
=20
> achieved yet (for q800 machines) but I'm submitting the patch series as=
=20
> an RFC because,
>=20
>  - It does improve 6522 emulation fidelity.
>=20
>  - It allows Linux/m68k to make use of the additional timer that the=20
>    hardware indeed offers but which QEMU omits. This has several=20
>    benefits for Linux guests [1].
>=20
>  - I see that Mark has been working on timer emulation issues in his=20
>    github repo [2] and it seems likely that MacOS, NetBSD or A/UX guests=
=20
>    will also require better 6522 emulation.
>=20
> To make collaboration easier these patches can also be fetched from=20
> github [3].
>=20
> On a real Quadra, accesses to the SY6522 chips are slow because they are=
=20
> synchronous with the 783360 Hz "phase 2" clock. In QEMU, they are slow=20
> only because of the division operation in the timer count calculation.
>=20
> This patch series improves the fidelity of the emulated chip, but the=20
> price is more division ops. I haven't tried to measure this yet.
>=20
> The emulated 6522 still deviates from the behaviour of the real thing,=20
> however. For example, two consecutive accesses to a real 6522 timer=20
> counter can never yield the same value. This is not true of the 6522 in=
=20
> QEMU 6 wherein two consecutive accesses to a timer count register have=20
> been observed to yield the same value.
>=20
> Linux is not particularly robust in the face of a 6522 that deviates=20
> from the usual behaviour. The problem presently affecting a Linux guest=
=20
> is that its 'via' clocksource is prone to monotonicity failure. That is,=
=20
> the clocksource counter can jump backwards. This can be observed by=20
> patching Linux like so:

I'm afraid I know very little about Mac hardware, and almost nothing
about m68k, so I can't really review these.  I have a batch of updates
for MAINTAINERS underway, which will take me off the list for this
file.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PjEqvMBor5O+YTHG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEltNwACgkQbDjKyiDZ
s5JeYg/9H+PdSSf6PxGXTrVzOAY91C+Tqo8LzM+JeF79ygtVSQ1fUqeKyKdYxsHZ
ZVVmIjnebGSSunTjyUfQu5bHVsT0UsfCrHTL3pCeuVxUBdgZz7lMzcRacc8jw/Ls
WZYshg09f7dTOJwWl32ahXqej2RKx+Y5y8NSp45X6qRmy+P24EDKE2r1ncPO1nyL
6NKX0A4kkJsLN0MdkwT6F38JZ7EjUppu6T7QuSZXIXnfrHO033rnAMhDy+NM4cZ+
tmE1ZUTKaSuKxuaxREFf+EwS9A8cbIUrSTrkh+VqmwhgQJltJ/wWtRaxjpWWPG5b
9t5CaifqcD+XiX1kkCs3No7uf6wCwlk7ty1NPuYiXa2gEAA1hW7KBTvD90Nms7IT
+7kVgo0r2Kv6LJ6qN9WwKM9cddFwhzpCoU6MMuDY+1DDr73avppDYJdrvK8s/gTy
J3azaT6Gs+sQ8Hiv1riVRrGPAjgnbGMVKmuBCqJsMEqBhGjCZ2oYvNPc2/Mod78E
3qjtxSpj/tqIoGAHV7kLd1r6EWZcnVggvNeFZXX7/1t0IxaheHR2ymMVdDAUPgkR
GxDUkO7EBfBYtddTxLOvi/dn3SSelsQRuU8ESGffkayNdMIc4GCyNQLRP6uilNiD
J1bmP201E5KIcWsIUyVL2XVWwg/Yra43P/zC6JqH1v+qrusKUNw=
=siKw
-----END PGP SIGNATURE-----

--PjEqvMBor5O+YTHG--


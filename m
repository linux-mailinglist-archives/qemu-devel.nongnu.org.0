Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B856D49C50
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 10:45:42 +0200 (CEST)
Received: from localhost ([::1]:54838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hd9kL-0003y0-VR
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 04:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43441)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hd9ib-0002rv-8R
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 04:43:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hd9iZ-0002g1-46
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 04:43:53 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46081 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hd9iY-0002P4-E3; Tue, 18 Jun 2019 04:43:50 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45ShSK2sNwz9s9y; Tue, 18 Jun 2019 18:43:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1560847409;
 bh=upT0+Y2QmwtbWdG0LMufSK7tWvPT6FnIGRl5hY3cDuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fIUUR1jGVkUQkTKAA6IGFfHjpGnzSnrPEmDie7BMpCMpIsU1ru84faIzjE5blxD4B
 hkAIlQ5qbFkaYGT48R8XjaY2fSW7Zt9Dqp3xUphS+5DVzqvJTdSGBgd7N9YzAcfUTj
 XcDsZyvlJIoLKFVkuZqVydZMGebcMQyYBAtBhUWA=
Date: Tue, 18 Jun 2019 18:43:24 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <20190618084324.GC3673@umbus.BigPond>
References: <20190616123751.781-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Content-Disposition: inline
In-Reply-To: <20190616123751.781-1-mark.cave-ayland@ilande.co.uk>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PATCH v3 00/15] target/ppc: remove
 getVSR()/putVSR() and further tidy-up
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
Cc: gkurz@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2019 at 01:37:36PM +0100, Mark Cave-Ayland wrote:
> With the conversion of PPC VSX registers to host endian during the 4.0 de=
velopment
> cycle, the VSX helpers getVSR() and putVSR() which were used to convert b=
etween big
> endian and host endian (and are currently just a no-op) can now be remove=
d. This
> eliminates an extra copy for each VSX source register at runtime.
>=20
> Patches 1-3 do the elimination work on a per-file basis and switch VSX re=
gister
> accesses to be via pointers rather than on copies managed using getVSR()/=
putVSR().
>=20
> After this patches 4-14 change the VSX registers to be passed to helpers =
via pointers
> rather than register number so that the decode of the vector register poi=
nters occurs
> at translation time instead of at runtime. This matches how VMX instructi=
ons are
> currently decoded.
>=20
> Finally patch 15 performs some related tidy-up around VSX_FMADD which dec=
odes the
> a or m form at translation time, allowing a single helper function to be =
used for
> both implementations.
>=20
> Greg: I've added you as CC since you managed to find a bug in my last ser=
ies. This
> one is much more mechanical, but if you are able to confirm this doesn't =
introduce
> any regressions in your test images then that would be great.
>=20
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Patches 1 & 2 applied.

>=20
> v3:
> - Rebase onto master
> - Add latest R-B tags from Richard
> - Fix zero init in helper_xvxsigsp() in patch 1
> - Preserve order of do_float_check_status() in helper_xsrqpi() in patch 1
> - Remove accidental write after store in VSX_STXVL() macro, and also just=
 use
>   the xt pointer directly in patch 2
>=20
> v2:
> - Rebase onto master
> - Use working copy of VSX destination registers in patches 1-3 to keep cu=
rrent
>   semantics where src =3D=3D dest and exception handling
> - Add patches 4 and 6 to split out helper functions still requiring an op=
code
>   parameter
> - Remove opcode parameter from GEN_VSX_HELPER_X3 and GEN_VSX_HELPER_X2 as=
 it
>   isn't required for the common case
> - Drop VSX_TEST_DC improvement patch since it is no longer applicable wit=
h the
>   removal of opcode from the above macros
> - Rework VSX_MADD improvement patch to use a single helper for both a and=
 m
>   forms as suggested by Richard
>=20
>=20
> Mark Cave-Ayland (15):
>   target/ppc: remove getVSR()/putVSR() from fpu_helper.c
>   target/ppc: remove getVSR()/putVSR() from mem_helper.c
>   target/ppc: remove getVSR()/putVSR() from int_helper.c
>   target/ppc: introduce separate VSX_CMP macro for xvcmp* instructions
>   target/ppc: introduce GEN_VSX_HELPER_X3 macro to fpu_helper.c
>   target/ppc: introduce separate generator and helper for xscvqpdp
>   target/ppc: introduce GEN_VSX_HELPER_X2 macro to fpu_helper.c
>   target/ppc: introduce GEN_VSX_HELPER_X2_AB macro to fpu_helper.c
>   target/ppc: introduce GEN_VSX_HELPER_X1 macro to fpu_helper.c
>   target/ppc: introduce GEN_VSX_HELPER_R3 macro to fpu_helper.c
>   target/ppc: introduce GEN_VSX_HELPER_R2 macro to fpu_helper.c
>   target/ppc: introduce GEN_VSX_HELPER_R2_AB macro to fpu_helper.c
>   target/ppc: decode target register in VSX_VECTOR_LOAD_STORE_LENGTH at
>     translation time
>   target/ppc: decode target register in VSX_EXTRACT_INSERT at
>     translation time
>   target/ppc: improve VSX_FMADD with new GEN_VSX_HELPER_VSX_MADD macro
>=20
>  target/ppc/fpu_helper.c             | 841 ++++++++++++++++--------------=
------
>  target/ppc/helper.h                 | 320 +++++++-------
>  target/ppc/int_helper.c             |  26 +-
>  target/ppc/internal.h               |  12 -
>  target/ppc/mem_helper.c             |  25 +-
>  target/ppc/translate/vsx-impl.inc.c | 567 ++++++++++++++++--------
>  target/ppc/translate/vsx-ops.inc.c  |  70 +--
>  7 files changed, 952 insertions(+), 909 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl0IpCwACgkQbDjKyiDZ
s5K+5RAAxO/9aJSj4WDDAIXdazJ2lVLpE0kmPFTuZCgfj/F3ex0B0EWFzFiG+4K1
roiMQeViFhkbFatbW3GLNcSp3+8isZ0beGWRP+yf+z0yAUUypmUHVS+kQukVUZS3
T8AQtw2RcRvSJDQNXqt2nJp+jzrVJcRzp/3iholrYB/B9M9zYLY77y83v7gcSO12
9LLgXWi14J3B73G7PLC4qnuln1xtxmaDDiq3x47yG2TXkrhz7RhL8jnk6iZCV46X
gRZ0k3tajiOWSEEE39OGrdVFqKcb3H4i9iBuqB2puN8uavUgx5rwcHSPGd3ZfS+f
iSbCEqHc+VOjHIGw3ZCnpf16ji4tRZfAT80Xp4aAKBuLp0kobnRLLuuu69Re/D6u
Bf6SflgmB0TQtR2ktYT3Y4pqY4MyrVP4+6S15QTVitMIpj2CFZBtIpnl0Xnbwh+C
A0wH6URw0v6vwDtzVGabTkw3uaolv6CL6FxV062/MbHrM/HdUwomchuHEPkR7uPT
ql2mwFNqp3TgjOf/oW19JNTpWgk1UbeL6tqzKdKstq8R/PT6ZQGzIjJuX5dyetKj
NxN1LHB/3AoButSoJa+AtDXuFGcrK34E4/+pxbR+XuOCEybcJd/pR1KYrqEn/dGU
s6N4Gw9KA2mo9rnKYQEAkM9vDkVgSkv7/+RgLuULJ5vp7k2Pbb0=
=l6LS
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEA02D9489
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 10:04:19 +0100 (CET)
Received: from localhost ([::1]:47440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kojmE-0003vy-Dw
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 04:04:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kojjA-0002Ec-W1; Mon, 14 Dec 2020 04:01:09 -0500
Received: from ozlabs.org ([203.11.71.1]:60629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kojj6-0006tl-PV; Mon, 14 Dec 2020 04:01:08 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cvb2z6p37z9sTL; Mon, 14 Dec 2020 20:00:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607936459;
 bh=LajXYu8d8WQERSf+RN6YNr3J7aJHzZtuV4mvhB6sK20=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HMZu/ZCb8zVorvhucD/bBIS5l1S3pGq6BqnxxIKhadRbgv5zrcGbNV92JUXNxdai6
 aUotysvZgckhSA/1IAObnJG5Ylq68JIe66Zmfw9jq8J5ct+jPcurublhzgL0fP/9s2
 44VXMcTuN72iFI9MteJkoPqVTxsk4pB0V47Hm4L8=
Date: Mon, 14 Dec 2020 17:00:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/8] hw/ppc: Convert UIC device to QOM
Message-ID: <20201214060026.GF4717@yekko.fritz.box>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Zi0sgQQBxRFxMTsj"
Content-Disposition: inline
In-Reply-To: <20201212001537.24520-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Zi0sgQQBxRFxMTsj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 12, 2020 at 12:15:29AM +0000, Peter Maydell wrote:
> This patchseries converts the PPC UIC "Universal Interrupt
> Controller" to a QOM device.  My main reason for doing it is that
> this fixes a couple of long-standing trivial Coverity issues -- the
> current ppcuic_init() function allocates an array of qemu_irqs which
> the callers then leak.  (The leak is trivial because it happens once
> when QEMU starts.)
>=20
> The patchseries converts the UIC to a QOM device but initially leaves
> the old ppcuic_init() creation function with its old API intact.  It
> then goes through converting the various boards that were using
> ppcuic_init() to instead directly create the UIC using the usual qdev
> APIs, so that it can delete the ppcuic_init() function entirely.
>=20
> The patchset includes one patch which deletes 350 lines of dead code
> -- the ppc405cr_init() function seems to have never been used since
> it was added in 2007, so rather than converting this user of
> ppcuic_init() it seemed more sensible to delete it.
>=20
> I have tested with 'make check' and 'make check-acceptance' but I
> don't think the latter really exercises the affected boards, which
> are:
>=20
>  bamboo
>  ref405ep
>  sam460ex
>  taihu
>  virtex-ml507
>=20
> I found instructions on how to boot an AROS image on sam460ex, so I
> have tested that: it works as well after this series as it did before
> (gets to "Libs/workbench.library" and stops); it does seem to
> successfully do things like scanning the USB bus and responding to
> keyboard input at the boot menu, which suggests that IRQs must be
> working.
>=20
> Side note: the 'irq_inputs' hacks in the PPC CPU I think would really
> benefit from conversion to being qdev gpio inputs now that CPUs are
> real devices. There are also a lot of non-QOM devices in this
> ppc4xx code if anybody is interested in working on more QOM
> conversions for these boards.
>=20
> thanks
> -- PMM

1..4 applied to my tree.  Looks like there are some comments needing
review on 5, so I'll leave the rest for another spin.

>=20
> Peter Maydell (8):
>   hw/ppc/ppc4xx_devs: Make code style fixes to UIC code
>   ppc: Convert PPC UIC to a QOM device
>   hw/ppc/virtex_ml507: Drop use of ppcuic_init()
>   hw/ppc/ppc440_bamboo: Drop use of ppcuic_init()
>   hw/ppc/sam460ex: Drop use of ppcuic_init()
>   hw/ppc: Delete unused ppc405cr_init() code
>   hw/ppc/ppc405_uc: Drop use of ppcuic_init()
>   hw/ppc: Remove unused ppcuic_init()
>=20
>  hw/ppc/ppc405.h           |   8 +-
>  include/hw/intc/ppc-uic.h |  80 ++++++++
>  include/hw/ppc/ppc4xx.h   |   9 -
>  hw/intc/ppc-uic.c         | 321 +++++++++++++++++++++++++++++
>  hw/ppc/ppc405_boards.c    |   8 +-
>  hw/ppc/ppc405_uc.c        | 415 ++++----------------------------------
>  hw/ppc/ppc440_bamboo.c    |  38 +++-
>  hw/ppc/ppc4xx_devs.c      | 246 +---------------------
>  hw/ppc/sam460ex.c         |  70 +++++--
>  hw/ppc/virtex_ml507.c     |  21 +-
>  MAINTAINERS               |   2 +
>  hw/intc/Kconfig           |   3 +
>  hw/intc/meson.build       |   1 +
>  hw/ppc/Kconfig            |   1 +
>  14 files changed, 555 insertions(+), 668 deletions(-)
>  create mode 100644 include/hw/intc/ppc-uic.h
>  create mode 100644 hw/intc/ppc-uic.c
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Zi0sgQQBxRFxMTsj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/W/3oACgkQbDjKyiDZ
s5JkTxAAw53AhRA4eDXN9mGgqjZK1GMPYOGlC/YzTgABuSJ7AbKb6xIRaj1cUaSW
copEEB8P+VM8RJF3giQ/T4sS/Qwr/vvR7M/asqPpc4m47TP24Iw0dLuozvJd0asI
KklR9cssWjkjr1UcRYn+L2qOp5qUMPA+l8xYQF+al8lfpL8LGSlDBhFHuptRZvL2
1dG+IcNFNIPHI5rpcLi7N3tGoKqiusBeAtdNj5LGsnFrxugfDjo4yCKP1bxld5g9
y7kjnS0UrM9OzypDpjNqpiUnMS2FZ3ySghOyQVirV/CZCMt/15ZHjcY9/TgWEkyo
iGJ4u10p1fi0e+QWrf2E4HgD70GyTI4iIQZH3euENwNponD4dCFmGFnjT/nhlH5R
jIDsQTC4v5aayDdlHbRulu5ptFCeeLDT9W5aO1lF67XfF7klyWzkuDE06Wnq59x5
rOdD/MQUpGjHc1XZI2lTuV1y/gqKaJHt/LCuEezyILrFTRENQ4DzxGqGhpgVoJmQ
wDVxTVf9HTR0vrkZEPQ3MtLQIqLexjIM8PWgNKPrvspnX4++AR3YroRPac80WIwQ
PC1UKJdgnCnFq0O8rYSLWZXQDDSYp1k70knjBIkJHCNqzs/gq4pVpSoAlXVQ/0fr
njtxPOkka7ho8hGvSmE0gxFRqdaL0zhqWgbrSIaazy820KV8MAc=
=9Bqd
-----END PGP SIGNATURE-----

--Zi0sgQQBxRFxMTsj--


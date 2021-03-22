Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7EC3437CE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 05:14:37 +0100 (CET)
Received: from localhost ([::1]:43700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOBxc-00088s-Kd
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 00:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv0-0006Mh-KM; Mon, 22 Mar 2021 00:11:54 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41513 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBuv-0004gY-NP; Mon, 22 Mar 2021 00:11:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzy648zz9sRN; Mon, 22 Mar 2021 15:11:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386302;
 bh=obGnKHlR/rSNr49bp5x4i8HbcCi4m2CisTsIQuiFlM8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=frr5GuNZbZfOx80IyxHum0+gFElRW4oQrKLzsyWD/LqoFLJB69vBFUOxaLzqeceVs
 v/0z/OHGhDm3pN3vUhLWicG0Vl82I2+4GriGbK9UrRfulHCZflzNa0now3+FDK/WwX
 K3AN5f752MrPHEBUxddNPaZFxVATXsj4u3UKRGwY=
Date: Mon, 22 Mar 2021 14:22:27 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/net: fsl_etsec: Tx padding length should exclude CRC
Message-ID: <YFgNc43L4rIlsTdK@yekko.fritz.box>
References: <20210316081505.72898-1-bmeng.cn@gmail.com>
 <CAEUhbmXPvyLT-ZTr+aSECLvmosyVnYASNZa=YAKcU0v4a7-Aaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4WyGdK7YpOWZ19xV"
Content-Disposition: inline
In-Reply-To: <CAEUhbmXPvyLT-ZTr+aSECLvmosyVnYASNZa=YAKcU0v4a7-Aaw@mail.gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4WyGdK7YpOWZ19xV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 09:29:12AM +0800, Bin Meng wrote:
> On Tue, Mar 16, 2021 at 4:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > As the comment of tx_padding_and_crc() says: "Never add CRC in QEMU",
> > min_frame_len should excluce CRC, so it should be 60 instead of 64.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  hw/net/fsl_etsec/rings.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>=20
> Ping?

Sorry, I was away on holiday last week.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4WyGdK7YpOWZ19xV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYDXIACgkQbDjKyiDZ
s5JtAA/7BpNcmTKQnJSvqGPCzqJUCjSWK7el5zYPNCOxDLpXwK9de4yx3wtWXC1e
ll7KUu/HoecNmHZBbmmlyxXWWX0X0UMNpXBEc260S0Y3P2sn0qSZ+ffypxB6pKCu
8jfjXOsffshA1tAmk77kqm6CRc9Jlu2j105PUZ2vJgfhJlLFDXsGeCNg6a5uoB4T
dL5uyiQXi61IFIJPMSdfMo8Sas7YyJU6BFZSda+AI9kSp4x92M8zndYXijzf06Q2
qE25NsYIhWRGvKc+cB2VOi1KzIrxqlBGnFvPG2OEj/3AHxWEmUHDBHGT0i80g5bo
/9A4wjkFDxVFTQemDLeI9TXdU6vPThO7wbOWevC0Ko4tUl4S2Df74Ygm/Y5qVq9A
9LwAOWj8lGzWIsmZQD+PiJd6X7Md4ZUB8ne7pnESicChU1AE62yq9GMJF+qbbb8z
c43mKOnPsUcI47TYtrdHQ5J3xmERrEFNkL/XXEhtKbTAv7ghI9++RR6h+MKcRk5w
ivORTTmM/caGJBXrdrTByh+B8E5wbBsn0k+OI1wxSunepLyV4eJMrvzklqVDXKMq
gS5QgPKWabCOlUs89ui9m/nq4tK+aHIZk2uCYSyeocj7mwH91xpsIPSrf66wG2hc
4f9ixgxyN+LhMMilHdsIWH5Hbcci/f7L0/lG2MSSApgdgWOzT6g=
=rGT5
-----END PGP SIGNATURE-----

--4WyGdK7YpOWZ19xV--


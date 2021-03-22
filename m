Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CD3343885
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 06:26:22 +0100 (CET)
Received: from localhost ([::1]:46582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOD53-00051X-Bf
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 01:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOD3T-0004R0-Jl; Mon, 22 Mar 2021 01:24:45 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOD3O-0001ab-A4; Mon, 22 Mar 2021 01:24:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3jc10QbMz9sVt; Mon, 22 Mar 2021 16:24:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616390673;
 bh=01/kUWaA2zNnOAbuaD/kcHU2fMH11hA9CdX4RlCAv9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BtYGsl8QwODoz7OKRJpnTa3ARdV9uO4lpYmCEcjZ2CXRLu0ppoY07D1p6KdlXmkQk
 6jwdug7MVGNLnzcpwq3nLY7ytfA7vOFB2X2Ya1huCtLj9lITf0UxgFl+GxQEKD9j+x
 Z46hJ9quq82QiXnPIpeLuQ0zI3Zg9aaDM2t02R1M=
Date: Mon, 22 Mar 2021 16:17:17 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/net: fsl_etsec: Tx padding length should exclude CRC
Message-ID: <YFgoXU8tRCKWd0pk@yekko.fritz.box>
References: <20210316081505.72898-1-bmeng.cn@gmail.com>
 <YFgNZFAKjVhder2R@yekko.fritz.box>
 <CAEUhbmV4=yz1Df9YDxsM1Evjd4dJA2rM8xoiSUvxEtOoL2z2xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H2QjMByJ8FD1gbVV"
Content-Disposition: inline
In-Reply-To: <CAEUhbmV4=yz1Df9YDxsM1Evjd4dJA2rM8xoiSUvxEtOoL2z2xg@mail.gmail.com>
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--H2QjMByJ8FD1gbVV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 12:33:06PM +0800, Bin Meng wrote:
> Hi David,
>=20
> On Mon, Mar 22, 2021 at 12:11 PM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Tue, Mar 16, 2021 at 04:15:05PM +0800, Bin Meng wrote:
> > > As the comment of tx_padding_and_crc() says: "Never add CRC in QEMU",
> > > min_frame_len should excluce CRC, so it should be 60 instead of 64.
> >
> > Sorry, your reasoning still isn't clear to me.  If qemu is not adding
> > the CRC, what is?
>=20
> No one is padding CRC in QEMU. QEMU network backends pass payload
> without CRC in between.

Ok, but the CRCs must be added if the packets are bridged onto a real
device, yes?  Where does that happen?
>=20
> > Will it always append a CRC after this padding is complete?
>=20
> No.

If that's true, then won't the packets still be shorter than expected
if we only pad to 60 bytes?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--H2QjMByJ8FD1gbVV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYKFsACgkQbDjKyiDZ
s5LKVQ//Xy/EXxroivZvJzVJ36N0LcbLaHN3NjnjUpqxFM9cT5lt9OvBsMnkPsp+
cEMzFIBZl34Mt7H/FEsXZZMcOd8or/Ag7eOV85TUMZ//TU4UxlP4dE0D9ahJ19U4
CFaiTIgfODHmwNNbW+hQ+kE4NvzRzEBtov4TbuTS3bQavDR8HiUAQcuhNjoNk7G5
RUIfKPsi+6C9CVl4LssSLAEwaiN0T7tevly7ChfsqgcGuAhxbtdlSXfKlCAkGl3t
YsaqFM3x1ArF+WRHUbqEv8a1VWCR0PsHD29/Xm2vq/ohwE42EXkw8sTC87cKRK7y
xenxlWeQjqw77ym8tdyUaWbI3ku2QOCpeLr2WDVp593wPxMCCI8WJfAw64DkKfC2
5lZ7O/9UTEVKolLacPz/V+HhpizX+3xODAhY2QWie8O6qacGwAKvKgNdozl544sP
LEUgQhYorgB0KfSHefN9LX5unIeQB9yPT8DKxpdNwf6cMG3lnxONSw6K/grmc9fR
XcnTiHNKRCDdyFYyptojBvUaZ9pR75G1/SmhfDp365pMMjCC7K/kTkEbaSoHb8Dm
n523A4svpU24wR2bsZTZv+tz7LzRHPSj/g81/HuN7YiEtOhDFa+hLVtfSn/regA/
+qcRAxG3Or+qmR1t/i1CocauuxLxGcrbHOtF5jYQtiz4/3tVxQ0=
=oGiS
-----END PGP SIGNATURE-----

--H2QjMByJ8FD1gbVV--


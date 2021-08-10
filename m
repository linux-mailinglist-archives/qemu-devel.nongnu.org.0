Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0DB3E51F6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:21:55 +0200 (CEST)
Received: from localhost ([::1]:45422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJH0-00040G-6K
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDq-00084a-D3; Tue, 10 Aug 2021 00:18:38 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49075 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDk-00029P-SO; Tue, 10 Aug 2021 00:18:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSR2HwWz9t5H; Tue, 10 Aug 2021 14:18:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569095;
 bh=FYq15RCu8rbH4wKIZWz005CakDcidx9DjYOoE8PKJC8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aZRAq9SoTsgjEehigDc5lMTdv6gg8LupP1g3SudXX8AkXeOR6BUgec9IRg9yzF3gZ
 atZEKTe3yP8Lk8LCcddUdLdFQPtMomFSGpLl+5dQYzo9BUkFYqGhrDhL0VNWpnEX7m
 uZzxuKYWLl0SFtQfi6/rJDBFdSJDW8J6JDTWhT7I=
Date: Tue, 10 Aug 2021 13:12:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 00/26] ppc/pnv: Extend the powernv10 machine
Message-ID: <YRHumlzjG+ymyF3Y@yekko>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MhCvVX/E563bMLIH"
Content-Disposition: inline
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MhCvVX/E563bMLIH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 03:45:21PM +0200, C=E9dric Le Goater wrote:
> Hi,
>=20
> This series adds the minimum set of models (XIVE2, PHB5) to boot a
> baremetal POWER10 machine using the OpenPOWER firmware images.
>=20
> The major change is the support for the interrupt controller of the
> POWER10 processor. XIVE2 is very much like XIVE but the register
> interface, the different MMIO regions, the XIVE internal descriptors
> have gone through a major cleanup. It was easier to duplicate the
> models then to try to adapt the current models. XIVE2 adds some new
> set of features. Not all are modeled here but we add the
> "Address-based trigger" mode which is activated by default on the
> PHB5. When using ABT, the PHB5 offloads all interrupt management on
> the IC, this to improve latency.

5..8/26 applied to ppc-for-6.2, continuing to look at the rest.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MhCvVX/E563bMLIH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER7pkACgkQbDjKyiDZ
s5LMhA//QewPvsme57I/3aKX1YiCqMKMtZIGBBcab5+PSQVbyeWvpCpef9489O1P
0Sks5u3fyu19eySpRcNtiVJz1K+ooUDBqMUcmwbJSTuwublzEZkRI4B291Lr5dhv
Sa5A0OTVkEBRX5q/BIbzfqPkv74HZqQ/f8d/HTHY7uH0EeCA2zm8iFrls/mOnaG+
otL18wMy34XGz8wsFHwHto9ZvZX/5ee0+BezQ1qk24QU8e4y4IUqd/XT1K1dNlbe
u45UlxFZAYMTNRXrmyZNtQPsXoKL3XVshugt1uuPq6ZUk1Hr5wf9M2hIqfzxjV9v
BCHJNjEAlhaGLZaviIucNwuxsXzD3cnuLANDvVAn07B/O9avzBm6mGkR/6dNmSLj
SsP8I16UVdM7UGA3Z7i0SNKtNajFnjCVZQEq9OSAU+Mh729FKtq3ptO5buRe+2fu
P0CbWFrgLXIgtHIGHbmju53OFzBD+0WjRR9ov8x/m656eJ/mGQCAhBfhwOLNNMVF
+xUy5X+s0t8Bxp+Zd1JiqTUM+ipbVRtfZ7NFgoklc533t5+nzcI+fgXLXUbhEKaP
DpkvMM0vClRGzwq5jCpwtVxB8oS4C2QAfKszrWSGRXo7NYZlnH63tCrbouUFBi+1
NQfpFftvYCQvPzaY1Rv1FIX6ve6X9a2Ka9z5NFwmHgDWYUrNYRs=
=9K4s
-----END PGP SIGNATURE-----

--MhCvVX/E563bMLIH--


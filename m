Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8473BB68A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 07:02:11 +0200 (CEST)
Received: from localhost ([::1]:44730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0GkE-0002Yu-Bh
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 01:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0Ger-0008Sr-8X; Mon, 05 Jul 2021 00:56:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50569 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0Gep-0002Fb-A6; Mon, 05 Jul 2021 00:56:37 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GJD191THgz9sW8; Mon,  5 Jul 2021 14:56:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625460989;
 bh=SgPSittSDbrqBzpyDAdMg5+oWTkJjDIRJ6nDdh189UQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YXZjeXFVzml9UjD/3TjFxoRfvJPNSQk9tMWIZuzajmJls4/1dTmu7YeKQwA6mHlQe
 Krbn2UVBnBf727Ro0R6JlgxOqtU392yNlLF5AaWu93LZFA5EVbtQQ8jQ4ue6j4AOJQ
 LDvk9Upgopocwlrb1+7H+ClBz1T1yIg9R0u7Drgc=
Date: Mon, 5 Jul 2021 14:55:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 2/3] spapr: use DEVICE_UNPLUG_ERROR to report unplug
 errors
Message-ID: <YOKQ0riCEt/4x23j@yekko>
References: <20210621205907.244841-1-danielhb413@gmail.com>
 <20210621205907.244841-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BV0e3ZZtPCexiDLc"
Content-Disposition: inline
In-Reply-To: <20210621205907.244841-3-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 eblake@redhat.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BV0e3ZZtPCexiDLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 05:59:06PM -0300, Daniel Henrique Barboza wrote:
> Linux Kernel 5.12 is now unisolating CPU DRCs in the device_removal
> error path, signalling that the hotunplug process wasn't successful.
> This allow us to send a DEVICE_UNPLUG_ERROR in drc_unisolate_logical()
> to signal this error to the management layer.
>=20
> We also have another error path in spapr_memory_unplug_rollback() for
> configured LMB DRCs. Kernels older than 5.13 will not unisolate the LMBs
> in the hotunplug error path, but it will reconfigure them. Let's send
> the DEVICE_UNPLUG_ERROR event in that code path as well to cover the
> case of older kernels.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BV0e3ZZtPCexiDLc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDikNIACgkQbDjKyiDZ
s5J24BAAhP4Cb+Z9hRygeAE9qHmmk4l+pRb0EO8M46gWP3deFR131iadExXDM+RC
mr2czNFekDiyTW241KjQAb1AwxWVCkI6zRs7EwtSeEibiosYAwvtHC89Ml14qMZX
eqBrpJ/OJGqji+wyUKC2JR3WM4bOiIHdTkSIxMp7IHGHs1sC5HYPLwJY8+gVo6/S
IxJkzTOtfZdW5w1nIzZmYLmA9RX265jMn05wIl/AzidNfhDVKEJz/u7emSvzk4N1
DeIlla7zx9zXmMUN933D0CbV8cX6TKXfk2CQrwVylwJvghqyowJHnumNqaLb15VW
WE7hK6O96SrbNF5qzH4b8PirJpPhhjN2e2nksTFi8XUhf/T/CI6mJHC4KIx7Od9R
PgR1rBlokVVeCTLyMS6Jbq/H4w6QTOLwhK3Ogy0JjMM5bCJObhqS87n9lyPkzk2T
XZEFfj01lm8iErlpITy7TX9NzVp6Zt+c0pD9V8Fy7N+YmXJsx+yDu0TaJS2a4G/4
sSQrUZ84SmQ7GFmpLsGfr1IogLof1e2gqvY4XAD1Ym6/FxsoG2IQCn7n99kYr/uQ
W+2iJ1A/HeeB0pJMhrqA31yXTCjNFEEitRrELz7tezn0b+5TYfXFXrTBw7pciTUo
QUJqCPO1h1cDOj6gMZLAJf+Of8AmUGrR1goGTYG05Gc07NsvhOk=
=WcdA
-----END PGP SIGNATURE-----

--BV0e3ZZtPCexiDLc--


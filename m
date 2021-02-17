Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7D131D3F3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 03:35:05 +0100 (CET)
Received: from localhost ([::1]:48646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCCgC-0000s6-Nd
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 21:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCCeZ-0008No-UI; Tue, 16 Feb 2021 21:33:24 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:48879 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCCeW-0004gg-TG; Tue, 16 Feb 2021 21:33:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DgMMb0BN9z9sRR; Wed, 17 Feb 2021 13:33:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613529195;
 bh=CIGN4MUEvFIVekgieEb3erHHHeOPqyQ9kfCkTb65gm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P1cAvf+Nz5LLZex1gVB4tg4GokPlz7zFDVWpbWGl4cvQoLBWDvr8IgmDO9AV8xV/J
 oJ5JX/a1l4F/hkbZPeLGvcUB9ElsqC8vmeo5O+AP+Y/MmryR1hY/dmO9HZ3MyLj0/0
 rrjhM9COdiNvbhTO6FnskcSO+RGIvjAN0F+0r/qo=
Date: Wed, 17 Feb 2021 13:33:09 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 0/7] CPU unplug timeout/LMB unplug cleanup in DRC
 reconfiguration
Message-ID: <YCyAZVv+KB07MpeW@yekko.fritz.box>
References: <20210211225246.17315-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cNEuG/hwu3sAzWuk"
Content-Disposition: inline
In-Reply-To: <20210211225246.17315-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cNEuG/hwu3sAzWuk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 07:52:39PM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> This is marked as a v3 as it started as a result of discussions that
> followed the v2 [1].=20
>=20
> The idea with this series is to add CPU hotunplug timeout to avoid the
> situations where the kernel refuses to release the CPU. The reasoning
> for a timeout approach is described in patch 05.
>=20
> While investigating putting a timeout in memory hotunplug, I have found
> out that we have a way to determine, at least in some cases, when the ker=
nel
> refuses to release the DIMM during a memory hotunplug. This alleviate one
> of the most common issues (at least AFAIK) with memory hotunplug and it
> made me gave up attempting to put a timeout in memory hotunplug altogethe=
r.
>=20
> At this point I didn't add timeouts for PCI hotunplug operations, but it
> is trivial to do so if desirable.
>=20
> The series goes as follows:
>=20
> - Patches 1-4: DRC simplifications/cleanups. The idea with these
>   cleanups were to trim the spapr_drc_detach use as much as possible,
>   since the function would be used to start the timeout timer
>=20
> - Patch 5: timeout timer infrastructure
>=20
> - Patch 6: add cpu unplug timeout
>=20
> - Patch 7: reset DIMM unplug state when the kernel reconfigures the DRC
>   connector

Very nice start.  More comments throughout.

>=20
>=20
>=20
> v2 link: [1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg044=
00.html
>=20
>=20
> Daniel Henrique Barboza (7):
>   spapr_drc.c: do not call spapr_drc_detach() in drc_isolate_logical()
>   spapr_pci.c: simplify spapr_pci_unplug_request() function handling
>   spapr_drc.c: use spapr_drc_release() in isolate_physical/set_unusable
>   spapr: rename spapr_drc_detach() to spapr_drc_unplug_request()
>   spapr_drc.c: introduce unplug_timeout_timer
>   spapr_drc.c: add hotunplug timeout for CPUs
>   spapr_drc.c: use DRC reconfiguration to cleanup DIMM unplug state
>=20
>  hw/ppc/spapr.c             |  40 ++++++++++++-
>  hw/ppc/spapr_drc.c         | 116 +++++++++++++++++++++++++++----------
>  hw/ppc/spapr_pci.c         |  44 +++++---------
>  hw/ppc/trace-events        |   2 +-
>  include/hw/ppc/spapr.h     |   2 +
>  include/hw/ppc/spapr_drc.h |   7 ++-
>  6 files changed, 147 insertions(+), 64 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cNEuG/hwu3sAzWuk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAsgGUACgkQbDjKyiDZ
s5LMyw//fWcPHUxvUvQZ0ICGd1l/M2mDilQXtY10X3vaaWLdDvChRvLf7Lb1du1D
3xl8GtkYjPPgXq6fsPHAo8bvmVw3J/icTDrnDv5/InYcgDJZvEU+lvX2p4PPE+tD
JT0sElqbi2h9rQfjW6j9tOB32ZeunlPocXseeweVwCHn9m2FsKuNhMJPui/5TnB+
Q0nqTi7i7IPkQzGgWTJb4wbxkOMEAVhwNKKFpf9OfyTYM4lItKJ5/rOfqqxyPgrY
er41OgOvVUAhptGtS+ZW2h0B85QeK32lQfWlO3MBzhayjGJxWnNmc5NWDsn1G3LI
nLAlRX4OuhCVOUr6GSz4OTq91foLtQBGRR6+nR+7fWnNa3k1iTwROG2Fq3l3AN8R
pNr9yoL5qnF5+zdweAos1l0irTe6+W+/F0oFEJElfO4jXkuzDVND82tOB9Tq9zpd
hxZlp+C70DEfEfCiAIBfVLc+yb8uEv7qCWm3VCIPulTRfwrKz8z7QEfUyFHnOcmM
iXsyN7BvOv5mcbPN0IFGgiNzY9N/skKdd1SrzBddq0ZrhRzBwevlbDR66Fbo2HSA
GFDzqGbAx2LJB+l+9rmKIyoDrLu4SU3VlEBL5Pt51NOtdoDei7/MzqDzLShxLrWW
2U5RDbp3oNmg+xGXDicBO/ECbs28leNsd1k2lEu3yWgO+uLHiCc=
=PZJu
-----END PGP SIGNATURE-----

--cNEuG/hwu3sAzWuk--


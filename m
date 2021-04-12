Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A04535B9CF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 07:29:14 +0200 (CEST)
Received: from localhost ([::1]:57964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVp8L-0004ZC-Mc
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 01:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lVp4N-0000ql-Pv; Mon, 12 Apr 2021 01:25:07 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:44223 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lVp4M-0000mb-0J; Mon, 12 Apr 2021 01:25:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FJccj3MDYz9sW4; Mon, 12 Apr 2021 15:24:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618205093;
 bh=VLqHunKUnpe9/OHM2mXxI6mfgz08vquBH2TnKFWmAs8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I6Bxl4wHVw1CWZXr9g3Q7ppsvowvVet54pCs97Jef7E5Sj3ev73DitdEWTojrhZL3
 jWGKB60/gVK6wL+AAQlNTVXEpXSYDixUb+PkdQmQ72gXUveyFP1qUbAug8WSp6Wx5J
 HT+6+UUBSm9XY7OU8kK3NkYJbmQHB68Q0lLzMaXo=
Date: Mon, 12 Apr 2021 14:32:21 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [RFC PATCH 0/4] target/ppc: add disable-tcg option
Message-ID: <YHPNVUlnHWu5rU+I@yekko.fritz.box>
References: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="30SGiYMsI+T/OSZq"
Content-Disposition: inline
In-Reply-To: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
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
Cc: qemu-devel@nongnu.org, andre.silva@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, lagarcia@br.ibm.com, matheus.ferst@eldorado.org.br,
 luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--30SGiYMsI+T/OSZq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

For future reference, please CC me explicitly on things you'd like me
to review.  I do scan the qemu-ppc@nongnu.org list, but it makes it
easier for me to find (and less likely that I'll accidentally overlook
it) if I'm also CCed directly.

On Fri, Apr 09, 2021 at 12:19:12PM -0300, Bruno Larsen (billionai) wrote:
> This patch series aims to add the option to build without TCG for the
> powerpc target. This RFC shows mostly the strategies employed when
> dealing with compilation problems, and ask for input on the bits
> we don't quite understand yet.
>=20
> The first patch mostly code motion, as referenced in 2021-04/msg0717.
> The second patch shows the 2 strategies we've considered, and hope to
> get feedback on. The third patch contains the stubs we haven't decided
> on how to deal with yet, but needed to exist to compile the project.
> The final patch just changes the meson.build rules
>=20
> Bruno Larsen (billionai) (4):
>   target/ppc: Code motion required to build disabling tcg
>   target/ppc: added solutions for problems encountered when building
>     with disable-tcg
>   target/ppc: Add stubs for tcg functions, so it build with disable-tcg
>   target/ppc: updated build rules for disable-tcg option
>=20
>  target/ppc/arch_dump.c          |   17 +
>  target/ppc/cpu.c                |  859 +++++++++++++++++++++++
>  target/ppc/cpu.h                |   15 +
>  target/ppc/gdbstub.c            |  253 +++++++
>  target/ppc/kvm.c                |   30 +
>  target/ppc/kvm_ppc.h            |   11 +
>  target/ppc/machine.c            |   33 +-
>  target/ppc/meson.build          |   22 +-
>  target/ppc/tcg-stub.c           |  139 ++++
>  target/ppc/translate_init.c.inc | 1148 +------------------------------
>  10 files changed, 1407 insertions(+), 1120 deletions(-)
>  create mode 100644 target/ppc/tcg-stub.c
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--30SGiYMsI+T/OSZq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBzzVUACgkQbDjKyiDZ
s5IYFw/6A8mWAJZqxXVdOjisyRXAbOreK7Peb/U5CUaEWmnG0nGGMFuzqZqIRMqX
OJzE+5AVIW3e53e/ewCusrIUb+Ff00LjJFuufYGghD+/w3If3Sf8XBamETTayj2W
/k2PLXu2vel/04AQuJezFlX8cBDyeNfzjGp33Qsq08EiMy8wO7ypM//XD4HUm0im
WRVA8R/oAP6Ywa9V0JGEEeZk6nn8/qFsqsewwj0I68YgDWmmQWMkh60T8yAjqAIN
nXjLNm0+4ksJ0DxZrhxTBrQ54S9CODHguXxOOb9N8M+tWfifxlnikYYcQ8DQojUo
jdKZfjyB4bdthf9qfELXIvL4zat2lsAs3Dk5w6UV+fpQyOGJ55qR5kQCErM2suRv
FVEr+1KLvkPQ1rsR/ACmpLVTc4DXDz3hIKgyB6sHpx1a4caEGGqpfWZYk7bwSXO4
PkUrxRJMtW59FvR9rusnOWUpY/n/BcDljnqMXy+wIx31kLsmp1boniU1ztzFGbI/
Il+JxjswL/iuuYwdG32NIrc2ynMqEIgxBkd6IomC5CeVcTjqvP3GOpO1K8AkN9zX
vyBdfJ95onByFD1xWuckB39Dm+l5J9rNP6l6gkAyjohgMUi1RxT2LwmHHPDpwREj
iLkEwC17lRbrWXR5GrlQvkqknmtYv/0/KACpYdn+kXnLjcvrQdQ=
=Bl4o
-----END PGP SIGNATURE-----

--30SGiYMsI+T/OSZq--


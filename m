Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FA44EA4BB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 03:44:59 +0200 (CEST)
Received: from localhost ([::1]:41670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ0un-0003kI-I4
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 21:44:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nZ0qc-0002WJ-1y; Mon, 28 Mar 2022 21:40:38 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nZ0qY-0008An-1B; Mon, 28 Mar 2022 21:40:37 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KSC1g5FbPz4xXS; Tue, 29 Mar 2022 12:40:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1648518023;
 bh=B6VK7TTGBBVAim+2A3UWhQriX9X4bG++uMQda1pySHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HnRVAt3pTE+cxez5BQ+rqy1VBRxm3/1iFQjucVxoLTK0figTR3rabpvB6TW6n2Pkv
 my0KnC+iLTC1ngGpiH+nX6r2OxttGhmn+SAJhl+wl+tcYJtO9I5gxuijcJ2Y00Oyfi
 T2kc45RUnkuv6cmZ+Yhy/QwYDSKDs2tkla/MtoE8=
Date: Tue, 29 Mar 2022 12:24:20 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 0/2] ppc: fix vcpu hotunplug leak in spapr_realize_vcpu
Message-ID: <YkJfxLJkxZQDQwch@yekko>
References: <20220328125918.494787-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NtXBDbbgcQKNI8Ug"
Content-Disposition: inline
In-Reply-To: <20220328125918.494787-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NtXBDbbgcQKNI8Ug
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2022 at 09:59:16AM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> This is a memory leak found by Valgrind when testing vcpu
> hotplug/unplug in pSeries guests.
>=20
> Other vcpu hotplug/unplug leaks are still present in the common code
> (one in the KVM thread loop and another in cpu_address_space via
> cpu->cpu_ases) but these are already being handled by Mark Kanda and
> Phillipe.

Changes LGTM, but I don't see much reason to split this into two
patches.  They're both small, and are part of the same logical change.

>=20
>=20
> Daniel Henrique Barboza (2):
>   hw/ppc/ppc.c: add cpu_ppc_tb_free()
>   hw/ppc: free env->tb_env in spapr_unrealize_vcpu()
>=20
>  hw/ppc/ppc.c            | 7 +++++++
>  hw/ppc/spapr_cpu_core.c | 3 +++
>  include/hw/ppc/ppc.h    | 1 +
>  3 files changed, 11 insertions(+)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NtXBDbbgcQKNI8Ug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJCX7sACgkQgypY4gEw
YSJnnw//T7j/vb5EIt6M7AdCJSUlKtMVL5CMq2U9SXiGh7cKtliwScC5vgaVoQRH
8azVq3Z/oeuD+Sw6Hb+l63kqu2xvVMGZpL0T2+XqWUmoURli3faD5dTLQSK3uBo5
H/8pjVaPCqiPto+nWUbKU8IthitONO77aSv9XbpstS6XIV2eFYWrsRWf49oDHbi+
rzfzBn99epaY7cpmB7KnahQDAsnoBJCMsw7lJiGj0PaAiz9z2Sqp5g3ay2f3s7Fo
1ZsdZEvN7xqbBkgCuXR2DS1Boy93YgpCZBGjEJ4wn3f2YpbF36Vo/CdiL1oJ89oz
TrpH4cRYmainN3uRM+UQM7Yza3lMLPpcfr47ihCk1Jag43A2wewrIQaM2QMBmqzM
c7w7IRrNDndrwqg88/J2GmE5+Ay5Ti5cbR/Tkp547NeYH2n2FlRyCQibKDNmXfrh
ZuumEMmRUxk4HzWvNJE2TIVJx6qJmOu3b/eWXN0gEW+f+Hlrgk9N8E2l7YJeMK40
HJl42L8nTahrIjI39CDrp4jb2WSDhDdySvRETz2/9pa0nz3oMfnVP8iErBqBZgJ2
+zJEVKr4IGifUvKkWk2gw3fpyzuVVbmcElQ0jp944RNm4ZSdsTV9YIh3njBQzuvY
2yFGKK6SXHgfpCOTaVTf2mFMIUx9gwGrT2c4wwmzjfnOUZTdz6s=
=ALaI
-----END PGP SIGNATURE-----

--NtXBDbbgcQKNI8Ug--


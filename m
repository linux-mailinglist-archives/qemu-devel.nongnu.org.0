Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E5239D3AE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 05:55:20 +0200 (CEST)
Received: from localhost ([::1]:43884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6MB-0004pf-4D
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 23:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hr-0003bn-D5; Sun, 06 Jun 2021 23:50:51 -0400
Received: from ozlabs.org ([203.11.71.1]:60947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hk-0002cR-5J; Sun, 06 Jun 2021 23:50:50 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fyzt221tLz9sWk; Mon,  7 Jun 2021 13:50:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623037834;
 bh=Ry3WmpzD8HZdPu6uItN19d1pEf5ZKRjEjSnextsZrbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FhNcwbYgXY7yKZXuQUmjAc/gkr7+FQT62Dp+UO4MyzCKw3Wpj93Npp/QDwGlJJxRb
 Xux9FFB7dVOvyKq7bkd0KmUCnT+B9e7OBR5GwB9FoWwqYI/R+ZF1vJ1ckZt//imMdl
 1fTB+Bf/9qov486COGsbQoV7BrJvUg9eN9lhVzAc=
Date: Mon, 7 Jun 2021 12:25:00 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 0/2] DEVICE_UNPLUG_ERROR QAPI event
Message-ID: <YL2DfJNFSfB+/2Hi@yekko>
References: <20210604200353.1206897-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TmH0WOESEfoyG3kn"
Content-Disposition: inline
In-Reply-To: <20210604200353.1206897-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TmH0WOESEfoyG3kn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 05:03:51PM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> This is the v2 of a series that started with 2 events,
> DEVICE_UNPLUG_ERROR and DEVICE_NOT_DELETED [1]. After discussions in v1
> we reached the conclussion that the DEVICE_NOT_DELETED wasn't doing much
> of anything. It was an event that was trying to say 'I think something
> happen, but I'm not sure', forcing the QAPI listener to inspect the
> guest itself to see what went wrong, or just wait for some sort of
> internal timeout (as Libvirt will do) and fail the operation regardless.
>=20
> During this period between v1 and this v2 the PowerPC kernel was changed
> to add a reliable error report mechanism in the device_removal path of
> CPUs, which in turn gave QEMU the opportunity to do the same. This made
> the DEVICE_UNPLUG_ERROR more relevant because now we can report CPU and
> DIMM hotunplug errors.
>=20
>=20
> changes from v1:
> - former patches 1 and 2: dropped
> - patch 1 (former 3): changed the version to '6.1'
> - patch 2 (former 4): add a DEVICE_UNPLUG_ERROR event in the device
>   unplug error path of CPUs and DIMMs
>=20
> [1] v1 link:
> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg04682.html

It would be nice to add a patch making x86 also issue the new error
format (as well as the old) on memory hot unplug errors.

>=20
>=20
>=20
> Daniel Henrique Barboza (2):
>   qapi/machine.json: add DEVICE_UNPLUG_ERROR QAPI event
>   spapr: use DEVICE_UNPLUG_ERROR to report unplug errors
>=20
>  hw/ppc/spapr.c     |  2 +-
>  hw/ppc/spapr_drc.c | 15 +++++++++------
>  qapi/machine.json  | 23 +++++++++++++++++++++++
>  3 files changed, 33 insertions(+), 7 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TmH0WOESEfoyG3kn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9g3wACgkQbDjKyiDZ
s5KFtQ/9FPtvwycrSsvykGGwo7dDfFsIsT51H2YItjntjbBGP6OOm3Roz5PXTvFJ
Ztx9CEcp2pMZcvukuyj/lsQg6ch7l2RKYEdNfhuojmau111gqzkYglVDDuxh9/YA
DKpv3WKK9VyEWJisv76/LpUYCw/+fMivTg7OxUipt9J6iXxr0V+EASMRM7no3Jw9
BxlfuEKcT1yHuGZJBBOYt48AHON0id9GO052KoytQOzTwGZM8g9vRV+mkM8x9srj
S8sE5elGTVJ/OOmhdCQg/mbBiATnR32RMZi7JvqOPDUkk0AoytXPEFIu985ZQBHQ
dEkM15ISw/wlMl228ev665ks13OrXYH9qPsb4t1QBc1HY+xQRznK99dOz/eQQ0pf
frOWI7Kx3MagpeXSvVgu/e9NvYUBSxhO8WdoudbfyVGw31rz9j0JPoqcPAvtLYmi
xtKE2nuOYuM0FbnZnWudPW4L0x7hrGHdUMtvY/dCHWWgNhJMlDvLYCvopP+zkT6m
Ma9vcgcdx9EZ17bSNbq+7BOoSMfaCuZa6n2GNIwh4YtjeX5Zp4e2/1ughote574p
/NPFE1oKpLVT63Eh6XgsBM3kzN1kthm+u6lL0Cuf72wGQC6y+5rodr+ZOreGtIAk
HMU2Qz7z3fasZ9gTRB4lXqNqmoO5EEyTHo8FH5WB7xs8/bQHsLI=
=f/1/
-----END PGP SIGNATURE-----

--TmH0WOESEfoyG3kn--


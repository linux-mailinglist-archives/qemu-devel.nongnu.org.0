Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DC034383C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 06:19:34 +0100 (CET)
Received: from localhost ([::1]:36916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOCyT-0000rF-4i
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 01:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOCu3-0004K8-Ts; Mon, 22 Mar 2021 01:15:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36443 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOCu2-0004fp-65; Mon, 22 Mar 2021 01:14:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3jNk3mKCz9sW1; Mon, 22 Mar 2021 16:14:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616390086;
 bh=S4052RCXa/Kle34NuoTcgoDUrOWt0GzEcV3u9QvDHbQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ooVemf7v3WowUjVDPZl5PEFrBWmpBnCjC2DAdt384UvRfp7Kofy8lAojZuLMI9xNW
 jU3Qyx+25L2C2yO+01IFHgf7kZjBPx/Mn4b2IDjW/9Bm4sMfJHAF8HIXbyAOWYml7I
 5cxY/Ue3Z8Aq791BlgSRC6eEaJtYyZwdaFa48SXk=
Date: Mon, 22 Mar 2021 15:34:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] spapr: Assert DIMM unplug state in spapr_memory_unplug()
Message-ID: <YFgeUnA5ZEZ1GWCz@yekko.fritz.box>
References: <161562021166.948373.15092876234470478331.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rrwbh2sb16C5iMxc"
Content-Disposition: inline
In-Reply-To: <161562021166.948373.15092876234470478331.stgit@bahia.lan>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rrwbh2sb16C5iMxc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 13, 2021 at 08:23:31AM +0100, Greg Kurz wrote:
> spapr_memory_unplug() is the last step of the hot unplug sequence.
> It is indirectly called by:
>=20
>  spapr_lmb_release()
>   hotplug_handler_unplug()
>=20
> and spapr_lmb_release() already buys us that DIMM unplug state is
> present : it gets restored with spapr_recover_pending_dimm_state()
> if missing.
>=20
> g_assert() that spapr_pending_dimm_unplugs_find() cannot return NULL
> in spapr_memory_unplug() to make this clear and silence Coverity.
>=20
> Fixes: Coverity CID 1450767
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr.c |    3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index d56418ca2942..73a06df3b1b1 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3660,6 +3660,9 @@ static void spapr_memory_unplug(HotplugHandler *hot=
plug_dev, DeviceState *dev)
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(hotplug_dev);
>      SpaprDimmState *ds =3D spapr_pending_dimm_unplugs_find(spapr, PC_DIM=
M(dev));
> =20
> +    /* We really shouldn't get this far without anything to unplug */
> +    g_assert(ds);
> +
>      pc_dimm_unplug(PC_DIMM(dev), MACHINE(hotplug_dev));
>      qdev_unrealize(dev);
>      spapr_pending_dimm_unplugs_remove(spapr, ds);
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rrwbh2sb16C5iMxc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYHlIACgkQbDjKyiDZ
s5LVuxAA1c8d5V/QHPZSYH+rYxmUXpxPzZJmVKMJkAKj+CVCGShLwL3u5BYlp87M
mgPWgJXJCaojiMLrmDC5HW3TxLqRcM3WSpsI6+iKsAWshDCn9juH+4o5rpuySfyh
Hu0Eis5B6NMuEJ9BJsRgVwOZ2Lk7hoHTvu3mVdZ1hr/QGr7EIqGy+UAfW3YzX+tR
/68PJWRUTGFr4h1HoLrX12YnSdpfXa5dczGFhj5spXgqNcU6GZQlzf1/YX8PtKVm
axO7iZKf9ah9L7sjnZKvROAaHChZkmPm33v3zIxpE22RYAd9U/6oLvPF42SoSDDR
so5sOLNx4OVc0mNfYpK3COSRd+Qh52IUXxXGPjBWZsOgmuHBkuuLN+dZQVpIOAlO
tMDxX3iOWsXJGFEhidMr5dNC8Lhbhd0NCxjsy90rqOgTfGKPDmxSj2zSgu109OR1
e551V0q5whL2baflDQxJPOkqeksSwMr8tKDTjTQ+LrhIcMzMZkvTORtviOnUoVX+
32SPa8VQt9B4U+n+bjnwk+Q41bcZqv7DNOjJCXforEAZKs9TnUQiDELDXa0H9IaU
Y5i9cDou80fJaKa3cknVMBBvHyksWlYwlwrigJf51PJgoS6Hlxu7QRcDUxcovaLe
rQp1scQWacJWzcuf0hTpfDsvOt/29Djo1qlspSktddD46zbPRbU=
=6wZK
-----END PGP SIGNATURE-----

--rrwbh2sb16C5iMxc--


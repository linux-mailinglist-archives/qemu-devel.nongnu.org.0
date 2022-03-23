Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7E04E4AB7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 03:06:15 +0100 (CET)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWqO6-000247-As
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 22:06:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nWqJr-0000Sf-C0; Tue, 22 Mar 2022 22:01:51 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:53225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nWqJo-0006Xj-8H; Tue, 22 Mar 2022 22:01:50 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KNWmz6zWhz4xgw; Wed, 23 Mar 2022 13:01:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1648000899;
 bh=DbKWxU6ixPOElFFLlrY1mkZOKgK0VL+TuFzC/S1T7hU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o5TqRUeGrVMsYOPL3D1JbaHhcT6iJAQseCQMuDIL2T3yoSApH13TykOoovoHnYA2q
 QJBi1bqhPilbbhYQvMWU7Ugh+8i7BesoyrkGJZDJeRIjCIHGGE/9HS+3nNPMtKtmp3
 By3H+dz7lGG/wQVJfIYTvRbP5oGe15whFIWYXqhc=
Date: Wed, 23 Mar 2022 12:48:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-7.1 2/4] hw/ppc: use qdev to register physical DRC
 vmstates
Message-ID: <Yjp8hkhiiVDrUTIa@yekko>
References: <20220322183854.196063-1-danielhb413@gmail.com>
 <20220322183854.196063-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Xeg7QWWlo1pGTAFx"
Content-Disposition: inline
In-Reply-To: <20220322183854.196063-3-danielhb413@gmail.com>
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


--Xeg7QWWlo1pGTAFx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2022 at 03:38:52PM -0300, Daniel Henrique Barboza wrote:
> Similar to logical DRCs, let's convert physical DRCs to register their
> vmstates using dc->vmsd.
>=20
> The same constraints with instance_id being set to spapr_drc_index()
> also applies in this case. However, since realize_physical() calls
> drc_realize(), qdev_set_legacy_instance_id() is already being set.

Ok, and you've verified that you don't need to set the legacy ID on
both "layers"?  That is, have you tested that you can migrate from
before this change to after?

>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr_drc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index a5ef64d2a2..5a60885876 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -640,9 +640,6 @@ static void realize_physical(DeviceState *d, Error **=
errp)
>          return;
>      }
> =20
> -    vmstate_register(VMSTATE_IF(drcp),
> -                     spapr_drc_index(SPAPR_DR_CONNECTOR(drcp)),
> -                     &vmstate_spapr_drc_physical, drcp);
>      qemu_register_reset(drc_physical_reset, drcp);
>  }
> =20
> @@ -651,7 +648,6 @@ static void unrealize_physical(DeviceState *d)
>      SpaprDrcPhysical *drcp =3D SPAPR_DRC_PHYSICAL(d);
> =20
>      drc_unrealize(d);
> -    vmstate_unregister(VMSTATE_IF(drcp), &vmstate_spapr_drc_physical, dr=
cp);
>      qemu_unregister_reset(drc_physical_reset, drcp);
>  }
> =20
> @@ -662,6 +658,8 @@ static void spapr_drc_physical_class_init(ObjectClass=
 *k, void *data)
> =20
>      dk->realize =3D realize_physical;
>      dk->unrealize =3D unrealize_physical;
> +    dk->vmsd =3D &vmstate_spapr_drc_physical;
> +
>      drck->dr_entity_sense =3D physical_entity_sense;
>      drck->isolate =3D drc_isolate_physical;
>      drck->unisolate =3D drc_unisolate_physical;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Xeg7QWWlo1pGTAFx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmI6fG8ACgkQgypY4gEw
YSKeWg/9EH1ZJy03JsbkUccaRxRSwysbxbweIn298x76A7W7chPjZkXjz1tX7dYH
M4ozBKnPIjHFDaaRvU22vMG4hdfZ73W/EBBOkEG5RLbrokVRIIM3AxRhCJy4ZSmK
PC2pd5zR1fGUPZH9Lt+RtWhHluKL5PIB9NItoFCxulps/MOeIDGo/HagC1DsYJ4I
sZIh4qHhsZ6fB3HR+ruSMfyGKSmNKa6GFry+QZArhdZ3OCXqv+ZwgY6HYvkTQyso
ivvnxHZ4UrN8kKbSd10lDSJeXfzpLUdAiUTELJOAkbMftKBGPZrvK7Gb+qAxbcYx
5WEM37EExFgmXNGoKDR3J2bs7abAhxxFGNfRtMUYT79oaspxb6kC6iGQXYRvkPV4
pBK7hr7shtgyagWIMQ6TVJ8YUPcEsiG96B9/INey+p3dPS56ILij5iOS0zLZDnW/
6kLdBTGCv1FdNbqxPyW5/J4r4auIZ2cR+rg3QzNZipkCs2pK+UP9CSNxk7uDXW3O
iVRQ/q8gZfgi6ZT1+3Yc0KmTwNjOulhV5mg6uqmziQstBVm8iQeHNL+yj8ayBYRV
9g7B0ZTDNl2327XufDpNzf7Tkx7mJPQ04DEvB3sAPL1P0HmhA7rS2d6ze2JeZ9jm
6S/cJWn0Tyo+yxUq3TKse6BH75HEtaR1Q5CqQQro9g45oxzPCcI=
=9XAh
-----END PGP SIGNATURE-----

--Xeg7QWWlo1pGTAFx--


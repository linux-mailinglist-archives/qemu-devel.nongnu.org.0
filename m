Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A25432247C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 04:09:34 +0100 (CET)
Received: from localhost ([::1]:44406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEO4q-0007zl-Q3
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 22:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEO36-0006E7-Uf; Mon, 22 Feb 2021 22:07:44 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42529 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEO34-0003DY-66; Mon, 22 Feb 2021 22:07:44 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl3rT11Xpz9sVR; Tue, 23 Feb 2021 14:07:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614049657;
 bh=Hh9S9McQYb8lj6xzEmqMFfmgWS0iR02y9Iix7RleEAY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ffIash84kKEW8juJw6/WeJg6LmqdUR68uB3gxav5ite6n+4ZQoNF7912MgM42Js9j
 mBHrzLSOdONzm+QeO3nU76xxnjk61Eq3aBx4WpQ2C6ymvQHsKgbvcIRR+Hkte+nePR
 ddq7Cab/Pzh2icbDezr1fd1d9bGeMTjt4Hfv7cv0=
Date: Tue, 23 Feb 2021 11:12:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 1/5] spapr_drc.c: use spapr_drc_release() in
 isolate_physical/set_unusable
Message-ID: <YDRIZ7puzPWyTzae@yekko.fritz.box>
References: <20210222194531.62717-1-danielhb413@gmail.com>
 <20210222194531.62717-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="42gaFvhWK5cw7bHi"
Content-Disposition: inline
In-Reply-To: <20210222194531.62717-2-danielhb413@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--42gaFvhWK5cw7bHi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 04:45:27PM -0300, Daniel Henrique Barboza wrote:
> When moving a physical DRC to "Available", drc_isolate_physical() will
> move the DRC state to STATE_PHYSICAL_POWERON and, if the DRC is marked
> for unplug, call spapr_drc_detach(). For physical DRCs,
> drck->empty_state is STATE_PHYSICAL_POWERON, meaning that we're sure
> that spapr_drc_detach() will end up calling spapr_drc_release() in the
> end.
>=20
> Likewise, for logical DRCs, drc_set_unusable will move the DRC to
> "Unusable" state, setting drc->state to STATE_LOGICAL_UNUSABLE, which is
> the drck->empty_state for logical DRCs. spapr_drc_detach() will call
> spapr_drc_release() in this case as well.
>=20
> In both scenarios, spapr_drc_detach() is being used as a
> spapr_drc_release(), wrapper, where we also set unplug_requested (which
> is already true, otherwise spapr_drc_detach() wouldn't be called in the
> first place) and check if drc->state =3D=3D drck->empty_state, which we a=
lso
> know it's guaranteed to be true because we just set it.
>=20
> Just use spapr_drc_release() in these functions to be clear of our
> intentions in both these functions.
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr_drc.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 84bd3c881f..555a25517d 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -50,6 +50,20 @@ uint32_t spapr_drc_index(SpaprDrc *drc)
>          | (drc->id & DRC_INDEX_ID_MASK);
>  }
> =20
> +static void spapr_drc_release(SpaprDrc *drc)
> +{
> +    SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(drc);
> +
> +    drck->release(drc->dev);
> +
> +    drc->unplug_requested =3D false;
> +    g_free(drc->fdt);
> +    drc->fdt =3D NULL;
> +    drc->fdt_start_offset =3D 0;
> +    object_property_del(OBJECT(drc), "device");
> +    drc->dev =3D NULL;
> +}
> +
>  static uint32_t drc_isolate_physical(SpaprDrc *drc)
>  {
>      switch (drc->state) {
> @@ -68,7 +82,7 @@ static uint32_t drc_isolate_physical(SpaprDrc *drc)
>      if (drc->unplug_requested) {
>          uint32_t drc_index =3D spapr_drc_index(drc);
>          trace_spapr_drc_set_isolation_state_finalizing(drc_index);
> -        spapr_drc_detach(drc);
> +        spapr_drc_release(drc);
>      }
> =20
>      return RTAS_OUT_SUCCESS;
> @@ -209,7 +223,7 @@ static uint32_t drc_set_unusable(SpaprDrc *drc)
>      if (drc->unplug_requested) {
>          uint32_t drc_index =3D spapr_drc_index(drc);
>          trace_spapr_drc_set_allocation_state_finalizing(drc_index);
> -        spapr_drc_detach(drc);
> +        spapr_drc_release(drc);
>      }
> =20
>      return RTAS_OUT_SUCCESS;
> @@ -372,20 +386,6 @@ void spapr_drc_attach(SpaprDrc *drc, DeviceState *d)
>                               NULL, 0);
>  }
> =20
> -static void spapr_drc_release(SpaprDrc *drc)
> -{
> -    SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(drc);
> -
> -    drck->release(drc->dev);
> -
> -    drc->unplug_requested =3D false;
> -    g_free(drc->fdt);
> -    drc->fdt =3D NULL;
> -    drc->fdt_start_offset =3D 0;
> -    object_property_del(OBJECT(drc), "device");
> -    drc->dev =3D NULL;
> -}
> -
>  void spapr_drc_detach(SpaprDrc *drc)
>  {
>      SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(drc);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--42gaFvhWK5cw7bHi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0SGUACgkQbDjKyiDZ
s5JoyRAAq+5xPPuhMtwcoMuiCFv84KEi8Emxqb9qAsMoSzIkAl7PKVcPMGE46Nfn
4ypUvqORu+mjiDuuouSb9n1ZvxnQss0dMuF6+8n2qMDTFbRKC4Fz7Os9NohWrVb9
ffwXdxrgeYxo4/D19dbUcCiMwSb8Y+LEzweDGn4rgrVvRX1hoJUnSEj1Iq4kePr5
/z6UbDRmZOHMl2/gAUejnvt2+NZ0A3jGztVPa9x/2R6HHURAXJ1ecxCmCUMHJa52
hk8HVTGvL3dyO0YO1LqGQypRnOfdNEFWjK3VXKWRXtBhnRBq0sh9Ghmk83IMstGl
4MmFjXfMhtMgpEM1cAHKpbXd2xZ5/OFSEnldzcUp1dePdMXon4OixGaoKSg68hMG
zfaqQwAhY1OgSRLoMZRb6NCwVCIAQhrxHP4k0x3CPIJQuwnEKE55oL/stKtgZn0o
F4DQvItvnbsHqsaejgrieNKv5UaXLE25ziYgVW2Epr/EAu6h/lX5ZmKG1JjXAWZl
Sj+1UKS5qc/htkgpI1ZlUiZb5wT0gZSm9+JUiNb+qQ3OZCNFkD8CtATcS6xFuKIe
EOeeCTFCrszMut5DFXNyhUmi4X2qIrUxIy5ePL3R5ewoInVMSJpgWolwLUnPSnGf
KVWxbF3++4iAskk1OMRyNCVd73y7vvETy/4e0ChExOu4BUvZ3+U=
=DIHg
-----END PGP SIGNATURE-----

--42gaFvhWK5cw7bHi--


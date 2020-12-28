Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614792E34C8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:37:51 +0100 (CET)
Received: from localhost ([::1]:60636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktn6E-0008SS-Cz
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmy3-0002IT-Ic; Mon, 28 Dec 2020 02:29:23 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44759 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmy0-0000M5-F9; Mon, 28 Dec 2020 02:29:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D48Lg71hvz9sWj; Mon, 28 Dec 2020 18:29:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609140555;
 bh=ZSdWhKOIprmEZAEyZ9S1wlKIp+9MUW8C23kfh9LcIrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q6MS7VMkgUeOJuUVjYeKUzYogZWVMRFkeaT8DI/0ZLKQwFRDImAokKGvaw+ltlWqu
 n95vJscl+JEmNayxou6isK9/c6I3L3KDdQWYrfdsODVTBU6S0qJ3/EJ5oRL7FK4FF9
 3mErezX3rK2wzIY6yitbWKv9BgqgxRghmty7U13s=
Date: Mon, 28 Dec 2020 18:20:14 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 1/6] spapr: Call spapr_drc_reset() for all DRCs at CAS
Message-ID: <20201228072014.GG6952@yekko.fritz.box>
References: <20201218103400.689660-1-groug@kaod.org>
 <20201218103400.689660-2-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9/eUdp+dLtKXvemk"
Content-Disposition: inline
In-Reply-To: <20201218103400.689660-2-groug@kaod.org>
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9/eUdp+dLtKXvemk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 11:33:55AM +0100, Greg Kurz wrote:
> Non-transient DRCs are either in the empty or the ready state,
> which means spapr_drc_reset() doesn't change their state. It
> is thus not needed to do any checking. Call spapr_drc_reset()
> unconditionally and squash spapr_drc_transient() into its
> only user, spapr_drc_needed().
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-fof-6.0, thanks.

> ---
>  include/hw/ppc/spapr_drc.h | 3 ---
>  hw/ppc/spapr_drc.c         | 8 ++------
>  hw/ppc/spapr_hcall.c       | 7 ++++---
>  3 files changed, 6 insertions(+), 12 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
> index def3593adc8b..cff5e707d0d9 100644
> --- a/include/hw/ppc/spapr_drc.h
> +++ b/include/hw/ppc/spapr_drc.h
> @@ -244,9 +244,6 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner=
, uint32_t drc_type_mask);
>  void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
>  void spapr_drc_detach(SpaprDrc *drc);
> =20
> -/* Returns true if a hot plug/unplug request is pending */
> -bool spapr_drc_transient(SpaprDrc *drc);
> -
>  static inline bool spapr_drc_unplug_requested(SpaprDrc *drc)
>  {
>      return drc->unplug_requested;
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index fc7e321fcdf6..8d62f55066b6 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -462,8 +462,9 @@ static const VMStateDescription vmstate_spapr_drc_unp=
lug_requested =3D {
>      }
>  };
> =20
> -bool spapr_drc_transient(SpaprDrc *drc)
> +static bool spapr_drc_needed(void *opaque)
>  {
> +    SpaprDrc *drc =3D opaque;
>      SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(drc);
> =20
>      /*
> @@ -483,11 +484,6 @@ bool spapr_drc_transient(SpaprDrc *drc)
>          spapr_drc_unplug_requested(drc);
>  }
> =20
> -static bool spapr_drc_needed(void *opaque)
> -{
> -    return spapr_drc_transient(opaque);
> -}
> -
>  static const VMStateDescription vmstate_spapr_drc =3D {
>      .name =3D "spapr_drc",
>      .version_id =3D 1,
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index c0ea0bd5794b..4e9d50c254f0 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1650,9 +1650,10 @@ static void spapr_handle_transient_dev_before_cas(=
SpaprMachineState *spapr)
>                                                            prop->name,
>                                                            &error_abort));
> =20
> -        if (spapr_drc_transient(drc)) {
> -            spapr_drc_reset(drc);
> -        }
> +        /*
> +         * This will complete any pending plug/unplug requests.
> +         */
> +        spapr_drc_reset(drc);
>      }
> =20
>      spapr_clear_pending_hotplug_events(spapr);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9/eUdp+dLtKXvemk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/phy4ACgkQbDjKyiDZ
s5IwDBAAvAGfundB4LwE/eOjuJwT009elxrhKBhrOwIHNe/P5B7ghgG/6NeLuU47
slWlVxwMoYgeddVKbXSoOqkF9LZSFnv7b/h5toepgpWTXrW+uvNMjfCtnAdHQxLt
YZd8kWZHyTq3u03yf/VxVkyf8eUCrOi3T9if16xcdHu0S/lygYcoVw+abKghGS+k
YUoePFeLsd+AzNCooKW3zb3uyo0PrfvqYMGqKddumGCOZvTmfSColVum2CD8FbuH
SZYbtkILK4xh6v+71or2aSYOITP9k4A8/v7TsznNGl5b8Brx8VRYBSrH+7Ux2pQp
ID8PVBA5cKQfH863E8PpcoBoA0GE2xO6G84iXn3Tb1XaOmPjyyTeIYyD+JqdEpT9
bjqB7DZCSve2ANZ1K8oSRkva8Mzf9BDAcpJxZGp9nG/zOQPFkc7PfBj42tpCeqfo
6wpQhMYxDhB9TUhmTwnfdO7EpOSmsTDQI7OYkxNXseJN5+Jl+KBXwCQL0afsoWXr
RGL8FL74mhxEaKgGPq3fMbClpbbS/ZYRRibNklktYLg/eN/RVhYble2+Za5/wcmt
ep2UXPe/D7oR1m2I+6fR7HoaI5qYfJ0GGfqT0UedDAC4x3Zhg3phmqTf3eDey8aP
U11GEOpwdOoLtCFEqab3u4sGx7I6bPiWlXR529gH1Wj9c2wKwng=
=7brj
-----END PGP SIGNATURE-----

--9/eUdp+dLtKXvemk--


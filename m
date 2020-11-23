Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE58F2BFFCE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:11:02 +0100 (CET)
Received: from localhost ([::1]:50136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh541-0002nb-Vj
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52F-0001Ey-C4; Mon, 23 Nov 2020 01:09:11 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:49375 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52C-0006aW-65; Mon, 23 Nov 2020 01:09:11 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfcDG4x8bz9sTc; Mon, 23 Nov 2020 17:09:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606111742;
 bh=/lwv8UPK6fRsQk0sxev78wuFFgGMasYJRcZDXu+N540=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UA5RwikmCpGL3DwgdvevzQe0vOQqG6vOCOzn/u6aU/2LMbZwbXt57TMkKbbjJuZxH
 W18stDDzD3kjy1x3h4G3mz5gHxmbUf4jK+CskJTvwRtDmCovmTJfASZmlukp3NNGU1
 ZhKiTekQXx5/h1JPxnFtWk8S2RkKDLdJUHwTVNBE=
Date: Mon, 23 Nov 2020 16:32:44 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 8/9] spapr: Do TPM proxy hotplug sanity checks at
 pre-plug
Message-ID: <20201123053244.GP521467@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-9-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wqJr86X7F8PBspU2"
Content-Disposition: inline
In-Reply-To: <20201120234208.683521-9-groug@kaod.org>
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wqJr86X7F8PBspU2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2020 at 12:42:07AM +0100, Greg Kurz wrote:
> There can be only one TPM proxy at a time. This is currently
> checked at plug time. But this can be detected at pre-plug in
> order to error out earlier.
>=20
> This allows to get rid of error handling in the plug handler.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index bded059d59c8..5e32d1d396b4 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3957,17 +3957,28 @@ static void spapr_phb_unplug_request(HotplugHandl=
er *hotplug_dev,
>      }
>  }
> =20
> -static void spapr_tpm_proxy_plug(HotplugHandler *hotplug_dev, DeviceStat=
e *dev,
> -                                 Error **errp)
> +static
> +bool spapr_tpm_proxy_pre_plug(HotplugHandler *hotplug_dev, DeviceState *=
dev,
> +                              Error **errp)
>  {
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(OBJECT(hotplug_dev));
> -    SpaprTpmProxy *tpm_proxy =3D SPAPR_TPM_PROXY(dev);
> =20
>      if (spapr->tpm_proxy !=3D NULL) {
>          error_setg(errp, "Only one TPM proxy can be specified for this m=
achine");
> -        return;
> +        return false;
>      }
> =20
> +    return true;
> +}
> +
> +static void spapr_tpm_proxy_plug(HotplugHandler *hotplug_dev, DeviceStat=
e *dev)
> +{
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(OBJECT(hotplug_dev));
> +    SpaprTpmProxy *tpm_proxy =3D SPAPR_TPM_PROXY(dev);
> +
> +    /* Already checked in spapr_tpm_proxy_pre_plug() */
> +    g_assert(spapr->tpm_proxy =3D=3D NULL);
> +
>      spapr->tpm_proxy =3D tpm_proxy;
>  }
> =20
> @@ -3990,7 +4001,7 @@ static void spapr_machine_device_plug(HotplugHandle=
r *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRID=
GE)) {
>          spapr_phb_plug(hotplug_dev, dev);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY)) {
> -        spapr_tpm_proxy_plug(hotplug_dev, dev, errp);
> +        spapr_tpm_proxy_plug(hotplug_dev, dev);
>      }
>  }
> =20
> @@ -4053,6 +4064,8 @@ static void spapr_machine_device_pre_plug(HotplugHa=
ndler *hotplug_dev,
>          spapr_core_pre_plug(hotplug_dev, dev, errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRID=
GE)) {
>          spapr_phb_pre_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY)) {
> +        spapr_tpm_proxy_pre_plug(hotplug_dev, dev, errp);
>      }
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wqJr86X7F8PBspU2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7SXwACgkQbDjKyiDZ
s5KQ7RAAnAksaO606AqV0KIWqEZUVSIB5nxK/EhYWu0hXg+ys9XAXCauJiGi3efi
iA8QZaPmEo2YCiwJOGsFjfUu5CAXJNT8Nab1FFZjQo8uR1yx0dXnV4yDjBFDlvnJ
4zocpimPZNWZDPWP5t4Ty2vy4HNgLO6rspT7jyY90gcuOiB9bxselmIl15JVCba9
jgv0gRG7QvdUeeeJbYoepxRlJH30FnUN8DSOyUSVMNGes9oMkvRL6sCQfnaOPDSG
EYq4r2x4S8xEMNQxfZzb7AgaaP9LmYmCsICcLg6DzwlQE7pD2KGpc2+brDVWuFBP
uTsV5q0FjONOcBPTrR2SkKTv2gsOSC+ao+CX2ukrFSgNJG1ZnX45g9GIweQbqdFw
PgdQuj1Tgr4i0MJm8yfjKhjY3L4sSUWrjJ23hNOCBZS0WXDdrXBYsw3WkaGP9H0m
0j0O+5e57r/QcJOOtIIfwyqCuqQqDnzX6eJEcilzuquG+E7IVhNPA2kkRGlUAuIO
k+hG6FLM4cKgcnPFWMMMCv15CNQQJya2MhsJ4ERhUzLy3YxQK+j8gngd/xTMfwN/
/9FXjajVieGR9Dgj34ufn5ZLsznboSEQ9S5Nz8gsszkKkNIMnTGnTDCnnn2bgQVs
1+SeoGlj/pLDpopD3bYqtnXKt/GgslOfQUvzpJzqKPLO/elb6eI=
=86/B
-----END PGP SIGNATURE-----

--wqJr86X7F8PBspU2--


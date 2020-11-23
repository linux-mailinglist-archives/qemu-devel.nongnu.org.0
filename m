Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA0B2BFFD4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:16:38 +0100 (CET)
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh59Q-00083K-V0
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:16:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52D-0001Ds-Va; Mon, 23 Nov 2020 01:09:09 -0500
Received: from ozlabs.org ([203.11.71.1]:41273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52B-0006aX-4j; Mon, 23 Nov 2020 01:09:09 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfcDG48kpz9sVC; Mon, 23 Nov 2020 17:09:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606111742;
 bh=p0u+TfRbqPR203R/ZU8bMNNRBenkUb+qqD6NBFYIOmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lJit0i3fRuocZUFek6g2kmH6D0KIuIV2NOUES/qB39cDp71zOSXG8RjKIuarS8Qf0
 KS6h+Q+jc08EKGtRwzKpbR+RK6IEWeG+jIX8E7kHoPAURYAOET8JRptLo1/kzaxKcN
 1VqnwHOSlGJhao4lcYwrFW3XLJOssBKvePufSvew=
Date: Mon, 23 Nov 2020 16:26:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 7/9] spapr: Do PHB hoplug sanity check at pre-plug
Message-ID: <20201123052612.GO521467@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-8-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xexMVKTdXPhpRiVT"
Content-Disposition: inline
In-Reply-To: <20201120234208.683521-8-groug@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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


--xexMVKTdXPhpRiVT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2020 at 12:42:06AM +0100, Greg Kurz wrote:
> We currently detect that a PHB index is already in use at plug time.
> But this can be decteted at pre-plug in order to error out earlier.
>=20
> This allows to pass &error_abort to spapr_drc_attach() and to end
> up with a plug handler that doesn't need to report errors anymore.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 81bac59887ab..bded059d59c8 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3872,6 +3872,7 @@ static bool spapr_phb_pre_plug(HotplugHandler *hotp=
lug_dev, DeviceState *dev,
>      SpaprPhbState *sphb =3D SPAPR_PCI_HOST_BRIDGE(dev);
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
>      const unsigned windows_supported =3D spapr_phb_windows_supported(sph=
b);
> +    SpaprDrc *drc;
> =20
>      if (dev->hotplugged && !smc->dr_phb_enabled) {
>          error_setg(errp, "PHB hotplug not supported for this machine");
> @@ -3883,6 +3884,12 @@ static bool spapr_phb_pre_plug(HotplugHandler *hot=
plug_dev, DeviceState *dev,
>          return false;
>      }
> =20
> +    drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_PHB, sphb->index);
> +    if (drc && drc->dev) {
> +        error_setg(errp, "PHB %d already attached", sphb->index);
> +        return false;
> +    }
> +
>      /*
>       * This will check that sphb->index doesn't exceed the maximum numbe=
r of
>       * PHBs for the current machine type.
> @@ -3896,8 +3903,7 @@ static bool spapr_phb_pre_plug(HotplugHandler *hotp=
lug_dev, DeviceState *dev,
>                             errp);
>  }
> =20
> -static void spapr_phb_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> -                           Error **errp)
> +static void spapr_phb_plug(HotplugHandler *hotplug_dev, DeviceState *dev)
>  {
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(OBJECT(hotplug_dev));
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
> @@ -3913,9 +3919,8 @@ static void spapr_phb_plug(HotplugHandler *hotplug_=
dev, DeviceState *dev,
>      /* hotplug hooks should check it's enabled before getting this far */
>      assert(drc);
> =20
> -    if (!spapr_drc_attach(drc, dev, errp)) {
> -        return;
> -    }
> +    /* spapr_phb_pre_plug() already checked the DRC is attachable */
> +    spapr_drc_attach(drc, dev, &error_abort);
> =20
>      if (hotplugged) {
>          spapr_hotplug_req_add_by_index(drc);
> @@ -3983,7 +3988,7 @@ static void spapr_machine_device_plug(HotplugHandle=
r *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
>          spapr_core_plug(hotplug_dev, dev);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRID=
GE)) {
> -        spapr_phb_plug(hotplug_dev, dev, errp);
> +        spapr_phb_plug(hotplug_dev, dev);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY)) {
>          spapr_tpm_proxy_plug(hotplug_dev, dev, errp);
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xexMVKTdXPhpRiVT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7R/IACgkQbDjKyiDZ
s5LNUBAA28eamJLh9CRGPb/7bbSAcpPoiTjrqd8kDFwu54BSh6S02n8KGDvMkbOC
38JcNwQIO6zx3KqJOUGYV4kaJSphbO1DrN4IdTP3sBZ11cVkI3mLFaDepVP1MxMv
MKPSLUl7Ouim7cy7w/JEsuFfuHXvywhEHl9d0uaw5VBee520om1mdTj+xIMwhnm6
R/rhR/JOHVdKFf8HeQDb/3vk8na7AZtFtZWIwxjdQy3fJOolRmjwIJZDVwtOzw+Q
Gq/ktPFcpYToIjBhDmgUH//VOyostYEVUXHTdHNHw36C+4ypukTERXfqW0qC0F6M
iIq0oxbn9Yybce1Ua6mThCzkws2dmUE9vNNoKfEUAPyh1cj0337ggsh/kJc7dUaw
zel47ctUgW7uJlWK+H7myppLhlGrx4i5t8VZZZP/bACyBCtFc8ETvzRYaB8O5LHf
TcUk+OO4ZYO8DRnLjo62798S4p6SYLgnm8krHaPp+f8eT5If3mMkPSwQnD5keFjR
56Z/AEn2cDsCeptSoRp16rWlDbTB1tKvnVdy+fn18I3tc/p9kxonEpBnHhY7VrGb
l6e8kCy8sANZOmYZtCZCksTC1YU8wb5AA1EfIcMzmAYqIROwhRTl0zuZIQM81mer
SSLjS/ssNwfHkbiy5yTAQlG/3f21PzVD3lOKbE1rf+YXeGaoS4E=
=TgtW
-----END PGP SIGNATURE-----

--xexMVKTdXPhpRiVT--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEA62BFFD8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:18:43 +0100 (CET)
Received: from localhost ([::1]:40556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh5BS-00025p-CB
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52F-0001F3-FD; Mon, 23 Nov 2020 01:09:11 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50835 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52C-0006aS-1Q; Mon, 23 Nov 2020 01:09:11 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfcDG2cjlz9sTv; Mon, 23 Nov 2020 17:09:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606111742;
 bh=jKZir+SWPd9HA67nSvi0oyOXV06oPSfpw+xB3KIg1Ag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fwtPmAyJlTmcjnZx2/H8geDlIF1biq38g2O22laWmK6Un+xlXKlxIPErCY1zcowOw
 g/Y6+Y+5jnIycabso1OQjpEQjiHzfqIftRdbHnGr/Yoion9xDwihscghhlJbbkeOjr
 uC0xAA9mIhAdG04eBWZg2KOlWQ+/Pp+w4jogpaAc=
Date: Mon, 23 Nov 2020 16:13:18 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 5/9] spapr: Simplify error path of
 spapr_core_plug()
Message-ID: <20201123051318.GM521467@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-6-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RNRUMt0ZF5Yaq/Aq"
Content-Disposition: inline
In-Reply-To: <20201120234208.683521-6-groug@kaod.org>
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


--RNRUMt0ZF5Yaq/Aq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2020 at 12:42:04AM +0100, Greg Kurz wrote:
> spapr_core_pre_plug() already guarantees that the slot for the given core
> ID is available. It is thus safe to assume that spapr_find_cpu_slot()
> returns a slot during plug. Turn the error path into an assertion.
> It is also safe to assume that no device is attached to the corresponding
> DRC and that spapr_drc_attach() shouldn't fail.
>=20
> Pass &error_abort to spapr_drc_attach() and simplify error handling.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index da7586f548df..cfca033c7b14 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3739,8 +3739,7 @@ int spapr_core_dt_populate(SpaprDrc *drc, SpaprMach=
ineState *spapr,
>      return 0;
>  }
> =20
> -static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *de=
v,
> -                            Error **errp)
> +static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *de=
v)
>  {
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(OBJECT(hotplug_dev));
>      MachineClass *mc =3D MACHINE_GET_CLASS(spapr);
> @@ -3755,20 +3754,20 @@ static void spapr_core_plug(HotplugHandler *hotpl=
ug_dev, DeviceState *dev,
>      int i;
> =20
>      core_slot =3D spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id,=
 &index);
> -    if (!core_slot) {
> -        error_setg(errp, "Unable to find CPU core with core-id: %d",
> -                   cc->core_id);
> -        return;
> -    }
> +    g_assert(core_slot); /* Already checked in spapr_core_pre_plug() */
> +
>      drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_CPU,
>                            spapr_vcpu_id(spapr, cc->core_id));
> =20
>      g_assert(drc || !mc->has_hotpluggable_cpus);
> =20
>      if (drc) {
> -        if (!spapr_drc_attach(drc, dev, errp)) {
> -            return;
> -        }
> +        /*
> +         * spapr_core_pre_plug() already buys us this is a brand new
> +         * core being plugged into a free slot. Nothing should already
> +         * be attached to the corresponding DRC.
> +         */
> +        spapr_drc_attach(drc, dev, &error_abort);
> =20
>          if (hotplugged) {
>              /*
> @@ -3981,7 +3980,7 @@ static void spapr_machine_device_plug(HotplugHandle=
r *hotplug_dev,
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          spapr_memory_plug(hotplug_dev, dev);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
> -        spapr_core_plug(hotplug_dev, dev, errp);
> +        spapr_core_plug(hotplug_dev, dev);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRID=
GE)) {
>          spapr_phb_plug(hotplug_dev, dev, errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY)) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RNRUMt0ZF5Yaq/Aq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7RO4ACgkQbDjKyiDZ
s5L1DA/9HIdbgMCyQHoO6kx2gjJmEBC9KMr2orbo9aXktQnstEAaZboNS/cSdHPP
xVOQ45g4v4ty1kWidrwRqHo2cBG2FxYSjerp+4++B6PHwAxfPNBYmP0PcVEHnEjP
jkZHHb98wMG0/OK6dzBOz17TI0Y0gvp2TUf9rk/zSXdq8N/xi6cqdHzb2m4mUXv0
3DfYnk8ghcVNWAKjWRWpvBA5RU20B6g/pz0+ZEGt0f5Fw0PSjNSZp0HdEI9o9+c2
qd8nSeRgOsXAp0tPahqsKHVymww1cv3M6iuG8lqiHaQ26wr4/RZnF+Mi4Wk/gIDC
JRF3ZZTuX9SCrJENskiBGXtvYD3XlHsViKNEGX62N/9cwNtDVwhmgsoTh5uMydzq
o9wcjQktIz2SCC8BhL/PxW8nvsE+iq+ov8Chj0KWbb6ep5qV1QZ3z5dlLCdjGCNp
qnVLvYqQUWFLNpvb7QQ5KBl9FE2nVDyviXSJQgyNHjyqzmqp6Bp86TrLQLfGl4i6
NDuag3YvZC7zHLMm/El5dW2TwGoTsDVLS3nXVHTGm51tezw4/0BNPoEx53l/AK9/
x/tYGddQE83e+qTRI3YaA0qNFQJWZnxz5z4s39lTk1IIBo9OC6Lt3k1GDx4+tKjD
A+K3MiLJjRk8m7SKmk9ZHYxNcmaSHMpE9IrDDY+zfpAReq5R69s=
=XMTK
-----END PGP SIGNATURE-----

--RNRUMt0ZF5Yaq/Aq--


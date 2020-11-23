Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359342BFF51
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 06:11:05 +0100 (CET)
Received: from localhost ([::1]:52436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh480-0005h8-8X
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 00:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh45p-0004GT-In; Mon, 23 Nov 2020 00:08:49 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58977 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh45m-0000kl-LU; Mon, 23 Nov 2020 00:08:49 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfZtd2m7Fz9sTc; Mon, 23 Nov 2020 16:08:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606108121;
 bh=L74jznmxAJEmslmS1Tgye//dKhyx6pjSWvTAACz6NCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ckNkTpjapmGppDkbrsuh7DH4bBygrxhOxob5Ox2IIYE7XYdWxjRguv9jkRDIZWIbq
 qfo7aDNQuRtf8AzirR0//8XKXvPuvXuiIIEc13QRphVZMBk/GxeSeYqI71ILeGeDha
 BRa7DO5kYFcUJsPsdNpAA78SqDCw8QN4rPzPpctY=
Date: Mon, 23 Nov 2020 15:50:41 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 1/9] spapr: Do PCI device hotplug sanity checks
 at pre-plug only
Message-ID: <20201123045041.GI521467@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-2-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="svExV93C05KqedWb"
Content-Disposition: inline
In-Reply-To: <20201120234208.683521-2-groug@kaod.org>
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


--svExV93C05KqedWb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2020 at 12:42:00AM +0100, Greg Kurz wrote:
> The PHB acts as the hotplug handler for PCI devices. It does some
> sanity checks on DR enablement, PCI bridge chassis numbers and
> multifunction. These checks are currently performed at plug time,
> but they would best sit in a pre-plug handler in order to error
> out as early as possible.
>=20
> Create a spapr_pci_pre_plug() handler and move all the checking
> there. Add a check that the associated DRC doesn't already have
> an attached device. This is equivalent to the slot availability
> check performed by do_pci_register_device() upon realization of
> the PCI device.
>=20
> This allows to pass &error_abort to spapr_drc_attach() and to end
> up with a plug handler that doesn't need to report errors anymore.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr_pci.c | 43 +++++++++++++++++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 88ce87f130a5..2829f298d9c1 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1532,8 +1532,8 @@ static bool bridge_has_valid_chassis_nr(Object *bri=
dge, Error **errp)
>      return true;
>  }
> =20
> -static void spapr_pci_plug(HotplugHandler *plug_handler,
> -                           DeviceState *plugged_dev, Error **errp)
> +static void spapr_pci_pre_plug(HotplugHandler *plug_handler,
> +                               DeviceState *plugged_dev, Error **errp)
>  {
>      SpaprPhbState *phb =3D SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
>      PCIDevice *pdev =3D PCI_DEVICE(plugged_dev);
> @@ -1542,9 +1542,6 @@ static void spapr_pci_plug(HotplugHandler *plug_han=
dler,
>      PCIBus *bus =3D PCI_BUS(qdev_get_parent_bus(DEVICE(pdev)));
>      uint32_t slotnr =3D PCI_SLOT(pdev->devfn);
> =20
> -    /* if DR is disabled we don't need to do anything in the case of
> -     * hotplug or coldplug callbacks
> -     */
>      if (!phb->dr_enabled) {
>          /* if this is a hotplug operation initiated by the user
>           * we need to let them know it's not enabled
> @@ -1552,17 +1549,14 @@ static void spapr_pci_plug(HotplugHandler *plug_h=
andler,
>          if (plugged_dev->hotplugged) {
>              error_setg(errp, QERR_BUS_NO_HOTPLUG,
>                         object_get_typename(OBJECT(phb)));
> +            return;
>          }
> -        return;
>      }
> =20
> -    g_assert(drc);
> -
>      if (pc->is_bridge) {
>          if (!bridge_has_valid_chassis_nr(OBJECT(plugged_dev), errp)) {
>              return;
>          }
> -        spapr_pci_bridge_plug(phb, PCI_BRIDGE(plugged_dev));
>      }
> =20
>      /* Following the QEMU convention used for PCIe multifunction
> @@ -1574,13 +1568,41 @@ static void spapr_pci_plug(HotplugHandler *plug_h=
andler,
>          error_setg(errp, "PCI: slot %d function 0 already occupied by %s=
,"
>                     " additional functions can no longer be exposed to gu=
est.",
>                     slotnr, bus->devices[PCI_DEVFN(slotnr, 0)]->name);
> +    }
> +
> +    if (drc && drc->dev) {
> +        error_setg(errp, "PCI: slot %d already occupied by %s", slotnr,
> +                   pci_get_function_0(PCI_DEVICE(drc->dev))->name);
>          return;
>      }
> +}
> +
> +static void spapr_pci_plug(HotplugHandler *plug_handler,
> +                           DeviceState *plugged_dev, Error **errp)
> +{
> +    SpaprPhbState *phb =3D SPAPR_PCI_HOST_BRIDGE(DEVICE(plug_handler));
> +    PCIDevice *pdev =3D PCI_DEVICE(plugged_dev);
> +    PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(plugged_dev);
> +    SpaprDrc *drc =3D drc_from_dev(phb, pdev);
> +    uint32_t slotnr =3D PCI_SLOT(pdev->devfn);
> =20
> -    if (!spapr_drc_attach(drc, DEVICE(pdev), errp)) {
> +    /*
> +     * If DR is disabled we don't need to do anything in the case of
> +     * hotplug or coldplug callbacks.
> +     */
> +    if (!phb->dr_enabled) {
>          return;
>      }
> =20
> +    g_assert(drc);
> +
> +    if (pc->is_bridge) {
> +        spapr_pci_bridge_plug(phb, PCI_BRIDGE(plugged_dev));
> +    }
> +
> +    /* spapr_pci_pre_plug() already checked the DRC is attachable */
> +    spapr_drc_attach(drc, DEVICE(pdev), &error_abort);
> +
>      /* If this is function 0, signal hotplug for all the device function=
s.
>       * Otherwise defer sending the hotplug event.
>       */
> @@ -2223,6 +2245,7 @@ static void spapr_phb_class_init(ObjectClass *klass=
, void *data)
>      /* Supported by TYPE_SPAPR_MACHINE */
>      dc->user_creatable =3D true;
>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +    hp->pre_plug =3D spapr_pci_pre_plug;
>      hp->plug =3D spapr_pci_plug;
>      hp->unplug =3D spapr_pci_unplug;
>      hp->unplug_request =3D spapr_pci_unplug_request;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--svExV93C05KqedWb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7P6EACgkQbDjKyiDZ
s5Lc5w/9GkYp7ixcrF05Pyq5OOB2QKitDSi76ILCWvdbTC4fIoR1KZLmM4jd3Y0W
dbtX/d6FIABeXTOUgnciYrK7zEvAVzwiR+RptAq4oAhexhqmN0bgFujVqro9en61
KdrkmArcgPGtxuJBcMPaJnKeKRb+VtF+kf6wzDbIL1DzV3eKKFu+ewOTGC6yAuqL
PkqV+4dInH2dqDX5am9Y540M5FZ14jG+0doXVApjEbQuOXNgabNld/rx04j3aUTf
S8rGwe8qhyUGhWrjVxh6zL3klB46Xuf/EMPDODycD+8E29lR7NEMWPepXHENqVac
9L2IWBH1rrumfjjsiZ6LHQ7hMxJaymC/owDLcPcd5MnII3mgW1qQFrCz61e0TD+a
BbAJDOVPoRxbBJ76CauciXOA/tskdLc1wkvGgAOBTKv4kL5gSZa8jCp2CTydO1li
SFMdkMnwO+6EOtYkp8ywAQ9G/ZdtfpW2qOEqfLLQ4MPAL6K0lzqbhNNzn/PDKnM/
8mbRms9DrZIoCnvP+OfIvbfgc/R5tyOlQNG5Ky9fVRbYvHbfhUDPuFY+lMBfbLN1
rdRo6TF8TQP4CNFQ4afGrF0HBqC4xXg/R446F3/kMce7GY6cJ70QfbdLUg5qt3Y2
Cxu6GtwWOb6lRN5rykTBU1dkcHBh0TLAslKhh+1pLFwM2+/woKM=
=FQhM
-----END PGP SIGNATURE-----

--svExV93C05KqedWb--


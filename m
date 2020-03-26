Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBAF194E3C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 02:00:11 +0100 (CET)
Received: from localhost ([::1]:35806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHdM2-0003EA-3x
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 21:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jHdKp-00025M-Sa
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 20:58:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jHdKn-00014j-Kz
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 20:58:55 -0400
Received: from ozlabs.org ([203.11.71.1]:50829)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jHdKm-0000sG-C8; Thu, 26 Mar 2020 20:58:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48pNlQ3k20z9sSN; Fri, 27 Mar 2020 11:58:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1585270722;
 bh=tzshjypVzDjCLD9i/1xTjh+uGpqj64mtbpy8n7CmkeM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KxgFxvA2cIM+joHLJuMQBHJI7u5JzzTnKE9Jl3OADJYmIfow2hUuCF7aKGs/PcZ9H
 xvWZx3wyEj7HHO1hxRlwEotDmlu1iZ5xO6IzsGlnWJezQu3aPSsvsFdW7LsONd8qVJ
 NuRaEMtqQcgs7ZLq2i1bcccG57F9Z1CdBsFzWD5c=
Date: Fri, 27 Mar 2020 10:54:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC for-5.1 3/4] spapr: Fix failure path for attempting to hot
 unplug PCI bridges
Message-ID: <20200326235423.GB456060@umbus.fritz.box>
References: <20200326054009.454477-1-david@gibson.dropbear.id.au>
 <20200326054009.454477-4-david@gibson.dropbear.id.au>
 <20200326131824.4601ae68@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline
In-Reply-To: <20200326131824.4601ae68@bahia.lan>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, clg@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2020 at 01:18:24PM +0100, Greg Kurz wrote:
> On Thu, 26 Mar 2020 16:40:08 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > For various technical reasons we can't currently allow unplug a PCI to =
PCI
> > bridge on the pseries machine.  spapr_pci_unplug_request() correctly
> > generates an error message if that's attempted.
> >=20
> > But.. if the given errp is not error_abort or error_fatal,
>=20
> Which is the always case when trying to unplug a device AFAICT:
>=20
> void qdev_unplug(DeviceState *dev, Error **errp)
> {
>     DeviceClass *dc =3D DEVICE_GET_CLASS(dev);
>     HotplugHandler *hotplug_ctrl;
>     HotplugHandlerClass *hdc;
>     Error *local_err =3D NULL;
>=20
>     [...]
>     hdc =3D HOTPLUG_HANDLER_GET_CLASS(hotplug_ctrl);
>     if (hdc->unplug_request) {
>         hotplug_handler_unplug_request(hotplug_ctrl, dev, &local_err);
>=20
> And anyway, spapr_pci_unplug_request() shouldn't rely on the caller
> passing &error_fatal or &error_abort to do the right thing. Calling
> error_setg() without returning right away is a dangerous practice
> since it would cause a subsequent call to error_setg() with the
> same errp to abort QEMU.
>=20
> > it doesn't actually stop trying to unplug the bridge anyway.
> >=20
>=20
> This looks like a bug fix that could go to 5.0 IMHO.

Fair point.  I've added the tag and moved to ppc-for-5.0.

>=20
> Maybe add this tag ?
>=20
>    Fixes: 14e714900f6b "spapr: Allow hot plug/unplug of PCI bridges and d=
evices under PCI bridges"
>=20
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
>=20
> >  hw/ppc/spapr_pci.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> > index 709a52780d..55ca9dee1e 100644
> > --- a/hw/ppc/spapr_pci.c
> > +++ b/hw/ppc/spapr_pci.c
> > @@ -1663,6 +1663,7 @@ static void spapr_pci_unplug_request(HotplugHandl=
er *plug_handler,
> > =20
> >          if (pc->is_bridge) {
> >              error_setg(errp, "PCI: Hot unplug of PCI bridges not suppo=
rted");
> > +            return;
> >          }
> > =20
> >          /* ensure any other present functions are pending unplug */
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl59QK0ACgkQbDjKyiDZ
s5JYxxAA2fHmzHoj+zLPygEYbzGFwjgJEpZ8OYNrTDbh6pmhafMsmZuGY63Myb0M
rR3cEiKslhNpK8XPEhIZLcFP78/BUgQE0yoETW61LpmCmC5mO7MMBn+CiyuvrRvr
85TwBfEnSHwwpy7CahwtlzcDTnar1oohUZ1opUXAlTUYS/n/ghjAscUmIG8Yix5d
3MEx7JJiRNrMLw922kCdbpUSCfpQhMje7YbIDjPg0jQJ22RVEy6bKSJNorf/dP9z
eJLvqEOuZksCGxHBgn9U1bOiLJ7+GI8Oory3m6ymd+5Tlj/oI4bh+6ss3DfDqjnq
7hwTb14XIDxozYvHGsIBOVdocfIUaErLSzoskUeWC7W1xOoD626chC8xPTMeXqge
0lutdle+uxbxvjH8hKhUN3lz9f9kDLkSSTJlwpy6UhjSt4T4z4Mu7WsxthLviAIA
ptJEOIrMI88G44ZCeNuZeUG4P6by/AOoixi6KQMjAlqQ6Zx7e9GYblD03tYIhR7h
4W3uWn6mgpgb4srf9NXyyZxJMK2gfypLlOuD3BOMzzC1Fa72bQh/9wIeoArT59+x
fTEhWlvIE7ASq0A83s8tK2QozGkthdADmSwU701tM7vgqf85ZaIwLaO4lUwjuIAR
XDLYSiw+AdkSXqTPPJqnIQrqR3k2gmxOM5dpwL9z56w/cG7uFyg=
=dppx
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--


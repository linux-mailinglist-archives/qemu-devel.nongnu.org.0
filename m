Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ED12C36D1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 03:42:05 +0100 (CET)
Received: from localhost ([::1]:47890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khkkt-0005B4-Tf
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 21:42:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1khkjQ-0004Ed-85; Tue, 24 Nov 2020 21:40:32 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37185 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1khkjN-0004h3-Po; Tue, 24 Nov 2020 21:40:31 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CglVb6MZGz9sSs; Wed, 25 Nov 2020 13:40:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606272023;
 bh=Jnet97omEC3NeUP5zzuz6y+C0v4dTJ+GN47UAcf0ZTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oKoJmeBoLD+dSSxMkcPyI5O7nC3MysTxxUl2zuLDDubigScxvrrC7v24/yGUxJR0/
 995Jk2kbGt0QImON5NcyXWdf5qoear9q1O9JrdFHFG1XZZN7l8unazVG6EQzs3YgTN
 6QHaNL32claRSGTB150zs9LAtTyTqKulvE+kDAH8=
Date: Wed, 25 Nov 2020 13:40:17 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 5/9] spapr: Simplify error path of
 spapr_core_plug()
Message-ID: <20201125024017.GF521467@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-6-groug@kaod.org>
 <20201123051318.GM521467@yekko.fritz.box>
 <20201124140727.18124eeb@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ViWwB84N1zFtNiVD"
Content-Disposition: inline
In-Reply-To: <20201124140727.18124eeb@bahia.lan>
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


--ViWwB84N1zFtNiVD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 02:07:27PM +0100, Greg Kurz wrote:
> On Mon, 23 Nov 2020 16:13:18 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Sat, Nov 21, 2020 at 12:42:04AM +0100, Greg Kurz wrote:
> > > spapr_core_pre_plug() already guarantees that the slot for the given =
core
> > > ID is available. It is thus safe to assume that spapr_find_cpu_slot()
> > > returns a slot during plug. Turn the error path into an assertion.
> > > It is also safe to assume that no device is attached to the correspon=
ding
> > > DRC and that spapr_drc_attach() shouldn't fail.
> > >=20
> > > Pass &error_abort to spapr_drc_attach() and simplify error handling.
> > >=20
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> >=20
> > Applied to ppc-for-6.0, thanks.
> >=20
>=20
> This patch depends on the previous one.
>=20
> > > ---
> > >  hw/ppc/spapr.c | 21 ++++++++++-----------
> > >  1 file changed, 10 insertions(+), 11 deletions(-)
> > >=20
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index da7586f548df..cfca033c7b14 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -3739,8 +3739,7 @@ int spapr_core_dt_populate(SpaprDrc *drc, Spapr=
MachineState *spapr,
> > >      return 0;
> > >  }
> > > =20
> > > -static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState=
 *dev,
> > > -                            Error **errp)
>=20
> ../../hw/ppc/spapr.c: In function =E2=80=98spapr_core_plug=E2=80=99:
> ../../hw/ppc/spapr.c:3802:32: error: =E2=80=98errp=E2=80=99 undeclared (f=
irst use in this function); did you mean =E2=80=98errno=E2=80=99?
>                                 errp) < 0) {
>                                 ^~~~
>                                 errno
> ../../hw/ppc/spapr.c:3802:32: note: each undeclared identifier is reporte=
d only once for each function it appears in
>=20
> Please either drop it from ppc-for-6.0 or possibly adapt spapr_core_plug()
> to handle errors from ppc_set_compat().

Dropped for now (along with a later patch that depended on this one).

>=20
> <my 2 cents>
> Since I can't see how this could fail for a hotplugged CPU if it
> succeeded for the boot CPU, I'd pass &error_abort despite this
> being a hotplug path.
> </my 2 cents>
>=20
> > > +static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState=
 *dev)
> > >  {
> > >      SpaprMachineState *spapr =3D SPAPR_MACHINE(OBJECT(hotplug_dev));
> > >      MachineClass *mc =3D MACHINE_GET_CLASS(spapr);
> > > @@ -3755,20 +3754,20 @@ static void spapr_core_plug(HotplugHandler *h=
otplug_dev, DeviceState *dev,
> > >      int i;
> > > =20
> > >      core_slot =3D spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core=
_id, &index);
> > > -    if (!core_slot) {
> > > -        error_setg(errp, "Unable to find CPU core with core-id: %d",
> > > -                   cc->core_id);
> > > -        return;
> > > -    }
> > > +    g_assert(core_slot); /* Already checked in spapr_core_pre_plug()=
 */
> > > +
> > >      drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_CPU,
> > >                            spapr_vcpu_id(spapr, cc->core_id));
> > > =20
> > >      g_assert(drc || !mc->has_hotpluggable_cpus);
> > > =20
> > >      if (drc) {
> > > -        if (!spapr_drc_attach(drc, dev, errp)) {
> > > -            return;
> > > -        }
> > > +        /*
> > > +         * spapr_core_pre_plug() already buys us this is a brand new
> > > +         * core being plugged into a free slot. Nothing should alrea=
dy
> > > +         * be attached to the corresponding DRC.
> > > +         */
> > > +        spapr_drc_attach(drc, dev, &error_abort);
> > > =20
> > >          if (hotplugged) {
> > >              /*
> > > @@ -3981,7 +3980,7 @@ static void spapr_machine_device_plug(HotplugHa=
ndler *hotplug_dev,
> > >      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > >          spapr_memory_plug(hotplug_dev, dev);
> > >      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)=
) {
> > > -        spapr_core_plug(hotplug_dev, dev, errp);
> > > +        spapr_core_plug(hotplug_dev, dev);
> > >      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_=
BRIDGE)) {
> > >          spapr_phb_plug(hotplug_dev, dev, errp);
> > >      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY=
)) {
> >=20
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ViWwB84N1zFtNiVD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+9xBEACgkQbDjKyiDZ
s5IIhA//edaMmhLm0XIfUjpyVxGCxj68yJmCJLOX6iJ/lCYVULEpPRdD6HzttjhR
Ri8hGdbH3gxVWNoJxxdaZgCbSu3AyZDH2VeMZ7LW/3yL6r9q419kdHp0y4JhK9Ah
2E/HZmOTWE9WIAPFUjJtBd039PJ4zhznQb2boVNactCcpdT24BkemrTNdKQrIGH4
hMcJ31p35ZSiJZWEDYoVkMXuBRfANigLcDwXGXzx0mTdETYi+4enJXse+leQNksn
TZlx/yfx0wKvvmADOUl0/FM2PlxUfF0Uq/4+NXj2e3ZFzaIbfHRcYvvKnYb0JpQ3
WXxac5IA7NHBMnCRMzEajMu1rw/u03TfsQQxfT2MMsihWaUufeSo+rEeNLmsGL1y
ADHq1lDX+g1pV/wk26g4tBgxalCCDZhJi166Inn8mXBB5Rj6/+peDHsQaLD8fP02
q7BmQ64ZZlApkxbrbd2kkpSWy8OZHb5mlGKxNPH3ZaDWbCDXMXJQXOTTYqNeG4v2
2hO6wVdh1x+jI3d29BhW66NLsPfPHEZ3iicuUzQZryoVTyI/T/WbbL6Pm7qrxOyW
mDb8Yu7jksRfH+Xly5KIeFAAjGkJKfVJ90Q3N6H01/jf2LY1vfCKdMtYBiLGZ9l0
yJJixX/xT6lMvj5gjLaIw/9EEWscYLpA8sRqIEMrkCiSWPYUMto=
=Hkr5
-----END PGP SIGNATURE-----

--ViWwB84N1zFtNiVD--


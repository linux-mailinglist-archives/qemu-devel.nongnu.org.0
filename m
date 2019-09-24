Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7E1BC9D5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 16:09:51 +0200 (CEST)
Received: from localhost ([::1]:46110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iClVm-0003dU-0w
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 10:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iCkda-0001xZ-RW
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:13:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iCkdY-0003cW-R2
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:13:50 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:44701 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iCkdX-0003an-P3; Tue, 24 Sep 2019 09:13:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46d1pv1ByMz9sPK; Tue, 24 Sep 2019 23:13:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569330823;
 bh=ruerrMY24cOqES2eh2z1RqOGlvHEfWvx6TnF4SsSE4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d8MZfa4F82k6f9ny6Z3ZL/AdikdZwLagdYh3nyB2fDu0eua44wVMthXw5V9DZNFgD
 7PnW9ZlOmr/d+sQv48yyBmhoDDt9292hcDsBoXHVeJJXVDkRGSPGQVaMW+CzgVFGrp
 E0ErCINL3g2UXswXkX2XUsh5Ve0Kxl331uxCzLYw=
Date: Tue, 24 Sep 2019 21:40:24 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/4] xics: Merge reset and realize hooks
Message-ID: <20190924114024.GB17405@umbus>
References: <20190924045952.11412-1-david@gibson.dropbear.id.au>
 <20190924045952.11412-3-david@gibson.dropbear.id.au>
 <f15b4277-9382-a795-05d4-29c32afaea9b@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <f15b4277-9382-a795-05d4-29c32afaea9b@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: gkurz@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2019 at 11:44:01AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi David,
>=20
> On 9/24/19 6:59 AM, David Gibson wrote:
> > Currently TYPE_XICS_BASE and TYPE_XICS_SIMPLE have their own reset and
> > realize methods, using the standard technique for having the subtype
> > call the supertype's methods before doing its own thing.
> >=20
> > But TYPE_XICS_SIMPLE is the only subtype of TYPE_XICS_BASE ever
> > instantiated, so there's no point having the split here.  Merge them
> > together into just ics_reset() and ics_realize() functions.
> >=20
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  hw/intc/xics.c        | 97 ++++++++++++++++---------------------------
> >  include/hw/ppc/xics.h |  3 --
> >  2 files changed, 35 insertions(+), 65 deletions(-)
> >=20
> > diff --git a/hw/intc/xics.c b/hw/intc/xics.c
> > index 93139b0189..db0e532bd9 100644
> > --- a/hw/intc/xics.c
> > +++ b/hw/intc/xics.c
> > @@ -548,68 +548,13 @@ static void ics_eoi(ICSState *ics, uint32_t nr)
> >      }
> >  }
> > =20
> > -static void ics_simple_reset(DeviceState *dev)
> > -{
> > -    ICSStateClass *icsc =3D ICS_BASE_GET_CLASS(dev);
> > -
> > -    icsc->parent_reset(dev);
> > -
> > -    if (kvm_irqchip_in_kernel()) {
> > -        Error *local_err =3D NULL;
> > -
> > -        ics_set_kvm_state(ICS_BASE(dev), &local_err);
> > -        if (local_err) {
> > -            error_report_err(local_err);
> > -        }
> > -    }
> > -}
> > -
> > -static void ics_simple_reset_handler(void *dev)
> > -{
> > -    ics_simple_reset(dev);
> > -}
> > -
> > -static void ics_simple_realize(DeviceState *dev, Error **errp)
> > -{
> > -    ICSState *ics =3D ICS_SIMPLE(dev);
> > -    ICSStateClass *icsc =3D ICS_BASE_GET_CLASS(ics);
> > -    Error *local_err =3D NULL;
> > -
> > -    icsc->parent_realize(dev, &local_err);
> > -    if (local_err) {
> > -        error_propagate(errp, local_err);
> > -        return;
> > -    }
> > -
> > -    qemu_register_reset(ics_simple_reset_handler, ics);
> > -}
> > -
> > -static void ics_simple_class_init(ObjectClass *klass, void *data)
> > -{
> > -    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > -    ICSStateClass *isc =3D ICS_BASE_CLASS(klass);
> > -
> > -    device_class_set_parent_realize(dc, ics_simple_realize,
> > -                                    &isc->parent_realize);
> > -    device_class_set_parent_reset(dc, ics_simple_reset,
> > -                                  &isc->parent_reset);
> > -}
> > -
> > -static const TypeInfo ics_simple_info =3D {
> > -    .name =3D TYPE_ICS_SIMPLE,
> > -    .parent =3D TYPE_ICS_BASE,
> > -    .instance_size =3D sizeof(ICSState),
> > -    .class_init =3D ics_simple_class_init,
> > -    .class_size =3D sizeof(ICSStateClass),
> > -};
> > -
> >  static void ics_reset_irq(ICSIRQState *irq)
> >  {
> >      irq->priority =3D 0xff;
> >      irq->saved_priority =3D 0xff;
> >  }
> > =20
> > -static void ics_base_reset(DeviceState *dev)
> > +static void ics_reset(DeviceState *dev)
> >  {
> >      ICSState *ics =3D ICS_BASE(dev);
> >      int i;
> > @@ -625,17 +570,31 @@ static void ics_base_reset(DeviceState *dev)
> >          ics_reset_irq(ics->irqs + i);
> >          ics->irqs[i].flags =3D flags[i];
> >      }
2> > +
> > +    if (kvm_irqchip_in_kernel()) {
> > +        Error *local_err =3D NULL;
> > +
> > +        ics_set_kvm_state(ICS_BASE(dev), &local_err);
> > +        if (local_err) {
> > +            error_report_err(local_err);
> > +        }
> > +    }
> > +}
> > +
> > +static void ics_reset_handler(void *dev)
> > +{
> > +    ics_reset(dev);
> >  }
> > =20
> > -static void ics_base_realize(DeviceState *dev, Error **errp)
> > +static void ics_realize(DeviceState *dev, Error **errp)
> >  {
> >      ICSState *ics =3D ICS_BASE(dev);
> > +    Error *local_err =3D NULL;
>=20
> Nit: This variable renaming is confusing, maybe another patch?

Turns out this is basically gone in rework I've done since then anyway.

> >      Object *obj;
> > -    Error *err =3D NULL;
> > =20
> > -    obj =3D object_property_get_link(OBJECT(dev), ICS_PROP_XICS, &err);
> > +    obj =3D object_property_get_link(OBJECT(dev), ICS_PROP_XICS, &loca=
l_err);
> >      if (!obj) {
> > -        error_propagate_prepend(errp, err,
> > +        error_propagate_prepend(errp, local_err,
> >                                  "required link '" ICS_PROP_XICS
> >                                  "' not found: ");
> >          return;
> > @@ -647,8 +606,22 @@ static void ics_base_realize(DeviceState *dev, Err=
or **errp)
> >          return;
> >      }
> >      ics->irqs =3D g_malloc0(ics->nr_irqs * sizeof(ICSIRQState));
> > +
> > +    qemu_register_reset(ics_reset_handler, ics);
>=20
> Can you change this call by ...
>=20
> > +}
> > +
> > +static void ics_simple_class_init(ObjectClass *klass, void *data)
> > +{
>=20
> ... this?
>=20
>     DeviceClass *dc =3D DEVICE_CLASS(klass);
>=20
>     dc->reset =3D ics_reset;
>=20
> >  }
> > =20
> > +static const TypeInfo ics_simple_info =3D {
> > +    .name =3D TYPE_ICS_SIMPLE,
> > +    .parent =3D TYPE_ICS_BASE,
>=20
> But now reading here, why keep TYPE_ICS_BASE?
> It seems you can simplify further using directly:

As you noticed, this happens later in the series.

>=20
>        .parent =3D TYPE_DEVICE,
>=20
> > +    .instance_size =3D sizeof(ICSState),
> > +    .class_init =3D ics_simple_class_init,
> > +    .class_size =3D sizeof(ICSStateClass),
> > +};
> > +
> >  static void ics_base_instance_init(Object *obj)
> >  {
> >      ICSState *ics =3D ICS_BASE(obj);
> > @@ -725,9 +698,9 @@ static void ics_base_class_init(ObjectClass *klass,=
 void *data)
> >  {
> >      DeviceClass *dc =3D DEVICE_CLASS(klass);
> > =20
> > -    dc->realize =3D ics_base_realize;
> > +    dc->realize =3D ics_realize;
> >      dc->props =3D ics_base_properties;
> > -    dc->reset =3D ics_base_reset;
> > +    dc->reset =3D ics_reset;
> >      dc->vmsd =3D &vmstate_ics_base;
> >  }
> > =20
> > diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
> > index 34d7985b7c..0eb39c2561 100644
> > --- a/include/hw/ppc/xics.h
> > +++ b/include/hw/ppc/xics.h
> > @@ -103,9 +103,6 @@ struct PnvICPState {
> > =20
> >  struct ICSStateClass {
> >      DeviceClass parent_class;
> > -
> > -    DeviceRealize parent_realize;
> > -    DeviceReset parent_reset;
> >  };
> > =20
> >  struct ICSState {
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl2KAKgACgkQbDjKyiDZ
s5I9xg/9FUG1gyDqI1Vewa2XndTFkiMCWSBFStHgRrAyLanfiRXT39eTRXmTZBYE
C1LUptBWxvjRcY1aFVmSPqqbs4Ufmqky4ApYD4/QJ7fvxk5zg4G+mquueel6btKZ
El2KvPDchHvOeOerEqlP6p4sEOG8+FTAcmy3u1HYoACbxXivRMaD2SpkwAFfb6WQ
jU+VXsrB8pwFTJweQ0gFF9F4VlaFojAnDts9c8hSno17J9GTfKjdzE8iBRZe7koe
12xVvq5MS4jQhqd62Vzesr0ggwgBXY+gCV56IL4kz4iXACjpMwsmMUNgM5qp6GOH
I30WKbeTYLVsfCeOxUIszahORWF36eoyYVKjA6CbavkEzbh0NlOnQjyIRFM135PA
+M/ztMKhaNydLV+Czf/ZJb/c92msXXYtralGbsckYgnggEkuRXtLBanAiqdyhX2F
dSeQYXmBjlNZnhqsxpYRR74EyXfScQ2aKIew4g8h8ELkdJr8S4FBtBcftDE5mEFn
4VCoijWmRdRhuJFeljN4/ZhM6dTTDczFyjYFK01j81rCNRyrmqZQkL9+gHgFkxSL
efiBgmDPccCY8s2fsQZ6n8LunWfKKQ3iHscjpvWA1Rm8vklgF03CXYDRHeZIq/bQ
TSN2EoEF4NEgwMwxDwv7Tqj5FLeEK8E8HgXBHpM/tU56RFZtQGg=
=gBA/
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--


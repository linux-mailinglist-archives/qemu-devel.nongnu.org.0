Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79117BEAC5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 04:56:39 +0200 (CEST)
Received: from localhost ([::1]:59034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDJxL-0002XU-8e
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 22:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34048)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iDJwD-0001TA-9v
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 22:55:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iDJwB-0002BT-Ns
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 22:55:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50613 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iDJw7-0001zR-9A; Wed, 25 Sep 2019 22:55:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46f00G2FPGz9sPY; Thu, 26 Sep 2019 12:55:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569466510;
 bh=hTCr8Hu+UVvv7YckbPEG8inSgGjirhvo6au2X6P0Gjc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FigdbG3F8nUWWs6+pDn5w1OrxxfsrVrkV/cTnxxZz5OtJ9KuVlt/e3dTNyZgo+j2D
 Ro9BDs27KrBN0qwPLOmocXPGPDvCM/yE+fNKxuZ6E8ymH/xbthgOdi3GOcexKgdioR
 S7JCT8uDl3CcysFE2XFqHN2K23QxljGnfnKZ/QJU=
Date: Thu, 26 Sep 2019 12:54:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 04/20] xics: Eliminate reset hook
Message-ID: <20190926025455.GW17405@umbus>
References: <20190925064534.19155-1-david@gibson.dropbear.id.au>
 <20190925064534.19155-5-david@gibson.dropbear.id.au>
 <20190925095952.09852a8b@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eV9cGEf2bJwTs/8b"
Content-Disposition: inline
In-Reply-To: <20190925095952.09852a8b@bahia.lan>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 clg@kaod.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--eV9cGEf2bJwTs/8b
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2019 at 09:59:52AM +0200, Greg Kurz wrote:
> On Wed, 25 Sep 2019 16:45:18 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > Currently TYPE_XICS_BASE and TYPE_XICS_SIMPLE have their own reset meth=
ods,
> > using the standard technique for having the subtype call the supertype's
> > methods before doing its own thing.
> >=20
> > But TYPE_XICS_SIMPLE is the only subtype of TYPE_XICS_BASE ever
> > instantiated, so there's no point having the split here.  Merge them
> > together into just an ics_reset() function.
> >=20
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  hw/intc/xics.c        | 57 ++++++++++++++++++-------------------------
> >  include/hw/ppc/xics.h |  1 -
> >  2 files changed, 24 insertions(+), 34 deletions(-)
> >=20
> > diff --git a/hw/intc/xics.c b/hw/intc/xics.c
> > index 310dc72b46..82e6f09259 100644
> > --- a/hw/intc/xics.c
> > +++ b/hw/intc/xics.c
> > @@ -547,11 +547,28 @@ static void ics_eoi(ICSState *ics, uint32_t nr)
> >      }
> >  }
> > =20
> > -static void ics_simple_reset(DeviceState *dev)
> > +static void ics_reset_irq(ICSIRQState *irq)
> >  {
> > -    ICSStateClass *icsc =3D ICS_BASE_GET_CLASS(dev);
> > +    irq->priority =3D 0xff;
> > +    irq->saved_priority =3D 0xff;
> > +}
> > =20
> > -    icsc->parent_reset(dev);
> > +static void ics_reset(DeviceState *dev)
> > +{
> > +    ICSState *ics =3D ICS_BASE(dev);
> > +    int i;
> > +    uint8_t flags[ics->nr_irqs];
> > +
> > +    for (i =3D 0; i < ics->nr_irqs; i++) {
> > +        flags[i] =3D ics->irqs[i].flags;
> > +    }
> > +
> > +    memset(ics->irqs, 0, sizeof(ICSIRQState) * ics->nr_irqs);
> > +
> > +    for (i =3D 0; i < ics->nr_irqs; i++) {
> > +        ics_reset_irq(ics->irqs + i);
> > +        ics->irqs[i].flags =3D flags[i];
> > +    }
> > =20
> >      if (kvm_irqchip_in_kernel()) {
> >          Error *local_err =3D NULL;
> > @@ -563,9 +580,9 @@ static void ics_simple_reset(DeviceState *dev)
> >      }
> >  }
> > =20
> > -static void ics_simple_reset_handler(void *dev)
> > +static void ics_reset_handler(void *dev)
> >  {
> > -    ics_simple_reset(dev);
> > +    ics_reset(dev);
> >  }
> > =20
> >  static void ics_simple_realize(DeviceState *dev, Error **errp)
> > @@ -580,7 +597,7 @@ static void ics_simple_realize(DeviceState *dev, Er=
ror **errp)
> >          return;
> >      }
> > =20
> > -    qemu_register_reset(ics_simple_reset_handler, ics);
> > +    qemu_register_reset(ics_reset_handler, ics);
>=20
> As suggested by Philippe, this could be the opportunity to add
> a comment that explain why we rely on qemu_register_reset()
> rather than dc->reset.

I don't thinmk it's really in scope for this patch, since it was there
just as bare before.  I'm considering it for another patch, but I'm
still thinking about exactly what I want to do with the reset.

>=20
> >  }
> > =20
> >  static void ics_simple_class_init(ObjectClass *klass, void *data)
> > @@ -590,8 +607,6 @@ static void ics_simple_class_init(ObjectClass *klas=
s, void *data)
> > =20
> >      device_class_set_parent_realize(dc, ics_simple_realize,
> >                                      &isc->parent_realize);
> > -    device_class_set_parent_reset(dc, ics_simple_reset,
> > -                                  &isc->parent_reset);
> >  }
> > =20
> >  static const TypeInfo ics_simple_info =3D {
> > @@ -602,30 +617,6 @@ static const TypeInfo ics_simple_info =3D {
> >      .class_size =3D sizeof(ICSStateClass),
> >  };
> > =20
> > -static void ics_reset_irq(ICSIRQState *irq)
> > -{
> > -    irq->priority =3D 0xff;
> > -    irq->saved_priority =3D 0xff;
> > -}
> > -
> > -static void ics_base_reset(DeviceState *dev)
> > -{
> > -    ICSState *ics =3D ICS_BASE(dev);
> > -    int i;
> > -    uint8_t flags[ics->nr_irqs];
> > -
> > -    for (i =3D 0; i < ics->nr_irqs; i++) {
> > -        flags[i] =3D ics->irqs[i].flags;
> > -    }
> > -
> > -    memset(ics->irqs, 0, sizeof(ICSIRQState) * ics->nr_irqs);
> > -
> > -    for (i =3D 0; i < ics->nr_irqs; i++) {
> > -        ics_reset_irq(ics->irqs + i);
> > -        ics->irqs[i].flags =3D flags[i];
> > -    }
> > -}
> > -
> >  static void ics_base_realize(DeviceState *dev, Error **errp)
> >  {
> >      ICSState *ics =3D ICS_BASE(dev);
> > @@ -726,7 +717,7 @@ static void ics_base_class_init(ObjectClass *klass,=
 void *data)
> > =20
> >      dc->realize =3D ics_base_realize;
> >      dc->props =3D ics_base_properties;
> > -    dc->reset =3D ics_base_reset;
> > +    dc->reset =3D ics_reset;
>=20
> I hadn't spotted it previously but since you're removing the call to
> device_class_set_parent_reset(), we don't need dc->reset anymore.

Hrm, I'd prefer to leave it in there, even though it's not strictly
necessary - this way calling device_reset() on the ICS will do what
you'd expect

>=20
> This basically reverts:
>=20
> commit eeefd43b3cf342d1696128462a16e092995ff1b5
> Author: C=E9dric Le Goater <clg@kaod.org>
> Date:   Mon Jun 25 11:17:16 2018 +0200
>=20
>     ppx/xics: introduce a parent_reset in ICSStateClass
>    =20
>     Just like for the realize handlers, this makes possible to move the
>     common ICSState code of the reset handlers in the ics-base class.
>    =20
>     Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
>     Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>=20
> With dc->reset removed,
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
>=20
> >      dc->vmsd =3D &vmstate_ics_base;
> >  }
> > =20
> > diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
> > index e72fb67968..18fcd2b11c 100644
> > --- a/include/hw/ppc/xics.h
> > +++ b/include/hw/ppc/xics.h
> > @@ -105,7 +105,6 @@ struct ICSStateClass {
> >      DeviceClass parent_class;
> > =20
> >      DeviceRealize parent_realize;
> > -    DeviceReset parent_reset;
> >  };
> > =20
> >  struct ICSState {
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eV9cGEf2bJwTs/8b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl2MKHgACgkQbDjKyiDZ
s5LuzhAAnVKHIpRAi0/2wueMz8CgqQKuGSbJI4hfuNyCzTjwLVgwNCqD1H3ZSilZ
kI8T4vHfHO6VbVidWLVfmG7GZ7G5R+jXRiKz6Fn1LSETE+NYiAbVoHXWiPfb5Xkf
AjMuYMyV09sPVp6f68AdOdFcxYg7Qpk5HJr6in6aQkeF8OWTKv3e7VWLTfJZEu1k
7O5fhXHZT7myrtLiVpRZnCnqHebADDyBrz+C4Bh6nT/c937s//rPfov37hsjKHK3
R4sl89codFHGIoOdvuwWdeP59e4bOa/RrIlD61P1AGX0BvQ/EylZ/iIes1GX7u5+
OAM9NZMdJ5gdU7EeyViSoBhfyWwftxbgbZSI/smT7C4qRpYfoDRSk6GZ7MkGGC2u
CMu62BU5uiYrPWU4GWZe11YwvNSqoQr3FnHFAYR/excu9UUsS49l2eP3IVyXvgYm
+CbptENOaNDfK0B5TFfBKGMpx1R6r4wIRARKINpRsW2DzAHEKMOkvRqPNRjWvXSZ
6joHVruEwNfk2Ovo2kTdKNu2RbTpqFZ6itrdsevD4pGEMB2TI9YccffrBlWx80D+
Ti8g6CgXKghuVdvyI1w1LoRDz6uwYOZ6YAyiEmBXMGy5mSACJCMibkOVMHeTHWqJ
T6LRaDK4fBbtaQIjlcA4XCI7yOHE1YWJUkaHOAs3BINq3fVTA1M=
=rq2h
-----END PGP SIGNATURE-----

--eV9cGEf2bJwTs/8b--


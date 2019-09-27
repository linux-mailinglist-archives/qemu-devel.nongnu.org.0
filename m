Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F7CBFFF1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 09:21:47 +0200 (CEST)
Received: from localhost ([::1]:47476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDkZV-0007Ia-QZ
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 03:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35228)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iDkY9-0006BF-GL
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 03:20:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iDkY6-0001kr-HR
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 03:20:21 -0400
Received: from 17.mo6.mail-out.ovh.net ([46.105.36.150]:41067)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iDkY3-0001ce-4k
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 03:20:16 -0400
Received: from player793.ha.ovh.net (unknown [10.109.159.248])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id E191A1E2056
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 09:20:07 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player793.ha.ovh.net (Postfix) with ESMTPSA id 75D89A5C59AE;
 Fri, 27 Sep 2019 07:19:57 +0000 (UTC)
Date: Fri, 27 Sep 2019 09:19:56 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 04/33] xics: Eliminate reset hook
Message-ID: <20190927091956.6c16486e@bahia.lan>
In-Reply-To: <20190927055028.11493-5-david@gibson.dropbear.id.au>
References: <20190927055028.11493-1-david@gibson.dropbear.id.au>
 <20190927055028.11493-5-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 13269574830499535334
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfeehgdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.36.150
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
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Sep 2019 15:49:59 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> Currently TYPE_XICS_BASE and TYPE_XICS_SIMPLE have their own reset method=
s,
> using the standard technique for having the subtype call the supertype's
> methods before doing its own thing.
>=20
> But TYPE_XICS_SIMPLE is the only subtype of TYPE_XICS_BASE ever
> instantiated, so there's no point having the split here.  Merge them
> together into just an ics_reset() function.
>=20
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/intc/xics.c        | 57 ++++++++++++++++++-------------------------
>  include/hw/ppc/xics.h |  1 -
>  2 files changed, 24 insertions(+), 34 deletions(-)
>=20
> diff --git a/hw/intc/xics.c b/hw/intc/xics.c
> index 310dc72b46..82e6f09259 100644
> --- a/hw/intc/xics.c
> +++ b/hw/intc/xics.c
> @@ -547,11 +547,28 @@ static void ics_eoi(ICSState *ics, uint32_t nr)
>      }
>  }
> =20
> -static void ics_simple_reset(DeviceState *dev)
> +static void ics_reset_irq(ICSIRQState *irq)
>  {
> -    ICSStateClass *icsc =3D ICS_BASE_GET_CLASS(dev);
> +    irq->priority =3D 0xff;
> +    irq->saved_priority =3D 0xff;
> +}
> =20
> -    icsc->parent_reset(dev);
> +static void ics_reset(DeviceState *dev)
> +{
> +    ICSState *ics =3D ICS_BASE(dev);
> +    int i;
> +    uint8_t flags[ics->nr_irqs];
> +
> +    for (i =3D 0; i < ics->nr_irqs; i++) {
> +        flags[i] =3D ics->irqs[i].flags;
> +    }
> +
> +    memset(ics->irqs, 0, sizeof(ICSIRQState) * ics->nr_irqs);
> +
> +    for (i =3D 0; i < ics->nr_irqs; i++) {
> +        ics_reset_irq(ics->irqs + i);
> +        ics->irqs[i].flags =3D flags[i];
> +    }
> =20
>      if (kvm_irqchip_in_kernel()) {
>          Error *local_err =3D NULL;
> @@ -563,9 +580,9 @@ static void ics_simple_reset(DeviceState *dev)
>      }
>  }
> =20
> -static void ics_simple_reset_handler(void *dev)
> +static void ics_reset_handler(void *dev)
>  {
> -    ics_simple_reset(dev);
> +    ics_reset(dev);
>  }
> =20
>  static void ics_simple_realize(DeviceState *dev, Error **errp)
> @@ -580,7 +597,7 @@ static void ics_simple_realize(DeviceState *dev, Erro=
r **errp)
>          return;
>      }
> =20
> -    qemu_register_reset(ics_simple_reset_handler, ics);
> +    qemu_register_reset(ics_reset_handler, ics);
>  }
> =20
>  static void ics_simple_class_init(ObjectClass *klass, void *data)
> @@ -590,8 +607,6 @@ static void ics_simple_class_init(ObjectClass *klass,=
 void *data)
> =20
>      device_class_set_parent_realize(dc, ics_simple_realize,
>                                      &isc->parent_realize);
> -    device_class_set_parent_reset(dc, ics_simple_reset,
> -                                  &isc->parent_reset);
>  }
> =20
>  static const TypeInfo ics_simple_info =3D {
> @@ -602,30 +617,6 @@ static const TypeInfo ics_simple_info =3D {
>      .class_size =3D sizeof(ICSStateClass),
>  };
> =20
> -static void ics_reset_irq(ICSIRQState *irq)
> -{
> -    irq->priority =3D 0xff;
> -    irq->saved_priority =3D 0xff;
> -}
> -
> -static void ics_base_reset(DeviceState *dev)
> -{
> -    ICSState *ics =3D ICS_BASE(dev);
> -    int i;
> -    uint8_t flags[ics->nr_irqs];
> -
> -    for (i =3D 0; i < ics->nr_irqs; i++) {
> -        flags[i] =3D ics->irqs[i].flags;
> -    }
> -
> -    memset(ics->irqs, 0, sizeof(ICSIRQState) * ics->nr_irqs);
> -
> -    for (i =3D 0; i < ics->nr_irqs; i++) {
> -        ics_reset_irq(ics->irqs + i);
> -        ics->irqs[i].flags =3D flags[i];
> -    }
> -}
> -
>  static void ics_base_realize(DeviceState *dev, Error **errp)
>  {
>      ICSState *ics =3D ICS_BASE(dev);
> @@ -726,7 +717,7 @@ static void ics_base_class_init(ObjectClass *klass, v=
oid *data)
> =20
>      dc->realize =3D ics_base_realize;
>      dc->props =3D ics_base_properties;
> -    dc->reset =3D ics_base_reset;
> +    dc->reset =3D ics_reset;
>      dc->vmsd =3D &vmstate_ics_base;
>  }
> =20
> diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
> index 8874bad328..7efd49c02c 100644
> --- a/include/hw/ppc/xics.h
> +++ b/include/hw/ppc/xics.h
> @@ -105,7 +105,6 @@ struct ICSStateClass {
>      DeviceClass parent_class;
> =20
>      DeviceRealize parent_realize;
> -    DeviceReset parent_reset;
>  };
> =20
>  struct ICSState {



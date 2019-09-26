Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256F9BEA1B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 03:31:25 +0200 (CEST)
Received: from localhost ([::1]:58790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDIcq-00028h-Qh
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 21:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41038)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iDIaO-0000te-EW
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 21:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iDIaL-0003Rx-9C
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 21:28:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44209 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iDIaK-0003H3-A9; Wed, 25 Sep 2019 21:28:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46dy4P6Mggz9sPY; Thu, 26 Sep 2019 11:28:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569461317;
 bh=MZsHKUB+q7ag39nzpZmT1yb5AbiHrAMhziFOxE8gg7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S4+HInUd1dEy3EPGLUwgbu4S7NGcjh5/SEW9ZamVyb50tbpCvaEvxYK9LLYqOB99F
 0lous0VFQOTmAXSxLXJCJCs8t+OR8GqtwxTwoUptzmNkOdUsWQqTc/SjLLOo7gerFD
 BNZOC8IcWa4HMAfH4hzBSmME1MZo+4Z1r6iELEzE=
Date: Thu, 26 Sep 2019 11:05:45 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 18/20] xive: Improve irq claim/free path
Message-ID: <20190926010545.GR17405@umbus>
References: <20190925064534.19155-1-david@gibson.dropbear.id.au>
 <20190925064534.19155-19-david@gibson.dropbear.id.au>
 <3cdde622-4ca0-5edd-6bf7-ceb03895f1f2@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RyOXVFQXzAE23HDB"
Content-Disposition: inline
In-Reply-To: <3cdde622-4ca0-5edd-6bf7-ceb03895f1f2@kaod.org>
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
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RyOXVFQXzAE23HDB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2019 at 09:25:47AM +0200, C=E9dric Le Goater wrote:
> On 25/09/2019 08:45, David Gibson wrote:
> > spapr_xive_irq_claim() returns a bool to indicate if it succeeded.  But
> > most of the callers and one callee use a richer Error * instead.  So use
> > that instead of a bool return so we can actually pass more informative
> > errors up the stack.
> >=20
> > In addition it didn't actually check if the irq was already claimed, wh=
ich
> > is one of the primary purposes of the claim path, so do that.
> >=20
> > spapr_xive_irq_free() also returned a bool... which no callers checked,=
 so
> > just drop it.
> >=20
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  hw/intc/spapr_xive.c        | 17 ++++++++++-------
> >  hw/ppc/spapr_irq.c          | 12 ++++++++----
> >  include/hw/ppc/spapr_xive.h |  5 +++--
> >  3 files changed, 21 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> > index 47b5ec0b56..5a56a58299 100644
> > --- a/hw/intc/spapr_xive.c
> > +++ b/hw/intc/spapr_xive.c
> > @@ -528,12 +528,18 @@ static void spapr_xive_register_types(void)
> > =20
> >  type_init(spapr_xive_register_types)
> > =20
> > -bool spapr_xive_irq_claim(SpaprXive *xive, uint32_t lisn, bool lsi)
> > +void spapr_xive_irq_claim(SpaprXive *xive, uint32_t lisn, bool lsi,
> > +                          Error **errp)
> >  {
> >      XiveSource *xsrc =3D &xive->source;
> > =20
> >      assert(lisn < xive->nr_irqs);
> > =20
> > +    if (be64_to_cpu(xive->eat[lisn].w) & EAS_VALID) {
>=20
> please use xive_eas_is_valid()

Oops, missed that that existed.  Fixed.

> with that change,
>=20
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

Oops, missed

>=20
>=20
> C.=20
>=20
> > +        error_setg(errp, "IRQ %d is not free", lisn);
> > +        return;
> > +    }
> > +
> >      /*
> >       * Set default values when allocating an IRQ number
> >       */
> > @@ -547,20 +553,17 @@ bool spapr_xive_irq_claim(SpaprXive *xive, uint32=
_t lisn, bool lsi)
> > =20
> >          kvmppc_xive_source_reset_one(xsrc, lisn, &local_err);
> >          if (local_err) {
> > -            error_report_err(local_err);
> > -            return false;
> > +            error_propagate(errp, local_err);
> > +            return;
> >          }
> >      }
> > -
> > -    return true;
> >  }
> > =20
> > -bool spapr_xive_irq_free(SpaprXive *xive, uint32_t lisn)
> > +void spapr_xive_irq_free(SpaprXive *xive, uint32_t lisn)
> >  {
> >      assert(lisn < xive->nr_irqs);
> > =20
> >      xive->eat[lisn].w &=3D cpu_to_be64(~EAS_VALID);
> > -    return true;
> >  }
> > =20
> >  /*
> > diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> > index 2673a90604..f53544e45e 100644
> > --- a/hw/ppc/spapr_irq.c
> > +++ b/hw/ppc/spapr_irq.c
> > @@ -245,7 +245,13 @@ static void spapr_irq_init_xive(SpaprMachineState =
*spapr, Error **errp)
> > =20
> >      /* Enable the CPU IPIs */
> >      for (i =3D 0; i < nr_servers; ++i) {
> > -        spapr_xive_irq_claim(spapr->xive, SPAPR_IRQ_IPI + i, false);
> > +        Error *local_err =3D NULL;
> > +
> > +        spapr_xive_irq_claim(spapr->xive, SPAPR_IRQ_IPI + i, false, &l=
ocal_err);
> > +        if (local_err) {
> > +            error_propagate(errp, local_err);
> > +            return;
> > +        }
> >      }
> > =20
> >      spapr_xive_hcall_init(spapr);
> > @@ -254,9 +260,7 @@ static void spapr_irq_init_xive(SpaprMachineState *=
spapr, Error **errp)
> >  static void spapr_irq_claim_xive(SpaprMachineState *spapr, int irq, bo=
ol lsi,
> >                                   Error **errp)
> >  {
> > -    if (!spapr_xive_irq_claim(spapr->xive, irq, lsi)) {
> > -        error_setg(errp, "IRQ %d is invalid", irq);
> > -    }
> > +    spapr_xive_irq_claim(spapr->xive, irq, lsi, errp);
> >  }
> > =20
> >  static void spapr_irq_free_xive(SpaprMachineState *spapr, int irq)
> > diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> > index bfd40f01d8..69df3793e1 100644
> > --- a/include/hw/ppc/spapr_xive.h
> > +++ b/include/hw/ppc/spapr_xive.h
> > @@ -54,8 +54,9 @@ typedef struct SpaprXive {
> >   */
> >  #define SPAPR_XIVE_BLOCK_ID 0x0
> > =20
> > -bool spapr_xive_irq_claim(SpaprXive *xive, uint32_t lisn, bool lsi);
> > -bool spapr_xive_irq_free(SpaprXive *xive, uint32_t lisn);
> > +void spapr_xive_irq_claim(SpaprXive *xive, uint32_t lisn, bool lsi,
> > +                          Error **errp);
> > +void spapr_xive_irq_free(SpaprXive *xive, uint32_t lisn);
> >  void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon);
> >  int spapr_xive_post_load(SpaprXive *xive, int version_id);
> > =20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RyOXVFQXzAE23HDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl2MDugACgkQbDjKyiDZ
s5JEfQ//dMhlCD25y5TMjt5pDftgtIs/VN7KX7FEpQqx36nJcicbD/V2BymmV+96
XYQA36SHt3n2HZFVCfJUUr6mMjGGV5MevePLfkHPXBP/c2+Wum288bCm18nnELF7
BLJdx+SQZjms6hHlRvvTSMhrXjbMgJvlQpFUC3HNCTTGXiFIP9ZjtfIeD/HWtOlg
JZA2ZiNHrxdoN9Q0jyxJqNm4d1NUhsCY2Oagb0HbTSmTdxgY9KtsA69u113SN/6Z
oRjAYDTJ4RF9CM4qrCeDCAi2dggIdBPsIA6AYLSeVzfqxlhcmas2vfYc9ziNSXe7
feXJdUsCqMIeoDVJJXTe1bpDcB3Sta07gctme6VoGvnLF0A/7ruH9zSog6SfgwbO
c2zis7a28+C1IJSDAqo/c+zgmG2nK9WnUU9MvK6DjrAYh7EgmP7r3iRdQIxpElTc
g0VTtftxFOXKhEQ4l6cz23e0gXnAetA7NTF+LwsrPxwBVt35DmXWQQpbq5jD6lMw
Nq/WWYpOcN45UvYDV4mu0cBfMsszPoqcbXm+67VRB9OTmvJvTmhbEy5m0aFyUBqd
Is1pexE9nUD0zwLxek6QJS83VWoh2SyA0syMzgAh6obbF8eDfcDyVsJwfVY5MuCa
eIOEmSIxUGHS+qoT7jJagcSFGT9ffg9Ll+Tnm6eJz9uo/m4mqME=
=F8/m
-----END PGP SIGNATURE-----

--RyOXVFQXzAE23HDB--


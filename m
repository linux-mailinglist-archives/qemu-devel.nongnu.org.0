Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247C83081A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 07:35:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWaCC-0003gS-0g
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 01:35:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hWaB5-0003Jt-G2
	for qemu-devel@nongnu.org; Fri, 31 May 2019 01:34:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hWaB4-0004tM-AY
	for qemu-devel@nongnu.org; Fri, 31 May 2019 01:34:07 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52101 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hWaB2-0004Di-5n; Fri, 31 May 2019 01:34:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 45FY5f2hnTz9sBr; Fri, 31 May 2019 15:33:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1559280822;
	bh=xhaOB8GAPTLkt/CIDz4a/2E3j5mnNEBneu0+OoHfUew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvwAcvkYtD+wBZasL5320nqk9c9wg34JE7y7bU6YmdgoWdJZ9QxWO8bitqDRlUeW1
	IqQph2ZO8wNF2Qg30fyb/VweU1OhsgeZM7So2yx5hE/ngpETGN78ve3TC5gMIPd01A
	k0eBl8B+lrLkJfXblbadTnCr6wrqfuuqzQnvv6AU=
Date: Fri, 31 May 2019 15:07:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Message-ID: <20190531050756.GH2017@umbus.fritz.box>
References: <20190530094027.169cf54b@bahia.lab.toulouse-stg.fr.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pMCBjikF2xGw87uL"
Content-Disposition: inline
In-Reply-To: <20190530094027.169cf54b@bahia.lab.toulouse-stg.fr.ibm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PATCH] spapr_pci: Improve error message
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pMCBjikF2xGw87uL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2019 at 09:40:27AM +0200, Greg Kurz wrote:
> On Thu, 30 May 2019 10:40:49 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, May 29, 2019 at 07:15:09PM +0200, Greg Kurz wrote:
> > > Every PHB must have a unique index. This is checked at realize but wh=
en
> > > a duplicate index is detected, an error message mentioning BUIDs is
> > > printed. This doesn't help much, especially since BUID is an internal
> > > concept that is no longer exposed to the user.
> > >=20
> > > Fix the message to mention the index property instead of BUID. As a b=
onus
> > > print a list of indexes already in use.
> > >=20
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > ---
> > >  hw/ppc/spapr_pci.c |    9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> > > index 97961b012859..fb8c54f4d90f 100644
> > > --- a/hw/ppc/spapr_pci.c
> > > +++ b/hw/ppc/spapr_pci.c
> > > @@ -1699,7 +1699,14 @@ static void spapr_phb_realize(DeviceState *dev=
, Error **errp)
> > >      }
> > > =20
> > >      if (spapr_pci_find_phb(spapr, sphb->buid)) {
> > > -        error_setg(errp, "PCI host bridges must have unique BUIDs");
> > > +        SpaprPhbState *s;
> > > +
> > > +        error_setg(errp, "PCI host bridges must have unique indexes"=
);
> > > +        error_append_hint(errp, "The following indexes are already i=
n use:");
> > > +        QLIST_FOREACH(s, &spapr->phbs, list) {
> > > +            error_append_hint(errp, " %d", s->index);
> > > +        }
> > > +        error_append_hint(errp, "\nTry another value for the index p=
roperty\n"); =20
> >=20
> > I like the idea, but I think newlines in error messages are frowned
> > upon.  You certainly don't need the trailing one.
> >=20
>=20
> newlines are definitely not welcome in strings passed to error_report()
> or error_setg(), but they are okay in hints and the trailing one is
> actually required:

Duh, sorry.  I was misreading that as appending to the error message
itself, rather than separate hints.  Applied.
>=20
> /*
>  * Append a printf-style human-readable explanation to an existing error.
>  * If the error is later reported to a human user with
>  * error_report_err() or warn_report_err(), the hints will be shown,
>  * too.  If it's reported via QMP, the hints will be ignored.
>  * Intended use is adding helpful hints on the human user interface,
>  * e.g. a list of valid values.  It's not for clarifying a confusing
>  * error message.
>  * @errp may be NULL, but not &error_fatal or &error_abort.
>  * Trivially the case if you call it only after error_setg() or
>  * error_propagate().
>  * May be called multiple times.  The resulting hint should end with a
>  * newline.
>  */
> void error_append_hint(Error **errp, const char *fmt, ...)
>     GCC_FMT_ATTR(2, 3);
>=20
>=20
> Cc'ing Markus for insights.
>=20
> > >          return;
> > >      }
> > > =20
> > >  =20
> >=20
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pMCBjikF2xGw87uL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlzwtqkACgkQbDjKyiDZ
s5IF1Q/+MinuZg9euJEF+D2MCTy+ZxqmKe/K8qrSeJBFIa6kP3+XUcViqVMXQhmS
/+u82znVH4LOpeKI+cQKjR0Rt1ApRovibNeEdoWWwN2ASgWWM8fY3FUJzmqbzYaw
PzE2ufYYG4dVbdmM2uftA5bR6HOcR2h5DyP/qx/DcHT9KdmAvQ8Zd77gwVxTXbZA
6MVDoLd0QjbTM2ybaexIl/PGvZKElo28e9p+lJzYW/q1mVyO2nkrnU0oOlEuMrud
HYyzpQvgPniyBmTJS1dAanMQeZYVh9Abe+mPNiLWD11EuVsVCSVE/FITc3LBMQSV
UhO8OQYSr9dTRaZb9vSCg/jcKgbK2HIP/+NKnAfNyfym/SxY9Ea9Wq/9cPFPLEos
vMoYECf4RxAzLCl6iPoJT9Dkag5mUzY8YPIZdStQfx08jhCMhoIRnu4NdtHTscQ6
0J+lYvOjpWJjaV0oFGLQz3JbDusa9fpwI7zOMmO2w7Xcl07vwr/YJ9kvZM9lETr1
tr9bsWBj3fIUEAgvlErn0zEZ9D6VuhkkkWeeWsCumEVJLJvsIx6mYg5T/ENyylt3
w7VU+W1VDzDSfVvCw6JMX8kpmDVcqiNGH8cjw+urdhQh75PFaM6eedZ/+edEMqkF
Epxklp/SG9m/foSZO4tFtG0U1uriyVb1mwaHDbAWnPjmzYYHA3g=
=n888
-----END PGP SIGNATURE-----

--pMCBjikF2xGw87uL--


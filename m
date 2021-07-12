Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3BD3C413D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 04:32:38 +0200 (CEST)
Received: from localhost ([::1]:33734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2lkL-00072w-4p
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 22:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m2lgu-0005N8-RJ; Sun, 11 Jul 2021 22:29:04 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:46543 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m2lgr-0001dl-IB; Sun, 11 Jul 2021 22:29:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GNSPb0CQLz9sWS; Mon, 12 Jul 2021 12:28:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626056931;
 bh=2Qc2+XroboVUXKwDRmY1/pYXZ23rdcRikZNxJsCKLEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pmFcdCabxUSyvAo1nl+2WqsbUaIsNFi8AKLrm4TCZgnpV44LuaGqRB2EgPgwvajJW
 G4xKYFWmqzmjfvy1hEjTz9Yn7/5UP4MXnfalS9WrcsS5ykyI5aGuAV6AE14PvPJnXl
 6uAt5UCpfgluqw3A5oa7fnbiUCaSAdLiBSBgEwvA=
Date: Mon, 12 Jul 2021 12:26:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 1/3] qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI event
Message-ID: <YOuoSr3+GiqqLdtv@yekko>
References: <20210707003314.37110-1-danielhb413@gmail.com>
 <20210707003314.37110-2-danielhb413@gmail.com>
 <87r1g96jtr.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Lo5QUyHmALm1u85u"
Content-Disposition: inline
In-Reply-To: <87r1g96jtr.fsf@dusky.pond.sub.org>
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
Cc: eblake@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Lo5QUyHmALm1u85u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 08, 2021 at 03:01:20PM +0200, Markus Armbruster wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>=20
> > At this moment we only provide one event to report a hotunplug error,
> > MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
> > machine is now able to report unplug errors for other device types, such
> > as CPUs.
> >
> > Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
> > create a generic DEVICE_UNPLUG_ERROR event that can be used by all
> > unplug errors in the future.
> >
> > With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecat=
ed.
> >
> > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
> >  docs/system/deprecated.rst | 10 ++++++++++
> >  qapi/machine.json          |  6 +++++-
> >  qapi/qdev.json             | 27 ++++++++++++++++++++++++++-
> >  3 files changed, 41 insertions(+), 2 deletions(-)
> >
> > diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> > index 70e08baff6..ca6c7f9d43 100644
> > --- a/docs/system/deprecated.rst
> > +++ b/docs/system/deprecated.rst
> > @@ -204,6 +204,16 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA=
, which is deprecated
> >  (the ISA has never been upstreamed to a compiler toolchain). Therefore
> >  this CPU is also deprecated.
> > =20
> > +
> > +QEMU API (QAPI) events
> > +----------------------
> > +
> > +``MEM_UNPLUG_ERROR`` (since 6.1)
> > +''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> > +
> > +Use the more generic event ``DEVICE_UNPLUG_ERROR`` instead.
> > +
> > +
> >  System emulator machines
> >  ------------------------
> > =20
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index c3210ee1fb..a595c753d2 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -1271,6 +1271,9 @@
> >  #
> >  # @msg: Informative message
> >  #
> > +# Features:
> > +# @deprecated: This event is deprecated. Use @DEVICE_UNPLUG_ERROR inst=
ead.
> > +#
> >  # Since: 2.4
> >  #
> >  # Example:
> > @@ -1283,7 +1286,8 @@
> >  #
> >  ##
> >  { 'event': 'MEM_UNPLUG_ERROR',
> > -  'data': { 'device': 'str', 'msg': 'str' } }
> > +  'data': { 'device': 'str', 'msg': 'str' },
> > +  'features': ['deprecated'] }
> > =20
> >  ##
> >  # @SMPConfiguration:
> > diff --git a/qapi/qdev.json b/qapi/qdev.json
> > index b83178220b..349d7439fa 100644
> > --- a/qapi/qdev.json
> > +++ b/qapi/qdev.json
> > @@ -84,7 +84,9 @@
> >  #        This command merely requests that the guest begin the hot rem=
oval
> >  #        process.  Completion of the device removal process is signale=
d with a
> >  #        DEVICE_DELETED event. Guest reset will automatically complete=
 removal
> > -#        for all devices.
> > +#        for all devices. If an error in the hot removal process is de=
tected,
> > +#        the device will not be removed and a DEVICE_UNPLUG_ERROR even=
t is
> > +#        sent.
>=20
> "If an error ... is detected" kind of implies that some errors may go
> undetected.  Let's spell this out more clearly.  Perhaps append "Some
> errors cannot be detected."
>=20
> DEVICE_UNPLUG_ERROR's unrelability is awkward.  Best we can do in the
> general case.  Can we do better in special cases, and would it be
> worthwhile?  If yes, it should probably be done on top.

I can't rule out such a special case entirely, but it's pretty hard to
imagine.  If we need any kind of acknowledgement from the guest to
complete the unplug, then the unplug failing but the guest never
reporting anything is going to be indistinguishable from the guest
working on the unplug but being super slow.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Lo5QUyHmALm1u85u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDrqEcACgkQbDjKyiDZ
s5K7IQ/+ICjJBNGNqWvwST9QMPDlQx8CnSXepAwsxYdzN1F/AWs2299/ViUW/9RX
K1RPfs2ziYj1tHa0ErRu8lEXhdW7Y1JS1pAHV1rFE8jJM8DDCr8dzwsliennkDTk
eUVr7jkCT3BJGk6HD7QWY0ibIEViXG57jHFvTqKs8imGszcobCHFSBXcnWi8crbb
C2vgN+KMb25m1h1e036KKMJ4EElei0YLTaPbm1V9OmKf5GGcPjq4RV+lvmQcWvil
jkl0LXPGvlMly3v2f2KK6e8swIgzr55sAB4EBWuina72muTk2K2+dfOuD8Ij5cl6
Gnqsrw4DOiOwiEvAicQI9oR9S76m2TzVg/QxRMxiAHfQKuI6u6eccdo4HEtWJ4p9
R6nuTNgmGFwutTiQTnQWz2TMxHvqguvtmfwym/tvKqOUDVfqlcLrw7GMA5TwBtH2
RDCMm66XRQYV3a8L0J6z/pePmLuCB9pTaxlwNtYg/rvLp9Y8cftGC/6gwLAMajOv
XaYFKoKUD3TJkyitveeQcke3UKYmEVG5CEghnLgw2xjku9VUQK4RCrcwqAvmJgfZ
BbK8ilTR2chKU4QgrLDJ7n7w5fy797JCzBtZZRzK1fbsDNs6ncFKGZO8xwgdUAQx
JPh08qijkLQLsEl60QNDNCjusDcfnETynnFRtxxseRq3f87hLRM=
=TfZh
-----END PGP SIGNATURE-----

--Lo5QUyHmALm1u85u--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FCC4009DD
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 07:42:19 +0200 (CEST)
Received: from localhost ([::1]:50126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMORV-00039k-U8
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 01:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mMOM3-0000Ht-1J; Sat, 04 Sep 2021 01:36:40 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:48553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mMOM0-0000Xj-Cz; Sat, 04 Sep 2021 01:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630733791;
 bh=pQxs7NKk/eiQzbg9CgWII/Eh6qZct/+d6BNBzyGOcyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FRltF1AFhRLM6kHCvuuivUFxO+EgvdZCij1QMeBfY81i2Z6OUKmhrQI8zMyjrlgpj
 +y3YlSiMnCCyqqdjbGvTwj2uhbNm4hejVhioSPRafJVbAx812+Dph77ScrdcNlRaua
 kdThksTmFqeAaBbDSvWKLGvHJYn3jJQkinnkjBDs=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H1k1C6mTGz9sXk; Sat,  4 Sep 2021 15:36:31 +1000 (AEST)
Date: Sat, 4 Sep 2021 13:53:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v7 5/7] qapi/qdev.json: add DEVICE_UNPLUG_GUEST_ERROR
 QAPI event
Message-ID: <YTLtvn5ywJce0iqE@yekko>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-6-danielhb413@gmail.com>
 <87tuj4a0wx.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gyNYQ9pA2V/pMnDi"
Content-Disposition: inline
In-Reply-To: <87tuj4a0wx.fsf@dusky.pond.sub.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gyNYQ9pA2V/pMnDi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 03:19:26PM +0200, Markus Armbruster wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>=20
> > At this moment we only provide one event to report a hotunplug error,
> > MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
> > machine is now able to report unplug errors for other device types, such
> > as CPUs.
> >
> > Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
> > create a generic DEVICE_UNPLUG_GUEST_ERROR event that can be used by all
> > guest side unplug errors in the future. This event has a similar API as
> > the existing DEVICE_DELETED event, always providing the QOM path of the
> > device and dev->id if there's any.
> >
> > With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecat=
ed.
> >
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
>=20
> [...]
>=20
> > diff --git a/qapi/qdev.json b/qapi/qdev.json
> > index 0e9cb2ae88..8b1a1dd43b 100644
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
> > +#        for all devices.  If a guest-side error in the hot removal pr=
ocess is
> > +#        detected, the device will not be removed and a DEVICE_UNPLUG_=
GUEST_ERROR
> > +#        event is sent.  Some errors cannot be detected.
> >  #
> >  # Since: 0.14
> >  #
> > @@ -124,3 +126,27 @@
> >  ##
> >  { 'event': 'DEVICE_DELETED',
> >    'data': { '*device': 'str', 'path': 'str' } }
> > +
> > +##
> > +# @DEVICE_UNPLUG_GUEST_ERROR:
> > +#
> > +# Emitted when a device hot unplug fails due to an internal guest
> > +# error.
>=20
> Suggest to scratch "internal".

I'd suggest s/internal guest/guest reported/.  "guest error" is a bit
vague, this doesn't neccessarily indicate a bug in the guest.  The key
point is that we're reporting this event because the guest performed
some explicit action to tell us something went wrong with the plug
attempt.

>=20
> > +#
> > +# @device: the device's ID if it has one
> > +#
> > +# @path: the device's QOM path
> > +#
> > +# Since: 6.2
> > +#
> > +# Example:
> > +#
> > +# <- { "event": "DEVICE_UNPLUG_GUEST_ERROR"
> > +#      "data": { "device": "core1",
> > +#                "path": "/machine/peripheral/core1" },
> > +#      },
> > +#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
> > +#
> > +##
> > +{ 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
> > +  'data': { '*device': 'str', 'path': 'str' } }
>=20
> [...]
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gyNYQ9pA2V/pMnDi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEy7bwACgkQbDjKyiDZ
s5I0Aw//TlFdgGd2YHnAn8Fz78SoD1giPKk7mrXQPkidKNr5jL3qU3tIpIh7EFW9
NLbK8WMA1jXbMIK3KFhABLNnJ9BVYhqDjZGJX4k49Cc1Kl/OsJvMoazD4aqipclG
+PUmoly1hyozGABNayf8WU0uhpqM6vwUUdO4FwVMnBJQUcFVDeazi29uvZx+gJi/
5OnLoGMyKd13hDheSZjCBJ19CBqHb3AC8K0AHqNtfBPEaCTfP4UpiDrmxb6LR6ZI
gzR93Qxcme+wv8PsbUWN/4+bdUIH29ILGfmM7O0hxl3ijok9Xd7nV2nMx2n+GvBQ
OHFieU9eKPYXMi2J/eWUFajSTlfB1PIdWgdl79BCIl4jwzGnlAPuktRF2eGAUS5F
Xh4HSt7kYVRKQclNXdoDBItqZP9lV8LC7ieW9H8spP+sVNrMevneTQcA6/nbmOse
JYnn0n4Mhw//xmT1jQCzHaBmXizGPHf3IfPCOxMiHWbhpvPKFBzVkf3D5MZ1EB1p
ygLk6Djlrr+YDuEN4zjm6Z7YInS/sY8kUuUiq5gg0RfHpd8cmdTarjMB5hMdooQg
f+E2fGkXAThpLKOhimqgkvl/4j0JIhCraujZh77kGZlHSziX8u+rCbb1I96HQ+8d
55thpkbHAiufOOpsgZ8G3CrCDo4UT6hJKwA3gkAWPSZmZbPth8k=
=6jN2
-----END PGP SIGNATURE-----

--gyNYQ9pA2V/pMnDi--


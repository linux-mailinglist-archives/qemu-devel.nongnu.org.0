Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B809139D3A8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 05:52:54 +0200 (CEST)
Received: from localhost ([::1]:34454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6Jp-0006vB-Pl
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 23:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hu-0003fH-8u; Sun, 06 Jun 2021 23:50:54 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53825 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Hk-0002ch-Ac; Sun, 06 Jun 2021 23:50:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fyzt20q4dz9sSn; Mon,  7 Jun 2021 13:50:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623037834;
 bh=0h8V4GRkw4VEuJQdfpzFWv+wVimI+ZJWxkcohj7VNUU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=afEDzIejIkCeke2Xgcds84P2/vbcBPV3Fd3diLvKDc/x1BwGoEH4jVfrf5darzJea
 ybe+zQNbf+Pv1oZwL1DXWfV0tIXkYB4pgpmCFOgErGOnoGlL40gII9t5ZmgHCWx6Ka
 QPkK0JubKUEU3Ol6qq4lpk/y+U5IntfbrgU1ynYk=
Date: Mon, 7 Jun 2021 12:23:53 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/2] qapi/machine.json: add DEVICE_UNPLUG_ERROR QAPI
 event
Message-ID: <YL2DOSnT0q7tyANl@yekko>
References: <20210604200353.1206897-1-danielhb413@gmail.com>
 <20210604200353.1206897-2-danielhb413@gmail.com>
 <YL2DDOkbk+6gpjpF@yekko>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dQbMQXWbC/Zz7A33"
Content-Disposition: inline
In-Reply-To: <YL2DDOkbk+6gpjpF@yekko>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dQbMQXWbC/Zz7A33
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2021 at 12:23:08PM +1000, David Gibson wrote:
> On Fri, Jun 04, 2021 at 05:03:52PM -0300, Daniel Henrique Barboza wrote:
> > At this moment we only provide one event to report a hotunplug error,
> > MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
> > machine is now able to report unplug errors for other device types, such
> > as CPUs.
> >=20
> > Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
> > create a generic DEVICE_UNPLUG_ERROR event that can be used by all
> > unplug errors in the future.
> >=20
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Markus, I'm happy to take this through my tree if that's convenient
for you, but I'd like to get an ack.

>=20
> > ---
> >  qapi/machine.json | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >=20
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index 58a9c86b36..f0c7e56be0 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -1274,3 +1274,26 @@
> >  ##
> >  { 'event': 'MEM_UNPLUG_ERROR',
> >    'data': { 'device': 'str', 'msg': 'str' } }
> > +
> > +##
> > +# @DEVICE_UNPLUG_ERROR:
> > +#
> > +# Emitted when a device hot unplug error occurs.
> > +#
> > +# @device: device name
> > +#
> > +# @msg: Informative message
> > +#
> > +# Since: 6.1
> > +#
> > +# Example:
> > +#
> > +# <- { "event": "DEVICE_UNPLUG_ERROR"
> > +#      "data": { "device": "dimm1",
> > +#                "msg": "Memory hotunplug rejected by the guest for de=
vice dimm1"
> > +#      },
> > +#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
> > +#
> > +##
> > +{ 'event': 'DEVICE_UNPLUG_ERROR',
> > +  'data': { 'device': 'str', 'msg': 'str' } }
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dQbMQXWbC/Zz7A33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9gzkACgkQbDjKyiDZ
s5ILNBAAyw37lRDkNn/pFM1k8LuByStFpGHg5twm5AQYzJyHY64wLeauLWvQjYZx
g/uBuJ6BsSb62soPLNUjEZWbiVxQ+Jq8h9F/+Snk32YYOEBnGORuDqTueoxjT7HQ
ytYFYQuZIMsfSzh3Wc/TQmX8NJKjaGIDgKCsWlb9GlGekpKsRxGO8xfMP1m5Zpe+
DE9U58q1jaoI598bbEVh9j/0PiarSaXzYiHDbAsfZ9D6IS98kL+WPX6WC7n1OgAU
bpqkUkeMTddWgyH2ydht3/lduQGi7lXWW1hk5ZYwuwWo3TxQPj/q7YqVQjKJTExU
6nLerGuTgU+YMHi1Ig2TbP0OkqKMAn3qPu8shMzFsY/BkXOb/dXFShsE3eS710/V
BOqaKS83ryjyKhZVviorGbz98Nx5Pq/8hQOzDGt73M6itOysjvyBPxGsismFuDkf
sX8Q5Hpgbm6Cir8YSydguU4ViMVEb+lfmxxa53mZF/knFE3Tdj04NNgNXrVVhsUO
GSNCWqvgQwf+jPzTM1I0xwlkPQdWaKI0U5O9lR2tF+ifV6VeDnskwptUkZm13omd
YXXXLLVhKKjdYocLSvPllLDEglB1R/6TC0ciZ8UtzkNil/r4VaptwA9lXsO2CE4c
NL1sY+VMwX8gQOElx6am2xJ2Np5s+DTO7CsO+EJMvzMsF+SLjLQ=
=uiZS
-----END PGP SIGNATURE-----

--dQbMQXWbC/Zz7A33--


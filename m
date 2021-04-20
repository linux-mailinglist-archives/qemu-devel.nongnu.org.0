Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B3364FE0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 03:34:22 +0200 (CEST)
Received: from localhost ([::1]:40658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYfHR-0004gI-Co
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 21:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYfDj-00026v-W0; Mon, 19 Apr 2021 21:30:32 -0400
Received: from ozlabs.org ([203.11.71.1]:35875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYfDf-0005sP-O5; Mon, 19 Apr 2021 21:30:31 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FPR2G1spVz9vFD; Tue, 20 Apr 2021 11:30:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618882214;
 bh=N9c81MNvesVxqW3yb7Wb/FnxbkYFgdcWgiSblGAAmjM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bcv5aYdNZlg8w3LigRNT0A9nXNo4gt7YAljhnPRn8TXsjTKmCahnSiEzkRi1WmYDz
 EohkqehKi/OqX+kbJ0UDDG2ph7UOJOxSxhds6AUII9i+jz3VStfUqNq63tQJy8NV4m
 B6ZO9iYYK4n51fWYmTnz1BKg80vEezJqCDXi4WyM=
Date: Tue, 20 Apr 2021 11:24:51 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 2/2] spapr.c: always pulse guest IRQ in
 spapr_core_unplug_request()
Message-ID: <YH4tY6iDkeGVD2sM@yekko.fritz.box>
References: <20210401000437.131140-1-danielhb413@gmail.com>
 <20210401000437.131140-3-danielhb413@gmail.com>
 <YGUx1+bNSR2IFFSV@yekko.fritz.box>
 <d8ef1891-6ec6-bacf-e29e-5a4891780c2e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7fPIfnX6ayux5EOD"
Content-Disposition: inline
In-Reply-To: <d8ef1891-6ec6-bacf-e29e-5a4891780c2e@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--7fPIfnX6ayux5EOD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 04:27:43PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 3/31/21 11:37 PM, David Gibson wrote:
> > On Wed, Mar 31, 2021 at 09:04:37PM -0300, Daniel Henrique Barboza wrote:
> > > Commit 47c8c915b162 fixed a problem where multiple spapr_drc_detach()
> > > requests were breaking QEMU. The solution was to just spapr_drc_detac=
h()
> > > once, and use spapr_drc_unplug_requested() to filter whether we alrea=
dy
> > > detached it or not. The commit also tied the hotplug request to the
> > > guest in the same condition.
> > >=20
> > > Turns out that there is a reliable way for a CPU hotunplug to fail. I=
f a
> > > guest with one CPU hotplugs a CPU1, then offline CPU0s via 'echo 0 >
> > > /sys/devices/system/cpu/cpu0/online', then attempts to hotunplug CPU1,
> > > the kernel will refuse it because it's the last online CPU of the
> > > system. Given that we're pulsing the IRQ only in the first try, in a
> > > failed attempt, all other CPU1 hotunplug attempts will fail, regardle=
ss
> > > of the online state of CPU1 in the kernel, because we're simply not
> > > letting the guest know that we want to hotunplug the device.
> > >=20
> > > Let's move spapr_hotplug_req_remove_by_index() back out of the "if
> > > (!spapr_drc_unplug_requested(drc))" conditional, allowing for multiple
> > > 'device_del' requests to the same CPU core to reach the guest, in case
> > > the CPU core didn't fully hotunplugged previously.
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> >=20
> > I've applied these to ppc-for-6.0, but..
> >=20
> > > ---
> > >   hw/ppc/spapr.c | 11 ++++++++++-
> > >   1 file changed, 10 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index 05a765fab4..e4be00b732 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -3777,8 +3777,17 @@ void spapr_core_unplug_request(HotplugHandler =
*hotplug_dev, DeviceState *dev,
> > >       if (!spapr_drc_unplug_requested(drc)) {
> > >           spapr_drc_unplug_request(drc);
> > > -        spapr_hotplug_req_remove_by_index(drc);
> > >       }
> > > +
> > > +    /*
> > > +     * spapr_hotplug_req_remove_by_index is left unguarded, out of t=
he
> > > +     * "!spapr_drc_unplug_requested" check, to allow for multiple IRQ
> > > +     * pulses removing the same CPU. Otherwise, in an failed hotunpl=
ug
> > > +     * attempt (e.g. the kernel will refuse to remove the last online
> > > +     * CPU), we will never attempt it again because unplug_requested
> > > +     * will still be 'true' in that case.
> > > +     */
> > > +    spapr_hotplug_req_remove_by_index(drc);
> >=20
> > I think we need similar changes for all the other unplug types (LMB,
> > PCI, PHB) - basically retries should always be allowed, and at worst
> > be a no-op, rather than generating an error like they do now.
>=20
>=20
> For PHBs should be straightforward. Not so sure about PCI because there is
> all the PCI function logic around the hotunplug of function 0.
>=20
> As for LMBs, we block further attempts because there is no way we can tell
> if the hotunplug is being executed but it is taking some time (it is not
> uncommon for a DIMM unplug to take 20-30 seconds to complete), versus
> an error scenario.

I don't see why that prevents retries.  Can't you reissue the
index+size unplug request anyway?  The code you already have to fail
unplugs on a reconfigure should work for both the original request and
the retry, shouldn't it?


> What we do ATM is check is the pending DIMM unplug
> state exists, and if it does, assume that a hotunplug is pending. I have
> no idea what would happen if an unplug request for a LMB DRC reaches the
> kernel in the middle of an error rollback (when the kernel reconnects all
> the LMBs again) and the same DRC that was rolled back is disconnected
> again.
>=20
> We would need to check not only if the pending dimm unplug state exists, =
but
> also if partially exists. In other words, if there are DRCs of that DIMM =
that
> were unplugged already. That way we can prevent to issue a removal while
> the unplug is still running.
>=20
>=20
> Thanks,
>=20
>=20
> DHB
>=20
> >=20
> > >   }
> > >   int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7fPIfnX6ayux5EOD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB+LWIACgkQbDjKyiDZ
s5ITww/+LaXsw+Q+Vk+gep7XWJ4ePzngMTG7Y4ZAmpg6SvKteSDWI7SOu8HTSf/2
tx+fMCcB6urKRnTjmZD5/BNj/iO5zKmhhXYueJWoio/9xXYiTV1G/LhpQzno3wAr
s4dOTP6AdeljmqhLUnmtSwDOKJYstvBXp9hgAckWq2lZp6cuGaHppVlDOUBzzu07
siZAglFVHQ0oNFi6lH9QTgtwhZiudDkvGCTN4cSwvoqZoq1I4EW9bKQbLNe1t5Pc
rVBx2hwwbX6D0X3+Z/jpGrugVXgt0ih0xdsqhkpQg58hVAPXqDR5mHA4KaEI6AZP
XBcHRM56w6kXJVvjYOz86Whw6NR8IH4lldo0slrcEIXbDh3TA/ANJI0F0SJiyFqa
Xng+uYPmY3OXdw2MC8NIO86MHqTjUlJBT2Pm6tIWEhMq5GiL/IxGaAjRuwd7Dlsq
+bdUQbo05w7Uh1d/iGhlAYBKTaMsaI36XwUe1+SbKLpJ7DmXMad0ikwwk7NOeN0r
ZXpdg46fx1A+uPBdD2Kek3y0BPae71kL9UZ2aadSYKPAtVElCNna3akYYKThzdQc
4uVQnXpT5Vmxs8ASLclkqYja7LGPqgz1Driaj8TgtS0nDsdr/DMkXLjWLEpPckae
Hd3fhlet2284VLfNacrsJ1oJ/4oxfBI5tTV8I/3aVxCNYCuO1Bs=
=S8Gg
-----END PGP SIGNATURE-----

--7fPIfnX6ayux5EOD--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2856B4C3CE1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 05:06:53 +0100 (CET)
Received: from localhost ([::1]:34092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNRsa-0006ua-7Z
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 23:06:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nNRhO-0007ry-Jt; Thu, 24 Feb 2022 22:55:20 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:59783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nNRhF-0001PS-HQ; Thu, 24 Feb 2022 22:55:17 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4K4bWm24vTz4xmt; Fri, 25 Feb 2022 14:55:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1645761300;
 bh=qziZTGEs7zpqhi+LBqP82n4pXYqZRPtvbL4grJX9PIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hzqw406FKQBxAgTwolYCnc6+/QeZFEn7uh1vEbA99EiUubmnYrPNj0RaYiD7rXWhD
 XOxQ70Mv75x0d24/tzmWGafY7J1AiCLt1oHAf5Fi0ckhVWafqmqGCG/REmi3v8ZAnX
 +PkRsGic1uPkopBgDMzsXWSGbyvjKrQtNAolDazY=
Date: Fri, 25 Feb 2022 14:54:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC PATCH 0/4] ppc: nested TCG migration (KVM-on-TCG)
Message-ID: <YhhTB3rXbC9fH2x5@yekko>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
 <7a64b078-a11e-0e5a-e7ae-104052442d88@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p2fPJfH32lkoYFpv"
Content-Disposition: inline
In-Reply-To: <7a64b078-a11e-0e5a-e7ae-104052442d88@ilande.co.uk>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fabiano Rosas <farosas@linux.ibm.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, npiggin@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--p2fPJfH32lkoYFpv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 09:00:24PM +0000, Mark Cave-Ayland wrote:
> On 24/02/2022 18:58, Fabiano Rosas wrote:
>=20
> > This series implements the migration for a TCG pseries guest running a
> > nested KVM guest. This is just like migrating a pseries TCG guest, but
> > with some extra state to allow a nested guest to continue to run on
> > the destination.
> >=20
> > Unfortunately the regular TCG migration scenario (not nested) is not
> > fully working so I cannot be entirely sure the nested migration is
> > correct. I have included a couple of patches for the general migration
> > case that (I think?) improve the situation a bit, but I'm still seeing
> > hard lockups and other issues with more than 1 vcpu.
> >=20
> > This is more of an early RFC to see if anyone spots something right
> > away. I haven't made much progress in debugging the general TCG
> > migration case so if anyone has any input there as well I'd appreciate
> > it.
> >=20
> > Thanks
> >=20
> > Fabiano Rosas (4):
> >    target/ppc: TCG: Migrate tb_offset and decr
> >    spapr: TCG: Migrate spapr_cpu->prod
> >    hw/ppc: Take nested guest into account when saving timebase
> >    spapr: Add KVM-on-TCG migration support
> >=20
> >   hw/ppc/ppc.c                    | 17 +++++++-
> >   hw/ppc/spapr.c                  | 19 ++++++++
> >   hw/ppc/spapr_cpu_core.c         | 77 +++++++++++++++++++++++++++++++++
> >   include/hw/ppc/spapr_cpu_core.h |  2 +-
> >   target/ppc/machine.c            | 61 ++++++++++++++++++++++++++
> >   5 files changed, 174 insertions(+), 2 deletions(-)
>=20
> FWIW I noticed there were some issues with migrating the decrementer on M=
ac
> machines a while ago which causes a hang on the destination with TCG (for
> MacOS on a x86 host in my case). Have a look at the following threads for
> reference:
>=20
> https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg00546.html
> https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg04622.html
>=20
> IIRC there is code that assumes any migration in PPC is being done live, =
and
> so adjusts the timebase on the destination to reflect wall clock time by
> recalculating tb_offset. I haven't looked at the code for a while but I
> think the outcome was that there needs to be 2 phases in migration: the
> first is to migrate the timebase as-is for guests that are paused during
> migration, whilst the second is to notify hypervisor-aware guest OSs such=
 as
> Linux to make the timebase adjustment if required if the guest is running.

Whether the timebase is adjusted for the migration downtime depends
whether the guest clock is pinned to wall clock time or not.  Usually
it should be (because you don't want your clocks to go wrong on
migration of a production system).  However in neither case should be
the guest be involved.

There may be guest side code related to this in Linux, but that's
probably for migration under pHyp, which is a guest aware migration
system.  That's essentially unrelated to migration under qemu/kvm,
which is a guest unaware system.

Guest aware migration has some nice-sounding advantages; in particular
itcan allow migrations across a heterogenous cluster with differences
between hosts that the hypervisor can't hide, or can't efficiently
hide.  However, it is IMO, a deeply broken approach, because it can
allow an un-cooperative guest to indefinitely block migration, and for
it to be reliably correct it requires *much* more pinning down of
exactly what host system changes the guest can and can't be expected
to cope with than PAPR has ever bothered to do.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--p2fPJfH32lkoYFpv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIYUwAACgkQgypY4gEw
YSIRBBAAzHUXt6jN9Z8FBtvxFmCJ0OMgQ/Vu1OvDpNk5ozlVkSrLY1aDUU+wPtG8
GKgczg3VdFI7ux44tNump+M7iTBaSpQ0WekJl5oOpFl4BHAtGyLupGrZ7mRcI0Nz
iyPtF9x7qOydsqNOaB6FTGqYIrW6X4wy1LX/p8lSTuWwAYTF/cSOfpoz0oRhtRZz
zCcTN9eCy9WUmFTadcPjuBnqHoKo8UTqlL04bjVOmGNDhBcAriCCiYCT533kvMK+
lTdtVi2fnVFnLJpzAqlgfEcAMmz/+u077YRG4l/K/W8fkwewsN2asd7NvZyPv+gX
l2MrvKIbcLpiV04Q+8GC9BNDap20PxYjYuur3gEsK36InaxnBhgARbGb7/U8oY0Z
jv5fhMLC3VpQoxhMFwpKZj5PuDfEtk2HVk8BquDiRuDHfB680ecekKwLr5udbIRs
Hkm7AxfMXpHDb3HqbjfA4ooK8VtSX0UPMHOARpPq0A9rj2k/PjPXc8JDaLQfTPuW
TPc4Lh2RE46P27za5HcMN3hqxF7TWOTfxe5I17bF/IpSmczHaVJKFSdSrKwh58Q/
uO5/RGy43kLLCg1YVrqRwnHPNxERefv4OWnU8xaPFqu4IubpipfCeC8BodygRTg3
Kmlaw6delr81QhMXiaRv+wFPZ1WV3waoWGwED1riPuHNUtyztO8=
=4D5U
-----END PGP SIGNATURE-----

--p2fPJfH32lkoYFpv--


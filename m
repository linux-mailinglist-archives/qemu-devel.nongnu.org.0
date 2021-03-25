Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA69348767
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 04:16:29 +0100 (CET)
Received: from localhost ([::1]:60372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPGU0-0004SY-45
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 23:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPG7F-0007dd-L4; Wed, 24 Mar 2021 22:52:59 -0400
Received: from ozlabs.org ([203.11.71.1]:41265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPG78-00043J-EN; Wed, 24 Mar 2021 22:52:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F5V5T3RlJz9sWT; Thu, 25 Mar 2021 13:52:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616640765;
 bh=vUttOER+NqhkdnmjvtEtFkdThEiO6jpIhr2odLw+IXs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LaF77Mg1BeKCJhlePZ1H0mXoWXrvX9qtMZTUFjENexh6xeWzmML0Z9AaWy0TpMLpN
 yi4k7d8UdQK5AbeOIVCfGdFxRhbaT8MlXWCk2KCRb5CDAQLM/bYIzAbcQBJ9UaCC4o
 Ek8faCEnnMAL8CgU9vQNdy1E7LYemXdiHRqDUCJA=
Date: Thu, 25 Mar 2021 13:10:09 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
Message-ID: <YFvxAW3l4t+YznEm@yekko.fritz.box>
References: <20210319183453.4466-1-danielhb413@gmail.com>
 <20210319183453.4466-2-danielhb413@gmail.com>
 <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
 <2025f26f-5883-4e86-02af-5b83a8d52465@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O4YHC3Las4vAS4m7"
Content-Disposition: inline
In-Reply-To: <2025f26f-5883-4e86-02af-5b83a8d52465@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--O4YHC3Las4vAS4m7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 02:21:33PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 3/22/21 10:03 PM, David Gibson wrote:
> > On Fri, Mar 19, 2021 at 03:34:52PM -0300, Daniel Henrique Barboza wrote:
> > > Kernel commit 4bce545903fa ("powerpc/topology: Update
> > > topology_core_cpumask") cause a regression in the pseries machine when
> > > defining certain SMP topologies [1]. The reasoning behind the change =
is
> > > explained in kernel commit 4ca234a9cbd7 ("powerpc/smp: Stop updating
> > > cpu_core_mask"). In short, cpu_core_mask logic was causing troubles w=
ith
> > > large VMs with lots of CPUs and was changed by cpu_cpu_mask because, =
as
> > > far as the kernel understanding of SMP topologies goes, both masks are
> > > equivalent.
> > >=20
> > > Further discussions in the kernel mailing list [2] shown that the
> > > powerpc kernel always considered that the number of sockets were equal
> > > to the number of NUMA nodes. The claim is that it doesn't make sense,
> > > for Power hardware at least, 2+ sockets being in the same NUMA node. =
The
> > > immediate conclusion is that all SMP topologies the pseries machine w=
ere
> > > supplying to the kernel, with more than one socket in the same NUMA n=
ode
> > > as in [1], happened to be correctly represented in the kernel by
> > > accident during all these years.
> > >=20
> > > There's a case to be made for virtual topologies being detached from
> > > hardware constraints, allowing maximum flexibility to users. At the s=
ame
> > > time, this freedom can't result in unrealistic hardware representatio=
ns
> > > being emulated. If the real hardware and the pseries kernel don't
> > > support multiple chips/sockets in the same NUMA node, neither should =
we.
> > >=20
> > > Starting in 6.0.0, all sockets must match an unique NUMA node in the
> > > pseries machine. qtest changes were made to adapt to this new
> > > condition.
> >=20
> > Oof.  I really don't like this idea.  It means a bunch of fiddly work
> > for users to match these up, for no real gain.  I'm also concerned
> > that this will require follow on changes in libvirt to not make this a
> > really cryptic and irritating point of failure.
>=20
> Haven't though about required Libvirt changes, although I can say that th=
ere
> will be some amount to be mande and it will probably annoy existing users
> (everyone that has a multiple socket per NUMA node topology).
>=20
> There is not much we can do from the QEMU layer aside from what I've prop=
osed
> here. The other alternative is to keep interacting with the kernel folks =
to
> see if there is a way to keep our use case untouched.

Right.  Well.. not necessarily untouched, but I'm hoping for more
replies from C=E9dric to my objections and mpe's.  Even with sockets
being a kinda meaningless concept in PAPR, I don't think tying it to
NUMA nodes makes sense.

> This also means that
> 'ibm,chip-id' will probably remain in use since it's the only place where
> we inform cores per socket information to the kernel.

Well.. unless we can find some other sensible way to convey that
information.  I haven't given up hope for that yet.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--O4YHC3Las4vAS4m7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBb8QEACgkQbDjKyiDZ
s5JjFg//QHghGVaSfKgmWQtX/UELAgOov87+dw//veEGqx6LZTuP2ibBnC/1Ai6o
oKYOLbHi8gaH4y5H+UP3A0QOvI1GRivRitb43b0PEHhtUp+MRNhKj2ZqvreTOK2Y
nUS22ctitYl1VITIX7Ck3G9zal7C8K73KXhq+uJaPgYqgDRzNvAVHEsTOoJIpTJk
R1IOPnCe/212B11oNS4P8kMhNxi/sqGSCGIEj0sHHkhe5yZgvR63fp3H/+smTNCq
cf9eRTkAFTL4neCsehhRfkrXjY4V8ORtXt1UQBoYr6gqYb4A7aa3586BHNEvZCiK
zKsmo0RwLtlM/dGPjPRLCit8Elr0xPOtNDuWyvP38EJDsuN/bxBw4N8NPZrHoHii
b+SxtUp3bFpWMARmGd13L5JJ8jQ3xQ0+tmUSv0kQIq6NdQXV0BElG+p3UT81cHXL
cQEVIUy1MVZ9jRSsdPqbYVCrpQM5jT6GDvUXwkULHR8aptYBh7uM5gPYxY1tSXs7
1oBgMvcO1r0VQLaN4hpHCicvMpYBfcHO87VRWhCxyuF2H6syOsvecaYJdJgqX1XT
/sVfQSAsAUBZYo+5/xUEPPOSIgq+8DC4lXUA6pFms55BisPQm9fLDaB4CUOe+Sd1
4EMusUpGdTQp3hzdv6DL/TvfpFrfXWZ++ouB+8SErBpbI/y7vd0=
=g2Zb
-----END PGP SIGNATURE-----

--O4YHC3Las4vAS4m7--


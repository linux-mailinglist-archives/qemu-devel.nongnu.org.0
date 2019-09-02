Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374FFA4F4D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 08:42:41 +0200 (CEST)
Received: from localhost ([::1]:33696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4g2x-00038w-ST
	for lists+qemu-devel@lfdr.de; Mon, 02 Sep 2019 02:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51473)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i4g1u-0002ju-Vk
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 02:41:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i4g1t-0004Ff-NI
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 02:41:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45195 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i4g1s-000469-CG; Mon, 02 Sep 2019 02:41:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46ML8N6GWQz9sNf; Mon,  2 Sep 2019 16:41:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1567406484;
 bh=fajqi+/SdyxIw+hhYME2usnwYlKNpAyq38muRXWhJkA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=isXahj9rbC8NJry02ReIZzdw/L6NzJ2cpgTJFd5/O/Wxyz4sHMCAL5oJqYYklKfV9
 b/8FGf0IUj06fwpPb1jfqluRYtSQChjOCtUIKGVsgZGM4IreIC6fu3FCYD0IB4z9Tp
 k8SuzolKbcSEqghfNf2dJ9/hYexvKNnG5Oww58dc=
Date: Mon, 2 Sep 2019 16:27:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Message-ID: <20190902062718.GG415@umbus.fritz.box>
References: <20190830161345.22436-1-lvivier@redhat.com>
 <20190830163413.GH4674@redhat.com>
 <20190830194543.6c1f5776@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="924gEkU1VlJlwnwX"
Content-Disposition: inline
In-Reply-To: <20190830194543.6c1f5776@bahia.lan>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [Qemu-ppc] [PATCH] pseries: do not allow
 memory-less/cpu-less NUMA node
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-ppc@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--924gEkU1VlJlwnwX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2019 at 07:45:43PM +0200, Greg Kurz wrote:
> On Fri, 30 Aug 2019 17:34:13 +0100
> Daniel P. Berrang=E9 <berrange@redhat.com> wrote:
>=20
> > On Fri, Aug 30, 2019 at 06:13:45PM +0200, Laurent Vivier wrote:
> > > When we hotplug a CPU on memory-less/cpu-less node, the linux kernel
> > > crashes.
> > >=20
> > > This happens because linux kernel needs to know the NUMA topology at
> > > start to be able to initialize the distance lookup table.
> > >=20
> > > On pseries, the topology is provided by the firmware via the existing
> > > CPUs and memory information. Thus a node without memory and CPU canno=
t be
> > > discovered by the kernel.
> > >=20
> > > To avoid the kernel crash, do not allow to start pseries with empty
> > > nodes.
> >=20
> > This describes one possible guest OS. Is there any reasonable chance
> > that a non-Linux guest might be able to handle this situation correctly,
> > or do you expect any guest to have the same restriction ?

That's... a more complicated question than you'd think.

The problem here is it's not really obvious in PAPR how topology
information for nodes without memory should be described in the device
tree (which is the only way we given that information to the guest).

It's possible there's some way to encode this information that would
make AIX happy and we just need to fix Linux to cope with that, but
it's not really clear what it would be.

> I can try to grab an AIX image and give a try, but anyway this looks like
> a very big hammer to me... :-\

I'm not really sure why everyone seems to think losing zero-memory
node capability is such a big deal.  It's never worked in practice on
POWER and we can always put it back if we figure out a sensible way to
do it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--924gEkU1VlJlwnwX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1stkQACgkQbDjKyiDZ
s5Jo9g//YU9XCanHuyZfI/kpHEvMLhIbcRZXosqBZFnXSwB9hPYPS9LC4bvqULDL
Mr7Py4EYmOfHZJ+fIALZWJDFTiKSEUrdiJGgYh8gy5WNjw3yMRT5SiYb2Sf8mZro
Fq97n4uu7wFDWQbzUOdIwyFEvNvF6NQZ3M9LF4BBMPnVrJFdpQ9fwZUPXu4u+CpT
PQs0SqZk6F7044H4rRCT20kjuFHTe+oZU7cuoOBq+qsY0ItkuYI1gWknCyXmLplf
hRVdC78BZHP84G6ir7CGYcxruEuBUI6hRgsZAgJdtVXIdNYGxNbee0EeD3TLGcj6
wl8ARWhd9mO6qIzGbK8UGq2Z8W30cgHfEuxyENVuVz1rW86hD0q91HZrFwOG1BYX
qB+9eSdQefmiZrn20B96Nb1YgRtmcsSlSuYUoxCpb0Syp1w6VQN5gUfwXGochE/u
P/yCaa61zM5rMcdkP26NkhjXdHv8UPmITrZwTYd4M00mQQoqOIhapcGXvXnfIqbs
WhZ7Ddy5hxEREkpUZEHcq4r4TOiRui20LYfNv8E4DfwRDs+awQWOq0HsFRRZ/Cmt
K7WylDquFhwK4gyCCaqptfneD08ozra2hdS0B/pFKCo6TIl7yf8SC7LEK4s5QBUK
9gFxkIg4gzp/E4M/FQovW99Il4jTgcxcqgruy4q1dGejZMa+8j0=
=fCR4
-----END PGP SIGNATURE-----

--924gEkU1VlJlwnwX--


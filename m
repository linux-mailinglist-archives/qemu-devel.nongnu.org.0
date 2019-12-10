Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4437117F90
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 06:23:47 +0100 (CET)
Received: from localhost ([::1]:50638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieXzu-00051z-Pl
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 00:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ieXy8-0003ZW-P0
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 00:21:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ieXy7-0002eQ-Fa
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 00:21:56 -0500
Received: from ozlabs.org ([203.11.71.1]:35671)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ieXy6-0002df-Mz; Tue, 10 Dec 2019 00:21:55 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47X7hv1575z9sR0; Tue, 10 Dec 2019 16:21:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1575955311;
 bh=b9SbFYuDLaVGT5Nrj65h+IE6U0yklPOOMcVzvHBtqhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KBvCJmVEgvUmbW+l1RG1BFqmzxafG6SGT2cgXBAEweQlZLrGnksV5Y0rL/tLZCmDn
 lp+3BluR1kLSMIHeRdFtSvWOjScyM0Zkuk6EmeSItSHRUVSzcJoAAaTEo+77NpCjYW
 g7RP+GlJbrvx+GbTfQ/0u1UgS5Dr9KG/bdKm8/jI=
Date: Tue, 10 Dec 2019 16:21:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [for-5.0 4/4] spapr: Correct clamping of RMA to Node 0 size
Message-ID: <20191210052138.GI207300@umbus.fritz.box>
References: <20191129013504.145455-1-david@gibson.dropbear.id.au>
 <20191129013504.145455-5-david@gibson.dropbear.id.au>
 <6bdb09b2-2d08-f997-30a2-5ec417c8b914@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JIpyCmsTxyPLrmrM"
Content-Disposition: inline
In-Reply-To: <6bdb09b2-2d08-f997-30a2-5ec417c8b914@ozlabs.ru>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 groug@kaod.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JIpyCmsTxyPLrmrM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2019 at 03:18:37PM +1100, Alexey Kardashevskiy wrote:
>=20
>=20
> On 29/11/2019 12:35, David Gibson wrote:
> > The Real Mode Area (RMA) needs to fit within Node 0 in NUMA configurati=
ons.
> > We use a helper function spapr_node0_size() to calculate this.
> >=20
> > But that function doesn't actually get the size of Node 0, it gets the
> > minimum size of all nodes, ever since b082d65a300 "spapr: Add a helper =
for
> > node0_size calculation".  That was added, apparently, because Node 0 in
> > qemu's terms might not have corresponded to Node 0 in PAPR terms (i.e. =
the
> > node with memory at address 0).
>=20
>=20
> After looking at this closely, I think the idea was that the first
> node(s) may have only CPUs but not memory, in this case
> node#0.node_mem=3D=3D0 and things crash:

Ah!  Excellent point - I misread what the existing node0_size()
function was doing.  Corrected for the next spin.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JIpyCmsTxyPLrmrM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3vK1kACgkQbDjKyiDZ
s5IArBAArW/HU92wrTSyXPiSF5Huz+clz5GTS0nr2iS08BVKGbCicdgGWZrYG0cp
ThzDkUXtB18ynftpBB5zjVLYxunmZyg0zmkR5kwpbQztV32o6Ju2Wdmjf09crNNI
cul5Dc4ouyMAKLLzTs6bXcvimZXHBfRDoRMbi82XIgVyazsEZyZ20sZImasGEJZ1
LdGgCV+BhPMLoq7ZN2X4IOkQc+69obhN6BXgRsCKiZ3JKmN57VmJHcMjlSFU7S8n
MPk+jfkJxoonZIDxEttb/woPrTqaJQzXxxSl7ju18BybcZSyu2q1Jpsbbm/tNpxk
fcpG67yhRIPM7HfvF7BdPb9ctX2IDcjBPtc02bflnpOZnL+jGLxA2dhVIc4KZZ8X
iJ2XU9DZPnPfeGsmfLsbtvL2q/+CpN3OPMrPcGI2dmMrO9SYLdeYpew5VH8oKIMM
gRNcSQ/BdWcGvqIsssdSrnO6KJWixBWI9jGUtWJWOOPgoyuzkxomVo81WNJY0qzT
mk+ZAisEKscdhgIRKLaFNIZNnTzdEMnP3YJ9J2F3eBw6YKfW1qg8XQnNcSCFc2ww
U8qBoVh8AJl/ngot60J5GDHSwOG9H20m1W3ZDQfEdaMMpTF6G8+JJTFHMt/XY6Yi
uRz9ZkB5fgIGwVrmIe6lMy2HPlSGvlcGjIcioSvcmIo+x8JR2bU=
=SoDy
-----END PGP SIGNATURE-----

--JIpyCmsTxyPLrmrM--


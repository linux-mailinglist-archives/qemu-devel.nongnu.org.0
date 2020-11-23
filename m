Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD122C004C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:49:59 +0100 (CET)
Received: from localhost ([::1]:60928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh5fi-0003J2-1b
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh5ev-0002nH-DP; Mon, 23 Nov 2020 01:49:10 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51329 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh5es-0003XG-9c; Mon, 23 Nov 2020 01:49:09 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cfd6N0wJ1z9sTc; Mon, 23 Nov 2020 17:49:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606114140;
 bh=n5AcEJklEmBB8P5le96b83UaXcnT1b+bvpBmuMeA9xc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MazCxIBfIeDohgwY2xiCcaWiB6Uab5RVFM873nMhnIZP2x7zOF7HoKPskdzZuC9vd
 1HA8KCw91PjoDPY7VlqakWxdvOVnC5VOefNGDIEmEdGTs8wyCZZgf2Q1dZYy8zhtcm
 Z2H0Lu45a0oTFRwegKaEUI798z75727WE0OOrau0=
Date: Mon, 23 Nov 2020 17:44:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 0/6] spapr/xive: Activate StoreEOI in P10 compat guests
Message-ID: <20201123064454.GY521467@yekko.fritz.box>
References: <20201005165147.526426-1-clg@kaod.org>
 <20201009002326.GB1025389@yekko.fritz.box>
 <cabb6bda-c7b5-6546-a142-b2bb2dce28ef@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R9dSeJxMIUBTi9Do"
Content-Disposition: inline
In-Reply-To: <cabb6bda-c7b5-6546-a142-b2bb2dce28ef@kaod.org>
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
Cc: Gustavo Romero <gromero@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--R9dSeJxMIUBTi9Do
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2020 at 02:22:35PM +0100, C=E9dric Le Goater wrote:
> Sorry for the late answer I was out for a couple of weeks.
>=20
> On 10/9/20 2:23 AM, David Gibson wrote:
> > On Mon, Oct 05, 2020 at 06:51:41PM +0200, C=E9dric Le Goater wrote:
> >> Hello,
> >>
> >> When an interrupt has been handled, the OS notifies the interrupt
> >> controller with an EOI sequence. On the XIVE interrupt controller
> >> (POWER9 and POWER10), this can be done with a load or a store
> >> operation on the ESB interrupt management page of the interrupt. The
> >> StoreEOI operation has less latency and improves interrupt handling
> >> performance but it was deactivated during the POWER9 DD2.0 time-frame
> >> because of ordering issues. POWER9 systems use the LoadEOI instead.
> >> POWER10 has fixed the issue with a special load command which enforces
> >> Load-after-Store ordering and StoreEOI can be safely used.
> >=20
> > Do you mean that ordering is *always* enforced on P10?  Or it's a
> > special form of load that has the ordering?
>=20
> It's a special load offset that has the ordering. Oring 0x40 to the load
> address :=20
>=20
>   #define XIVE_ESB_LOAD_EOI	0x000 /* Load */
>   #define XIVE_ESB_GET		0x800 /* Load */
>   #define XIVE_ESB_SET_PQ_00	0xc00 /* Load */
>   #define XIVE_ESB_SET_PQ_01	0xd00 /* Load */
>   #define XIVE_ESB_SET_PQ_10	0xe00 /* Load */
>   #define XIVE_ESB_SET_PQ_11	0xf00 /* Load */
>=20
> will enforce load-after-store ordering.

Oh... I had assumed the problem was to do with the load/store ordering
within the CPU core itself (or maybe the L1, I guess).  But if the
address used can change it, the problem must be within the XIVE, yes?
Or at least somwhere on the Powerbus.  So, wasn't this just a plain
XIVE hardware bug?  In which case why is there software involvement as
well?

> We only need it for XIVE_ESB_SET_PQ_10. See commit b1f9be9392f0=20
> ("powerpc/xive: Enforce load-after-store ordering when StoreEOI is active=
")=20
> in Linux.
>=20
> C.=20
>=20
>=20
> >=20
> > Also, weirdly, despite the series being addressed to me, only some of
> > the patches ended up in my inbox, rather than the list folder :/.
> >=20
> >> These changes add a new StoreEOI capability which activate StoreEOI
> >> support in the flags returned by the hcall H_INT_GET_SOURCE_INFO. When
> >> the machine is using an emulated interrupt controller, TCG or without
> >> kernel IRQ chip, there are no limitations and activating StoreEOI is
> >> not an issue. However, when running with a kernel IRQ chip, some
> >> verification needs to be done on the host. This is done through the
> >> DT, which tells us that firmware has configured the HW for StoreEOI,
> >> but a new KVM capability would be cleaner.
> >>
> >> The last patch introduces a new 'cas' value to the capability which
> >> lets the hypervisor decide at CAS time if StoreEOI should be
> >> advertised to the guest OS. P10 compat kernel are considered safe
> >> because the OS enforces load-after-store ordering but not with P9.
> >>
> >> The StoreEOI capability is a global setting and does not take into
> >> account the characteristics of a single source. It could be an issue
> >> if StoreEOI is not supported on a specific source, of a passthrough
> >> device for instance. In that case, we could either introduce a new KVM
> >> ioctl to query the characteristics of the source at the HW level (like
> >> in v1) or deactivate StoreEOI on the machine.
> >>
> >> We are using these patches today on P10 and P9 (with a custom FW
> >> activating StoreEOI) systems to benchmark interrupt performance on
> >> large guests but there's no hurry to take them. Let's discuss this new
> >> approach.
> >>
> >> Thanks,
> >>
> >> C.
> >>
> >> Changes in v2:
> >>
> >>  - completely approach using a capability
> >>
> >> C=E9dric Le Goater (6):
> >>   spapr/xive: Introduce a StoreEOI capability
> >>   spapr/xive: Add a warning when StoreEOI is activated on POWER8 CPUs
> >>   spapr/xive: Add a warning when StoreEOI is activated on POWER9 CPUs
> >>   spapr/xive: Enforce load-after-store ordering
> >>   spapr/xive: Activate StoreEOI at the source level
> >>   spapr/xive: Introduce a new CAS value for the StoreEOI capability
> >>
> >>  include/hw/ppc/spapr.h      |  5 +++-
> >>  include/hw/ppc/spapr_xive.h |  1 +
> >>  include/hw/ppc/xive.h       |  8 +++++
> >>  target/ppc/kvm_ppc.h        |  6 ++++
> >>  hw/intc/spapr_xive.c        | 10 +++++++
> >>  hw/intc/spapr_xive_kvm.c    | 12 ++++++++
> >>  hw/intc/xive.c              |  6 ++++
> >>  hw/ppc/spapr.c              |  1 +
> >>  hw/ppc/spapr_caps.c         | 60 +++++++++++++++++++++++++++++++++++++
> >>  hw/ppc/spapr_hcall.c        |  7 +++++
> >>  hw/ppc/spapr_irq.c          |  6 ++++
> >>  target/ppc/kvm.c            | 18 +++++++++++
> >>  12 files changed, 139 insertions(+), 1 deletion(-)
> >>
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--R9dSeJxMIUBTi9Do
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7WmIACgkQbDjKyiDZ
s5I2XA//RMl3X8a6csa13kafbnRThDn0C+sXeNFQ3DszpDX5TV2jQsg7yfe5l5ps
IiZAcnj2JKUuMGSP4qynVN/9avsBeTvJ5XqeBszLm4MKm9xC8juFJjjyS6+XBKNS
emxUicycatBFu4GcHHePIFwqNjZVa+SgwiyuDeC7yB9ypZLJvBCaHM2nRDLJ51oS
O5CWeih/3fTe73t9Jk4QWYn7mbXVP09O628Fn22sAxoj8InvtTXZlNtPUXme7dG9
Sq9rKEusq3p8XOdeuC/BowNUcUmp92QdMDO/dxUrLEIh6YLs0ocG/+dp3ikaKOb8
IIdOq/79sd/4tCijqjICmApkJtQKOZIRtIALXrSx1NHqfGlENjloB0LSrVRtuAA9
EMz1NUgARtvB8CHnr5aHgAR17aKHMlx1O0o7h6qRtYM4hWe+MtGP14oyJMn2Jot7
DTe3Kw1HyU9vYYE1WEOawfVcfRvZLFjzF0CC7eII8YKeMq94o8n2PnliYMIn9WNg
zTul68/uR7Lvu1vwwgAl8yBnOUgOgsL0oq7sD0/+biLBNwEz6SuLMKg0s9VtJ+lQ
lfmbvgi1JLk9pP2ol/RZrGx+C3FsvoKfUpPJ7h91mA1oSIP9mDPFCBpWV9lpXoZA
S1/oHcUSgtAsYSg9HvvutWKaNXX8LtbVwvworRwPxOiGjFIEAxE=
=25fm
-----END PGP SIGNATURE-----

--R9dSeJxMIUBTi9Do--


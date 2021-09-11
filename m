Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D284074FD
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 06:19:34 +0200 (CEST)
Received: from localhost ([::1]:36098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOuUG-0003a0-OX
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 00:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mOuRb-0002hi-On; Sat, 11 Sep 2021 00:16:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39807 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mOuRW-0001CO-Sv; Sat, 11 Sep 2021 00:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1631333790;
 bh=Dgtt3xsuFux1y55yEWc7aYmFrEUcxzilxpTsq9C1DSs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qCj7v92I+dTGYP+IfMkd2rwygRKS4Z2L2JY1NU1YKaujoUYUi/7Dp+aqxoBk5O3vp
 LEQvyaQxSf3LEQoXwMz+1LDCuu72mXm3fJ05YaeVrO4eaLE2DJv9BA6GiFmGeTIgd4
 D+tQlWkqrwnDtiF6khOpTWRpJ4OVIr5f9skdfKMQ=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H5zvf5rpKz9sf8; Sat, 11 Sep 2021 14:16:30 +1000 (AEST)
Date: Sat, 11 Sep 2021 13:53:32 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v5 1/4] spapr: move NUMA associativity init to machine
 reset
Message-ID: <YTwoPAczTtqRH5y5@yekko>
References: <20210907002527.412013-1-danielhb413@gmail.com>
 <20210907002527.412013-2-danielhb413@gmail.com>
 <YTa0RzbdvfSQZy9+@yekko> <20210907091013.3882663b@bahia.lan>
 <YTcvn7qSqz7zaT1d@yekko>
 <29af2df8-99d1-e5ac-1290-21fe35613c6f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="B1JKmj77kJqgzZ5f"
Content-Disposition: inline
In-Reply-To: <29af2df8-99d1-e5ac-1290-21fe35613c6f@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--B1JKmj77kJqgzZ5f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2021 at 04:57:14PM -0300, Daniel Henrique Barboza wrote:
65;6402;1c>=20
>=20
> On 9/7/21 6:23 AM, David Gibson wrote:
> > On Tue, Sep 07, 2021 at 09:10:13AM +0200, Greg Kurz wrote:
> > > On Tue, 7 Sep 2021 10:37:27 +1000
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >=20
> > > > On Mon, Sep 06, 2021 at 09:25:24PM -0300, Daniel Henrique Barboza w=
rote:
> > > > > At this moment we only support one form of NUMA affinity, FORM1. =
This
> > > > > allows us to init the internal structures during machine_init(), =
and
> > > > > given that NUMA distances won't change during the guest lifetime =
we
> > > > > don't need to bother with that again.
> > > > >=20
> > > > > We're about to introduce FORM2, a new NUMA affinity mode for pSer=
ies
> > > > > guests. This means that we'll only be certain about the affinity =
mode
> > > > > being used after client architecture support. This also means tha=
t the
> > > > > guest can switch affinity modes in machine reset.
> > > > >=20
> > > > > Let's prepare the ground for the FORM2 support by moving the NUMA
> > > > > internal data init from machine_init() to machine_reset(). Change=
 the
> > > > > name to spapr_numa_associativity_reset() to make it clearer that =
this is
> > > > > a function that can be called multiple times during the guest lif=
ecycle.
> > > > > We're also simplifying its current API since this method will be =
called
> > > > > during CAS time (do_client_architecture_support()) later on and t=
here's no
> > > > > MachineState pointer already solved there.
> > > > >=20
> > > > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > >=20
> > > > Applied to ppc-for-6.2, thanks.
> > > >=20
> > >=20
> > > Even if already applied :
> > >=20
> > > Reviewed-by: Greg Kurz <groug@kaod.org>
> >=20
> > Added, thanks.
>=20
>=20
> I'm afraid this patch was deprecated by the new patch series I just
> posted.

Ok, I've removed the old patch from ppc-for-6.2.

>=20
>=20
> Thanks,
>=20
>=20
> Daniel
>=20
> >=20
> > > > > ---
> > > > >   hw/ppc/spapr.c              | 6 +++---
> > > > >   hw/ppc/spapr_numa.c         | 4 ++--
> > > > >   include/hw/ppc/spapr_numa.h | 9 +--------
> > > > >   3 files changed, 6 insertions(+), 13 deletions(-)
> > > > >=20
> > > > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > > > index d39fd4e644..8e1ff6cd10 100644
> > > > > --- a/hw/ppc/spapr.c
> > > > > +++ b/hw/ppc/spapr.c
> > > > > @@ -1621,6 +1621,9 @@ static void spapr_machine_reset(MachineStat=
e *machine)
> > > > >        */
> > > > >       spapr_irq_reset(spapr, &error_fatal);
> > > > > +    /* Reset numa_assoc_array */
> > > > > +    spapr_numa_associativity_reset(spapr);
> > > > > +
> > > > >       /*
> > > > >        * There is no CAS under qtest. Simulate one to please the =
code that
> > > > >        * depends on spapr->ov5_cas. This is especially needed to =
test device
> > > > > @@ -2808,9 +2811,6 @@ static void spapr_machine_init(MachineState=
 *machine)
> > > > >       spapr->gpu_numa_id =3D spapr_numa_initial_nvgpu_numa_id(mac=
hine);
> > > > > -    /* Init numa_assoc_array */
> > > > > -    spapr_numa_associativity_init(spapr, machine);
> > > > > -
> > > > >       if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
> > > > >           ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LO=
GICAL_3_00, 0,
> > > > >                                 spapr->max_compat_pvr)) {
> > > > > diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> > > > > index 779f18b994..9ee4b479fe 100644
> > > > > --- a/hw/ppc/spapr_numa.c
> > > > > +++ b/hw/ppc/spapr_numa.c
> > > > > @@ -155,10 +155,10 @@ static void spapr_numa_define_associativity=
_domains(SpaprMachineState *spapr)
> > > > >   }
> > > > > -void spapr_numa_associativity_init(SpaprMachineState *spapr,
> > > > > -                                   MachineState *machine)
> > > > > +void spapr_numa_associativity_reset(SpaprMachineState *spapr)
> > > > >   {
> > > > >       SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
> > > > > +    MachineState *machine =3D MACHINE(spapr);
> > > > >       int nb_numa_nodes =3D machine->numa_state->num_nodes;
> > > > >       int i, j, max_nodes_with_gpus;
> > > > >       bool using_legacy_numa =3D spapr_machine_using_legacy_numa(=
spapr);
> > > > > diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_n=
uma.h
> > > > > index 6f9f02d3de..0e457bba57 100644
> > > > > --- a/include/hw/ppc/spapr_numa.h
> > > > > +++ b/include/hw/ppc/spapr_numa.h
> > > > > @@ -16,14 +16,7 @@
> > > > >   #include "hw/boards.h"
> > > > >   #include "hw/ppc/spapr.h"
> > > > > -/*
> > > > > - * Having both SpaprMachineState and MachineState as arguments
> > > > > - * feels odd, but it will spare a MACHINE() call inside the
> > > > > - * function. spapr_machine_init() is the only caller for it, and
> > > > > - * it has both pointers resolved already.
> > > > > - */
> > > > > -void spapr_numa_associativity_init(SpaprMachineState *spapr,
> > > > > -                                   MachineState *machine);
> > > >=20
> > > > Nice additional cleanup to the signature, thanks.
> > > >=20
> > > > > +void spapr_numa_associativity_reset(SpaprMachineState *spapr);
> > > > >   void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *f=
dt, int rtas);
> > > > >   void spapr_numa_write_associativity_dt(SpaprMachineState *spapr=
, void *fdt,
> > > > >                                          int offset, int nodeid);
> > > >=20
> > >=20
> >=20
> >=20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--B1JKmj77kJqgzZ5f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE8KDkACgkQbDjKyiDZ
s5KvZA//Ret2MN3EVHiLWjf/O0+bbEQllBpQegyXeV7JRo/vtBnCYjAoTjbJK9NT
JtffTXeB9PkHl/P/bHRukzBY9f8WAffBbSYtST/SCwH7TTY4Jm/tlqmj3kjJD7qk
savJnQfaypShl02cdK8WaiO2XYg4V1KS2LGiJcN5BjBcBm47V3PCNzy6952n1o06
sl8/ShKZU280JKvfDLGli4mnyzw9x+E3HXvO67zs4GCUbjDxbVFw+ezzG79fTqgd
kSaIBwQp0QOcFh2DkmEBS8qqlkpZOqziMzX6PnN0Amo7YRm4rjgbNgLs+aC6FJXY
23d6kM0wJnULY+Z6XYYYBshzwK6t9tM6HSfw4VU3MUkEybvLTMVp7yAgSrjQekm3
Y/VOyLM17s5Qe1iUqkoa3PkgZ+cKoeqNjy1wXV0ccC+FJAWX3+PmwjiBWDSiowQQ
klOhpN9mqrzS9Q3O1V09QJ3Itoj65SWw81AWRLGp7YUGhJXDxaAZjIc1fivPntqq
W+Y5QP6mmYGbwWYWThhRpNnjwq1W3x1OZwBbEGO49DlUM4SyuKuBEX1V18Uy9/fB
rDaG2UxPV0yS0PFCSiEfz7WmYbckSvZC1JQMy8XdAPNDW5KrFbe9xVIsvG9YgTOM
us6Eo37xlvyrxzAjGnuZoV1P3aSd7zIS9c4hoO5rqmFiUtS9Fw0=
=JqqO
-----END PGP SIGNATURE-----

--B1JKmj77kJqgzZ5f--


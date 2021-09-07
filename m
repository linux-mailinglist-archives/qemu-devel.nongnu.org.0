Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB1D40321B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 03:18:06 +0200 (CEST)
Received: from localhost ([::1]:58368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNmE0-0002NC-NS
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 21:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNmAV-0001OJ-8l; Tue, 07 Sep 2021 21:14:27 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:47771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNmAQ-0008T2-Sr; Tue, 07 Sep 2021 21:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1631063648;
 bh=Ur2LX0imoX3sniZv1ELqMIASVSQEDwJcZS765t91Cm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m2hTsmQq0+fNsPI7vfu5SGONRob1FZ9Wac/CWuXehIrmqxWXQmRm8ZZwd230eeqdi
 9n9hq3mNMxzWAz9gtXNFZbb18rkGiHxtChF0hbYWHd55ls3g7SFRenFM/kxaM8RsDi
 Ev6Xqku2mg7W8SQ8laTcLLdKbq6EbhNPydoev10k=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H440c5Qp9z9t10; Wed,  8 Sep 2021 11:14:08 +1000 (AEST)
Date: Tue, 7 Sep 2021 19:23:43 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v5 1/4] spapr: move NUMA associativity init to machine
 reset
Message-ID: <YTcvn7qSqz7zaT1d@yekko>
References: <20210907002527.412013-1-danielhb413@gmail.com>
 <20210907002527.412013-2-danielhb413@gmail.com>
 <YTa0RzbdvfSQZy9+@yekko> <20210907091013.3882663b@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bQqugg2HUe4G0D0H"
Content-Disposition: inline
In-Reply-To: <20210907091013.3882663b@bahia.lan>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bQqugg2HUe4G0D0H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 09:10:13AM +0200, Greg Kurz wrote:
> On Tue, 7 Sep 2021 10:37:27 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Sep 06, 2021 at 09:25:24PM -0300, Daniel Henrique Barboza wrote:
> > > At this moment we only support one form of NUMA affinity, FORM1. This
> > > allows us to init the internal structures during machine_init(), and
> > > given that NUMA distances won't change during the guest lifetime we
> > > don't need to bother with that again.
> > >=20
> > > We're about to introduce FORM2, a new NUMA affinity mode for pSeries
> > > guests. This means that we'll only be certain about the affinity mode
> > > being used after client architecture support. This also means that the
> > > guest can switch affinity modes in machine reset.
> > >=20
> > > Let's prepare the ground for the FORM2 support by moving the NUMA
> > > internal data init from machine_init() to machine_reset(). Change the
> > > name to spapr_numa_associativity_reset() to make it clearer that this=
 is
> > > a function that can be called multiple times during the guest lifecyc=
le.
> > > We're also simplifying its current API since this method will be call=
ed
> > > during CAS time (do_client_architecture_support()) later on and there=
's no
> > > MachineState pointer already solved there.
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> >=20
> > Applied to ppc-for-6.2, thanks.
> >=20
>=20
> Even if already applied :
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>

Added, thanks.

> > > ---
> > >  hw/ppc/spapr.c              | 6 +++---
> > >  hw/ppc/spapr_numa.c         | 4 ++--
> > >  include/hw/ppc/spapr_numa.h | 9 +--------
> > >  3 files changed, 6 insertions(+), 13 deletions(-)
> > >=20
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index d39fd4e644..8e1ff6cd10 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -1621,6 +1621,9 @@ static void spapr_machine_reset(MachineState *m=
achine)
> > >       */
> > >      spapr_irq_reset(spapr, &error_fatal);
> > > =20
> > > +    /* Reset numa_assoc_array */
> > > +    spapr_numa_associativity_reset(spapr);
> > > +
> > >      /*
> > >       * There is no CAS under qtest. Simulate one to please the code =
that
> > >       * depends on spapr->ov5_cas. This is especially needed to test =
device
> > > @@ -2808,9 +2811,6 @@ static void spapr_machine_init(MachineState *ma=
chine)
> > > =20
> > >      spapr->gpu_numa_id =3D spapr_numa_initial_nvgpu_numa_id(machine);
> > > =20
> > > -    /* Init numa_assoc_array */
> > > -    spapr_numa_associativity_init(spapr, machine);
> > > -
> > >      if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
> > >          ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL=
_3_00, 0,
> > >                                spapr->max_compat_pvr)) {
> > > diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> > > index 779f18b994..9ee4b479fe 100644
> > > --- a/hw/ppc/spapr_numa.c
> > > +++ b/hw/ppc/spapr_numa.c
> > > @@ -155,10 +155,10 @@ static void spapr_numa_define_associativity_dom=
ains(SpaprMachineState *spapr)
> > > =20
> > >  }
> > > =20
> > > -void spapr_numa_associativity_init(SpaprMachineState *spapr,
> > > -                                   MachineState *machine)
> > > +void spapr_numa_associativity_reset(SpaprMachineState *spapr)
> > >  {
> > >      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
> > > +    MachineState *machine =3D MACHINE(spapr);
> > >      int nb_numa_nodes =3D machine->numa_state->num_nodes;
> > >      int i, j, max_nodes_with_gpus;
> > >      bool using_legacy_numa =3D spapr_machine_using_legacy_numa(spapr=
);
> > > diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
> > > index 6f9f02d3de..0e457bba57 100644
> > > --- a/include/hw/ppc/spapr_numa.h
> > > +++ b/include/hw/ppc/spapr_numa.h
> > > @@ -16,14 +16,7 @@
> > >  #include "hw/boards.h"
> > >  #include "hw/ppc/spapr.h"
> > > =20
> > > -/*
> > > - * Having both SpaprMachineState and MachineState as arguments
> > > - * feels odd, but it will spare a MACHINE() call inside the
> > > - * function. spapr_machine_init() is the only caller for it, and
> > > - * it has both pointers resolved already.
> > > - */
> > > -void spapr_numa_associativity_init(SpaprMachineState *spapr,
> > > -                                   MachineState *machine);
> >=20
> > Nice additional cleanup to the signature, thanks.
> >=20
> > > +void spapr_numa_associativity_reset(SpaprMachineState *spapr);
> > >  void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, i=
nt rtas);
> > >  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, voi=
d *fdt,
> > >                                         int offset, int nodeid);
> >=20
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bQqugg2HUe4G0D0H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE3L5wACgkQbDjKyiDZ
s5L38BAAmuF8us9HRbBbA7DddkLg311K7nHoKh3KjA/EZM90yI6m6Gbuaf0HdJCI
szkz0ZaTbMBJU7y0F8OJe7uGXTUT8DqVM2imh+5cj2Fu5CqBIQpZMeiaeWr2QH2u
fDIOej8b+VJ4f+aYjN+uv3ediVTqMFHw8qvCOmuxLxKNhALCb+D1Wa/UHJnoUfuR
wEg4UaovNfo3H7NH7GJKDtsVRSX2ar00l/JhkjOXACDBpSWT1XxBNul6WpwqM1LJ
RteffUvO33dGkvYCF2ej+dIUzK3LSXG0cVI4DCgQXkLWiMfuMqGkprLrLQH6E9yA
mNkOVuHx/r3DerufZp1s4I4t726QQs2VxvtjFlN31otGkmpJJ053GIENKjsaCsTV
Eg+hk6Z4fASNMLSM1uyCg4uoiD2z6I4kZiEQkmI087Zn56NEGTJm/6HECaCCwUS2
gRYEVI+SwnnwlqJYNGBN35X4aDfPhSjFQ/LsmDmHIW15cnrhfCLeC1DAlpFXgV8P
ilKiQSATwCpZj8zZCGv1oaeaXoMmge95U1lVJvnB+qhaWqpfvANpu+DdHt0+WTJ0
FIsNn3ARFso8Hab5eHi06iYxqnUr4g29gXb8SuVGe7ZnVlPY4ijGxLJCPXBTLrKz
0eVl0gs7MJeKLvs2940wwtkRgPM6awxlrt4zfAFlrKRbcHMLkfE=
=e/HT
-----END PGP SIGNATURE-----

--bQqugg2HUe4G0D0H--


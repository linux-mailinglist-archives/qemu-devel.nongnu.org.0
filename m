Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48E74023DA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:12:16 +0200 (CEST)
Received: from localhost ([::1]:55276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVHE-0005Ib-19
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mNVFq-0003aE-TU
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 03:10:50 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:31545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mNVFp-0002fj-BD
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 03:10:50 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-gCeq6xD_Ny2s7N85RAJpGw-1; Tue, 07 Sep 2021 03:10:18 -0400
X-MC-Unique: gCeq6xD_Ny2s7N85RAJpGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA7D9835DE0;
 Tue,  7 Sep 2021 07:10:16 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9ED619729;
 Tue,  7 Sep 2021 07:10:15 +0000 (UTC)
Date: Tue, 7 Sep 2021 09:10:13 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v5 1/4] spapr: move NUMA associativity init to machine
 reset
Message-ID: <20210907091013.3882663b@bahia.lan>
In-Reply-To: <YTa0RzbdvfSQZy9+@yekko>
References: <20210907002527.412013-1-danielhb413@gmail.com>
 <20210907002527.412013-2-danielhb413@gmail.com>
 <YTa0RzbdvfSQZy9+@yekko>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vc1Qp03E4PfA6Ag=VpBeH.f";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

--Sig_/Vc1Qp03E4PfA6Ag=VpBeH.f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Sep 2021 10:37:27 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Sep 06, 2021 at 09:25:24PM -0300, Daniel Henrique Barboza wrote:
> > At this moment we only support one form of NUMA affinity, FORM1. This
> > allows us to init the internal structures during machine_init(), and
> > given that NUMA distances won't change during the guest lifetime we
> > don't need to bother with that again.
> >=20
> > We're about to introduce FORM2, a new NUMA affinity mode for pSeries
> > guests. This means that we'll only be certain about the affinity mode
> > being used after client architecture support. This also means that the
> > guest can switch affinity modes in machine reset.
> >=20
> > Let's prepare the ground for the FORM2 support by moving the NUMA
> > internal data init from machine_init() to machine_reset(). Change the
> > name to spapr_numa_associativity_reset() to make it clearer that this is
> > a function that can be called multiple times during the guest lifecycle.
> > We're also simplifying its current API since this method will be called
> > during CAS time (do_client_architecture_support()) later on and there's=
 no
> > MachineState pointer already solved there.
> >=20
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>=20
> Applied to ppc-for-6.2, thanks.
>=20

Even if already applied :

Reviewed-by: Greg Kurz <groug@kaod.org>

> > ---
> >  hw/ppc/spapr.c              | 6 +++---
> >  hw/ppc/spapr_numa.c         | 4 ++--
> >  include/hw/ppc/spapr_numa.h | 9 +--------
> >  3 files changed, 6 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index d39fd4e644..8e1ff6cd10 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -1621,6 +1621,9 @@ static void spapr_machine_reset(MachineState *mac=
hine)
> >       */
> >      spapr_irq_reset(spapr, &error_fatal);
> > =20
> > +    /* Reset numa_assoc_array */
> > +    spapr_numa_associativity_reset(spapr);
> > +
> >      /*
> >       * There is no CAS under qtest. Simulate one to please the code th=
at
> >       * depends on spapr->ov5_cas. This is especially needed to test de=
vice
> > @@ -2808,9 +2811,6 @@ static void spapr_machine_init(MachineState *mach=
ine)
> > =20
> >      spapr->gpu_numa_id =3D spapr_numa_initial_nvgpu_numa_id(machine);
> > =20
> > -    /* Init numa_assoc_array */
> > -    spapr_numa_associativity_init(spapr, machine);
> > -
> >      if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
> >          ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3=
_00, 0,
> >                                spapr->max_compat_pvr)) {
> > diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> > index 779f18b994..9ee4b479fe 100644
> > --- a/hw/ppc/spapr_numa.c
> > +++ b/hw/ppc/spapr_numa.c
> > @@ -155,10 +155,10 @@ static void spapr_numa_define_associativity_domai=
ns(SpaprMachineState *spapr)
> > =20
> >  }
> > =20
> > -void spapr_numa_associativity_init(SpaprMachineState *spapr,
> > -                                   MachineState *machine)
> > +void spapr_numa_associativity_reset(SpaprMachineState *spapr)
> >  {
> >      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
> > +    MachineState *machine =3D MACHINE(spapr);
> >      int nb_numa_nodes =3D machine->numa_state->num_nodes;
> >      int i, j, max_nodes_with_gpus;
> >      bool using_legacy_numa =3D spapr_machine_using_legacy_numa(spapr);
> > diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
> > index 6f9f02d3de..0e457bba57 100644
> > --- a/include/hw/ppc/spapr_numa.h
> > +++ b/include/hw/ppc/spapr_numa.h
> > @@ -16,14 +16,7 @@
> >  #include "hw/boards.h"
> >  #include "hw/ppc/spapr.h"
> > =20
> > -/*
> > - * Having both SpaprMachineState and MachineState as arguments
> > - * feels odd, but it will spare a MACHINE() call inside the
> > - * function. spapr_machine_init() is the only caller for it, and
> > - * it has both pointers resolved already.
> > - */
> > -void spapr_numa_associativity_init(SpaprMachineState *spapr,
> > -                                   MachineState *machine);
>=20
> Nice additional cleanup to the signature, thanks.
>=20
> > +void spapr_numa_associativity_reset(SpaprMachineState *spapr);
> >  void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int=
 rtas);
> >  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void =
*fdt,
> >                                         int offset, int nodeid);
>=20


--Sig_/Vc1Qp03E4PfA6Ag=VpBeH.f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmE3EFUACgkQcdTV5YIv
c9aABg//RwZ2bbXf2PYEY6qgLH7GTA+8IcvzRq5kadiq0FdEhSuGu1AwnWx/OGgF
7YbFFWOS3aQz4HIV4dKW5fyGQgqfxGOldm8mrekqzkrYmFHtXYN80TIVBvGaNDOy
VBd7LIj1OpXM5vyo995VnIMsj1i3rVL21XZFlq5lY0sfYxkQ0aNOxpnTb/+/4e8a
y8Y502CIOfUSzs4kbEu8eif+Fgtt1d0N6cVSRtD2iVmdBeonJMoQIG+k9PfzdBlj
QlsB1DxSuzxMAmJ0jRX8EzVQbAkke6Pv+l8R2Yxheqmpspyj269gVQcMx76bxxcV
t521qGepdOokDO2omqVBipLh5l92ZSWArwudLYbfu7IIh5sKG98BY/wMXRGJJ/SB
c3Ql6n/jlLLS6kHY1Unwnv/YJFiK9+exj8kbva7vKnnMMyGASIWKzpz8gu2brtdj
FCz3S+1qqBi8KUYuKbrAvzEDNKDaD2C6CinM7vf5Vj6Gn00RT6BKYyo0Wri3n++V
yJ7SLeRuN0U2feyyx2nX6E8roYR9VZiFsD3/Y015Qn/MIh6CxR24rusFNnFXJ9Av
oZ+yf/2qimi6R68nP/l+FfYcnehThc9qInBlHJu4vwgeIi7f9QWbT/4yNrW3TWLn
BBXGDI1MeTIOroKqW830dBCQkhRwd5J4lvlUpxDXbDMAznJjx7g=
=2QAQ
-----END PGP SIGNATURE-----

--Sig_/Vc1Qp03E4PfA6Ag=VpBeH.f--



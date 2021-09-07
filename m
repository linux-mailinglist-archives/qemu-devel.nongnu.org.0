Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C068B4021C0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 03:13:21 +0200 (CEST)
Received: from localhost ([::1]:60862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPfs-0001oA-N6
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 21:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNPXD-0004o0-85; Mon, 06 Sep 2021 21:04:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33341 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNPXA-0005xF-3v; Mon, 06 Sep 2021 21:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630976654;
 bh=c0y8EMQecJD13sieTR/lFMr3+hcRXksXqXX5VtiRRN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YETXudR4BbEnMX2mNzQF04FHFsPTOlw90Fabs/AoZsRbjAHrdlYVilgyb+0rvNqeV
 2KNk80EjKiiuwRcNjaIbcc3XTIGdqAYNQYvOXc2xKeIxE14BquMuzvIpE7sasRIjL6
 kzauJPdSiM+hMSxILXD8sDklbdAccKAD8jxZwLbE=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H3Rqf60lbz9shn; Tue,  7 Sep 2021 11:04:14 +1000 (AEST)
Date: Tue, 7 Sep 2021 10:37:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v5 1/4] spapr: move NUMA associativity init to machine
 reset
Message-ID: <YTa0RzbdvfSQZy9+@yekko>
References: <20210907002527.412013-1-danielhb413@gmail.com>
 <20210907002527.412013-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EPz0ftKJ3O51xTVe"
Content-Disposition: inline
In-Reply-To: <20210907002527.412013-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EPz0ftKJ3O51xTVe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 06, 2021 at 09:25:24PM -0300, Daniel Henrique Barboza wrote:
> At this moment we only support one form of NUMA affinity, FORM1. This
> allows us to init the internal structures during machine_init(), and
> given that NUMA distances won't change during the guest lifetime we
> don't need to bother with that again.
>=20
> We're about to introduce FORM2, a new NUMA affinity mode for pSeries
> guests. This means that we'll only be certain about the affinity mode
> being used after client architecture support. This also means that the
> guest can switch affinity modes in machine reset.
>=20
> Let's prepare the ground for the FORM2 support by moving the NUMA
> internal data init from machine_init() to machine_reset(). Change the
> name to spapr_numa_associativity_reset() to make it clearer that this is
> a function that can be called multiple times during the guest lifecycle.
> We're also simplifying its current API since this method will be called
> during CAS time (do_client_architecture_support()) later on and there's no
> MachineState pointer already solved there.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.2, thanks.

> ---
>  hw/ppc/spapr.c              | 6 +++---
>  hw/ppc/spapr_numa.c         | 4 ++--
>  include/hw/ppc/spapr_numa.h | 9 +--------
>  3 files changed, 6 insertions(+), 13 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index d39fd4e644..8e1ff6cd10 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1621,6 +1621,9 @@ static void spapr_machine_reset(MachineState *machi=
ne)
>       */
>      spapr_irq_reset(spapr, &error_fatal);
> =20
> +    /* Reset numa_assoc_array */
> +    spapr_numa_associativity_reset(spapr);
> +
>      /*
>       * There is no CAS under qtest. Simulate one to please the code that
>       * depends on spapr->ov5_cas. This is especially needed to test devi=
ce
> @@ -2808,9 +2811,6 @@ static void spapr_machine_init(MachineState *machin=
e)
> =20
>      spapr->gpu_numa_id =3D spapr_numa_initial_nvgpu_numa_id(machine);
> =20
> -    /* Init numa_assoc_array */
> -    spapr_numa_associativity_init(spapr, machine);
> -
>      if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
>          ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_0=
0, 0,
>                                spapr->max_compat_pvr)) {
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 779f18b994..9ee4b479fe 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -155,10 +155,10 @@ static void spapr_numa_define_associativity_domains=
(SpaprMachineState *spapr)
> =20
>  }
> =20
> -void spapr_numa_associativity_init(SpaprMachineState *spapr,
> -                                   MachineState *machine)
> +void spapr_numa_associativity_reset(SpaprMachineState *spapr)
>  {
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
> +    MachineState *machine =3D MACHINE(spapr);
>      int nb_numa_nodes =3D machine->numa_state->num_nodes;
>      int i, j, max_nodes_with_gpus;
>      bool using_legacy_numa =3D spapr_machine_using_legacy_numa(spapr);
> diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
> index 6f9f02d3de..0e457bba57 100644
> --- a/include/hw/ppc/spapr_numa.h
> +++ b/include/hw/ppc/spapr_numa.h
> @@ -16,14 +16,7 @@
>  #include "hw/boards.h"
>  #include "hw/ppc/spapr.h"
> =20
> -/*
> - * Having both SpaprMachineState and MachineState as arguments
> - * feels odd, but it will spare a MACHINE() call inside the
> - * function. spapr_machine_init() is the only caller for it, and
> - * it has both pointers resolved already.
> - */
> -void spapr_numa_associativity_init(SpaprMachineState *spapr,
> -                                   MachineState *machine);

Nice additional cleanup to the signature, thanks.

> +void spapr_numa_associativity_reset(SpaprMachineState *spapr);
>  void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int r=
tas);
>  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *f=
dt,
>                                         int offset, int nodeid);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EPz0ftKJ3O51xTVe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE2tEcACgkQbDjKyiDZ
s5INrw/8CJs58SDaA80HJ7dryzFcO41vGrRGIHr1gxZzk0+1E3jcSU7vTB46Mecz
1jbO++g2LalcY7JozLY+BQ+u/P6zd0Tf7q74No8mvDSzwoFpNPDcI4zx0LoCWLTx
zBs9SZ60/XaJq6z74Tg+YuV0PT+AnZxFJXP6qBl5Eyon58qPQPo2W6yhdxriGwVa
YOl2XWF5g1X1RNdFWSc8Adq80nVA1fK++xeSn6T5WX6it9VGo2HRYDI6yA/n7qD8
AJaLJUIyOTITb7bhS4kFpy88bn0xX05TU6VOesclBLA2NBkBguDiVv4rpq6O0+J4
Vi+078R0dt3xbIC0XilrISej4a+649m4rHkONEeG4uOtJwxCDebej0mYrUaHdKSv
uJybC3+m84wkXd87DHklEYLEuExCJQKbcRdgsNAcaDzhFDuB5C2rBMmmHNZQHDVX
h0hyFeWh9ro0p2CtTTxF/YJAdnwnp1DwXkgG7K7WLx27ldCLuOdsJLIHfRYSC0wb
4QQezuLw1EDyhClMpa5IfSsg+w20kbzIq4yziOGDLzUhArCswgvWfzHvPj6ZF3TI
aPDXke9HknRZmWPoRNorRfJJ6wlSO2e3BqskmCeZYjxyqFTr6pQ3omQoDm1H4th7
W3LIKZYZiNAfTAwaN2d0gbuSFWJ9m+WJjpOQBbki76Bo3m1O6Ss=
=in8I
-----END PGP SIGNATURE-----

--EPz0ftKJ3O51xTVe--


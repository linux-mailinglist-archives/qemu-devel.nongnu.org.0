Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AA62C36D2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 03:42:06 +0100 (CET)
Received: from localhost ([::1]:47958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khkkv-0005Ch-J9
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 21:42:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1khkjR-0004Er-IO; Tue, 24 Nov 2020 21:40:33 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:47903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1khkjN-0004h4-JM; Tue, 24 Nov 2020 21:40:33 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CglVb4qvjz9sT6; Wed, 25 Nov 2020 13:40:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606272023;
 bh=PhEWN3NCWykrfvUg+VApwdPPuHQw2bFfLdTNxunjMg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X81vL0BWCAt6NeGi5de3yvwsi2CO0yKYiuk52v7uBmgHgL73x4McyXmE3625ad25P
 YIVKd0Sy1JpXyHRF2CpQDTtDsQTHsH6WNqPl0EMxNhKAKExNH0ZD8UusyiQQ+aAIsi
 FbhRDpjSDRJDlsFLhLeWXkmxSGt3KaEqV140GQjE=
Date: Wed, 25 Nov 2020 13:39:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 4/9] spapr: Set compat mode in spapr_reset_vcpu()
Message-ID: <20201125023947.GE521467@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-5-groug@kaod.org>
 <20201123051130.GL521467@yekko.fritz.box>
 <20201123125108.2118048e@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0Zc0bQF+fxzVVQOT"
Content-Disposition: inline
In-Reply-To: <20201123125108.2118048e@bahia.lan>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0Zc0bQF+fxzVVQOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2020 at 12:51:08PM +0100, Greg Kurz wrote:
> On Mon, 23 Nov 2020 16:11:30 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Sat, Nov 21, 2020 at 12:42:03AM +0100, Greg Kurz wrote:
> > > When it comes to resetting the compat mode of the vCPUS, there are
> > > two situations to consider:
> > > (1) machine reset should set the compat mode back to the machine defa=
ult,
> > >     ie. spapr->max_compat_pvr
> > > (2) hot plugged vCPUs should set their compat mode to mach the boot v=
CPU,
> > >     ie. POWERPC_CPU(first_cpu)->compat_pvr
> > >=20
> > > This is currently handled in two separate places: globally for all vC=
PUs
> > > from the machine reset code for (1) and for each thread of a core from
> > > the hotplug path for (2).
> > >=20
> > > Since the machine reset code already resets all vCPUs, starting with =
boot
> > > vCPU, consolidate the logic in spapr_reset_vcpu(). Special case the b=
oot
> > > vCPU so that it resets its compat mode back to the machine default. A=
ny
> > > other vCPU just need to match the compat mode of the boot vCPU.
> > >=20
> > > Failing to set the compat mode during machine reset is a fatal error,
> > > but not for hot plugged vCPUs. This is arguable because if we've been
> > > able to set the boot vCPU compat mode at CAS or during machine reset,
> > > it should definitely not fail for other vCPUs. Since spapr_reset_vcpu=
()
> > > already has a fatal error path for kvm_check_mmu() failures, do the
> > > same for ppc_set_compat().
> > >=20
> > > This gets rid of an error path in spapr_core_plug(). It will allow
> > > further simplifications.
> > >=20
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > ---
> > >  hw/ppc/spapr.c          | 16 ----------------
> > >  hw/ppc/spapr_cpu_core.c | 13 +++++++++++++
> > >  2 files changed, 13 insertions(+), 16 deletions(-)
> > >=20
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index f58f77389e8e..da7586f548df 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -1606,8 +1606,6 @@ static void spapr_machine_reset(MachineState *m=
achine)
> > >      spapr_ovec_cleanup(spapr->ov5_cas);
> > >      spapr->ov5_cas =3D spapr_ovec_new();
> > > =20
> > > -    ppc_set_compat_all(spapr->max_compat_pvr, &error_fatal);
> > > -
> > >      /*
> > >       * This is fixing some of the default configuration of the XIVE
> > >       * devices. To be called after the reset of the machine devices.
> > > @@ -3785,20 +3783,6 @@ static void spapr_core_plug(HotplugHandler *ho=
tplug_dev, DeviceState *dev,
> > > =20
> > >      core_slot->cpu =3D OBJECT(dev);
> > > =20
> > > -    /*
> > > -     * Set compatibility mode to match the boot CPU, which was eithe=
r set
> > > -     * by the machine reset code or by CAS.
> > > -     */
> > > -    if (hotplugged) {
> > > -        for (i =3D 0; i < cc->nr_threads; i++) {
> > > -            if (ppc_set_compat(core->threads[i],
> > > -                               POWERPC_CPU(first_cpu)->compat_pvr,
> > > -                               errp) < 0) {
> > > -                return;
> > > -            }
> > > -        }
> > > -    }
> > > -
> > >      if (smc->pre_2_10_has_unused_icps) {
> > >          for (i =3D 0; i < cc->nr_threads; i++) {
> > >              cs =3D CPU(core->threads[i]);
> > > diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> > > index 2f7dc3c23ded..17741a3fb77f 100644
> > > --- a/hw/ppc/spapr_cpu_core.c
> > > +++ b/hw/ppc/spapr_cpu_core.c
> > > @@ -27,6 +27,7 @@
> > > =20
> > >  static void spapr_reset_vcpu(PowerPCCPU *cpu)
> > >  {
> > > +    PowerPCCPU *first_ppc_cpu =3D POWERPC_CPU(first_cpu);
> > >      CPUState *cs =3D CPU(cpu);
> > >      CPUPPCState *env =3D &cpu->env;
> > >      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> > > @@ -69,6 +70,18 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
> > >      kvm_check_mmu(cpu, &error_fatal);
> > > =20
> > >      spapr_irq_cpu_intc_reset(spapr, cpu);
> > > +
> > > +    /*
> > > +     * The boot CPU is only reset during machine reset : reset its
> > > +     * compatibility mode to the machine default. For other CPUs,
> > > +     * either cold plugged or hot plugged, set the compatibility mode
> > > +     * to match the boot CPU, which was either set by the machine re=
set
> > > +     * code or by CAS.
> > > +     */
> > > +    ppc_set_compat(cpu,
> > > +                   cpu =3D=3D first_ppc_cpu ?
> > > +                   spapr->max_compat_pvr : first_ppc_cpu->compat_pvr,
> > > +                   &error_fatal);
> >=20
> > This assumes that when it is called for a non-boot CPU, it has already
> > been called for the boot CPU..  Are we certain that's guaranteed by
> > the sequence of reset calls during a full machine reset?
> >=20
>=20
> This happens to be the case. Basically because the boot CPU core
> is created (including registering its reset handler) first and
> qemu_devices_reset() calls handlers in the same order they were
> registered.

Right, I assumed it works for now, but it seems rather fragile, since
I'm not sure we're relying on guaranteed properties of the interface.
Is there any way we could at least assert() if things are called out
of order?

>=20
> > >  }
> > > =20
> > >  void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip,
> >=20
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0Zc0bQF+fxzVVQOT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+9w/AACgkQbDjKyiDZ
s5IkHxAAzTjHx76BoVhnjNwc2LiTQTDuReiUwbMfZ0X4BWqWVVZEVzwo/B0cP7Gu
AIiCwtzKC73fNLp6dK25udwMPF93VURSzg5+Q8wcLi8zpx2Ohkc1eimTNnFxaDcS
byLDL6+GVRdh4fklm+Q8aQaPJhmxWAxRoWR9JmCbdW+SdCI8UPr8ltt7yDOektM4
47m1935DLGCE80kF/TK1YlAx82Wy9I04sP2UI81ARAo7Sv2poSUI10TSSFXoU9GA
3clGprMsVUWm+As+BwiMqh9TUivDzU2nt3QqCtV+qAp780diRfK3jKtoJNznb8Hu
+W319W8mPZo1ag7wCK3DLvGM6UO355tsgxOuicnhQCLyRlHAyuqzEZCCjI5he1f5
s84RGtcRdQkttxMFbytsizn9M/QP/AjFJmkC10yW+aw1SW4Eq9PD3OMa0jdOcLOK
28HqYQMSKv0Dx32ou6z4ZrwFm+X1993JxNzchEDK/nBLW2uj+5p9+kpalKojxkl4
qzGKAyLC8Msb/ua/9H5IQs465v7WRhT/VLKjoxio5rX8hwLN6XdI6dgRXsvX5Rkn
IGFv19G0FkntjdNceqddN+QDjf6fqRniODkgbg75GrB1jpb28k4eVOB4GpLP9JpO
fF0Lk2n+/8C0Jk0mgTViOrEmxbpB+jwp+oOtHFoZ3cgS0orjOaI=
=EKxS
-----END PGP SIGNATURE-----

--0Zc0bQF+fxzVVQOT--


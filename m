Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8456F2F97E2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 03:40:03 +0100 (CET)
Received: from localhost ([::1]:34796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1KSY-0002fB-JG
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 21:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1KQg-0000w6-Fn; Sun, 17 Jan 2021 21:38:12 -0500
Received: from ozlabs.org ([203.11.71.1]:58833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1KQd-0001RS-Nj; Sun, 17 Jan 2021 21:38:06 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DJwtg49y3z9sVs; Mon, 18 Jan 2021 13:37:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610937467;
 bh=+MMSRJXWcWbfqBjqShQ0IbIaEhxI/BMZZC3ZFnG6Zho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xqs4LHbcl8A6sYWFMWG2Vy7XNzH6fu63mFKvlXQhVOorN3kEkG2b1tMtD6T7qKaBG
 m5G+dJRKYHfqbg9t2PTe5CqONSOk0GGLjlLF/TK2lQm1rPttx0jgxMmLju+nwYVY0i
 /MNt6Yp9TDd9cWBAuMJzVXLVeSuYUSSLrHPlkDY0=
Date: Mon, 18 Jan 2021 12:12:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v1 7/7] spapr.c: consider CPU core online state before
 allowing unplug
Message-ID: <20210118011203.GC2089552@yekko.fritz.box>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
 <20210114180628.1675603-8-danielhb413@gmail.com>
 <20210115182216.6dccadee@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jousvV0MzM2p6OtC"
Content-Disposition: inline
In-Reply-To: <20210115182216.6dccadee@bahia.lan>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Xujun Ma <xuma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jousvV0MzM2p6OtC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 06:22:16PM +0100, Greg Kurz wrote:
> On Thu, 14 Jan 2021 15:06:28 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>=20
> > The only restriction we have when unplugging CPUs is to forbid unplug of
> > the boot cpu core. spapr_core_unplug_possible() does not contemplate the
>=20
> I can't remember why this restriction was introduced in the first place...
> This should be investigated and documented if the limitation still stands.
>=20
> > possibility of some cores being offlined by the guest, meaning that we'=
re
> > rolling the dice regarding on whether we're unplugging the last online
> > CPU core the guest has.
> >=20
>=20
> Trying to unplug the last CPU is obviously something that deserves
> special care. LoPAPR is quite explicit on the outcome : this should
> terminate the partition.
>=20
> 13.7.4.1.1. Isolation of CPUs
>=20
> The isolation of a CPU, in all cases, is preceded by the stop-self
> RTAS function for all processor threads, and the OS insures that all
> the CPU=E2=80=99s threads are in the RTAS stopped state prior to isolatin=
g the
> CPU. Isolation of a processor that is not stopped produces unpredictable
> results. The stopping of the last processor thread of a LPAR partition
> effectively kills the partition, and at that point, ownership of all
> partition resources reverts to the platform firmware.
>=20
> R1-13.7.4.1.1-1. For the LRDR option: Prior to issuing the RTAS
> set-indicator specifying isolate isolation-state of a CPU DR
> connector type, all the CPU threads must be in the RTAS stopped
> state.
>=20
> R1-13.7.4.1.1-2. For the LRDR option: Stopping of the last processor
> thread of a LPAR partition with the stop-self RTAS function, must kill
> the partition, with ownership of all partition resources reverting to
> the platform firmware.
>=20
> This is clearly not how things work today : linux doesn't call
> "stop-self" on the last vCPU and even if it did, QEMU doesn't
> terminate the VM.

> If there's a valid reason to not implement this PAPR behavior, I'd like
> it to be documented.

So, we should implement this in QEMU - if you stop-self the last
thread, it should be the equivalent of a power off.  Linux not ever
doing that probably makes sense - it wants you to encourage you to
shut down properly for data safety.

> > If we hit the jackpot, we're going to detach the core DRC and pulse the
> > hotplug IRQ, but the guest OS will refuse to release the CPU. Our
> > spapr_core_unplug() DRC release callback will never be called and the C=
PU
> > core object will keep existing in QEMU. No error message will be sent
> > to the user, but the CPU core wasn't unplugged from the guest.
> >=20
> > If the guest OS onlines the CPU core again we won't be able to hotunplu=
g it
> > either. 'dmesg' inside the guest will report a failed attempt to offlin=
e an
> > unknown CPU:
> >=20
> > [  923.003994] pseries-hotplug-cpu: Failed to offline CPU <NULL>, rc: -=
16
> >=20
> > This is the result of stopping the DRC state transition in the middle i=
n the
> > first failed attempt.
> >=20
>=20
> Yes, at this point only a machine reset can fix things up.
>=20
> Given this is linux's choice not to call "stop-self" as it should do, I'm=
 not
> super fan of hardcoding this logic in QEMU, unless there are really good
> reasons to do so.

Uh.. sorry I don't follow how linux is doing something wrong here.

> > We can avoid this, and potentially other bad things from happening, if =
we
> > avoid to attempt the unplug altogether in this scenario. Let's check for
> > the online/offline state of the CPU cores in the guest before allowing
> > the hotunplug, and forbid removing a CPU core if it's the last one onli=
ne
> > in the guest.
> >=20
> > Reported-by: Xujun Ma <xuma@redhat.com>
> > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1911414
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
> >  hw/ppc/spapr.c | 39 ++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 38 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index a2f01c21aa..d269dcd102 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -3709,9 +3709,16 @@ static void spapr_core_unplug(HotplugHandler *ho=
tplug_dev, DeviceState *dev)
> >  static int spapr_core_unplug_possible(HotplugHandler *hotplug_dev, CPU=
Core *cc,
> >                                        Error **errp)
> >  {
> > +    CPUArchId *core_slot;
> > +    SpaprCpuCore *core;
> > +    PowerPCCPU *cpu;
> > +    CPUState *cs;
> > +    bool last_cpu_online =3D true;
> >      int index;
> > =20
> > -    if (!spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id, &index=
)) {
> > +    core_slot =3D spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_i=
d,
> > +                                    &index);
> > +    if (!core_slot) {
> >          error_setg(errp, "Unable to find CPU core with core-id: %d",
> >                     cc->core_id);
> >          return -1;
> > @@ -3722,6 +3729,36 @@ static int spapr_core_unplug_possible(HotplugHan=
dler *hotplug_dev, CPUCore *cc,
> >          return -1;
> >      }
> > =20
> > +    /* Allow for any non-boot CPU core to be unplugged if already offl=
ine */
> > +    core =3D SPAPR_CPU_CORE(core_slot->cpu);
> > +    cs =3D CPU(core->threads[0]);
> > +    if (cs->halted) {
> > +        return 0;
> > +    }
> > +
> > +    /*
> > +     * Do not allow core unplug if it's the last core online.
> > +     */
> > +    cpu =3D POWERPC_CPU(cs);
> > +    CPU_FOREACH(cs) {
> > +        PowerPCCPU *c =3D POWERPC_CPU(cs);
> > +
> > +        if (c =3D=3D cpu) {
> > +            continue;
> > +        }
> > +
> > +        if (!cs->halted) {
> > +            last_cpu_online =3D false;
> > +            break;
> > +        }
> > +    }
> > +
> > +    if (last_cpu_online) {
> > +        error_setg(errp, "Unable to unplug CPU core with core-id %d: i=
t is "
> > +                   "the only CPU core online in the guest", cc->core_i=
d);
> > +        return -1;
> > +    }
> > +
> >      return 0;
> >  }
> > =20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jousvV0MzM2p6OtC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAE4GEACgkQbDjKyiDZ
s5JamxAApVCUIYoUGYkoz/em337Fhlrpx2POnGfP2muG9AJ74GBEdxAPNQ6SP9fa
Ni2ibfAJtPi6p0DGyJYwI59GqhYNLZDMoB9czVwvpGeP5NXu8PAGLDwaH8O1/k4H
eHx9orYGIIyJ55FpzcEYnuGCvid/bVqsyKCgvGLFBFOi4kH49YfjGWplFG/z7yZN
qWJAeLiYlWQLKTFqCbhiGGGkitjuCnHOBKe6J7zKCoksuCQNH5PSC+cpPwFf994j
NeF35FY6ogBWx8+21hdTxN1hqCFpWimjR4Q12/qppXq8k/L1AwqTGeqRSPuSG77j
ep4AWgbDqZqFzgPTHtUFixepGi3wSRlJcNfmwe8w5daSu8P0HlEP4+pB89YEckLl
y05jaJVGNLwuyIcTJbC0pMMulofjezQ/wYuy4dvhZF8cqoY4ppga5efqTs+E+4Oo
x+urT6G1pv7YGIAYUBrsIhHfhO2BSTMJa3O5WIUdkz0TMYlElSL18Q55C0wZELEh
FLfkjIb0rHv4D3XiWXGzf4b/7s897YFzIq8b6a9REJ2z+Xp/YyKZBJeyoXOkVpDG
LHRu2iexapvZqnF2J9X8d9cAQEjHTEPksFueyTzNuHxQxFpxicknCL1LFGmaLNaT
QpmcTpVWRRDJfPfhJ/NK5Pk0fq7scAxWvQ7nfVvFfY+Vx3G4aMM=
=QAJ/
-----END PGP SIGNATURE-----

--jousvV0MzM2p6OtC--


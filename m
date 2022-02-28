Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C874C60D3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 03:13:03 +0100 (CET)
Received: from localhost ([::1]:41464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOVX1-0002cA-Sb
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 21:13:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOVRP-0001Gy-G1; Sun, 27 Feb 2022 21:07:11 -0500
Received: from [2404:9400:2221:ea00::3] (port=42071 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOVRK-00082w-EL; Sun, 27 Feb 2022 21:07:10 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4K6Nzj0W3Tz4xdl; Mon, 28 Feb 2022 13:06:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1646014017;
 bh=tR9au4HIqQJnr35L9SznkF+SPng5Y72UELsMVRN7W0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uze2Ktl6BRQJY6YkQCSrGxorvil/r4ZbCqF5CEgF9Xq6QKQjuO7y8uPisWasR7lvT
 sTzZZZR7eG/bZ5UINWnwhoEEheconLX2g4KheUB5B/FGA6yLmRm1XUNxajZbsPiX70
 MS9ipEBAWTkzl2GKtIEPM/0TxDc/OKiHRpZ/6GeQ=
Date: Mon, 28 Feb 2022 13:04:21 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 1/4] target/ppc: TCG: Migrate tb_offset and decr
Message-ID: <YhwtpQtFZy599F3R@yekko>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
 <20220224185817.2207228-2-farosas@linux.ibm.com>
 <YhhJu9HcctgA7xx2@yekko> <8735k73p5h.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ouS1/4ngo+dumsGc"
Content-Disposition: inline
In-Reply-To: <8735k73p5h.fsf@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 npiggin@gmail.com, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ouS1/4ngo+dumsGc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2022 at 01:08:10PM -0300, Fabiano Rosas wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Thu, Feb 24, 2022 at 03:58:14PM -0300, Fabiano Rosas wrote:
> >> These two were not migrated so the remote end was starting with the
> >> decrementer expired.
> >>=20
> >> I am seeing less frequent crashes with this patch (tested with -smp 4
> >> and -smp 32). It certainly doesn't fix all issues but it looks like it
> >> helps.
> >>=20
> >> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> >
> > Nack.  This completely breaks migration compatibility for all ppc
> > machines.  In order to maintain compatibility as Richard says new info
> > has to go into a subsection, with a needed function that allows
> > migration of existing machine types both to and from a new qemu
> > version.
>=20
> Ok, I'm still learning the tenets of migration. I'll give more thought
> to that in the next versions.

Fair enough.  I'd had a very frustrating week for entirely unrelated
reasons, so I was probably a bit unfairly critical.

> > There are also some other problems.
> >
> >> ---
> >>  target/ppc/machine.c | 17 +++++++++++++++++
> >>  1 file changed, 17 insertions(+)
> >>=20
> >> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> >> index 1b63146ed1..7ee1984500 100644
> >> --- a/target/ppc/machine.c
> >> +++ b/target/ppc/machine.c
> >> @@ -9,6 +9,7 @@
> >>  #include "qemu/main-loop.h"
> >>  #include "kvm_ppc.h"
> >>  #include "power8-pmu.h"
> >> +#include "hw/ppc/ppc.h"
> >> =20
> >>  static void post_load_update_msr(CPUPPCState *env)
> >>  {
> >> @@ -666,6 +667,18 @@ static const VMStateDescription vmstate_compat =
=3D {
> >>      }
> >>  };
> >> =20
> >> +static const VMStateDescription vmstate_tb_env =3D {
> >> +    .name =3D "cpu/env/tb_env",
> >
> > Because spapr requires that all cpus have synchronized timebases, we
> > migrate the timebase state from vmstate_spapr, not from each cpu
> > individually, to make sure it stays synchronized across migration.  If
> > that's not working right, that's a bug, but it needs to be fixed
> > there, not just plastered over with extra information transmitted at
> > cpu level.
>=20
> Ok, so it that what guest_timebase is about? We shouldn't need to
> migrate DECR individually then.

Probably not.  Unlike the TB there is obviously per-cpu state that has
to be migrated for DECR, and I'm not immediately sure how that's
handled right now.  I think we would be a lot more broken if we
weren't currently migrating the DECRs in at least most ordinary
circumstances.

> >> +    .version_id =3D 1,
> >> +    .minimum_version_id =3D 1,
> >> +    .fields =3D (VMStateField[]) {
> >> +        VMSTATE_INT64(tb_offset, ppc_tb_t),
> >
> > tb_offset isn't a good thing to put directly in the migration stream.
> > tb_offset has kind of non-obvious semantics to begin with: when we're
> > dealing with TCG (which is your explicit case), there is no host TB,
> > so what's this an offset from?  That's why vmstate_ppc_timebase uses
> > an explicit guest timebase value matched with a time of day in real
> > units.  Again, if there's a bug, that needs fixing there.
>=20
> This should be in patch 4, but tb_offset is needed for the nested
> case. When we enter the nested guest we increment tb_offset with
> nested_tb_offset and decrement it when leaving the nested guest. So
> tb_offset needs to carry this value over.

Yeah.. that's not really going to work.  We'll have to instead
reconstruct tb_offset from the real-time based stuff we have, then use
that on the destination where we need it.

> But maybe we could alternatively modify the nested code to just zero
> tb_offset when leaving the guest instead? We could then remove
> nested_tb_offset altogether.

Uh.. maybe?  I don't remember how the nested implementation works well
enough to quickly assess if that will work.

>=20
> >> +        VMSTATE_UINT64(decr_next, ppc_tb_t),
> >> +        VMSTATE_TIMER_PTR(decr_timer, ppc_tb_t),
> >
> > You're attempting to migrate decr_next and decr_timer, but not the
> > actual DECR value, which makes me suspect that *is* being migrated.
> > In which case you should be able to reconstruct the next tick and
> > timer state in a post_load function on receive.  If that's buggy, it
> > needs to be fixed there.
>=20
> There isn't any "actual DECR" when running TCG, is there? My
> understanding is that it is embedded in the QEMUTimer.
>=20
> Mark mentioned this years ago:
>=20
>  "I can't see anything in __cpu_ppc_store_decr() that
>  updates the spr[SPR_DECR] value when the decrementer register is
>  changed"
> =20
>  https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg01114.html
>=20
> Your answer was along the lines of:
>=20
>  "we should be reconstructing the decrementer on
>  the destination based on an offset from the timebase"
>=20
>  https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg01373.html
>=20
> So if I'm getting this right, in TCG we don't touch SPR_DECR because we
> only effectively care about what is in the decr_timer->expire_time.
>=20
> And in KVM we don't migrate DECR explicitly because we use the tb_offset
> and timebase_save/timebase_load to ensure the tb_offset in the
> destination has the correct value.
>=20
> But timebase_save/timebase_load are not used for TCG currently. So there
> would be nothing transfering the current decr value to the other side.

Ah.. good points.  What we need to make sure of is that all the values
which spr_read_decr / gen_helper_load_decr needs to make it's
calculation are correctly migrated.

> >> +        VMSTATE_END_OF_LIST()
> >> +    }
> >> +};
> >> +
> >>  const VMStateDescription vmstate_ppc_cpu =3D {
> >>      .name =3D "cpu",
> >>      .version_id =3D 5,
> >> @@ -696,12 +709,16 @@ const VMStateDescription vmstate_ppc_cpu =3D {
> >>          /* Backward compatible internal state */
> >>          VMSTATE_UINTTL(env.hflags_compat_nmsr, PowerPCCPU),
> >> =20
> >> +        VMSTATE_STRUCT_POINTER_V(env.tb_env, PowerPCCPU, 1,
> >> +                                 vmstate_tb_env, ppc_tb_t),
> >> +
> >>          /* Sanity checking */
> >>          VMSTATE_UINTTL_TEST(mig_msr_mask, PowerPCCPU, cpu_pre_2_8_mig=
ration),
> >>          VMSTATE_UINT64_TEST(mig_insns_flags, PowerPCCPU, cpu_pre_2_8_=
migration),
> >>          VMSTATE_UINT64_TEST(mig_insns_flags2, PowerPCCPU,
> >>                              cpu_pre_2_8_migration),
> >>          VMSTATE_UINT32_TEST(mig_nb_BATs, PowerPCCPU, cpu_pre_2_8_migr=
ation),
> >> +
> >>          VMSTATE_END_OF_LIST()
> >>      },
> >>      .subsections =3D (const VMStateDescription*[]) {
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ouS1/4ngo+dumsGc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIcLZwACgkQgypY4gEw
YSLDhA/+OBH2eNESVQE8TcfUyEWuBDgKBXjKruYHanEeWPk3ioZbHAzqzSj0fD9j
rvT5smVXj+VB0D4+8+JJBA+E5giBYlLqltEvdCNDzuLOM14FHmOQS3wZCypL/Kai
ecEn9zMigO72x1GMFjsX1gjezkl2HhjZ/b00gJhXSaMLXVOwNSiPzSZjdEYWGBm/
3a+jXubVeNHRvi+9oM3R5hGpleWv9HoeYTAjQ7Hsr47cZnG4rJMGzoU4f+MFSnXT
BcH0lGsfK7R/9pNrhZDIonztExurUf2OBJdlIYmYA1WSZCtpL2xGOOeGT2fQo4z6
6beagZm9OajL0bOmeAd+rx1XcEqllT7jNiN3uK5aNkaTBYomcciF9jevs7pt4GdC
ENVG1gw3WvyhOFXF2AOc2qlxLjgYOWcVOtgCswjNdDVapi/G2gk973xFF82zd+k6
ASNYUYICjRWeiPfu7/JMPPWwDgWD18L8hAMCw578mFu70Ru+ykkn7cPAhejN75tS
/ajgfV7VwFm7LSuHnCR3UHrK15cjG6n71xSFmHFGMTMFWGXC2WQMvVjeiGe0tEY7
2VAFPvPhbopobTnjHCZ99j3jYrh2h0jt2JknWVlE0IOp2oexU3x8wTZ1cyl3Ch4a
rKyda7FvpIDdoKSE869+yoHFMc+I6qHJGlFcH+NrBn4LcesOlQQ=
=W/QQ
-----END PGP SIGNATURE-----

--ouS1/4ngo+dumsGc--


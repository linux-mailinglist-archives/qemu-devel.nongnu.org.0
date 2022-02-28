Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657134C610E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 03:19:10 +0100 (CET)
Received: from localhost ([::1]:46004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOVcz-00069r-7v
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 21:19:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOVRP-0001HI-GN; Sun, 27 Feb 2022 21:07:11 -0500
Received: from [2404:9400:2221:ea00::3] (port=59421 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nOVRL-00082x-MD; Sun, 27 Feb 2022 21:07:11 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4K6Nzj0ZJlz4xcZ; Mon, 28 Feb 2022 13:06:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1646014017;
 bh=xsSePH92dVYVujtzSu6ji6Oz2pXzi3kx8H7ajsJmi64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=APLExgx5or8ZIkOpsh7CgBy8y9vh2DJ4FAn02jh/x6qr0F4YIEaSD+OobPqK1Y1rY
 NniC2iSbCQ8lFiLapQcGPhIG9bAd4Ut0VsMPO6hjCpkHyUeJJib6ON/eBsRDu1uNxi
 MGnNSan93IzrTYazrGgCnxWYw8b+cbwxOYyw44GQ=
Date: Mon, 28 Feb 2022 13:06:18 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 3/4] hw/ppc: Take nested guest into account when
 saving timebase
Message-ID: <YhwuGgn0ot3pcDuU@yekko>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
 <20220224185817.2207228-4-farosas@linux.ibm.com>
 <YhhLNVXO/Uj7XpVi@yekko> <87zgmf2ak1.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d+FaFTk8Enfx/ucs"
Content-Disposition: inline
In-Reply-To: <87zgmf2ak1.fsf@linux.ibm.com>
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


--d+FaFTk8Enfx/ucs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2022 at 01:08:46PM -0300, Fabiano Rosas wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Thu, Feb 24, 2022 at 03:58:16PM -0300, Fabiano Rosas wrote:
> >> When saving the guest "timebase" we look to the first_cpu for its
> >> tb_offset. If that CPU happens to be running a nested guest at this
> >> time, the tb_offset will have the nested guest value.
> >>=20
> >> This was caught by code inspection.
> >
> > This doesn't seem right.  Isn't the real problem that nested_tb_offset
> > isn't being migrated?  If you migrate that, shouldn't everything be
> > fixed up when the L1 cpu leaves the nested guest on the destination
> > host?
>=20
> This uses first_cpu, so after we introduced the nested guest code, this
> value has become dependent on what the first_cpu is doing. If it happens
> to be running the nested guest when we migrate, then guest_timebase here
> will have a different value from the one it would have if we had used
> another cpu's tb_offset.

Oh, good point.  Yes, you probably do need this.

> Now, we might have a bug or at least an inefficiency here because
> timebase_load is never called for the TCG migration case. The
> cpu_ppc_clock_vm_state_change callback is only registered for KVM. So in
> TCG we call timebase_save during pre_save, migrate the guest_timebase,
> but never do anything with it on the remote side.

Oh.. yeah.. that sounds probably buggy.  Unless the logic you need is
done at the time of read TB or read DECR.

>=20
> >>=20
> >> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> >> ---
> >>  hw/ppc/ppc.c | 17 ++++++++++++++++-
> >>  1 file changed, 16 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> >> index 9e99625ea9..093cd87014 100644
> >> --- a/hw/ppc/ppc.c
> >> +++ b/hw/ppc/ppc.c
> >> @@ -36,6 +36,7 @@
> >>  #include "kvm_ppc.h"
> >>  #include "migration/vmstate.h"
> >>  #include "trace.h"
> >> +#include "hw/ppc/spapr_cpu_core.h"
> >> =20
> >>  static void cpu_ppc_tb_stop (CPUPPCState *env);
> >>  static void cpu_ppc_tb_start (CPUPPCState *env);
> >> @@ -961,19 +962,33 @@ static void timebase_save(PPCTimebase *tb)
> >>  {
> >>      uint64_t ticks =3D cpu_get_host_ticks();
> >>      PowerPCCPU *first_ppc_cpu =3D POWERPC_CPU(first_cpu);
> >> +    int64_t tb_offset;
> >> =20
> >>      if (!first_ppc_cpu->env.tb_env) {
> >>          error_report("No timebase object");
> >>          return;
> >>      }
> >> =20
> >> +    tb_offset =3D first_ppc_cpu->env.tb_env->tb_offset;
> >> +
> >> +    if (first_ppc_cpu->vhyp && vhyp_cpu_in_nested(first_ppc_cpu)) {
> >> +        SpaprCpuState *spapr_cpu =3D spapr_cpu_state(first_ppc_cpu);
> >> +
> >> +        /*
> >> +         * If the first_cpu happens to be running a nested guest at
> >> +         * this time, tb_env->tb_offset will contain the nested guest
> >> +         * offset.
> >> +         */
> >> +        tb_offset -=3D spapr_cpu->nested_tb_offset;
> >> +    }
> >> +
> >>      /* not used anymore, we keep it for compatibility */
> >>      tb->time_of_the_day_ns =3D qemu_clock_get_ns(QEMU_CLOCK_HOST);
> >>      /*
> >>       * tb_offset is only expected to be changed by QEMU so
> >>       * there is no need to update it from KVM here
> >>       */
> >> -    tb->guest_timebase =3D ticks + first_ppc_cpu->env.tb_env->tb_offs=
et;
> >> +    tb->guest_timebase =3D ticks + tb_offset;
> >> =20
> >>      tb->runstate_paused =3D
> >>          runstate_check(RUN_STATE_PAUSED) || runstate_check(RUN_STATE_=
SAVE_VM);
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--d+FaFTk8Enfx/ucs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIcLhMACgkQgypY4gEw
YSL7SRAAhy7x69pB9jRHcUskCZ14CdwiqZFqVWi9br4wtL1tIPdTwCLZqZ//Kf73
wtd6kB7Z4MSL1FaE+0xeSSO7KlPPErQuOQIIyyVKA3SbCcaEMrLXa5mcqUusEqUU
rZ3NPHQk/QJ+1fjd45f6r3WRutatBAxrJlRmxUgYmQwnJgteclYWtsNamRrta6QX
lyjoXhmfJaYw3nARlIKsgze/68/0wqclaRkHSaxjEGlQ7gL4JMNZIiEjHS/2wpp8
x7giv/9bAfHXa+8oF0eRFvEOhjAKgRBhi8qlPSIK5k9BLp/rkb2FY+82GulBCQDT
kahpZmkrmRTyhNl+dL/xo7pRe8cz4i3YapAEiesS7hxPS9V1xRhBkfE4e1rXwOm3
uJ4OHpy7RqNkSJxf8RRsGCstbWiFR+nejVl5k6vzdPjsg4RNfCZ8zm96gMkWoctC
tly6aMYqxZ7V9frwkw7C7GM4sdg72g1MVCmF4MWE1WF9uO/AQzuFERARt0eOHBVe
QrgnmNwyJwnnAeB8e6+azdQIN9sz0FYZuOi198K/fwcwOBX2ckU1QAqNRqsBC11r
Ig/JLp7dsW0v6OFVRRaAoug1zDz84KSVhyNfd8/y9xLbwYpzuN7NQFA/aOPgM0du
T37saKVuuaAaKio/+q4J0WzJEL/vHtU42JBF5SWHOwBXxyGAD1E=
=pd5z
-----END PGP SIGNATURE-----

--d+FaFTk8Enfx/ucs--


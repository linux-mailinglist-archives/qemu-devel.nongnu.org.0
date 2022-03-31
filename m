Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10834ED300
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 06:49:20 +0200 (CEST)
Received: from localhost ([::1]:48962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZmkJ-0006WO-LZ
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 00:49:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nZmdI-0003K3-P3; Thu, 31 Mar 2022 00:42:04 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nZmdF-00034y-B8; Thu, 31 Mar 2022 00:42:04 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KTVyC5YNSz4xPv; Thu, 31 Mar 2022 15:41:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1648701715;
 bh=8QM3jv81E/4w/MUnw5lFURcTj61rzwYNtanDnrlTe3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SIQHsheLKH68WojowAzlayWoEm80Kz49VEyJzzRPAue5oY6AUdMO/vuHzTzAN8CH2
 b8IKCgrCoHDKQ2NSHDjG6fffnlPDkYO/mhvHWZ7E+6b8HSqiTkjdQvujnPj16dTrSj
 wZ5uhuWePD2aoAI6b1Ml0hvyjqWp+gvyP3BoXokk=
Date: Thu, 31 Mar 2022 15:29:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] spapr: Report correct GTSE support via ov5
Message-ID: <YkUuLyQTZUthvJb4@yekko>
References: <20220309012400.2527157-1-farosas@linux.ibm.com>
 <YixlR+rLNZCsAA50@yekko> <87ee346v99.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SdWy9PJjrvwXDrRv"
Content-Disposition: inline
In-Reply-To: <87ee346v99.fsf@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: aneesh.kumar@linux.ibm.com, danielhb413@gmail.com, qemu-devel@nongnu.org,
 npiggin@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SdWy9PJjrvwXDrRv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2022 at 07:10:10PM -0300, Fabiano Rosas wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Tue, Mar 08, 2022 at 10:23:59PM -0300, Fabiano Rosas wrote:
> >> QEMU reports MMU support to the guest via the ibm,architecture-vec-5
> >> property of the /chosen node. Byte number 26 specifies Radix Table
> >> Expansions, currently only GTSE (Guest Translation Shootdown
> >> Enable). This feature determines whether the tlbie instruction (and
> >> others) are HV privileged.
> >>=20
> >> Up until now, we always reported GTSE=3D1 to guests. Even after the
> >> support for GTSE=3D0 was added. As part of that support, a kernel
> >> command line radix_hcall_invalidate=3Don was introduced that overrides
> >> the GTSE value received via CAS. So a guest can run with GTSE=3D0 and
> >> use the H_RPT_INVALIDATE hcall instead of tlbie.
> >>=20
> >> In this scenario, having GTSE always set to 1 by QEMU leads to a crash
> >> when running nested KVM guests because KVM does not allow a nested
> >> hypervisor to set GTSE support for its nested guests. So a nested
> >> guest always uses the same value for LPCR_GTSE as its HV. Since the
> >> nested HV disabled GTSE, but the L2 QEMU always reports GTSE=3D1, we r=
un
> >> into a crash when:
> >>=20
> >> L1 LPCR_GTSE=3D0
> >> L2 LPCR_GTSE=3D0
> >> L2 CAS GTSE=3D1
> >>=20
> >> The nested guest will run 'tlbie' and crash because the HW looks at
> >> LPCR_GTSE, which is clear.
> >>=20
> >> Having GTSE disabled in the L1 and enabled in the L2 is not an option
> >> because the whole purpose of GTSE is to disallow access to tlbie and
> >> we cannot allow L1 to spawn L2s that can access features that L1
> >> itself cannot.
> >>=20
> >> We also cannot have the guest check the LPCR bit, because LPCR is
> >> HV-privileged.
> >>=20
> >> So this patch goes through the most intuitive route which is to have
> >> QEMU ask KVM about GTSE support and advertise the correct value to the
> >> guest. A new KVM_CAP_PPC_GTSE capability is being added.
> >>=20
> >> TCG continues to always enable GTSE.
> >>=20
> >> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> >> ---
> >>  hw/ppc/spapr.c       | 38 +++++++++++++++++++++++++++++++-------
> >>  target/ppc/kvm.c     |  8 ++++++++
> >>  target/ppc/kvm_ppc.h |  6 ++++++
> >>  3 files changed, 45 insertions(+), 7 deletions(-)
> >>=20
> >> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> >> index 4cc204f90d..3e95a1831f 100644
> >> --- a/hw/ppc/spapr.c
> >> +++ b/hw/ppc/spapr.c
> >> @@ -971,7 +971,7 @@ static void spapr_dt_ov5_platform_support(SpaprMac=
hineState *spapr, void *fdt,
> >>          23, 0x00, /* XICS / XIVE mode */
> >>          24, 0x00, /* Hash/Radix, filled in below. */
> >>          25, 0x00, /* Hash options: Segment Tables =3D=3D no, GTSE =3D=
=3D no. */
> >> -        26, 0x40, /* Radix options: GTSE =3D=3D yes. */
> >> +        26, 0x00, /* Radix options, filled in below. */
> >>      };
> >> =20
> >>      if (spapr->irq->xics && spapr->irq->xive) {
> >> @@ -1000,10 +1000,16 @@ static void spapr_dt_ov5_platform_support(Spap=
rMachineState *spapr, void *fdt,
> >>          } else {
> >>              val[3] =3D 0x00; /* Hash */
> >>          }
> >> +
> >> +        if (kvmppc_has_cap_gtse()) {
> >> +            val[7] =3D 0x40 /* OV5_MMU_RADIX_GTSE */;
> >> +        }
> >>      } else {
> >>          /* V3 MMU supports both hash and radix in tcg (with dynamic s=
witching) */
> >>          val[3] =3D 0xC0;
> >> +        val[7] =3D 0x40 /* OV5_MMU_RADIX_GTSE */;
> >>      }
> >> +
> >>      _FDT(fdt_setprop(fdt, chosen, "ibm,arch-vec-5-platform-support",
> >>                       val, sizeof(val)));
> >>  }
> >> @@ -2824,14 +2830,32 @@ static void spapr_machine_init(MachineState *m=
achine)
> >>      /* Init numa_assoc_array */
> >>      spapr_numa_associativity_init(spapr, machine);
> >> =20
> >> -    if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
> >> -        ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_=
3_00, 0,
> >> +    if (ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_=
3_00, 0,
> >>                                spapr->max_compat_pvr)) {
> >> -        spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
> >> -        /* KVM and TCG always allow GTSE with radix... */
> >> -        spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
> >> +
> >> +        /* TCG always supports Radix w/ GTSE */
> >> +        if (!kvm_enabled()) {
> >> +            spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
> >> +            spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
> >
> > Yeah, this is no good.  It's never ok to change guest visible
> > behaviour depending on host properties (in this case whether it's KVM
> > or not).  It messes up the invariants we need for migration, which
> > require that the guest visible state depend only on the user
> > configuration.
> >
> > The usual way to handle this is with a new capability, you can then
> > change the default with the next machine version.
>=20
> This particular problem is tricky. TCG cannot disable GTSE because it
> does not support H_RPT_INVALIDATE.

We could implement H_RPT_INVALIDATE for TCG though.

> And older kernels that don't know
> about the feature require GTSE.
>=20
> KVM can afford to disable GTSE because we have a compatibility mechanism
> (although a bit crooked): We can invert the logic for the KVM_CAP so
> that the presence of KVM_CAP_PPC_GTSE_DISABLE would mean QEMU is allowed
> to disable GTSE. Then:
>   - older KVM + new QEMU would keep GTSE enabled;
>=20
>   - older L1 guests are not affected because the host would report
>     GTSE=3D1 with the KVM capability. By the time we decide to disable
>     GTSE for L1 guests hopefully all older kernels will be out of use;
>=20
>   - older nested guests:
>     - if L1 runs with GTSE=3D1, are not affected;
>=20
>     - if L1 disabled GTSE via kernel cmdline, are already broken (this
>       bug). But they would go from crashing to being aborted* by QEMU
>       (the guest asks for HPT in the lack of GTSE; nested KVM is radix
>       only);
>=20
>       * there are other broken cases which are fixed completely.
>=20
> To satisfy TCG we could keep a spapr capability as ON and usually the
> guest would pass cap-gtse=3Doff when running with KVM. However this
> doesn't work because this crash happens precisely because the nested
> guest doesn't know that it needs to use cap-rpt-invalidate=3Don. Another
> cap wouldn't help.
>=20
> So I think the only way to have a spapr capability for this is if TCG
> always defaults to ON and KVM always defaults to OFF. But then we would
> be changing guest visible behaviour depending on host properties.

Ok, I'd forgotten we already have cap-rpt-invalidate.  It still
defaults to OFF for now, which might help us.

What's clear is that we should never disable GTSE if
cap-rpt-invalidate is off - qemu should enforce that before even
starting the guest if at all possible.

What's less clear to me is if we want to enable GTSE by default or
not, in the cases where we're able to choose.  Would always disabling
GTSE when cap-rpt-invalidate=3Don be ok?  Or do we want to be able to
control GTSE separately.  In that case we might need a second cap, but
it would need inverted sense, so e.g. cap-disable-gtse.

I believe a guest that is expecting GTSE=3D=3D0 should work if
LPCR[GTSE]=3D=3D1, just not optimally (as long as H_RPT_INVALIDATE is
still available, of course).  Is that right?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SdWy9PJjrvwXDrRv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJFLigACgkQgypY4gEw
YSKczxAAx9wD8I0EzmCGNMDHZDuzQvbCnfTpurs6eW3LR+Enp+fnvlLGqiu7MizN
oqjH6a081sXqeMgiweal127oBih79LecvCaByha4XsuHAT03/1QnYcd7EjTEU2Jo
Sf0WYnb9xTQmDJuciAMk24M2tEvZbiLOwrP8VOf171HNGzEOgnvabHnjHeT2lAao
bvpuaxnZuPKaFtKAVPgRmJXvgeIq2fF/DhjmtuYW6/WvT135jh1DlSmdJWKL+N8v
QzFISWya5zRVQzpUDk2KNPxWJ/5NCDKNM/na6UY2WqXMVpwEsAdHiN48KcWjn92u
77AMG8APo8kIARykbzYQmdKKN+zwkXjA/pI05x7zdv4Jacat0AohqvFn+XZVmXhr
l+/j9bPvK8TeSOvl4SkLTHdfbj4RRMaCMa8XVa3nUywYmJh9D8KH1vjvMRbod0pL
C1zzw8l4Tmw8BMtMVpMV8PN/zRbqFGqR0ypoh5QqxhKvjQO5LeRM2ZfQdqtF3w1o
UwqGmG0b/hqThUD2/QOYkPfVhbGHt1BHJaH/Vpk2yobQvvEF18lSyLUw3tVz9Veh
g8fUM9p+DiKPt+yY4BlAnaDRC/tfFpNOc/l6uYi88XTQH6tLu7YovtDHiON/20sl
3kKLtfPK00h/n91wb4BXZMRuqwKzQ/2EEAYz8q0wTI7OEyeXq7g=
=4Mly
-----END PGP SIGNATURE-----

--SdWy9PJjrvwXDrRv--


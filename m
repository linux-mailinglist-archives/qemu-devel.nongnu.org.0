Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B4F3EE4C2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 05:04:28 +0200 (CEST)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFpOs-0006MW-Qx
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 23:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mFpKW-0005Lq-MT; Mon, 16 Aug 2021 22:59:56 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:39321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mFpKO-00026F-LH; Mon, 16 Aug 2021 22:59:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GpbNX4K32z9sT6; Tue, 17 Aug 2021 12:59:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629169180;
 bh=23nF6NEd/jtBakf/YttWxQufN8/Sq4F+dTGYIDT0G0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hjeFjRH80oiO0hIlWFQlPY4gR6NYJBJcjPPBk2CxiPovXx3VJxZAOUxhmxf1dCPEb
 OY23G450o4hILvBgZZOsZwYFWKqAahHbcqTfMT/lquJd/t3FTGycuIXfzGnCRjnfRV
 hrq7XjcG2+DaU13zIb/zTzQwdsTMNcld1Iu1dfjM=
Date: Tue, 17 Aug 2021 12:59:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 04/19] target/ppc: PMU Book3s basic insns count for
 pseries TCG
Message-ID: <YRsmEN2C3LDInZyS@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-5-danielhb413@gmail.com>
 <YRH05uCNwvjS5Nws@yekko>
 <7937bc84-b516-ee7b-296d-2a38191dc056@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8ghEWr+67JjjTCsU"
Content-Disposition: inline
In-Reply-To: <7937bc84-b516-ee7b-296d-2a38191dc056@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8ghEWr+67JjjTCsU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 02:53:13PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/10/21 12:39 AM, David Gibson wrote:
> > On Mon, Aug 09, 2021 at 10:10:42AM -0300, Daniel Henrique Barboza wrote:
> > > The PMCC (PMC Control) bit in the MMCR0 register controls whether the
> > > counters PMC5 and PMC6 are being part of the performance monitor
> > > facility in a specific time. If PMCC allows it, PMC5 and PMC6 will
> > > always be used to measure instructions completed and cycles,
> > > respectively.
> > >=20
> > > This patch adds the barebones of the Book3s PMU logic by enabling
> > > instruction counting, using the icount framework, using the performan=
ce
> > > monitor counters 5 and 6. The overall logic goes as follows:
> > >=20
> > > - a helper is added to control the PMU state on each MMCR0 write. This
> > > allows for the PMU to start/stop as quick as possible;
> >=20
> > Um.. why does a helper accomplish that goal?
> >=20
> > >=20
> > > - only PMC5 and PMC6 are being set. PMC6 (cycles) is default to 4*ins=
ns
> > > (for cycles per instruction) for now;
> >=20
> > What's the justification for that value?  With a superscalar core, I'd
> > expect average (median) cycles per instruction to be < 1 a lot of the
> > time.  Mean cycles per instruction could be higher since certain
> > instructions could take a lot.
> >=20
> > > - the intended usage is to freeze the counters by setting MMCR0_FC, do
> > > any additional setting via MMCR1 (not implemented yet) and setting
> > > initial counter values,  and enable the PMU by zeroing MMCR0_FC. Soft=
ware
> > > must freeze counters to read the results - on the fly reading of the =
PMCs
> > > will return the starting value of each one.
> >=20
> > Is that the way hardware behaves?  Or is it just a limitation of this
> > software implementation?  Either is fine, we should just be clear on
> > what it is.
> >=20
> > >=20
> > > Since there will be more PMU exclusive code to be added next, let's a=
lso
> > > put the PMU logic in its own helper to keep all in the same place. The
> > > code is also repetitive and not really extensible to add more PMCs, b=
ut
> > > we'll handle this in the next patches.
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   target/ppc/cpu.h               |  4 ++
> > >   target/ppc/cpu_init.c          |  4 +-
> > >   target/ppc/helper.h            |  1 +
> > >   target/ppc/meson.build         |  1 +
> > >   target/ppc/pmu_book3s_helper.c | 78 +++++++++++++++++++++++++++++++=
+++
> > >   target/ppc/translate.c         | 14 ++++--
> > >   6 files changed, 97 insertions(+), 5 deletions(-)
> > >   create mode 100644 target/ppc/pmu_book3s_helper.c
> > >=20
> > > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > > index 4d96015f81..229abfe7ee 100644
> > > --- a/target/ppc/cpu.h
> > > +++ b/target/ppc/cpu.h
> > > @@ -1175,6 +1175,10 @@ struct CPUPPCState {
> > >       uint32_t tm_vscr;
> > >       uint64_t tm_dscr;
> > >       uint64_t tm_tar;
> > > +
> > > +    /* PMU registers icount state */
> > > +    uint64_t pmc5_base_icount;
> > > +    uint64_t pmc6_base_icount;
> > >   };
> > >   #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
> > > diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> > > index 71062809c8..fce89ee994 100644
> > > --- a/target/ppc/cpu_init.c
> > > +++ b/target/ppc/cpu_init.c
> > > @@ -6822,7 +6822,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPC=
State *env)
> > >       spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
> > >                        SPR_NOACCESS, SPR_NOACCESS,
> > >                        &spr_read_pmu_generic, &spr_write_pmu_generic,
> > > -                     KVM_REG_PPC_MMCR0, 0x00000000);
> > > +                     KVM_REG_PPC_MMCR0, 0x80000000);
> > >       spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
> > >                        SPR_NOACCESS, SPR_NOACCESS,
> > >                        &spr_read_pmu_generic, &spr_write_pmu_generic,
> > > @@ -6870,7 +6870,7 @@ static void register_book3s_pmu_user_sprs(CPUPP=
CState *env)
> > >       spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
> > >                    &spr_read_pmu_ureg, &spr_write_pmu_ureg,
> > >                    &spr_read_ureg, &spr_write_ureg,
> > > -                 0x00000000);
> > > +                 0x80000000);
> > >       spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
> > >                    &spr_read_pmu_ureg, &spr_write_pmu_ureg,
> > >                    &spr_read_ureg, &spr_write_ureg,
> > > diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> > > index 4076aa281e..5122632784 100644
> > > --- a/target/ppc/helper.h
> > > +++ b/target/ppc/helper.h
> > > @@ -20,6 +20,7 @@ DEF_HELPER_1(rfscv, void, env)
> > >   DEF_HELPER_1(hrfid, void, env)
> > >   DEF_HELPER_2(store_lpcr, void, env, tl)
> > >   DEF_HELPER_2(store_pcr, void, env, tl)
> > > +DEF_HELPER_2(store_mmcr0, void, env, tl)
> > >   #endif
> > >   DEF_HELPER_1(check_tlb_flush_local, void, env)
> > >   DEF_HELPER_1(check_tlb_flush_global, void, env)
> > > diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> > > index b85f295703..bf252ca3ac 100644
> > > --- a/target/ppc/meson.build
> > > +++ b/target/ppc/meson.build
> > > @@ -14,6 +14,7 @@ ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
> > >     'int_helper.c',
> > >     'mem_helper.c',
> > >     'misc_helper.c',
> > > +  'pmu_book3s_helper.c',
> > >     'timebase_helper.c',
> > >     'translate.c',
> > >   ))
> > > diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_h=
elper.c
> > > new file mode 100644
> > > index 0000000000..fe16fcfce0
> > > --- /dev/null
> > > +++ b/target/ppc/pmu_book3s_helper.c
> >=20
> > I'd prefer to call this just book3s_pmu.c.  Or better yet
> > "powerX_pmu.c", where X is the specific PMU model you're implementing
> > since IIRC the particulars of the PMU vary quite a lot from POWER7
> > through to POWER10.
>=20
> I'll go with book3s_pmu.c because this PMU implementation will not go
> deep enough to touch the differences between POWER processors.

I think you are mistaken.

> The only aspects that will be implementation specific will be 2 perf
> events (0x2 and 0x1E) that the kernel has been using for a long time
> and only recently migrated to architected events. We'll support all
> architected events that are related to those events so that newer
> kernels - and other non-IBM processors - will use the PMU without
> the need of having to know about 0x2 and 0x1E.

So, possibly in the last few POWER chips, the only differences are the
table of event keys.  That is definitely not the case for the whole
POWER line though.  I remember from my time at IBM, the PMU underwent
huge changes much deeper than the event table.  Some had different
numbers of PMCs, different bit fields in the MMCRs, different methods
of event selection (in some cases through insanely compplex chains of
multiplexers).  And everything from POWER4 onwards could reasonably be
described as "book3s".  So we definitely need a different
name... working out what it should be is harder though.

If the modern core structure of the PMU got codified in a particular
BookS architecture version we could name it after that version, maybe?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8ghEWr+67JjjTCsU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEbJg0ACgkQbDjKyiDZ
s5I+lxAAsfngpN5L6o+tBy2wLOCay04JcuCjfzlRsOE5+UcR/NGleleWf8Pl+4t/
o1nF30YV2B0Q4pT3Ja2M1LWLYiZXarCgHw/WdMWrycyqWzQM7b0rryK2TunDo2Wt
AOD7DnNSw+m8pADOAEXtxvB2sn1IlszYek8NcN1lQ6mNwLscbUD9ZDR0cPXGbW8R
yYt3/D3bZL1q2HNzBnC1qFw8C7MZZ+/NQybHGAA1FwQnUpdHlz8lc7jAOknXUtvt
uzRyZ1/RV7g1syDXKYyv4tWgFmN4FumQwAD72OXehEUrpSpZeofgphT0ReSm5bzz
vHXdvAFW5TTeg4QFbX++DHSZfToJlK2Z6szcc22a9NKQK80STpbP5e7D6nkUVBMY
Nam11G2YL7PAm32H4P3r9WnGVnYZBRrqfdNnxA38z+qyl2yzg2SDAEkEDxgjDD+e
GpKXT4T4/Hv00S6NKzJtPEA34HmvC0aZJRciwJlVwpwrhiFXus1DJl+Y0qWkpCAU
MDD/VXwaDFk5EmtZvVYx2a9q4ej5qzOCWU48qr/Y9MWLK+XrxDSRNYIqmkwQocag
oKA9gjJNlTVVNmNKUroez4MnW86IaHBMKVgORgof+VrGzGRZXAuqraLOdVxutv4s
+bdY/qAiSUlkTf4BLDR8ohttykOoyDpLTPCZJcWetUwXDko/cKo=
=0eTm
-----END PGP SIGNATURE-----

--8ghEWr+67JjjTCsU--


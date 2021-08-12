Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B273E9C1D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 03:59:05 +0200 (CEST)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDzzs-0006xe-GJ
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 21:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDzxw-0005JW-9S; Wed, 11 Aug 2021 21:57:04 -0400
Received: from ozlabs.org ([203.11.71.1]:51443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDzxt-0002h5-M8; Wed, 11 Aug 2021 21:57:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GlVDT1SkZz9sXN; Thu, 12 Aug 2021 11:56:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628733417;
 bh=4++UGjJ9vqNac2QaqclRadyvzb9JxTrfnQhHnHANmFc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=POHrJxxULWoJRHcTAP3wNAq9dyGNipZTEWsflLK/byZnsua9xwtdt1MlD8BXGyiLN
 O9/ZIclwL8yGoiC9WlvL6o3W13M1hYChZ/BqjZCEx2DbmqnSeH0oVB3T6uiF2TNXkh
 SVg1pNB7Y/N8Fvx/v4J+EoIgYOei6Qwj0dk8ppPE=
Date: Thu, 12 Aug 2021 11:44:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 15/19] target/ppc/pmu_book3s_helper: enable counter
 negative for all PMCs
Message-ID: <YRR84+X7QvS6K9bV@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-16-danielhb413@gmail.com>
 <YRH8dz8SLDFWTe1m@yekko>
 <9fd156de-d882-9a6e-508d-392944a1bf70@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Cqe825PV9TwTXRtK"
Content-Disposition: inline
In-Reply-To: <9fd156de-d882-9a6e-508d-392944a1bf70@gmail.com>
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Cqe825PV9TwTXRtK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 06:02:41PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/10/21 1:11 AM, David Gibson wrote:
> > On Mon, Aug 09, 2021 at 10:10:53AM -0300, Daniel Henrique Barboza wrote:
> > > All performance monitor counters can trigger a counter negative
> > > condition if the proper MMCR0 bits are set. This patch does that by
> > > doing the following:
> > >=20
> > > - pmc_counter_negative_enabled() will check whether a given PMC is
> > > eligible to trigger the counter negative alert;
> > >=20
> > > - get_counter_neg_timeout() will return the timeout for the counter
> > > negative condition for a given PMC, or -1 if the PMC is not able to
> > > trigger this alert;
> > >=20
> > > - the existing counter_negative_cond_enabled() now must consider the
> > > counter negative bit for PMCs 2-6, MMCR0_PMCjCE;
> > >=20
> > > - set_PMU_excp_timer() will now search all existing PMCs for the
> > > shortest counter negative timeout. The shortest timeout will be used =
to
> > > set the PMC interrupt timer.
> > >=20
> > > This change makes most EBB powepc kernel tests pass, validating that =
the
> > > existing EBB logic is consistent. There are a few tests that aren't p=
assing
> > > due to additional PMU bits and perf events that aren't covered yet.
> > > We'll attempt to cover some of those in the next patches.
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   target/ppc/cpu.h               |  1 +
> > >   target/ppc/pmu_book3s_helper.c | 96 ++++++++++++++++++++++++++++++-=
---
> > >   2 files changed, 87 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > > index 5c81d459f4..1aa1fd42af 100644
> > > --- a/target/ppc/cpu.h
> > > +++ b/target/ppc/cpu.h
> > > @@ -351,6 +351,7 @@ typedef struct ppc_v3_pate_t {
> > >   #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Ev=
ent */
> > >   #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
> > >   #define MMCR0_PMC1CE PPC_BIT(48)
> > > +#define MMCR0_PMCjCE PPC_BIT(49)
> > >   #define MMCR1_PMC1SEL_SHIFT (63 - 39)
> > >   #define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
> > > diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_h=
elper.c
> > > index 7126e9b3d5..c5c5ab38c9 100644
> > > --- a/target/ppc/pmu_book3s_helper.c
> > > +++ b/target/ppc/pmu_book3s_helper.c
> > > @@ -143,22 +143,98 @@ static int64_t get_CYC_timeout(CPUPPCState *env=
, int sprn)
> > >       return muldiv64(remaining_cyc, NANOSECONDS_PER_SECOND, PPC_CPU_=
FREQ);
> > >   }
> > > -static void set_PMU_excp_timer(CPUPPCState *env)
> > > +static bool pmc_counter_negative_enabled(CPUPPCState *env, int sprn)
> > >   {
> > > -    uint64_t timeout, now;
> > > +    switch (sprn) {
> > > +    case SPR_POWER_PMC1:
> > > +        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE;
> > > -    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE)) {
> > > -        return;
> > > +    case SPR_POWER_PMC2:
> > > +    case SPR_POWER_PMC3:
> > > +    case SPR_POWER_PMC4:
> > > +    case SPR_POWER_PMC5:
> > > +    case SPR_POWER_PMC6:
> > > +        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
> > > +
> > > +    default:
> > > +        break;
> > >       }
> > > -    switch (get_PMC_event(env, SPR_POWER_PMC1)) {
> > > -    case 0x2:
> > > -        timeout =3D get_INST_CMPL_timeout(env, SPR_POWER_PMC1);
> > > +    return false;
> > > +}
> > > +
> > > +static int64_t get_counter_neg_timeout(CPUPPCState *env, int sprn)
> > > +{
> > > +    int64_t timeout =3D -1;
> > > +
> > > +    if (!pmc_counter_negative_enabled(env, sprn)) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (env->spr[sprn] >=3D COUNTER_NEGATIVE_VAL) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    switch (sprn) {
> > > +    case SPR_POWER_PMC1:
> > > +    case SPR_POWER_PMC2:
> > > +    case SPR_POWER_PMC3:
> > > +    case SPR_POWER_PMC4:
> > > +        switch (get_PMC_event(env, sprn)) {
> > > +        case 0x2:
> > > +            timeout =3D get_INST_CMPL_timeout(env, sprn);
> > > +            break;
> > > +        case 0x1E:
> > > +            timeout =3D get_CYC_timeout(env, sprn);
> > > +            break;
> > > +        }
> > > +
> > >           break;
> > > -    case 0x1e:
> > > -        timeout =3D get_CYC_timeout(env, SPR_POWER_PMC1);
> > > +    case SPR_POWER_PMC5:
> > > +        timeout =3D get_INST_CMPL_timeout(env, sprn);
> > > +        break;
> > > +    case SPR_POWER_PMC6:
> > > +        timeout =3D get_CYC_timeout(env, sprn);
> > >           break;
> > >       default:
> > > +        break;
> > > +    }
> > > +
> > > +    return timeout;
> > > +}
> > > +
> > > +static void set_PMU_excp_timer(CPUPPCState *env)
> > > +{
> > > +    int64_t timeout =3D -1;
> > > +    uint64_t now;
> > > +    int i;
> > > +
> > > +    /*
> > > +     * Scroll through all PMCs and check which one is closer to a
> > > +     * counter negative timeout.
> >=20
> > I'm wondering if it would be simpler to use a separate timer for each
> > PMC: after all the core timer logic must have already implemented this
> > "who fires first" logic.
>=20
> The first draft had 6 timers, one for each PMC. It would make this step to
> determine the lowest timeout unnecessary.
>=20
> I gave it up because we would need to pause the running timers of the oth=
er
> PMCs when the PPC_INTERRUPT_PMC happens with MMCR0_FCECE (frozen counters=
 on
> Enabled Condition or Event) set. Resuming the timers back would require to
> update the PMCs (which would now have different icount_bases).

Ok, that makes sense.  Might be worth putting some of that rationale
into a comment.

> For our current usage this single timer approach seems less complicated. =
And
> the ISA allows for multiple/concurrent overflows to be reported at the sa=
me
> alert:
>=20
> "An enabled condition or event causes a Perfor-
> mance Monitor alert if Performance Monitor alerts
> are enabled by the corresponding =E2=80=9CEnable=E2=80=9D bit in
> MMCR0. (..) A single Performance Monitor alert may
> reflect multiple enabled conditions and events."
>=20
> So a single timer can report more than one c.n. overflows that might happ=
en
> at the same time. E.g. in this timeout logic below, if PMC1 is already
> overflown, we will trigger the PMC interrupt. Since we're updating all
> PMCs, if more counters are also overflown the application can read them
> all in the same interrupt/exception.

Uh.. sure.. but I think you could implement that by sharing the
interrupt latch regardless of whether there are separate counters or
not.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Cqe825PV9TwTXRtK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEUfOMACgkQbDjKyiDZ
s5KDtg//S/bWOZP/eJmlnctFHGz67GKMAvFjcdnQYvjM5E2leJAHTXiqh86iANPv
CtE07U/E8lGWVu+AXopswy/e6xLsqlIxvAdvAqdGbPM7F+ptZVTKRsqQunBcVNz1
MN47EaK6ptUc5lmuvD8Iw4rBdg9Sq9lFEorx5/XbbcIzsPVSlKKE6QAup7cmyj8l
Hpbmf8rNZGfCJnMDgNi3hZ0WTEotYDpabQWdfxdNEsz+P629g6cKzD2025hC0cr5
CwUfq9nYf1IbkBqGmN0ony+euMU2WEMRtZTDEkzGrKUe4iIW0I2FCxnRF3GQ9mG5
krnOlXnSd8bJJ8+eKmSY8MduseHBZdSZ/cDXy+aUFTpfMrFOXQXbBHTWUkwJ+uaS
9bkTJpWj8sz6qGu3gicWqAxVzZ38ko0dkVzdngOU13L9TiN8Zd6BCtM7DeGh9Aor
YTvCqkf/JHlSRPp/cr0LjBd7nK1w2BiEC7wqVbsjDR4RW78tLD4z31PqiMJR/onm
yK16WiOtUYDR9V2MnsLpGyzz14wKX2oXvQEgpSuRISh0mWMty7FeCZMnKYjiPgCt
rbe7+cIhxC9t4FlQGpUZeP3HvhbpKgaoMqE4Ht+vD6bbP3KPesbw5nfxjyumy66A
EIXSk9LhlgJbqK6FfmXVhzPJjzXgKmQ6pHuO7gEpOwV4ScSn49A=
=63xx
-----END PGP SIGNATURE-----

--Cqe825PV9TwTXRtK--


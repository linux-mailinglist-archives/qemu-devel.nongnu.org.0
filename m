Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000BD4644C1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 03:07:43 +0100 (CET)
Received: from localhost ([::1]:34584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msF27-0005BH-03
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 21:07:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1msEw4-0000wz-4v; Tue, 30 Nov 2021 21:01:28 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:55163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1msEvz-0004vt-BC; Tue, 30 Nov 2021 21:01:27 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J3j4C1x3hz4xZ4; Wed,  1 Dec 2021 13:01:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638324075;
 bh=M/mdTfKHH75DiLfldPp6Ip6kyl1JLsojUIoR2K78eRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VWJZSR4oUGQVh9j8EKfqcjyXatlzoZvtsqq0YkNzXVKsLdyNm7gkqq16UN0IPpdqn
 oIuGU/u3wTCUIEQgxK7LV1BctYO1Wxv/iTRutJI4renwsen1L+YRHeaQ3426IQad+f
 mKwvUg9TYgd7I3RkWRzZanc+tF5wjNVWwGbiF9w4=
Date: Wed, 1 Dec 2021 10:52:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 06/10] target/ppc: enable PMU instruction count
Message-ID: <Yaa5JTZOGZb5hyuK@yekko>
References: <20211125150817.573204-1-danielhb413@gmail.com>
 <20211125150817.573204-7-danielhb413@gmail.com>
 <YaRYwiSLgVW38EKj@yekko>
 <6358310d-c6e4-c5fd-c76c-854674ce1d6b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Kgs65RnJSkYKuOlT"
Content-Disposition: inline
In-Reply-To: <6358310d-c6e4-c5fd-c76c-854674ce1d6b@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Kgs65RnJSkYKuOlT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 07:24:04PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 11/29/21 01:36, David Gibson wrote:
> > On Thu, Nov 25, 2021 at 12:08:13PM -0300, Daniel Henrique Barboza wrote:
> > > The PMU is already counting cycles by calculating time elapsed in
> > > nanoseconds. Counting instructions is a different matter and requires
> > > another approach.
> > >=20
> > > This patch adds the capability of counting completed instructions
> > > (Perf event PM_INST_CMPL) by counting the amount of instructions
> > > translated in each translation block right before exiting it.
> > >=20
> > > A new pmu_count_insns() helper in translation.c was added to do that.
> > > After verifying that the PMU is running (MMCR0_FC bit not set), call
> > > helper_insns_inc(). This new helper from power8-pmu.c will add the
> > > instructions to the relevant counters. It'll also be responsible for
> > > triggering counter negative overflows as it is already being done with
> > > cycles.
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   target/ppc/cpu.h                 |  1 +
> > >   target/ppc/helper.h              |  1 +
> > >   target/ppc/helper_regs.c         |  4 +++
> > >   target/ppc/power8-pmu-regs.c.inc |  6 +++++
> > >   target/ppc/power8-pmu.c          | 38 ++++++++++++++++++++++++++
> > >   target/ppc/translate.c           | 46 +++++++++++++++++++++++++++++=
+++
> > >   6 files changed, 96 insertions(+)
> > >=20
> > > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > > index 9b41b022e2..38cd2b5c43 100644
> > > --- a/target/ppc/cpu.h
> > > +++ b/target/ppc/cpu.h
> > > @@ -656,6 +656,7 @@ enum {
> > >       HFLAGS_PR =3D 14,  /* MSR_PR */
> > >       HFLAGS_PMCC0 =3D 15,  /* MMCR0 PMCC bit 0 */
> > >       HFLAGS_PMCC1 =3D 16,  /* MMCR0 PMCC bit 1 */
> > > +    HFLAGS_MMCR0FC =3D 17, /* MMCR0 FC bit */
> >=20
> > Now that the event stuff is a bit more refined, you could narrow this
> > down to specifically marking if any counters are actively counting
> > instructions (not frozen by MMCR0[FC] and not frozen by
> > MMCR0[FC14|FC56] *and* have the right event selected).
> >=20
> > Since I suspect the instruction counting instrumentation could be
> > quite expensive (helper call on every tb), that might be worthwhile.
>=20
> That was worthwhile. The performance increase is substantial with this
> change, in particular with tests that exercises only cycle events.

Good to know.

> > >       HFLAGS_VSX =3D 23, /* MSR_VSX if cpu has VSX */
> > >       HFLAGS_VR =3D 25,  /* MSR_VR if cpu has VRE */
> > > diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> > > index 94b4690375..d8a23e054a 100644
> > > --- a/target/ppc/helper.h
> > > +++ b/target/ppc/helper.h
> > > @@ -24,6 +24,7 @@ DEF_HELPER_2(store_mmcr0, void, env, tl)
> > >   DEF_HELPER_2(store_mmcr1, void, env, tl)
> > >   DEF_HELPER_3(store_pmc, void, env, i32, i64)
> > >   DEF_HELPER_2(read_pmc, tl, env, i32)
> > > +DEF_HELPER_2(insns_inc, void, env, i32)
> > >   #endif
> > >   DEF_HELPER_1(check_tlb_flush_local, void, env)
> > >   DEF_HELPER_1(check_tlb_flush_global, void, env)
> > > diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> > > index 99562edd57..875c2fdfc6 100644
> > > --- a/target/ppc/helper_regs.c
> > > +++ b/target/ppc/helper_regs.c
> > > @@ -115,6 +115,10 @@ static uint32_t hreg_compute_hflags_value(CPUPPC=
State *env)
> > >       if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC1) {
> > >           hflags |=3D 1 << HFLAGS_PMCC1;
> > >       }
> > > +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FC) {
> > > +        hflags |=3D 1 << HFLAGS_MMCR0FC;
> > > +    }
> > > +
> > >   #ifndef CONFIG_USER_ONLY
> > >       if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
> > > diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu=
-regs.c.inc
> > > index 25b13ad564..580e4e41b2 100644
> > > --- a/target/ppc/power8-pmu-regs.c.inc
> > > +++ b/target/ppc/power8-pmu-regs.c.inc
> > > @@ -113,6 +113,12 @@ static void write_MMCR0_common(DisasContext *ctx=
, TCGv val)
> > >        */
> > >       gen_icount_io_start(ctx);
> > >       gen_helper_store_mmcr0(cpu_env, val);
> > > +
> > > +    /*
> > > +     * End the translation block because MMCR0 writes can change
> > > +     * ctx->pmu_frozen.
> > > +     */
> > > +    ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
> > >   }
> > >   void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
> > > diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> > > index 01e0b9b8fc..59d0def79d 100644
> > > --- a/target/ppc/power8-pmu.c
> > > +++ b/target/ppc/power8-pmu.c
> > > @@ -112,6 +112,30 @@ static PMUEventType pmc_get_event(CPUPPCState *e=
nv, int sprn)
> > >       return evt_type;
> > >   }
> > > +static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
> > > +{
> > > +    bool overflow_triggered =3D false;
> > > +    int sprn;
> > > +
> > > +    /* PMC6 never counts instructions */
> > > +    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC5; sprn++) {
> > > +        if (pmc_get_event(env, sprn) !=3D PMU_EVENT_INSTRUCTIONS) {
> > > +            continue;
> > > +        }
> > > +
> > > +        env->spr[sprn] +=3D num_insns;
> > > +
> > > +        if (env->spr[sprn] >=3D PMC_COUNTER_NEGATIVE_VAL &&
> > > +            pmc_has_overflow_enabled(env, sprn)) {
> > > +
> > > +            overflow_triggered =3D true;
> > > +            env->spr[sprn] =3D PMC_COUNTER_NEGATIVE_VAL;
> >=20
> > Does the hardware PMU actually guarantee that the event will happen
> > exactly on the overflow?  Or could you count a few into the negative
> > zone before the event is delivered?
>=20
> My understand reading the ISA and from testing with the a real PMU is tha=
t yes,
> it'll guarantee that the overflow will happen when the counter reaches ex=
actly
> 0x80000000.

Ok.  We can't quite achieve that in TCG, which makes forcing the
counter to 0x8000000 a reasonable way of faking it.  Might be worth
commenting that that's what this is, though.

> > > +        }
> > > +    }
> > > +
> > > +    return overflow_triggered;
> > > +}
> > > +
> > >   static void pmu_update_cycles(CPUPPCState *env)
> > >   {
> > >       uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > > @@ -258,6 +282,20 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
> > >       return;
> > >   }
> > > +/* This helper assumes that the PMC is running. */
> > > +void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
> > > +{
> > > +    bool overflow_triggered;
> > > +    PowerPCCPU *cpu;
> > > +
> > > +    overflow_triggered =3D pmu_increment_insns(env, num_insns);
> > > +
> > > +    if (overflow_triggered) {
> > > +        cpu =3D env_archcpu(env);
> > > +        fire_PMC_interrupt(cpu);
> > > +    }
> > > +}
> > > +
> > >   static void cpu_ppc_pmu_timer_cb(void *opaque)
> > >   {
> > >       PowerPCCPU *cpu =3D opaque;
> > > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > > index 9960df6e18..ccc83d0603 100644
> > > --- a/target/ppc/translate.c
> > > +++ b/target/ppc/translate.c
> > > @@ -177,6 +177,7 @@ struct DisasContext {
> > >       bool hr;
> > >       bool mmcr0_pmcc0;
> > >       bool mmcr0_pmcc1;
> > > +    bool pmu_frozen;
> > >       ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
> > >       int singlestep_enabled;
> > >       uint32_t flags;
> > > @@ -4170,6 +4171,31 @@ static inline void gen_update_cfar(DisasContex=
t *ctx, target_ulong nip)
> > >   #endif
> > >   }
> > > +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> >=20
> > Should this actually be !CONFIG_USER_ONLY?  IIUC there are
> > circumstances where userspace could access the PMU, including
> > instruction counting.
>=20
> The user mode will not be able to use the PMU properly because the MMCR1
> reg, used to define the events to be sampled, isn't writable by userpace
> under any circunstance.

Couldn't they use PMC5 without writing MMCR1?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Kgs65RnJSkYKuOlT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGmuSUACgkQbDjKyiDZ
s5L9ixAAnM6SRjqnPpRxTe8l+OT0xsLtK5wqy+9Ew4c3Y1CmS8huJx9jWOgsfxY7
3vDWhi2rmP8fYZq4uIEFf+EQZCZQSGO6XOqEY0EF7kz42mSbe4S20GXv2Of0/ayk
IQJJfsC4LbpPt0hMfmJfARzvPXZ/dxxRn4BOcSjZoRJy/fVMdUsBrR17HlMXcvZp
YB4lIJ5S+Eni9Dyg33Zcjj2kw5asR6axSED0kSoX7HIVMEfX9Hd6U19czWRAnISN
l67WxnD0GPHICx09S2Vm/AnIznvEtQPhsk8KkpgzstDtdpOVLyJwEknd5XhJnAJL
/u+QXbC3mwoBWjgklTlQHIQVU1n6f2wjjFTieXgbq33oMLgM3Tbr5Xs+kosfMe3x
RWRUuPvAzPXb9WPhGIr5v9AdlYqVe58UMcJQL1MJMBfWuKtoIIsBuGKrnk2nkWSh
iIwoVnlXetzF2IkALzDfh05efZT6G08ClthHqD2UhwRk1Z9AulgFBUlrXkwG2wAl
oAdfzsJTZf9woftnE+7sA8AprFeRKgAiejKggCwc6bMSfhe8H4niF8+f7SjpsTsz
LRrWjGwlAqxVUiOG8WwEelnThIndERjAwJ3+wtjhfGJPiWNtzkDXrh0/nkDonNeE
pFadA1DRRLaHX0+y3oHrw+f59L/BKEmzpGOFSG4lz/rUmx1BvJU=
=qcnr
-----END PGP SIGNATURE-----

--Kgs65RnJSkYKuOlT--


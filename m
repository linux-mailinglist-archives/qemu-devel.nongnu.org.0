Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9380418E98
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:18:53 +0200 (CEST)
Received: from localhost ([::1]:35022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUj2S-0002Az-0l
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUish-00043I-70; Mon, 27 Sep 2021 01:08:47 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:45257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUisc-0000JG-Pp; Mon, 27 Sep 2021 01:08:46 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HHrJQ3Zk9z4xbP; Mon, 27 Sep 2021 15:08:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632719318;
 bh=qQLB6PPlXr3lBMUGvs070zkcIKJ3nh009we7OSZxito=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DxsgJ/nt1KBNhj4gxkNwa4kd9MIwhWkFAdVCM1D9XWOuRApuxH0npw6Tfn2r0nEmB
 X5yBCqUZZM6xSKUDprFrpzgLBscmzc/YXTStp0JDJF7LyniLT3ZYHzqog29VbJbIL6
 VQJqJUuNlmoFmIv18edTo3/vkFQZHMTUYqFXBEsg=
Date: Mon, 27 Sep 2021 14:59:24 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 05/15] target/ppc: PMU: add instruction counting
Message-ID: <YVFPrOmZtJwRIg4s@yekko>
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-6-danielhb413@gmail.com>
 <YTbG7x0acChUIC4j@yekko>
 <8bb98814-4cc8-91e5-7ad2-b27b7bf9122e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DVzaPHdIjaQRKCa3"
Content-Disposition: inline
In-Reply-To: <8bb98814-4cc8-91e5-7ad2-b27b7bf9122e@gmail.com>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DVzaPHdIjaQRKCa3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2021 at 06:11:24PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 9/6/21 22:57, David Gibson wrote:
> > On Fri, Sep 03, 2021 at 05:31:06PM -0300, Daniel Henrique Barboza wrote:
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
> > > helper_insns_inc(). This new helper from power8_pmu.c will add the
> > > instructions to the relevant counters. It'll also be responsible for
> > > triggering counter negative overflows later on.
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   target/ppc/cpu.h         |  1 +
> > >   target/ppc/helper.h      |  1 +
> > >   target/ppc/helper_regs.c |  3 ++
> > >   target/ppc/power8_pmu.c  | 70 ++++++++++++++++++++++++++++++++++++-=
---
> > >   target/ppc/translate.c   | 46 ++++++++++++++++++++++++++
> > >   5 files changed, 114 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > > index 74698a3600..4d4886ac74 100644
> > > --- a/target/ppc/cpu.h
> > > +++ b/target/ppc/cpu.h
> > > @@ -628,6 +628,7 @@ enum {
> > >       HFLAGS_FP =3D 13,  /* MSR_FP */
> > >       HFLAGS_PR =3D 14,  /* MSR_PR */
> > >       HFLAGS_PMCCCLEAR =3D 15, /* PMU MMCR0 PMCC equal to 0b00 */
> > > +    HFLAGS_MMCR0FC =3D 16, /* MMCR0 FC bit */
> > >       HFLAGS_VSX =3D 23, /* MSR_VSX if cpu has VSX */
> > >       HFLAGS_VR =3D 25,  /* MSR_VR if cpu has VRE */
> > > diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> > > index 5122632784..47dbbe6da1 100644
> > > --- a/target/ppc/helper.h
> > > +++ b/target/ppc/helper.h
> > > @@ -21,6 +21,7 @@ DEF_HELPER_1(hrfid, void, env)
> > >   DEF_HELPER_2(store_lpcr, void, env, tl)
> > >   DEF_HELPER_2(store_pcr, void, env, tl)
> > >   DEF_HELPER_2(store_mmcr0, void, env, tl)
> > > +DEF_HELPER_2(insns_inc, void, env, i32)
> > >   #endif
> > >   DEF_HELPER_1(check_tlb_flush_local, void, env)
> > >   DEF_HELPER_1(check_tlb_flush_global, void, env)
> > > diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> > > index 4c1d9575ac..27d139edd8 100644
> > > --- a/target/ppc/helper_regs.c
> > > +++ b/target/ppc/helper_regs.c
> > > @@ -109,6 +109,9 @@ static uint32_t hreg_compute_hflags_value(CPUPPCS=
tate *env)
> > >       if (((env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC) >> 18) =3D=3D 0) {
> > >           hflags |=3D 1 << HFLAGS_PMCCCLEAR;
> > >       }
> > > +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FC) {
> > > +        hflags |=3D 1 << HFLAGS_MMCR0FC;
> > > +    }
> > >   #ifndef CONFIG_USER_ONLY
> > >       if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
> > > diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
> > > index 3f7b305f4f..9769c0ff35 100644
> > > --- a/target/ppc/power8_pmu.c
> > > +++ b/target/ppc/power8_pmu.c
> > > @@ -31,10 +31,13 @@ static void update_PMC_PM_CYC(CPUPPCState *env, i=
nt sprn,
> > >       env->spr[sprn] +=3D time_delta;
> > >   }
> > > -static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
> > > -                                        uint64_t time_delta)
> > > +static uint8_t get_PMC_event(CPUPPCState *env, int sprn)
> >=20
> > I like the idea of splitting out a helper to get the selected event
> > (might even make sense to move that to the earlier patch).  What would
> > be even nicer is if it also included handling of the fact that some
> > events are specific to particular PMCs (like 0xF0 for PMC1).  That
> > means that all the event selection logic will be here, rather than
> > having to check the PMC number again in the caller.  Obviously to do
> > that you'll need some special "bad event" return value, which might
> > mean changing the return type.
>=20
> The initial idea of this function was to be a simple event extractor
> returning 0 if MMCR1 is blank. In the end of the series there are 3 calle=
rs
> of this function that will execute a specific action based on the event
> returned by it.
>=20
> I suppose that we can use the return value 0 as a 'bad value' based on the
> PMC events we're going to support, but that will not prevent the callers
> from doing a 'switch()' like logic, rechecking the PMC, to see which acti=
on
> is supposed to be taken.
>=20
> IIUC, your idea would require an additional layer of abstraction, e.g. a
> PMCEvent object, that would tie together PMC + event. Then get_PMC_event()
> would return a PMCEvent object and the caller wouldn't need to re-check t=
he
> PMC again.

More-or-less, yes.  I don't think the "object" would need to be
anything more than an enum though: "cycles", "instructions" or "invalid".

> I'll see how hard it would be to introduce this new concept in this exist=
ing
> series. If it ends up being too much rework I'll suggest to do this in a
> follow-up.
>=20
>=20
>=20
> Thanks,
>=20
>=20
> Daniel
>=20
> >=20
> > >   {
> > > -    uint8_t event, evt_extr;
> > > +    uint8_t evt_extr =3D 0;
> > > +
> > > +    if (env->spr[SPR_POWER_MMCR1] =3D=3D 0) {
> > > +        return 0;
> > > +    }
> > >       switch (sprn) {
> > >       case SPR_POWER_PMC1:
> > > @@ -50,10 +53,16 @@ static void update_programmable_PMC_reg(CPUPPCSta=
te *env, int sprn,
> > >           evt_extr =3D MMCR1_PMC4EVT_EXTR;
> > >           break;
> > >       default:
> > > -        return;
> > > +        return 0;
> > >       }
> > > -    event =3D extract64(env->spr[SPR_POWER_MMCR1], evt_extr, MMCR1_E=
VT_SIZE);
> > > +    return extract64(env->spr[SPR_POWER_MMCR1], evt_extr, MMCR1_EVT_=
SIZE);
> > > +}
> > > +
> > > +static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
> > > +                                        uint64_t time_delta)
> > > +{
> > > +    uint8_t event =3D get_PMC_event(env, sprn);
> > >       /*
> > >        * MMCR0_PMC1SEL =3D 0xF0 is the architected PowerISA v3.1 event
> > > @@ -99,8 +108,9 @@ void helper_store_mmcr0(CPUPPCState *env, target_u=
long value)
> > >       env->spr[SPR_POWER_MMCR0] =3D value;
> > > -    /* MMCR0 writes can change HFLAGS_PMCCCLEAR */
> > > -    if ((curr_value & MMCR0_PMCC) !=3D (value & MMCR0_PMCC)) {
> > > +    /* MMCR0 writes can change HFLAGS_PMCCCLEAR and HFLAGS_MMCR0FC */
> > > +    if (((curr_value & MMCR0_PMCC) !=3D (value & MMCR0_PMCC)) ||
> > > +        (curr_FC !=3D new_FC)) {
> > >           hreg_compute_hflags(env);
> > >       }
> > > @@ -123,4 +133,50 @@ void helper_store_mmcr0(CPUPPCState *env, target=
_ulong value)
> > >       }
> > >   }
> > > +static bool pmc_counting_insns(CPUPPCState *env, int sprn)
> > > +{
> > > +    bool ret =3D false;
> > > +    uint8_t event;
> > > +
> > > +    if (sprn =3D=3D SPR_POWER_PMC5) {
> > > +        return true;
> > > +    }
> > > +
> > > +    event =3D get_PMC_event(env, sprn);
> > > +
> > > +    /*
> > > +     * Event 0x2 is an implementation-dependent event that IBM
> > > +     * POWER chips implement (at least since POWER8) that is
> > > +     * equivalent to PM_INST_CMPL. Let's support this event on
> > > +     * all programmable PMCs.
> > > +     *
> > > +     * Event 0xFE is the PowerISA v3.1 architected event to
> > > +     * sample PM_INST_CMPL using PMC1.
> > > +     */
> > > +    switch (sprn) {
> > > +    case SPR_POWER_PMC1:
> > > +        return event =3D=3D 0x2 || event =3D=3D 0xFE;
> > > +    case SPR_POWER_PMC2:
> > > +    case SPR_POWER_PMC3:
> > > +    case SPR_POWER_PMC4:
> > > +        return event =3D=3D 0x2;
> > > +    default:
> > > +        break;
> > > +    }
> > > +
> > > +    return ret;
> > > +}
> > > +
> > > +/* This helper assumes that the PMC is running. */
> > > +void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
> > > +{
> > > +    int sprn;
> > > +
> > > +    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC5; sprn++) {
> > > +        if (pmc_counting_insns(env, sprn)) {
> > > +            env->spr[sprn] +=3D num_insns;
> > > +        }
> > > +    }
> > > +}
> > > +
> > >   #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
> > > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > > index c3e2e3d329..b7235a2be0 100644
> > > --- a/target/ppc/translate.c
> > > +++ b/target/ppc/translate.c
> > > @@ -176,6 +176,7 @@ struct DisasContext {
> > >       bool tm_enabled;
> > >       bool gtse;
> > >       bool pmcc_clear;
> > > +    bool pmu_frozen;
> > >       ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
> > >       int singlestep_enabled;
> > >       uint32_t flags;
> > > @@ -411,6 +412,12 @@ void spr_write_MMCR0(DisasContext *ctx, int sprn=
, int gprn)
> > >        */
> > >       gen_icount_io_start(ctx);
> > >       gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
> > > +
> > > +    /*
> > > +     * End the translation block because MMCR0 writes can change
> > > +     * ctx->pmu_frozen.
> > > +     */
> > > +    ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
> > >   }
> > >   #else
> > >   void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
> > > @@ -4407,6 +4414,22 @@ static inline void gen_update_cfar(DisasContex=
t *ctx, target_ulong nip)
> > >   #endif
> > >   }
> > > +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> > > +static void pmu_count_insns(DisasContext *ctx)
> > > +{
> > > +    /* Do not bother calling the helper if the PMU is frozen */
> > > +    if (ctx->pmu_frozen) {
> > > +        return;
> > > +    }
> > > +
> > > +    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_ins=
ns));
> > > +}
> > > +#else
> > > +static void pmu_count_insns(DisasContext *ctx)
> > > +{
> > > +    return;
> > > +}
> > > +#endif
> > >   static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
> > >   {
> > >       return translator_use_goto_tb(&ctx->base, dest);
> > > @@ -4421,9 +4444,17 @@ static void gen_lookup_and_goto_ptr(DisasConte=
xt *ctx)
> > >           } else if (sse & (CPU_SINGLE_STEP | CPU_BRANCH_STEP)) {
> > >               gen_helper_raise_exception(cpu_env, tcg_constant_i32(ge=
n_prep_dbgex(ctx)));
> > >           } else {
> > > +            pmu_count_insns(ctx);
> > >               tcg_gen_exit_tb(NULL, 0);
> > >           }
> > >       } else {
> > > +        /*
> > > +         * tcg_gen_lookup_and_goto_ptr will exit the TB if
> > > +         * CF_NO_GOTO_PTR is set. Count insns now.
> > > +         */
> > > +        if (ctx->base.tb->flags & CF_NO_GOTO_PTR) {
> > > +            pmu_count_insns(ctx);
> > > +        }
> > >           tcg_gen_lookup_and_goto_ptr();
> > >       }
> > >   }
> > > @@ -4435,6 +4466,8 @@ static void gen_goto_tb(DisasContext *ctx, int =
n, target_ulong dest)
> > >           dest =3D (uint32_t) dest;
> > >       }
> > >       if (use_goto_tb(ctx, dest)) {
> > > +        pmu_count_insns(ctx);
> > > +
> > >           tcg_gen_goto_tb(n);
> > >           tcg_gen_movi_tl(cpu_nip, dest & ~3);
> > >           tcg_gen_exit_tb(ctx->base.tb, n);
> > > @@ -8648,6 +8681,7 @@ static void ppc_tr_init_disas_context(DisasCont=
extBase *dcbase, CPUState *cs)
> > >       ctx->tm_enabled =3D (hflags >> HFLAGS_TM) & 1;
> > >       ctx->gtse =3D (hflags >> HFLAGS_GTSE) & 1;
> > >       ctx->pmcc_clear =3D (hflags >> HFLAGS_PMCCCLEAR) & 1;
> > > +    ctx->pmu_frozen =3D (hflags >> HFLAGS_MMCR0FC) & 1;
> > >       ctx->singlestep_enabled =3D 0;
> > >       if ((hflags >> HFLAGS_SE) & 1) {
> > > @@ -8767,6 +8801,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dc=
base, CPUState *cs)
> > >       switch (is_jmp) {
> > >       case DISAS_TOO_MANY:
> > >           if (use_goto_tb(ctx, nip)) {
> > > +            pmu_count_insns(ctx);
> > > +
> > >               tcg_gen_goto_tb(0);
> > >               gen_update_nip(ctx, nip);
> > >               tcg_gen_exit_tb(ctx->base.tb, 0);
> > > @@ -8777,6 +8813,14 @@ static void ppc_tr_tb_stop(DisasContextBase *d=
cbase, CPUState *cs)
> > >           gen_update_nip(ctx, nip);
> > >           /* fall through */
> > >       case DISAS_CHAIN:
> > > +        /*
> > > +         * tcg_gen_lookup_and_goto_ptr will exit the TB if
> > > +         * CF_NO_GOTO_PTR is set. Count insns now.
> > > +         */
> > > +        if (ctx->base.tb->flags & CF_NO_GOTO_PTR) {
> > > +            pmu_count_insns(ctx);
> > > +        }
> > > +
> > >           tcg_gen_lookup_and_goto_ptr();
> > >           break;
> > > @@ -8784,6 +8828,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dc=
base, CPUState *cs)
> > >           gen_update_nip(ctx, nip);
> > >           /* fall through */
> > >       case DISAS_EXIT:
> > > +        pmu_count_insns(ctx);
> > > +
> > >           tcg_gen_exit_tb(NULL, 0);
> > >           break;
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DVzaPHdIjaQRKCa3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFRT6oACgkQbDjKyiDZ
s5LHNxAAzFZ4u5sD8vVAXd0WlogwB55TdiGLZWotPodHsluhvNKEMzqHjsHTnMCr
kfHlSS959z+caeolVfJzNlEKOsNefWbHAHbVvNxPacpD1vruDqKCHiGT/P+ookgc
ft6DBA0CRlY0YLCYltnmXjhJoQ2G+Q6VRKjBM94P66VxHgScHgNHXwB+JvnuXboz
Gz9gEGgQjztxAgbAOc1WopgI7T9VjaE23fV4pJsi0pHMbaqaFeHAaDhdQye1BTWi
nuztO8XRDLj0buT0EBOGBPPiHMtOMcnoIc/p2PKB9y3rPl2E5/kIxDo6aMbp6sIA
+oWvENOJ75j5P68+b9hfZ+FyNGMaYjFknGV7pX2yFDWwxg3goJ2fjncLZiN1NkNm
jp62Qg3FlNgxvtpFFKqrWwMNFn7rXKVlxTN6URLV1er17IJ7m/YwQ206vwi62GXe
yn+taV6WRZJGKlSpXrqD9vsZRuew34Zp/HvRQewm7im+IHYLdkvaoQJ4N4mMtk+C
VxaHVB7o/5MuRMai1Q5JJVXiYoUkHM5Y7lNX+Ij49DCGchMrJbHM0TVwwwHsQYYG
oQfAIFBiO4Dy14+5cPxKrTwcXZw8NDN+jlg5OJ3oJ96Hp9hBFJflLmMZIgpT2MxO
cOWl1+vtt5YVA5hHcqiNFom+GSLk3MWoKmLlJh8ECay0Gwm9TgA=
=GnIk
-----END PGP SIGNATURE-----

--DVzaPHdIjaQRKCa3--


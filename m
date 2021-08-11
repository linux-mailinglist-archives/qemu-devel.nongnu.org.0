Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93F03E8A95
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:52:05 +0200 (CEST)
Received: from localhost ([::1]:35354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDi5s-0003uF-Ni
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDi0k-0006GR-Es; Wed, 11 Aug 2021 02:46:46 -0400
Received: from ozlabs.org ([203.11.71.1]:42805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDi0g-0002SB-BD; Wed, 11 Aug 2021 02:46:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gl0j56d2hz9sX3; Wed, 11 Aug 2021 16:46:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628664393;
 bh=/VejVR+yRk7XWU2GPeGgxshSS9uNsFRJzs4xnI7LzrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iGv/W43y0fB2NVfTvUjcOobE1OYk+MSFAKQlUSeJpxQdhl7CxdYFs9cdk6Y619PpN
 ux5WBi2rywizwUqUF3WnKj7XnuT4xSrG+dT6TnBpkZ4a5Ahcx+JlH6BzjL7rLJzAn2
 3F/7ya+o9y7fEdIL0piabSXGt1CqUo+zj9kt/7PQ=
Date: Wed, 11 Aug 2021 13:46:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 13/19] target/ppc/translate: PMU: handle setting of PMCs
 while running
Message-ID: <YRNH/kh/Fw8VCoSb@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-14-danielhb413@gmail.com>
 <YRH7KxFOysT5dTJg@yekko>
 <d6f5d9d3-3562-eb66-df8a-723f7983132d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rX6+o5M1XDwTWYuG"
Content-Disposition: inline
In-Reply-To: <d6f5d9d3-3562-eb66-df8a-723f7983132d@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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


--rX6+o5M1XDwTWYuG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 05:44:18PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/10/21 1:06 AM, David Gibson wrote:
> > On Mon, Aug 09, 2021 at 10:10:51AM -0300, Daniel Henrique Barboza wrote:
> > > The initial PMU support were made under the assumption that the count=
ers
> > > would be set before running the PMU and read after either freezing the
> > > PMU manually or via a performance monitor alert.
> > >=20
> > > Turns out that some EBB powerpc kernel tests set the counters after
> > > unfreezing the counters. Setting a PMC value when the PMU is running
> > > means that, at that moment, the baseline for calculating the events (=
set
> > > in env->pmu_base_icount) needs to be updated. Updating this baseline
> > > means that we need to update all the PMCs with their actual value at
> > > that moment. Any existing counter negative timer needs to be discarded
> > > an a new one, with the updated values, must be set again.
> > >=20
> > > This patch does that via a new 'helper_store_pmc()' that is called in
> > > the mtspr() callbacks of the PMU registers, spr_write_pmu_ureg() and
> > > spr_write_pmu_generic() in target/ppc/translate.c
> > >=20
> > > With this change, EBB powerpc kernel tests such as  'no_handler_test'
> > > are now passing.
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   target/ppc/helper.h            |  1 +
> > >   target/ppc/pmu_book3s_helper.c | 36 +++++++++++++++++++++++++++++++=
+--
> > >   target/ppc/translate.c         | 27 +++++++++++++++++++++++++
> > >   3 files changed, 62 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> > > index 5122632784..757665b360 100644
> > > --- a/target/ppc/helper.h
> > > +++ b/target/ppc/helper.h
> > > @@ -21,6 +21,7 @@ DEF_HELPER_1(hrfid, void, env)
> > >   DEF_HELPER_2(store_lpcr, void, env, tl)
> > >   DEF_HELPER_2(store_pcr, void, env, tl)
> > >   DEF_HELPER_2(store_mmcr0, void, env, tl)
> > > +DEF_HELPER_3(store_pmc, void, env, i32, i64)
> > >   #endif
> > >   DEF_HELPER_1(check_tlb_flush_local, void, env)
> > >   DEF_HELPER_1(check_tlb_flush_global, void, env)
> > > diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_h=
elper.c
> > > index 58ae65e22b..e7af273cb6 100644
> > > --- a/target/ppc/pmu_book3s_helper.c
> > > +++ b/target/ppc/pmu_book3s_helper.c
> > > @@ -173,7 +173,7 @@ void cpu_ppc_pmu_timer_init(CPUPPCState *env)
> > >       env->pmu_intr_timer =3D timer;
> > >   }
> > > -static bool mmcr0_counter_neg_cond_enabled(uint64_t mmcr0)
> > > +static bool counter_negative_cond_enabled(uint64_t mmcr0)
> >=20
> > Can you fold this rename into the patch which introduces the function
> > please.
> >=20
> > >   {
> > >       return mmcr0 & MMCR0_PMC1CE;
> > >   }
> > > @@ -219,9 +219,41 @@ void helper_store_mmcr0(CPUPPCState *env, target=
_ulong value)
> > >                * Start performance monitor alert timer for counter ne=
gative
> > >                * events, if needed.
> > >                */
> > > -            if (mmcr0_counter_neg_cond_enabled(env->spr[SPR_POWER_MM=
CR0])) {
> > > +            if (counter_negative_cond_enabled(env->spr[SPR_POWER_MMC=
R0])) {
> > >                   set_PMU_excp_timer(env);
> > >               }
> > >           }
> > >       }
> > >   }
> > > +
> > > +void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t valu=
e)
> > > +{
> > > +    bool pmu_frozen =3D env->spr[SPR_POWER_MMCR0] & MMCR0_FC;
> > > +    uint64_t curr_icount, icount_delta;
> > > +
> > > +    if (pmu_frozen) {
> > > +        env->spr[sprn] =3D value;
> > > +        return;
> > > +    }
> > > +
> > > +    curr_icount =3D (uint64_t)icount_get_raw();
> > > +    icount_delta =3D curr_icount - env->pmu_base_icount;
> > > +
> > > +    /* Update the counter with the events counted so far */
> > > +    update_PMCs(env, icount_delta);
> > > +
> > > +    /* Set the counter to the desirable value after update_PMCs() */
> > > +    env->spr[sprn] =3D value;
> > > +
> > > +    /*
> > > +     * Delete the current timer and restart a new one with the
> > > +     * updated values.
> > > +     */
> > > +    timer_del(env->pmu_intr_timer);
> > > +
> > > +    env->pmu_base_icount =3D curr_icount;
> >=20
> > I'd expect some of this code to be shared with the unfreeze path using
> > a helper.  Is there a reason that's not the case?
> >=20
> > Do you also need to deal with any counter interrupts that have already
> > been generated by the old counter?  Are the counter overflow events
> > edge-triggered or level-triggered?
>=20
>=20
> I'd say that counter negative overflow are edge triggered - we can set any
> starting value for the counters but the counter negative overflow is
> triggered always with the counter reaching 0x8000000.
>=20
> If a counter was about to trigger a c.n overflow and then the user set it
> back to 0, that c.n overflow is lost.

Hm.. those aren't actually the edge cases I'm unsure about.  The ones
I'm unclear on are:

1) If you directly set the PMC to a negative value (especially one
that's not 0x80000000 specifically) will that immediately trigger the
interrupt?  In other words is the interrupt triggered by the PMC being
negative for any reason, or only by it transitioning from positive to
negative as a result of counter increments?

2) If a PMC negative interrupt has *already* been generated, but not
yet delivered, will setting the PMC to 0 clear the pending interrupt,
or will it still be delivered?

>=20
>=20
> Thanks,
>=20
>=20
> Daniel
>=20
>=20
> >=20
> > > +    if (counter_negative_cond_enabled(env->spr[SPR_POWER_MMCR0])) {
> > > +        set_PMU_excp_timer(env);
> > > +    }
> > > +}
> > > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > > index afc254a03f..3e890cc4d8 100644
> > > --- a/target/ppc/translate.c
> > > +++ b/target/ppc/translate.c
> > > @@ -409,11 +409,25 @@ void spr_write_generic(DisasContext *ctx, int s=
prn, int gprn)
> > >   void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn)
> > >   {
> > > +    TCGv_i32 t_sprn;
> > > +
> > >       switch (sprn) {
> > >       case SPR_POWER_MMCR0:
> > >           gen_icount_io_start(ctx);
> > >           gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
> > >           break;
> > > +    case SPR_POWER_PMC1:
> > > +    case SPR_POWER_PMC2:
> > > +    case SPR_POWER_PMC3:
> > > +    case SPR_POWER_PMC4:
> > > +    case SPR_POWER_PMC5:
> > > +    case SPR_POWER_PMC6:
> > > +        gen_icount_io_start(ctx);
> > > +
> > > +        t_sprn =3D tcg_const_i32(sprn);
> > > +        gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
> > > +        tcg_temp_free_i32(t_sprn);
> > > +        break;
> > >       default:
> > >           spr_write_generic(ctx, sprn, gprn);
> > >       }
> > > @@ -585,6 +599,7 @@ void spr_write_ureg(DisasContext *ctx, int sprn, =
int gprn)
> > >   void spr_write_pmu_ureg(DisasContext *ctx, int sprn, int gprn)
> > >   {
> > >       TCGv t0, t1;
> > > +    TCGv_i32 t_sprn;
> > >       int effective_sprn =3D sprn + 0x10;
> > >       if (((ctx->spr[SPR_POWER_MMCR0] & MMCR0_PMCC) >> 18) =3D=3D 0) {
> > > @@ -616,6 +631,18 @@ void spr_write_pmu_ureg(DisasContext *ctx, int s=
prn, int gprn)
> > >           tcg_temp_free(t0);
> > >           tcg_temp_free(t1);
> > >           break;
> > > +    case SPR_POWER_PMC1:
> > > +    case SPR_POWER_PMC2:
> > > +    case SPR_POWER_PMC3:
> > > +    case SPR_POWER_PMC4:
> > > +    case SPR_POWER_PMC5:
> > > +    case SPR_POWER_PMC6:
> > > +        gen_icount_io_start(ctx);
> > > +
> > > +        t_sprn =3D tcg_const_i32(effective_sprn);
> > > +        gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
> > > +        tcg_temp_free_i32(t_sprn);
> > > +        break;
> > >       default:
> > >           gen_store_spr(effective_sprn, cpu_gpr[gprn]);
> > >           break;
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rX6+o5M1XDwTWYuG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmETR/4ACgkQbDjKyiDZ
s5KMQBAArJ+Qn2+55Jqpx6/YZubVC7ElAcE0P7gmeoWjcNungFUVmqF/vSdojByn
hzFLOYSzgE/vLNnDVE7Ox6BtnXqS2tGEsQMFddeixQ+6V0k4fHAJZWXm034HJfBE
fkIZbe7p73gxcf7DjmuqqgAZDkZuCkpZ32zfK3tV/giJwoKhAm0OIrQrwdytB/dN
3jbs9jJtCqtsxYWeZR8Nr/btYe0iyuzhm4zs+M7z3JS9Gjwec1YhQBx/aKQ8zUq7
encauYtiwIPSpiM1FdiCXEismiUoGxr7wXycSAfPncLZ0h2D18v/GqhdljfcVPJP
QZEac36dh9iDP7MFqw00GHfHm6IpIkLE1ExNLS/j/y/o6pV7S2BruVPWqGGtTb8y
6IqNHhMtEOMLOjekIX4WtAin5qn5GNv0iQxFQ0XGXXKTWf7tQKdN0Mv0LCnzUiqZ
cgSmcSn7y9rVpVZwnYnskTI7B9w62DitRDX+VgnNwxhylWl2rMxj/BxWhJCOoVw9
66ScnuGegcOPFzC1QzEzanS/7RWh8SkfgQz0xcq5ktbsS6WSP7803cFktFfauhme
eqiQ8Z0hZxwxveWoIJsOSQ86f49yzB0/yg25+RgPE+Qr9cSJ0rPcwpqzTe+dF1c2
wUqp3O5y/n3sxYWXBmnt5p7zNjugw9FD7zMP7I6GCh9kA8CaMww=
=HBUB
-----END PGP SIGNATURE-----

--rX6+o5M1XDwTWYuG--


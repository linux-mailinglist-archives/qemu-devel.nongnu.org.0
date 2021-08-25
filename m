Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAC33F6EE7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 07:45:11 +0200 (CEST)
Received: from localhost ([::1]:58254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIlio-0002G2-7X
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 01:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIle7-0008K3-CX; Wed, 25 Aug 2021 01:40:19 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35841 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIldz-0006DG-EO; Wed, 25 Aug 2021 01:40:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvZYx263Gz9sWd; Wed, 25 Aug 2021 15:40:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629870005;
 bh=56KLuT5kiKpSYlLNQ5CSnktAXQgUjmpkc1UBId+7QJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f1+ba4sjOB0x3tZ9jk20bklUiNBIFP6LGIRG5vQCugPw2jooUdKaOhkUPt4XamR16
 tVpdwd3UbEOLIX933bX8Vp5kH9Cm1K3RiLFEZIhTK5EDAJtG3ejjpcBiCxsXoGYl3o
 1nNKltjEL8zXRHPQhvdbBQLylcgWJ6AHVbi3jQYo=
Date: Wed, 25 Aug 2021 15:19:24 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 04/16] target/ppc: PMU basic cycle count for pseries TCG
Message-ID: <YSXS3FToggt+hnhz@yekko>
References: <20210824163032.394099-1-danielhb413@gmail.com>
 <20210824163032.394099-5-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CHn4pGGORONUy9LN"
Content-Disposition: inline
In-Reply-To: <20210824163032.394099-5-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
Cc: gustavo.romero@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--CHn4pGGORONUy9LN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 01:30:20PM -0300, Daniel Henrique Barboza wrote:
> This patch adds the barebones of the PMU logic by enabling cycle
> counting, done via the performance monitor counter 6. The overall logic
> goes as follows:
>=20
> - a helper is added to control the PMU state on each MMCR0 write. This
> allows for the PMU to start/stop as the frozen counter bit (MMCR0_FC)
> is cleared or set;
>=20
> - MMCR0 reg initial value is set to 0x80000000 (MMCR0_FC set) to avoid
> having to spin the PMU right at system init;
>=20
> - the intended usage is to freeze the counters by setting MMCR0_FC, do
> any additional setting of events to be counted via MMCR1 (not
> implemented yet) and enable the PMU by zeroing MMCR0_FC. Software must
> freeze counters to read the results - on the fly reading of the PMCs
> will return the starting value of each one.

Ok, I like how this is simpler than the previous version.  Since qemu
is not a cycle-accurate simulator, we basically have a choice in
emulating the PMU:
   1) we can maintain the illusion that the cpu clock goes at the
      advertised speed w.r.t. real time
or 2) we can maintain the illusion that instructions complete roughly
      as fast as we expect w.r.t. the cpu clock

We can't do both at the same time.  Well... in theory we kind of could
(on a time averaged basis at least) if we decouple the guest's notion
of "real time" from actual real time.  But that introduces a bunch of
other complications, so I don't think we want to go there.

Since it's simpler, I think (1) is probably the way to go, which is
what you've done here.

> Since there will be more PMU exclusive code to be added next, put the
> PMU logic in its own helper to keep all in the same place. The name of
> the new helper file, power8_pmu.c, is an indicative that the PMU logic
> has been tested with the IBM POWER chip family, POWER8 being the oldest
> version tested. This doesn't mean that this PMU logic will break with
> any other PPC64 chip that implements Book3s, but since we can't assert
> that this PMU will work with all available Book3s emulated processors
> we're choosing to be explicit.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu.h        |  6 ++++
>  target/ppc/cpu_init.c   |  6 ++--
>  target/ppc/helper.h     |  1 +
>  target/ppc/meson.build  |  1 +
>  target/ppc/power8_pmu.c | 74 +++++++++++++++++++++++++++++++++++++++++
>  target/ppc/spr_tcg.h    |  1 +
>  target/ppc/translate.c  | 17 +++++++++-
>  7 files changed, 102 insertions(+), 4 deletions(-)
>  create mode 100644 target/ppc/power8_pmu.c
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 739005ba29..6878d950de 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1176,6 +1176,12 @@ struct CPUPPCState {
>      uint32_t tm_vscr;
>      uint64_t tm_dscr;
>      uint64_t tm_tar;
> +
> +    /*
> +     * PMU base time value used by the PMU to calculate
> +     * running cycles.
> +     */
> +    uint64_t pmu_base_time;
>  };
> =20
>  #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 860716da18..71f052b052 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6821,8 +6821,8 @@ static void register_book3s_pmu_sup_sprs(CPUPPCStat=
e *env)
>  {
>      spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> -                     KVM_REG_PPC_MMCR0, 0x00000000);
> +                     &spr_read_generic, &spr_write_MMCR0_generic,

s/spr_write_MMCR0_generic/spr_write_MMCR0/

The generic refers to the fact that it's covering any register which
will just read back whatever value is written to it.  Now that you're
applying MMCR0 specific logic, it's not generic any more.

> +                     KVM_REG_PPC_MMCR0, 0x80000000);
>      spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
>                       SPR_NOACCESS, SPR_NOACCESS,
>                       &spr_read_generic, &spr_write_generic,
> @@ -6870,7 +6870,7 @@ static void register_book3s_pmu_user_sprs(CPUPPCSta=
te *env)
>      spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
>                   &spr_read_MMCR0_ureg, &spr_write_MMCR0_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
> -                 0x00000000);
> +                 0x80000000);
>      spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
>                   &spr_read_ureg, SPR_NOACCESS,
>                   &spr_read_ureg, &spr_write_ureg,
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 4076aa281e..5122632784 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -20,6 +20,7 @@ DEF_HELPER_1(rfscv, void, env)
>  DEF_HELPER_1(hrfid, void, env)
>  DEF_HELPER_2(store_lpcr, void, env, tl)
>  DEF_HELPER_2(store_pcr, void, env, tl)
> +DEF_HELPER_2(store_mmcr0, void, env, tl)
>  #endif
>  DEF_HELPER_1(check_tlb_flush_local, void, env)
>  DEF_HELPER_1(check_tlb_flush_global, void, env)
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index b85f295703..278ce07da9 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -14,6 +14,7 @@ ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
>    'int_helper.c',
>    'mem_helper.c',
>    'misc_helper.c',
> +  'power8_pmu.c',
>    'timebase_helper.c',
>    'translate.c',
>  ))
> diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
> new file mode 100644
> index 0000000000..47de38a99e
> --- /dev/null
> +++ b/target/ppc/power8_pmu.c
> @@ -0,0 +1,74 @@
> +/*
> + * PMU emulation helpers for TCG IBM POWER chips
> + *
> + *  Copyright IBM Corp. 2021
> + *
> + * Authors:
> + *  Daniel Henrique Barboza      <danielhb413@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "cpu.h"
> +#include "helper_regs.h"
> +#include "exec/exec-all.h"
> +#include "exec/helper-proto.h"
> +#include "qemu/error-report.h"
> +#include "qemu/main-loop.h"
> +
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +
> +static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
> +                              uint64_t time_delta)
> +{
> +    /*
> +     * The pseries and pvn clock runs at 1Ghz, meaning that
> +     * 1 nanosec equals 1 cycle.
> +     */
> +    env->spr[sprn] +=3D time_delta;
> +}
> +
> +static void update_cycles_PMCs(CPUPPCState *env)
> +{
> +    uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    uint64_t time_delta =3D now - env->pmu_base_time;
> +
> +    update_PMC_PM_CYC(env, SPR_POWER_PMC6, time_delta);
> +}
> +
> +void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
> +{
> +    target_ulong curr_value =3D env->spr[SPR_POWER_MMCR0];
> +    bool curr_FC =3D curr_value & MMCR0_FC;
> +    bool new_FC =3D value & MMCR0_FC;
> +
> +    env->spr[SPR_POWER_MMCR0] =3D value;
> +
> +    /* MMCR0 writes can change HFLAGS_PMCCCLEAR */
> +    if ((curr_value & MMCR0_PMCC) !=3D (value & MMCR0_PMCC)) {
> +        hreg_compute_hflags(env);
> +    }
> +
> +    /*
> +     * In an frozen count (FC) bit change:
> +     *
> +     * - if PMCs were running (curr_FC =3D false) and we're freezing
> +     * them (new_FC =3D true), save the PMCs values in the registers.
> +     *
> +     * - if PMCs were frozen (curr_FC =3D true) and we're activating
> +     * them (new_FC =3D false), set the new base_time for future cycle
> +     * calculations.
> +     */
> +    if (curr_FC !=3D new_FC) {
> +        if (!curr_FC) {
> +            update_cycles_PMCs(env);
> +        } else {
> +            env->pmu_base_time =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        }
> +    }
> +}
> +
> +#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index 5c383dae3d..2c5b056fc1 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -25,6 +25,7 @@
>  void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_MMCR0_generic(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index b48eec83e3..e4f75ba380 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -401,6 +401,19 @@ void spr_write_generic(DisasContext *ctx, int sprn, =
int gprn)
>      spr_store_dump_spr(sprn);
>  }
> =20
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +void spr_write_MMCR0_generic(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_icount_io_start(ctx);

Since you're not using icount any more, do you still need these?

> +    gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
> +}
> +#else
> +void spr_write_MMCR0_generic(DisasContext *ctx, int sprn, int gprn)
> +{
> +    spr_write_generic(ctx, sprn, gprn);
> +}
> +#endif
> +
>  #if !defined(CONFIG_USER_ONLY)
>  void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
>  {
> @@ -609,6 +622,8 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn=
, int gprn)
>      t0 =3D tcg_temp_new();
>      t1 =3D tcg_temp_new();
> =20
> +    gen_icount_io_start(ctx);
> +
>      /*
>       * Filter out all bits but FC, PMAO, and PMAE, according
>       * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
> @@ -620,7 +635,7 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn=
, int gprn)
>      tcg_gen_andi_tl(t1, t1, ~(MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE));
>      /* Keep all other bits intact */
>      tcg_gen_or_tl(t1, t1, t0);
> -    gen_store_spr(SPR_POWER_MMCR0, t1);
> +    gen_helper_store_mmcr0(cpu_env, t1);

Do you need this change?  Won't the gen_store_spr() basically do the
same thing as the gen_helpersince spr_write_MMCR0() expands to a
gen_helper anyway?

> =20
>      tcg_temp_free(t0);
>      tcg_temp_free(t1);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CHn4pGGORONUy9LN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEl0toACgkQbDjKyiDZ
s5IaIBAAiISsljpW64KvlKYN4ouOTiR3K8jYYBsg53K610fJ53Ib13xG+5CHLhja
SeQzNUBK1BgyX735w9g1vIptGY80Ng+8y/Bw/CB8UMFZzin5xVYtk8gaWvn/bkjG
QqsHBdpeK6o+1w63WmU/asCGku0A3IAh5Tm/epWU+hiEHen5sj4P6CB1rh4MQxQ+
Z6xS3R0Ez/JbKfcRtXa5JxSpY2GyABtE2NcvXIyKBR4lBj4UMJpdGDlEJdJULifo
azGdUS2WHVi5etikPDvyAf2O74acqjEuzvBJdYnPevuF1eyrAaW8X5a5jEa7zKK1
sVe2OdOaJSbEo1F1/y4RQ9/5eid41mE4t8RgAzWqmK+kIXdozc/DNF8x4CtqwT7c
1BI4/LCdUVdACilO3IzaIFi4rnkJNvr/CpVavpS9sw42DRuircKhxx2V8la7r1U8
V0Wd7oKf7nIYlfoV2zXYw97jrETM8gV1M+yVFBqC0uDAIfbv8gRUsiLUGvqNSarl
x1T1riGSv9dsIEj2YfoD15Cuejzo4fGApPOjuW5v2kcT3wnuioB88CEmFqgaisFj
UOA6aq3x8nqsXYupETu6pP72RXHGVuNAuYxk6vViFUv5E2PerVkBvsvRyN4BgRXR
CdR03lhuYHc0Y+R8oEFbuCvhVD/LbI3UYL2ULEA2CBVeOlBODYE=
=u8Vd
-----END PGP SIGNATURE-----

--CHn4pGGORONUy9LN--


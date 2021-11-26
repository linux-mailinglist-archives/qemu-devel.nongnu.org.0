Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F5A45EC3D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 12:12:12 +0100 (CET)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqZ9E-0007Gr-Kg
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 06:12:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mqZ4B-0005VT-3g; Fri, 26 Nov 2021 06:06:55 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:51393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mqZ47-0000ez-GJ; Fri, 26 Nov 2021 06:06:54 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J0sPt5WdWz4xbs; Fri, 26 Nov 2021 22:06:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1637924802;
 bh=OdQW0d0cj9JamXfdxuxz8IZsa0zmzTkc3PlkHrREkRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yur5vphafqZQef5fSrfbhweXTD18efMQttvvjACOSxrQ2EOBf+62szm/kllzjXkup
 J/MrBOHYTZkTKpdKgOKlGWOWkm3I9GXoDYPPogZ0zmQ51fCX1nctzZt7OmuWZexOVS
 Qmm/mAaNy+qwZlqJuavLfIWwR1KOht9MVxLZJDMY=
Date: Fri, 26 Nov 2021 13:17:10 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 02/10] target/ppc: PMU basic cycle count for pseries TCG
Message-ID: <YaBDpmJBTz755ay8@yekko>
References: <20211125150817.573204-1-danielhb413@gmail.com>
 <20211125150817.573204-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="91rTmcsuDew2urqI"
Content-Disposition: inline
In-Reply-To: <20211125150817.573204-3-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--91rTmcsuDew2urqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 12:08:09PM -0300, Daniel Henrique Barboza wrote:
> This patch adds the barebones of the PMU logic by enabling cycle
> counting. The overall logic goes as follows:
>=20
> - MMCR0 reg initial value is set to 0x80000000 (MMCR0_FC set) to avoid
> having to spin the PMU right at system init;
>=20
> - to retrieve the events that are being profiled, pmc_get_event() will
> check the current MMCR0 and MMCR1 value and return the appropriate
> PMUEventType. For PMCs 1-4, event 0x2 is the implementation dependent
> value of PMU_EVENT_INSTRUCTIONS and event 0x1E is the implementation
> dependent value of PMU_EVENT_CYCLES. These events are supported by IBM
> Power chips since Power8, at least, and the Linux Perf driver makes use
> of these events until kernel v5.15. For PMC1, event 0xF0 is the
> architected PowerISA event for cycles. Event 0xFE is the architected
> PowerISA event for instructions;
>=20
> - if the counter is frozen, either via the global MMCR0_FC bit or its
> individual frozen counter bit, PMU_EVENT_INACTIVE is returned;
>=20
> - pmu_update_cycles() will go through each counter and update the
> values of all PMCs that are counting cycles. This function will be
> called every time a MMCR0 update is done to keep counters values
> up to date. Upcoming patches will use this function to allow the
> counters to be properly updated during read/write of the PMCs
> and MMCR1 writes.
>=20
> Given that the base CPU frequency is fixed at 1Ghz for both powernv and
> pseries clock, cycle calculation assumes that 1 nanosecond equals 1 CPU
> cycle. Cycle value is then calculated by adding the elapsed time, in
> nanoseconds, of the last cycle update done via pmu_update_cycles().
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu.h                 |  20 +++++
>  target/ppc/cpu_init.c            |   6 +-
>  target/ppc/helper.h              |   1 +
>  target/ppc/power8-pmu-regs.c.inc |  23 +++++-
>  target/ppc/power8-pmu.c          | 122 +++++++++++++++++++++++++++++++
>  target/ppc/spr_tcg.h             |   1 +
>  6 files changed, 169 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 2ad47b06d0..9c732953f0 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -361,6 +361,9 @@ typedef enum {
>  #define MMCR0_FCECE  PPC_BIT(38)         /* FC on Enabled Cond or Event =
*/
>  #define MMCR0_PMCC0  PPC_BIT(44)         /* PMC Control bit 0 */
>  #define MMCR0_PMCC1  PPC_BIT(45)         /* PMC Control bit 1 */
> +#define MMCR0_PMCC   PPC_BITMASK(44, 45) /* PMC Control */
> +#define MMCR0_FC14   PPC_BIT(58)         /* PMC Freeze Counters 1-4 bit =
*/
> +#define MMCR0_FC56   PPC_BIT(59)         /* PMC Freeze Counters 5-6 bit =
*/
>  /* MMCR0 userspace r/w mask */
>  #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
>  /* MMCR2 userspace r/w mask */
> @@ -373,6 +376,17 @@ typedef enum {
>  #define MMCR2_UREG_MASK (MMCR2_FC1P0 | MMCR2_FC2P0 | MMCR2_FC3P0 | \
>                           MMCR2_FC4P0 | MMCR2_FC5P0 | MMCR2_FC6P0)
> =20
> +#define MMCR1_EVT_SIZE 8
> +/* extract64() does a right shift before extracting */
> +#define MMCR1_PMC1SEL_START 32
> +#define MMCR1_PMC1EVT_EXTR (64 - MMCR1_PMC1SEL_START - MMCR1_EVT_SIZE)
> +#define MMCR1_PMC2SEL_START 40
> +#define MMCR1_PMC2EVT_EXTR (64 - MMCR1_PMC2SEL_START - MMCR1_EVT_SIZE)
> +#define MMCR1_PMC3SEL_START 48
> +#define MMCR1_PMC3EVT_EXTR (64 - MMCR1_PMC3SEL_START - MMCR1_EVT_SIZE)
> +#define MMCR1_PMC4SEL_START 56
> +#define MMCR1_PMC4EVT_EXTR (64 - MMCR1_PMC4SEL_START - MMCR1_EVT_SIZE)
> +
>  /* LPCR bits */
>  #define LPCR_VPM0         PPC_BIT(0)
>  #define LPCR_VPM1         PPC_BIT(1)
> @@ -1207,6 +1221,12 @@ struct CPUPPCState {
>       * when counting cycles.
>       */
>      QEMUTimer *pmu_cyc_overflow_timers[PMU_TIMERS_NUM];
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
> index 9610e65c76..e0b6fe4057 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6821,8 +6821,8 @@ static void register_book3s_pmu_sup_sprs(CPUPPCStat=
e *env)
>  {
>      spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> -                     KVM_REG_PPC_MMCR0, 0x00000000);
> +                     &spr_read_generic, &spr_write_MMCR0,
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
> index 627811cefc..ea60a7493c 100644
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
> diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-reg=
s.c.inc
> index 7391851238..fbb8977641 100644
> --- a/target/ppc/power8-pmu-regs.c.inc
> +++ b/target/ppc/power8-pmu-regs.c.inc
> @@ -104,6 +104,17 @@ void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn=
, int sprn)
>      tcg_temp_free(t0);
>  }
> =20
> +static void write_MMCR0_common(DisasContext *ctx, TCGv val)
> +{
> +    /*
> +     * helper_store_mmcr0 will make clock based operations that
> +     * will cause 'bad icount read' errors if we do not execute
> +     * gen_icount_io_start() beforehand.
> +     */
> +    gen_icount_io_start(ctx);
> +    gen_helper_store_mmcr0(cpu_env, val);
> +}
> +
>  void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
>  {
>      TCGv masked_gprn;
> @@ -119,7 +130,7 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn=
, int gprn)
>       */
>      masked_gprn =3D masked_gprn_for_spr_write(gprn, SPR_POWER_MMCR0,
>                                              MMCR0_UREG_MASK);
> -    gen_store_spr(SPR_POWER_MMCR0, masked_gprn);
> +    write_MMCR0_common(ctx, masked_gprn);
> =20
>      tcg_temp_free(masked_gprn);
>  }
> @@ -219,6 +230,11 @@ void spr_write_PMC56_ureg(DisasContext *ctx, int spr=
n, int gprn)
>      /* The remaining steps are similar to PMCs 1-4 userspace write */
>      spr_write_PMC14_ureg(ctx, sprn, gprn);
>  }
> +
> +void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
> +{
> +    write_MMCR0_common(ctx, cpu_gpr[gprn]);
> +}
>  #else
>  void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
>  {
> @@ -259,4 +275,9 @@ void spr_write_PMC56_ureg(DisasContext *ctx, int sprn=
, int gprn)
>  {
>      spr_noaccess(ctx, gprn, sprn);
>  }
> +
> +void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
> +{
> +    spr_write_generic(ctx, sprn, gprn);
> +}
>  #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index e66c152eb5..47932ded4f 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -23,6 +23,128 @@
> =20
>  #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> =20
> +static bool pmc_is_inactive(CPUPPCState *env, int sprn)
> +{
> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FC) {
> +        return true;
> +    }
> +
> +    if (sprn < SPR_POWER_PMC5) {
> +        return env->spr[SPR_POWER_MMCR0] & MMCR0_FC14;
> +    }
> +
> +    return env->spr[SPR_POWER_MMCR0] & MMCR0_FC56;
> +}
> +
> +/*
> + * For PMCs 1-4, IBM POWER chips has support for an implementation
> + * dependent event, 0x1E, that enables cycle counting. The Linux kernel
> + * makes extensive use of 0x1E, so let's also support it.
> + *
> + * Likewise, event 0x2 is an implementation-dependent event that IBM
> + * POWER chips implement (at least since POWER8) that is equivalent to
> + * PM_INST_CMPL. Let's support this event on PMCs 1-4 as well.
> + */
> +static PMUEventType pmc_get_event(CPUPPCState *env, int sprn)
> +{
> +    uint8_t mmcr1_evt_extr[] =3D { MMCR1_PMC1EVT_EXTR, MMCR1_PMC2EVT_EXT=
R,
> +                                 MMCR1_PMC3EVT_EXTR, MMCR1_PMC4EVT_EXTR =
};
> +    PMUEventType evt_type =3D PMU_EVENT_INVALID;
> +    uint8_t pmcsel;
> +    int i;
> +
> +    if (pmc_is_inactive(env, sprn)) {
> +        return PMU_EVENT_INACTIVE;
> +    }
> +
> +    if (sprn =3D=3D SPR_POWER_PMC5) {
> +        return PMU_EVENT_INSTRUCTIONS;
> +    }
> +
> +    if (sprn =3D=3D SPR_POWER_PMC6) {
> +        return PMU_EVENT_CYCLES;
> +    }
> +
> +    i =3D sprn - SPR_POWER_PMC1;
> +    pmcsel =3D extract64(env->spr[SPR_POWER_MMCR1], mmcr1_evt_extr[i],
> +                       MMCR1_EVT_SIZE);
> +
> +    switch (pmcsel) {
> +    case 0x2:
> +        evt_type =3D PMU_EVENT_INSTRUCTIONS;
> +        break;
> +    case 0x1E:
> +        evt_type =3D PMU_EVENT_CYCLES;
> +        break;
> +    case 0xF0:
> +        /*
> +         * PMC1SEL =3D 0xF0 is the architected PowerISA v3.1
> +         * event that counts cycles using PMC1.
> +         */
> +        if (sprn =3D=3D SPR_POWER_PMC1) {
> +            evt_type =3D PMU_EVENT_CYCLES;
> +        }
> +        break;
> +    case 0xFE:
> +        /*
> +         * PMC1SEL =3D 0xFE is the architected PowerISA v3.1
> +         * event to sample instructions using PMC1.
> +         */
> +        if (sprn =3D=3D SPR_POWER_PMC1) {
> +            evt_type =3D PMU_EVENT_INSTRUCTIONS;
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return evt_type;
> +}
> +
> +static void pmu_update_cycles(CPUPPCState *env)
> +{
> +    uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    uint64_t time_delta =3D now - env->pmu_base_time;
> +    int sprn;
> +
> +    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC6; sprn++) {
> +        if (pmc_get_event(env, sprn) !=3D PMU_EVENT_CYCLES) {
> +            continue;
> +        }
> +
> +        /*
> +         * The pseries and powernv clock runs at 1Ghz, meaning
> +         * that 1 nanosec equals 1 cycle.
> +         */
> +        env->spr[sprn] +=3D time_delta;
> +    }
> +
> +    /* Update base_time for future calculations */
> +    env->pmu_base_time =3D now;
> +}
> +
> +void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
> +{
> +    target_ulong curr_value =3D env->spr[SPR_POWER_MMCR0];
> +    bool curr_FC =3D curr_value & MMCR0_FC;
> +    bool new_FC =3D value & MMCR0_FC;
> +
> +    pmu_update_cycles(env);
> +
> +    env->spr[SPR_POWER_MMCR0] =3D value;
> +
> +    /*
> +     * MMCR0 writes can change HFLAGS_PMCCCLEAR and HFLAGS_MMCR0FC.
> +     * hreg_compute_hflags() does too much stuff to be called
> +     * needlessly, so check beforehand if we really need a hflags
> +     * update.
> +     */
> +    if (((curr_value & MMCR0_PMCC) !=3D (value & MMCR0_PMCC)) ||
> +        (curr_FC !=3D new_FC)) {
> +        hreg_compute_hflags(env);
> +    }
> +}
> +
>  static void fire_PMC_interrupt(PowerPCCPU *cpu)
>  {
>      CPUPPCState *env =3D &cpu->env;
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index 520f1ef233..eb1d0c2bf0 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -25,6 +25,7 @@
>  void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_lr(DisasContext *ctx, int gprn, int sprn);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--91rTmcsuDew2urqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGgQ6QACgkQbDjKyiDZ
s5IDrg//XosdNO3AMUTzt7O3/CsdcaGNTUYJjgBoEXjJhCKww3hNymtDSZHp/Ibo
Dcm/pNWufUpizJyRBz+O3S6N9zRCmbI1axy5e2kvWZ+PwsvdPhBqkOkpA31zulKp
4JO1Yu+gUJFgnt2KUIV15SUbBooFXhfsIJZdGw3Ugho1S+x4XqUETHYoZVtwoUoG
3eUEPz58g/FexoMVKrWHw7r/ah7SRa4MIzth/mFju/CRqNLPzhWf5CeNpH1sosyQ
VtW56IXyum30HT1SDGgrLS9AVoTGRzjWnGCgbU5sGbX5IicQhAXpW4F2LTJhFRrB
shjoxuEDQ+culUENj5H+IAaxJgFyixr2c6/42XlIjxepsc5Usx3Rs02TdDj7wdWf
AUBTmHC5/zG8iM1f57mnBxGvXdmXSJ4NMmunNqPBwYkVnSk1pwr5gJGMUJYfuDcJ
/DjYbHtkV+xXcJKaF7eU1f2oXSkQbOCnojXxJIhFcgm7IRFYvNVVWYhjYeJjodq2
waNLBXRLz/aFgdgIXvH3EnZWw7LYLDhZORUF8STVbwP6TywUaQtg+GhXUCcLdqO8
EQEi0Ej4ZTEm06Wz7wXTrTapYcrBqqAp0E1v/g0PsJwumK+XtpBqjhwOxdwH/x4A
Ht2rYCGCZJblgo4VdNpJyBafNqTlTO/cRR7GHJ30zDzjbxnAyGc=
=CNmi
-----END PGP SIGNATURE-----

--91rTmcsuDew2urqI--


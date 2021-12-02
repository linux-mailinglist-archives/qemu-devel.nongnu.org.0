Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213BF465DFB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 06:44:54 +0100 (CET)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mseto-0007Ay-Kw
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 00:44:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mseob-00064i-8n; Thu, 02 Dec 2021 00:39:30 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:43275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mseoV-0001xZ-JD; Thu, 02 Dec 2021 00:39:28 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J4PsF00L2z4xZ4; Thu,  2 Dec 2021 16:39:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638423553;
 bh=hblzcNQMH3R3vd+N4mj8V5WSorIeVsAPy8iS5dRiEHE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CWfQQeecIrQvgF/Xt9mRNIhRxo5lFheoa4Bs5YjExFFYlsl4xjxl8cV8Z8RyK9NKA
 E5EM6zJpf0r1ukM7RN9zbBf+z3RkksSED0DyUze1CSam7aLo2UR+qQ22WZfhgc13Ux
 A4e/DF8Vhee8+JkI+uAnxrRtqNSKKNIWMReO8EHk=
Date: Thu, 2 Dec 2021 13:42:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v9 06/10] target/ppc: enable PMU instruction count
Message-ID: <YagyqbzFYL0Ddv4v@yekko>
References: <20211201151734.654994-1-danielhb413@gmail.com>
 <20211201151734.654994-7-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eiW1bt/pn4B76Lff"
Content-Disposition: inline
In-Reply-To: <20211201151734.654994-7-danielhb413@gmail.com>
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


--eiW1bt/pn4B76Lff
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 12:17:30PM -0300, Daniel Henrique Barboza wrote:
> The PMU is already counting cycles by calculating time elapsed in
> nanoseconds. Counting instructions is a different matter and requires
> another approach.
>=20
> This patch adds the capability of counting completed instructions (Perf
> event PM_INST_CMPL) by counting the amount of instructions translated in
> each translation block right before exiting it.
>=20
> A new pmu_count_insns() helper in translation.c was added to do that.
> After verifying that the PMU is counting instructions, call
> helper_insns_inc(). This new helper from power8-pmu.c will add the
> instructions to the relevant counters. It'll also be responsible for
> triggering counter negative overflows as it is already being done with
> cycles.
>=20
> To verify whether the PMU is counting instructions or now, a new hflags
> named 'HFLAGS_INSN_CNT' is introduced. This flag will match the internal
> state of the PMU. We're be using this flag to avoid calling
> helper_insn_inc() when we do not have a valid instruction event being
> sampled.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu.h                 |  1 +
>  target/ppc/helper.h              |  1 +
>  target/ppc/helper_regs.c         |  7 ++++
>  target/ppc/power8-pmu-regs.c.inc |  6 +++
>  target/ppc/power8-pmu.c          | 67 +++++++++++++++++++++++++++++++-
>  target/ppc/power8-pmu.h          |  1 +
>  target/ppc/translate.c           | 64 ++++++++++++++++++++++++++++++
>  7 files changed, 146 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index f562d5b933..28a185fb25 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -655,6 +655,7 @@ enum {
>      HFLAGS_PR =3D 14,  /* MSR_PR */
>      HFLAGS_PMCC0 =3D 15,  /* MMCR0 PMCC bit 0 */
>      HFLAGS_PMCC1 =3D 16,  /* MMCR0 PMCC bit 1 */
> +    HFLAGS_INSN_CNT =3D 17, /* PMU instruction count enabled */
>      HFLAGS_VSX =3D 23, /* MSR_VSX if cpu has VSX */
>      HFLAGS_VR =3D 25,  /* MSR_VR if cpu has VRE */
> =20
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 94b4690375..d8a23e054a 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -24,6 +24,7 @@ DEF_HELPER_2(store_mmcr0, void, env, tl)
>  DEF_HELPER_2(store_mmcr1, void, env, tl)
>  DEF_HELPER_3(store_pmc, void, env, i32, i64)
>  DEF_HELPER_2(read_pmc, tl, env, i32)
> +DEF_HELPER_2(insns_inc, void, env, i32)
>  #endif
>  DEF_HELPER_1(check_tlb_flush_local, void, env)
>  DEF_HELPER_1(check_tlb_flush_global, void, env)
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 99562edd57..b847928842 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -23,6 +23,7 @@
>  #include "exec/exec-all.h"
>  #include "sysemu/kvm.h"
>  #include "helper_regs.h"
> +#include "power8-pmu.h"
> =20
>  /* Swap temporary saved registers with GPRs */
>  void hreg_swap_gpr_tgpr(CPUPPCState *env)
> @@ -121,6 +122,12 @@ static uint32_t hreg_compute_hflags_value(CPUPPCStat=
e *env)
>          hflags |=3D 1 << HFLAGS_HV;
>      }
> =20
> +#if defined(TARGET_PPC64)
> +    if (pmu_insn_cnt_enabled(env)) {
> +        hflags |=3D 1 << HFLAGS_INSN_CNT;
> +    }
> +#endif
> +
>      /*
>       * This is our encoding for server processors. The architecture
>       * specifies that there is no such thing as userspace with
> diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-reg=
s.c.inc
> index 25b13ad564..2bab6cece7 100644
> --- a/target/ppc/power8-pmu-regs.c.inc
> +++ b/target/ppc/power8-pmu-regs.c.inc
> @@ -113,6 +113,12 @@ static void write_MMCR0_common(DisasContext *ctx, TC=
Gv val)
>       */
>      gen_icount_io_start(ctx);
>      gen_helper_store_mmcr0(cpu_env, val);
> +
> +    /*
> +     * End the translation block because MMCR0 writes can change
> +     * ctx->pmu_insn_cnt.
> +     */
> +    ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
>  }
> =20
>  void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index 399234a2fc..e163ba5640 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -112,6 +112,54 @@ static PMUEventType pmc_get_event(CPUPPCState *env, =
int sprn)
>      return evt_type;
>  }
> =20
> +bool pmu_insn_cnt_enabled(CPUPPCState *env)
> +{
> +    int sprn;
> +
> +    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC5; sprn++) {
> +        if (pmc_get_event(env, sprn) =3D=3D PMU_EVENT_INSTRUCTIONS) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
> +{
> +    bool overflow_triggered =3D false;
> +    int sprn;
> +
> +    /* PMC6 never counts instructions */
> +    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC5; sprn++) {
> +        if (pmc_get_event(env, sprn) !=3D PMU_EVENT_INSTRUCTIONS) {
> +            continue;
> +        }
> +
> +        env->spr[sprn] +=3D num_insns;
> +
> +        if (env->spr[sprn] >=3D PMC_COUNTER_NEGATIVE_VAL &&
> +            pmc_has_overflow_enabled(env, sprn)) {
> +
> +            overflow_triggered =3D true;
> +
> +            /*
> +             * The real PMU will always trigger a counter overflow with
> +             * PMC_COUNTER_NEGATIVE_VAL. We don't have an easy way to
> +             * do that since we're counting block of instructions at
> +             * the end of each translation block, and we're probably
> +             * passing this value at this point.
> +             *
> +             * Let's write PMC_COUNTER_NEGATIVE_VAL to the overflowed
> +             * counter to simulate what the real hardware would do.
> +             */
> +            env->spr[sprn] =3D PMC_COUNTER_NEGATIVE_VAL;
> +        }
> +    }
> +
> +    return overflow_triggered;
> +}
> +
>  static void pmu_update_cycles(CPUPPCState *env)
>  {
>      uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> @@ -195,7 +243,7 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulon=
g value)
> =20
>      env->spr[SPR_POWER_MMCR0] =3D value;
> =20
> -    /* MMCR0 writes can change HFLAGS_PMCCCLEAR */
> +    /* MMCR0 writes can change HFLAGS_PMCCCLEAR and HFLAGS_INSN_CNT */
>      hreg_compute_hflags(env);
> =20
>      /* Update cycle overflow timers with the current MMCR0 state */
> @@ -207,6 +255,9 @@ void helper_store_mmcr1(CPUPPCState *env, uint64_t va=
lue)
>      pmu_update_cycles(env);
> =20
>      env->spr[SPR_POWER_MMCR1] =3D value;
> +
> +    /* MMCR1 writes can change HFLAGS_INSN_CNT */
> +    hreg_compute_hflags(env);
>  }
> =20
>  target_ulong helper_read_pmc(CPUPPCState *env, uint32_t sprn)
> @@ -237,6 +288,20 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
>      return;
>  }
> =20
> +/* This helper assumes that the PMC is running. */
> +void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
> +{
> +    bool overflow_triggered;
> +    PowerPCCPU *cpu;
> +
> +    overflow_triggered =3D pmu_increment_insns(env, num_insns);
> +
> +    if (overflow_triggered) {
> +        cpu =3D env_archcpu(env);
> +        fire_PMC_interrupt(cpu);
> +    }
> +}
> +
>  static void cpu_ppc_pmu_timer_cb(void *opaque)
>  {
>      PowerPCCPU *cpu =3D opaque;
> diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
> index 49a813a443..3ee4b4cda5 100644
> --- a/target/ppc/power8-pmu.h
> +++ b/target/ppc/power8-pmu.h
> @@ -21,5 +21,6 @@
>  #include "qemu/main-loop.h"
> =20
>  void cpu_ppc_pmu_init(CPUPPCState *env);
> +bool pmu_insn_cnt_enabled(CPUPPCState *env);
> =20
>  #endif
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 9960df6e18..896b916021 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -177,6 +177,7 @@ struct DisasContext {
>      bool hr;
>      bool mmcr0_pmcc0;
>      bool mmcr0_pmcc1;
> +    bool pmu_insn_cnt;
>      ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
>      int singlestep_enabled;
>      uint32_t flags;
> @@ -4170,6 +4171,49 @@ static inline void gen_update_cfar(DisasContext *c=
tx, target_ulong nip)
>  #endif
>  }
> =20
> +#if defined(TARGET_PPC64)
> +static void pmu_count_insns(DisasContext *ctx)
> +{
> +    /*
> +     * Do not bother calling the helper if the PMU isn't counting
> +     * instructions.
> +     */
> +    if (!ctx->pmu_insn_cnt) {
> +        return;
> +    }
> +
> + #if !defined(CONFIG_USER_ONLY)
> +    /*
> +     * The PMU insns_inc() helper stops the internal PMU timer if a
> +     * counter overflows happens. In that case, if the guest is
> +     * running with icount and we do not handle it beforehand,
> +     * the helper can trigger a 'bad icount read'.
> +     */
> +    gen_icount_io_start(ctx);
> +
> +    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
> +#else
> +    /*
> +     * User mode can read (but not write) PMC5 and start/stop
> +     * the PMU via MMCR0_FC. In this case just increment
> +     * PMC5 with base.num_insns.
> +     */
> +    TCGv t0 =3D tcg_temp_new();
> +
> +    gen_load_spr(t0, SPR_POWER_PMC5);
> +    tcg_gen_addi_tl(t0, t0, ctx->base.num_insns);
> +    gen_store_spr(SPR_POWER_PMC5, t0);
> +
> +    tcg_temp_free(t0);
> +#endif /* #if !defined(CONFIG_USER_ONLY) */
> +}
> +#else
> +static void pmu_count_insns(DisasContext *ctx)
> +{
> +    return;
> +}
> +#endif /* #if defined(TARGET_PPC64) */
> +
>  static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
>  {
>      return translator_use_goto_tb(&ctx->base, dest);
> @@ -4180,6 +4224,14 @@ static void gen_lookup_and_goto_ptr(DisasContext *=
ctx)
>      if (unlikely(ctx->singlestep_enabled)) {
>          gen_debug_exception(ctx);
>      } else {
> +        /*
> +         * tcg_gen_lookup_and_goto_ptr will exit the TB if
> +         * CF_NO_GOTO_PTR is set. Count insns now.
> +         */
> +        if (ctx->base.tb->flags & CF_NO_GOTO_PTR) {
> +            pmu_count_insns(ctx);
> +        }
> +
>          tcg_gen_lookup_and_goto_ptr();
>      }
>  }
> @@ -4191,6 +4243,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, t=
arget_ulong dest)
>          dest =3D (uint32_t) dest;
>      }
>      if (use_goto_tb(ctx, dest)) {
> +        pmu_count_insns(ctx);
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_tl(cpu_nip, dest & ~3);
>          tcg_gen_exit_tb(ctx->base.tb, n);
> @@ -8458,6 +8511,7 @@ static void ppc_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
>      ctx->hr =3D (hflags >> HFLAGS_HR) & 1;
>      ctx->mmcr0_pmcc0 =3D (hflags >> HFLAGS_PMCC0) & 1;
>      ctx->mmcr0_pmcc1 =3D (hflags >> HFLAGS_PMCC1) & 1;
> +    ctx->pmu_insn_cnt =3D (hflags >> HFLAGS_INSN_CNT) & 1;
> =20
>      ctx->singlestep_enabled =3D 0;
>      if ((hflags >> HFLAGS_SE) & 1) {
> @@ -8564,6 +8618,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase=
, CPUState *cs)
>      switch (is_jmp) {
>      case DISAS_TOO_MANY:
>          if (use_goto_tb(ctx, nip)) {
> +            pmu_count_insns(ctx);
>              tcg_gen_goto_tb(0);
>              gen_update_nip(ctx, nip);
>              tcg_gen_exit_tb(ctx->base.tb, 0);
> @@ -8574,6 +8629,14 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbas=
e, CPUState *cs)
>          gen_update_nip(ctx, nip);
>          /* fall through */
>      case DISAS_CHAIN:
> +        /*
> +         * tcg_gen_lookup_and_goto_ptr will exit the TB if
> +         * CF_NO_GOTO_PTR is set. Count insns now.
> +         */
> +        if (ctx->base.tb->flags & CF_NO_GOTO_PTR) {
> +            pmu_count_insns(ctx);
> +        }
> +
>          tcg_gen_lookup_and_goto_ptr();
>          break;
> =20
> @@ -8581,6 +8644,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase=
, CPUState *cs)
>          gen_update_nip(ctx, nip);
>          /* fall through */
>      case DISAS_EXIT:
> +        pmu_count_insns(ctx);
>          tcg_gen_exit_tb(NULL, 0);
>          break;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eiW1bt/pn4B76Lff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGoMqcACgkQbDjKyiDZ
s5LmEQ//XL7SUBnPxdCKFuHmPcQb0msj20UTaVagKvGflJ+SggklFa3VT+tmrFWV
gj3s2Lzh1SvT+w4/gn9/XdonUQDM51MEDVML186JE9w7qqn94ZXkQ6qPumTpwJlu
Z7eL3iT1wML7LTTCf4UYaUM1Hs/6txwF8VJNNUMrZV1uy+jarvguRMvtO2BUa8OD
B9bZ3PRNFB4MByCk/wQvS2uUYWXBT72/8Ju4j7NWKk3c9qg3yEeLPH6hz38Gb7ye
KOcFyyfqWvae8P2CTIGopEY53V9xYQF0ZpQuY/nqEjJ78y3Sc9KsGE20TgKqYZpl
939NADxuJLiTW/vxRFhlXip2x1vLkDhI8QkgtCHuTZqkgSv8V6TeR9rdv1kkB2eM
rHdEtg88qltPYlEDlZ478sjaod/V7dP57WXJzu9+SSdOulWqTpc+81e/PDKHAsIT
YI69TyPz5fEjUeYEHJ+2jDu3l5JXZUG4Vvp7PgT89Cdgzw/zEHkDVWDqHCv0Oyy6
KmE4Fj8bUtdTHXxZoOLjU4Lk30O1Xj5SG3Aat726WYygUplNamILo4tpBEosLaT6
PDPvkmDWpP2/kaSJLAOGpZgzA2mLHCjMJX7cOxOv43V0Sk1Tac/JyFcynvuxN7Q4
W7V2RmNDaKkqVlNtAHCLbMXJtR+zESwhSors554PBg8ulGRd2AM=
=IMk6
-----END PGP SIGNATURE-----

--eiW1bt/pn4B76Lff--


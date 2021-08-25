Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86A73F6EF6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 07:48:32 +0200 (CEST)
Received: from localhost ([::1]:36014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIlm3-0006S2-Ng
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 01:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIleB-0008Q7-Ql; Wed, 25 Aug 2021 01:40:23 -0400
Received: from ozlabs.org ([203.11.71.1]:45815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIldz-0006DA-O6; Wed, 25 Aug 2021 01:40:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvZYx2xY2z9sX2; Wed, 25 Aug 2021 15:40:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629870005;
 bh=WHGzXgEiAdlKrHETy//1wTZ6y/FxdW2D1yUPcs426MI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EV6vf/W6ojMx8MlrbdzMRfA2kuyFtqyi3R+tRDwfSngW3uaoaWFGgcC2CEmvL6N3X
 nQMPJ8NlqzthM3hfLiZ7qbOKn6Ocfa698JkuvlUrAb26Qr2kYHZTy26RmdHzAHhybk
 r/iqbUtDILsOaMiZ8EsnYe9Fa0k7TOex8hpjbuSI=
Date: Wed, 25 Aug 2021 15:31:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 06/16] target/ppc: PMU: add instruction counting
Message-ID: <YSXVoP23iH+r0fxy@yekko>
References: <20210824163032.394099-1-danielhb413@gmail.com>
 <20210824163032.394099-7-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="koWldiCNpSBAwjx0"
Content-Disposition: inline
In-Reply-To: <20210824163032.394099-7-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: gustavo.romero@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--koWldiCNpSBAwjx0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 01:30:22PM -0300, Daniel Henrique Barboza wrote:
> The PMU is already counting cycles by calculating time elapsed in
> nanoseconds. Counting instructions is a different matter and requires
> another approach.
>=20
> This patch adds the capability of counting completed instructions
> (Perf event PM_INST_CMPL) by counting the amount of instructions
> translated in each translation block right before exiting it.
>=20
> A new pmu_count_insns() helper in translation.c was added to do that.
> After verifying that the PMU is running (MMCR0_FC bit not set), we
> call helper_insns_inc(). This is new helper from power8_pmu.c that
> will add the instructions to the relevant counters.
>=20
> At this moment helper_insns_inc() is just summing instructions to
> counters, but it will also trigger counter negative overflow in a
> later patch.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/helper.h     |  1 +
>  target/ppc/power8_pmu.c | 61 ++++++++++++++++++++++++++++++++++++++---
>  target/ppc/translate.c  | 46 +++++++++++++++++++++++++++++++
>  3 files changed, 104 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 5122632784..47dbbe6da1 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -21,6 +21,7 @@ DEF_HELPER_1(hrfid, void, env)
>  DEF_HELPER_2(store_lpcr, void, env, tl)
>  DEF_HELPER_2(store_pcr, void, env, tl)
>  DEF_HELPER_2(store_mmcr0, void, env, tl)
> +DEF_HELPER_2(insns_inc, void, env, i32)
>  #endif
>  DEF_HELPER_1(check_tlb_flush_local, void, env)
>  DEF_HELPER_1(check_tlb_flush_global, void, env)
> diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
> index 007007824d..311eaa358f 100644
> --- a/target/ppc/power8_pmu.c
> +++ b/target/ppc/power8_pmu.c
> @@ -31,10 +31,9 @@ static void update_PMC_PM_CYC(CPUPPCState *env, int sp=
rn,
>      env->spr[sprn] +=3D time_delta;
>  }
> =20
> -static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
> -                                        uint64_t time_delta)
> +static uint8_t get_PMC_event(CPUPPCState *env, int sprn)
>  {
> -    uint8_t event;
> +    int event =3D 0x0;
> =20
>      switch (sprn) {
>      case SPR_POWER_PMC1:
> @@ -53,9 +52,17 @@ static void update_programmable_PMC_reg(CPUPPCState *e=
nv, int sprn,
>          event =3D MMCR1_PMC4SEL & env->spr[SPR_POWER_MMCR1];
>          break;
>      default:
> -        return;
> +        break;
>      }
> =20
> +    return event;
> +}
> +
> +static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
> +                                        uint64_t time_delta)
> +{
> +    uint8_t event =3D get_PMC_event(env, sprn);
> +
>      /*
>       * MMCR0_PMC1SEL =3D 0xF0 is the architected PowerISA v3.1 event
>       * that counts cycles using PMC1.
> @@ -124,4 +131,50 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulo=
ng value)
>      }
>  }
> =20
> +static bool pmc_counting_insns(CPUPPCState *env, int sprn)
> +{
> +    bool ret =3D false;
> +    uint8_t event;
> +
> +    if (sprn =3D=3D SPR_POWER_PMC5) {
> +        return true;
> +    }
> +
> +    event =3D get_PMC_event(env, sprn);
> +
> +    /*
> +     * Event 0x2 is an implementation-dependent event that IBM
> +     * POWER chips implement (at least since POWER8) that is
> +     * equivalent to PM_INST_CMPL. Let's support this event on
> +     * all programmable PMCs.
> +     *
> +     * Event 0xFE is the PowerISA v3.1 architected event to
> +     * sample PM_INST_CMPL using PMC1.
> +     */
> +    switch (sprn) {
> +    case SPR_POWER_PMC1:
> +        return event =3D=3D 0x2 || event =3D=3D 0xFE;
> +    case SPR_POWER_PMC2:
> +    case SPR_POWER_PMC3:
> +    case SPR_POWER_PMC4:
> +        return event =3D=3D 0x2;
> +    default:
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +/* This helper assumes that the PMC is running. */
> +void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
> +{
> +    int sprn;
> +
> +    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC5; sprn++) {
> +        if (pmc_counting_insns(env, sprn)) {
> +            env->spr[sprn] +=3D num_insns;
> +        }
> +    }
> +}
> +
>  #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index e4f75ba380..d45ce79a3e 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4425,6 +4425,30 @@ static inline void gen_update_cfar(DisasContext *c=
tx, target_ulong nip)
>  #endif
>  }
> =20
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +static void pmu_count_insns(DisasContext *ctx)
> +{
> +    TCGv t_mmcr0FC =3D tcg_constant_i64(MMCR0_FC);
> +    TCGv t0 =3D tcg_temp_new();
> +    TCGLabel *l_exit =3D gen_new_label();
> +
> +    /* Do not bother calling the helper if the PMU is frozen */
> +    gen_load_spr(t0, SPR_POWER_MMCR0);
> +    tcg_gen_andi_tl(t0, t0, MMCR0_FC);
> +    tcg_gen_brcond_tl(TCG_COND_EQ, t0, t_mmcr0FC, l_exit);
> +
> +    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
> +
> +    gen_set_label(l_exit);
> +    tcg_temp_free(t_mmcr0FC);
> +    tcg_temp_free(t0);
> +}
> +#else
> +static void pmu_count_insns(DisasContext *ctx)
> +{
> +    return;
> +}
> +#endif
>  static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
>  {
>      return translator_use_goto_tb(&ctx->base, dest);
> @@ -4439,9 +4463,17 @@ static void gen_lookup_and_goto_ptr(DisasContext *=
ctx)
>          } else if (sse & (CPU_SINGLE_STEP | CPU_BRANCH_STEP)) {
>              gen_helper_raise_exception(cpu_env, tcg_constant_i32(gen_pre=
p_dbgex(ctx)));
>          } else {
> +            pmu_count_insns(ctx);
>              tcg_gen_exit_tb(NULL, 0);
>          }
>      } else {
> +        /*
> +         * tcg_gen_lookup_and_goto_ptr will exit the TB if
> +         * CF_NO_GOTO_PTR is set. Count insns now.
> +         */
> +        if (ctx->base.tb->flags & CF_NO_GOTO_PTR) {
> +            pmu_count_insns(ctx);
> +        }

Oof.  IIUC this will at least generate the instructions to read MMCR0
and check FC, all the time, even if we haven't touched the PMU.  That
sounds like it could be pretty expensive.  Couldn't we instead
determine if we're counting instructions when we generate the context,
then only generate the code to bump the counter if that's set.
Obviously changes to the MMCRs would need to force a new translation
block.

>          tcg_gen_lookup_and_goto_ptr();
>      }
>  }
> @@ -4453,6 +4485,8 @@ static void gen_goto_tb(DisasContext *ctx, int n, t=
arget_ulong dest)
>          dest =3D (uint32_t) dest;
>      }
>      if (use_goto_tb(ctx, dest)) {
> +        pmu_count_insns(ctx);
> +
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_tl(cpu_nip, dest & ~3);
>          tcg_gen_exit_tb(ctx->base.tb, n);
> @@ -8785,6 +8819,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase=
, CPUState *cs)
>      switch (is_jmp) {
>      case DISAS_TOO_MANY:
>          if (use_goto_tb(ctx, nip)) {
> +            pmu_count_insns(ctx);
> +
>              tcg_gen_goto_tb(0);
>              gen_update_nip(ctx, nip);
>              tcg_gen_exit_tb(ctx->base.tb, 0);
> @@ -8795,6 +8831,14 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbas=
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
> @@ -8802,6 +8846,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase=
, CPUState *cs)
>          gen_update_nip(ctx, nip);
>          /* fall through */
>      case DISAS_EXIT:
> +        pmu_count_insns(ctx);
> +
>          tcg_gen_exit_tb(NULL, 0);
>          break;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--koWldiCNpSBAwjx0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEl1aAACgkQbDjKyiDZ
s5IIUxAAiv+sZTbPXBcwzm2NJp0lgjvvbWl3/hmNwyf0SXhJpjiYfbuLxO8C20aI
8y34oMC1q6nVV4/ypjsQd3Pz+As5qKUnS2K/Nh6kW37XJg5C36yKKaz976pMWR1f
M0ue56tD+bC1yq8q/fI0ycxMP3zycFY+uKmLNSI7X822j21FIBHjxwACp3VnOVSI
LQWTTqJNnhUQQNp2t8VkQhv97VP064J4M5Z03vpzE3wxkXH/H/uCFqUDI51gfbMQ
lI+2Ki+ph+6kNfyntSVy1BQMk4TZinUuzYxO26tyQAPsS72XGmh4KsWi56o+sxBJ
2lDYaCx8my3CAqxzH34+jQDrBN3jRahXEUui4gj2/GyILkLWjKxmV4w3hN0aQu/C
UCz7zeI8TCiRUTcc6EIPneNlVnb+b0Oc4MwrY6IBGMg/apLOFT+PUi7Llj4Jx8sT
s6wAZTUyxPKa4wJFGi3J6aOuWUpfENkNsvVJVd0pd3c8nBLsE94JwhGzCaTcqHlo
x4BSZF568CRo4l+1dXVe8plpwvVOm2QPCIy6QXJXsGi58uQUyHGiH0rsfWh9r6n0
Q4hX8Zgv20jr3ViEy4c2+7/rXKlUcRF2FbUMr+z4hplu0+ZDfHrGj1KNQ1KjPbLL
RF5FtKgjbBf1eFXGycfHE7Att/aeCwZwITITJ5R39iVKX33ELQY=
=pAoo
-----END PGP SIGNATURE-----

--koWldiCNpSBAwjx0--


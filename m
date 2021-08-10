Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312343E523D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:33:39 +0200 (CEST)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJSL-0007uc-ST
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDw-0008Kx-2H; Tue, 10 Aug 2021 00:18:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58769 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDt-0002TU-3z; Tue, 10 Aug 2021 00:18:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSS6hqgz9tD4; Tue, 10 Aug 2021 14:18:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569096;
 bh=GMoy/l8GucCHSIKhHhne4O0DvqpxFgIuMvhKgMsVN54=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DsFoBIXk2ludyZoA2/s7ZandC8Va+uQv/qq/dfSWn6KbxD3OggNRMY55AXwKKzSRO
 WxyPakGIewAdkqtOBc9fj4hhtKIf0uNpDY6LWwsojSDRvR25qNgqn0zSnTSajH+zXF
 L5zB1qMoeqrAO46pEnc6hz+B3iM4yTe7PVwGZH1M=
Date: Tue, 10 Aug 2021 14:06:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 13/19] target/ppc/translate: PMU: handle setting of PMCs
 while running
Message-ID: <YRH7KxFOysT5dTJg@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-14-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JRue7m48etdU45iP"
Content-Disposition: inline
In-Reply-To: <20210809131057.1694145-14-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


--JRue7m48etdU45iP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:10:51AM -0300, Daniel Henrique Barboza wrote:
> The initial PMU support were made under the assumption that the counters
> would be set before running the PMU and read after either freezing the
> PMU manually or via a performance monitor alert.
>=20
> Turns out that some EBB powerpc kernel tests set the counters after
> unfreezing the counters. Setting a PMC value when the PMU is running
> means that, at that moment, the baseline for calculating the events (set
> in env->pmu_base_icount) needs to be updated. Updating this baseline
> means that we need to update all the PMCs with their actual value at
> that moment. Any existing counter negative timer needs to be discarded
> an a new one, with the updated values, must be set again.
>=20
> This patch does that via a new 'helper_store_pmc()' that is called in
> the mtspr() callbacks of the PMU registers, spr_write_pmu_ureg() and
> spr_write_pmu_generic() in target/ppc/translate.c
>=20
> With this change, EBB powerpc kernel tests such as  'no_handler_test'
> are now passing.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/helper.h            |  1 +
>  target/ppc/pmu_book3s_helper.c | 36 ++++++++++++++++++++++++++++++++--
>  target/ppc/translate.c         | 27 +++++++++++++++++++++++++
>  3 files changed, 62 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 5122632784..757665b360 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -21,6 +21,7 @@ DEF_HELPER_1(hrfid, void, env)
>  DEF_HELPER_2(store_lpcr, void, env, tl)
>  DEF_HELPER_2(store_pcr, void, env, tl)
>  DEF_HELPER_2(store_mmcr0, void, env, tl)
> +DEF_HELPER_3(store_pmc, void, env, i32, i64)
>  #endif
>  DEF_HELPER_1(check_tlb_flush_local, void, env)
>  DEF_HELPER_1(check_tlb_flush_global, void, env)
> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helpe=
r.c
> index 58ae65e22b..e7af273cb6 100644
> --- a/target/ppc/pmu_book3s_helper.c
> +++ b/target/ppc/pmu_book3s_helper.c
> @@ -173,7 +173,7 @@ void cpu_ppc_pmu_timer_init(CPUPPCState *env)
>      env->pmu_intr_timer =3D timer;
>  }
> =20
> -static bool mmcr0_counter_neg_cond_enabled(uint64_t mmcr0)
> +static bool counter_negative_cond_enabled(uint64_t mmcr0)

Can you fold this rename into the patch which introduces the function
please.

>  {
>      return mmcr0 & MMCR0_PMC1CE;
>  }
> @@ -219,9 +219,41 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulo=
ng value)
>               * Start performance monitor alert timer for counter negative
>               * events, if needed.
>               */
> -            if (mmcr0_counter_neg_cond_enabled(env->spr[SPR_POWER_MMCR0]=
)) {
> +            if (counter_negative_cond_enabled(env->spr[SPR_POWER_MMCR0])=
) {
>                  set_PMU_excp_timer(env);
>              }
>          }
>      }
>  }
> +
> +void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
> +{
> +    bool pmu_frozen =3D env->spr[SPR_POWER_MMCR0] & MMCR0_FC;
> +    uint64_t curr_icount, icount_delta;
> +
> +    if (pmu_frozen) {
> +        env->spr[sprn] =3D value;
> +        return;
> +    }
> +
> +    curr_icount =3D (uint64_t)icount_get_raw();
> +    icount_delta =3D curr_icount - env->pmu_base_icount;
> +
> +    /* Update the counter with the events counted so far */
> +    update_PMCs(env, icount_delta);
> +
> +    /* Set the counter to the desirable value after update_PMCs() */
> +    env->spr[sprn] =3D value;
> +
> +    /*
> +     * Delete the current timer and restart a new one with the
> +     * updated values.
> +     */
> +    timer_del(env->pmu_intr_timer);
> +
> +    env->pmu_base_icount =3D curr_icount;

I'd expect some of this code to be shared with the unfreeze path using
a helper.  Is there a reason that's not the case?

Do you also need to deal with any counter interrupts that have already
been generated by the old counter?  Are the counter overflow events
edge-triggered or level-triggered?

> +    if (counter_negative_cond_enabled(env->spr[SPR_POWER_MMCR0])) {
> +        set_PMU_excp_timer(env);
> +    }
> +}
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index afc254a03f..3e890cc4d8 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -409,11 +409,25 @@ void spr_write_generic(DisasContext *ctx, int sprn,=
 int gprn)
> =20
>  void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn)
>  {
> +    TCGv_i32 t_sprn;
> +
>      switch (sprn) {
>      case SPR_POWER_MMCR0:
>          gen_icount_io_start(ctx);
>          gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
>          break;
> +    case SPR_POWER_PMC1:
> +    case SPR_POWER_PMC2:
> +    case SPR_POWER_PMC3:
> +    case SPR_POWER_PMC4:
> +    case SPR_POWER_PMC5:
> +    case SPR_POWER_PMC6:
> +        gen_icount_io_start(ctx);
> +
> +        t_sprn =3D tcg_const_i32(sprn);
> +        gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
> +        tcg_temp_free_i32(t_sprn);
> +        break;
>      default:
>          spr_write_generic(ctx, sprn, gprn);
>      }
> @@ -585,6 +599,7 @@ void spr_write_ureg(DisasContext *ctx, int sprn, int =
gprn)
>  void spr_write_pmu_ureg(DisasContext *ctx, int sprn, int gprn)
>  {
>      TCGv t0, t1;
> +    TCGv_i32 t_sprn;
>      int effective_sprn =3D sprn + 0x10;
> =20
>      if (((ctx->spr[SPR_POWER_MMCR0] & MMCR0_PMCC) >> 18) =3D=3D 0) {
> @@ -616,6 +631,18 @@ void spr_write_pmu_ureg(DisasContext *ctx, int sprn,=
 int gprn)
>          tcg_temp_free(t0);
>          tcg_temp_free(t1);
>          break;
> +    case SPR_POWER_PMC1:
> +    case SPR_POWER_PMC2:
> +    case SPR_POWER_PMC3:
> +    case SPR_POWER_PMC4:
> +    case SPR_POWER_PMC5:
> +    case SPR_POWER_PMC6:
> +        gen_icount_io_start(ctx);
> +
> +        t_sprn =3D tcg_const_i32(effective_sprn);
> +        gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
> +        tcg_temp_free_i32(t_sprn);
> +        break;
>      default:
>          gen_store_spr(effective_sprn, cpu_gpr[gprn]);
>          break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JRue7m48etdU45iP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER+ysACgkQbDjKyiDZ
s5I10BAAjGNhCxdfY/cnGeSeOkbz4eL56y7KJFT0YJwMy4/m2TViJTMdj9f78o4n
Y13q1EshZInn1hZ6uSQS11ytglSVCyVic2W8H+a4JIGe7UeVk1BwaoYd+GoGVT7C
isIoG/1rjvGVE8ltTO96F9StvvEe4uLSw8ezX32EnDepin2vBDsrHWLtGG1KrOiE
YZm4Lnpgl4xKJuUwYDQLcDP4dda9vyXQKy4IhgcgXWfLCoet51P5ekrJRrE6BXbL
2ME4bu6XkfczRzPqbuprWy6QQ4Q5MdzY1nh3oCRsrM4mzAqpr8GuTZ1sxf1IhMyO
0lO0cENg/J/9+o7e2Z10g6XKsDnuv4/vjrT8ueFRRZwgvKQ4eacgd8VW6TXNXF6f
PoP3cX0T5S1xVaOLP+tTnLdZyxT4ypcpINgRWho915XfgdAfRfIqGZ6FJ1RVOPPL
Hidvnunrmh78IzBllRQp8nmyfmuPZFzkAcpORpvlCJ5d0hIQtbeQK7kHm3FRLbAM
PG/of3tKCxbvLmy+1CEZVTl8mBJZWL+tn5VdLuAuPKGuSLa7xRQO5aeMMLsSd6He
TolyLx6+vWHKQD3mNevvkvphSLooticv8Vaem2Fn6FjqoZcQjIiuZYMDH5I5cH86
qfjWUJ5/DpbxuD5dP4Hfao3V1za2LIu3CqJsDkjkDcQ7uPj72rI=
=ZA90
-----END PGP SIGNATURE-----

--JRue7m48etdU45iP--


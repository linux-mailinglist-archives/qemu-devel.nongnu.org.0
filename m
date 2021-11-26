Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD445EC52
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 12:16:53 +0100 (CET)
Received: from localhost ([::1]:58238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqZDn-0002Cg-U3
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 06:16:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mqZ4B-0005Vp-Ka; Fri, 26 Nov 2021 06:06:55 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=54257
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mqZ47-0000f0-Gq; Fri, 26 Nov 2021 06:06:55 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J0sPt5nY7z4xZ5; Fri, 26 Nov 2021 22:06:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1637924802;
 bh=uVboOZ2ltXskLaONknL4yjn+WfkRbZ6ouOPxgYtcawI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EKtVelc+qKIlDCdjxrJ0JDj5XY5sJbd9HLyBzdBBVRcDQQ+nFO+wKWNrYxooZe3Rr
 Ag2BrUOnmK1VtlLoekRXLhBe0REBHXBAMwGTFIT04jkDKG0+ZYcpd2M3L8HgK+umsT
 chzjebrk7PCH+KGM2n6yZbyslsxDXNFPYsHJ4Tck=
Date: Fri, 26 Nov 2021 13:24:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 03/10] target/ppc: PMU: update counters on PMCs r/w
Message-ID: <YaBFQGHNpesVcIti@yekko>
References: <20211125150817.573204-1-danielhb413@gmail.com>
 <20211125150817.573204-4-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Y9Xe7sPbb6LRrnrc"
Content-Disposition: inline
In-Reply-To: <20211125150817.573204-4-danielhb413@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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


--Y9Xe7sPbb6LRrnrc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 12:08:10PM -0300, Daniel Henrique Barboza wrote:
> Calling pmu_update_cycles() on every PMC read/write operation ensures
> that the values being fetched are up to date with the current PMU state.
>=20
> In theory we can get away by just trapping PMCs reads, but we're going
> to trap PMC writes to deal with counter overflow logic later on.  Let's
> put the required wiring for that and make our lives a bit easier in the
> next patches.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c            | 12 ++++++------
>  target/ppc/helper.h              |  2 ++
>  target/ppc/power8-pmu-regs.c.inc | 29 +++++++++++++++++++++++++++--
>  target/ppc/power8-pmu.c          | 14 ++++++++++++++
>  target/ppc/spr_tcg.h             |  2 ++
>  5 files changed, 51 insertions(+), 8 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index e0b6fe4057..a7f47ec322 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6833,27 +6833,27 @@ static void register_book3s_pmu_sup_sprs(CPUPPCSt=
ate *env)
>                       KVM_REG_PPC_MMCRA, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_PMC1, "PMC1",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_PMC, &spr_write_PMC,
>                       KVM_REG_PPC_PMC1, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_PMC2, "PMC2",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_PMC, &spr_write_PMC,
>                       KVM_REG_PPC_PMC2, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_PMC3, "PMC3",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_PMC, &spr_write_PMC,
>                       KVM_REG_PPC_PMC3, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_PMC4, "PMC4",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_PMC, &spr_write_PMC,
>                       KVM_REG_PPC_PMC4, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_PMC5, "PMC5",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_PMC, &spr_write_PMC,
>                       KVM_REG_PPC_PMC5, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_PMC6, "PMC6",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_PMC, &spr_write_PMC,
>                       KVM_REG_PPC_PMC6, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_SIAR, "SIAR",
>                       SPR_NOACCESS, SPR_NOACCESS,
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index ea60a7493c..d7567f75b4 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -21,6 +21,8 @@ DEF_HELPER_1(hrfid, void, env)
>  DEF_HELPER_2(store_lpcr, void, env, tl)
>  DEF_HELPER_2(store_pcr, void, env, tl)
>  DEF_HELPER_2(store_mmcr0, void, env, tl)
> +DEF_HELPER_3(store_pmc, void, env, i32, i64)
> +DEF_HELPER_2(read_pmc, tl, env, i32)
>  #endif
>  DEF_HELPER_1(check_tlb_flush_local, void, env)
>  DEF_HELPER_1(check_tlb_flush_global, void, env)
> diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-reg=
s.c.inc
> index fbb8977641..f0c9cc343b 100644
> --- a/target/ppc/power8-pmu-regs.c.inc
> +++ b/target/ppc/power8-pmu-regs.c.inc
> @@ -181,13 +181,23 @@ void spr_write_MMCR2_ureg(DisasContext *ctx, int sp=
rn, int gprn)
>      tcg_temp_free(masked_gprn);
>  }
> =20
> +void spr_read_PMC(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv_i32 t_sprn =3D tcg_const_i32(sprn);
> +
> +    gen_icount_io_start(ctx);
> +    gen_helper_read_pmc(cpu_gpr[gprn], cpu_env, t_sprn);
> +
> +    tcg_temp_free_i32(t_sprn);
> +}
> +
>  void spr_read_PMC14_ureg(DisasContext *ctx, int gprn, int sprn)
>  {
>      if (!spr_groupA_read_allowed(ctx)) {
>          return;
>      }
> =20
> -    spr_read_ureg(ctx, gprn, sprn);
> +    spr_read_PMC(ctx, gprn, sprn + 0x10);
>  }
> =20
>  void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
> @@ -206,13 +216,23 @@ void spr_read_PMC56_ureg(DisasContext *ctx, int gpr=
n, int sprn)
>      spr_read_PMC14_ureg(ctx, gprn, sprn);
>  }
> =20
> +void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t_sprn =3D tcg_const_i32(sprn);
> +
> +    gen_icount_io_start(ctx);
> +    gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
> +
> +    tcg_temp_free_i32(t_sprn);
> +}
> +
>  void spr_write_PMC14_ureg(DisasContext *ctx, int sprn, int gprn)
>  {
>      if (!spr_groupA_write_allowed(ctx)) {
>          return;
>      }
> =20
> -    spr_write_ureg(ctx, sprn, gprn);
> +    spr_write_PMC(ctx, sprn + 0x10, gprn);
>  }
> =20
>  void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
> @@ -280,4 +300,9 @@ void spr_write_MMCR0(DisasContext *ctx, int sprn, int=
 gprn)
>  {
>      spr_write_generic(ctx, sprn, gprn);
>  }
> +
> +void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
> +{
> +    spr_write_generic(ctx, sprn, gprn);
> +}
>  #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index 47932ded4f..5f2623aa25 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -145,6 +145,20 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulo=
ng value)
>      }
>  }
> =20
> +target_ulong helper_read_pmc(CPUPPCState *env, uint32_t sprn)
> +{
> +    pmu_update_cycles(env);
> +
> +    return env->spr[sprn];
> +}
> +
> +void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
> +{
> +    pmu_update_cycles(env);
> +
> +    env->spr[sprn] =3D value;
> +}
> +
>  static void fire_PMC_interrupt(PowerPCCPU *cpu)
>  {
>      CPUPPCState *env =3D &cpu->env;
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index eb1d0c2bf0..1e79a0522a 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -26,6 +26,7 @@ void spr_noaccess(DisasContext *ctx, int gprn, int sprn=
);
>  void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
>  void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_PMC(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
> @@ -35,6 +36,7 @@ void spr_write_ctr(DisasContext *ctx, int sprn, int gpr=
n);
>  void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_PMC(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_PMC14_ureg(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Y9Xe7sPbb6LRrnrc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGgRUAACgkQbDjKyiDZ
s5J19Q//VyZiMjgyIMwuDkwficANZgA9SZvqvzDgTtUXV9lrPO+NRnPrT+gF6ZTf
/DX/XxG8MZSHPX/I1b9RNQdrqC9OQ8o61O8BAEP6e3mMYtjTrX10KS+rotYvKYUA
wB8lb4DDZB7vJDevWty0JZ6pn0gpRpIUZYDbsyZj1Lolrycen0rIpHrtxbigGSWd
t0aTCDfXBVkbgI6ksmHqKYVLtQsk0aBgu1qLzP7Cb8806pZ9IOZ8VJ8rlpNpYw9A
A207zJcLAShsQ+L2UToFur0klsNz9h/zOFOKF2k0zICtTcqQA38gYPvnFHMGuge7
i80arep4fktEXluY+klWvF4wQdZNXs7DbjED9/QNE8JKVSPeM/AVailGVlIaTuC7
Vq82g3auPwXizql1q8rS/xCscfztU+r2lFRpGLYkoOuiUzNswxBUF/8bVxWgu5OB
39m916pv7QP3boj2YKfgxlB68OJLxJyJrgGt95DBAZQhCYhhsuLcfc50az7G7BUI
FhHA4bNEJ+8kG3YsrguwCNfXjZnaNAoapexQzz0jXNtZtRwA53C3hVOu7+A/Xoyn
ESm96nFyQtL/TDSdlauV6yiaDXWYTlyqIJ5jyWX4utk8Y+uztX8DqE1xD3VtxB6A
/gOR5GA5xYNQ6K3VhKOTIQDNuXeCoskky7Y14UyuTdixvmMf49k=
=ZQFC
-----END PGP SIGNATURE-----

--Y9Xe7sPbb6LRrnrc--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ED53E51F4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:21:24 +0200 (CEST)
Received: from localhost ([::1]:43748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJGW-0002rJ-27
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDn-00081c-Lf; Tue, 10 Aug 2021 00:18:35 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDk-00029J-Ss; Tue, 10 Aug 2021 00:18:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSR3R6Hz9t6S; Tue, 10 Aug 2021 14:18:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569095;
 bh=yzrYFbIjdhlenoPcBgElW7vm0izYyOjpqzVPU4fEVS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwwjjvcmtOIlV3QtrNbZeVIyGYnqtP80MUvMjDEOc3tWEp0ALLjSlcJ/GhKnAuiIK
 6cyRw271wjuwK/ejZWFpw/vUcMA4jQwOEtdY+Edfbl5bnlgSUifqnQyQiYPFfmMicq
 Zyb8fbLSVb6QsRLUOp/JWWnNGIpd5NS4mjs4jzu8=
Date: Tue, 10 Aug 2021 13:21:48 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 02/19] target/ppc: add exclusive user read function for
 PMU regs
Message-ID: <YRHwzFhZBL1KXX37@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/BbAHjUql6DA/zcP"
Content-Disposition: inline
In-Reply-To: <20210809131057.1694145-3-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/BbAHjUql6DA/zcP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:10:40AM -0300, Daniel Henrique Barboza wrote:
> From: Gustavo Romero <gromero@linux.ibm.com>
>=20
> User read on PowerPC PMU regs requires extra handling in some
> instances. Instead of changing the existing read ureg function
> (spr_read_ureg) this patch adds a specific read function for
> user PMU SPRs, spr_read_pmu_ureg().
>=20
> This function does extra handling of UMMCR0 and UMMCR2 and falls
> back to the default behavior for the not yet handled regs. Aside
> for UMMCR0 and UMMCR2 reads, no functional change is made.
>=20
> CC: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu.h       |  8 ++++++++
>  target/ppc/cpu_init.c  | 26 +++++++++++++-------------
>  target/ppc/spr_tcg.h   |  1 +
>  target/ppc/translate.c | 41 +++++++++++++++++++++++++++++++++++++++--
>  4 files changed, 61 insertions(+), 15 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 500205229c..4d96015f81 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -342,6 +342,14 @@ typedef struct ppc_v3_pate_t {
>  #define MSR_RI   1  /* Recoverable interrupt                        1   =
     */
>  #define MSR_LE   0  /* Little-endian mode                           1 hf=
lags */
> =20
> +/* PMU bits */
> +#define MMCR0_FC    PPC_BIT(32)         /* Freeze Counters  */
> +#define MMCR0_PMAO  PPC_BIT(56)         /* Perf Monitor Alert Ocurred */
> +#define MMCR0_PMAE  PPC_BIT(37)         /* Perf Monitor Alert Enable */
> +#define MMCR0_EBE   PPC_BIT(43)         /* Perf Monitor EBB Enable */
> +#define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
> +#define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
> +
>  /* LPCR bits */
>  #define LPCR_VPM0         PPC_BIT(0)
>  #define LPCR_VPM1         PPC_BIT(1)
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 021c1bc750..d30aa0fe1e 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6868,47 +6868,47 @@ static void register_book3s_pmu_sup_sprs(CPUPPCSt=
ate *env)
>  static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, SPR_NOACCESS,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, SPR_NOACCESS,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UMMCRA, "UMMCRA",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, SPR_NOACCESS,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC1, "UPMC1",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, SPR_NOACCESS,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC2, "UPMC2",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, SPR_NOACCESS,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC3, "UPMC3",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, SPR_NOACCESS,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC4, "UPMC4",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, SPR_NOACCESS,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC5, "UPMC5",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, SPR_NOACCESS,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC6, "UPMC6",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, SPR_NOACCESS,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_USIAR, "USIAR",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, SPR_NOACCESS,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_USDAR, "USDAR",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, SPR_NOACCESS,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>  }
> @@ -6976,8 +6976,8 @@ static void register_power8_pmu_sup_sprs(CPUPPCStat=
e *env)
>  static void register_power8_pmu_user_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
> -                 &spr_read_ureg, SPR_NOACCESS,
> -                 &spr_read_ureg, &spr_write_ureg,
> +                 &spr_read_pmu_ureg, SPR_NOACCESS,
> +                 &spr_read_pmu_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_USIER, "USIER",
>                   &spr_read_generic, SPR_NOACCESS,
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index 2aab5878a0..84ecba220f 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -27,6 +27,7 @@ void spr_read_generic(DisasContext *ctx, int gprn, int =
sprn);
>  void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_pmu_generic(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_pmu_ureg(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index c8f3878002..d3a4d42ff8 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -522,8 +522,6 @@ void spr_write_ctr(DisasContext *ctx, int sprn, int g=
prn)
> =20
>  /* User read access to SPR */
>  /* USPRx */
> -/* UMMCRx */
> -/* UPMCx */
>  /* USIA */
>  /* UDECR */
>  void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
> @@ -531,6 +529,45 @@ void spr_read_ureg(DisasContext *ctx, int gprn, int =
sprn)
>      gen_load_spr(cpu_gpr[gprn], sprn + 0x10);
>  }
> =20
> +/* User special read access to PMU SPRs */
> +void spr_read_pmu_ureg(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv t0 =3D tcg_temp_new();
> +    int effective_sprn =3D sprn + 0x10;
> +
> +    switch (effective_sprn) {
> +    case SPR_POWER_MMCR0:

As with patch 1, it seems silly to multiplex here when we already have
something to dispatch to specific logic for each register.  In general
stacked multiplexers are a code smell, if there's not some significant
shared logic at each level.

> +        /*
> +         * Filter out all bits but FC, PMAO, and PMAE, according
> +         * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
> +         * fourth paragraph.
> +         */
> +        gen_load_spr(t0, effective_sprn);
> +        tcg_gen_andi_tl(t0, t0, MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE);
> +        tcg_gen_mov_tl(cpu_gpr[gprn], t0);
> +        break;
> +    case SPR_POWER_MMCR2:
> +        /*
> +         * On read, filter out all bits that are not FCnP0 bits.
> +         * When MMCR0[PMCC] is set to 0b10 or 0b11, providing
> +         * problem state programs read/write access to MMCR2,
> +         * only the FCnP0 bits can be accessed. All other bits are
> +         * not changed when mtspr is executed in problem state, and
> +         * all other bits return 0s when mfspr is executed in problem
> +         * state, according to ISA v3.1, section 10.4.6 Monitor Mode
> +         * Control Register 2, p. 1316, third paragraph.
> +         */
> +        gen_load_spr(t0, effective_sprn);
> +        tcg_gen_andi_tl(t0, t0, 0x4020100804020000UL);
> +        tcg_gen_mov_tl(cpu_gpr[gprn], t0);
> +        break;
> +    default:
> +        gen_load_spr(cpu_gpr[gprn], effective_sprn);
> +    }
> +
> +    tcg_temp_free(t0);
> +}
> +
>  #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
>  void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/BbAHjUql6DA/zcP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER8MwACgkQbDjKyiDZ
s5IGtg//RpPogWkkKSZ9mCXA9PhKhcaE+zeEerd4YB362AIwb8gF4HafvpT4KCtS
TZKFVzy3x+qjGzBLg/okSbJ3ABwAhC8CBGaLI1dn0D0i456nOb6b36c3aWfgwByH
zsX5iuD5gS4xijCwXKfW7w+wl9+UYSQJY2cjd+vh6dzeFSH7FLrL2GMU9B5UIdn5
RX3Rqy2jz8lgarLXX2cy/Kaj+blisw9EB5fozpkeUflMrgLrLYGVXnSidd/V+vnR
4ILhphpQVkyPHpq9dk++Zn3jl8YOAIAznmfCCNRbIkf37bv1LMvu854LpJsUBWXK
VfEE3/SMzJ2gQc4OIMZg03e8yDIe5eaz1GimRuuxxyHq5FltuVjEs6aOx0COyRKg
zOGaoFQ1WRYKf99r685oLMjQBYh8BV62rBZX9RX0sRQlXNomt+Ra/Dg69Z+kRWf/
qb122o8ikqVW6aLo7kj3i3QUCdJdEUVLlS1ZHbxLWLiIXqzJsUXSY/Vnw2nFYb9F
qEwj6TdYvbrla262UdxSXGdTx5Gl2eRLFy6EQ0pW3uXVsj5Lo8QqP2OQxdg5nuO5
/JPIJ9lUtB7X9Gs2CQTZdrSV93guHQO3hUMNvOtyo71+lgMvv0SOvTOYiNmClwc/
5jWsCYKpvcwQaA+UAcSwClno1v6HBEAfB+XDqNkKzv7y4UwIzNY=
=GgaV
-----END PGP SIGNATURE-----

--/BbAHjUql6DA/zcP--


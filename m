Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671003E51F3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:21:23 +0200 (CEST)
Received: from localhost ([::1]:43778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJGS-0002sE-Fv
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDn-00081Y-F0; Tue, 10 Aug 2021 00:18:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59407 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDk-00029N-RP; Tue, 10 Aug 2021 00:18:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSR36VTz9t5m; Tue, 10 Aug 2021 14:18:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569095;
 bh=f6J0UpOQRAdcawmN2isjiBmX6OvrnubYOroLkPGhSBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PWdbNqgDb7gmwac0mS/lf2xIf46JcIK8sbp826VgHLT4R5xiFFahnzsATVLwYwWfg
 LkYse3MihTuEuS/WArvLbmDWjT29sF08z6nSPcAW5fCXpUzPv5D9+iDR85trxULZHP
 pdiqvVM2uKFEMKZfVNXNi9IrOGrFshNMKowAv/I4=
Date: Tue, 10 Aug 2021 13:19:31 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 01/19] target/ppc: add exclusive Book3S PMU reg
 read/write functions
Message-ID: <YRHwQ8BiO+cFlgqF@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="00jGwr1f+rox0CCk"
Content-Disposition: inline
In-Reply-To: <20210809131057.1694145-2-danielhb413@gmail.com>
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


--00jGwr1f+rox0CCk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:10:39AM -0300, Daniel Henrique Barboza wrote:
> The PowerPC PMU, as described by PowerISA v3.1, has a lot of functions
> that freezes, resets and sets counters to specific values depending on
> the circuntances. Some of these are trigged based on read/value of the
> PMU registers (MMCR0, MMCR1, MMCR2, MMCRA and PMC counters).
>=20
> Having to handle the PMU logic using the generic read/write functions
> can impact all other registers that has nothing to do with the PMU that
> uses these functions. This patch creates two new functions,
> spr_read_pmu_generic() and spr_write_pmu_generic, that will be used later
> on to handle PMU logic together with the read/write of PMU registers.
>=20
> We're not ready to add specific PMU logic in these new functions yet, so
> for now these are just stubs that calls spr_read/write_generic(). No
> functional change is made.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu_init.c  | 24 ++++++++++++------------
>  target/ppc/spr_tcg.h   |  2 ++
>  target/ppc/translate.c | 12 ++++++++++++
>  3 files changed, 26 insertions(+), 12 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 505a0ed6ac..021c1bc750 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6821,47 +6821,47 @@ static void register_book3s_pmu_sup_sprs(CPUPPCSt=
ate *env)
>  {
>      spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,

So... this seems dubiousd to me.  Surely when you go to implement the
specifics of these registers you'll need separate logic for each of
them.

Why call a common "read_pmu" function that will then have to multiplex
to different logic for each register, when you could just dispatch
directly to a helper for that specific register.

>                       KVM_REG_PPC_MMCR0, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>                       KVM_REG_PPC_MMCR1, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_MMCRA, "MMCRA",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>                       KVM_REG_PPC_MMCRA, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_PMC1, "PMC1",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>                       KVM_REG_PPC_PMC1, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_PMC2, "PMC2",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>                       KVM_REG_PPC_PMC2, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_PMC3, "PMC3",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>                       KVM_REG_PPC_PMC3, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_PMC4, "PMC4",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>                       KVM_REG_PPC_PMC4, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_PMC5, "PMC5",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_pmu_generic, spr_write_pmu_generic,
>                       KVM_REG_PPC_PMC5, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_PMC6, "PMC6",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>                       KVM_REG_PPC_PMC6, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_SIAR, "SIAR",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>                       KVM_REG_PPC_SIAR, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_SDAR, "SDAR",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>                       KVM_REG_PPC_SDAR, 0x00000000);
>  }
> =20
> @@ -6941,7 +6941,7 @@ static void register_power8_pmu_sup_sprs(CPUPPCStat=
e *env)
>  {
>      spr_register_kvm(env, SPR_POWER_MMCR2, "MMCR2",
>                       SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_pmu_generic, &spr_write_pmu_generic,
>                       KVM_REG_PPC_MMCR2, 0x00000000);
>      spr_register_kvm(env, SPR_POWER_MMCRS, "MMCRS",
>                       SPR_NOACCESS, SPR_NOACCESS,
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index 0be5f347d5..2aab5878a0 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -25,6 +25,8 @@
>  void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_pmu_generic(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 171b216e17..c8f3878002 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -385,6 +385,12 @@ void spr_read_generic(DisasContext *ctx, int gprn, i=
nt sprn)
>      spr_load_dump_spr(sprn);
>  }
> =20
> +void spr_read_pmu_generic(DisasContext *ctx, int gprn, int sprn)
> +{
> +    /* For now it's just a call to spr_read_generic() */
> +    spr_read_generic(ctx, gprn, sprn);
> +}
> +
>  static void spr_store_dump_spr(int sprn)
>  {
>  #ifdef PPC_DUMP_SPR_ACCESSES
> @@ -400,6 +406,12 @@ void spr_write_generic(DisasContext *ctx, int sprn, =
int gprn)
>      spr_store_dump_spr(sprn);
>  }
> =20
> +void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn)
> +{
> +    /* For now it's just a call to spr_write_generic() */
> +    spr_write_generic(ctx, sprn, gprn);
> +}
> +
>  #if !defined(CONFIG_USER_ONLY)
>  void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--00jGwr1f+rox0CCk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER8EMACgkQbDjKyiDZ
s5ItOg/+OLpvU0ShsRURkLQWpYvLInhdet5pLVi+nnC0aFyA1kpK1L9xzRdRUkIB
oU6pMl/so2ayGFEQL5iHgXGzkhUux0w2lxvQuRHnqF20aE5OX5qpmfcG+5X0D/aM
Nb0u2LM63WWUb1gYm8Iy94SBZHE7HfiKADDitOMd4PhEttvpviRqdhya3nJicoAK
yi9dyuGI+fihMlj+yubdhOrmJobOZQNrjbY9t1ygSNPRXR/uIR0Jv8xoXJ+yXqRK
+1xXxvXqn8hcbRWvUGRidqMQHv6xhvhQH+McdMLBc+Ad0gLJQ2flw7DUQCgFaMJD
OLEAgpPm4PvvKEE9Sd8or4d3OF4UMn864IV5rWwnCh/7fR3PCx13zlM92BVgy2mS
MjgBQRlowMLIrmbcBdD98HcqVC8pf5se6kXEunGGjkw44YMtBUB2TatEBhcYJQKM
P+3ecthJZHpfqajLjMmaBIZvBSjHqEdGy+89ynV1VwgpAhrrOVkbqUzZvxaYbuGC
ZiyRpQ5IKSXZA/CsSBCstNIvT9M+NTyhpjgGEOi27TCVE3jrmU80sI6jKpfyLBu0
D+hhgy01ThWtx7s+Nlp8wFSmz0xA/Mactdfd04tVjcdvHL+hvhw6Aus9wKvyl56X
lk19Nwvsn9TbrdPN32TjDR96E83xLBMOve+fRKDwdeAuC8PpJag=
=urEp
-----END PGP SIGNATURE-----

--00jGwr1f+rox0CCk--


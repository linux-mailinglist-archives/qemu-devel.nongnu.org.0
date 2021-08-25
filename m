Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2FF3F6E9A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:54:52 +0200 (CEST)
Received: from localhost ([::1]:43982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkw7-00067O-Jk
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkrT-0001NY-Km; Wed, 25 Aug 2021 00:50:03 -0400
Received: from ozlabs.org ([203.11.71.1]:33109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkrO-0005ic-UT; Wed, 25 Aug 2021 00:50:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvYS16mM4z9sW8; Wed, 25 Aug 2021 14:49:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629866993;
 bh=eTX6mCOdRY1i2hBNp6pkRx6e081wMRtUr/Rr0KRdRag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i/SnHd6N4Jyg6/TabDHN3bffiW4/J12ZqagEg1hE6G35cAmDuLr1JZyhKJMbYdrOt
 ZPN6aGXPbbOWMWzlRXWvOoZ/lMcY4laM8G/NJbnU21lZFS6o7n9ryUYK1kV+VXJTyx
 Dfi8n+OogFAMt2ovUz9yiUYX5GHlDQogzL2oUFkU=
Date: Wed, 25 Aug 2021 14:26:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 01/16] target/ppc: add user write access control for
 PMU SPRs
Message-ID: <YSXGiZeWLI+L0/lr@yekko>
References: <20210824163032.394099-1-danielhb413@gmail.com>
 <20210824163032.394099-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+qYJO4BtFMI9OPpJ"
Content-Disposition: inline
In-Reply-To: <20210824163032.394099-2-danielhb413@gmail.com>
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


--+qYJO4BtFMI9OPpJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 01:30:17PM -0300, Daniel Henrique Barboza wrote:
> We're going to add PMU support for TCG PPC64 chips, based on IBM POWER8+
> emulation and following PowerISA v3.1.
>=20
> PowerISA v3.1 defines two PMU registers groups, A and B:
>=20
> - group A contains all performance monitor counters (PMCs), MMCR0, MMCR2
> and MMCRA;
>=20
> - group B contains MMCR1, MMCR3, SIER, SIER2, SIER3, SIAR, SDAR.
>=20
> Group A have read/write non-privileged access depending on MMCR0_PMCC
> bits. Group B is always userspace read only.
>=20
> Userspace will require to write Group A registers, and at the same time
> some Linux PMU selftests deliberately test if we are allowing write
> access when we shouldn't. This patch address the access control of Group
> A PMU registers by doing the following:
>=20
> - add a 'pmcc_clear' flag in DisasContext. This will map whether
> MMCR0_PMCC bits are cleared by checking HFLAGS_PMCCCLEAR;
>=20
> - create a spr_write_PMU_groupA_ureg() that will be used to all
> userspace writes of PMU regs. The reg will apply the proper access
> control before forwarding execution to spr_write_ureg().
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Hoping to get a review from Richard as well before merging.

> ---
>  target/ppc/cpu.h         |  4 ++++
>  target/ppc/cpu_init.c    | 18 +++++++++---------
>  target/ppc/helper_regs.c |  3 +++
>  target/ppc/spr_tcg.h     |  1 +
>  target/ppc/translate.c   | 37 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 54 insertions(+), 9 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 500205229c..627fc8d732 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -342,6 +342,9 @@ typedef struct ppc_v3_pate_t {
>  #define MSR_RI   1  /* Recoverable interrupt                        1   =
     */
>  #define MSR_LE   0  /* Little-endian mode                           1 hf=
lags */
> =20
> +/* PMU bits */
> +#define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
> +
>  /* LPCR bits */
>  #define LPCR_VPM0         PPC_BIT(0)
>  #define LPCR_VPM1         PPC_BIT(1)
> @@ -606,6 +609,7 @@ enum {
>      HFLAGS_SE =3D 10,  /* MSR_SE -- from elsewhere on embedded ppc */
>      HFLAGS_FP =3D 13,  /* MSR_FP */
>      HFLAGS_PR =3D 14,  /* MSR_PR */
> +    HFLAGS_PMCCCLEAR =3D 15, /* PMU MMCR0 PMCC equal to 0b00 */
>      HFLAGS_VSX =3D 23, /* MSR_VSX if cpu has VSX */
>      HFLAGS_VR =3D 25,  /* MSR_VR if cpu has VRE */
> =20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 66deb18a6b..c72c7fabea 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6868,7 +6868,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCStat=
e *env)
>  static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
> @@ -6876,31 +6876,31 @@ static void register_book3s_pmu_user_sprs(CPUPPCS=
tate *env)
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UMMCRA, "UMMCRA",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC1, "UPMC1",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC2, "UPMC2",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC3, "UPMC3",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC4, "UPMC4",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC5, "UPMC5",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC6, "UPMC6",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_USIAR, "USIAR",
> @@ -6976,7 +6976,7 @@ static void register_power8_pmu_sup_sprs(CPUPPCStat=
e *env)
>  static void register_power8_pmu_user_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_USIER, "USIER",
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 405450d863..4c1d9575ac 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -106,6 +106,9 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState=
 *env)
>      if (env->spr[SPR_LPCR] & LPCR_GTSE) {
>          hflags |=3D 1 << HFLAGS_GTSE;
>      }
> +    if (((env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC) >> 18) =3D=3D 0) {
> +        hflags |=3D 1 << HFLAGS_PMCCCLEAR;
> +    }
> =20
>  #ifndef CONFIG_USER_ONLY
>      if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index 0be5f347d5..027ec4c3f7 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -40,6 +40,7 @@ void spr_read_601_rtcl(DisasContext *ctx, int gprn, int=
 sprn);
>  void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn);
> =20
>  #ifndef CONFIG_USER_ONLY
>  void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 171b216e17..3a1eafbba8 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -175,6 +175,7 @@ struct DisasContext {
>      bool spe_enabled;
>      bool tm_enabled;
>      bool gtse;
> +    bool pmcc_clear;
>      ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
>      int singlestep_enabled;
>      uint32_t flags;
> @@ -526,6 +527,41 @@ void spr_write_ureg(DisasContext *ctx, int sprn, int=
 gprn)
>  }
>  #endif
> =20
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +/*
> + * User write function for PMU group A regs. PowerISA v3.1
> + * defines Group A sprs as:
> + *
> + * "The non-privileged read/write Performance Monitor registers
> + * (i.e., the PMCs, MMCR0, MMCR2, and MMCRA at SPR numbers
> + * 771-776, 779, 769, and 770, respectively)"
> + *
> + * These SPRs have a common user write access control via
> + * MMCR0 bits 44 and 45 (PMCC).
> + */
> +void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn)
> +{
> +    /*
> +     * For group A PMU sprs, if PMCC =3D 0b00, PowerISA v3.1
> +     * dictates that:
> +     *
> +     * "If an attempt is made to write to an SPR in group A in
> +     * problem state, a Hypervisor Emulation Assistance
> +     * interrupt will occur."
> +     */
> +    if (ctx->pmcc_clear) {
> +        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
> +        return;
> +    }
> +    spr_write_ureg(ctx, sprn, gprn);
> +}
> +#else
> +void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn)
> +{
> +    spr_noaccess(ctx, gprn, sprn);
> +}
> +#endif
> +
>  /* SPR common to all non-embedded PowerPC */
>  /* DECR */
>  #if !defined(CONFIG_USER_ONLY)
> @@ -8539,6 +8575,7 @@ static void ppc_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
>      ctx->vsx_enabled =3D (hflags >> HFLAGS_VSX) & 1;
>      ctx->tm_enabled =3D (hflags >> HFLAGS_TM) & 1;
>      ctx->gtse =3D (hflags >> HFLAGS_GTSE) & 1;
> +    ctx->pmcc_clear =3D (hflags >> HFLAGS_PMCCCLEAR) & 1;
> =20
>      ctx->singlestep_enabled =3D 0;
>      if ((hflags >> HFLAGS_SE) & 1) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+qYJO4BtFMI9OPpJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElxocACgkQbDjKyiDZ
s5IYXg//c7D8nC9D7icOQD14LXyuDANMlfMu8Hx8KzHJIC5OMDZPAdb/vAy3lxYP
TKbMxx8ZED0G8noRVX6hcDugj9h9VQnYrXx83e3x8jSEEtfLpId1A5NpNt1V4ePp
W4lYhXMR6Gu8/ViE9U+stSIVDoZ/Ky50j+8EIPGn3QEXu82KBdhJ5KnoB2c690a+
hOKOQMrjcpfCIjoucriSqHAyolKSn62T342ouhc+KBgPXIIjPaqnJQgn30e3ZOm5
spEoBuhvQWCMrNyvBgA0fVjxqW5TXpwSGb1Te4GrisxDtYsvnQ9/05EXoBsNrkV8
7fnGTowQHERyX8JKt3hjjb6Yy4RDztVEqVJXWNBpNZjU7bRR4Dlq1t0mUCgaDSbc
rJtV8HrWV0vzYdz2QVJ7fkhR4nj4EgFFeu/M0qxY1GHSUAaLzYFoPzwaEmjjQetc
+eMgg3Utfud0ytzK1pWnP1nUrGnIcycg99/Q1VCBDy36yPl+SgkCfH5UPr4gdvkq
vl0f2hFTHiDY4XZ7QwD/RkDlCrYbOy+UY8YarluTf36lozieAmIiZPAM39/eyNhG
tWAhgwEiOu1j/vyfYoYDMTODoQg/aJmvFmcD4A4+xQgJOKl+FqA+wALI4HuF8f9a
RMsM1G3TeH56IjeMaH2N9uQWNW99gpsfDlRKWDcREVmDk9YNbZA=
=0zcg
-----END PGP SIGNATURE-----

--+qYJO4BtFMI9OPpJ--


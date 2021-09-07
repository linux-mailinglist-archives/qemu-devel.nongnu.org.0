Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2574021E3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 04:18:15 +0200 (CEST)
Received: from localhost ([::1]:60518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNQgg-0006bt-Ll
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 22:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNQat-0002sG-83; Mon, 06 Sep 2021 22:12:15 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:38653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNQao-0000ur-UD; Mon, 06 Sep 2021 22:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630980726;
 bh=ZJjJJyergyteDQMcNcowWaRM09otZ7tMyBTnZWnj1uU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ExIENND0J8YGmDSEjQIJKj2FpshQyN0Kqud7P3aane0lDmb5FPYb9DELIAMmcB6bp
 cB8aIYWMR815odlruZycdjQX+zAdX8oDPO1045F6PhXhMhaZQFPd3yKmThk4lU7W2x
 U3Shpx2jvRtdnRSo6D8Fvi77sGMPT/7Ysf3wCwAY=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H3TKy1py6z9sVw; Tue,  7 Sep 2021 12:12:06 +1000 (AEST)
Date: Tue, 7 Sep 2021 11:38:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 02/15] target/ppc: add user write access control for
 PMU SPRs
Message-ID: <YTbCnSz86hsUAF/+@yekko>
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kslPcFD7pDet62s1"
Content-Disposition: inline
In-Reply-To: <20210903203116.80628-3-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kslPcFD7pDet62s1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 05:31:03PM -0300, Daniel Henrique Barboza wrote:
> The PMU needs to enable writing of its uregs to userspace, otherwise
> Perf applications will not able to setup the counters correctly. This
> patch enables user space writing of all PMU uregs.
>=20
> MMCR0 is a special case because its userspace writing access is controlled
> by MMCR0_PMCC bits. There are 4 configurations available (0b00, 0b01,
> 0b10 and 0b11) but for our purposes here we're handling only
> MMCR0_PMCC =3D 0b00. In this case, if userspace tries to write MMCR0, a
> hypervisor emulation assistance interrupt occurs.
>=20
> This is being done by adding HFLAGS_PMCCCLEAR to hflags. This flag
> indicates if MMCR0_PMCC is cleared (0b00), and a new 'pmcc_clear' flag in
> DisasContext allow us to use it in spr_write_MMCR0_ureg().
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu.h         |  1 +
>  target/ppc/cpu_init.c    | 18 +++++++-------
>  target/ppc/helper_regs.c |  3 +++
>  target/ppc/spr_tcg.h     |  3 ++-
>  target/ppc/translate.c   | 53 +++++++++++++++++++++++++++++++++++++++-
>  5 files changed, 67 insertions(+), 11 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index f68bb8d8aa..8dfbb62022 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -616,6 +616,7 @@ enum {
>      HFLAGS_SE =3D 10,  /* MSR_SE -- from elsewhere on embedded ppc */
>      HFLAGS_FP =3D 13,  /* MSR_FP */
>      HFLAGS_PR =3D 14,  /* MSR_PR */
> +    HFLAGS_PMCCCLEAR =3D 15, /* PMU MMCR0 PMCC equal to 0b00 */
>      HFLAGS_VSX =3D 23, /* MSR_VSX if cpu has VSX */
>      HFLAGS_VR =3D 25,  /* MSR_VR if cpu has VRE */
> =20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 9efc6c2d87..bb5ea04c61 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6867,7 +6867,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCStat=
e *env)
>  static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
> -                 &spr_read_MMCR0_ureg, SPR_NOACCESS,
> +                 &spr_read_MMCR0_ureg, &spr_write_MMCR0_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
> @@ -6875,31 +6875,31 @@ static void register_book3s_pmu_user_sprs(CPUPPCS=
tate *env)
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UMMCRA, "UMMCRA",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC1, "UPMC1",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_ureg,

Surely this can't be write.  AFAICT spr_write_ureg() will
unconditionally allow full userspace write access.  That can't be
right - otherwise the OS could never safely use the PMU for itself.

>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC2, "UPMC2",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC3, "UPMC3",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC4, "UPMC4",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC5, "UPMC5",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_UPMC6, "UPMC6",
> -                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, &spr_write_ureg,
>                   &spr_read_ureg, &spr_write_ureg,
>                   0x00000000);
>      spr_register(env, SPR_POWER_USIAR, "USIAR",
> @@ -6975,7 +6975,7 @@ static void register_power8_pmu_sup_sprs(CPUPPCStat=
e *env)
>  static void register_power8_pmu_user_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
> -                 &spr_read_MMCR2_ureg, SPR_NOACCESS,
> +                 &spr_read_MMCR2_ureg, &spr_write_ureg,
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
> index 30cb6c3fdc..094466a2b2 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -42,6 +42,8 @@ void spr_read_601_rtcl(DisasContext *ctx, int gprn, int=
 sprn);
>  void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_ureg(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn);
> =20
>  #ifndef CONFIG_USER_ONLY
>  void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
> @@ -96,7 +98,6 @@ void spr_read_mas73(DisasContext *ctx, int gprn, int sp=
rn);
>  #ifdef TARGET_PPC64
>  void spr_read_cfar(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_cfar(DisasContext *ctx, int sprn, int gprn);
> -void spr_write_ureg(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_purr(DisasContext *ctx, int gprn, int sprn);
>  void spr_write_purr(DisasContext *ctx, int sprn, int gprn);
>  void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index b2ead144d1..0babde3131 100644
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
> @@ -561,7 +562,56 @@ void spr_write_ureg(DisasContext *ctx, int sprn, int=
 gprn)
>  {
>      gen_store_spr(sprn + 0x10, cpu_gpr[gprn]);
>  }
> -#endif
> +
> +void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)


Could you put this def in the PMU specific file, rather than the
enormous translate.c?

> +{
> +    TCGv t0, t1;
> +
> +    /*
> +     * For group A PMU sprs, if PMCC =3D 0b00, PowerISA v3.1
> +     * dictates that:
> +     *
> +     * "If an attempt is made to write to an SPR in group A in
> +     * problem state, a Hypervisor Emulation Assistance
> +     * interrupt will occur."
> +     *
> +     * MMCR0 is a Group A SPR and can't be written by userspace
> +     * if PMCC =3D 0b00.
> +     */
> +    if (ctx->pmcc_clear) {
> +        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
> +        return;
> +    }
> +
> +    t0 =3D tcg_temp_new();
> +    t1 =3D tcg_temp_new();
> +
> +    /*
> +     * Filter out all bits but FC, PMAO, and PMAE, according
> +     * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
> +     * fourth paragraph.
> +     */
> +    tcg_gen_andi_tl(t0, cpu_gpr[gprn], MMCR0_UREG_MASK);
> +    gen_load_spr(t1, SPR_POWER_MMCR0);
> +    tcg_gen_andi_tl(t1, t1, ~(MMCR0_UREG_MASK));
> +    /* Keep all other bits intact */
> +    tcg_gen_or_tl(t1, t1, t0);
> +    gen_store_spr(SPR_POWER_MMCR0, t1);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +}
> +#else
> +void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)

Why do you need another definition of spr_write_ureg() here?

> +{
> +    spr_noaccess(ctx, gprn, sprn);
> +}
> +
> +void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
> +{
> +    spr_noaccess(ctx, gprn, sprn);
> +}
> +#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
> =20
>  /* SPR common to all non-embedded PowerPC */
>  /* DECR */
> @@ -8576,6 +8626,7 @@ static void ppc_tr_init_disas_context(DisasContextB=
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

--kslPcFD7pDet62s1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE2wpoACgkQbDjKyiDZ
s5JpAQ//b+Mn4UrM5wkK2KwD2pXWMW9UnTccBRPGGzJFNNmqqeqGdidkt6dOXC5g
O0rfEX1V0Mo2IoY4l71KffG/QBs8TIICoodzW4m6q4wReQeJaBiZPyOSIa5ww7u0
/Va9kPt6xcrSIg91wWNM/eBB4OMsfwcDQ43+5QsZz1q8rQftbenAqWOrSf05kKof
g/QVUqMKon1W2R19KBt9obaO8OJI2OOS4oH0sf9m1gGiGR2AbeXDX6pAYT0v8bWH
7DppTfeBcePUxJNBcIFNUCFQUkLrQmUy/U19+r4vZ1i/osx0XhshUHYFQ2RP2+YY
/IcjcBhR2oXiKOheB1s8OUt83G0ce4+hoBXm62QtAt08TgYkR1aTSh1CQ25GI5TV
MG8f8lX8H1dULFKG8ZZ5Byb7Cx0Bwlm2XxqtRiCbr4x5m8XjAWyCyLTshs1EyTpZ
SMJwyVhlDMVngxrzPRR6HQSCsr99peYVpmx9Mv3wgSE/ZaWSfkcsNGtjGtxItOkm
7ldyug310t33EpoojFNOr7cMbv9boZLhpR8ycfwYLOtXryODaxTQdQVNiNnVAZWq
UmO5SI6CB3vjf4h9vIi1dl6Unt22/CrnUPjeX/YGfexDBEAsschqSY4PoF0M08KZ
T4YR03zA9ZTdt4p7gN4LuEvAl+Wq/OIrlF2i54RUBQrrIwHAgL4=
=JCla
-----END PGP SIGNATURE-----

--kslPcFD7pDet62s1--


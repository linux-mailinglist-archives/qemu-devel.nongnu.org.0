Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF9A4B7FB0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 05:48:41 +0100 (CET)
Received: from localhost ([::1]:52390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCF6-0005PX-SP
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 23:48:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7B-0000z3-1O; Tue, 15 Feb 2022 23:40:29 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:57225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC73-00009b-7H; Tue, 15 Feb 2022 23:40:28 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y32VGkz4y3m; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=XwkUbwstc9FKKY0NJ0pDoIFpsj6vTj3zUxOe5Ws6+mM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gy6U2Ey2a9SoZZnaiPDVdn4/Air3SyxUUTnlQgWt4oicImqSFbV6vk4zntHunhIjF
 stAfIXP/2em8AtBPtk/a1P44aS9/LdO8HUkLyRo13eTkUs60yyyXH3VpWViVBpOuFd
 uoTGBYN6tyY54F/l+9XkCqC+o2F6CutYAqF6Cxag=
Date: Wed, 16 Feb 2022 13:11:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 04/27] target/ppc: cpu_init: Move Timebase registration
 into the common function
Message-ID: <YgxdO3oFgKDThQQN@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-5-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JZulRd9zqBTJzxgY"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-5-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JZulRd9zqBTJzxgY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:25PM -0300, Fabiano Rosas wrote:
> Now that the 601 was removed, all of our CPUs have a timebase, so that
> can be moved into the common function.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 98 ++++++++-----------------------------------
>  1 file changed, 18 insertions(+), 80 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 5dc097f2fc..b7e460e12d 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -221,6 +221,24 @@ static void register_generic_sprs(PowerPCCPU *cpu)
>                           pcc->svr);
>          }
>      }
> +
> +    /* Time base */
> +    spr_register(env, SPR_VTBL,  "TBL",
> +                 &spr_read_tbl, SPR_NOACCESS,
> +                 &spr_read_tbl, SPR_NOACCESS,
> +                 0x00000000);
> +    spr_register(env, SPR_TBL,   "TBL",
> +                 &spr_read_tbl, SPR_NOACCESS,
> +                 &spr_read_tbl, &spr_write_tbl,
> +                 0x00000000);
> +    spr_register(env, SPR_VTBU,  "TBU",
> +                 &spr_read_tbu, SPR_NOACCESS,
> +                 &spr_read_tbu, SPR_NOACCESS,
> +                 0x00000000);
> +    spr_register(env, SPR_TBU,   "TBU",
> +                 &spr_read_tbu, SPR_NOACCESS,
> +                 &spr_read_tbu, &spr_write_tbu,
> +                 0x00000000);
>  }
> =20
>  /* SPR common to all non-embedded PowerPC, including 601 */
> @@ -409,27 +427,6 @@ static void register_high_BATs(CPUPPCState *env)
>  #endif
>  }
> =20
> -/* Generic PowerPC time base */
> -static void register_tbl(CPUPPCState *env)
> -{
> -    spr_register(env, SPR_VTBL,  "TBL",
> -                 &spr_read_tbl, SPR_NOACCESS,
> -                 &spr_read_tbl, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_TBL,   "TBL",
> -                 &spr_read_tbl, SPR_NOACCESS,
> -                 &spr_read_tbl, &spr_write_tbl,
> -                 0x00000000);
> -    spr_register(env, SPR_VTBU,  "TBU",
> -                 &spr_read_tbu, SPR_NOACCESS,
> -                 &spr_read_tbu, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_TBU,   "TBU",
> -                 &spr_read_tbu, SPR_NOACCESS,
> -                 &spr_read_tbu, &spr_write_tbu,
> -                 0x00000000);
> -}
> -
>  /* Softare table search registers */
>  static void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int=
 nb_ways)
>  {
> @@ -2323,8 +2320,6 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
> =20
>  static void init_proc_405(CPUPPCState *env)
>  {
> -    /* Time base */
> -    register_tbl(env);
>      register_40x_sprs(env);
>      register_405_sprs(env);
>      /* Bus access control */
> @@ -2390,8 +2385,6 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_440EP(CPUPPCState *env)
>  {
> -    /* Time base */
> -    register_tbl(env);
>      register_BookE_sprs(env, 0x000000000000FFFFULL);
>      register_440_sprs(env);
>      register_usprgh_sprs(env);
> @@ -2532,8 +2525,6 @@ POWERPC_FAMILY(460EX)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_440GP(CPUPPCState *env)
>  {
> -    /* Time base */
> -    register_tbl(env);
>      register_BookE_sprs(env, 0x000000000000FFFFULL);
>      register_440_sprs(env);
>      register_usprgh_sprs(env);
> @@ -2615,8 +2606,6 @@ POWERPC_FAMILY(440GP)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_440x5(CPUPPCState *env)
>  {
> -    /* Time base */
> -    register_tbl(env);
>      register_BookE_sprs(env, 0x000000000000FFFFULL);
>      register_440_sprs(env);
>      register_usprgh_sprs(env);
> @@ -2754,8 +2743,6 @@ POWERPC_FAMILY(440x5wDFPU)(ObjectClass *oc, void *d=
ata)
> =20
>  static void init_proc_MPC5xx(CPUPPCState *env)
>  {
> -    /* Time base */
> -    register_tbl(env);
>      register_5xx_8xx_sprs(env);
>      register_5xx_sprs(env);
>      init_excp_MPC5xx(env);
> @@ -2798,8 +2785,6 @@ POWERPC_FAMILY(MPC5xx)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_MPC8xx(CPUPPCState *env)
>  {
> -    /* Time base */
> -    register_tbl(env);
>      register_5xx_8xx_sprs(env);
>      register_8xx_sprs(env);
>      init_excp_MPC8xx(env);
> @@ -2847,8 +2832,6 @@ static void init_proc_G2(CPUPPCState *env)
>      register_sdr1_sprs(env);
>      register_G2_755_sprs(env);
>      register_G2_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* External access control */
>      spr_register(env, SPR_EAR, "EAR",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -2960,8 +2943,6 @@ POWERPC_FAMILY(G2LE)(ObjectClass *oc, void *data)
> =20
>  static void init_proc_e200(CPUPPCState *env)
>  {
> -    /* Time base */
> -    register_tbl(env);
>      register_BookE_sprs(env, 0x000000070000FFFFULL);
> =20
>      spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
> @@ -3118,8 +3099,6 @@ static void init_proc_e300(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_603_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* hardware implementation registers */
>      spr_register(env, SPR_HID0, "HID0",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -3233,8 +3212,6 @@ static void init_proc_e500(CPUPPCState *env, int ve=
rsion)
>      int i;
>  #endif
> =20
> -    /* Time base */
> -    register_tbl(env);
>      /*
>       * XXX The e500 doesn't implement IVOR7 and IVOR9, but doesn't
>       *     complain when accessing them.
> @@ -3678,8 +3655,6 @@ static void init_proc_603(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_603_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* hardware implementation registers */
>      spr_register(env, SPR_HID0, "HID0",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -3783,8 +3758,6 @@ static void init_proc_604(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_604_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* Hardware implementation registers */
>      spr_register(env, SPR_HID0, "HID0",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -3858,8 +3831,6 @@ static void init_proc_604E(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
> -    /* Time base */
> -    register_tbl(env);
>      /* Hardware implementation registers */
>      spr_register(env, SPR_HID0, "HID0",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -3923,8 +3894,6 @@ static void init_proc_740(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* Thermal management */
>      register_thrm_sprs(env);
>      /* Hardware implementation registers */
> @@ -3995,8 +3964,6 @@ static void init_proc_750(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, spr_access_nop,
>                   0x00000000);
> -    /* Time base */
> -    register_tbl(env);
>      /* Thermal management */
>      register_thrm_sprs(env);
>      /* Hardware implementation registers */
> @@ -4071,8 +4038,6 @@ static void init_proc_750cl(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, spr_access_nop,
>                   0x00000000);
> -    /* Time base */
> -    register_tbl(env);
>      /* Thermal management */
>      /* Those registers are fake on 750CL */
>      spr_register(env, SPR_THRM1, "THRM1",
> @@ -4268,8 +4233,6 @@ static void init_proc_750cx(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, spr_access_nop,
>                   0x00000000);
> -    /* Time base */
> -    register_tbl(env);
>      /* Thermal management */
>      register_thrm_sprs(env);
> =20
> @@ -4347,8 +4310,6 @@ static void init_proc_750fx(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, spr_access_nop,
>                   0x00000000);
> -    /* Time base */
> -    register_tbl(env);
>      /* Thermal management */
>      register_thrm_sprs(env);
> =20
> @@ -4431,8 +4392,6 @@ static void init_proc_750gx(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, spr_access_nop,
>                   0x00000000);
> -    /* Time base */
> -    register_tbl(env);
>      /* Thermal management */
>      register_thrm_sprs(env);
> =20
> @@ -4511,8 +4470,6 @@ static void init_proc_745(CPUPPCState *env)
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
>      register_G2_755_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* Thermal management */
>      register_thrm_sprs(env);
>      /* Hardware implementation registers */
> @@ -4586,8 +4543,6 @@ static void init_proc_755(CPUPPCState *env)
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
>      register_G2_755_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* L2 cache control */
>      spr_register(env, SPR_L2CR, "L2CR",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -4670,8 +4625,6 @@ static void init_proc_7400(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -4746,8 +4699,6 @@ static void init_proc_7410(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -4829,8 +4780,6 @@ static void init_proc_7440(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -4933,8 +4882,6 @@ static void init_proc_7450(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -5059,8 +5006,6 @@ static void init_proc_7445(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -5192,8 +5137,6 @@ static void init_proc_7455(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -5327,8 +5270,6 @@ static void init_proc_7457(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -5482,8 +5423,6 @@ static void init_proc_e600(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> -    /* Time base */
> -    register_tbl(env);
>      /* 74xx specific SPR */
>      register_74xx_sprs(env);
>      vscr_init(env, 0x00010000);
> @@ -6307,7 +6246,6 @@ static void init_tcg_pmu_power8(CPUPPCState *env)
>  static void init_proc_book3s_common(CPUPPCState *env)
>  {
>      register_ne_601_sprs(env);
> -    register_tbl(env);
>      register_usprg3_sprs(env);
>      register_book3s_altivec_sprs(env);
>      register_book3s_pmu_sup_sprs(env);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JZulRd9zqBTJzxgY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMXTQACgkQgypY4gEw
YSLwTQ//dlFtksqFoXy5bLcc5JOxrzuuh2NWhkxt3CvmWeX9mt2u30BJVjIdBwWb
QE3pCYMNaVNI4HcOYp2nqkyzJ7+/T+dFF8CuvyrjbKTE9tPJiQsi0tFovZRfZYah
dz1Q0gnvdsYLGPRnDMWbvEPzHLr7XQWzZSIMiZqGnsHP4IP289Ixw1BWK0KjCzeb
jKAM6PZ9ucH27n5FSv75MklUW4UfnH+5YVuSc28+1IrK6kbWsrCQ7eQnmX5NUioL
X4jcFjG/dltY+nfSQIU+rKGW1aCgv9O09DMdeCpSs29caNCGFVkqDAqhdQ3ncp/j
JXaYXtFD/n6bntM/RN78XqwXS8DYCyt1es37q+4OS3ibmiJ3si+5pJ+eOKNtPis4
AEtoO8Vv7BRloWfDRTKn6gII/iDvg33TCR+rLwhoPOopW3ZpMku1qOH6RGSncwEK
sLK5hnTUtnp72eR/L2GGyKSXjLrQNYynlS1hID+GLbxDhoe/8dMEdtrq2C2Fxvcq
kJrZ/WThwdZ2HVTNkXSjGQfmdN7GGbJeEsFDKyN6ChuzLQsWtsQyEmECW0CnwGeJ
x2b2zEceoWK3WVyHjwS3J0jF1zhx4/Grjyo4cm55YVNh0Ol6ni6csBOz0Kg0ADRM
5WU40hIK1+Mun/vFRbCTr7KhL2Z+OeHM/auauJDz7Zxy1hoLH2c=
=UcIf
-----END PGP SIGNATURE-----

--JZulRd9zqBTJzxgY--


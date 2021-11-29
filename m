Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98EC460E09
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 05:29:35 +0100 (CET)
Received: from localhost ([::1]:37664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrYII-0007Lh-D6
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 23:29:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mrYFU-00068S-Cz; Sun, 28 Nov 2021 23:26:40 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:34403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mrYFO-0001fD-Ul; Sun, 28 Nov 2021 23:26:40 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J2XNb52Vnz4xR7; Mon, 29 Nov 2021 15:26:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638159983;
 bh=Y3EEP5exZ4HS+owIr9dQxBC2p74839ntkwDbsKhc3/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LRNNc6yTNLahwsbUjQl/MRxnFI4y6h1kpC5jCUAdWCrKpu3qUaAfLA8fP9YBRgOiB
 hhgHJdUDi68f+lxyWTK6RODsZV2i8JOfuLUBZRD4Yrynuq5F2p7EwC1zelJeSDd3Iu
 LzDoZYN2ODmQY1OU7dRF4+GpgpeHff/bAvkNfRyA=
Date: Mon, 29 Nov 2021 14:41:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 05/10] target/ppc: enable PMU counter overflow with
 cycle events
Message-ID: <YaRL8OEPdjVyed2t@yekko>
References: <20211125150817.573204-1-danielhb413@gmail.com>
 <20211125150817.573204-6-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4hXvwZmkbwxushKA"
Content-Disposition: inline
In-Reply-To: <20211125150817.573204-6-danielhb413@gmail.com>
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


--4hXvwZmkbwxushKA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 12:08:12PM -0300, Daniel Henrique Barboza wrote:
65;6601;1c> The PowerISA v3.1 defines that if the proper bits are set (MMCR=
0_PMC1CE
> for PMC1 and MMCR0_PMCjCE for the remaining PMCs), counter negative
> conditions are enabled. This means that if the counter value overflows
> (i.e. exceeds 0x80000000) a performance monitor alert will occur. This al=
ert
> can trigger an event-based exception (to be implemented in the next patch=
es)
> if the MMCR0_EBE bit is set.
>=20
> For now, overflowing the counter when the PMC is counting cycles will
> just trigger a performance monitor alert. This is done by starting the
> overflow timer to expire in the moment the overflow would be occuring. The
> timer will call fire_PMC_interrupt() (via cpu_ppc_pmu_timer_cb) which will
> trigger the PMU alert and, if the conditions are met, an EBB exception.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

A couple of minor nits noted below, though.

> ---
>  target/ppc/cpu.h        |  2 ++
>  target/ppc/power8-pmu.c | 80 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 82 insertions(+)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 9c732953f0..9b41b022e2 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -364,6 +364,8 @@ typedef enum {
>  #define MMCR0_PMCC   PPC_BITMASK(44, 45) /* PMC Control */
>  #define MMCR0_FC14   PPC_BIT(58)         /* PMC Freeze Counters 1-4 bit =
*/
>  #define MMCR0_FC56   PPC_BIT(59)         /* PMC Freeze Counters 5-6 bit =
*/
> +#define MMCR0_PMC1CE PPC_BIT(48)         /* MMCR0 PMC1 Condition Enabled=
 */
> +#define MMCR0_PMCjCE PPC_BIT(49)         /* MMCR0 PMCj Condition Enabled=
 */
>  /* MMCR0 userspace r/w mask */
>  #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
>  /* MMCR2 userspace r/w mask */
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index acdaee7459..01e0b9b8fc 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -23,6 +23,8 @@
> =20
>  #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> =20
> +#define PMC_COUNTER_NEGATIVE_VAL 0x80000000UL
> +
>  static bool pmc_is_inactive(CPUPPCState *env, int sprn)
>  {
>      if (env->spr[SPR_POWER_MMCR0] & MMCR0_FC) {
> @@ -36,6 +38,15 @@ static bool pmc_is_inactive(CPUPPCState *env, int sprn)
>      return env->spr[SPR_POWER_MMCR0] & MMCR0_FC56;
>  }
> =20
> +static bool pmc_has_overflow_enabled(CPUPPCState *env, int sprn)
> +{
> +    if (sprn =3D=3D SPR_POWER_PMC1) {
> +        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE;
> +    }
> +
> +    return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
> +}
> +
>  /*
>   * For PMCs 1-4, IBM POWER chips has support for an implementation
>   * dependent event, 0x1E, that enables cycle counting. The Linux kernel
> @@ -123,6 +134,70 @@ static void pmu_update_cycles(CPUPPCState *env)
>      env->pmu_base_time =3D now;
>  }
> =20
> +/*
> + * Helper function to retrieve the cycle overflow timer of the
> + * 'sprn' counter. Given that PMC5 doesn't have a timer, the
> + * amount of timers is less than the total counters and the PMC6
> + * timer is the last of the array.
> + */
> +static QEMUTimer *get_cyc_overflow_timer(CPUPPCState *env, int sprn)
> +{
> +    if (sprn =3D=3D SPR_POWER_PMC5) {
> +        return NULL;

Given that the entries in the pmu_cyc_overflow_timers are just
pointers, it would probably be slightly cheaper in terms of both time
and space to just have an always-NULL entry for PMC5, rather than
having to special case it.

> +    }
> +
> +    if (sprn =3D=3D SPR_POWER_PMC6) {
> +        return env->pmu_cyc_overflow_timers[PMU_TIMERS_NUM - 1];
> +    }
> +
> +    return env->pmu_cyc_overflow_timers[sprn - SPR_POWER_PMC1];
> +}
> +
> +static void pmc_update_overflow_timer(CPUPPCState *env, int sprn)
> +{
> +    QEMUTimer *pmc_overflow_timer;
> +    int64_t timeout;
> +
> +    /* PMC5 does not have an overflow timer */
> +    if (sprn =3D=3D SPR_POWER_PMC5) {
> +        return;

Since you've already handled the PMC5 case in
get_cyc_overflow_timer(), you could replace this handling with just an
if (!pmc_overflow_timer) {return;}

> +    }
> +
> +    pmc_overflow_timer =3D get_cyc_overflow_timer(env, sprn);
> +
> +    if (pmc_get_event(env, sprn) !=3D PMU_EVENT_CYCLES ||
> +        !pmc_has_overflow_enabled(env, sprn)) {
> +        /* Overflow timer is not needed for this counter */
> +        timer_del(pmc_overflow_timer);
> +        return;
> +    }
> +
> +    if (env->spr[sprn] >=3D PMC_COUNTER_NEGATIVE_VAL) {
> +        timeout =3D  0;
> +    } else {
> +        timeout =3D PMC_COUNTER_NEGATIVE_VAL - env->spr[sprn];
> +    }
> +
> +    /*
> +     * Use timer_mod_anticipate() because an overflow timer might
> +     * be already running for this PMC.
> +     */
> +    timer_mod_anticipate(pmc_overflow_timer, env->pmu_base_time + timeou=
t);
> +}
> +
> +static void pmu_update_overflow_timers(CPUPPCState *env)
> +{
> +    int sprn;
> +
> +    /*
> +     * Scroll through all PMCs and start counter overflow timers for
> +     * PM_CYC events, if needed.
> +     */
> +    for (sprn =3D SPR_POWER_PMC1; sprn <=3D SPR_POWER_PMC6; sprn++) {
> +        pmc_update_overflow_timer(env, sprn);
> +    }
> +}
> +
>  void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
>  {
>      target_ulong curr_value =3D env->spr[SPR_POWER_MMCR0];
> @@ -143,6 +218,9 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulon=
g value)
>          (curr_FC !=3D new_FC)) {
>          hreg_compute_hflags(env);
>      }
> +
> +    /* Update cycle overflow timers with the current MMCR0 state */
> +    pmu_update_overflow_timers(env);
>  }
> =20
>  void helper_store_mmcr1(CPUPPCState *env, uint64_t value)
> @@ -164,6 +242,8 @@ void helper_store_pmc(CPUPPCState *env, uint32_t sprn=
, uint64_t value)
>      pmu_update_cycles(env);
> =20
>      env->spr[sprn] =3D value;
> +
> +    pmc_update_overflow_timer(env, sprn);
>  }
> =20
>  static void fire_PMC_interrupt(PowerPCCPU *cpu)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4hXvwZmkbwxushKA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGkS+4ACgkQbDjKyiDZ
s5KB+w//daQKvetcrxGM5xD+uI+C9FzzzY/OMmNH8l26aAeO17yCCdTaol1ZU+i9
ZlX6SPzKpczg3pZ9+MbfJsUJbUPTAGjMaRgDNcmdiX1pEeABtIF7F3vsYnbjSAtJ
i2yDPNmNq13nriz3zk84UShL1ZdsNEdJ2I7ylC7z0KxGtlIkiFwQvRXQbG4GTgk+
oxNJSmmLIlavSbL8owTs4VwMTYX6QVs9W4+axCDkD0KcsiJ8D+tecM+zw3sooSVG
FJeehHRlJaDhyR2kSInC8zQinUJT56BgF4Voj+oDxTn9gOyszu383+p1yceY4Jpu
K1F8Ycg5vC+9VdEa/hC311COfsKIgpGR9zbCnH2kBFKZK0YpcaKcx3H1+6i0Egdq
OcubqtMObU4dGfpFwbheQJBt4o9Bj8WZAbRrsCPIq690q/6ZhCt+UNcWP4PGv0Iz
INC2Gf15UW9S63Lho9uLolDpzOESmTZ4r2kXPqpMK1eNtmUYDC98IajKjXvn/SSZ
9Y0v+h+x+09TKSTXF5taFnAYu8TKA+hrquOD/C5LMEn7LBvHJmKo/qEZIHND2JXW
EK0YDhj7ExihOs4DINxR+wUImJlg0jlV0MiErhBsX/6fk6+somRvFkRF81Qeo7rA
eLhoWsJgprZpP5VmFFWUtV3U2UMKWKcATvISJimOuvimLJKEdlM=
=cxqt
-----END PGP SIGNATURE-----

--4hXvwZmkbwxushKA--


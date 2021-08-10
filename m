Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCFE3E5231
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:29:35 +0200 (CEST)
Received: from localhost ([::1]:38030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJOQ-0001Ea-MN
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDw-0008LL-5N; Tue, 10 Aug 2021 00:18:44 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDt-0002TE-6R; Tue, 10 Aug 2021 00:18:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSS52CMz9tD3; Tue, 10 Aug 2021 14:18:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569096;
 bh=R8OnhQtOb57YAMNCV73D8DMAxR8v+qDvdtxlvFX02Rc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YNYa4NWfQT0vodI8X8HqAyhDFxmElJer36M6TLDBp7bu3+5lU11hY7EtatYtNrf5d
 qSFAEmoVAbJ+gqoEeKlsOXyyEqg457tg+Ql1p+BH6Wqm75KIdqLUu+EvPfJTNvN5ab
 WV4kcQCQxDTquRsFLxAqD7Ovq66b+O+HKNodgJis=
Date: Tue, 10 Aug 2021 14:01:39 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 12/19] target/ppc/pmu_book3s_helper.c: enable PMC1
 counter negative EBB
Message-ID: <YRH6IysrDvn/GJvQ@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-13-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lNX/zEvRkGhu6PGU"
Content-Disposition: inline
In-Reply-To: <20210809131057.1694145-13-danielhb413@gmail.com>
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lNX/zEvRkGhu6PGU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:10:50AM -0300, Daniel Henrique Barboza wrote:
> This patch starts the counter negative EBB support by enabling PMC1
> counter negative condition.
>=20
> A counter negative condition happens when a performance monitor counter
> reaches the value 0x80000000. When that happens, if a counter negative
> condition is enabled in that counter, a performance monitor alert is
> triggered. For PMC1, this condition is enabled by MMCR0_PMC1CE.
>=20
> An icount-based logic is used to predict when we need to wake up the timer
> to trigger the alert in both PM_INST_CMPL (0x2) and PM_CYC (0x1E) events.
> The timer callback will then trigger a PPC_INTERRUPT_PMC which will becom=
e a
> event-based exception later.
>=20
> Some EBB powerpc kernel selftests are passing after this patch, but a
> substancial amount of them relies on other PMCs to be enabled and events
> that we don't support at this moment. We'll address that in the next
> patches.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu.h               |   1 +
>  target/ppc/pmu_book3s_helper.c | 127 +++++++++++++++++++++++----------
>  2 files changed, 92 insertions(+), 36 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 1d38b8cf7a..5c81d459f4 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -350,6 +350,7 @@ typedef struct ppc_v3_pate_t {
>  #define MMCR0_EBE   PPC_BIT(43)         /* Perf Monitor EBB Enable */
>  #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
>  #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
> +#define MMCR0_PMC1CE PPC_BIT(48)
> =20
>  #define MMCR1_PMC1SEL_SHIFT (63 - 39)
>  #define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helpe=
r.c
> index 43cc0eb722..58ae65e22b 100644
> --- a/target/ppc/pmu_book3s_helper.c
> +++ b/target/ppc/pmu_book3s_helper.c
> @@ -25,6 +25,7 @@
>   * and SPAPR code.
>   */
>  #define PPC_CPU_FREQ 1000000000
> +#define COUNTER_NEGATIVE_VAL 0x80000000
> =20
>  static uint64_t get_cycles(uint64_t icount_delta)
>  {
> @@ -32,22 +33,9 @@ static uint64_t get_cycles(uint64_t icount_delta)
>                      NANOSECONDS_PER_SECOND);
>  }
> =20
> -static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
> -                                    uint64_t icount_delta)
> -{
> -    env->spr[sprn] +=3D icount_delta;
> -}
> -
> -static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
> -                              uint64_t icount_delta)
> -{
> -    env->spr[sprn] +=3D get_cycles(icount_delta);
> -}
> -
> -static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
> -                                        uint64_t icount_delta)
> +static uint8_t get_PMC_event(CPUPPCState *env, int sprn)
>  {
> -    int event;
> +    int event =3D 0x0;
> =20
>      switch (sprn) {
>      case SPR_POWER_PMC1:
> @@ -65,11 +53,35 @@ static void update_programmable_PMC_reg(CPUPPCState *=
env, int sprn,
>      case SPR_POWER_PMC4:
>          event =3D MMCR1_PMC4SEL & env->spr[SPR_POWER_MMCR1];
>          break;
> +    case SPR_POWER_PMC5:
> +        event =3D 0x2;
> +        break;
> +    case SPR_POWER_PMC6:
> +        event =3D 0x1E;
> +        break;

This looks like a nice cleanup that would be better folded into an
earlier patch.

>      default:
> -        return;
> +        break;
>      }
> =20
> -    switch (event) {
> +    return event;
> +}
> +
> +static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
> +                                    uint64_t icount_delta)
> +{
> +    env->spr[sprn] +=3D icount_delta;
> +}
> +
> +static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
> +                              uint64_t icount_delta)
> +{
> +    env->spr[sprn] +=3D get_cycles(icount_delta);
> +}
> +
> +static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
> +                                        uint64_t icount_delta)
> +{
> +    switch (get_PMC_event(env, sprn)) {
>      case 0x2:
>          update_PMC_PM_INST_CMPL(env, sprn, icount_delta);
>          break;
> @@ -99,30 +111,57 @@ static void update_PMCs(CPUPPCState *env, uint64_t i=
count_delta)
>      update_PMC_PM_CYC(env, SPR_POWER_PMC6, icount_delta);
>  }
> =20
> +static void set_PMU_excp_timer(CPUPPCState *env)
> +{
> +    uint64_t timeout, now, remaining_val;
> +
> +    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE)) {
> +        return;
> +    }
> +
> +    remaining_val =3D COUNTER_NEGATIVE_VAL - env->spr[SPR_POWER_PMC1];
> +
> +    switch (get_PMC_event(env, SPR_POWER_PMC1)) {
> +    case 0x2:
> +        timeout =3D icount_to_ns(remaining_val);
> +        break;
> +    case 0x1e:
> +        timeout =3D muldiv64(remaining_val, NANOSECONDS_PER_SECOND,
> +                           PPC_CPU_FREQ);

So.. this appears to be simulating to the guest that cycles are
occurring at a constant rate, consistent with the advertised CPU
frequency.  Which sounds right, except... it's not clear to me that
you're using the same logic to generate the values you read from the
cycles PMC (in that case it shouldn't need to reference icount at all,
right?).

> +        break;
> +    default:
> +        return;
> +    }
> +
> +    now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +
> +    timer_mod(env->pmu_intr_timer, now + timeout);
> +}
> +
>  static void cpu_ppc_pmu_timer_cb(void *opaque)
>  {
>      PowerPCCPU *cpu =3D opaque;
>      CPUPPCState *env =3D &cpu->env;
> -    uint64_t mmcr0;
> -
> -    mmcr0 =3D env->spr[SPR_POWER_MMCR0];
> -    if (env->spr[SPR_POWER_MMCR0] & MMCR0_EBE) {
> -        /* freeeze counters if needed */
> -        if (mmcr0 & MMCR0_FCECE) {
> -            mmcr0 &=3D ~MMCR0_FCECE;
> -            mmcr0 |=3D MMCR0_FC;
> -        }
> +    uint64_t icount_delta =3D (uint64_t)icount_get_raw() - env->pmu_base=
_icount;
> =20
> -        /* Clear PMAE and set PMAO */
> -        if (mmcr0 & MMCR0_PMAE) {
> -            mmcr0 &=3D ~MMCR0_PMAE;
> -            mmcr0 |=3D MMCR0_PMAO;
> -        }
> -        env->spr[SPR_POWER_MMCR0] =3D mmcr0;
> +    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_EBE)) {
> +        return;
> +    }
> +
> +    update_PMCs(env, icount_delta);
> +
> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
> +        env->spr[SPR_POWER_MMCR0] &=3D ~MMCR0_FCECE;
> +        env->spr[SPR_POWER_MMCR0] |=3D MMCR0_FC;
> +    }
> =20
> -        /* Fire the PMC hardware exception */
> -        ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
> +        env->spr[SPR_POWER_MMCR0] &=3D ~MMCR0_PMAE;
> +        env->spr[SPR_POWER_MMCR0] |=3D MMCR0_PMAO;
>      }
> +
> +    /* Fire the PMC hardware exception */
> +    ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
>  }
> =20
>  void cpu_ppc_pmu_timer_init(CPUPPCState *env)
> @@ -134,12 +173,19 @@ void cpu_ppc_pmu_timer_init(CPUPPCState *env)
>      env->pmu_intr_timer =3D timer;
>  }
> =20
> +static bool mmcr0_counter_neg_cond_enabled(uint64_t mmcr0)
> +{
> +    return mmcr0 & MMCR0_PMC1CE;
> +}
> +
>  void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
>  {
>      uint64_t curr_icount =3D (uint64_t)icount_get_raw();
>      bool curr_FC =3D env->spr[SPR_POWER_MMCR0] & MMCR0_FC;
>      bool new_FC =3D value & MMCR0_FC;
> =20
> +    env->spr[SPR_POWER_MMCR0] =3D value;
> +
>      /*
>       * In an frozen count (FC) bit change:
>       *
> @@ -163,10 +209,19 @@ void helper_store_mmcr0(CPUPPCState *env, target_ul=
ong value)
>               * until the freeze.
>               */
>              update_PMCs(env, icount_delta);
> +
> +            /* delete pending timer */
> +            timer_del(env->pmu_intr_timer);
>          } else {
>              env->pmu_base_icount =3D curr_icount;
> +
> +            /*
> +             * Start performance monitor alert timer for counter negative
> +             * events, if needed.
> +             */
> +            if (mmcr0_counter_neg_cond_enabled(env->spr[SPR_POWER_MMCR0]=
)) {
> +                set_PMU_excp_timer(env);
> +            }
>          }
>      }
> -
> -    env->spr[SPR_POWER_MMCR0] =3D value;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lNX/zEvRkGhu6PGU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER+iMACgkQbDjKyiDZ
s5JS0RAA3wPngZ3yi9FUop336bgnpGRx05H1LPGzWQgFJuHmYNfEgPekP6WJRkzO
fCvxMREFod/6/oxBPDrn7oRAu+XzNyNbrs/2lrlOFBTkwkSHbBMewJi5OGdccp1y
vFu5CVa4wLY3Rn641cIkPMFMqr6Vpx3h+H1NblW5phUpMQYtttBdBDnc2h3z2msP
5C4M4kfs/6kvfabckQpudAwcO+pC2qs+6FikNt4rGTnwXXEJFDww1YBZtKHB5YwX
63Fyed1xegRXJvJLT4OKTwjvTjlx4ZKgMvGdguNZvBg4ah+8U6/FTW6Xpk3iSt3B
IBb1AwrPDnU92S1i+5+GMVJBZGXWe2QnsfKwQgS/vIsyP/0q9IS1FKufi5ikKq08
k93EjfJrrHa70P7z6TqUuFfZ57AEmuh2nqNomcsdSTke6HFzR+1V/HMUHYyT5Khv
R64fOZo0Vl4GeBoZDJMisy75pzl8+lwdcs5kC40pwL8IEyILcUVOqnkDRjsEi0IF
lVq+HPMDdD/Rg8o162T48UP8nxm9czZb8QxEGsaPlwlw2egwG+BDvQxgMD/QYNdk
NqntXRxB5RA2RrliST0MbmQWXW5SphlV0bTWkUmZDDTrBTIr5Nx2aL/1f6Hzh+g6
r+ZXmk5UB+O0gIFPMAEFTuEWf8t3kFX5gtklutBCrO0vB8LdsKo=
=ymNg
-----END PGP SIGNATURE-----

--lNX/zEvRkGhu6PGU--


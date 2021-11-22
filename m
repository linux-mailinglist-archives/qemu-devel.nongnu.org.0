Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46A4588C4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 06:16:12 +0100 (CET)
Received: from localhost ([::1]:59104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp1gZ-0002Qa-69
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 00:16:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mp1Z3-0008Hv-Ly; Mon, 22 Nov 2021 00:08:26 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:33085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mp1Yv-0005mw-IS; Mon, 22 Nov 2021 00:08:25 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HyFdy6G0Bz4xcb; Mon, 22 Nov 2021 16:08:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1637557686;
 bh=yKPi/8lpDmIjD5rpyxrSxBYY+2fl/k9ony6ffrYdCQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aiI3x9IWX7HCl4plB3KvHuFWjhslaAwn36h1al9+B6Z/NbUbNtHr7RGqk7CAOaxv5
 FpNNGOk1cU9CW7M1lPw3Imwyr1or9Tt87XSLNZMqg0MJyG2TLJd3BB8Qz7OERr0sLA
 1RZVitHAW96l8h7kr46rJbNMjR9V0HC/T9p1TK6U=
Date: Mon, 22 Nov 2021 15:29:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-7.0 v7 01/10] target/ppc: introduce PMUEventType and
 PMU overflow timers
Message-ID: <YZscxboGB4ryvy4Q@yekko>
References: <20211119182216.628676-1-danielhb413@gmail.com>
 <20211119182216.628676-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="31wahgvCA/vUXBH8"
Content-Disposition: inline
In-Reply-To: <20211119182216.628676-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


--31wahgvCA/vUXBH8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 03:22:07PM -0300, Daniel Henrique Barboza wrote:
> This patch starts an IBM Power8+ compatible PMU implementation by adding
> the representation of PMU events that we are going to sample,
> PMUEventType. This enum represents a Perf event that is being sampled by
> a specific counter 'sprn'. Events that aren't available (i.e. no event
> was set in MMCR1) will be of type 'PMU_EVENT_INVALID'. Other types added
> in this patch are PMU_EVENT_CYCLES and PMU_EVENT_INSTRUCTIONS. More
> types will be added later on.
>=20
> Let's also add the required PMU cycle overflow timers. They will be used
> to trigger cycle overflows when cycle events are being sampled. This
> timer will call cpu_ppc_pmu_timer_cb(), which in turn calls
> fire_PMC_interrupt().  Both functions are stubs that will be implemented
> later on when EBB support is added.
>=20
> Two new helper files are created to host this new logic.
> cpu_ppc_pmu_init() will init all overflow timers during CPU init time.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_cpu_core.c |  1 +
>  target/ppc/cpu.h        | 15 +++++++++++
>  target/ppc/cpu_init.c   | 24 +++++++++++++++++
>  target/ppc/meson.build  |  1 +
>  target/ppc/power8-pmu.c | 57 +++++++++++++++++++++++++++++++++++++++++
>  target/ppc/power8-pmu.h | 25 ++++++++++++++++++
>  6 files changed, 123 insertions(+)
>  create mode 100644 target/ppc/power8-pmu.c
>  create mode 100644 target/ppc/power8-pmu.h
>=20
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 58e7341cb7..a57ba70a87 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -20,6 +20,7 @@
>  #include "target/ppc/kvm_ppc.h"
>  #include "hw/ppc/ppc.h"
>  #include "target/ppc/mmu-hash64.h"
> +#include "target/ppc/power8-pmu.h"
>  #include "sysemu/numa.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/hw_accel.h"
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index e946da5f3a..04ef9300af 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -296,6 +296,15 @@ typedef struct ppc_v3_pate_t {
>      uint64_t dw1;
>  } ppc_v3_pate_t;
> =20
> +/* PMU related structs and defines */
> +#define PMU_COUNTERS_NUM 6
> +#define PMU_TIMERS_NUM   (PMU_COUNTERS_NUM - 1) /* PMC5 doesn't count cy=
cles */
> +typedef enum {
> +    PMU_EVENT_INVALID =3D 0,
> +    PMU_EVENT_CYCLES,
> +    PMU_EVENT_INSTRUCTIONS,
> +} PMUEventType;
> +
>  /***********************************************************************=
******/
>  /* Machine state register bits definition                               =
     */
>  #define MSR_SF   63 /* Sixty-four-bit mode                            hf=
lags */
> @@ -1191,6 +1200,12 @@ struct CPUPPCState {
>      uint32_t tm_vscr;
>      uint64_t tm_dscr;
>      uint64_t tm_tar;
> +
> +    /*
> +     * Timers used to fire performance monitor alerts
> +     * when counting cycles.
> +     */
> +    QEMUTimer *pmu_cyc_overflow_timers[PMU_TIMERS_NUM];
>  };
> =20
>  #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 6695985e9b..9610e65c76 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -45,6 +45,7 @@
>  #include "helper_regs.h"
>  #include "internal.h"
>  #include "spr_tcg.h"
> +#include "power8-pmu.h"
> =20
>  /* #define PPC_DEBUG_SPR */
>  /* #define USE_APPLE_GDB */
> @@ -7377,6 +7378,20 @@ static void register_power9_mmu_sprs(CPUPPCState *=
env)
>  #endif
>  }
> =20
> +/*
> + * Initialize PMU counter overflow timers for Power8 and
> + * newer Power chips when using TCG.
> + */
> +static void init_tcg_pmu_power8(CPUPPCState *env)
> +{
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +    /* Init PMU overflow timers */
> +    if (!kvm_enabled()) {
> +        cpu_ppc_pmu_init(env);
> +    }
> +#endif
> +}
> +
>  static void init_proc_book3s_common(CPUPPCState *env)
>  {
>      register_ne_601_sprs(env);
> @@ -7694,6 +7709,9 @@ static void init_proc_POWER8(CPUPPCState *env)
>      register_sdr1_sprs(env);
>      register_book3s_207_dbg_sprs(env);
> =20
> +    /* Common TCG PMU */
> +    init_tcg_pmu_power8(env);
> +
>      /* POWER8 Specific Registers */
>      register_book3s_ids_sprs(env);
>      register_rmor_sprs(env);
> @@ -7888,6 +7906,9 @@ static void init_proc_POWER9(CPUPPCState *env)
>      init_proc_book3s_common(env);
>      register_book3s_207_dbg_sprs(env);
> =20
> +    /* Common TCG PMU */
> +    init_tcg_pmu_power8(env);
> +
>      /* POWER8 Specific Registers */
>      register_book3s_ids_sprs(env);
>      register_amr_sprs(env);
> @@ -8104,6 +8125,9 @@ static void init_proc_POWER10(CPUPPCState *env)
>      init_proc_book3s_common(env);
>      register_book3s_207_dbg_sprs(env);
> =20
> +    /* Common TCG PMU */
> +    init_tcg_pmu_power8(env);
> +
>      /* POWER8 Specific Registers */
>      register_book3s_ids_sprs(env);
>      register_amr_sprs(env);
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index b85f295703..a49a8911e0 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -51,6 +51,7 @@ ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
>    'mmu-book3s-v3.c',
>    'mmu-hash64.c',
>    'mmu-radix64.c',
> +  'power8-pmu.c',
>  ))
> =20
>  target_arch +=3D {'ppc': ppc_ss}
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> new file mode 100644
> index 0000000000..3c2f73896f
> --- /dev/null
> +++ b/target/ppc/power8-pmu.c
> @@ -0,0 +1,57 @@
> +/*
> + * PMU emulation helpers for TCG IBM POWER chips
> + *
> + *  Copyright IBM Corp. 2021
> + *
> + * Authors:
> + *  Daniel Henrique Barboza      <danielhb413@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "power8-pmu.h"
> +#include "cpu.h"
> +#include "helper_regs.h"
> +#include "exec/exec-all.h"
> +#include "exec/helper-proto.h"
> +#include "qemu/error-report.h"
> +#include "qemu/main-loop.h"
> +#include "hw/ppc/ppc.h"
> +
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +
> +static void fire_PMC_interrupt(PowerPCCPU *cpu)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_EBE)) {
> +        return;
> +    }
> +
> +    /* PMC interrupt not implemented yet */
> +    return;
> +}
> +
> +static void cpu_ppc_pmu_timer_cb(void *opaque)
> +{
> +    PowerPCCPU *cpu =3D opaque;
> +
> +    fire_PMC_interrupt(cpu);
> +}
> +
> +void cpu_ppc_pmu_init(CPUPPCState *env)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +    int i;
> +
> +    for (i =3D 0; i < PMU_TIMERS_NUM; i++) {
> +        env->pmu_cyc_overflow_timers[i] =3D timer_new_ns(QEMU_CLOCK_VIRT=
UAL,
> +                                                       &cpu_ppc_pmu_time=
r_cb,
> +                                                       cpu);
> +    }
> +}
> +
> +#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
> diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
> new file mode 100644
> index 0000000000..49a813a443
> --- /dev/null
> +++ b/target/ppc/power8-pmu.h
> @@ -0,0 +1,25 @@
> +/*
> + * PMU emulation helpers for TCG IBM POWER chips
> + *
> + *  Copyright IBM Corp. 2021
> + *
> + * Authors:
> + *  Daniel Henrique Barboza      <danielhb413@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef POWER8_PMU
> +#define POWER8_PMU
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/exec-all.h"
> +#include "exec/helper-proto.h"
> +#include "qemu/error-report.h"
> +#include "qemu/main-loop.h"
> +
> +void cpu_ppc_pmu_init(CPUPPCState *env);
> +
> +#endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--31wahgvCA/vUXBH8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGbHMIACgkQbDjKyiDZ
s5KmPQ/6AiB9iOyNH1IEEB4Na5iDi4H6esKFQDXU/pl8QJZj1+eVQ3zWxDRohqRs
rx52l+GDWAG9KIseQrUq6JGEK/jFoTmoeXc0QYu+eF1w1vn++4s0s3jCk3d5g9Pk
vP0soxO7WbQbxWKSQl/BHbDmaG09TUSd3RMWbT2D5JhZGSSlgxK9101uU/QkOIQs
QkKZV3WfsKyee7/3TDAjlAPLKSOSAd2NSvqBqYJ93tIRhRQqLv8pXfeRM6DZMELH
dxIqY9NqkpEqRGb6Wu4fX41cEwQNYYEGG7CfXuzBxKxDl7okvwah07WWxcd1rEys
GM/XU9Hb/v7h5GgukQm9t5Kx1oUhiAEsLuJPy1ib2gHR6t0wnSn2P07zC4KGvP4s
vAAALs7maOvV6BhfD6LkVa7p/+dNQjwICehHduclq8xbDjpvSDzSiLC+YE72twLE
Q+0lTy4dfU/Y2UkilWcBPKhTPxyhw+DQ+GNy2YCYAGs/V14q1yG1/Xc29MTbBbFJ
S621Nrnkuu5HXGqoBSegptL4gSi1nk9gLUipnSU1ZTOqT99MKXXqiXcyRfPNcPEi
3vCvlfBHMLUxb0V1iR3X2qSost2JJmMzFntcC1/13RauBGyKJrdxkegtJ+VEJBgv
0db7ch5tCanpj4DaoV3vnxenFGRPV+nzrkvJxZipfSEjI4BxIN0=
=CULs
-----END PGP SIGNATURE-----

--31wahgvCA/vUXBH8--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945E344E0F5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 05:09:06 +0100 (CET)
Received: from localhost ([::1]:51948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlNs9-0001Wd-60
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 23:09:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mlNo0-0000VU-5I; Thu, 11 Nov 2021 23:04:48 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:43055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mlNnt-00024W-O1; Thu, 11 Nov 2021 23:04:45 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Hr4jD11QFz4xdN; Fri, 12 Nov 2021 15:04:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636689872;
 bh=NL+sBxKZnX12Zpn1kqa8t80ve7jlZNUIW9axQPI/Sis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FXIchiUI3CcXHxVzdQEu+IMejioHhzt1IRswycyYVSg+gce5B1vkLZTIM2zC0PMCO
 JxDoaEybZy2lFfNIVjnuSeKf5kzc1FV2n6WVQ2eCsfOjkGaxxkQ2rL3fSdDyL/zcy6
 VSD4pH3QhWqbcaQVSG9JFH55LJ3VMRTuK6ip+whE=
Date: Fri, 12 Nov 2021 14:02:21 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v6 01/10] target/ppc: introduce PMUEventType and PMU
 overflow timers
Message-ID: <YY3ZPV5C1O/gu9sj@yekko>
References: <20211108225047.1733607-1-danielhb413@gmail.com>
 <20211108225047.1733607-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kWByZisSCvRJjMVH"
Content-Disposition: inline
In-Reply-To: <20211108225047.1733607-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kWByZisSCvRJjMVH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 08, 2021 at 07:50:38PM -0300, Daniel Henrique Barboza wrote:
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
> ---
>  hw/ppc/spapr_cpu_core.c |  6 +++++
>  target/ppc/cpu.h        | 15 +++++++++++
>  target/ppc/meson.build  |  1 +
>  target/ppc/power8-pmu.c | 57 +++++++++++++++++++++++++++++++++++++++++
>  target/ppc/power8-pmu.h | 25 ++++++++++++++++++
>  5 files changed, 104 insertions(+)
>  create mode 100644 target/ppc/power8-pmu.c
>  create mode 100644 target/ppc/power8-pmu.h
>=20
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 58e7341cb7..45abffd891 100644
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
> @@ -266,6 +267,11 @@ static bool spapr_realize_vcpu(PowerPCCPU *cpu, Spap=
rMachineState *spapr,
>          return false;
>      }
> =20
> +    /* Init PMU interrupt timer (TCG only) */
> +    if (!kvm_enabled()) {
> +        cpu_ppc_pmu_init(env);

AFAIK, the PMU should be universal in the cpu model, not tied to spapr
specifically, so this looks like the wrong place to trigger the
initialization.

> +    }
> +
>      if (!sc->pre_3_0_migration) {
>          vmstate_register(NULL, cs->cpu_index, &vmstate_spapr_cpu_state,
>                           cpu->machine_data);
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

--kWByZisSCvRJjMVH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGN2TsACgkQbDjKyiDZ
s5IxsQ//VcRPe7CETUSkY/1e+YDfbMujjj6XbAuCSzXcZ2FOAl7EPKiHqgI2q4Zq
0KhDn+On9aJUWVAWX0W0tL1F1U1y+HYQiPYci6kyKMfvonFtpz3Z2jOoybz+yFEz
C3gSxHgNhp3eIBgoAewOkYOSle1XbNTN5bYPgi1f37aH//oTJFHDg7cGhfE7sH8W
vIV3h9RLMo6gX6+IUZ43YuQMO4yLbA05HBALl6Zc9NqfclVnloT33ZXLEHhHegLF
X8JueYUcDw7YEV1+1g5z7GBYHcQDy3xk9uZGrj52l0qhLe0INVdy1A9vXqgCRdPs
Ljil/wFKpUxeyZGMKwTdtrtXNuKvq08+uJGTv6YEp4G8caBca/PcSqUvarqxgpfv
m5WxrULC5HzOU57+0g7xrgIfhyj3i4zi2H1pMyzpL5amEOjUy4qTKtZmhkpubmwY
DpWganUzkksALl+VQ1cCLNnLfGTrssmjjEieXVJa2UuKVoZkmY/DSDduUypzFPqN
pSu0rT4K/s2FaVuV6ksrR4fMA/GP7VtB5SsoWphr/eLZCME4abWOMVY71BeQhF6e
qWyE+1Z109wFdLpEMUqChTsbbISYpHlG3oAd9d68sT8GjudCS96sLbDAyNG9tzOY
f2klYRRfL7e0ezmt7fFZ3m2jlSY8acR+nM7PfM1xkzjAI2XBioo=
=ni8n
-----END PGP SIGNATURE-----

--kWByZisSCvRJjMVH--


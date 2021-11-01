Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A0C4412CC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 05:42:26 +0100 (CET)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhP9M-0008Ou-Uq
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 00:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mhP6D-0006l4-DI; Mon, 01 Nov 2021 00:39:09 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mhP68-000406-MU; Mon, 01 Nov 2021 00:39:09 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HjL003rWgz4xbG; Mon,  1 Nov 2021 15:38:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1635741536;
 bh=50QEQmT84k+wBReTRS5B5C9BFLuvLBC24RwK/0Os4Yg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pNKuFRd9G6BywDDeWOcnf8eYRGYNDiqsrW5BTs3iNOHijGbk83f3mpMGODbv8dgui
 /bURyu3I58jAgg2laQPGmB2/ZtDbEjM6/0DzFFgOyzCZIAxbUXeL8hXSfw34v5FX6t
 UeMYhbGfTpXbMUGqlFTQLwD4JgyFBWFyDb9cfUZI=
Date: Mon, 1 Nov 2021 15:38:41 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 05/15] target/ppc: introduce PMU events
Message-ID: <YX9vUZeh0sAfBdNw@yekko>
References: <20211018010133.315842-1-danielhb413@gmail.com>
 <20211018010133.315842-6-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CohbugHrVCUq87Uk"
Content-Disposition: inline
In-Reply-To: <20211018010133.315842-6-danielhb413@gmail.com>
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--CohbugHrVCUq87Uk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 17, 2021 at 10:01:23PM -0300, Daniel Henrique Barboza wrote:
> This patch starts an IBM Power8+ compatible PMU implementation by adding
> the representation of PMU events that we are going to sample, PMUEvent.
> This struct represents a Perf event, determined by the PMUEventType
> enum, that is being sampled by a specific counter 'sprn'. PMUEvent also
> contains an overflow timer that will be used to trigger cycle overflows
> when cycle events are being sampled. This timer will call
> cpu_ppc_pmu_timer_cb(), which in turn calls fire_PMC_interrupt(). Both
> functions are stubs that will be implemented later on when EBB support
> is added.
>=20
> The PMU has 6 PMUEvents all the time, one for each counter. Events that
> aren't available (i.e. the counter isn't running) will be of type
> 'PMU_EVENT_INVALID'. Other types added in this patch are
> PMU_EVENT_CYCLES and PMU_EVENT_INSTRUCTIONS. More types will be added
> later on.
>=20
> Two new helper files are created to host this new logic.
> cpu_ppc_pmu_init() will init all PMUEvents during CPU init time.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Ah, sorry, this isn't quite what I had in mind.

> ---
>  hw/ppc/spapr_cpu_core.c |  6 ++++
>  target/ppc/cpu.h        | 22 ++++++++++++
>  target/ppc/meson.build  |  1 +
>  target/ppc/power8-pmu.c | 75 +++++++++++++++++++++++++++++++++++++++++
>  target/ppc/power8-pmu.h | 25 ++++++++++++++
>  5 files changed, 129 insertions(+)
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
> +    }
> +
>      if (!sc->pre_3_0_migration) {
>          vmstate_register(NULL, cs->cpu_index, &vmstate_spapr_cpu_state,
>                           cpu->machine_data);
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 33e3a91f6f..21591ec725 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -296,6 +296,26 @@ typedef struct ppc_v3_pate_t {
>      uint64_t dw1;
>  } ppc_v3_pate_t;
> =20
> +/* PMU related structs and defines */
> +#define PMU_EVENTS_NUM 6
> +typedef enum {
> +    PMU_EVENT_INVALID =3D 0,
> +    PMU_EVENT_CYCLES,
> +    PMU_EVENT_INSTRUCTIONS,
> +} PMUEventType;
> +

PMUEventType *is* basically what I had in mind..

> +typedef struct PMUEvent {
> +    int sprn;
> +    PMUEventType type;
> +
> +    /*
> +     * Timer used to fire performance monitor alerts
> +     * when counting cycles.
> +     */
> +    QEMUTimer *cyc_overflow_timer;
> +
> +} PMUEvent;

=2E. but I don't think the PMUEvent structure is particularly useful.

What I was thinking was essentially a function which takes PMC number
and returns PMUEventType.  That will be pretty complex and messy.  It
would always return CYCLES or INSTRUCTIONS for PMC 5 & 6, for PMC 1..4
it will look at MMCR*, apply whatever sprn specific log it needs to
and come up with an answer (or INVALID, of course).

The messy sprn specific logic is inevitable given the hardware, but
the idea is that this will localize it to one place.  Once you have
that function you can for example just loop through each PMC, get its
event type and do the right things based on that.

> +
>  /***********************************************************************=
******/
>  /* Machine state register bits definition                               =
     */
>  #define MSR_SF   63 /* Sixty-four-bit mode                            hf=
lags */
> @@ -1190,6 +1210,8 @@ struct CPUPPCState {
>      uint32_t tm_vscr;
>      uint64_t tm_dscr;
>      uint64_t tm_tar;
> +
> +    PMUEvent pmu_events[PMU_EVENTS_NUM];

Nor storing this information here persistently.

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
> index 0000000000..42452b5870
> --- /dev/null
> +++ b/target/ppc/power8-pmu.c
> @@ -0,0 +1,75 @@
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
> +    /*
> +     * PMC1 event first, PMC2 second and so on. PMC5 and PMC6
> +     * PMUEvent are always the same regardless of MMCR1.
> +     */
> +    for (i =3D 0; i < PMU_EVENTS_NUM; i++) {
> +        PMUEvent *event =3D &env->pmu_events[i];
> +
> +        event->sprn =3D SPR_POWER_PMC1 + i;
> +        event->type =3D PMU_EVENT_INVALID;
> +
> +        if (event->sprn =3D=3D SPR_POWER_PMC5) {
> +            event->type =3D PMU_EVENT_INSTRUCTIONS;
> +            continue;
> +        }
> +
> +        if (event->sprn =3D=3D SPR_POWER_PMC6) {
> +            event->type =3D PMU_EVENT_CYCLES;
> +        }
> +
> +        event->cyc_overflow_timer =3D  timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                                  &cpu_ppc_pmu_timer_cb,
> +                                                  cpu);
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

--CohbugHrVCUq87Uk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmF/b08ACgkQbDjKyiDZ
s5Jzuw//RCdl/ju6Pg5c/2q6bq/2+4iUaJq+QlGN76ofye1W21zDCP9K9FGlymJO
mutqde7QQ97RxHx00o5ssaBbxM8ArSeZEYBlFZinS29Chw8lAeu7D/pGBSdkK30X
isArzDbn3aRG5xZ2xmRf9OYT37zzTNUFy4aNN5vfF8vnlOi2wSE4EKC3LfWAw9S7
q/pH6qjaZarHkvD2/L5TH8DX5uy+73kDhre/Hx1mW45poP8GVvB/wh39vUq4kWit
f4qiXEOeP2TOcf4w61IqRxhrXBNbPk07GbSeuM38kK0aOez+UTeVLkK+TLvh32i1
Ot3onQDtc2nF6oZsqdbOycROm9p93//lWO6/5XaJNxVUiWF/JI7Pb4WUKgNr0ZeF
3Y9AniSKc8LRCLXX8IfiJLtZQNYZH1jxCpLgQHYjvhoRx9VffgfUu618o3QQyFwk
y2bIGlKGz2EWxe3kifilpbTZg6h/XkCDb9I3nRj9bPgM62FmPLJYd+H8IU73/cZA
gCA6niYSSnH+yjdamwMaUCGmcVS50iFqxsm1q95CLCZLUjwk6c0r9XXFhGLGYobR
9BAxh1aJ5QkD3ym7qUnQvf/gnYaNh43vsxuTLbrE/nJSqJ9oHvCDyhdsq/BzbLhe
d5mYqKHfXEzXVw+x+U652FjdGvpJU20kOgPShawTQMoFQ/rDwmo=
=OXCP
-----END PGP SIGNATURE-----

--CohbugHrVCUq87Uk--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031DB3F6EEA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 07:45:33 +0200 (CEST)
Received: from localhost ([::1]:59094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIljA-0002pG-0k
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 01:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIleB-0008PQ-LL; Wed, 25 Aug 2021 01:40:23 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIldz-0006DE-F9; Wed, 25 Aug 2021 01:40:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvZYx3p7Wz9ssD; Wed, 25 Aug 2021 15:40:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629870005;
 bh=NIaAOVkxo/HfVAGJVb/dTTpQOTVsd3iuTHe+uo2ubLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mHzyM7Ki8aShbHvYMwe/iafqpHHEr0XYWtZ6BAK8X0avdWMoPZRV8dYasu2gzgEhg
 ihfP4VOy+XfP2xSP3DX57DLHBUptpHo4oR/71ZqgDTvDcNiipEvUamEDS8/1Dsyx4H
 pYLeCAmHgNVZpWChMyGRhWAazxQ3hy2Si1P9pCl0=
Date: Wed, 25 Aug 2021 15:37:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 10/16] target/ppc: PMU Event-Based exception support
Message-ID: <YSXXDoktzkXkd3Vv@yekko>
References: <20210824163032.394099-1-danielhb413@gmail.com>
 <20210824163032.394099-11-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6cfQJO1XpXs2LGLv"
Content-Disposition: inline
In-Reply-To: <20210824163032.394099-11-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6cfQJO1XpXs2LGLv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 01:30:26PM -0300, Daniel Henrique Barboza wrote:
> From: Gustavo Romero <gromero@linux.ibm.com>
>=20
> Following up the rfebb implementation, this patch adds the EBB exception
> support that are triggered by Performance Monitor alerts. This exception
> occurs when an enabled PMU condition or event happens and both MMCR0_EBE
> and BESCR_PME are set.
>=20
> The supported PM alerts will consist of counter negative conditions of
> the PMU counters. This will be achieved by a timer mechanism that will
> predict when a counter becomes negative. The PMU timer callback will set
> the appropriate bits in MMCR0 and fire a PMC interrupt. The EBB
> exception code will then set the appropriate BESCR bits, set the next
> instruction pointer to the address pointed by the return register
> (SPR_EBBRR), and redirect execution to the handler (pointed by
> SPR_EBBHR).
>=20
> This patch sets the basic structure of interrupts and timers. The
> following patches will add the counter negative logic for the
> registers.

A timer makes sense for tripping cycles based EBB events.  But for
instructions based EBB events, shouldn't you instead have a test in
the update instructions path which trips the event if you've passed
the magic number?

>=20
> CC: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr_cpu_core.c  |  6 ++++++
>  target/ppc/cpu.h         | 12 +++++++++++-
>  target/ppc/excp_helper.c | 28 +++++++++++++++++++++++++++
>  target/ppc/power8_pmu.c  | 41 ++++++++++++++++++++++++++++++++++++++++
>  target/ppc/power8_pmu.h  | 25 ++++++++++++++++++++++++
>  5 files changed, 111 insertions(+), 1 deletion(-)
>  create mode 100644 target/ppc/power8_pmu.h
>=20
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 4f316a6f9d..c7a342c4aa 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -20,6 +20,7 @@
>  #include "target/ppc/kvm_ppc.h"
>  #include "hw/ppc/ppc.h"
>  #include "target/ppc/mmu-hash64.h"
> +#include "target/ppc/power8_pmu.h"
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
> +        cpu_ppc_pmu_timer_init(env);
> +    }
> +
>      if (!sc->pre_3_0_migration) {
>          vmstate_register(NULL, cs->cpu_index, &vmstate_spapr_cpu_state,
>                           cpu->machine_data);
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 9d5eb9ead4..535754ddff 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -129,8 +129,9 @@ enum {
>      /* ISA 3.00 additions */
>      POWERPC_EXCP_HVIRT    =3D 101,
>      POWERPC_EXCP_SYSCALL_VECTORED =3D 102, /* scv exception             =
        */
> +    POWERPC_EXCP_EBB =3D 103, /* Event-based branch exception           =
       */
>      /* EOL                                                              =
     */
> -    POWERPC_EXCP_NB       =3D 103,
> +    POWERPC_EXCP_NB       =3D 104,
>      /* QEMU exceptions: special cases we want to stop translation       =
     */
>      POWERPC_EXCP_SYSCALL_USER =3D 0x203, /* System call in user mode onl=
y      */
>  };
> @@ -1047,6 +1048,8 @@ struct ppc_radix_page_info {
>  #define PPC_CPU_OPCODES_LEN          0x40
>  #define PPC_CPU_INDIRECT_OPCODES_LEN 0x20
> =20
> +#define PMU_TIMERS_LEN 5
> +
>  struct CPUPPCState {
>      /* Most commonly used resources during translated code execution fir=
st */
>      target_ulong gpr[32];  /* general purpose registers */
> @@ -1208,6 +1211,12 @@ struct CPUPPCState {
>       * running cycles.
>       */
>      uint64_t pmu_base_time;
> +
> +    /*
> +     * Timers used to fire performance monitor alerts and
> +     * interrupts. All PMCs but PMC5 has a timer.
> +     */
> +    QEMUTimer *pmu_intr_timers[PMU_TIMERS_LEN];
>  };
> =20
>  #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
> @@ -2424,6 +2433,7 @@ enum {
>      PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt   =
 */
>      PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt      =
  */
>      PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt=
  */
> +    PPC_INTERRUPT_PMC,            /* Performance Monitor Counter interru=
pt */
>  };
> =20
>  /* Processor Compatibility mask (PCR) */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 058b063d8a..e97898c5f4 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -821,6 +821,22 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>          cpu_abort(cs, "Non maskable external exception "
>                    "is not implemented yet !\n");
>          break;
> +    case POWERPC_EXCP_EBB:       /* Event-based branch exception        =
     */
> +        if ((env->spr[SPR_BESCR] & BESCR_GE) &&
> +            (env->spr[SPR_BESCR] & BESCR_PME)) {
> +            target_ulong nip;
> +
> +            env->spr[SPR_BESCR] &=3D ~BESCR_GE;   /* Clear GE */
> +            env->spr[SPR_BESCR] |=3D BESCR_PMEO;  /* Set PMEO */
> +            env->spr[SPR_EBBRR] =3D env->nip;     /* Save NIP for rfebb =
insn */
> +            nip =3D env->spr[SPR_EBBHR];          /* EBB handler */
> +            powerpc_set_excp_state(cpu, nip, env->msr);
> +        }
> +        /*
> +         * This interrupt is handled by userspace. No need
> +         * to proceed.
> +         */
> +        return;
>      default:
>      excp_invalid:
>          cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> @@ -1068,6 +1084,18 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>              powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_THERM);
>              return;
>          }
> +        /* PMC -> Event-based branch exception */
> +        if (env->pending_interrupts & (1 << PPC_INTERRUPT_PMC)) {
> +            /*
> +             * Performance Monitor event-based exception can only
> +             * occur in problem state.
> +             */
> +            if (msr_pr =3D=3D 1) {
> +                env->pending_interrupts &=3D ~(1 << PPC_INTERRUPT_PMC);
> +                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_EBB);
> +                return;
> +            }
> +        }
>      }
> =20
>      if (env->resume_as_sreset) {
> diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
> index 4545fe7810..a57b602125 100644
> --- a/target/ppc/power8_pmu.c
> +++ b/target/ppc/power8_pmu.c
> @@ -12,12 +12,14 @@
> =20
>  #include "qemu/osdep.h"
> =20
> +#include "power8_pmu.h"
>  #include "cpu.h"
>  #include "helper_regs.h"
>  #include "exec/exec-all.h"
>  #include "exec/helper-proto.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> +#include "hw/ppc/ppc.h"
> =20
>  #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> =20
> @@ -114,6 +116,45 @@ static void update_cycles_PMCs(CPUPPCState *env)
>      }
>  }
> =20
> +static void cpu_ppc_pmu_timer_cb(void *opaque)
> +{
> +    PowerPCCPU *cpu =3D opaque;
> +    CPUPPCState *env =3D &cpu->env;
> +    uint64_t mmcr0;
> +
> +    mmcr0 =3D env->spr[SPR_POWER_MMCR0];
> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_EBE) {
> +        /* freeeze counters if needed */
> +        if (mmcr0 & MMCR0_FCECE) {
> +            mmcr0 &=3D ~MMCR0_FCECE;
> +            mmcr0 |=3D MMCR0_FC;
> +        }
> +
> +        /* Clear PMAE and set PMAO */
> +        if (mmcr0 & MMCR0_PMAE) {
> +            mmcr0 &=3D ~MMCR0_PMAE;
> +            mmcr0 |=3D MMCR0_PMAO;
> +        }
> +        env->spr[SPR_POWER_MMCR0] =3D mmcr0;
> +
> +        /* Fire the PMC hardware exception */
> +        ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
> +    }
> +}
> +
> +void cpu_ppc_pmu_timer_init(CPUPPCState *env)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +    QEMUTimer *timer;
> +    int i;
> +
> +    for (i =3D 0; i < PMU_TIMERS_LEN; i++) {
> +        timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_pmu_timer_cb,
> +                             cpu);
> +        env->pmu_intr_timers[i] =3D timer;
> +    }
> +}
> +
>  void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
>  {
>      target_ulong curr_value =3D env->spr[SPR_POWER_MMCR0];
> diff --git a/target/ppc/power8_pmu.h b/target/ppc/power8_pmu.h
> new file mode 100644
> index 0000000000..34a9d0e8a2
> --- /dev/null
> +++ b/target/ppc/power8_pmu.h
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
> +#ifndef PMU_BOOK3S_HELPER
> +#define PMU_BOOK3S_HELPER
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/exec-all.h"
> +#include "exec/helper-proto.h"
> +#include "qemu/error-report.h"
> +#include "qemu/main-loop.h"
> +
> +void cpu_ppc_pmu_timer_init(CPUPPCState *env);
> +
> +#endif

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6cfQJO1XpXs2LGLv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEl1w4ACgkQbDjKyiDZ
s5Jh6RAAtV03GMHUx6eC6szB/pNbEcOmoxfRub4pdMbtEr2KQArHb4pJ5bByPKpV
3wBO6hr+U08Q0qPI/noCdbJ4A6SXu/nkYdAeFtFWpQTpa7DlVoJZvPuCx+yxBa+B
Mp2Mf2BogwcXqLYavBwmffa+fRQCUw80VT7w4eLwt4Gks74FDXEbEF0IVLDPQ2+x
Ra6WowBZ6t34CIBGnoMFbLZgV6m9G+b+X3D94EbltGxYp6ACCHMcDYwt7FgsnuYx
3SQMbL/Cnkh66c7+pp2NNuCZnUI7qca7uk5RUm4tHnvmI6CPhztlrOHiBbSrBfre
hxQ48mgFMHvsA3EXyO1yxfpaN++/YQQuaFh0JcViCGPBNfwUTpe/T1YXNwkzOa6M
Rhk0aH1owg65CSi1JhRojgB4DiZdx9Mn3EKGtxorac9dv4CXw6N/xVqsQsefkvJk
C7pQrvfjJrXWTpcltiQUCaHlvBX8J/7+yKMQPCYtHJ7s4svbrTya+cDa1OGP/elV
WOCkzHoYRwEVlK8oVe2Vbh4ZBK1V3FOKI3EKUkXFlbu+aYsTig2POZBxKmC/WNcc
RT6MSQmpdBw+0b9fBwgYqFjKHJi6WKNSY4chh0Bh9YlmM2NEfF2BxgijuknX7xmv
S+BrxfVHsoG63Gstw90WUq0YrkFBzkt7HHDiLy/1MqXFZBwD5PM=
=cxeG
-----END PGP SIGNATURE-----

--6cfQJO1XpXs2LGLv--


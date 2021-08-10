Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D97B3E5227
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:25:19 +0200 (CEST)
Received: from localhost ([::1]:54074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJKI-0001Tc-6M
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDu-0008FT-GJ; Tue, 10 Aug 2021 00:18:42 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:56595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDr-0002RF-8X; Tue, 10 Aug 2021 00:18:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSS3LmGz9tB1; Tue, 10 Aug 2021 14:18:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569096;
 bh=1Nnuugiq2XuMih63c3BwW+I42dBRHuxzeDYVqInmrBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J4UsWR41HAPfXK/LUfMAUL/ev/vN2zE1GXlVaSZUZAB/O701D2WnA8vpSx2wzntxf
 8jWMevB1577x3AUrMkgyqFh3re5bAELaFj71+QKIFbnBjry7VcLz/+vBBrZ2Q8hgC9
 rj4lreEQ597/itlsDFOFitlgg3o8nix0b/fnzbhs=
Date: Tue, 10 Aug 2021 13:55:22 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 10/19] target/ppc: PMU Event-Based exception support
Message-ID: <YRH4qn5i1MesARl2@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-11-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RVHkMkoG49o9sUF6"
Content-Disposition: inline
In-Reply-To: <20210809131057.1694145-11-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001,
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
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RVHkMkoG49o9sUF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:10:48AM -0300, Daniel Henrique Barboza wrote:
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
> This patch sets the basic structure of interrupts and the timer. The
> following patches will add the counter negative logic for the registers.
> The goal is to use the EBB selftests of the powerpc kernel to validate
> the EBB implementation, thus we'll add more PMU bits as we go along.
>=20
> CC: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr_cpu_core.c        |  6 ++++++
>  target/ppc/cpu.h               |  9 +++++++-
>  target/ppc/excp_helper.c       | 28 +++++++++++++++++++++++++
>  target/ppc/pmu_book3s_helper.c | 38 ++++++++++++++++++++++++++++++++++
>  4 files changed, 80 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 4f316a6f9d..41b443bde2 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -20,6 +20,7 @@
>  #include "target/ppc/kvm_ppc.h"
>  #include "hw/ppc/ppc.h"
>  #include "target/ppc/mmu-hash64.h"
> +#include "target/ppc/pmu_book3s_helper.h"
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

I'd prefer this check to be inside the called function.

> +        cpu_ppc_pmu_timer_init(env);
> +    }
> +
>      if (!sc->pre_3_0_migration) {
>          vmstate_register(NULL, cs->cpu_index, &vmstate_spapr_cpu_state,
>                           cpu->machine_data);
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index ae431e65be..1d38b8cf7a 100644
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
> @@ -1201,6 +1202,11 @@ struct CPUPPCState {
>       * instructions and cycles.
>       */
>      uint64_t pmu_base_icount;
> +
> +    /*
> +     * Timer used to fire performance monitor alerts and interrupts.
> +     */
> +    QEMUTimer *pmu_intr_timer;
>  };
> =20
>  #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
> @@ -2417,6 +2423,7 @@ enum {
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
> index a79a0ed465..b866209b6e 100644
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
> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helpe=
r.c
> index 91bb82e699..43cc0eb722 100644
> --- a/target/ppc/pmu_book3s_helper.c
> +++ b/target/ppc/pmu_book3s_helper.c
> @@ -10,12 +10,15 @@
>   * See the COPYING file in the top-level directory.
>   */
> =20
> +#include "pmu_book3s_helper.h"
> +
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "exec/exec-all.h"
>  #include "exec/helper-proto.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> +#include "hw/ppc/ppc.h"
> =20
>  /*
>   * Set arbitrarily based on clock-frequency values used in PNV
> @@ -96,6 +99,41 @@ static void update_PMCs(CPUPPCState *env, uint64_t ico=
unt_delta)
>      update_PMC_PM_CYC(env, SPR_POWER_PMC6, icount_delta);
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

Don't you need to go through the helper here to make sure the freeze
counter logic runs?

> +        /* Fire the PMC hardware exception */
> +        ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
> +    }
> +}
> +
> +void cpu_ppc_pmu_timer_init(CPUPPCState *env)
> +{
> +    PowerPCCPU *cpu =3D env_archcpu(env);
> +    QEMUTimer *timer;
> +
> +    timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_pmu_timer_cb, cp=
u);

I don't see where the actual time-until-interrupt is calculated.

> +    env->pmu_intr_timer =3D timer;
> +}
> +
>  void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
>  {
>      uint64_t curr_icount =3D (uint64_t)icount_get_raw();

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RVHkMkoG49o9sUF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER+KoACgkQbDjKyiDZ
s5L/Cg//TWAlS4M+MqP98GEfMiBUZ+nnwvIA3c3RMCN1q22GhbYDAq/95WB9JnJ3
8hAVs84FTTdarwVsLE8fdtC7OggI8X6VIlgvWJ7d2HWo352N+Je5O+iNuCNj4Boi
BwtSb5gehXWSFgY9nMjZdg5vio56B91cUNt9wwewmFAvv4dsuZ+7JBu4ZN47mwYf
lzGGLjPWjmQYbeAHIIv/TIXKUJrqbfHKHKi1M15uAO5R49rFjVX3g/djxHwNDEMt
/vuqN3b4INFda+1hNfIInxPe95t7ktq6J19Mb+N87Vq8hrOZw8vKV7Js21otF00B
WO/Q+hI8Xvop0+zJ5MiprISxZjEWfQbZtPOhFs8hSiTzIwHHDxGIqpOJwoyD+2P0
9oNYGFVhjaBDVH3dzulAeFdHxpxFwdyVVnqsq7EutaYRrxflWA94qQYFBIzxPM4y
ff3IU1bNmLD/lm6HRmY5bLgFn3wM7xdXeIXDzjJTyd3bTpncX2hd4/kehKsGI1TG
cqBHLCo/DmWehtJmGCljMIKop9GUPp94+1SV1kpgfDBnDdQyLSpiQr7UgQr+5JC7
bcu1CkFM6GlpK5hpzy4rL+wEQiKZ9KheXXVMhlQgJt/RyVGcHMtkXtkNUlN84zHQ
Tgs4Ti4/b/M0Gj8X6cmsOxLKqZKl7LM0DLBanTuuWoryieusHxk=
=mj6q
-----END PGP SIGNATURE-----

--RVHkMkoG49o9sUF6--


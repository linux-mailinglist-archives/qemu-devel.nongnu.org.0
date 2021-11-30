Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECDC462BA3
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 05:22:07 +0100 (CET)
Received: from localhost ([::1]:56140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mruec-0001Qf-Ls
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 23:22:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mruaR-0007gX-RU; Mon, 29 Nov 2021 23:17:47 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:53253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mruaO-0005pe-6c; Mon, 29 Nov 2021 23:17:46 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J38832Z5hz4xPw; Tue, 30 Nov 2021 15:17:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638245859;
 bh=r3ubc+sa5YGBHP901sOM0tMUR4mFeuGMIZRTsLknDbg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f81S1d+GYV7xuGY8yUWLOZ636iVA2RnnfBaGpiMCsRYxsrSQyxd3sOTKDuKcfIRHW
 dEsJNm4rC2Uyo46Q0AW9gDzSRyA/Y+RZS22k4c4Wr9PbFhmCis4eyUcSjMlPP/heCT
 r1mbgtvfxsNpIyAHZ/6wUzdlhboPizjgLA8cqY7w=
Date: Tue, 30 Nov 2021 15:15:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 09/10] target/ppc: PMU Event-Based exception support
Message-ID: <YaWlc6y+I+KCkHng@yekko>
References: <20211125150817.573204-1-danielhb413@gmail.com>
 <20211125150817.573204-10-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h5dnmMkAgXSKgSRY"
Content-Disposition: inline
In-Reply-To: <20211125150817.573204-10-danielhb413@gmail.com>
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
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Gustavo Romero <gromero@linux.ibm.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--h5dnmMkAgXSKgSRY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 12:08:16PM -0300, Daniel Henrique Barboza wrote:
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
> CC: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/cpu.h         |  5 ++++-
>  target/ppc/excp_helper.c | 29 +++++++++++++++++++++++++++++
>  target/ppc/power8-pmu.c  | 35 +++++++++++++++++++++++++++++++++--
>  3 files changed, 66 insertions(+), 3 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index edb4488176..28ae904d76 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -129,8 +129,10 @@ enum {
>      /* ISA 3.00 additions */
>      POWERPC_EXCP_HVIRT    =3D 101,
>      POWERPC_EXCP_SYSCALL_VECTORED =3D 102, /* scv exception             =
        */
> +    POWERPC_EXCP_EBB =3D 103, /* Event-based branch exception           =
       */
> +
>      /* EOL                                                              =
     */
> -    POWERPC_EXCP_NB       =3D 103,
> +    POWERPC_EXCP_NB       =3D 104,
>      /* QEMU exceptions: special cases we want to stop translation       =
     */
>      POWERPC_EXCP_SYSCALL_USER =3D 0x203, /* System call in user mode onl=
y      */
>  };
> @@ -2453,6 +2455,7 @@ enum {
>      PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt   =
 */
>      PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt      =
  */
>      PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt=
  */
> +    PPC_INTERRUPT_PMC,            /* Hypervisor virtualization interrupt=
  */

I'm guessing the comment here should be updated.

>  };
> =20
>  /* Processor Compatibility mask (PCR) */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 7ead32279c..a26d266fe6 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -799,6 +799,23 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>          cpu_abort(cs, "Non maskable external exception "
>                    "is not implemented yet !\n");
>          break;
> +    case POWERPC_EXCP_EBB:       /* Event-based branch exception        =
     */
> +        if ((env->spr[SPR_FSCR] & (1ull << FSCR_EBB)) &&
> +            (env->spr[SPR_BESCR] & BESCR_GE) &&
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
> @@ -1046,6 +1063,18 @@ static void ppc_hw_interrupt(CPUPPCState *env)
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
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index 98797f0b2f..330e0d2ae8 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -290,6 +290,15 @@ void helper_store_pmc(CPUPPCState *env, uint32_t spr=
n, uint64_t value)
>      pmc_update_overflow_timer(env, sprn);
>  }
> =20
> +static void pmu_delete_timers(CPUPPCState *env)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < PMU_TIMERS_NUM; i++) {
> +        timer_del(env->pmu_cyc_overflow_timers[i]);
> +    }
> +}
> +
>  static void fire_PMC_interrupt(PowerPCCPU *cpu)
>  {
>      CPUPPCState *env =3D &cpu->env;
> @@ -298,8 +307,30 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
>          return;
>      }
> =20
> -    /* PMC interrupt not implemented yet */
> -    return;
> +    pmu_update_cycles(env);
> +
> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
> +        env->spr[SPR_POWER_MMCR0] &=3D ~MMCR0_FCECE;
> +        env->spr[SPR_POWER_MMCR0] |=3D MMCR0_FC;
> +
> +        /* Changing MMCR0_FC demands a new hflags compute */
> +        hreg_compute_hflags(env);
> +
> +        /*
> +         * Delete all pending timers if we need to freeze
> +         * the PMC. We'll restart them when the PMC starts
> +         * running again.
> +         */
> +        pmu_delete_timers(env);
> +    }
> +
> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
> +        env->spr[SPR_POWER_MMCR0] &=3D ~MMCR0_PMAE;
> +        env->spr[SPR_POWER_MMCR0] |=3D MMCR0_PMAO;
> +    }
> +
> +    /* Fire the PMC hardware exception */
> +    ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
>  }
> =20
>  /* This helper assumes that the PMC is running. */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--h5dnmMkAgXSKgSRY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGlpXMACgkQbDjKyiDZ
s5KBWQ//ffwnsQBDsKwntW3bELE42XgFJ86OYtEMRMlp4iBy+rYQm5N8tdoWezS7
z3+yaiJmm8612bBPUiUVDHnDNp7Jj+EPVpnOnSkP1gbxAWsZi+nBF5LdasiyHsW+
Po9WJcw6aB4o+N+fKMaiju/QVuXjQvvJSvsnWXK0FCOmuioLiICM1ZxSrgFbJOST
HekNiwBybmLf9VnGhPfDMdv9MWNIaZ9fEplo4O2ndyQSRLQYNUoxHclKt7OtgOU3
8QG9gIRbrbEj81MWyX6gJSCoPH0dtWc/4h0/IXHm6e9O1fUbe8YS1jsWldPoMkvu
dTim/CPCWFfpbi/AuUu7VhAh+isKYt16o1wWYEdxjVy2KBDwr0VVpe7dOkZqHQ87
DSGLhMKOCGRZ+/B1Ax+gVp2bXU2Esk1dJTcB6lJ27DZhiD0NHnbd3Qq4LrzrD2X7
Gpb+fgSDqurDqHMQoGZXtyIstWrPvD6JRtTsIqMDMK9zlwxPRXyS9w5K23e3+Lm3
0U2ypZY8oiGIoGmSXr75mOFMuFOxOTrZhQtHeDfmAuPSggQ1lacH5/QvOm0x+kT5
6juv2fgZ5g31uYh+V0lWiEdJnaeTaAPgTFbx4ZPQimD/hkAHZm+AZ3iLhQG2xRN6
+DSKhmhD/R9hD0rO2+OYgLHP09l12FZc8wIyO5bF0u5Id2W/EYc=
=gfML
-----END PGP SIGNATURE-----

--h5dnmMkAgXSKgSRY--


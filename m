Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE2439D3BE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 06:01:48 +0200 (CEST)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6SR-0001Nn-3J
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 00:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Ph-00077O-EJ; Sun, 06 Jun 2021 23:58:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43945 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Pe-0007RV-7m; Sun, 06 Jun 2021 23:58:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fz03b4lBMz9sSn; Mon,  7 Jun 2021 13:58:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623038331;
 bh=c5m1DI3ekyhYcu0enITQWruYjGvvFFOyftDhBB7dtKo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KaUkqDCJRIFtPt58NgJ+dGt3/01aZHpDdHWvhAKM/BTUb2L1bzMDcFiqKGLQ6UKbg
 UyPP9YUmE9rWotVZXAXk1Jmft24ybW6kc2VWt2VFjP3IInVhKdlqDdMUjAOe31lmSE
 M8mrTQ+JVZrcNHTCqTu9iTm+RYh/2ePFiXVZNWqc=
Date: Mon, 7 Jun 2021 13:55:31 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 4/5] target/ppc: powerpc_excp: Standardize arguments
 to interrupt code
Message-ID: <YL2Ys+PI+b7XJ8NK@yekko>
References: <20210601214649.785647-1-farosas@linux.ibm.com>
 <20210601214649.785647-5-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="teNldQb2Ovytc7eP"
Content-Disposition: inline
In-Reply-To: <20210601214649.785647-5-farosas@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--teNldQb2Ovytc7eP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 06:46:48PM -0300, Fabiano Rosas wrote:
> The next patches will split the big switch statement in powerpc_excp
> into individual functions so it would be cleaner if all variables are
> already grouped in a structure and their names consistent.
>=20
> This patch makes it so that the old values for MSR and NIP (from env)
> are saved at the beginning as regs.msr and regs.nip and all
> modifications are done over this regs version. At the end of the
> function regs.msr and regs.nip are saved in the SRRs and regs.new_msr
> and regs.new_nip are written to env.
>=20
> There are two points of interest here:
>=20
> - The system call code has a particularity where it needs to use
> env->nip because it might return early and the modification needs to
> be seen by the virtual hypervisor hypercall code. I have added a
> comment making this clear.
>=20
> - The MSR filter at the beginning is being applied to the old MSR value
> only, i.e. the one that goes into SRR1. The new_msr is taken from
> env->msr without filtering the reserved bits. This might be a bug in
> the existing code. I'm also adding a comment to point that out.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/excp_helper.c | 231 +++++++++++++++++++++------------------
>  1 file changed, 125 insertions(+), 106 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index fd147e2a37..12bf829c8f 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -186,7 +186,7 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCS=
tate *env, int excp,
>  static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, i=
nt excp,
>                                        target_ulong msr,
>                                        target_ulong *new_msr,
> -                                      target_ulong *vector)
> +                                      target_ulong *new_nip)
>  {
>  #if defined(TARGET_PPC64)
>      CPUPPCState *env =3D &cpu->env;
> @@ -263,9 +263,9 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu=
, int excp_model, int excp,
> =20
>      if (excp !=3D POWERPC_EXCP_SYSCALL_VECTORED) {
>          if (ail =3D=3D 2) {
> -            *vector |=3D 0x0000000000018000ull;
> +            *new_nip |=3D 0x0000000000018000ull;
>          } else if (ail =3D=3D 3) {
> -            *vector |=3D 0xc000000000004000ull;
> +            *new_nip |=3D 0xc000000000004000ull;
>          }
>      } else {
>          /*
> @@ -273,15 +273,15 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *c=
pu, int excp_model, int excp,
>           * only the MSR. AIL=3D3 replaces the 0x17000 base with 0xc...30=
00.
>           */
>          if (ail =3D=3D 3) {
> -            *vector &=3D ~0x0000000000017000ull; /* Un-apply the base of=
fset */
> -            *vector |=3D 0xc000000000003000ull; /* Apply scv's AIL=3D3 o=
ffset */
> +            *new_nip &=3D ~0x0000000000017000ull; /* Un-apply the base o=
ffset */
> +            *new_nip |=3D 0xc000000000003000ull; /* Apply scv's AIL=3D3 =
offset */
>          }
>      }
>  #endif
>  }
> =20
> -static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
> -                                          target_ulong vector, target_ul=
ong msr)
> +static inline void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong =
new_nip,
> +                                          target_ulong new_msr)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> @@ -294,9 +294,9 @@ static inline void powerpc_set_excp_state(PowerPCCPU =
*cpu,
>       * will prevent setting of the HV bit which some exceptions might ne=
ed
>       * to do.
>       */
> -    env->msr =3D msr & env->msr_mask;
> +    env->msr =3D new_msr & env->msr_mask;
>      hreg_compute_hflags(env);
> -    env->nip =3D vector;
> +    env->nip =3D new_nip;
>      /* Reset exception state */
>      cs->exception_index =3D POWERPC_EXCP_NONE;
>      env->error_code =3D 0;
> @@ -311,6 +311,17 @@ static inline void powerpc_set_excp_state(PowerPCCPU=
 *cpu,
>      check_tlb_flush(env, false);
>  }
> =20
> +struct ppc_intr_args {

Please use qemu coding style convetions for type names (CamelCase and
a typedef).

> +    target_ulong nip;
> +    target_ulong msr;
> +    target_ulong new_nip;
> +    target_ulong new_msr;
> +    int sprn_srr0;
> +    int sprn_srr1;
> +    int sprn_asrr0;
> +    int sprn_asrr1;
> +};
> +
>  /*
>   * Note that this function should be greatly optimized when called
>   * with a constant excp, from ppc_hw_interrupt
> @@ -319,37 +330,40 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> -    target_ulong msr, new_msr, vector;
> -    int srr0, srr1, asrr0, asrr1, lev =3D -1;
> +    struct ppc_intr_args regs;
> +    int lev =3D -1;
> =20
>      qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
>                    " =3D> %08x (%02x)\n", env->nip, excp, env->error_code=
);
> =20
>      /* new srr1 value excluding must-be-zero bits */
>      if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
> -        msr =3D env->msr;
> +        regs.msr =3D env->msr;
>      } else {
> -        msr =3D env->msr & ~0x783f0000ULL;
> +        regs.msr =3D env->msr & ~0x783f0000ULL;
>      }
> +    regs.nip =3D env->nip;
> =20
>      /*
>       * new interrupt handler msr preserves existing HV and ME unless
>       * explicitly overriden
> +     *
> +     * XXX: should this use the filtered MSR (regs.msr) from above
> +     * instead of the unfiltered env->msr?
>       */
> -    new_msr =3D env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
> +    regs.new_msr =3D env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
> =20
> -    /* target registers */
> -    srr0 =3D SPR_SRR0;
> -    srr1 =3D SPR_SRR1;
> -    asrr0 =3D -1;
> -    asrr1 =3D -1;
> +    regs.sprn_srr0 =3D SPR_SRR0;
> +    regs.sprn_srr1 =3D SPR_SRR1;
> +    regs.sprn_asrr0 =3D -1;
> +    regs.sprn_asrr1 =3D -1;
> =20
>      /*
>       * check for special resume at 0x100 from doze/nap/sleep/winkle on
>       * P7/P8/P9
>       */
>      if (env->resume_as_sreset) {
> -        excp =3D powerpc_reset_wakeup(cs, env, excp, &msr);
> +        excp =3D powerpc_reset_wakeup(cs, env, excp, &regs.msr);
>      }
> =20
>      /*
> @@ -373,12 +387,12 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>      case POWERPC_EXCP_CRITICAL:    /* Critical input                    =
     */
>          switch (excp_model) {
>          case POWERPC_EXCP_40x:
> -            srr0 =3D SPR_40x_SRR2;
> -            srr1 =3D SPR_40x_SRR3;
> +            regs.sprn_srr0 =3D SPR_40x_SRR2;
> +            regs.sprn_srr1 =3D SPR_40x_SRR3;
>              break;
>          case POWERPC_EXCP_BOOKE:
> -            srr0 =3D SPR_BOOKE_CSRR0;
> -            srr1 =3D SPR_BOOKE_CSRR1;
> +            regs.sprn_srr0 =3D SPR_BOOKE_CSRR0;
> +            regs.sprn_srr1 =3D SPR_BOOKE_CSRR1;
>              break;
>          case POWERPC_EXCP_G2:
>              break;
> @@ -406,24 +420,24 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>               * ISA specifies HV, but can be delivered to guest with HV
>               * clear (e.g., see FWNMI in PAPR).
>               */
> -            new_msr |=3D (target_ulong)MSR_HVB;
> +            regs.new_msr |=3D (target_ulong)MSR_HVB;
>          }
> =20
>          /* machine check exceptions don't have ME set */
> -        new_msr &=3D ~((target_ulong)1 << MSR_ME);
> +        regs.new_msr &=3D ~((target_ulong)1 << MSR_ME);
> =20
>          /* XXX: should also have something loaded in DAR / DSISR */
>          switch (excp_model) {
>          case POWERPC_EXCP_40x:
> -            srr0 =3D SPR_40x_SRR2;
> -            srr1 =3D SPR_40x_SRR3;
> +            regs.sprn_srr0 =3D SPR_40x_SRR2;
> +            regs.sprn_srr1 =3D SPR_40x_SRR3;
>              break;
>          case POWERPC_EXCP_BOOKE:
>              /* FIXME: choose one or the other based on CPU type */
> -            srr0 =3D SPR_BOOKE_MCSRR0;
> -            srr1 =3D SPR_BOOKE_MCSRR1;
> -            asrr0 =3D SPR_BOOKE_CSRR0;
> -            asrr1 =3D SPR_BOOKE_CSRR1;
> +            regs.sprn_srr0 =3D SPR_BOOKE_MCSRR0;
> +            regs.sprn_srr1 =3D SPR_BOOKE_MCSRR1;
> +            regs.sprn_asrr0 =3D SPR_BOOKE_CSRR0;
> +            regs.sprn_asrr1 =3D SPR_BOOKE_CSRR1;
>              break;
>          default:
>              break;
> @@ -435,8 +449,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>          break;
>      case POWERPC_EXCP_ISI:       /* Instruction storage exception       =
     */
>          LOG_EXCP("ISI exception: msr=3D" TARGET_FMT_lx ", nip=3D" TARGET=
_FMT_lx
> -                 "\n", msr, env->nip);
> -        msr |=3D env->error_code;
> +                 "\n", regs.msr, regs.nip);
> +        regs.msr |=3D env->error_code;
>          break;
>      case POWERPC_EXCP_EXTERNAL:  /* External input                      =
     */
>      {
> @@ -466,10 +480,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>          }
> =20
>          if (!lpes0) {
> -            new_msr |=3D (target_ulong)MSR_HVB;
> -            new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> -            srr0 =3D SPR_HSRR0;
> -            srr1 =3D SPR_HSRR1;
> +            regs.new_msr |=3D (target_ulong)MSR_HVB;
> +            regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> +            regs.sprn_srr0 =3D SPR_HSRR0;
> +            regs.sprn_srr1 =3D SPR_HSRR1;
>          }
>          if (env->mpic_proxy) {
>              /* IACK the IRQ on delivery */
> @@ -501,20 +515,20 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>               * instruction, so always use store_next and claim we are
>               * precise in the MSR.
>               */
> -            msr |=3D 0x00100000;
> +            regs.msr |=3D 0x00100000;
>              env->spr[SPR_BOOKE_ESR] =3D ESR_FP;
>              break;
>          case POWERPC_EXCP_INVAL:
> -            LOG_EXCP("Invalid instruction at " TARGET_FMT_lx "\n", env->=
nip);
> -            msr |=3D 0x00080000;
> +            LOG_EXCP("Invalid instruction at " TARGET_FMT_lx "\n", regs.=
nip);
> +            regs.msr |=3D 0x00080000;
>              env->spr[SPR_BOOKE_ESR] =3D ESR_PIL;
>              break;
>          case POWERPC_EXCP_PRIV:
> -            msr |=3D 0x00040000;
> +            regs.msr |=3D 0x00040000;
>              env->spr[SPR_BOOKE_ESR] =3D ESR_PPR;
>              break;
>          case POWERPC_EXCP_TRAP:
> -            msr |=3D 0x00020000;
> +            regs.msr |=3D 0x00020000;
>              env->spr[SPR_BOOKE_ESR] =3D ESR_PTR;
>              break;
>          default:
> @@ -535,9 +549,12 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
> =20
>          /*
>           * We need to correct the NIP which in this case is supposed
> -         * to point to the next instruction
> +         * to point to the next instruction. We also set env->nip here
> +         * because the modification needs to be accessible by the
> +         * virtual hypervisor code below.
>           */
> -        env->nip +=3D 4;
> +        regs.nip +=3D 4;
> +        env->nip =3D regs.nip;
> =20
>          /* "PAPR mode" built-in hypercall emulation */
>          if ((lev =3D=3D 1) && cpu->vhyp) {
> @@ -546,16 +563,17 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>              vhc->hypercall(cpu->vhyp, cpu);
>              return;
>          }
> +
>          if (lev =3D=3D 1) {
> -            new_msr |=3D (target_ulong)MSR_HVB;
> +            regs.new_msr |=3D (target_ulong)MSR_HVB;
>          }
>          break;
>      case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                =
     */
>          lev =3D env->error_code;
>          dump_syscall(env);
> -        env->nip +=3D 4;
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_EE);
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> +        regs.nip +=3D 4;
> +        regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_EE);
> +        regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
>          break;
>      case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception=
     */
>      case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable     =
     */
> @@ -569,8 +587,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>          LOG_EXCP("WDT exception\n");
>          switch (excp_model) {
>          case POWERPC_EXCP_BOOKE:
> -            srr0 =3D SPR_BOOKE_CSRR0;
> -            srr1 =3D SPR_BOOKE_CSRR1;
> +            regs.sprn_srr0 =3D SPR_BOOKE_CSRR0;
> +            regs.sprn_srr1 =3D SPR_BOOKE_CSRR1;
>              break;
>          default:
>              break;
> @@ -582,10 +600,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>      case POWERPC_EXCP_DEBUG:     /* Debug interrupt                     =
     */
>          if (env->flags & POWERPC_FLAG_DE) {
>              /* FIXME: choose one or the other based on CPU type */
> -            srr0 =3D SPR_BOOKE_DSRR0;
> -            srr1 =3D SPR_BOOKE_DSRR1;
> -            asrr0 =3D SPR_BOOKE_CSRR0;
> -            asrr1 =3D SPR_BOOKE_CSRR1;
> +            regs.sprn_srr0 =3D SPR_BOOKE_DSRR0;
> +            regs.sprn_srr1 =3D SPR_BOOKE_DSRR1;
> +            regs.sprn_asrr0 =3D SPR_BOOKE_CSRR0;
> +            regs.sprn_asrr1 =3D SPR_BOOKE_CSRR1;
>              /* DBSR already modified by caller */
>          } else {
>              cpu_abort(cs, "Debug exception triggered on unsupported mode=
l\n");
> @@ -614,22 +632,22 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>      case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt         =
     */
>          break;
>      case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt=
     */
> -        srr0 =3D SPR_BOOKE_CSRR0;
> -        srr1 =3D SPR_BOOKE_CSRR1;
> +        regs.sprn_srr0 =3D SPR_BOOKE_CSRR0;
> +        regs.sprn_srr1 =3D SPR_BOOKE_CSRR1;
>          break;
>      case POWERPC_EXCP_RESET:     /* System reset exception              =
     */
>          /* A power-saving exception sets ME, otherwise it is unchanged */
>          if (msr_pow) {
>              /* indicate that we resumed from power save mode */
> -            msr |=3D 0x10000;
> -            new_msr |=3D ((target_ulong)1 << MSR_ME);
> +            regs.msr |=3D 0x10000;
> +            regs.new_msr |=3D ((target_ulong)1 << MSR_ME);
>          }
>          if (env->msr_mask & MSR_HVB) {
>              /*
>               * ISA specifies HV, but can be delivered to guest with HV
>               * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
>               */
> -            new_msr |=3D (target_ulong)MSR_HVB;
> +            regs.new_msr |=3D (target_ulong)MSR_HVB;
>          } else {
>              if (msr_pow) {
>                  cpu_abort(cs, "Trying to deliver power-saving system res=
et "
> @@ -642,7 +660,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>      case POWERPC_EXCP_TRACE:     /* Trace exception                     =
     */
>          break;
>      case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage excep=
tion */
> -        msr |=3D env->error_code;
> +        regs.msr |=3D env->error_code;
>          /* fall through */
>      case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception    =
     */
>      case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception   =
     */
> @@ -651,10 +669,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>      case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt       =
     */
>      case POWERPC_EXCP_HV_EMU:
>      case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization           =
     */
> -        srr0 =3D SPR_HSRR0;
> -        srr1 =3D SPR_HSRR1;
> -        new_msr |=3D (target_ulong)MSR_HVB;
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> +        regs.sprn_srr0 =3D SPR_HSRR0;
> +        regs.sprn_srr1 =3D SPR_HSRR1;
> +        regs.new_msr |=3D (target_ulong)MSR_HVB;
> +        regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
>          break;
>      case POWERPC_EXCP_VPU:       /* Vector unavailable exception        =
     */
>      case POWERPC_EXCP_VSXU:       /* VSX unavailable exception          =
     */
> @@ -666,10 +684,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>      case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exce=
ption */
>  #ifdef TARGET_PPC64
>          env->spr[SPR_HFSCR] |=3D ((target_ulong)env->error_code << FSCR_=
IC_POS);
> -        srr0 =3D SPR_HSRR0;
> -        srr1 =3D SPR_HSRR1;
> -        new_msr |=3D (target_ulong)MSR_HVB;
> -        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> +        regs.sprn_srr0 =3D SPR_HSRR0;
> +        regs.sprn_srr1 =3D SPR_HSRR1;
> +        regs.new_msr |=3D (target_ulong)MSR_HVB;
> +        regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
>  #endif
>          break;
>      case POWERPC_EXCP_PIT:       /* Programmable interval timer interrup=
t    */
> @@ -697,8 +715,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>          case POWERPC_EXCP_603E:
>          case POWERPC_EXCP_G2:
>              /* Swap temporary saved registers with GPRs */
> -            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
> -                new_msr |=3D (target_ulong)1 << MSR_TGPR;
> +            if (!(regs.new_msr & ((target_ulong)1 << MSR_TGPR))) {
> +                regs.new_msr |=3D (target_ulong)1 << MSR_TGPR;
>                  hreg_swap_gpr_tgpr(env);
>              }
>              /* fall through */
> @@ -731,10 +749,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>                           env->error_code);
>              }
>  #endif
> -            msr |=3D env->crf[0] << 28;
> -            msr |=3D env->error_code; /* key, D/I, S/L bits */
> +            regs.msr |=3D env->crf[0] << 28;
> +            regs.msr |=3D env->error_code; /* key, D/I, S/L bits */
>              /* Set way using a LRU mechanism */
> -            msr |=3D ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
> +            regs.msr |=3D ((env->last_way + 1) & (env->nb_ways - 1)) << =
17;
>              break;
>          case POWERPC_EXCP_74xx:
>  #if defined(DEBUG_SOFTWARE_TLB)
> @@ -763,7 +781,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>                           env->error_code);
>              }
>  #endif
> -            msr |=3D env->error_code; /* key bit */
> +            regs.msr |=3D env->error_code; /* key bit */
>              break;
>          default:
>              cpu_abort(cs, "Invalid TLB miss exception\n");
> @@ -829,11 +847,11 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
> =20
>      /* Sanity check */
>      if (!(env->msr_mask & MSR_HVB)) {
> -        if (new_msr & MSR_HVB) {
> +        if (regs.new_msr & MSR_HVB) {
>              cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
>                        "no HV support\n", excp);
>          }
> -        if (srr0 =3D=3D SPR_HSRR0) {
> +        if (regs.sprn_srr0 =3D=3D SPR_HSRR0) {
>              cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with=
 "
>                        "no HV support\n", excp);
>          }
> @@ -845,88 +863,89 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>       */
>  #ifdef TARGET_PPC64
>      if (excp_model =3D=3D POWERPC_EXCP_POWER7) {
> -        if (!(new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)) {
> -            new_msr |=3D (target_ulong)1 << MSR_LE;
> +        if (!(regs.new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)=
) {
> +            regs.new_msr |=3D (target_ulong)1 << MSR_LE;
>          }
>      } else if (excp_model =3D=3D POWERPC_EXCP_POWER8) {
> -        if (new_msr & MSR_HVB) {
> +        if (regs.new_msr & MSR_HVB) {
>              if (env->spr[SPR_HID0] & HID0_HILE) {
> -                new_msr |=3D (target_ulong)1 << MSR_LE;
> +                regs.new_msr |=3D (target_ulong)1 << MSR_LE;
>              }
>          } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
> -            new_msr |=3D (target_ulong)1 << MSR_LE;
> +            regs.new_msr |=3D (target_ulong)1 << MSR_LE;
>          }
>      } else if (excp_model =3D=3D POWERPC_EXCP_POWER9 ||
>                 excp_model =3D=3D POWERPC_EXCP_POWER10) {
> -        if (new_msr & MSR_HVB) {
> +        if (regs.new_msr & MSR_HVB) {
>              if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
> -                new_msr |=3D (target_ulong)1 << MSR_LE;
> +                regs.new_msr |=3D (target_ulong)1 << MSR_LE;
>              }
>          } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
> -            new_msr |=3D (target_ulong)1 << MSR_LE;
> +            regs.new_msr |=3D (target_ulong)1 << MSR_LE;
>          }
>      } else if (msr_ile) {
> -        new_msr |=3D (target_ulong)1 << MSR_LE;
> +        regs.new_msr |=3D (target_ulong)1 << MSR_LE;
>      }
>  #else
>      if (msr_ile) {
> -        new_msr |=3D (target_ulong)1 << MSR_LE;
> +        regs.new_msr |=3D (target_ulong)1 << MSR_LE;
>      }
>  #endif
> =20
> -    vector =3D env->excp_vectors[excp];
> -    if (vector =3D=3D (target_ulong)-1ULL) {
> +    regs.new_nip =3D env->excp_vectors[excp];
> +    if (regs.new_nip =3D=3D (target_ulong)-1ULL) {
>          cpu_abort(cs, "Raised an exception without defined vector %d\n",
>                    excp);
>      }
> =20
> -    vector |=3D env->excp_prefix;
> +    regs.new_nip |=3D env->excp_prefix;
> =20
>      /* If any alternate SRR register are defined, duplicate saved values=
 */
> -    if (asrr0 !=3D -1) {
> -        env->spr[asrr0] =3D env->nip;
> +    if (regs.sprn_asrr0 !=3D -1) {
> +        env->spr[regs.sprn_asrr0] =3D regs.nip;
>      }
> -    if (asrr1 !=3D -1) {
> -        env->spr[asrr1] =3D msr;
> +    if (regs.sprn_asrr1 !=3D -1) {
> +        env->spr[regs.sprn_asrr1] =3D regs.msr;
>      }
> =20
>  #if defined(TARGET_PPC64)
>      if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
>          if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
>              /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
> -            new_msr |=3D (target_ulong)1 << MSR_CM;
> +            regs.new_msr |=3D (target_ulong)1 << MSR_CM;
>          } else {
> -            vector =3D (uint32_t)vector;
> +            regs.new_nip =3D (uint32_t)regs.new_nip;
>          }
>      } else {
>          if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
> -            vector =3D (uint32_t)vector;
> +            regs.new_nip =3D (uint32_t)regs.new_nip;
>          } else {
> -            new_msr |=3D (target_ulong)1 << MSR_SF;
> +            regs.new_msr |=3D (target_ulong)1 << MSR_SF;
>          }
>      }
>  #endif
> =20
>      if (excp !=3D POWERPC_EXCP_SYSCALL_VECTORED) {
>          /* Save PC */
> -        env->spr[srr0] =3D env->nip;
> +        env->spr[regs.sprn_srr0] =3D regs.nip;
> =20
>          /* Save MSR */
> -        env->spr[srr1] =3D msr;
> +        env->spr[regs.sprn_srr1] =3D regs.msr;
> =20
>  #if defined(TARGET_PPC64)
>      } else {
> -        vector +=3D lev * 0x20;
> +        regs.new_nip +=3D lev * 0x20;
> =20
> -        env->lr =3D env->nip;
> -        env->ctr =3D msr;
> +        env->lr =3D regs.nip;
> +        env->ctr =3D regs.msr;
>  #endif
>      }
> =20
> -    /* This can update new_msr and vector if AIL applies */
> -    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
> +    /* This can update regs.new_msr and regs.new_nip if AIL applies */
> +    ppc_excp_apply_ail(cpu, excp_model, excp, regs.msr, &regs.new_msr,
> +                       &regs.new_nip);
> =20
> -    powerpc_set_excp_state(cpu, vector, new_msr);
> +    powerpc_set_excp_state(cpu, regs.new_nip, regs.new_msr);
>  }
> =20
>  void ppc_cpu_do_interrupt(CPUState *cs)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--teNldQb2Ovytc7eP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9mLMACgkQbDjKyiDZ
s5KAQxAAg7nRXGhHeZFhxEc+9HyFgSIQz/Gg9VmVQQQ4q3SEIKZUBRMjtPI563Ma
kPBkq/FCnUIyorufN2c6wJBPJa8pNwPugVBdRnEIRSoQvpC5qaK0cvopiHEjj4H/
Rr3bERXiKn2fV9YC83uiHwSHOJAwA1mDAA+g3ciQO2KYJ+vEb4dtdG71oyAfpFVl
XdSYbl4/9ZT77Qa6KQGpb3YtCqWOAtqMuT5gIU4mS8B4QLolWwAb6T6odC/c48Bz
TTbd6tAE+PEFGwkdQlncAAJoyfaNP1PZTKY54qk6T4MDWEQRBQpHXjdO5EnSxptO
kYCMxjMgqXK7welqasSuF9he1+IL98N9B8McFrmKSlA9Qypm62UMahHdX3xjYJOq
PDKT0urQ1HTyLJBFALP+oZaMEaqBHnLEsUW/1F/QXLUO7SRax1Arl8xIxH5Qls6g
pduRagCa/CNkCC42kHkBtJn2jwBFT2+orntzx3H2fMOOnrOyFAlcXw+gvsBnAO+N
YnyuONawbDN2Kvt4bgDTEYE4BTWy4Nqee6FSPsaXxmKYKzRCo0o4NnMuOiquZP7V
reMNLiYOkdQAzzpZoR+Mah87NZUCjPNO2NfjyJ6fWPte22sKMuk5eJIFAcsxrchn
p3upw5oaY4uxjBr5+kNbLJKjO1chBKCLto5/NV4az+Pa7OEuSOU=
=Xk3I
-----END PGP SIGNATURE-----

--teNldQb2Ovytc7eP--


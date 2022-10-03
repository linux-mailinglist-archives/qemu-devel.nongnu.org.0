Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597B25F31DB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 16:19:31 +0200 (CEST)
Received: from localhost ([::1]:58754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofMI6-0005wc-Bj
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 10:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ofMAz-0000Dq-DW; Mon, 03 Oct 2022 10:12:09 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ofMAw-0006JR-6u; Mon, 03 Oct 2022 10:12:09 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 293Du3K4016364;
 Mon, 3 Oct 2022 14:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=KgI7/MLj1lreDBj1lRd9oly87MmeSqEeYdCKC/imqaY=;
 b=EMjHS8dtWyfX/FNXy1XzU1pucQsqybDf0kUf4arhppEbvLEspXzAZvdaSUFytORevvO7
 NT4PYX/E+XMpslVnrZo0T8hZAPWjMxVkwTKL5eqmZXG9kYW32wRnUQz5AOoiJ1M69TSy
 +LNCAURxDKkArtOKV2KocdkbRzRZnSVyRYhpTR70T6eYCEymV2fv2KfWwirBSEY1EBKw
 JjCLvK8XjnOjzNY+3SrQwdGHo1G53JpavQZqKroEQ3XOPcONOPIfS6troeH9FEGS+OUw
 0ZheHQsYUk0mfswcGyRuDiPAqvPByhjDA6eR+PIiAD5qSPn9PyWtlcnbJS3jGMljbPFV iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jyymgkca8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 14:11:45 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 293CPh5J022872;
 Mon, 3 Oct 2022 14:11:44 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jyymgkca1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 14:11:44 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 293E5SpJ001451;
 Mon, 3 Oct 2022 14:11:43 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 3jxd695kaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 14:11:43 +0000
Received: from smtpav05.dal12v.mail.ibm.com ([9.208.128.132])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 293EBfnQ29557084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Oct 2022 14:11:41 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA76A5804C;
 Mon,  3 Oct 2022 14:11:42 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2693558052;
 Mon,  3 Oct 2022 14:11:42 +0000 (GMT)
Received: from localhost (unknown [9.160.178.216])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Mon,  3 Oct 2022 14:11:41 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH v2 27/29] target/ppc: introduce ppc_maybe_interrupt
In-Reply-To: <20220927201544.4088567-28-matheus.ferst@eldorado.org.br>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <20220927201544.4088567-28-matheus.ferst@eldorado.org.br>
Date: Mon, 03 Oct 2022 11:11:40 -0300
Message-ID: <87lepx574z.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: L6kzeH1Nh-B__Rpkt1jyXWnxXTe7Kx_x
X-Proofpoint-GUID: LtffgcbHiXZecPcnfxq5NlV9JR30B0B0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-03_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 mlxlogscore=737 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210030085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> The method checks if any pending interrupt is unmasked and calls
> cpu_interrupt/cpu_reset_interrupt accordingly. Code that raises/lowers
> or masks/unmasks interrupts should call this method to keep
> CPU_INTERRUPT_HARD coherent with env->pending_interrupts.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> v2:
>   - Found many other places where ppc_maybe_interrupt had to be called
>     with the IO and kvm-nested tests that C=C3=A9dric suggested.

We might need some words describing the situations in which this
function should be used to avoid new code missing it.

>   - Create a helper to call ppc_maybe_interrupt to avoid using
>     helper_store_msr in WRTEE[I].
>
> I couldn't find a better name for this method, so I used "maybe
> interrupt" just like we have "maybe bswap" for gdbstub registers.
> ---
>  hw/ppc/pnv_core.c        |  1 +
>  hw/ppc/ppc.c             |  7 +------
>  hw/ppc/spapr_hcall.c     |  6 ++++++
>  hw/ppc/spapr_rtas.c      |  2 +-
>  target/ppc/cpu.c         |  2 ++
>  target/ppc/cpu.h         |  1 +
>  target/ppc/excp_helper.c | 29 +++++++++++++++++++++++++++++
>  target/ppc/helper.h      |  1 +
>  target/ppc/helper_regs.c |  2 ++
>  target/ppc/translate.c   |  2 ++
>  10 files changed, 46 insertions(+), 7 deletions(-)
>
> diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
> index 19e8eb885f..9ee79192dd 100644
> --- a/hw/ppc/pnv_core.c
> +++ b/hw/ppc/pnv_core.c
> @@ -58,6 +58,7 @@ static void pnv_core_cpu_reset(PnvCore *pc, PowerPCCPU =
*cpu)
>      env->msr |=3D MSR_HVB; /* Hypervisor mode */
>      env->spr[SPR_HRMOR] =3D pc->hrmor;
>      hreg_compute_hflags(env);
> +    ppc_maybe_interrupt(env);
>=20=20
>      pcc->intc_reset(pc->chip, cpu);
>  }
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 77e611e81c..dc86c1c7db 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -42,7 +42,6 @@ static void cpu_ppc_tb_start (CPUPPCState *env);
>=20=20
>  void ppc_set_irq(PowerPCCPU *cpu, int irq, int level)
>  {
> -    CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
>      unsigned int old_pending;
>      bool locked =3D false;
> @@ -57,19 +56,15 @@ void ppc_set_irq(PowerPCCPU *cpu, int irq, int level)
>=20=20
>      if (level) {
>          env->pending_interrupts |=3D irq;
> -        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>      } else {
>          env->pending_interrupts &=3D ~irq;
> -        if (env->pending_interrupts =3D=3D 0) {
> -            cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> -        }
>      }
>=20=20
>      if (old_pending !=3D env->pending_interrupts) {
> +        ppc_maybe_interrupt(env);
>          kvmppc_set_interrupt(cpu, irq, level);
>      }
>=20=20
> -
>      trace_ppc_irq_set_exit(env, irq, level, env->pending_interrupts,
>                             CPU(cpu)->interrupt_request);
>=20=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index a8d4a6bcf0..23aa41c879 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -490,6 +490,7 @@ static target_ulong h_cede(PowerPCCPU *cpu, SpaprMach=
ineState *spapr,
>=20=20
>      env->msr |=3D (1ULL << MSR_EE);
>      hreg_compute_hflags(env);
> +    ppc_maybe_interrupt(env);
>=20=20
>      if (spapr_cpu->prod) {
>          spapr_cpu->prod =3D false;
> @@ -500,6 +501,7 @@ static target_ulong h_cede(PowerPCCPU *cpu, SpaprMach=
ineState *spapr,
>          cs->halted =3D 1;
>          cs->exception_index =3D EXCP_HLT;
>          cs->exit_request =3D 1;
> +        ppc_maybe_interrupt(env);
>      }
>=20=20
>      return H_SUCCESS;
> @@ -521,6 +523,7 @@ static target_ulong h_confer_self(PowerPCCPU *cpu)
>      cs->halted =3D 1;
>      cs->exception_index =3D EXCP_HALTED;
>      cs->exit_request =3D 1;
> +    ppc_maybe_interrupt(&cpu->env);
>=20=20
>      return H_SUCCESS;
>  }
> @@ -633,6 +636,7 @@ static target_ulong h_prod(PowerPCCPU *cpu, SpaprMach=
ineState *spapr,
>      spapr_cpu =3D spapr_cpu_state(tcpu);
>      spapr_cpu->prod =3D true;
>      cs->halted =3D 0;
> +    ppc_maybe_interrupt(&cpu->env);
>      qemu_cpu_kick(cs);
>=20=20
>      return H_SUCCESS;
> @@ -1661,6 +1665,7 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>      spapr_cpu->in_nested =3D true;
>=20=20
>      hreg_compute_hflags(env);
> +    ppc_maybe_interrupt(env);
>      tlb_flush(cs);
>      env->reserve_addr =3D -1; /* Reset the reservation */
>=20=20
> @@ -1802,6 +1807,7 @@ out_restore_l1:
>      spapr_cpu->in_nested =3D false;
>=20=20
>      hreg_compute_hflags(env);
> +    ppc_maybe_interrupt(env);
>      tlb_flush(cs);
>      env->reserve_addr =3D -1; /* Reset the reservation */
>=20=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index d58b65e88f..3f664ea02c 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -214,9 +214,9 @@ static void rtas_stop_self(PowerPCCPU *cpu, SpaprMach=
ineState *spapr,
>       * guest.
>       * For the same reason, set PSSCR_EC.
>       */
> -    ppc_store_lpcr(cpu, env->spr[SPR_LPCR] & ~pcc->lpcr_pm);
>      env->spr[SPR_PSSCR] |=3D PSSCR_EC;
>      cs->halted =3D 1;
> +    ppc_store_lpcr(cpu, env->spr[SPR_LPCR] & ~pcc->lpcr_pm);
>      kvmppc_set_reg_ppc_online(cpu, 0);
>      qemu_cpu_kick(cs);
>  }
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index e95b4c5ee1..1a97b41c6b 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -82,6 +82,8 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
>      env->spr[SPR_LPCR] =3D val & pcc->lpcr_mask;
>      /* The gtse bit affects hflags */
>      hreg_compute_hflags(env);
> +
> +    ppc_maybe_interrupt(env);
>  }
>  #endif
>=20=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 7b13d4cf86..89c065521f 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1358,6 +1358,7 @@ int ppc64_cpu_write_elf64_note(WriteCoreDumpFunctio=
n f, CPUState *cs,
>  int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
>                                 int cpuid, void *opaque);
>  #ifndef CONFIG_USER_ONLY
> +void ppc_maybe_interrupt(CPUPPCState *env);
>  void ppc_cpu_do_interrupt(CPUState *cpu);
>  bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void ppc_cpu_do_system_reset(CPUState *cs);
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 497a9889d1..9708f82b30 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -390,6 +390,7 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu, t=
arget_ulong vector,
>      env->nip =3D vector;
>      env->msr =3D msr;
>      hreg_compute_hflags(env);
> +    ppc_maybe_interrupt(env);
>=20=20
>      powerpc_reset_excp_state(cpu);
>=20=20
> @@ -2039,6 +2040,27 @@ static int ppc_next_unmasked_interrupt(CPUPPCState=
 *env)
>      }
>  }
>=20=20
> +void ppc_maybe_interrupt(CPUPPCState *env)
> +{
> +    CPUState *cs =3D env_cpu(env);
> +    bool locked =3D false;
> +
> +    if (!qemu_mutex_iothread_locked()) {
> +        locked =3D true;
> +        qemu_mutex_lock_iothread();
> +    }
> +
> +    if (ppc_next_unmasked_interrupt(env)) {
> +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> +    } else {
> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> +    }
> +
> +    if (locked) {
> +        qemu_mutex_unlock_iothread();
> +    }
> +}
> +
>  #if defined(TARGET_PPC64)
>  static void p7_deliver_interrupt(CPUPPCState *env, int interrupt)
>  {
> @@ -2474,6 +2496,11 @@ void helper_store_msr(CPUPPCState *env, target_ulo=
ng val)
>      }
>  }
>=20=20
> +void helper_ppc_maybe_interrupt(CPUPPCState *env)
> +{
> +    ppc_maybe_interrupt(env);
> +}
> +
>  #if defined(TARGET_PPC64)
>  void helper_scv(CPUPPCState *env, uint32_t lev)
>  {
> @@ -2494,6 +2521,8 @@ void helper_pminsn(CPUPPCState *env, powerpc_pm_ins=
n_t insn)
>      /* Condition for waking up at 0x100 */
>      env->resume_as_sreset =3D (insn !=3D PPC_PM_STOP) ||
>          (env->spr[SPR_PSSCR] & PSSCR_EC);
> +
> +    ppc_maybe_interrupt(env);
>  }
>  #endif /* defined(TARGET_PPC64) */
>=20=20
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 57eee07256..3d09aae5fc 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -10,6 +10,7 @@ DEF_HELPER_4(HASHSTP, void, env, tl, tl, tl)
>  DEF_HELPER_4(HASHCHKP, void, env, tl, tl, tl)
>  #if !defined(CONFIG_USER_ONLY)
>  DEF_HELPER_2(store_msr, void, env, tl)
> +DEF_HELPER_1(ppc_maybe_interrupt, void, env)
>  DEF_HELPER_1(rfi, void, env)
>  DEF_HELPER_1(40x_rfci, void, env)
>  DEF_HELPER_1(rfci, void, env)
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 12235ea2e9..2e85e124ab 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -260,6 +260,8 @@ int hreg_store_msr(CPUPPCState *env, target_ulong val=
ue, int alter_hv)
>      env->msr =3D value;
>      hreg_compute_hflags(env);
>  #if !defined(CONFIG_USER_ONLY)
> +    ppc_maybe_interrupt(env);
> +
>      if (unlikely(FIELD_EX64(env->msr, MSR, POW))) {
>          if (!env->pending_interrupts && (*env->check_pow)(env)) {
>              cs->halted =3D 1;
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index e810842925..e8336452c4 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -6175,6 +6175,7 @@ static void gen_wrtee(DisasContext *ctx)
>      tcg_gen_andi_tl(t0, cpu_gpr[rD(ctx->opcode)], (1 << MSR_EE));
>      tcg_gen_andi_tl(cpu_msr, cpu_msr, ~(1 << MSR_EE));
>      tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
> +    gen_helper_ppc_maybe_interrupt(cpu_env);
>      tcg_temp_free(t0);
>      /*
>       * Stop translation to have a chance to raise an exception if we
> @@ -6193,6 +6194,7 @@ static void gen_wrteei(DisasContext *ctx)
>      CHK_SV(ctx);
>      if (ctx->opcode & 0x00008000) {
>          tcg_gen_ori_tl(cpu_msr, cpu_msr, (1 << MSR_EE));
> +        gen_helper_ppc_maybe_interrupt(cpu_env);
>          /* Stop translation to have a chance to raise an exception */
>          ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
>      } else {


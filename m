Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0834B5E42
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 00:29:17 +0100 (CET)
Received: from localhost ([::1]:43384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJkmR-0007Cl-VN
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 18:29:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJkiC-0004m6-8z; Mon, 14 Feb 2022 18:24:52 -0500
Received: from [2607:f8b0:4864:20::102c] (port=42775
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJki9-00012G-5k; Mon, 14 Feb 2022 18:24:51 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 h7-20020a17090a648700b001b927560c2bso572016pjj.1; 
 Mon, 14 Feb 2022 15:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=s7UQmVMEbT/EhlD0xxZTBG67S/8FCNKrzLjLB4gXG5Y=;
 b=LLxNXXh0KflKufX6II444gvRqgYcC/JiFF38by2VdHsrnDTk69r3LbNk/a6IQkTz0/
 RDbTof9ksgG6UxC0xWWuqrMm7dzuqjw9BfT+vZBYa8gmlJ2d4mHawt/9Xji5Vri6ja65
 GR2gc9eKMuzvn0nor8wC9IyTOkJXRk7KjOEOPcruLEPLV1KevtHYUnYWsj4EOMHuN3ij
 k60OyWPMS681MBVvGs/ZdsXBU/QR+zHunAAUJx2ZErvFdfTYN5VkiED6vgxoMwyTnn5J
 lm1herYUePoDcO707u22qPR5sv2f0jv8CLpZI2GLXzBPYGPzqHSUxhVTpX/mGoDqRMFw
 ZSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=s7UQmVMEbT/EhlD0xxZTBG67S/8FCNKrzLjLB4gXG5Y=;
 b=0o2QtP1ObNmOEqiEMC5vzlJkvPHnog9w1vQ2u0WEuPJTEtcGwpgjwo/B9Q+Juf3ZTy
 rvVMpoctvhLSuVc+AJaVURZ2IeXneHIOBHEz5qMwelvJyFkVHYxDjwOPXoiMrvc3Jy0g
 JTWbH1wzSqAyhselG4qVk2yrz8+lL6fQuQuRfnigAlhhq997NSwvylYpnip5TmHDAQVY
 U1MAFJFMLjH9wN2NWmG8dor5Bl2Q6Uoa78m0Kj2+bnwuQ0QOzI6fK1AxZYeWSWQWsKlt
 ta+4++HiCYIOsrVWTl/1ZBpRlq1R1+2k42taw1N3ASLh35TfWAE6UwYrpLDtutNVzJMw
 HMFQ==
X-Gm-Message-State: AOAM532pBOxGviYdqY+nGmEjkXoBe4DYXzJXxBS+FLoDYWMvMWS5Hwou
 Rq+RRh5vGpR1ght9JIo4IIg=
X-Google-Smtp-Source: ABdhPJxSAUjhgGG+XT3VFhSqb6t3HA72KHT4vqBq/CEZO8+3twLBi3m7LJdI59ya2TZacGnioMqY6w==
X-Received: by 2002:a17:90b:1bc9:: with SMTP id
 oa9mr1147849pjb.27.1644881087152; 
 Mon, 14 Feb 2022 15:24:47 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id j5sm16063510pjs.45.2022.02.14.15.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 15:24:46 -0800 (PST)
Date: Tue, 15 Feb 2022 09:24:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 3/3] spapr: implement nested-hv support for the TCG
 virtual hypervisor
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-ppc@nongnu.org
References: <20220210065340.1276367-1-npiggin@gmail.com>
 <20220210065340.1276367-4-npiggin@gmail.com> <87k0dxldsa.fsf@linux.ibm.com>
In-Reply-To: <87k0dxldsa.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1644879787.lfgvop3isd.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Fabiano Rosas's message of February 15, 2022 12:32 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> This implements the nested-hv hcall API for spapr under TCG.
>> It's still a bit rough around the edges, concept seems to work.
>>
>> Some HV exceptions can be raised now in the TCG spapr machine when
>> running a nested guest. The main ones are the lev=3D=3D1 syscall, the
>> hdecr, hdsi and hisi, and h_virt external interrupts. These are
>> dealt with in the interrupt delivery code by noticing MSR[HV] raised
>> and instead of switching the machine to HV mode, it exits the
>> H_ENTER_NESTED hcall with the interrupt vector as return value as
>> required by the hcall API.
>>
>> Address translation is provided by the 2-level page table walker
>> that is implemented for the pnv machine. The partition scope page
>> table is pointed to the L1's partition scope, and a few tests have
>> to take into account that nested-hv translations are 2-level. This
>> could perhaps be tidied up a bit e.g., with a 'bool two_level =3D ...'
>> but it's surprisingly little code.
>>
>> There is no TLB tagging between L1 and L2 translations at the moment
>> so the TLB is flushed on any L1<->L2 transition (hcall entry and exit).
>>
>> XXX: stop doing atomic RC on page table walks (not for nested but in gen=
eral)
>>
>> not-yet-Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> Hi Nick,
>=20
> Sorry it took me so long to get to this. It think overall it looks
> good. I have some comments about code structure that you probably
> already know about.

Great thanks for the comments.

> I don't have answers to your XXX questions but I think it's ok to handle
> them later individually as they come up, after this is merged.

I've been able to remove most of them I think. I'll repost soon.

>> ---
>>  hw/ppc/ppc.c               |  20 +++
>>  hw/ppc/spapr.c             |  16 ++
>>  hw/ppc/spapr_caps.c        |   5 +-
>>  hw/ppc/spapr_hcall.c       | 316 +++++++++++++++++++++++++++++++++++++
>>  include/hw/ppc/ppc.h       |   3 +
>>  include/hw/ppc/spapr.h     |  75 ++++++++-
>>  target/ppc/cpu.h           |   6 +
>>  target/ppc/excp_helper.c   |  60 ++++---
>>  target/ppc/helper_regs.c   |   1 +
>>  target/ppc/mmu-book3s-v3.c |  20 ++-
>>  target/ppc/mmu-radix64.c   |  15 +-
>>  11 files changed, 499 insertions(+), 38 deletions(-)
>>
>> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
>> index a7c262db93..135900a6f4 100644
>> --- a/hw/ppc/ppc.c
>> +++ b/hw/ppc/ppc.c
>> @@ -1083,6 +1083,26 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, u=
int32_t freq)
>>      return &cpu_ppc_set_tb_clk;
>>  }
>> =20
>> +void cpu_ppc_hdecr_init (CPUPPCState *env)
>> +{
>> +    PowerPCCPU *cpu =3D env_archcpu(env);
>> +
>> +    assert(env->tb_env->hdecr_timer =3D=3D NULL);
>> +
>> +    env->tb_env->hdecr_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_=
ppc_hdecr_cb,
>> +                                                 cpu);
>> +}
>> +
>> +void cpu_ppc_hdecr_exit (CPUPPCState *env)
>> +{
>> +    PowerPCCPU *cpu =3D env_archcpu(env);
>> +
>> +    timer_free(env->tb_env->hdecr_timer);
>> +    env->tb_env->hdecr_timer =3D NULL;
>> +
>> +    cpu_ppc_hdecr_lower(cpu);
>> +}
>> +
>>  /* Specific helpers for POWER & PowerPC 601 RTC */
>>  void cpu_ppc601_store_rtcu (CPUPPCState *env, uint32_t value)
>>  {
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 3d6ec309dd..f0c3f726f2 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -1273,6 +1273,8 @@ static void emulate_spapr_hypercall(PPCVirtualHype=
rvisor *vhyp,
>>      if (msr_pr) {
>>          hcall_dprintf("Hypercall made with MSR[PR]=3D1\n");
>>          env->gpr[3] =3D H_PRIVILEGE;
>> +    } else if (env->gpr[3] =3D=3D KVMPPC_H_ENTER_NESTED) {
>> +        spapr_enter_nested(cpu);
>=20
> This looks like it could be plumbed along with spapr_hypercall below.

Hmm. when "QEMU" returns from this hypercall, TCG should be running the
L2 guest with L2 registers but the L1 itself has not returned from the
hcall yet.

So when I wrote it first the idea was that we don't want to overwrite
the L2's r3 register with env->gpr[3] return value... But now you make
me think about it the hcall implementation could return the L2's r3
value here.

Interesting point. I'll try it.

>> +static target_ulong h_copy_tofrom_guest(PowerPCCPU *cpu,
>> +                               SpaprMachineState *spapr,
>> +                               target_ulong opcode,
>> +                               target_ulong *args)
>> +{
>> +    /*
>> +     * This HCALL is not required, L1 KVM will take a slow path and wal=
k the
>> +     * page tables manually to do the data copy.
>> +     */
>=20
> Kind of unrelated to the patch itself but I thought the point of this
> hcall was less about performance and more about Ln not having access to
> the KVM memslots for the Ln+2.
>=20
> KVM accesses a guest address space by using the GFN to find the memory
> slot and from there the userspace address that is part of the
> memslot. Accesses from Ln -> Ln+1 can use that mechanism because any Ln
> will have slots registered for its guests.
>=20
> For L0 -> L2, we can go via radix quadrants because the L0 is the real
> HV (that's how L0 handles this hcall after all).
>=20
> For L1 -> L3, we need the hcall since L1 cannot access quadrants 1 and 2
> and it does not have the memslot so it cannot use the QEMU address.
>=20
> Does that make sense?

AFAIKS it's not used for Ln->Ln+2, only for Ln->Ln+1. In kvmppc_ld for
example the load_from_eaddr fast path uses this (or quadrants in case of
L0), and the fallback does kvmppc_xlate.

This patch did boot a L3 up to busybox, so it seems not to be required.

>> +void spapr_enter_nested(PowerPCCPU *cpu)
>> +{
>> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
>> +    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
>> +    CPUState *cs =3D CPU(cpu);
>> +    CPUPPCState *env =3D &cpu->env;
>> +    target_ulong hv_ptr =3D env->gpr[4];
>> +    target_ulong regs_ptr =3D env->gpr[5];
>> +    target_ulong hdec, now =3D cpu_ppc_load_tbl(env);
>> +    struct kvmppc_hv_guest_state *hvstate;
>> +    struct kvmppc_hv_guest_state hv_state;
>> +    struct kvmppc_pt_regs *regs;
>> +    hwaddr len;
>> +    uint32_t cr;
>> +    int i;
>> +
>> +    if (cpu->in_spapr_nested) {
>> +        env->gpr[3] =3D H_FUNCTION;
>> +        return;
>> +    }
>> +    if (spapr->nested_ptcr =3D=3D 0) {
>> +        env->gpr[3] =3D H_NOT_AVAILABLE;
>> +        return;
>> +    }
>> +
>> +    len =3D sizeof(*hvstate);
>> +    hvstate =3D cpu_physical_memory_map(hv_ptr, &len, true);
>> +    if (!hvstate || len !=3D sizeof(*hvstate)) {
>> +        env->gpr[3] =3D H_PARAMETER;
>> +        return;
>> +    }
>> +
>> +    memcpy(&hv_state, hvstate, len);
>> +
>> +    cpu_physical_memory_unmap(hvstate, len, 0 /* read */, len /* access=
 len */);
>> +
>> +    if (hv_state.version !=3D HV_GUEST_STATE_VERSION) {
>=20
> KVM uses > here. Should we do the same? Daniel and I have been
> discussing if we need some sort of version negotiation for nested KVM
> since recently someone tried to use an L0 version 1 with an L1 version
> 2:
>=20
> https://gitlab.com/qemu-project/qemu/-/issues/860

Good question, I'm not quite sure how that would all be handled.
Actually we don't use the version 2 registers AFAIKS so we could
support both.

>=20
>> +        env->gpr[3] =3D H_PARAMETER;
>> +        return;
>> +    }
>> +
>=20
> <snip>
>=20
>> +/* 64-bit powerpc pt_regs struct used by nested HV */
>> +struct kvmppc_pt_regs {
>> +    uint64_t gpr[32];
>> +    uint64_t nip;
>> +    uint64_t msr;
>> +    uint64_t orig_gpr3;    /* Used for restarting system calls */
>> +    uint64_t ctr;
>> +    uint64_t link;
>> +    uint64_t xer;
>> +    uint64_t ccr;
>> +    uint64_t softe;        /* Soft enabled/disabled */
>> +    uint64_t trap;         /* Reason for being here */
>> +    uint64_t dar;          /* Fault registers */
>> +    uint64_t dsisr;        /* on 4xx/Book-E used for ESR */
>=20
> There's no 4xx/booke support for spapr nested.

Yeah that's just copy/paste from Linux.

>> @@ -375,9 +375,17 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu,
>>       * will prevent setting of the HV bit which some exceptions might n=
eed
>>       * to do.
>>       */
>> -    env->msr =3D msr & env->msr_mask;
>> -    hreg_compute_hflags(env);
>> -    env->nip =3D vector;
>> +    if (cpu->vhyp && cpu->in_spapr_nested && (msr & MSR_HVB)) {
>> +        PPCVirtualHypervisorClass *vhc =3D
>> +            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
>> +        // Deliver interrupt to L1 by returning from the H_ENTER_NESTED=
 call
>> +        vhc->exit_nested(cpu, excp);
>> +    } else {
>> +        env->nip =3D vector;
>> +        env->msr =3D msr & env->msr_mask;
>> +        hreg_compute_hflags(env);
>> +    }
>> +
>=20
> All of this should fit better at the end of powerpc_excp_books. Even if
> we need to duplicate it for fwnmi_machine_check.

Okay I'll try that.

>>      /* Reset exception state */
>>      cs->exception_index =3D POWERPC_EXCP_NONE;
>>      env->error_code =3D 0;
>> @@ -548,7 +556,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int ex=
cp)
>>      /* Save MSR */
>>      env->spr[srr1] =3D msr;
>> =20
>> -    powerpc_set_excp_state(cpu, vector, new_msr);
>> +    powerpc_set_excp_state(cpu, excp, vector, new_msr);
>>  }
>> =20
>>  static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
>> @@ -742,7 +750,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int e=
xcp)
>>      /* Save MSR */
>>      env->spr[SPR_SRR1] =3D msr;
>> =20
>> -    powerpc_set_excp_state(cpu, vector, new_msr);
>> +    powerpc_set_excp_state(cpu, excp, vector, new_msr);
>>  }
>> =20
>>  #ifdef TARGET_PPC64
>> @@ -916,7 +924,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int =
excp)
>>          env->nip +=3D 4;
>> =20
>>          /* "PAPR mode" built-in hypercall emulation */
>> -        if ((lev =3D=3D 1) && cpu->vhyp) {
>> +        if ((lev =3D=3D 1) && cpu->vhyp && !cpu->in_spapr_nested) {
>>              PPCVirtualHypervisorClass *vhc =3D
>>                  PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
>>              vhc->hypercall(cpu->vhyp, cpu);
>> @@ -1004,18 +1012,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, i=
nt excp)
>>          break;
>>      }
>> =20
>> -    /* Sanity check */
>> -    if (!(env->msr_mask & MSR_HVB)) {
>> -        if (new_msr & MSR_HVB) {
>> -            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with=
 "
>> -                      "no HV support\n", excp);
>> -        }
>> -        if (srr0 =3D=3D SPR_HSRR0) {
>> -            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d wit=
h "
>> -                      "no HV support\n", excp);
>> -        }
>> -    }
>> -
>>      /*
>>       * Sort out endianness of interrupt, this differs depending on the
>>       * CPU, the HV mode, etc...
>> @@ -1037,7 +1033,19 @@ static void powerpc_excp_books(PowerPCCPU *cpu, i=
nt excp)
>>      /* This can update new_msr and vector if AIL applies */
>>      ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
>> =20
>> -    powerpc_set_excp_state(cpu, vector, new_msr);
>> +    powerpc_set_excp_state(cpu, excp, vector, new_msr);
>> +
>> +    /* Sanity check */
>> +    if (!(env->msr_mask & MSR_HVB)) {
>> +        if (env->msr & MSR_HVB) {
>> +            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with=
 "
>> +                      "no HV support\n", excp);
>> +        }
>=20
> FYI, this doesn't exist anymore.
>=20
>> +        if (0 && srr0 =3D=3D SPR_HSRR0) {
>> +            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d wit=
h "
>> +                      "no HV support\n", excp);
>> +        }
>=20
> msr_mask should have MSR_HVB independently of MSR_HV being actually set,
> so this shouldn't be causing any problems. Is it?

Hmm, I'll have to re-check that. It did crash but that might have been a
slightly different version of the test.

>> @@ -1613,7 +1621,11 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>>          /* HEIC blocks delivery to the hypervisor */
>>          if ((async_deliver && !(heic && msr_hv && !msr_pr)) ||
>>              (env->has_hv_mode && msr_hv =3D=3D 0 && !lpes0)) {
>> -            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
>> +            if (cpu->in_spapr_nested) {
>> +                powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
>> +            } else {
>> +                powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
>> +            }
>=20
> This function affects other CPUs, so it's better to leave this as it
> were and change the exception inside powerpc_excp_books, like we do for
> HV_EMUL.

Good point.

>>              return;
>>          }
>>      }
>> @@ -1723,7 +1735,7 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, =
target_ulong vector)
>>          msr |=3D (1ULL << MSR_LE);
>>      }
>> =20
>> -    powerpc_set_excp_state(cpu, vector, msr);
>> +    powerpc_set_excp_state(cpu, POWERPC_EXCP_MCHECK, vector, msr);
>>  }
>> =20
>>  bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
>> index 5b12cb03c9..7f92606522 100644
>> --- a/target/ppc/helper_regs.c
>> +++ b/target/ppc/helper_regs.c
>> @@ -163,6 +163,7 @@ static uint32_t hreg_compute_hflags_value(CPUPPCStat=
e *env)
>>          immu_idx |=3D msr & (1 << MSR_IS) ? 2 : 0;
>>          dmmu_idx |=3D msr & (1 << MSR_DS) ? 2 : 0;
>>      } else {
>> +        /* Could have nested IDX instead of HV to avoid tlb flush on ne=
sted enter/exit? */
>=20
> Sounds like a good idea. However I don't know enough about softmmu stuff
> to point a direction here.

Yep, the trivial attempt (just add in_spapr_nested as a new bit in the=20
mmu idx) failed :P Performance is not horrible as is though so it's not
necessary for the first version.

Thanks,
Nick


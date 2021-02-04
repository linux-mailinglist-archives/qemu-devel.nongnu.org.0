Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A0B30F511
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:34:54 +0100 (CET)
Received: from localhost ([::1]:34962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fif-0007H2-KT
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1l7fgx-0005cs-7T
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:33:07 -0500
Received: from foss.arm.com ([217.140.110.172]:51996)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1l7fgs-0005y5-Pi
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:33:06 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3B24D6E;
 Thu,  4 Feb 2021 06:32:58 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A7C83F694;
 Thu,  4 Feb 2021 06:32:56 -0800 (PST)
From: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v7 1/3] arm64: kvm: Save/restore MTE registers
To: Marc Zyngier <maz@kernel.org>
References: <20210115152811.8398-1-steven.price@arm.com>
 <20210115152811.8398-2-steven.price@arm.com>
 <a99f09a56cf33bfa18b55c251380ef22@kernel.org>
Message-ID: <e294d3d3-20d6-717d-4274-c190f9cc5887@arm.com>
Date: Thu, 4 Feb 2021 14:33:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a99f09a56cf33bfa18b55c251380ef22@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.182,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, qemu-devel@nongnu.org,
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/02/2021 15:36, Marc Zyngier wrote:
> On 2021-01-15 15:28, Steven Price wrote:
>> Define the new system registers that MTE introduces and context switch
>> them. The MTE feature is still hidden from the ID register as it isn't
>> supported in a VM yet.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>  arch/arm64/include/asm/kvm_host.h          |  4 ++
>>  arch/arm64/include/asm/kvm_mte.h           | 74 ++++++++++++++++++++++
>>  arch/arm64/include/asm/sysreg.h            |  3 +-
>>  arch/arm64/kernel/asm-offsets.c            |  3 +
>>  arch/arm64/kvm/hyp/entry.S                 |  7 ++
>>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h |  4 ++
>>  arch/arm64/kvm/sys_regs.c                  | 14 ++--
>>  7 files changed, 104 insertions(+), 5 deletions(-)
>>  create mode 100644 arch/arm64/include/asm/kvm_mte.h
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h
>> b/arch/arm64/include/asm/kvm_host.h
>> index 11beda85ee7e..51590a397e4b 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -148,6 +148,8 @@ enum vcpu_sysreg {
>>      SCTLR_EL1,    /* System Control Register */
>>      ACTLR_EL1,    /* Auxiliary Control Register */
>>      CPACR_EL1,    /* Coprocessor Access Control */
>> +    RGSR_EL1,    /* Random Allocation Tag Seed Register */
>> +    GCR_EL1,    /* Tag Control Register */
>>      ZCR_EL1,    /* SVE Control */
>>      TTBR0_EL1,    /* Translation Table Base Register 0 */
>>      TTBR1_EL1,    /* Translation Table Base Register 1 */
>> @@ -164,6 +166,8 @@ enum vcpu_sysreg {
>>      TPIDR_EL1,    /* Thread ID, Privileged */
>>      AMAIR_EL1,    /* Aux Memory Attribute Indirection Register */
>>      CNTKCTL_EL1,    /* Timer Control Register (EL1) */
>> +    TFSRE0_EL1,    /* Tag Fault Status Register (EL0) */
>> +    TFSR_EL1,    /* Tag Fault Stauts Register (EL1) */
> 
> s/Stauts/Status/
> 
> Is there any reason why the MTE registers aren't grouped together?

I has been under the impression this list is sorted by the encoding of 
the system registers, although double checking I've screwed up the order 
of TFSRE0_EL1/TFSR_EL1, and not all the other fields are sorted that way.

I'll move them together in their own section.

>>      PAR_EL1,    /* Physical Address Register */
>>      MDSCR_EL1,    /* Monitor Debug System Control Register */
>>      MDCCINT_EL1,    /* Monitor Debug Comms Channel Interrupt Enable 
>> Reg */
>> diff --git a/arch/arm64/include/asm/kvm_mte.h 
>> b/arch/arm64/include/asm/kvm_mte.h
>> new file mode 100644
>> index 000000000000..62bbfae77f33
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/kvm_mte.h
>> @@ -0,0 +1,74 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2020 ARM Ltd.
>> + */
>> +#ifndef __ASM_KVM_MTE_H
>> +#define __ASM_KVM_MTE_H
>> +
>> +#ifdef __ASSEMBLY__
>> +
>> +#include <asm/sysreg.h>
>> +
>> +#ifdef CONFIG_ARM64_MTE
>> +
>> +.macro mte_switch_to_guest g_ctxt, h_ctxt, reg1
>> +alternative_if_not ARM64_MTE
>> +    b    .L__skip_switch\@
>> +alternative_else_nop_endif
>> +    mrs    \reg1, hcr_el2
>> +    and    \reg1, \reg1, #(HCR_ATA)
>> +    cbz    \reg1, .L__skip_switch\@
>> +
>> +    mrs_s    \reg1, SYS_RGSR_EL1
>> +    str    \reg1, [\h_ctxt, #CPU_RGSR_EL1]
>> +    mrs_s    \reg1, SYS_GCR_EL1
>> +    str    \reg1, [\h_ctxt, #CPU_GCR_EL1]
>> +    mrs_s    \reg1, SYS_TFSRE0_EL1
>> +    str    \reg1, [\h_ctxt, #CPU_TFSRE0_EL1]
>> +
>> +    ldr    \reg1, [\g_ctxt, #CPU_RGSR_EL1]
>> +    msr_s    SYS_RGSR_EL1, \reg1
>> +    ldr    \reg1, [\g_ctxt, #CPU_GCR_EL1]
>> +    msr_s    SYS_GCR_EL1, \reg1
>> +    ldr    \reg1, [\g_ctxt, #CPU_TFSRE0_EL1]
>> +    msr_s    SYS_TFSRE0_EL1, \reg1
>> +
>> +.L__skip_switch\@:
>> +.endm
>> +
>> +.macro mte_switch_to_hyp g_ctxt, h_ctxt, reg1
>> +alternative_if_not ARM64_MTE
>> +    b    .L__skip_switch\@
>> +alternative_else_nop_endif
>> +    mrs    \reg1, hcr_el2
>> +    and    \reg1, \reg1, #(HCR_ATA)
>> +    cbz    \reg1, .L__skip_switch\@
>> +
>> +    mrs_s    \reg1, SYS_RGSR_EL1
>> +    str    \reg1, [\g_ctxt, #CPU_RGSR_EL1]
>> +    mrs_s    \reg1, SYS_GCR_EL1
>> +    str    \reg1, [\g_ctxt, #CPU_GCR_EL1]
>> +    mrs_s    \reg1, SYS_TFSRE0_EL1
>> +    str    \reg1, [\g_ctxt, #CPU_TFSRE0_EL1]
> 
> Can't the EL0 state save/restore be moved to the C code?

True, that should be safe. I'm not sure how I missed that.

>> +
>> +    ldr    \reg1, [\h_ctxt, #CPU_RGSR_EL1]
>> +    msr_s    SYS_RGSR_EL1, \reg1
>> +    ldr    \reg1, [\h_ctxt, #CPU_GCR_EL1]
>> +    msr_s    SYS_GCR_EL1, \reg1
>> +    ldr    \reg1, [\h_ctxt, #CPU_TFSRE0_EL1]
>> +    msr_s    SYS_TFSRE0_EL1, \reg1
>> +
>> +.L__skip_switch\@:
>> +.endm
>> +
>> +#else /* CONFIG_ARM64_MTE */
>> +
>> +.macro mte_switch_to_guest g_ctxt, h_ctxt, reg1
>> +.endm
>> +
>> +.macro mte_switch_to_hyp g_ctxt, h_ctxt, reg1
>> +.endm
>> +
>> +#endif /* CONFIG_ARM64_MTE */
>> +#endif /* __ASSEMBLY__ */
>> +#endif /* __ASM_KVM_MTE_H */
>> diff --git a/arch/arm64/include/asm/sysreg.h 
>> b/arch/arm64/include/asm/sysreg.h
>> index 8b5e7e5c3cc8..0a01975d331d 100644
>> --- a/arch/arm64/include/asm/sysreg.h
>> +++ b/arch/arm64/include/asm/sysreg.h
>> @@ -574,7 +574,8 @@
>>  #define SCTLR_ELx_M    (BIT(0))
>>
>>  #define SCTLR_ELx_FLAGS    (SCTLR_ELx_M  | SCTLR_ELx_A | SCTLR_ELx_C | \
>> -             SCTLR_ELx_SA | SCTLR_ELx_I | SCTLR_ELx_IESB)
>> +             SCTLR_ELx_SA | SCTLR_ELx_I | SCTLR_ELx_IESB | \
>> +             SCTLR_ELx_ITFSB)
>>
>>  /* SCTLR_EL2 specific flags. */
>>  #define SCTLR_EL2_RES1    ((BIT(4))  | (BIT(5))  | (BIT(11)) | 
>> (BIT(16)) | \
>> diff --git a/arch/arm64/kernel/asm-offsets.c 
>> b/arch/arm64/kernel/asm-offsets.c
>> index f42fd9e33981..801531e1fa5c 100644
>> --- a/arch/arm64/kernel/asm-offsets.c
>> +++ b/arch/arm64/kernel/asm-offsets.c
>> @@ -105,6 +105,9 @@ int main(void)
>>    DEFINE(VCPU_WORKAROUND_FLAGS,    offsetof(struct kvm_vcpu,
>> arch.workaround_flags));
>>    DEFINE(VCPU_HCR_EL2,        offsetof(struct kvm_vcpu, arch.hcr_el2));
>>    DEFINE(CPU_USER_PT_REGS,    offsetof(struct kvm_cpu_context, regs));
>> +  DEFINE(CPU_RGSR_EL1,        offsetof(struct kvm_cpu_context, 
>> sys_regs[RGSR_EL1]));
>> +  DEFINE(CPU_GCR_EL1,        offsetof(struct kvm_cpu_context, 
>> sys_regs[GCR_EL1]));
>> +  DEFINE(CPU_TFSRE0_EL1,    offsetof(struct kvm_cpu_context,
>> sys_regs[TFSRE0_EL1]));
>>    DEFINE(CPU_APIAKEYLO_EL1,    offsetof(struct kvm_cpu_context,
>> sys_regs[APIAKEYLO_EL1]));
>>    DEFINE(CPU_APIBKEYLO_EL1,    offsetof(struct kvm_cpu_context,
>> sys_regs[APIBKEYLO_EL1]));
>>    DEFINE(CPU_APDAKEYLO_EL1,    offsetof(struct kvm_cpu_context,
>> sys_regs[APDAKEYLO_EL1]));
>> diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
>> index b0afad7a99c6..c67582c6dd55 100644
>> --- a/arch/arm64/kvm/hyp/entry.S
>> +++ b/arch/arm64/kvm/hyp/entry.S
>> @@ -13,6 +13,7 @@
>>  #include <asm/kvm_arm.h>
>>  #include <asm/kvm_asm.h>
>>  #include <asm/kvm_mmu.h>
>> +#include <asm/kvm_mte.h>
>>  #include <asm/kvm_ptrauth.h>
>>
>>      .text
>> @@ -51,6 +52,9 @@ alternative_else_nop_endif
>>
>>      add    x29, x0, #VCPU_CONTEXT
>>
>> +    // mte_switch_to_guest(g_ctxt, h_ctxt, tmp1)
>> +    mte_switch_to_guest x29, x1, x2
>> +
>>      // Macro ptrauth_switch_to_guest format:
>>      //     ptrauth_switch_to_guest(guest cxt, tmp1, tmp2, tmp3)
>>      // The below macro to restore guest keys is not implemented in C 
>> code
>> @@ -140,6 +144,9 @@ SYM_INNER_LABEL(__guest_exit, SYM_L_GLOBAL)
>>      // when this feature is enabled for kernel code.
>>      ptrauth_switch_to_hyp x1, x2, x3, x4, x5
>>
>> +    // mte_switch_to_hyp(g_ctxt, h_ctxt, reg1)
>> +    mte_switch_to_hyp x1, x2, x3
>> +
>>      // Restore hyp's sp_el0
>>      restore_sp_el0 x2, x3
>>
>> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>> b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>> index cce43bfe158f..94d9736f0133 100644
>> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
>> @@ -45,6 +45,8 @@ static inline void __sysreg_save_el1_state(struct
>> kvm_cpu_context *ctxt)
>>      ctxt_sys_reg(ctxt, CNTKCTL_EL1)    = read_sysreg_el1(SYS_CNTKCTL);
>>      ctxt_sys_reg(ctxt, PAR_EL1)    = read_sysreg_par();
>>      ctxt_sys_reg(ctxt, TPIDR_EL1)    = read_sysreg(tpidr_el1);
>> +    if (system_supports_mte())
>> +        ctxt_sys_reg(ctxt, TFSR_EL1) = read_sysreg_el1(SYS_TFSR);
> 
> I already asked for it, and I'm going to ask for it again:
> Most of the sysreg save/restore is guarded by a per-vcpu check
> (HCR_EL2.ATA), while this one is unconditionally saved/restore
> if the host is MTE capable. Why is that so?

Sorry, I thought your concern was for registers that affect the host (as 
they are obviously more performance critical as they are hit on every 
guest exit). Although I guess that's incorrect for nVHE which is what 
all the cool kids want now ;)

> The required infrastructure should be available, and if anything
> is missing, let's add it.

I think I can see a way of accessing the necessary state.

>>
>>      ctxt_sys_reg(ctxt, SP_EL1)    = read_sysreg(sp_el1);
>>      ctxt_sys_reg(ctxt, ELR_EL1)    = read_sysreg_el1(SYS_ELR);
>> @@ -106,6 +108,8 @@ static inline void
>> __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt)
>>      write_sysreg_el1(ctxt_sys_reg(ctxt, CNTKCTL_EL1), SYS_CNTKCTL);
>>      write_sysreg(ctxt_sys_reg(ctxt, PAR_EL1),    par_el1);
>>      write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL1),    tpidr_el1);
>> +    if (system_supports_mte())
>> +        write_sysreg_el1(ctxt_sys_reg(ctxt, TFSR_EL1), SYS_TFSR);
>>
>>      if (!has_vhe() &&
>>          cpus_have_final_cap(ARM64_WORKAROUND_SPECULATIVE_AT) &&
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index 3313dedfa505..88d4f360949e 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -1281,6 +1281,12 @@ static bool access_ccsidr(struct kvm_vcpu
>> *vcpu, struct sys_reg_params *p,
>>      return true;
>>  }
>>
>> +static unsigned int mte_visibility(const struct kvm_vcpu *vcpu,
>> +                   const struct sys_reg_desc *rd)
>> +{
>> +    return REG_HIDDEN;
>> +}
>> +
>>  /* sys_reg_desc initialiser for known cpufeature ID registers */
>>  #define ID_SANITISED(name) {            \
>>      SYS_DESC(SYS_##name),            \
>> @@ -1449,8 +1455,8 @@ static const struct sys_reg_desc sys_reg_descs[] 
>> = {
>>      { SYS_DESC(SYS_ACTLR_EL1), access_actlr, reset_actlr, ACTLR_EL1 },
>>      { SYS_DESC(SYS_CPACR_EL1), NULL, reset_val, CPACR_EL1, 0 },
>>
>> -    { SYS_DESC(SYS_RGSR_EL1), undef_access },
>> -    { SYS_DESC(SYS_GCR_EL1), undef_access },
>> +    { SYS_DESC(SYS_RGSR_EL1), undef_access, reset_unknown, RGSR_EL1,
>> .visibility = mte_visibility },
>> +    { SYS_DESC(SYS_GCR_EL1), undef_access, reset_unknown, GCR_EL1,
>> .visibility = mte_visibility },
> 
> Please don't mix implicit and designated assignments, as it is
> pretty confusing.

Sorry - I was copying the style elsewhere in this list (e.g. just 
below). I guess it might actually be better to create a new macro for 
MTE similar to AMU / PTRAUTH - it should remove some of the boilerplate.

Thanks,

Steve

>>
>>      { SYS_DESC(SYS_ZCR_EL1), NULL, reset_val, ZCR_EL1, 0, .visibility =
>> sve_visibility },
>>      { SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, 
>> TTBR0_EL1 },
>> @@ -1476,8 +1482,8 @@ static const struct sys_reg_desc sys_reg_descs[] 
>> = {
>>      { SYS_DESC(SYS_ERXMISC0_EL1), trap_raz_wi },
>>      { SYS_DESC(SYS_ERXMISC1_EL1), trap_raz_wi },
>>
>> -    { SYS_DESC(SYS_TFSR_EL1), undef_access },
>> -    { SYS_DESC(SYS_TFSRE0_EL1), undef_access },
>> +    { SYS_DESC(SYS_TFSR_EL1), undef_access, reset_unknown, TFSR_EL1,
>> .visibility = mte_visibility },
>> +    { SYS_DESC(SYS_TFSRE0_EL1), undef_access, reset_unknown, TFSRE0_EL1,
>> .visibility = mte_visibility },
>>
>>      { SYS_DESC(SYS_FAR_EL1), access_vm_reg, reset_unknown, FAR_EL1 },
>>      { SYS_DESC(SYS_PAR_EL1), NULL, reset_unknown, PAR_EL1 },
> 
> Thanks,
> 
>          M.



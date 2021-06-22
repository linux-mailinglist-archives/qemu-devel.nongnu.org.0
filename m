Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C193B00C0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:49:08 +0200 (CEST)
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvd1n-0004SY-CR
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1lvczf-0001Aj-FV
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:46:55 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:43770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1lvczd-0002gN-4f
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:46:55 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso20613220otu.10
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 02:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d1UfC4H1ralRKZkEo08JAlC57I2hJMgtts4Z/YHiLVE=;
 b=IpAgVOz9yIT+DkcxS5rerGZVtoHeldBqGk2MUylaBF9eN0Nujq5+45xPaci0QvPlCi
 SwlENnorPSrZkGIi7nWTxcQYcUjUNbcrMAcZeDsyjDGj3jXJh65mQlj0stkRacLmK0LO
 398DqiZA1SF01Wv5z/a8O7+MhOoYM04LpMnsNcCxXkCFGQ3h9dCihcTg+nz5GrUGEBCs
 GX+yAZyS6OS17/vtkG/YFplgH/bAsNYjCdGuEVlWyIyWwTgps1z9jOiHE6GSl437s/ET
 tv9RcJAHGlfYi5GFdWBCLz2ON1hgMFqcDZOCLw02y9cJxtR8tR3PGQpgiypIGQWVho82
 m13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d1UfC4H1ralRKZkEo08JAlC57I2hJMgtts4Z/YHiLVE=;
 b=JhXdLitq4htvtxUAQPxdI3fvEfFYfQ/25EgqB6u2q/6Biu9bGDU4fC8/lCGy080u0j
 sSznhewL81UfRght8azeQZy66Qq5rWzCdo20ynZiQlZ9k8IIPZwq1CYLXP7qVOS/p0LE
 DihrR5Lv8SPXKidWOrTHu9zDLvkxNQDqM9V80ZH2uaVMdKU+0PvZdPf5vKTfUgtF23xx
 gZI8MShL2GyXN6ukyssooMZ6YAtgetrD/Hh/HT7KpXdxFm5CGsjgpPVQsQUsUjaDPC3h
 bB//q6QrT+/w7f2QsIYj68n9iMuWbO6NBJGjZ5rpaKrk3fy+sON6hX5NDMgkDCBi5VjK
 p6HQ==
X-Gm-Message-State: AOAM533gQpXred8pAiwwIqoFCTWoV3NEsqTiBFOTWuzt3y65tpzN4/N8
 1g2r3zSAC3OVAN7vIvdNAoKzsvoFNgu0QALcx8pmOw==
X-Google-Smtp-Source: ABdhPJyMnWJ/gEe46ieCeEy/6Avin0t5ldg5f3moyL/01IXlHdTQP8jtukid0+EKqPjLSSIr725dvAv6OwiBnnLDwHY=
X-Received: by 2002:a05:6830:1598:: with SMTP id
 i24mr2396544otr.52.1624355211738; 
 Tue, 22 Jun 2021 02:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210621111716.37157-1-steven.price@arm.com>
 <20210621111716.37157-4-steven.price@arm.com>
In-Reply-To: <20210621111716.37157-4-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 22 Jun 2021 10:46:15 +0100
Message-ID: <CA+EHjTzhJ5rkQ+GW643f_R7XP9L5SH0EGD78Ux=MGqfHGq2BbA@mail.gmail.com>
Subject: Re: [PATCH v17 3/6] KVM: arm64: Save/restore MTE registers
To: Steven Price <steven.price@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Will Deacon <will@kernel.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org, 
 Dave Martin <Dave.Martin@arm.com>, Juan Quintela <quintela@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, kvmarm@lists.cs.columbia.edu, 
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=tabba@google.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -155
X-Spam_score: -15.6
X-Spam_bar: ---------------
X-Spam_report: (-15.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URI_DOTEDU=1.999, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

> diff --git a/arch/arm64/include/asm/kvm_mte.h b/arch/arm64/include/asm/kvm_mte.h
> new file mode 100644
> index 000000000000..88dd1199670b
> --- /dev/null
> +++ b/arch/arm64/include/asm/kvm_mte.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020-2021 ARM Ltd.
> + */
> +#ifndef __ASM_KVM_MTE_H
> +#define __ASM_KVM_MTE_H
> +
> +#ifdef __ASSEMBLY__
> +
> +#include <asm/sysreg.h>
> +
> +#ifdef CONFIG_ARM64_MTE
> +
> +.macro mte_switch_to_guest g_ctxt, h_ctxt, reg1
> +alternative_if_not ARM64_MTE
> +       b       .L__skip_switch\@
> +alternative_else_nop_endif
> +       mrs     \reg1, hcr_el2
> +       tbz     \reg1, #(HCR_ATA_SHIFT), .L__skip_switch\@
> +
> +       mrs_s   \reg1, SYS_RGSR_EL1
> +       str     \reg1, [\h_ctxt, #CPU_RGSR_EL1]
> +       mrs_s   \reg1, SYS_GCR_EL1
> +       str     \reg1, [\h_ctxt, #CPU_GCR_EL1]
> +
> +       ldr     \reg1, [\g_ctxt, #CPU_RGSR_EL1]
> +       msr_s   SYS_RGSR_EL1, \reg1
> +       ldr     \reg1, [\g_ctxt, #CPU_GCR_EL1]
> +       msr_s   SYS_GCR_EL1, \reg1
> +
> +.L__skip_switch\@:
> +.endm
> +
> +.macro mte_switch_to_hyp g_ctxt, h_ctxt, reg1
> +alternative_if_not ARM64_MTE
> +       b       .L__skip_switch\@
> +alternative_else_nop_endif
> +       mrs     \reg1, hcr_el2
> +       tbz     \reg1, #(HCR_ATA_SHIFT), .L__skip_switch\@
> +
> +       mrs_s   \reg1, SYS_RGSR_EL1
> +       str     \reg1, [\g_ctxt, #CPU_RGSR_EL1]
> +       mrs_s   \reg1, SYS_GCR_EL1
> +       str     \reg1, [\g_ctxt, #CPU_GCR_EL1]
> +
> +       ldr     \reg1, [\h_ctxt, #CPU_RGSR_EL1]
> +       msr_s   SYS_RGSR_EL1, \reg1
> +       ldr     \reg1, [\h_ctxt, #CPU_GCR_EL1]
> +       msr_s   SYS_GCR_EL1, \reg1
> +
> +       isb
> +
> +.L__skip_switch\@:
> +.endm
> +
> +#else /* CONFIG_ARM64_MTE */

nit: !CONFIG_ARM64_MTE (clearer and matches the style in kvm_ptrauth.h)

Cheers,
/fuad


> +
> +.macro mte_switch_to_guest g_ctxt, h_ctxt, reg1
> +.endm
> +
> +.macro mte_switch_to_hyp g_ctxt, h_ctxt, reg1
> +.endm
> +
> +#endif /* CONFIG_ARM64_MTE */
> +#endif /* __ASSEMBLY__ */
> +#endif /* __ASM_KVM_MTE_H */
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 65d15700a168..347ccac2341e 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -651,7 +651,8 @@
>
>  #define INIT_SCTLR_EL2_MMU_ON                                          \
>         (SCTLR_ELx_M  | SCTLR_ELx_C | SCTLR_ELx_SA | SCTLR_ELx_I |      \
> -        SCTLR_ELx_IESB | SCTLR_ELx_WXN | ENDIAN_SET_EL2 | SCTLR_EL2_RES1)
> +        SCTLR_ELx_IESB | SCTLR_ELx_WXN | ENDIAN_SET_EL2 |              \
> +        SCTLR_ELx_ITFSB | SCTLR_EL2_RES1)
>
>  #define INIT_SCTLR_EL2_MMU_OFF \
>         (SCTLR_EL2_RES1 | ENDIAN_SET_EL2)
> diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
> index 0cb34ccb6e73..6f0044cb233e 100644
> --- a/arch/arm64/kernel/asm-offsets.c
> +++ b/arch/arm64/kernel/asm-offsets.c
> @@ -111,6 +111,8 @@ int main(void)
>    DEFINE(VCPU_WORKAROUND_FLAGS,        offsetof(struct kvm_vcpu, arch.workaround_flags));
>    DEFINE(VCPU_HCR_EL2,         offsetof(struct kvm_vcpu, arch.hcr_el2));
>    DEFINE(CPU_USER_PT_REGS,     offsetof(struct kvm_cpu_context, regs));
> +  DEFINE(CPU_RGSR_EL1,         offsetof(struct kvm_cpu_context, sys_regs[RGSR_EL1]));
> +  DEFINE(CPU_GCR_EL1,          offsetof(struct kvm_cpu_context, sys_regs[GCR_EL1]));
>    DEFINE(CPU_APIAKEYLO_EL1,    offsetof(struct kvm_cpu_context, sys_regs[APIAKEYLO_EL1]));
>    DEFINE(CPU_APIBKEYLO_EL1,    offsetof(struct kvm_cpu_context, sys_regs[APIBKEYLO_EL1]));
>    DEFINE(CPU_APDAKEYLO_EL1,    offsetof(struct kvm_cpu_context, sys_regs[APDAKEYLO_EL1]));
> diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
> index e831d3dfd50d..435346ea1504 100644
> --- a/arch/arm64/kvm/hyp/entry.S
> +++ b/arch/arm64/kvm/hyp/entry.S
> @@ -13,6 +13,7 @@
>  #include <asm/kvm_arm.h>
>  #include <asm/kvm_asm.h>
>  #include <asm/kvm_mmu.h>
> +#include <asm/kvm_mte.h>
>  #include <asm/kvm_ptrauth.h>
>
>         .text
> @@ -51,6 +52,9 @@ alternative_else_nop_endif
>
>         add     x29, x0, #VCPU_CONTEXT
>
> +       // mte_switch_to_guest(g_ctxt, h_ctxt, tmp1)
> +       mte_switch_to_guest x29, x1, x2
> +
>         // Macro ptrauth_switch_to_guest format:
>         //      ptrauth_switch_to_guest(guest cxt, tmp1, tmp2, tmp3)
>         // The below macro to restore guest keys is not implemented in C code
> @@ -142,6 +146,9 @@ SYM_INNER_LABEL(__guest_exit, SYM_L_GLOBAL)
>         // when this feature is enabled for kernel code.
>         ptrauth_switch_to_hyp x1, x2, x3, x4, x5
>
> +       // mte_switch_to_hyp(g_ctxt, h_ctxt, reg1)
> +       mte_switch_to_hyp x1, x2, x3
> +
>         // Restore hyp's sp_el0
>         restore_sp_el0 x2, x3
>
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index cce43bfe158f..de7e14c862e6 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -14,6 +14,7 @@
>  #include <asm/kvm_asm.h>
>  #include <asm/kvm_emulate.h>
>  #include <asm/kvm_hyp.h>
> +#include <asm/kvm_mmu.h>
>
>  static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
>  {
> @@ -26,6 +27,16 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
>         ctxt_sys_reg(ctxt, TPIDRRO_EL0) = read_sysreg(tpidrro_el0);
>  }
>
> +static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
> +{
> +       struct kvm_vcpu *vcpu = ctxt->__hyp_running_vcpu;
> +
> +       if (!vcpu)
> +               vcpu = container_of(ctxt, struct kvm_vcpu, arch.ctxt);
> +
> +       return kvm_has_mte(kern_hyp_va(vcpu->kvm));
> +}
> +
>  static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
>  {
>         ctxt_sys_reg(ctxt, CSSELR_EL1)  = read_sysreg(csselr_el1);
> @@ -46,6 +57,11 @@ static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
>         ctxt_sys_reg(ctxt, PAR_EL1)     = read_sysreg_par();
>         ctxt_sys_reg(ctxt, TPIDR_EL1)   = read_sysreg(tpidr_el1);
>
> +       if (ctxt_has_mte(ctxt)) {
> +               ctxt_sys_reg(ctxt, TFSR_EL1) = read_sysreg_el1(SYS_TFSR);
> +               ctxt_sys_reg(ctxt, TFSRE0_EL1) = read_sysreg_s(SYS_TFSRE0_EL1);
> +       }
> +
>         ctxt_sys_reg(ctxt, SP_EL1)      = read_sysreg(sp_el1);
>         ctxt_sys_reg(ctxt, ELR_EL1)     = read_sysreg_el1(SYS_ELR);
>         ctxt_sys_reg(ctxt, SPSR_EL1)    = read_sysreg_el1(SYS_SPSR);
> @@ -107,6 +123,11 @@ static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt)
>         write_sysreg(ctxt_sys_reg(ctxt, PAR_EL1),       par_el1);
>         write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL1),     tpidr_el1);
>
> +       if (ctxt_has_mte(ctxt)) {
> +               write_sysreg_el1(ctxt_sys_reg(ctxt, TFSR_EL1), SYS_TFSR);
> +               write_sysreg_s(ctxt_sys_reg(ctxt, TFSRE0_EL1), SYS_TFSRE0_EL1);
> +       }
> +
>         if (!has_vhe() &&
>             cpus_have_final_cap(ARM64_WORKAROUND_SPECULATIVE_AT) &&
>             ctxt->__hyp_running_vcpu) {
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 36f67f8deae1..5c75b24eae21 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1309,6 +1309,20 @@ static bool access_ccsidr(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>         return true;
>  }
>
> +static unsigned int mte_visibility(const struct kvm_vcpu *vcpu,
> +                                  const struct sys_reg_desc *rd)
> +{
> +       return REG_HIDDEN;
> +}
> +
> +#define MTE_REG(name) {                                \
> +       SYS_DESC(SYS_##name),                   \
> +       .access = undef_access,                 \
> +       .reset = reset_unknown,                 \
> +       .reg = name,                            \
> +       .visibility = mte_visibility,           \
> +}
> +
>  /* sys_reg_desc initialiser for known cpufeature ID registers */
>  #define ID_SANITISED(name) {                   \
>         SYS_DESC(SYS_##name),                   \
> @@ -1477,8 +1491,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>         { SYS_DESC(SYS_ACTLR_EL1), access_actlr, reset_actlr, ACTLR_EL1 },
>         { SYS_DESC(SYS_CPACR_EL1), NULL, reset_val, CPACR_EL1, 0 },
>
> -       { SYS_DESC(SYS_RGSR_EL1), undef_access },
> -       { SYS_DESC(SYS_GCR_EL1), undef_access },
> +       MTE_REG(RGSR_EL1),
> +       MTE_REG(GCR_EL1),
>
>         { SYS_DESC(SYS_ZCR_EL1), NULL, reset_val, ZCR_EL1, 0, .visibility = sve_visibility },
>         { SYS_DESC(SYS_TRFCR_EL1), undef_access },
> @@ -1505,8 +1519,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>         { SYS_DESC(SYS_ERXMISC0_EL1), trap_raz_wi },
>         { SYS_DESC(SYS_ERXMISC1_EL1), trap_raz_wi },
>
> -       { SYS_DESC(SYS_TFSR_EL1), undef_access },
> -       { SYS_DESC(SYS_TFSRE0_EL1), undef_access },
> +       MTE_REG(TFSR_EL1),
> +       MTE_REG(TFSRE0_EL1),
>
>         { SYS_DESC(SYS_FAR_EL1), access_vm_reg, reset_unknown, FAR_EL1 },
>         { SYS_DESC(SYS_PAR_EL1), NULL, reset_unknown, PAR_EL1 },
> --
> 2.20.1
>
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm


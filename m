Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388C8310C53
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 14:59:37 +0100 (CET)
Received: from localhost ([::1]:51126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l81e4-0008JM-7y
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 08:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1l81d4-00072X-GI
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:58:34 -0500
Received: from foss.arm.com ([217.140.110.172]:53074)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1l81d1-00077p-Ty
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:58:34 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A53A142F;
 Fri,  5 Feb 2021 05:58:31 -0800 (PST)
Received: from e112269-lin.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 490223F719;
 Fri,  5 Feb 2021 05:58:28 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v8 3/5] arm64: kvm: Save/restore MTE registers
Date: Fri,  5 Feb 2021 13:58:01 +0000
Message-Id: <20210205135803.48321-4-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205135803.48321-1-steven.price@arm.com>
References: <20210205135803.48321-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Dave Martin <Dave.Martin@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>, James Morse <james.morse@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define the new system registers that MTE introduces and context switch
them. The MTE feature is still hidden from the ID register as it isn't
supported in a VM yet.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/include/asm/kvm_host.h          |  6 ++
 arch/arm64/include/asm/kvm_mte.h           | 66 ++++++++++++++++++++++
 arch/arm64/include/asm/sysreg.h            |  3 +-
 arch/arm64/kernel/asm-offsets.c            |  3 +
 arch/arm64/kvm/hyp/entry.S                 |  7 +++
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 21 +++++++
 arch/arm64/kvm/sys_regs.c                  | 22 ++++++--
 7 files changed, 123 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_mte.h

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 302ebc61d8ac..781d47492c3c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -208,6 +208,12 @@ enum vcpu_sysreg {
 	CNTP_CVAL_EL0,
 	CNTP_CTL_EL0,
 
+	/* Memory Tagging Extension registers */
+	RGSR_EL1,	/* Random Allocation Tag Seed Register */
+	GCR_EL1,	/* Tag Control Register */
+	TFSR_EL1,	/* Tag Fault Status Register (EL1) */
+	TFSRE0_EL1,	/* Tag Fault Status Register (EL0) */
+
 	/* 32bit specific registers. Keep them at the end of the range */
 	DACR32_EL2,	/* Domain Access Control Register */
 	IFSR32_EL2,	/* Instruction Fault Status Register */
diff --git a/arch/arm64/include/asm/kvm_mte.h b/arch/arm64/include/asm/kvm_mte.h
new file mode 100644
index 000000000000..6541c7d6ce06
--- /dev/null
+++ b/arch/arm64/include/asm/kvm_mte.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 ARM Ltd.
+ */
+#ifndef __ASM_KVM_MTE_H
+#define __ASM_KVM_MTE_H
+
+#ifdef __ASSEMBLY__
+
+#include <asm/sysreg.h>
+
+#ifdef CONFIG_ARM64_MTE
+
+.macro mte_switch_to_guest g_ctxt, h_ctxt, reg1
+alternative_if_not ARM64_MTE
+	b	.L__skip_switch\@
+alternative_else_nop_endif
+	mrs	\reg1, hcr_el2
+	and	\reg1, \reg1, #(HCR_ATA)
+	cbz	\reg1, .L__skip_switch\@
+
+	mrs_s	\reg1, SYS_RGSR_EL1
+	str	\reg1, [\h_ctxt, #CPU_RGSR_EL1]
+	mrs_s	\reg1, SYS_GCR_EL1
+	str	\reg1, [\h_ctxt, #CPU_GCR_EL1]
+
+	ldr	\reg1, [\g_ctxt, #CPU_RGSR_EL1]
+	msr_s	SYS_RGSR_EL1, \reg1
+	ldr	\reg1, [\g_ctxt, #CPU_GCR_EL1]
+	msr_s	SYS_GCR_EL1, \reg1
+
+.L__skip_switch\@:
+.endm
+
+.macro mte_switch_to_hyp g_ctxt, h_ctxt, reg1
+alternative_if_not ARM64_MTE
+	b	.L__skip_switch\@
+alternative_else_nop_endif
+	mrs	\reg1, hcr_el2
+	and	\reg1, \reg1, #(HCR_ATA)
+	cbz	\reg1, .L__skip_switch\@
+
+	mrs_s	\reg1, SYS_RGSR_EL1
+	str	\reg1, [\g_ctxt, #CPU_RGSR_EL1]
+	mrs_s	\reg1, SYS_GCR_EL1
+	str	\reg1, [\g_ctxt, #CPU_GCR_EL1]
+
+	ldr	\reg1, [\h_ctxt, #CPU_RGSR_EL1]
+	msr_s	SYS_RGSR_EL1, \reg1
+	ldr	\reg1, [\h_ctxt, #CPU_GCR_EL1]
+	msr_s	SYS_GCR_EL1, \reg1
+
+.L__skip_switch\@:
+.endm
+
+#else /* CONFIG_ARM64_MTE */
+
+.macro mte_switch_to_guest g_ctxt, h_ctxt, reg1
+.endm
+
+.macro mte_switch_to_hyp g_ctxt, h_ctxt, reg1
+.endm
+
+#endif /* CONFIG_ARM64_MTE */
+#endif /* __ASSEMBLY__ */
+#endif /* __ASM_KVM_MTE_H */
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 8b5e7e5c3cc8..0a01975d331d 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -574,7 +574,8 @@
 #define SCTLR_ELx_M	(BIT(0))
 
 #define SCTLR_ELx_FLAGS	(SCTLR_ELx_M  | SCTLR_ELx_A | SCTLR_ELx_C | \
-			 SCTLR_ELx_SA | SCTLR_ELx_I | SCTLR_ELx_IESB)
+			 SCTLR_ELx_SA | SCTLR_ELx_I | SCTLR_ELx_IESB | \
+			 SCTLR_ELx_ITFSB)
 
 /* SCTLR_EL2 specific flags. */
 #define SCTLR_EL2_RES1	((BIT(4))  | (BIT(5))  | (BIT(11)) | (BIT(16)) | \
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index f42fd9e33981..801531e1fa5c 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -105,6 +105,9 @@ int main(void)
   DEFINE(VCPU_WORKAROUND_FLAGS,	offsetof(struct kvm_vcpu, arch.workaround_flags));
   DEFINE(VCPU_HCR_EL2,		offsetof(struct kvm_vcpu, arch.hcr_el2));
   DEFINE(CPU_USER_PT_REGS,	offsetof(struct kvm_cpu_context, regs));
+  DEFINE(CPU_RGSR_EL1,		offsetof(struct kvm_cpu_context, sys_regs[RGSR_EL1]));
+  DEFINE(CPU_GCR_EL1,		offsetof(struct kvm_cpu_context, sys_regs[GCR_EL1]));
+  DEFINE(CPU_TFSRE0_EL1,	offsetof(struct kvm_cpu_context, sys_regs[TFSRE0_EL1]));
   DEFINE(CPU_APIAKEYLO_EL1,	offsetof(struct kvm_cpu_context, sys_regs[APIAKEYLO_EL1]));
   DEFINE(CPU_APIBKEYLO_EL1,	offsetof(struct kvm_cpu_context, sys_regs[APIBKEYLO_EL1]));
   DEFINE(CPU_APDAKEYLO_EL1,	offsetof(struct kvm_cpu_context, sys_regs[APDAKEYLO_EL1]));
diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
index b0afad7a99c6..c67582c6dd55 100644
--- a/arch/arm64/kvm/hyp/entry.S
+++ b/arch/arm64/kvm/hyp/entry.S
@@ -13,6 +13,7 @@
 #include <asm/kvm_arm.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_mmu.h>
+#include <asm/kvm_mte.h>
 #include <asm/kvm_ptrauth.h>
 
 	.text
@@ -51,6 +52,9 @@ alternative_else_nop_endif
 
 	add	x29, x0, #VCPU_CONTEXT
 
+	// mte_switch_to_guest(g_ctxt, h_ctxt, tmp1)
+	mte_switch_to_guest x29, x1, x2
+
 	// Macro ptrauth_switch_to_guest format:
 	// 	ptrauth_switch_to_guest(guest cxt, tmp1, tmp2, tmp3)
 	// The below macro to restore guest keys is not implemented in C code
@@ -140,6 +144,9 @@ SYM_INNER_LABEL(__guest_exit, SYM_L_GLOBAL)
 	// when this feature is enabled for kernel code.
 	ptrauth_switch_to_hyp x1, x2, x3, x4, x5
 
+	// mte_switch_to_hyp(g_ctxt, h_ctxt, reg1)
+	mte_switch_to_hyp x1, x2, x3
+
 	// Restore hyp's sp_el0
 	restore_sp_el0 x2, x3
 
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index cce43bfe158f..de7e14c862e6 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -14,6 +14,7 @@
 #include <asm/kvm_asm.h>
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_hyp.h>
+#include <asm/kvm_mmu.h>
 
 static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
 {
@@ -26,6 +27,16 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
 	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
 }
 
+static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu = ctxt->__hyp_running_vcpu;
+
+	if (!vcpu)
+		vcpu = container_of(ctxt, struct kvm_vcpu, arch.ctxt);
+
+	return kvm_has_mte(kern_hyp_va(vcpu->kvm));
+}
+
 static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, CSSELR_EL1)	= read_sysreg(csselr_el1);
@@ -46,6 +57,11 @@ static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
 	ctxt_sys_reg(ctxt, PAR_EL1)	= read_sysreg_par();
 	ctxt_sys_reg(ctxt, TPIDR_EL1)	= read_sysreg(tpidr_el1);
 
+	if (ctxt_has_mte(ctxt)) {
+		ctxt_sys_reg(ctxt, TFSR_EL1) = read_sysreg_el1(SYS_TFSR);
+		ctxt_sys_reg(ctxt, TFSRE0_EL1) = read_sysreg_s(SYS_TFSRE0_EL1);
+	}
+
 	ctxt_sys_reg(ctxt, SP_EL1)	= read_sysreg(sp_el1);
 	ctxt_sys_reg(ctxt, ELR_EL1)	= read_sysreg_el1(SYS_ELR);
 	ctxt_sys_reg(ctxt, SPSR_EL1)	= read_sysreg_el1(SYS_SPSR);
@@ -107,6 +123,11 @@ static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt)
 	write_sysreg(ctxt_sys_reg(ctxt, PAR_EL1),	par_el1);
 	write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL1),	tpidr_el1);
 
+	if (ctxt_has_mte(ctxt)) {
+		write_sysreg_el1(ctxt_sys_reg(ctxt, TFSR_EL1), SYS_TFSR);
+		write_sysreg_s(ctxt_sys_reg(ctxt, TFSRE0_EL1), SYS_TFSRE0_EL1);
+	}
+
 	if (!has_vhe() &&
 	    cpus_have_final_cap(ARM64_WORKAROUND_SPECULATIVE_AT) &&
 	    ctxt->__hyp_running_vcpu) {
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index bb5525bbf1ca..e6d3e44d19b7 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1282,6 +1282,20 @@ static bool access_ccsidr(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	return true;
 }
 
+static unsigned int mte_visibility(const struct kvm_vcpu *vcpu,
+				   const struct sys_reg_desc *rd)
+{
+	return REG_HIDDEN;
+}
+
+#define MTE_REG(name) {				\
+	SYS_DESC(SYS_##name),			\
+	.access = undef_access,			\
+	.reset = reset_unknown,			\
+	.reg = name,				\
+	.visibility = mte_visibility,		\
+}
+
 /* sys_reg_desc initialiser for known cpufeature ID registers */
 #define ID_SANITISED(name) {			\
 	SYS_DESC(SYS_##name),			\
@@ -1450,8 +1464,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_ACTLR_EL1), access_actlr, reset_actlr, ACTLR_EL1 },
 	{ SYS_DESC(SYS_CPACR_EL1), NULL, reset_val, CPACR_EL1, 0 },
 
-	{ SYS_DESC(SYS_RGSR_EL1), undef_access },
-	{ SYS_DESC(SYS_GCR_EL1), undef_access },
+	MTE_REG(RGSR_EL1),
+	MTE_REG(GCR_EL1),
 
 	{ SYS_DESC(SYS_ZCR_EL1), NULL, reset_val, ZCR_EL1, 0, .visibility = sve_visibility },
 	{ SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, TTBR0_EL1 },
@@ -1477,8 +1491,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_ERXMISC0_EL1), trap_raz_wi },
 	{ SYS_DESC(SYS_ERXMISC1_EL1), trap_raz_wi },
 
-	{ SYS_DESC(SYS_TFSR_EL1), undef_access },
-	{ SYS_DESC(SYS_TFSRE0_EL1), undef_access },
+	MTE_REG(TFSR_EL1),
+	MTE_REG(TFSRE0_EL1),
 
 	{ SYS_DESC(SYS_FAR_EL1), access_vm_reg, reset_unknown, FAR_EL1 },
 	{ SYS_DESC(SYS_PAR_EL1), NULL, reset_unknown, PAR_EL1 },
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EE72C68C6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:36:47 +0100 (CET)
Received: from localhost ([::1]:60714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifni-0008IT-P1
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1kifZ7-0001mw-WE
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:21:45 -0500
Received: from foss.arm.com ([217.140.110.172]:37160)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1kifYz-0006yP-Df
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:21:41 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CC951597;
 Fri, 27 Nov 2020 07:21:31 -0800 (PST)
Received: from e112269-lin.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FC403F70D;
 Fri, 27 Nov 2020 07:21:28 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v6 2/2] arm64: kvm: Introduce MTE VCPU feature
Date: Fri, 27 Nov 2020 15:21:13 +0000
Message-Id: <20201127152113.13099-3-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201127152113.13099-1-steven.price@arm.com>
References: <20201127152113.13099-1-steven.price@arm.com>
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

Add a new VM feature 'KVM_ARM_CAP_MTE' which enables memory tagging
for a VM. This exposes the feature to the guest and automatically tags
memory pages touched by the VM as PG_mte_tagged (and clears the tags
storage) to ensure that the guest cannot see stale tags, and so that the
tags are correctly saved/restored across swap.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/include/asm/kvm_emulate.h |  3 +++
 arch/arm64/include/asm/kvm_host.h    |  4 ++++
 arch/arm64/include/asm/pgtable.h     |  2 +-
 arch/arm64/kernel/mte.c              | 18 +++++++++++++-----
 arch/arm64/kvm/arm.c                 |  9 +++++++++
 arch/arm64/kvm/mmu.c                 | 16 ++++++++++++++++
 arch/arm64/kvm/sys_regs.c            |  6 +++++-
 include/uapi/linux/kvm.h             |  1 +
 8 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 5ef2669ccd6c..7791ef044b7f 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -79,6 +79,9 @@ static inline void vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 	if (cpus_have_const_cap(ARM64_MISMATCHED_CACHE_TYPE) ||
 	    vcpu_el1_is_32bit(vcpu))
 		vcpu->arch.hcr_el2 |= HCR_TID2;
+
+	if (kvm_has_mte(vcpu->kvm))
+		vcpu->arch.hcr_el2 |= HCR_ATA;
 }
 
 static inline unsigned long *vcpu_hcr(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index d3e136343468..aeff10bc5b31 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -120,6 +120,8 @@ struct kvm_arch {
 	unsigned int pmuver;
 
 	u8 pfr0_csv2;
+	/* Memory Tagging Extension enabled for the guest */
+	bool mte_enabled;
 };
 
 struct kvm_vcpu_fault_info {
@@ -658,4 +660,6 @@ bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
 #define kvm_arm_vcpu_sve_finalized(vcpu) \
 	((vcpu)->arch.flags & KVM_ARM64_VCPU_SVE_FINALIZED)
 
+#define kvm_has_mte(kvm) (system_supports_mte() && (kvm)->arch.mte_enabled)
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 4ff12a7adcfd..74dfd9df38fb 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -304,7 +304,7 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
 		__sync_icache_dcache(pte);
 
 	if (system_supports_mte() &&
-	    pte_present(pte) && pte_tagged(pte) && !pte_special(pte))
+	    pte_present(pte) && pte_valid_user(pte) && !pte_special(pte))
 		mte_sync_tags(ptep, pte);
 
 	__check_racy_pte_update(mm, ptep, pte);
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 52a0638ed967..e0c252de25cd 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -20,18 +20,24 @@
 #include <asm/ptrace.h>
 #include <asm/sysreg.h>
 
-static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap)
+static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap,
+			       bool pte_is_tagged)
 {
 	pte_t old_pte = READ_ONCE(*ptep);
 
 	if (check_swap && is_swap_pte(old_pte)) {
 		swp_entry_t entry = pte_to_swp_entry(old_pte);
 
-		if (!non_swap_entry(entry) && mte_restore_tags(entry, page))
+		if (!non_swap_entry(entry) && mte_restore_tags(entry, page)) {
+			set_bit(PG_mte_tagged, &page->flags);
 			return;
+		}
 	}
 
-	mte_clear_page_tags(page_address(page));
+	if (pte_is_tagged) {
+		set_bit(PG_mte_tagged, &page->flags);
+		mte_clear_page_tags(page_address(page));
+	}
 }
 
 void mte_sync_tags(pte_t *ptep, pte_t pte)
@@ -39,11 +45,13 @@ void mte_sync_tags(pte_t *ptep, pte_t pte)
 	struct page *page = pte_page(pte);
 	long i, nr_pages = compound_nr(page);
 	bool check_swap = nr_pages == 1;
+	bool pte_is_tagged = pte_tagged(pte);
 
 	/* if PG_mte_tagged is set, tags have already been initialised */
 	for (i = 0; i < nr_pages; i++, page++) {
-		if (!test_and_set_bit(PG_mte_tagged, &page->flags))
-			mte_sync_page_tags(page, ptep, check_swap);
+		if (!test_bit(PG_mte_tagged, &page->flags))
+			mte_sync_page_tags(page, ptep, check_swap,
+					   pte_is_tagged);
 	}
 }
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index c0ffb019ca8b..da4aeba1855c 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -89,6 +89,12 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		r = 0;
 		kvm->arch.return_nisv_io_abort_to_user = true;
 		break;
+	case KVM_CAP_ARM_MTE:
+		if (!system_supports_mte() || kvm->created_vcpus)
+			return -EINVAL;
+		r = 0;
+		kvm->arch.mte_enabled = true;
+		break;
 	default:
 		r = -EINVAL;
 		break;
@@ -226,6 +232,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		 */
 		r = 1;
 		break;
+	case KVM_CAP_ARM_MTE:
+		r = system_supports_mte();
+		break;
 	case KVM_CAP_STEAL_TIME:
 		r = kvm_arm_pvtime_supported();
 		break;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1a01da9fdc99..014a7ab7c2e7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -877,6 +877,22 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (vma_pagesize == PAGE_SIZE && !force_pte)
 		vma_pagesize = transparent_hugepage_adjust(memslot, hva,
 							   &pfn, &fault_ipa);
+
+	if (kvm_has_mte(kvm) && pfn_valid(pfn)) {
+		/*
+		 * VM will be able to see the page's tags, so we must ensure
+		 * they have been initialised.
+		 */
+		struct page *page = pfn_to_page(pfn);
+		long i, nr_pages = compound_nr(page);
+
+		/* if PG_mte_tagged is set, tags have already been initialised */
+		for (i = 0; i < nr_pages; i++, page++) {
+			if (!test_and_set_bit(PG_mte_tagged, &page->flags))
+				mte_clear_page_tags(page_address(page));
+		}
+	}
+
 	if (writable) {
 		prot |= KVM_PGTABLE_PROT_W;
 		kvm_set_pfn_dirty(pfn);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 4792d5249f07..469b0ef3eb07 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1123,7 +1123,8 @@ static u64 read_id_reg(const struct kvm_vcpu *vcpu,
 		val &= ~(0xfUL << ID_AA64PFR0_CSV2_SHIFT);
 		val |= ((u64)vcpu->kvm->arch.pfr0_csv2 << ID_AA64PFR0_CSV2_SHIFT);
 	} else if (id == SYS_ID_AA64PFR1_EL1) {
-		val &= ~(0xfUL << ID_AA64PFR1_MTE_SHIFT);
+		if (!kvm_has_mte(vcpu->kvm))
+			val &= ~(0xfUL << ID_AA64PFR1_MTE_SHIFT);
 	} else if (id == SYS_ID_AA64ISAR1_EL1 && !vcpu_has_ptrauth(vcpu)) {
 		val &= ~((0xfUL << ID_AA64ISAR1_APA_SHIFT) |
 			 (0xfUL << ID_AA64ISAR1_API_SHIFT) |
@@ -1369,6 +1370,9 @@ static bool access_ccsidr(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 static unsigned int mte_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *rd)
 {
+	if (kvm_has_mte(vcpu->kvm))
+		return 0;
+
 	return REG_HIDDEN;
 }
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index ca41220b40b8..3e6fb5b580a9 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1053,6 +1053,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_X86_USER_SPACE_MSR 188
 #define KVM_CAP_X86_MSR_FILTER 189
 #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
+#define KVM_CAP_ARM_MTE 191
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.20.1



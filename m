Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17283AE812
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:22:51 +0200 (CEST)
Received: from localhost ([::1]:50816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvI0w-0005u0-Sl
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lvHws-0000ED-6E
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:18:38 -0400
Received: from foss.arm.com ([217.140.110.172]:53714)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lvHwp-0001aZ-9S
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:18:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 656BAED1;
 Mon, 21 Jun 2021 04:18:33 -0700 (PDT)
Received: from e112269-lin.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A81E63F718;
 Mon, 21 Jun 2021 04:18:30 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v17 2/6] KVM: arm64: Introduce MTE VM feature
Date: Mon, 21 Jun 2021 12:17:12 +0100
Message-Id: <20210621111716.37157-3-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621111716.37157-1-steven.price@arm.com>
References: <20210621111716.37157-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
 Andrew Jones <drjones@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 qemu-devel@nongnu.org, Dave Martin <Dave.Martin@arm.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>, James Morse <james.morse@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new VM feature 'KVM_ARM_CAP_MTE' which enables memory tagging
for a VM. This will expose the feature to the guest and automatically
tag memory pages touched by the VM as PG_mte_tagged (and clear the tag
storage) to ensure that the guest cannot see stale tags, and so that
the tags are correctly saved/restored across swap.

Actually exposing the new capability to user space happens in a later
patch.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/include/asm/kvm_emulate.h |  3 ++
 arch/arm64/include/asm/kvm_host.h    |  3 ++
 arch/arm64/kvm/hyp/exception.c       |  3 +-
 arch/arm64/kvm/mmu.c                 | 64 +++++++++++++++++++++++++++-
 arch/arm64/kvm/sys_regs.c            |  7 +++
 include/uapi/linux/kvm.h             |  1 +
 6 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 01b9857757f2..fd418955e31e 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -84,6 +84,9 @@ static inline void vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 	if (cpus_have_const_cap(ARM64_MISMATCHED_CACHE_TYPE) ||
 	    vcpu_el1_is_32bit(vcpu))
 		vcpu->arch.hcr_el2 |= HCR_TID2;
+
+	if (kvm_has_mte(vcpu->kvm))
+		vcpu->arch.hcr_el2 |= HCR_ATA;
 }
 
 static inline unsigned long *vcpu_hcr(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7cd7d5c8c4bc..afaa5333f0e4 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -132,6 +132,8 @@ struct kvm_arch {
 
 	u8 pfr0_csv2;
 	u8 pfr0_csv3;
+	/* Memory Tagging Extension enabled for the guest */
+	bool mte_enabled;
 };
 
 struct kvm_vcpu_fault_info {
@@ -769,6 +771,7 @@ bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
 #define kvm_arm_vcpu_sve_finalized(vcpu) \
 	((vcpu)->arch.flags & KVM_ARM64_VCPU_SVE_FINALIZED)
 
+#define kvm_has_mte(kvm) (system_supports_mte() && (kvm)->arch.mte_enabled)
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(test_bit(KVM_ARM_VCPU_PMU_V3, (vcpu)->arch.features))
 
diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
index 11541b94b328..0418399e0a20 100644
--- a/arch/arm64/kvm/hyp/exception.c
+++ b/arch/arm64/kvm/hyp/exception.c
@@ -112,7 +112,8 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
 	new |= (old & PSR_C_BIT);
 	new |= (old & PSR_V_BIT);
 
-	// TODO: TCO (if/when ARMv8.5-MemTag is exposed to guests)
+	if (kvm_has_mte(vcpu->kvm))
+		new |= PSR_TCO_BIT;
 
 	new |= (old & PSR_DIT_BIT);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c10207fed2f3..52326b739357 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -822,6 +822,45 @@ transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
 	return PAGE_SIZE;
 }
 
+/*
+ * The page will be mapped in stage 2 as Normal Cacheable, so the VM will be
+ * able to see the page's tags and therefore they must be initialised first. If
+ * PG_mte_tagged is set, tags have already been initialised.
+ *
+ * The race in the test/set of the PG_mte_tagged flag is handled by:
+ * - preventing VM_SHARED mappings in a memslot with MTE preventing two VMs
+ *   racing to santise the same page
+ * - mmap_lock protects between a VM faulting a page in and the VMM performing
+ *   an mprotect() to add VM_MTE
+ */
+static int sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
+			     unsigned long size)
+{
+	unsigned long i, nr_pages = size >> PAGE_SHIFT;
+	struct page *page;
+
+	if (!kvm_has_mte(kvm))
+		return 0;
+
+	/*
+	 * pfn_to_online_page() is used to reject ZONE_DEVICE pages
+	 * that may not support tags.
+	 */
+	page = pfn_to_online_page(pfn);
+
+	if (!page)
+		return -EFAULT;
+
+	for (i = 0; i < nr_pages; i++, page++) {
+		if (!test_bit(PG_mte_tagged, &page->flags)) {
+			mte_clear_page_tags(page_address(page));
+			set_bit(PG_mte_tagged, &page->flags);
+		}
+	}
+
+	return 0;
+}
+
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_memory_slot *memslot, unsigned long hva,
 			  unsigned long fault_status)
@@ -971,8 +1010,18 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (writable)
 		prot |= KVM_PGTABLE_PROT_W;
 
-	if (fault_status != FSC_PERM && !device)
+	if (fault_status != FSC_PERM && !device) {
+		/* Check the VMM hasn't introduced a new VM_SHARED VMA */
+		if (kvm_has_mte(kvm) && vma->vm_flags & VM_SHARED) {
+			ret = -EFAULT;
+			goto out_unlock;
+		}
+		ret = sanitise_mte_tags(kvm, pfn, vma_pagesize);
+		if (ret)
+			goto out_unlock;
+
 		clean_dcache_guest_page(pfn, vma_pagesize);
+	}
 
 	if (exec_fault) {
 		prot |= KVM_PGTABLE_PROT_X;
@@ -1168,12 +1217,17 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	kvm_pfn_t pfn = pte_pfn(range->pte);
+	int ret;
 
 	if (!kvm->arch.mmu.pgt)
 		return false;
 
 	WARN_ON(range->end - range->start != 1);
 
+	ret = sanitise_mte_tags(kvm, pfn, PAGE_SIZE);
+	if (ret)
+		return false;
+
 	/*
 	 * We've moved a page around, probably through CoW, so let's treat it
 	 * just like a translation fault and clean the cache to the PoC.
@@ -1381,6 +1435,14 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 		if (!vma)
 			break;
 
+		/*
+		 * VM_SHARED mappings are not allowed with MTE to avoid races
+		 * when updating the PG_mte_tagged page flag, see
+		 * sanitise_mte_tags for more details.
+		 */
+		if (kvm_has_mte(kvm) && vma->vm_flags & VM_SHARED)
+			return -EINVAL;
+
 		/*
 		 * Take the intersection of this VMA with the memory region
 		 */
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 1a7968ad078c..36f67f8deae1 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1047,6 +1047,13 @@ static u64 read_id_reg(const struct kvm_vcpu *vcpu,
 		break;
 	case SYS_ID_AA64PFR1_EL1:
 		val &= ~FEATURE(ID_AA64PFR1_MTE);
+		if (kvm_has_mte(vcpu->kvm)) {
+			u64 pfr, mte;
+
+			pfr = read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1);
+			mte = cpuid_feature_extract_unsigned_field(pfr, ID_AA64PFR1_MTE_SHIFT);
+			val |= FIELD_PREP(FEATURE(ID_AA64PFR1_MTE), mte);
+		}
 		break;
 	case SYS_ID_AA64ISAR1_EL1:
 		if (!vcpu_has_ptrauth(vcpu))
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 79d9c44d1ad7..d4da58ddcad7 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1083,6 +1083,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_SGX_ATTRIBUTE 196
 #define KVM_CAP_VM_COPY_ENC_CONTEXT_FROM 197
 #define KVM_CAP_PTP_KVM 198
+#define KVM_CAP_ARM_MTE 199
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.20.1



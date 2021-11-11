Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9358F44D820
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:17:59 +0100 (CET)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlAtq-000385-Ns
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:17:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlArN-0008Eo-Tf
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:15:25 -0500
Received: from mga01.intel.com ([192.55.52.88]:20930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlArH-0006Rx-Re
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:15:22 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="256621595"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="256621595"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 06:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="492555477"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 11 Nov 2021 06:15:01 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC PATCH 2/6] kvm: x86: Introduce guest private memory address
 space to memslot
Date: Thu, 11 Nov 2021 22:13:41 +0800
Message-Id: <20211111141352.26311-3-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
References: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 david@redhat.com, "J . Bruce Fields" <bfields@fieldses.org>,
 dave.hansen@intel.com, "H . Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Existing memslots functions are extended to pass a bool ‘private’
parameter to indicate whether the operation is on guest private memory
address space or not.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 arch/x86/include/asm/kvm_host.h |  5 +++--
 arch/x86/include/uapi/asm/kvm.h |  4 ++++
 arch/x86/kvm/mmu/mmu.c          |  2 +-
 include/linux/kvm_host.h        | 23 ++++++++++++++++++++---
 virt/kvm/kvm_main.c             |  9 ++++++++-
 5 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 20dfcdd20e81..048089883650 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1741,9 +1741,10 @@ enum {
 #define HF_SMM_INSIDE_NMI_MASK	(1 << 7)
 
 #define __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
-#define KVM_ADDRESS_SPACE_NUM 2
+#define KVM_ADDRESS_SPACE_NUM 3
 
-#define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
+#define kvm_arch_vcpu_memslots_id(vcpu, private)	\
+	(((vcpu)->arch.hflags & HF_SMM_MASK) ? 1 : (!!private) << 1)
 #define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
 
 asmlinkage void kvm_spurious_fault(void);
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 47bc1a0df5ee..65189cfd3837 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -53,6 +53,10 @@
 /* Architectural interrupt line count. */
 #define KVM_NR_INTERRUPTS 256
 
+#define KVM_DEFAULT_ADDRESS_SPACE	0
+#define KVM_SMM_ADDRESS_SPACE		1
+#define KVM_PRIVATE_ADDRESS_SPACE	2
+
 struct kvm_memory_alias {
 	__u32 slot;  /* this has a different namespace than memory slots */
 	__u32 flags;
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 79d4ae465a96..8483c15eac6f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3938,7 +3938,7 @@ static bool try_async_pf(struct kvm_vcpu *vcpu, bool prefault, gfn_t gfn,
 		return false;
 	}
 
-	/* Don't expose private memslots to L2. */
+	/* Don't expose KVM's internal memslots to L2. */
 	if (is_guest_mode(vcpu) && !kvm_is_visible_memslot(slot)) {
 		*pfn = KVM_PFN_NOSLOT;
 		*writable = false;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 597841fe3d7a..8e5b197230ed 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -442,7 +442,7 @@ struct kvm_irq_routing_table {
 #define KVM_USER_MEM_SLOTS (KVM_MEM_SLOTS_NUM - KVM_PRIVATE_MEM_SLOTS)
 
 #ifndef __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
-static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
+static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu, bool private)
 {
 	return 0;
 }
@@ -699,13 +699,19 @@ static inline struct kvm_memslots *kvm_memslots(struct kvm *kvm)
 	return __kvm_memslots(kvm, 0);
 }
 
-static inline struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu)
+static inline struct kvm_memslots *__kvm_vcpu_memslots(struct kvm_vcpu *vcpu,
+						       bool private)
 {
-	int as_id = kvm_arch_vcpu_memslots_id(vcpu);
+	int as_id = kvm_arch_vcpu_memslots_id(vcpu, private);
 
 	return __kvm_memslots(vcpu->kvm, as_id);
 }
 
+static inline struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu)
+{
+	return __kvm_vcpu_memslots(vcpu, false);
+}
+
 static inline
 struct kvm_memory_slot *id_to_memslot(struct kvm_memslots *slots, int id)
 {
@@ -721,6 +727,15 @@ struct kvm_memory_slot *id_to_memslot(struct kvm_memslots *slots, int id)
 	return slot;
 }
 
+static inline bool memslot_is_private(const struct kvm_memory_slot *slot)
+{
+#ifdef KVM_PRIVATE_ADDRESS_SPACE
+	return slot && slot->as_id == KVM_PRIVATE_ADDRESS_SPACE;
+#else
+	return false;
+#endif
+}
+
 /*
  * KVM_SET_USER_MEMORY_REGION ioctl allows the following operations:
  * - create a new memory slot
@@ -860,6 +875,8 @@ void mark_page_dirty_in_slot(struct kvm *kvm, struct kvm_memory_slot *memslot, g
 void mark_page_dirty(struct kvm *kvm, gfn_t gfn);
 
 struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
+struct kvm_memory_slot *__kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu,
+						  gfn_t gfn, bool private);
 struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn_t gfn);
 kvm_pfn_t kvm_vcpu_gfn_to_pfn_atomic(struct kvm_vcpu *vcpu, gfn_t gfn);
 kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8815218630dc..fe62df334054 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1721,9 +1721,16 @@ struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(gfn_to_memslot);
 
+struct kvm_memory_slot *__kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu,
+						  gfn_t gfn, bool private)
+{
+	return __gfn_to_memslot(__kvm_vcpu_memslots(vcpu, private), gfn);
+}
+EXPORT_SYMBOL_GPL(__kvm_vcpu_gfn_to_memslot);
+
 struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn_t gfn)
 {
-	return __gfn_to_memslot(kvm_vcpu_memslots(vcpu), gfn);
+	return __kvm_vcpu_gfn_to_memslot(vcpu, gfn, false);
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_memslot);
 
-- 
2.17.1



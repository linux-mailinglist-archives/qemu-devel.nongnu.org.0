Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C43B52D8B4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:47:20 +0200 (CEST)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nriMx-0000Q1-HT
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nriHl-0002BQ-Ez
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:41:57 -0400
Received: from mga01.intel.com ([192.55.52.88]:58528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nriHj-0000jI-C9
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652974915; x=1684510915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xibCq6JJQorznQt92fCArgufvi2t+qiQBqRcvVaVpXo=;
 b=iyQlL5mmCHX7c8njEsCNJkuYFwVnGORGiTJO9+gRIBmtraGC8oWpyPPf
 zLmlbz0ToJ+9mj8ycX97GIc8E612h5dRCEVv9qwQcP5HheZtZJmx04wOO
 AiyoDFbbcYNgYjaJEZnvcKtW7qNKIttegf0uwZkR8rCFM18TX8iYKeCAU
 CmQgm+6exfnvt3kPi1zyVs7QIGL1qZquCfqa0mtRDBuQ6ZErkwxhD9yl4
 3Dxg7gfgjPACCAqQEB+ERu/OimlKpdEHquB2o8H633ogfo2UaQcVkRWZj
 iVPoOAaJqC1NMkA1sSBubtpL1ZPUGEq4Y0EMTAuDJa0yCzkDfWw89YHu9 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="297554316"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="297554316"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 08:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="598635417"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 19 May 2022 08:41:43 -0700
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: [PATCH v6 6/8] KVM: Handle page fault for private memory
Date: Thu, 19 May 2022 23:37:11 +0800
Message-Id: <20220519153713.819591-7-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

A page fault can carry the information of whether the access if private
or not for KVM_MEM_PRIVATE memslot, this can be filled by architecture
code(like TDX code). To handle page faut for such access, KVM maps the
page only when this private property matches host's view on this page
which can be decided by checking whether the corresponding page is
populated in the private fd or not. A page is considered as private when
the page is populated in the private fd, otherwise it's shared.

For a successful match, private pfn is obtained with memfile_notifier
callbacks from private fd and shared pfn is obtained with existing
get_user_pages.

For a failed match, KVM causes a KVM_EXIT_MEMORY_FAULT exit to
userspace. Userspace then can convert memory between private/shared from
host's view then retry the access.

Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 arch/x86/kvm/mmu.h              |  1 +
 arch/x86/kvm/mmu/mmu.c          | 70 +++++++++++++++++++++++++++++++--
 arch/x86/kvm/mmu/mmu_internal.h | 17 ++++++++
 arch/x86/kvm/mmu/mmutrace.h     |  1 +
 arch/x86/kvm/mmu/paging_tmpl.h  |  5 ++-
 include/linux/kvm_host.h        | 22 +++++++++++
 6 files changed, 112 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index 7e258cc94152..c84835762249 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -176,6 +176,7 @@ struct kvm_page_fault {
 
 	/* Derived from mmu and global state.  */
 	const bool is_tdp;
+	const bool is_private;
 	const bool nx_huge_page_workaround_enabled;
 
 	/*
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index afe18d70ece7..e18460e0d743 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2899,6 +2899,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
 	if (max_level == PG_LEVEL_4K)
 		return PG_LEVEL_4K;
 
+	if (kvm_slot_is_private(slot))
+		return max_level;
+
 	host_level = host_pfn_mapping_level(kvm, gfn, pfn, slot);
 	return min(host_level, max_level);
 }
@@ -3948,10 +3951,54 @@ static bool kvm_arch_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 				  kvm_vcpu_gfn_to_hva(vcpu, gfn), &arch);
 }
 
+static inline u8 order_to_level(int order)
+{
+	enum pg_level level;
+
+	for (level = KVM_MAX_HUGEPAGE_LEVEL; level > PG_LEVEL_4K; level--)
+		if (order >= page_level_shift(level) - PAGE_SHIFT)
+			return level;
+	return level;
+}
+
+static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
+				   struct kvm_page_fault *fault)
+{
+	int order;
+	struct kvm_memory_slot *slot = fault->slot;
+	bool private_exist = !kvm_private_mem_get_pfn(slot, fault->gfn,
+						      &fault->pfn, &order);
+
+	if (fault->is_private != private_exist) {
+		if (private_exist)
+			kvm_private_mem_put_pfn(slot, fault->pfn);
+
+		vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
+		if (fault->is_private)
+			vcpu->run->memory.flags = KVM_MEMORY_EXIT_FLAG_PRIVATE;
+		else
+			vcpu->run->memory.flags = 0;
+		vcpu->run->memory.padding = 0;
+		vcpu->run->memory.gpa = fault->gfn << PAGE_SHIFT;
+		vcpu->run->memory.size = PAGE_SIZE;
+		return RET_PF_USER;
+	}
+
+	if (fault->is_private) {
+		fault->max_level = min(order_to_level(order), fault->max_level);
+		fault->map_writable = !(slot->flags & KVM_MEM_READONLY);
+		return RET_PF_FIXED;
+	}
+
+	/* Fault is shared, fallthrough to the standard path. */
+	return RET_PF_CONTINUE;
+}
+
 static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
 	struct kvm_memory_slot *slot = fault->slot;
 	bool async;
+	int r;
 
 	/*
 	 * Retry the page fault if the gfn hit a memslot that is being deleted
@@ -3980,6 +4027,12 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 			return RET_PF_EMULATE;
 	}
 
+	if (kvm_slot_is_private(slot)) {
+		r = kvm_faultin_pfn_private(vcpu, fault);
+		if (r != RET_PF_CONTINUE)
+			return r == RET_PF_FIXED ? RET_PF_CONTINUE : r;
+	}
+
 	async = false;
 	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, &async,
 					  fault->write, &fault->map_writable,
@@ -4028,8 +4081,11 @@ static bool is_page_fault_stale(struct kvm_vcpu *vcpu,
 	if (!sp && kvm_test_request(KVM_REQ_MMU_FREE_OBSOLETE_ROOTS, vcpu))
 		return true;
 
-	return fault->slot &&
-	       mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, fault->hva);
+	if (fault->is_private)
+		return mmu_notifier_retry(vcpu->kvm, mmu_seq);
+	else
+		return fault->slot &&
+			mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, fault->hva);
 }
 
 static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
@@ -4088,7 +4144,12 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 		read_unlock(&vcpu->kvm->mmu_lock);
 	else
 		write_unlock(&vcpu->kvm->mmu_lock);
-	kvm_release_pfn_clean(fault->pfn);
+
+	if (fault->is_private)
+		kvm_private_mem_put_pfn(fault->slot, fault->pfn);
+	else
+		kvm_release_pfn_clean(fault->pfn);
+
 	return r;
 }
 
@@ -5372,6 +5433,9 @@ int kvm_mmu_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa, u64 error_code,
 			return -EIO;
 	}
 
+	if (r == RET_PF_USER)
+		return 0;
+
 	if (r < 0)
 		return r;
 	if (r != RET_PF_EMULATE)
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index c0e502b17ef7..14932cf97655 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -147,6 +147,7 @@ unsigned int pte_list_count(struct kvm_rmap_head *rmap_head);
  * RET_PF_RETRY: let CPU fault again on the address.
  * RET_PF_EMULATE: mmio page fault, emulate the instruction directly.
  * RET_PF_INVALID: the spte is invalid, let the real page fault path update it.
+ * RET_PF_USER: need to exit to userspace to handle this fault.
  * RET_PF_FIXED: The faulting entry has been fixed.
  * RET_PF_SPURIOUS: The faulting entry was already fixed, e.g. by another vCPU.
  *
@@ -163,6 +164,7 @@ enum {
 	RET_PF_RETRY,
 	RET_PF_EMULATE,
 	RET_PF_INVALID,
+	RET_PF_USER,
 	RET_PF_FIXED,
 	RET_PF_SPURIOUS,
 };
@@ -178,4 +180,19 @@ void *mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
 void account_huge_nx_page(struct kvm *kvm, struct kvm_mmu_page *sp);
 void unaccount_huge_nx_page(struct kvm *kvm, struct kvm_mmu_page *sp);
 
+#ifndef CONFIG_HAVE_KVM_PRIVATE_MEM
+static inline int kvm_private_mem_get_pfn(struct kvm_memory_slot *slot,
+					  gfn_t gfn, kvm_pfn_t *pfn, int *order)
+{
+	WARN_ON_ONCE(1);
+	return -EOPNOTSUPP;
+}
+
+static inline void kvm_private_mem_put_pfn(struct kvm_memory_slot *slot,
+					   kvm_pfn_t pfn)
+{
+	WARN_ON_ONCE(1);
+}
+#endif /* CONFIG_HAVE_KVM_PRIVATE_MEM */
+
 #endif /* __KVM_X86_MMU_INTERNAL_H */
diff --git a/arch/x86/kvm/mmu/mmutrace.h b/arch/x86/kvm/mmu/mmutrace.h
index ae86820cef69..2d7555381955 100644
--- a/arch/x86/kvm/mmu/mmutrace.h
+++ b/arch/x86/kvm/mmu/mmutrace.h
@@ -58,6 +58,7 @@ TRACE_DEFINE_ENUM(RET_PF_CONTINUE);
 TRACE_DEFINE_ENUM(RET_PF_RETRY);
 TRACE_DEFINE_ENUM(RET_PF_EMULATE);
 TRACE_DEFINE_ENUM(RET_PF_INVALID);
+TRACE_DEFINE_ENUM(RET_PF_USER);
 TRACE_DEFINE_ENUM(RET_PF_FIXED);
 TRACE_DEFINE_ENUM(RET_PF_SPURIOUS);
 
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index 7f8f1c8dbed2..1d857919a947 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -878,7 +878,10 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 
 out_unlock:
 	write_unlock(&vcpu->kvm->mmu_lock);
-	kvm_release_pfn_clean(fault->pfn);
+	if (fault->is_private)
+		kvm_private_mem_put_pfn(fault->slot, fault->pfn);
+	else
+		kvm_release_pfn_clean(fault->pfn);
 	return r;
 }
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3fd168972ecd..b0a7910505ed 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2241,4 +2241,26 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
+#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
+static inline int kvm_private_mem_get_pfn(struct kvm_memory_slot *slot,
+					  gfn_t gfn, kvm_pfn_t *pfn, int *order)
+{
+	int ret;
+	pfn_t pfnt;
+	pgoff_t index = gfn - slot->base_gfn +
+			(slot->private_offset >> PAGE_SHIFT);
+
+	ret = slot->notifier.bs->get_lock_pfn(slot->private_file, index, &pfnt,
+						order);
+	*pfn = pfn_t_to_pfn(pfnt);
+	return ret;
+}
+
+static inline void kvm_private_mem_put_pfn(struct kvm_memory_slot *slot,
+					   kvm_pfn_t pfn)
+{
+	slot->notifier.bs->put_unlock_pfn(pfn_to_pfn_t(pfn));
+}
+#endif /* CONFIG_HAVE_KVM_PRIVATE_MEM */
+
 #endif
-- 
2.25.1



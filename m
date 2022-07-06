Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4493D5683BA
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:41:05 +0200 (CEST)
Received: from localhost ([::1]:35130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91Wq-0008QQ-BO
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o90MJ-00072Y-6c
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:26:09 -0400
Received: from mga02.intel.com ([134.134.136.20]:45637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o90MH-0000pq-68
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657095965; x=1688631965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uyXuuswsm4FBC92XS6UZc5YOiOshhz238zDGx3OfAMA=;
 b=c3ybBoAlHJbAhMx4ffQs1hnv3kf4xcUsKGdYHDZKlLfSZKVOc/tVXiZI
 cFtKiNzeaVEQ86sfP14Ju0uN4vVj34KdcOtnKw/HZqM8WSFnv2L3nn+/3
 3QE40tCfBdiwamE4mnggLQSxUicpMP1FNqj7Kvu2jfNbDnRVk3iY5HKV2
 P/34M+6CUvb84VUNxgngBrBx/e2RSWoeA/uZ73GGw8fqoFehSVYjQCCo2
 sSa61xUjX2YXPW8nO3JyyoZtTUoaKj8+ef4Zc65BhN2cMV2Er2z/ZaH7x
 0AR0p1bR4vyuuDe9FvxXxFxKT6fqdpuzuOngb08OXwg2HZfAw/I/JoZz3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="272467309"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="272467309"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 01:26:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="567968257"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga006.jf.intel.com with ESMTP; 06 Jul 2022 01:25:51 -0700
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 12/14] KVM: Handle page fault for private memory
Date: Wed,  6 Jul 2022 16:20:14 +0800
Message-Id: <20220706082016.2603916-13-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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

A page fault can carry the private/shared information for
KVM_MEM_PRIVATE memslot, this can be filled by architecture code(like
TDX code). To handle page fault for such access, KVM maps the page only
when this private property matches the host's view on the page.

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
 arch/x86/kvm/mmu/mmu.c          | 60 ++++++++++++++++++++++++++++++++-
 arch/x86/kvm/mmu/mmu_internal.h | 18 ++++++++++
 arch/x86/kvm/mmu/mmutrace.h     |  1 +
 include/linux/kvm_host.h        | 35 ++++++++++++++++++-
 4 files changed, 112 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 545eb74305fe..27dbdd4fe8d1 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3004,6 +3004,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
 	if (max_level == PG_LEVEL_4K)
 		return PG_LEVEL_4K;
 
+	if (kvm_mem_is_private(kvm, gfn))
+		return max_level;
+
 	host_level = host_pfn_mapping_level(kvm, gfn, pfn, slot);
 	return min(host_level, max_level);
 }
@@ -4101,10 +4104,52 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
 	kvm_mmu_do_page_fault(vcpu, work->cr2_or_gpa, 0, true);
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
+	bool private_exist = kvm_mem_is_private(vcpu->kvm, fault->gfn);
+
+	if (fault->is_private != private_exist) {
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
+		if (kvm_private_mem_get_pfn(slot, fault->gfn, &fault->pfn, &order))
+			return RET_PF_RETRY;
+		fault->max_level = min(order_to_level(order), fault->max_level);
+		fault->map_writable = !(slot->flags & KVM_MEM_READONLY);
+		return RET_PF_FIXED;
+	}
+
+	/* Fault is shared, fallthrough. */
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
@@ -4133,6 +4178,12 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 			return RET_PF_EMULATE;
 	}
 
+	if (kvm_slot_can_be_private(slot)) {
+		r = kvm_faultin_pfn_private(vcpu, fault);
+		if (r != RET_PF_CONTINUE)
+			return r == RET_PF_FIXED ? RET_PF_CONTINUE : r;
+	}
+
 	async = false;
 	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, &async,
 					  fault->write, &fault->map_writable,
@@ -4241,7 +4292,11 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 		read_unlock(&vcpu->kvm->mmu_lock);
 	else
 		write_unlock(&vcpu->kvm->mmu_lock);
-	kvm_release_pfn_clean(fault->pfn);
+
+	if (fault->is_private)
+		kvm_private_mem_put_pfn(fault->slot, fault->pfn);
+	else
+		kvm_release_pfn_clean(fault->pfn);
 	return r;
 }
 
@@ -5518,6 +5573,9 @@ int noinline kvm_mmu_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa, u64 err
 			return -EIO;
 	}
 
+	if (r == RET_PF_USER)
+		return 0;
+
 	if (r < 0)
 		return r;
 	if (r != RET_PF_EMULATE)
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index ae2d660e2dab..fb9c298abcf0 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -188,6 +188,7 @@ struct kvm_page_fault {
 
 	/* Derived from mmu and global state.  */
 	const bool is_tdp;
+	const bool is_private;
 	const bool nx_huge_page_workaround_enabled;
 
 	/*
@@ -236,6 +237,7 @@ int kvm_tdp_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault);
  * RET_PF_RETRY: let CPU fault again on the address.
  * RET_PF_EMULATE: mmio page fault, emulate the instruction directly.
  * RET_PF_INVALID: the spte is invalid, let the real page fault path update it.
+ * RET_PF_USER: need to exit to userspace to handle this fault.
  * RET_PF_FIXED: The faulting entry has been fixed.
  * RET_PF_SPURIOUS: The faulting entry was already fixed, e.g. by another vCPU.
  *
@@ -252,6 +254,7 @@ enum {
 	RET_PF_RETRY,
 	RET_PF_EMULATE,
 	RET_PF_INVALID,
+	RET_PF_USER,
 	RET_PF_FIXED,
 	RET_PF_SPURIOUS,
 };
@@ -318,4 +321,19 @@ void *mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
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
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index da33f8828456..8f56426aa1e3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -778,6 +778,10 @@ struct kvm {
 
 #if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
 	struct mmu_notifier mmu_notifier;
+#endif
+
+#if (defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)) || \
+	defined(CONFIG_MEMFILE_NOTIFIER)
 	unsigned long mmu_updating_seq;
 	long mmu_updating_count;
 	gfn_t mmu_updating_range_start;
@@ -1917,7 +1921,8 @@ extern const struct _kvm_stats_desc kvm_vm_stats_desc[];
 extern const struct kvm_stats_header kvm_vcpu_stats_header;
 extern const struct _kvm_stats_desc kvm_vcpu_stats_desc[];
 
-#if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+#if (defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)) || \
+	defined(CONFIG_MEMFILE_NOTIFIER)
 static inline int mmu_updating_retry(struct kvm *kvm, unsigned long mmu_seq)
 {
 	if (unlikely(kvm->mmu_updating_count))
@@ -2266,4 +2271,32 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
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
+	ret = slot->notifier.bs->get_pfn(slot->private_file, index, &pfnt,
+					 order);
+	*pfn = pfn_t_to_pfn(pfnt);
+	return ret;
+}
+
+static inline void kvm_private_mem_put_pfn(struct kvm_memory_slot *slot,
+					   kvm_pfn_t pfn)
+{
+	slot->notifier.bs->put_pfn(pfn_to_pfn_t(pfn));
+}
+
+static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
+{
+	return !!xa_load(&kvm->mem_attr_array, gfn);
+}
+
+#endif /* CONFIG_HAVE_KVM_PRIVATE_MEM */
+
 #endif
-- 
2.25.1



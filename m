Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6F047C2CF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 16:29:17 +0100 (CET)
Received: from localhost ([::1]:45626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzh4m-0005Pm-5D
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 10:29:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzgpP-0008S4-60
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:13:23 -0500
Received: from mga07.intel.com ([134.134.136.100]:46550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzgpM-0008JP-R8
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:13:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640099601; x=1671635601;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=fdSTZmNU5WiLyWiykXl851QB1KBby9LMRNODzJD3mcE=;
 b=L4IQuXP2cn/ptRd7iWNoPu5TfcFlGnBLHDaAIy6ddlmqdpON3eHhpfSz
 re3WgYq5+8pasaUgI5TJSNoJ3+xPhmGtG4QYTDPqo/r6G/3r0LE3J5Q5K
 pBPxdmUY9f8H2K7gKg+AGbbi0T/pgfaHiL8XB5YrP26SPuf9ut/QE1RCP
 AILQbd5+MYwWPTRQL90Ji/0nHfg/BbXd5YC7v/22rTbqLse4IM9fV6jjk
 JnKq+KSxF9DxgYOHP8nt/B19GmrrQXuRmskQ68G/whVIbQ1Rs1qxdvy/1
 HDotcXv98nY7IzBJIWDT0VuOeFmtjjCaEE3hvlSnr2Y2/gDmrTn1nuPM8 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="303779857"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="303779857"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 07:13:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="684688531"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga005.jf.intel.com with ESMTP; 21 Dec 2021 07:13:10 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 09/15] KVM: Implement fd-based memory invalidation
Date: Tue, 21 Dec 2021 23:11:19 +0800
Message-Id: <20211221151125.19446-10-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
References: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

KVM gets notified when userspace punches a hole in a fd which is used
for guest memory. KVM should invalidate the mapping in the second MMU
page tables. This is the same logic as MMU notifier invalidation except
the fd related information is carried around to indicate the memory
range. KVM hence can reuse most of existing MMU notifier invalidation
code including looping through the memslots and then calling into
kvm_unmap_gfn_range() which should do whatever needed for fd-based
memory unmapping (e.g. for private memory managed by TDX it may need
call into SEAM-MODULE).

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/kvm_host.h |  8 ++++-
 virt/kvm/kvm_main.c      | 69 +++++++++++++++++++++++++++++++---------
 virt/kvm/memfd.c         |  2 ++
 3 files changed, 63 insertions(+), 16 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7279f46f35d3..d9573305e273 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -229,7 +229,7 @@ bool kvm_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #endif
 
-#ifdef KVM_ARCH_WANT_MMU_NOTIFIER
+#if defined(KVM_ARCH_WANT_MMU_NOTIFIER) || defined(CONFIG_MEMFD_OPS)
 struct kvm_gfn_range {
 	struct kvm_memory_slot *slot;
 	gfn_t start;
@@ -1874,4 +1874,10 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
+#ifdef CONFIG_MEMFD_OPS
+int kvm_memfd_invalidate_range(struct kvm *kvm, struct inode *inode,
+			       unsigned long start, unsigned long end);
+#endif /* CONFIG_MEMFD_OPS */
+
+
 #endif
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 59f01e68337b..d84cb867b686 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -453,7 +453,8 @@ void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_destroy);
 
-#if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+#if defined(CONFIG_MEMFD_OPS) ||\
+	(defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER))
 
 typedef bool (*gfn_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
 
@@ -564,6 +565,30 @@ static __always_inline int __kvm_handle_useraddr_range(struct kvm *kvm,
 	/* The notifiers are averse to booleans. :-( */
 	return (int)ret;
 }
+
+static void mn_active_invalidate_count_inc(struct kvm *kvm)
+{
+	spin_lock(&kvm->mn_invalidate_lock);
+	kvm->mn_active_invalidate_count++;
+	spin_unlock(&kvm->mn_invalidate_lock);
+
+}
+
+static void mn_active_invalidate_count_dec(struct kvm *kvm)
+{
+	bool wake;
+
+	spin_lock(&kvm->mn_invalidate_lock);
+	wake = (--kvm->mn_active_invalidate_count == 0);
+	spin_unlock(&kvm->mn_invalidate_lock);
+
+	/*
+	 * There can only be one waiter, since the wait happens under
+	 * slots_lock.
+	 */
+	if (wake)
+		rcuwait_wake_up(&kvm->mn_memslots_update_rcuwait);
+}
 #endif
 
 #if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
@@ -701,9 +726,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 	 *
 	 * Pairs with the decrement in range_end().
 	 */
-	spin_lock(&kvm->mn_invalidate_lock);
-	kvm->mn_active_invalidate_count++;
-	spin_unlock(&kvm->mn_invalidate_lock);
+	mn_active_invalidate_count_inc(kvm);
 
 	__kvm_handle_useraddr_range(kvm, &useraddr_range);
 
@@ -742,21 +765,11 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 		.may_block	= mmu_notifier_range_blockable(range),
 		.inode		= NULL,
 	};
-	bool wake;
 
 	__kvm_handle_useraddr_range(kvm, &useraddr_range);
 
 	/* Pairs with the increment in range_start(). */
-	spin_lock(&kvm->mn_invalidate_lock);
-	wake = (--kvm->mn_active_invalidate_count == 0);
-	spin_unlock(&kvm->mn_invalidate_lock);
-
-	/*
-	 * There can only be one waiter, since the wait happens under
-	 * slots_lock.
-	 */
-	if (wake)
-		rcuwait_wake_up(&kvm->mn_memslots_update_rcuwait);
+	mn_active_invalidate_count_dec(kvm);
 
 	BUG_ON(kvm->mmu_notifier_count < 0);
 }
@@ -841,6 +854,32 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
 
 #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
 
+#ifdef CONFIG_MEMFD_OPS
+int kvm_memfd_invalidate_range(struct kvm *kvm, struct inode *inode,
+			       unsigned long start, unsigned long end)
+{
+	int ret;
+	const struct kvm_useraddr_range useraddr_range = {
+		.start		= start,
+		.end		= end,
+		.pte		= __pte(0),
+		.handler	= kvm_unmap_gfn_range,
+		.on_lock	= (void *)kvm_null_fn,
+		.flush_on_ret	= true,
+		.may_block	= false,
+		.inode		= inode,
+	};
+
+
+	/* Prevent memslot modification */
+	mn_active_invalidate_count_inc(kvm);
+	ret = __kvm_handle_useraddr_range(kvm, &useraddr_range);
+	mn_active_invalidate_count_dec(kvm);
+
+	return ret;
+}
+#endif /* CONFIG_MEMFD_OPS */
+
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
 static int kvm_pm_notifier_call(struct notifier_block *bl,
 				unsigned long state,
diff --git a/virt/kvm/memfd.c b/virt/kvm/memfd.c
index 96a1a5bee0f7..d092a9b6f496 100644
--- a/virt/kvm/memfd.c
+++ b/virt/kvm/memfd.c
@@ -16,6 +16,8 @@ static const struct memfd_pfn_ops *memfd_ops;
 static void memfd_invalidate_page_range(struct inode *inode, void *owner,
 					pgoff_t start, pgoff_t end)
 {
+	kvm_memfd_invalidate_range(owner, inode, start >> PAGE_SHIFT,
+						 end >> PAGE_SHIFT);
 }
 
 static void memfd_fallocate(struct inode *inode, void *owner,
-- 
2.17.1



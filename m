Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1256A47C2AF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 16:20:54 +0100 (CET)
Received: from localhost ([::1]:55424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzgwf-0001FN-5y
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 10:20:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzgp1-0007f9-D8
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:12:59 -0500
Received: from mga11.intel.com ([192.55.52.93]:41689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzgoz-0008Dd-9E
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640099577; x=1671635577;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=4BfQuzincLOVrXQzV2p7CB14wEIknv0E51W7rzSAi78=;
 b=NeEPqBMDj/meiyZEPVYI/JDyURwO/Y+dqKfNVt1PSxF3NBpiHvXXeqQi
 npR3BXljQ2DVav0cp38lVEIKa1vUhRVEEqqdD7k8mu19VxmNP0X/1KFKF
 UMrqzxklyAhkPjvbHu7z3MQr6j7pIlnbsQLwkVGYXh/u/1WAksvdJ383/
 zn/Z4P43e0lCVq+3bHEbxUxRA7cDQRK1P1YQtelKF+07VNzFWyHL4IJWg
 vTTKW3Vj8wbnbO/kolOVo9DPp7uADWmfNkcsmEVFoQh+WxW68i2oJhMCe
 kbJvzTHWwV1A65y7fZVYWv5HZw5/yQY92bce9qAa6wfQuYYFN6eHTXj8E A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="237946739"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="237946739"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 07:12:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="684688446"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga005.jf.intel.com with ESMTP; 21 Dec 2021 07:12:48 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 06/15] KVM: Refactor hva based memory invalidation code
Date: Tue, 21 Dec 2021 23:11:16 +0800
Message-Id: <20211221151125.19446-7-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
References: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The purpose of this patch is for fd-based memslot to reuse the same
mmu_notifier based guest memory invalidation code for private pages.

No functional changes except renaming 'hva' to more neutral 'useraddr'
so that it can also cover 'offset' in a fd that private pages live in.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/kvm_host.h |  8 +++++--
 virt/kvm/kvm_main.c      | 47 +++++++++++++++++++++-------------------
 2 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index b0b63c9a160f..7279f46f35d3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1327,9 +1327,13 @@ static inline int memslot_id(struct kvm *kvm, gfn_t gfn)
 }
 
 static inline gfn_t
-hva_to_gfn_memslot(unsigned long hva, struct kvm_memory_slot *slot)
+useraddr_to_gfn_memslot(unsigned long useraddr, struct kvm_memory_slot *slot,
+			bool addr_is_hva)
 {
-	gfn_t gfn_offset = (hva - slot->userspace_addr) >> PAGE_SHIFT;
+	unsigned long useraddr_base = addr_is_hva ? slot->userspace_addr
+						  : slot->file_ofs;
+
+	gfn_t gfn_offset = (useraddr - useraddr_base) >> PAGE_SHIFT;
 
 	return slot->base_gfn + gfn_offset;
 }
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 68018ee7f0cd..856f89ed8ab5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -471,16 +471,16 @@ static void kvm_mmu_notifier_invalidate_range(struct mmu_notifier *mn,
 	srcu_read_unlock(&kvm->srcu, idx);
 }
 
-typedef bool (*hva_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
+typedef bool (*gfn_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
 
 typedef void (*on_lock_fn_t)(struct kvm *kvm, unsigned long start,
 			     unsigned long end);
 
-struct kvm_hva_range {
+struct kvm_useraddr_range {
 	unsigned long start;
 	unsigned long end;
 	pte_t pte;
-	hva_handler_t handler;
+	gfn_handler_t handler;
 	on_lock_fn_t on_lock;
 	bool flush_on_ret;
 	bool may_block;
@@ -499,8 +499,8 @@ static void kvm_null_fn(void)
 }
 #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
 
-static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
-						  const struct kvm_hva_range *range)
+static __always_inline int __kvm_handle_useraddr_range(struct kvm *kvm,
+					const struct kvm_useraddr_range *range)
 {
 	bool ret = false, locked = false;
 	struct kvm_gfn_range gfn_range;
@@ -518,12 +518,12 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
 		slots = __kvm_memslots(kvm, i);
 		kvm_for_each_memslot(slot, slots) {
-			unsigned long hva_start, hva_end;
+			unsigned long useraddr_start, useraddr_end;
 
-			hva_start = max(range->start, slot->userspace_addr);
-			hva_end = min(range->end, slot->userspace_addr +
+			useraddr_start = max(range->start, slot->userspace_addr);
+			useraddr_end = min(range->end, slot->userspace_addr +
 						  (slot->npages << PAGE_SHIFT));
-			if (hva_start >= hva_end)
+			if (useraddr_start >= useraddr_end)
 				continue;
 
 			/*
@@ -536,11 +536,14 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 			gfn_range.may_block = range->may_block;
 
 			/*
-			 * {gfn(page) | page intersects with [hva_start, hva_end)} =
+			 * {gfn(page) | page intersects with [useraddr_start, useraddr_end)} =
 			 * {gfn_start, gfn_start+1, ..., gfn_end-1}.
 			 */
-			gfn_range.start = hva_to_gfn_memslot(hva_start, slot);
-			gfn_range.end = hva_to_gfn_memslot(hva_end + PAGE_SIZE - 1, slot);
+			gfn_range.start = useraddr_to_gfn_memslot(useraddr_start,
+								  slot, true);
+			gfn_range.end = useraddr_to_gfn_memslot(
+						useraddr_end + PAGE_SIZE - 1,
+						slot, true);
 			gfn_range.slot = slot;
 
 			if (!locked) {
@@ -571,10 +574,10 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 						unsigned long start,
 						unsigned long end,
 						pte_t pte,
-						hva_handler_t handler)
+						gfn_handler_t handler)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_hva_range range = {
+	const struct kvm_useraddr_range range = {
 		.start		= start,
 		.end		= end,
 		.pte		= pte,
@@ -584,16 +587,16 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 		.may_block	= false,
 	};
 
-	return __kvm_handle_hva_range(kvm, &range);
+	return __kvm_handle_useraddr_range(kvm, &range);
 }
 
 static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn,
 							 unsigned long start,
 							 unsigned long end,
-							 hva_handler_t handler)
+							 gfn_handler_t handler)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_hva_range range = {
+	const struct kvm_useraddr_range range = {
 		.start		= start,
 		.end		= end,
 		.pte		= __pte(0),
@@ -603,7 +606,7 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 		.may_block	= false,
 	};
 
-	return __kvm_handle_hva_range(kvm, &range);
+	return __kvm_handle_useraddr_range(kvm, &range);
 }
 static void kvm_mmu_notifier_change_pte(struct mmu_notifier *mn,
 					struct mm_struct *mm,
@@ -661,7 +664,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 					const struct mmu_notifier_range *range)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_hva_range hva_range = {
+	const struct kvm_useraddr_range useraddr_range = {
 		.start		= range->start,
 		.end		= range->end,
 		.pte		= __pte(0),
@@ -685,7 +688,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 	kvm->mn_active_invalidate_count++;
 	spin_unlock(&kvm->mn_invalidate_lock);
 
-	__kvm_handle_hva_range(kvm, &hva_range);
+	__kvm_handle_useraddr_range(kvm, &useraddr_range);
 
 	return 0;
 }
@@ -712,7 +715,7 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 					const struct mmu_notifier_range *range)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_hva_range hva_range = {
+	const struct kvm_useraddr_range useraddr_range = {
 		.start		= range->start,
 		.end		= range->end,
 		.pte		= __pte(0),
@@ -723,7 +726,7 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 	};
 	bool wake;
 
-	__kvm_handle_hva_range(kvm, &hva_range);
+	__kvm_handle_useraddr_range(kvm, &useraddr_range);
 
 	/* Pairs with the increment in range_start(). */
 	spin_lock(&kvm->mn_invalidate_lock);
-- 
2.17.1



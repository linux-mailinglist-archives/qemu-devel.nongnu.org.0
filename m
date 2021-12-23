Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE6947E3B7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:51:45 +0100 (CET)
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0NZQ-00018w-2S
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:51:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0NGU-0005sE-Kx
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:32:10 -0500
Received: from mga18.intel.com ([134.134.136.126]:24518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0NGS-0002hO-QM
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640262728; x=1671798728;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=jFXnBQCQUYkIJxpEwP0R21h1nTh23vZQC9pPmI8hXVw=;
 b=mQMr0YHo0ee7CVzodjvSJvHL6kuGkw+R2UZEm6nwexh79gMMRg2yPxmH
 rzhziH9C0k2FNqrPNTxUdDGx8frqABNPDBYVfBBTF1OtnqRL1BNvINxdn
 PYvgU+30i19Pi48qLFh5bTykbdmj9DcAR5bX9R6Iva6pjmoPra0yM0qay
 VMNjtOFztu5TWG9whaU6oes0fBpX3sICo6ukyY42xg8Id71rEDEywkNBw
 mwHR+9R8o7eKZC8CLvABtb5ltBzvQZ6Xtw5NaKoLF8QFF5Xd/Sis4lszT
 NktcAUKr6ZwGaVKSWWufDo6bhmDsTzZMz6/XScwA3NzWfon4kg6Tt+VHZ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="227661046"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="227661046"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 04:31:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522078821"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 23 Dec 2021 04:31:50 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 kvm/queue 08/16] KVM: Special handling for fd-based memory
 invalidation
Date: Thu, 23 Dec 2021 20:30:03 +0800
Message-Id: <20211223123011.41044-9-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga18.intel.com
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

For fd-based guest memory, the memory backend (e.g. the fd provider)
should notify KVM to unmap/invalidate the privated memory from KVM
secondary MMU when userspace punches hole on the fd (e.g. when
userspace converts private memory to shared memory).

To support fd-based memory invalidation, existing hva-based memory
invalidation needs to be extended. A new 'inode' for the fd is passed in
from memfd_falloc_notifier and the 'start/end' will represent start/end
offset in the fd instead of hva range. During the invalidation KVM needs
to check this inode against that in the memslot. Only when the 'inode' in
memslot equals to the passed-in 'inode' we should invalidate the mapping
in KVM.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 virt/kvm/kvm_main.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b7a1c4d7eaaa..19736a0013a0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -494,6 +494,7 @@ typedef void (*on_lock_fn_t)(struct kvm *kvm, unsigned long start,
 struct kvm_useraddr_range {
 	unsigned long start;
 	unsigned long end;
+	struct inode *inode;
 	pte_t pte;
 	gfn_handler_t handler;
 	on_lock_fn_t on_lock;
@@ -544,14 +545,27 @@ static __always_inline int __kvm_handle_useraddr_range(struct kvm *kvm,
 		struct interval_tree_node *node;
 
 		slots = __kvm_memslots(kvm, i);
-		useraddr_tree = &slots->hva_tree;
+		useraddr_tree = range->inode ? &slots->ofs_tree : &slots->hva_tree;
 		kvm_for_each_memslot_in_useraddr_range(node, useraddr_tree,
 						  range->start, range->end - 1) {
 			unsigned long useraddr_start, useraddr_end;
+			unsigned long useraddr_base;
+
+			if (range->inode) {
+				slot = container_of(node, struct kvm_memory_slot,
+						    ofs_node[slots->node_idx]);
+				if (!slot->file ||
+				    slot->file->f_inode != range->inode)
+					continue;
+				useraddr_base = slot->ofs;
+			} else {
+				slot = container_of(node, struct kvm_memory_slot,
+						    hva_node[slots->node_idx]);
+				useraddr_base = slot->userspace_addr;
+			}
 
-			slot = container_of(node, struct kvm_memory_slot, hva_node[slots->node_idx]);
-			useraddr_start = max(range->start, slot->userspace_addr);
-			useraddr_end = min(range->end, slot->userspace_addr +
+			useraddr_start = max(range->start, useraddr_base);
+			useraddr_end = min(range->end, useraddr_base +
 						       (slot->npages << PAGE_SHIFT));
 
 			/*
@@ -568,10 +582,10 @@ static __always_inline int __kvm_handle_useraddr_range(struct kvm *kvm,
 			 * {gfn_start, gfn_start+1, ..., gfn_end-1}.
 			 */
 			gfn_range.start = useraddr_to_gfn_memslot(useraddr_start,
-								  slot, true);
+							slot, !range->inode);
 			gfn_range.end = useraddr_to_gfn_memslot(
 						useraddr_end + PAGE_SIZE - 1,
-						slot, true);
+						slot, !range->inode);
 			gfn_range.slot = slot;
 
 			if (!locked) {
@@ -613,6 +627,7 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 		.on_lock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
 		.may_block	= false,
+		.inode		= NULL,
 	};
 
 	return __kvm_handle_useraddr_range(kvm, &range);
@@ -632,6 +647,7 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 		.on_lock	= (void *)kvm_null_fn,
 		.flush_on_ret	= false,
 		.may_block	= false,
+		.inode		= NULL,
 	};
 
 	return __kvm_handle_useraddr_range(kvm, &range);
@@ -700,6 +716,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 		.on_lock	= kvm_inc_notifier_count,
 		.flush_on_ret	= true,
 		.may_block	= mmu_notifier_range_blockable(range),
+		.inode		= NULL,
 	};
 
 	trace_kvm_unmap_hva_range(range->start, range->end);
@@ -751,6 +768,7 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 		.on_lock	= kvm_dec_notifier_count,
 		.flush_on_ret	= false,
 		.may_block	= mmu_notifier_range_blockable(range),
+		.inode		= NULL,
 	};
 	bool wake;
 
-- 
2.17.1



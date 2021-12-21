Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9891C47C2C1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 16:24:02 +0100 (CET)
Received: from localhost ([::1]:36116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzgzh-0007Cr-Ba
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 10:24:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzgpH-00087z-HH
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:13:15 -0500
Received: from mga09.intel.com ([134.134.136.24]:55943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzgp7-0008Fm-7R
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:13:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640099585; x=1671635585;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=COdj1UvXQdkAqzxtXCPYFm0EISfGJg8Z8mzxkFecT00=;
 b=GFkU5oXXlf42hsCOIxueRrBC44Nrac5JXdmMeq45setPjHThEYVHmRva
 pV1uHbIfrX84WXvuP4mlrQWpbmnWgZWxga78/S6VMXNQ4RTXr3qLZQYXs
 7RrGV0wq+IFYcOwd2OMQw13UVUgWPiwvts4wdMa/Ot5x49CQjpWEYLQ5h
 taE5AknEVRlroC3bNtIX85KQotmZYG7qtGkVfFwkxAmukIsSCr1yCkJYe
 m/Wss2FrNATJMzzua+t/WrxgOj/WMtgAuO7ADFjQZFEhqDrdvCUEOU5nD
 D3ZClBq8+6Gd8dtgkKY8NqlEtlJnXuU1ydlrzY1UriaOJaqSYdB7QGaB9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="240216637"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="240216637"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 07:13:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="684688485"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga005.jf.intel.com with ESMTP; 21 Dec 2021 07:12:55 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 07/15] KVM: Special handling for fd-based memory
 invalidation
Date: Tue, 21 Dec 2021 23:11:17 +0800
Message-Id: <20211221151125.19446-8-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
References: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

For fd-based guest memory, the memory backend (e.g. the fd provider)
should notify KVM to unmap/invalidate the privated memory from KVM
second MMU when userspace punches hole on the fd (e.g. when userspace
converts private memory to shared memory).

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
 virt/kvm/kvm_main.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 856f89ed8ab5..0f2d1002f6a7 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -479,6 +479,7 @@ typedef void (*on_lock_fn_t)(struct kvm *kvm, unsigned long start,
 struct kvm_useraddr_range {
 	unsigned long start;
 	unsigned long end;
+	struct inode *inode;
 	pte_t pte;
 	gfn_handler_t handler;
 	on_lock_fn_t on_lock;
@@ -519,9 +520,19 @@ static __always_inline int __kvm_handle_useraddr_range(struct kvm *kvm,
 		slots = __kvm_memslots(kvm, i);
 		kvm_for_each_memslot(slot, slots) {
 			unsigned long useraddr_start, useraddr_end;
+			unsigned long useraddr_base;
 
-			useraddr_start = max(range->start, slot->userspace_addr);
-			useraddr_end = min(range->end, slot->userspace_addr +
+			if (range->inode) {
+				if (!slot->file ||
+				    slot->file->f_inode != range->inode)
+					continue;
+				useraddr_base = slot->file_ofs;
+			} else
+				useraddr_base = slot->userspace_addr;
+
+
+			useraddr_start = max(range->start, useraddr_base);
+			useraddr_end = min(range->end, useraddr_base +
 						  (slot->npages << PAGE_SHIFT));
 			if (useraddr_start >= useraddr_end)
 				continue;
@@ -540,10 +551,10 @@ static __always_inline int __kvm_handle_useraddr_range(struct kvm *kvm,
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
@@ -585,6 +596,7 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 		.on_lock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
 		.may_block	= false,
+		.inode		= NULL,
 	};
 
 	return __kvm_handle_useraddr_range(kvm, &range);
@@ -604,6 +616,7 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 		.on_lock	= (void *)kvm_null_fn,
 		.flush_on_ret	= false,
 		.may_block	= false,
+		.inode		= NULL,
 	};
 
 	return __kvm_handle_useraddr_range(kvm, &range);
@@ -672,6 +685,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 		.on_lock	= kvm_inc_notifier_count,
 		.flush_on_ret	= true,
 		.may_block	= mmu_notifier_range_blockable(range),
+		.inode		= NULL,
 	};
 
 	trace_kvm_unmap_hva_range(range->start, range->end);
@@ -723,6 +737,7 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 		.on_lock	= kvm_dec_notifier_count,
 		.flush_on_ret	= false,
 		.may_block	= mmu_notifier_range_blockable(range),
+		.inode		= NULL,
 	};
 	bool wake;
 
-- 
2.17.1



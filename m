Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20196457047
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:06:53 +0100 (CET)
Received: from localhost ([::1]:59094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4XU-0003Ri-5K
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:06:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mo4HB-0007eo-Se
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:50:02 -0500
Received: from mga11.intel.com ([192.55.52.93]:9914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mo4H9-0000bc-EA
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:50:00 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="231896148"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="231896148"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 05:49:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="507905127"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 19 Nov 2021 05:49:49 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC v2 PATCH 10/13] KVM: Match inode for invalidation of fd-based
 slot
Date: Fri, 19 Nov 2021 21:47:36 +0800
Message-Id: <20211119134739.20218-11-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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

Different fd/priv_fd can have the same userspace_addr so start/end
is meaningful only when they are used together with fd/priv_fd.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 virt/kvm/kvm_main.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 090afbadb03f..65055ac460eb 100644
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
@@ -520,6 +521,17 @@ static __always_inline int __kvm_handle_useraddr_range(struct kvm *kvm,
 		kvm_for_each_memslot(slot, slots) {
 			unsigned long useraddr_start, useraddr_end;
 
+			/*
+			 * Skip the slot if range->inode is not the same as
+			 * that in slot->file or slot->priv_file.
+			 */
+			if (range->inode &&
+			    (!slot->file ||
+			     slot->file->f_inode != range->inode) &&
+			    (!slot->priv_file ||
+			     slot->priv_file->f_inode != range->inode))
+				continue;
+
 			useraddr_start = max(range->start, slot->userspace_addr);
 			useraddr_end = min(range->end, slot->userspace_addr +
 						  (slot->npages << PAGE_SHIFT));
@@ -818,6 +830,7 @@ int kvm_memfd_invalidate_range(struct kvm *kvm, struct inode *inode,
 	const struct kvm_useraddr_range useraddr_range = {
 		.start		= start,
 		.end		= end,
+		.inode		= inode,
 		.pte		= __pte(0),
 		.handler	= kvm_unmap_gfn_range,
 		.on_lock	= (void *)kvm_null_fn,
-- 
2.17.1



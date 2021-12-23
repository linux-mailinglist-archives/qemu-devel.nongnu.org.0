Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0705847E3C3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:54:15 +0100 (CET)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Nbp-0008FI-PM
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:54:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0NGt-0006ud-PF
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:32:35 -0500
Received: from mga05.intel.com ([192.55.52.43]:55558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0NGr-0002jm-Sf
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640262753; x=1671798753;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=YEqJBACRcYF6r6P724iXUNeYRL5G8D47PprkAJHUqo4=;
 b=kUKw6duq3Mwk9e/E0Nx/6uDxiDWsuV1k15n8yW5Q0B1jovvgrDHr5PlT
 YFfMjC+zLeFUjnl9IyGVU1wT/tbG1opUYgh775aXmpYGRhrV8dum0BhkM
 2jyftlJsuVYMKkwie7+YiHG5jBoyvFTOGSKNiv7/LQ9RZDU1zKc0KTdpX
 PfF9a+/PJUA0SIjTJjUs0+EtKFckVs33Briqp4sjpK0sJiA0rwjAW1A5m
 ccX/pFs7Zq/z6T+ZyW0e+QF8mdi/Vtm3LPYbniLHvdc/mMEyvBLNsmTKb
 bGPjGg4GvxipGxlkzMliwBPN/KF+WbinyBpAX1Lqt4ObNhvR9m0N3IPzz Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="327129858"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="327129858"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 04:32:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522078999"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 23 Dec 2021 04:32:24 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 kvm/queue 12/16] KVM: Implement fd-based memory fallocation
Date: Thu, 23 Dec 2021 20:30:07 +0800
Message-Id: <20211223123011.41044-13-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga05.intel.com
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

KVM gets notified through memfd_notifier when userspace allocatea space
via fallocate() on the fd which is used for guest memory. KVM can set up
the mapping in the secondary MMU page tables at this time. This patch
adds function in KVM to map pfn to gfn when the page is allocated in the
memory backend.

While it's possible to postpone the mapping of the secondary MMU to KVM
page fault handler but we can reduce some VMExits by also mapping the
secondary page tables when a page is mapped in the primary MMU.

It reuses the same code for kvm_memfd_invalidate_range, except using
kvm_map_gfn_range as its handler.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 22 +++++++++++++++++++---
 virt/kvm/memfd.c         |  2 ++
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 8c2359175509..ad89a0e8bf6b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2017,6 +2017,8 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
 #ifdef CONFIG_MEMFD_OPS
 int kvm_memfd_invalidate_range(struct kvm *kvm, struct inode *inode,
 			       unsigned long start, unsigned long end);
+int kvm_memfd_fallocate_range(struct kvm *kvm, struct inode *inode,
+			      unsigned long start, unsigned long end);
 #endif /* CONFIG_MEMFD_OPS */
 
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 660ce15973ad..36dd2adcd7fc 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -891,15 +891,17 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
 #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
 
 #ifdef CONFIG_MEMFD_OPS
-int kvm_memfd_invalidate_range(struct kvm *kvm, struct inode *inode,
-			       unsigned long start, unsigned long end)
+int kvm_memfd_handle_range(struct kvm *kvm, struct inode *inode,
+			   unsigned long start, unsigned long end,
+			   gfn_handler_t handler)
+
 {
 	int ret;
 	const struct kvm_useraddr_range useraddr_range = {
 		.start		= start,
 		.end		= end,
 		.pte		= __pte(0),
-		.handler	= kvm_unmap_gfn_range,
+		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
 		.may_block	= false,
@@ -914,6 +916,20 @@ int kvm_memfd_invalidate_range(struct kvm *kvm, struct inode *inode,
 
 	return ret;
 }
+
+int kvm_memfd_invalidate_range(struct kvm *kvm, struct inode *inode,
+			       unsigned long start, unsigned long end)
+{
+	return kvm_memfd_handle_range(kvm, inode, start, end,
+				      kvm_unmap_gfn_range);
+}
+
+int kvm_memfd_fallocate_range(struct kvm *kvm, struct inode *inode,
+			      unsigned long start, unsigned long end)
+{
+	return kvm_memfd_handle_range(kvm, inode, start, end,
+				      kvm_map_gfn_range);
+}
 #endif /* CONFIG_MEMFD_OPS */
 
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
diff --git a/virt/kvm/memfd.c b/virt/kvm/memfd.c
index 547f65f5a187..91a17c9fbc49 100644
--- a/virt/kvm/memfd.c
+++ b/virt/kvm/memfd.c
@@ -23,6 +23,8 @@ static void memfd_invalidate_page_range(struct inode *inode, void *owner,
 static void memfd_fallocate(struct inode *inode, void *owner,
 			    pgoff_t start, pgoff_t end)
 {
+	kvm_memfd_fallocate_range(owner, inode, start >> PAGE_SHIFT,
+						end >> PAGE_SHIFT);
 }
 
 static bool memfd_get_owner(void *owner)
-- 
2.17.1



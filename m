Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9155C492886
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:37:23 +0100 (CET)
Received: from localhost ([::1]:44628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pbu-0004u8-A6
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:37:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oRw-0001If-TY
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:23:00 -0500
Received: from mga12.intel.com ([192.55.52.136]:1557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oRt-0003Gk-AU
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:22:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642512177; x=1674048177;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Sxmzc3HCYf+A9G7nAq2yyNQIgWHQdtSxzJnS7/C1WdQ=;
 b=hL2+HxVZricn2zr/dzQ8GZAwbTkDqoyCW53TXzoIePdEQiKN4PtiJpGR
 /p80VcPvt2HkDJdtsqIZ0JQvWqPRY3Au6VIabRQx+n4yM1UFiFBLBFhbq
 8OPryc9+ozWA5IfPDuwWaanPfLjJFWc/mYSDzZo4Z5LubpKyEU9hwmuPd
 I5o+tlR/qdzTb7wvBzYhZJCbi/ZWD+FG8tI8P83g+97jMo0cxfubjofcy
 quVx2DtH8YnTMwFoD50ebNg6uIQ6nHU+AkD0V6Y6yLfWBZTYlDs70TMyd
 WX6sernqwBeUuI6ep4If7+BxoNZxDPSAG/paKH54OjyqWcIa3cCz2M7vo w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="224791094"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="224791094"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 05:22:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="531791861"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 05:22:49 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v4 08/12] KVM: Use memfile_pfn_ops to obtain pfn for private
 pages
Date: Tue, 18 Jan 2022 21:21:17 +0800
Message-Id: <20220118132121.31388-9-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, luto@kernel.org, david@redhat.com,
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 ak@linux.intel.com, Jonathan Corbet <corbet@lwn.net>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, jun.nakajima@intel.com,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, Sean Christopherson <seanjc@google.com>,
 Jeff Layton <jlayton@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Private pages are not mmap-ed into userspace so can not reply on
get_user_pages() to obtain the pfn. Instead we add a memfile_pfn_ops
pointer pfn_ops in each private memslot and use it to obtain the pfn
for a gfn. To do that, KVM should convert the gfn to the offset into
the fd and then call get_lock_pfn callback. Once KVM completes its job
it should call put_unlock_pfn to unlock the pfn. Note the pfn(page) is
locked between get_lock_pfn/put_unlock_pfn to ensure pfn is valid when
KVM uses it to establish the mapping in the secondary MMU page table.

The pfn_ops is initialized via memfile_register_notifier from the memory
backing store that provided the private_fd.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 arch/x86/kvm/Kconfig     |  1 +
 include/linux/kvm_host.h | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index ebc8ce9ec917..5d5bebaad9e7 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -47,6 +47,7 @@ config KVM
 	select SRCU
 	select INTERVAL_TREE
 	select HAVE_KVM_PM_NOTIFIER if PM
+	select MEMFILE_NOTIFIER
 	help
 	  Support hosting fully virtualized guest machines using hardware
 	  virtualization extensions.  You will need a fairly recent
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 26118a45f0bb..927e7f44a02a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -42,6 +42,7 @@
 
 #include <asm/kvm_host.h>
 #include <linux/kvm_dirty_ring.h>
+#include <linux/memfile_notifier.h>
 
 #ifndef KVM_MAX_VCPU_IDS
 #define KVM_MAX_VCPU_IDS KVM_MAX_VCPUS
@@ -460,6 +461,7 @@ struct kvm_memory_slot {
 	u16 as_id;
 	struct file *private_file;
 	loff_t private_offset;
+	struct memfile_pfn_ops *pfn_ops;
 };
 
 static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
@@ -810,6 +812,7 @@ static inline void kvm_irqfd_exit(void)
 {
 }
 #endif
+
 int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 		  struct module *module);
 void kvm_exit(void);
@@ -2103,4 +2106,34 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
+#ifdef CONFIG_MEMFILE_NOTIFIER
+static inline long kvm_memfile_get_pfn(struct kvm_memory_slot *slot, gfn_t gfn,
+				       int *order)
+{
+	pgoff_t index = gfn - slot->base_gfn +
+			(slot->private_offset >> PAGE_SHIFT);
+
+	return slot->pfn_ops->get_lock_pfn(file_inode(slot->private_file),
+					   index, order);
+}
+
+static inline void kvm_memfile_put_pfn(struct kvm_memory_slot *slot,
+				       kvm_pfn_t pfn)
+{
+	slot->pfn_ops->put_unlock_pfn(pfn);
+}
+
+#else
+static inline long kvm_memfile_get_pfn(struct kvm_memory_slot *slot, gfn_t gfn,
+				       int *order)
+{
+	return -1;
+}
+
+static inline void kvm_memfile_put_pfn(struct kvm_memory_slot *slot,
+				       kvm_pfn_t pfn)
+{
+}
+#endif /* CONFIG_MEMFILE_NOTIFIER */
+
 #endif
-- 
2.17.1



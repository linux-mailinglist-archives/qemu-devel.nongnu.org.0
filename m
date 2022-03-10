Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E674D48BD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:15:27 +0100 (CET)
Received: from localhost ([::1]:36706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJZe-0005AX-F9
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:15:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJV7-0006b4-D7
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:10:45 -0500
Received: from mga04.intel.com ([192.55.52.120]:7825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJV5-0004zp-EA
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646921443; x=1678457443;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=/0lWU+5EyoSjlOB1k9o55wX3sxsJiR5VJJRuHs8r7qY=;
 b=Qcsgzn9bdwIw/5HfryRjiYS45NGxuFgv+dOLMR7MPs3y36xcH0HQ403T
 0dtQ/YvyeDj73XYILGr1dUweMftALEfFYIsPowwqYcdHnyIYGF9RRe++R
 fKhe45xTw2UcaD6PLkjPhBl1FMMKZLgYgEXACiuE+hKt9QRDRyBMVm/Qp
 xNTJrCAsLpnmMt8x/dQ7CmDAvtAPP4D+mSSmC79w3dL/pBZ9PA41wUbqS
 VN7rxls19ZgZBO3Ef7HNGwh7ZAaDPfkMoNbbZBothJ2ZgKnYnXCEhGsFB
 95L1oRVD+pKkNVKv2qP+jK8Z+aya7+nuzqSWCRjmbi5eOIOLIqBKEmKid w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="254084996"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="254084996"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:10:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="554655084"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 10 Mar 2022 06:10:32 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v5 08/13] KVM: Use memfile_pfn_ops to obtain pfn for private
 pages
Date: Thu, 10 Mar 2022 22:09:06 +0800
Message-Id: <20220310140911.50924-9-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, Jeff Layton <jlayton@kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
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
index e3cbd7706136..ca7b2a6a452a 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -48,6 +48,7 @@ config KVM
 	select SRCU
 	select INTERVAL_TREE
 	select HAVE_KVM_PM_NOTIFIER if PM
+	select MEMFILE_NOTIFIER
 	help
 	  Support hosting fully virtualized guest machines using hardware
 	  virtualization extensions.  You will need a fairly recent
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c92c70174248..6e1d770d6bf8 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -44,6 +44,7 @@
 
 #include <asm/kvm_host.h>
 #include <linux/kvm_dirty_ring.h>
+#include <linux/memfile_notifier.h>
 
 #ifndef KVM_MAX_VCPU_IDS
 #define KVM_MAX_VCPU_IDS KVM_MAX_VCPUS
@@ -565,6 +566,7 @@ struct kvm_memory_slot {
 	u16 as_id;
 	struct file *private_file;
 	loff_t private_offset;
+	struct memfile_pfn_ops *pfn_ops;
 };
 
 static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
@@ -915,6 +917,7 @@ static inline void kvm_irqfd_exit(void)
 {
 }
 #endif
+
 int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 		  struct module *module);
 void kvm_exit(void);
@@ -2217,4 +2220,34 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
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



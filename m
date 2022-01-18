Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D413492976
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:13:35 +0100 (CET)
Received: from localhost ([::1]:58512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9qAw-0005dm-KA
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:13:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oSF-0001PD-MO
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:23:20 -0500
Received: from mga17.intel.com ([192.55.52.151]:19395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oSC-0003II-HS
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:23:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642512196; x=1674048196;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=EeAqQ9F4s9hLs6erZUPGg6L9PNHtGyg9c724TwmrBc4=;
 b=Nic7Pd+0lFzKM4jQlLxkPi+2USAHKNP8WScXQECCbFYFIeyd69/KyP0c
 kIOWXqPc+PlaYKtaEBZdgMbF4CuCQnphMJ5YjGV4KVBgS/0paeWj6h54x
 hVtP/4AN8HlOn+4/vrL4TeKaOtUlZPmU7+ZZGXzgV1sgIHXd2Aku0YLOx
 aHXZVJHo7PX6sIeGZr0WGL82K1MoL0En3SuZiPK6goqSYeRQFrzTtwP9B
 YxIG227riSSNfOZOg/99XHb0g4VGr3jiJV7TnTnd0roFKAcM7U5+iwmqV
 Y+Dy0Vycqgvn5YZhYej8ZZElZbZ+9XdKTBaSIh0Sn5fyDv0FBiZ3+LQBr Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="225491116"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="225491116"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 05:23:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="531791917"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 05:23:04 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v4 10/12] KVM: Register private memslot to memory backing store
Date: Tue, 18 Jan 2022 21:21:19 +0800
Message-Id: <20220118132121.31388-11-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

Add 'notifier' to memslot to make it a memfile_notifier node and then
register it to memory backing store via memfile_register_notifier() when
memslot gets created. When memslot is deleted, do the reverse with
memfile_unregister_notifier(). Note each KVM memslot can be registered
to different memory backing stores (or the same backing store but at
different offset) independently.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/kvm_main.c      | 75 ++++++++++++++++++++++++++++++++++++----
 2 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 927e7f44a02a..667efe839767 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -462,6 +462,7 @@ struct kvm_memory_slot {
 	struct file *private_file;
 	loff_t private_offset;
 	struct memfile_pfn_ops *pfn_ops;
+	struct memfile_notifier notifier;
 };
 
 static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ecf94e2548f7..6b78ddef7880 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -846,6 +846,37 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
 
 #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
 
+#ifdef CONFIG_MEMFILE_NOTIFIER
+static inline int kvm_memfile_register(struct kvm_memory_slot *slot)
+{
+	return memfile_register_notifier(file_inode(slot->private_file),
+					 &slot->notifier,
+					 &slot->pfn_ops);
+}
+
+static inline void kvm_memfile_unregister(struct kvm_memory_slot *slot)
+{
+	if (slot->private_file) {
+		memfile_unregister_notifier(file_inode(slot->private_file),
+					    &slot->notifier);
+		fput(slot->private_file);
+		slot->private_file = NULL;
+	}
+}
+
+#else /* !CONFIG_MEMFILE_NOTIFIER */
+
+static inline int kvm_memfile_register(struct kvm_memory_slot *slot)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void kvm_memfile_unregister(struct kvm_memory_slot *slot)
+{
+}
+
+#endif /* CONFIG_MEMFILE_NOTIFIER */
+
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
 static int kvm_pm_notifier_call(struct notifier_block *bl,
 				unsigned long state,
@@ -890,6 +921,9 @@ static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
 /* This does not remove the slot from struct kvm_memslots data structures */
 static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 {
+	if (slot->flags & KVM_MEM_PRIVATE)
+		kvm_memfile_unregister(slot);
+
 	kvm_destroy_dirty_bitmap(slot);
 
 	kvm_arch_free_memslot(kvm, slot);
@@ -1744,6 +1778,12 @@ static int kvm_set_memslot(struct kvm *kvm,
 		kvm_invalidate_memslot(kvm, old, invalid_slot);
 	}
 
+	if (new->flags & KVM_MEM_PRIVATE && change == KVM_MR_CREATE) {
+		r = kvm_memfile_register(new);
+		if (r)
+			return r;
+	}
+
 	r = kvm_prepare_memory_region(kvm, old, new, change);
 	if (r) {
 		/*
@@ -1758,6 +1798,10 @@ static int kvm_set_memslot(struct kvm *kvm,
 		} else {
 			mutex_unlock(&kvm->slots_arch_lock);
 		}
+
+		if (new->flags & KVM_MEM_PRIVATE && change == KVM_MR_CREATE)
+			kvm_memfile_unregister(new);
+
 		return r;
 	}
 
@@ -1823,6 +1867,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	enum kvm_mr_change change;
 	unsigned long npages;
 	gfn_t base_gfn;
+	struct file *file = NULL;
 	int as_id, id;
 	int r;
 
@@ -1896,14 +1941,24 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			return 0;
 	}
 
+	if (mem->flags & KVM_MEM_PRIVATE) {
+		file = fdget(region_ext->private_fd).file;
+		if (!file)
+			return -EINVAL;
+	}
+
 	if ((change == KVM_MR_CREATE || change == KVM_MR_MOVE) &&
-	    kvm_check_memslot_overlap(slots, id, base_gfn, base_gfn + npages))
-		return -EEXIST;
+	    kvm_check_memslot_overlap(slots, id, base_gfn, base_gfn + npages)) {
+		r = -EEXIST;
+		goto out;
+	}
 
 	/* Allocate a slot that will persist in the memslot. */
 	new = kzalloc(sizeof(*new), GFP_KERNEL_ACCOUNT);
-	if (!new)
-		return -ENOMEM;
+	if (!new) {
+		r = -ENOMEM;
+		goto out;
+	}
 
 	new->as_id = as_id;
 	new->id = id;
@@ -1911,10 +1966,18 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	new->npages = npages;
 	new->flags = mem->flags;
 	new->userspace_addr = mem->userspace_addr;
+	new->private_file = file;
+	new->private_offset = mem->flags & KVM_MEM_PRIVATE ?
+			      region_ext->private_offset : 0;
 
 	r = kvm_set_memslot(kvm, old, new, change);
-	if (r)
-		kfree(new);
+	if (!r)
+		return r;
+
+	kfree(new);
+out:
+	if (file)
+		fput(file);
 	return r;
 }
 EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
-- 
2.17.1



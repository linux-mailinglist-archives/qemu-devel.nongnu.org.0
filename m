Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B38A4D495E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:19:17 +0100 (CET)
Received: from localhost ([::1]:47786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJdM-0004Kp-8Z
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:19:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJVN-0007YC-5L
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:11:01 -0500
Received: from mga07.intel.com ([134.134.136.100]:62907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJVL-00050k-BS
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646921459; x=1678457459;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=dJciXpEHLFj6Z+EAfDFvGxoZXvWRu/tGM+jdlgCTKlE=;
 b=L/jYOUcSHvFQ0TZPweJB+lZSEl5m0ZVVEt62Zi/l9AGSqKjkqG0JSjdn
 Gzl3znNL9SDvWB89qXW58TantQ952rLqF+qrJENxbxsGyAiNenaIYB55B
 1aEkDpWHeXOAilZxE6m/I/fV2+7OyNrbeKPCYfRV7ySe1hn2UmT98bx2R
 mtKgJsXN4AMUlktpsm5AvoMgOP7qtYV7lm5a9SAYzR/dIVEkEJdGhOy2O
 8wf/k+fcZ2saXzQEamZpLiTRj2Sz6a0sNVxtR8HAqhm001v3RJli1P3Nu
 mR/lB8rtqPGExhMmoWw6CPR4ucIfaMOOi9QCA0mS3gm6yk6e91YGhBuUL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318479498"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="318479498"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:10:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="554655136"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 10 Mar 2022 06:10:49 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v5 10/13] KVM: Register private memslot to memory backing store
Date: Thu, 10 Mar 2022 22:09:08 +0800
Message-Id: <20220310140911.50924-11-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga07.intel.com
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
index 6e1d770d6bf8..9b175aeca63f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -567,6 +567,7 @@ struct kvm_memory_slot {
 	struct file *private_file;
 	loff_t private_offset;
 	struct memfile_pfn_ops *pfn_ops;
+	struct memfile_notifier notifier;
 };
 
 static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d11a2628b548..67349421eae3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -840,6 +840,37 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
 
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
@@ -884,6 +915,9 @@ static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
 /* This does not remove the slot from struct kvm_memslots data structures */
 static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 {
+	if (slot->flags & KVM_MEM_PRIVATE)
+		kvm_memfile_unregister(slot);
+
 	kvm_destroy_dirty_bitmap(slot);
 
 	kvm_arch_free_memslot(kvm, slot);
@@ -1738,6 +1772,12 @@ static int kvm_set_memslot(struct kvm *kvm,
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
@@ -1752,6 +1792,10 @@ static int kvm_set_memslot(struct kvm *kvm,
 		} else {
 			mutex_unlock(&kvm->slots_arch_lock);
 		}
+
+		if (new->flags & KVM_MEM_PRIVATE && change == KVM_MR_CREATE)
+			kvm_memfile_unregister(new);
+
 		return r;
 	}
 
@@ -1817,6 +1861,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	enum kvm_mr_change change;
 	unsigned long npages;
 	gfn_t base_gfn;
+	struct file *file = NULL;
 	int as_id, id;
 	int r;
 
@@ -1890,14 +1935,24 @@ int __kvm_set_memory_region(struct kvm *kvm,
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
@@ -1905,10 +1960,18 @@ int __kvm_set_memory_region(struct kvm *kvm,
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



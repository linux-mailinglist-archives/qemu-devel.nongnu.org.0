Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A720952D9F5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 18:14:20 +0200 (CEST)
Received: from localhost ([::1]:44232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrin5-0005ow-J4
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 12:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nriHw-0002VA-Jm
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:42:10 -0400
Received: from mga09.intel.com ([134.134.136.24]:26282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nriHu-0000jv-B9
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652974926; x=1684510926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XNQbqAIKiaRmaWRPdxk1Vbrl7jFMm+MnDgt+/EH9OEE=;
 b=g/Eu0E0jKRJtGrGavcAoSrAAi+8/aFx8yuXDsF8a52rq3ifujvyLSVKC
 Dp8Z9GAiRDPnLtdHOi9yhXFetDuRNoZIJUxw1sCA30kv8nqk+n5kVBRNt
 Xkh7oJD4uHW7q+3CR3tJrRC3oM0hf7YjLbUIkL2IluidcEZQW8X9XtdzN
 dSMdf3Sf0xwcdQ+Ih2OZz5Mx3fe1qJCwQBtv+LHEcNMMYmpTr7jI9iW2E
 wVAoktSjF9Vad533PPAw3ylP1sWS69don5ITzvlQ8Kuei8x3Mn7ZxLVWV
 VVudBZFIQVy5RNZDxSL6KQhSyfyP1ha9uWSNqUliXUX8ksfoAHJEwOVVr A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="271951291"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="271951291"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 08:42:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="598635481"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 19 May 2022 08:41:53 -0700
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: [PATCH v6 7/8] KVM: Enable and expose KVM_MEM_PRIVATE
Date: Thu, 19 May 2022 23:37:12 +0800
Message-Id: <20220519153713.819591-8-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Register private memslot to fd-based memory backing store and handle the
memfile notifiers to zap the existing mappings.

Currently the register is happened at memslot creating time and the
initial support does not include page migration/swap.

KVM_MEM_PRIVATE is not exposed by default, architecture code can turn
on it by implementing kvm_arch_private_mem_supported().

A 'kvm' reference is added in memslot structure since in
memfile_notifier callbacks we can only obtain a memslot reference while
kvm is need to do the zapping. The zapping itself reuses code from
existing mmu notifier handling.

Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/kvm_host.h |  10 ++-
 virt/kvm/kvm_main.c      | 132 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 131 insertions(+), 11 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index b0a7910505ed..00efb4b96bc7 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -246,7 +246,7 @@ bool kvm_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #endif
 
-#ifdef KVM_ARCH_WANT_MMU_NOTIFIER
+#if defined(KVM_ARCH_WANT_MMU_NOTIFIER) || defined(CONFIG_MEMFILE_NOTIFIER)
 struct kvm_gfn_range {
 	struct kvm_memory_slot *slot;
 	gfn_t start;
@@ -577,6 +577,7 @@ struct kvm_memory_slot {
 	struct file *private_file;
 	loff_t private_offset;
 	struct memfile_notifier notifier;
+	struct kvm *kvm;
 };
 
 static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
@@ -769,9 +770,13 @@ struct kvm {
 	struct hlist_head irq_ack_notifier_list;
 #endif
 
+#if (defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)) ||\
+	defined(CONFIG_MEMFILE_NOTIFIER)
+	unsigned long mmu_notifier_seq;
+#endif
+
 #if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
 	struct mmu_notifier mmu_notifier;
-	unsigned long mmu_notifier_seq;
 	long mmu_notifier_count;
 	unsigned long mmu_notifier_range_start;
 	unsigned long mmu_notifier_range_end;
@@ -1438,6 +1443,7 @@ bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu);
 int kvm_arch_post_init_vm(struct kvm *kvm);
 void kvm_arch_pre_destroy_vm(struct kvm *kvm);
 int kvm_arch_create_vm_debugfs(struct kvm *kvm);
+bool kvm_arch_private_mem_supported(struct kvm *kvm);
 
 #ifndef __KVM_HAVE_ARCH_VM_ALLOC
 /*
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index db9d39a2d3a6..f93ac7cdfb53 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -843,6 +843,73 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
 
 #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
 
+#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
+static void kvm_private_mem_notifier_handler(struct memfile_notifier *notifier,
+					     pgoff_t start, pgoff_t end)
+{
+	int idx;
+	struct kvm_memory_slot *slot = container_of(notifier,
+						    struct kvm_memory_slot,
+						    notifier);
+	struct kvm_gfn_range gfn_range = {
+		.slot		= slot,
+		.start		= start - (slot->private_offset >> PAGE_SHIFT),
+		.end		= end - (slot->private_offset >> PAGE_SHIFT),
+		.may_block 	= true,
+	};
+	struct kvm *kvm = slot->kvm;
+
+	gfn_range.start = slot->base_gfn + gfn_range.start;
+	gfn_range.end = slot->base_gfn + min((unsigned long)gfn_range.end, slot->npages);
+
+	if (WARN_ON_ONCE(gfn_range.start >= gfn_range.end))
+		return;
+
+	idx = srcu_read_lock(&kvm->srcu);
+	KVM_MMU_LOCK(kvm);
+	if (kvm_unmap_gfn_range(kvm, &gfn_range))
+		kvm_flush_remote_tlbs(kvm);
+	kvm->mmu_notifier_seq++;
+	KVM_MMU_UNLOCK(kvm);
+	srcu_read_unlock(&kvm->srcu, idx);
+}
+
+static struct memfile_notifier_ops kvm_private_mem_notifier_ops = {
+	.populate = kvm_private_mem_notifier_handler,
+	.invalidate = kvm_private_mem_notifier_handler,
+};
+
+#define KVM_MEMFILE_FLAGS MEMFILE_F_USER_INACCESSIBLE | \
+			  MEMFILE_F_UNMOVABLE | \
+			  MEMFILE_F_UNRECLAIMABLE
+
+static inline int kvm_private_mem_register(struct kvm_memory_slot *slot)
+{
+	slot->notifier.ops = &kvm_private_mem_notifier_ops;
+	return memfile_register_notifier(slot->private_file, KVM_MEMFILE_FLAGS,
+					 &slot->notifier);
+}
+
+static inline void kvm_private_mem_unregister(struct kvm_memory_slot *slot)
+{
+	memfile_unregister_notifier(&slot->notifier);
+}
+
+#else /* !CONFIG_HAVE_KVM_PRIVATE_MEM */
+
+static inline int kvm_private_mem_register(struct kvm_memory_slot *slot)
+{
+	WARN_ON_ONCE(1);
+	return -EOPNOTSUPP;
+}
+
+static inline void kvm_private_mem_unregister(struct kvm_memory_slot *slot)
+{
+	WARN_ON_ONCE(1);
+}
+
+#endif /* CONFIG_HAVE_KVM_PRIVATE_MEM */
+
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
 static int kvm_pm_notifier_call(struct notifier_block *bl,
 				unsigned long state,
@@ -887,6 +954,11 @@ static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
 /* This does not remove the slot from struct kvm_memslots data structures */
 static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 {
+	if (slot->flags & KVM_MEM_PRIVATE) {
+		kvm_private_mem_unregister(slot);
+		fput(slot->private_file);
+	}
+
 	kvm_destroy_dirty_bitmap(slot);
 
 	kvm_arch_free_memslot(kvm, slot);
@@ -1437,10 +1509,21 @@ static void kvm_replace_memslot(struct kvm *kvm,
 	}
 }
 
-static int check_memory_region_flags(const struct kvm_userspace_memory_region *mem)
+bool __weak kvm_arch_private_mem_supported(struct kvm *kvm)
+{
+	return false;
+}
+
+static int check_memory_region_flags(struct kvm *kvm,
+				     const struct kvm_user_mem_region *mem)
 {
 	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
 
+#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
+	if (kvm_arch_private_mem_supported(kvm))
+		valid_flags |= KVM_MEM_PRIVATE;
+#endif
+
 #ifdef __KVM_HAVE_READONLY_MEM
 	valid_flags |= KVM_MEM_READONLY;
 #endif
@@ -1516,6 +1599,12 @@ static int kvm_prepare_memory_region(struct kvm *kvm,
 {
 	int r;
 
+	if (change == KVM_MR_CREATE && new->flags & KVM_MEM_PRIVATE) {
+		r = kvm_private_mem_register(new);
+		if (r)
+			return r;
+	}
+
 	/*
 	 * If dirty logging is disabled, nullify the bitmap; the old bitmap
 	 * will be freed on "commit".  If logging is enabled in both old and
@@ -1544,6 +1633,9 @@ static int kvm_prepare_memory_region(struct kvm *kvm,
 	if (r && new && new->dirty_bitmap && old && !old->dirty_bitmap)
 		kvm_destroy_dirty_bitmap(new);
 
+	if (r && change == KVM_MR_CREATE && new->flags & KVM_MEM_PRIVATE)
+	    kvm_private_mem_unregister(new);
+
 	return r;
 }
 
@@ -1840,7 +1932,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	int as_id, id;
 	int r;
 
-	r = check_memory_region_flags(mem);
+	r = check_memory_region_flags(kvm, mem);
 	if (r)
 		return r;
 
@@ -1859,6 +1951,10 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	     !access_ok((void __user *)(unsigned long)mem->userspace_addr,
 			mem->memory_size))
 		return -EINVAL;
+	if (mem->flags & KVM_MEM_PRIVATE &&
+		(mem->private_offset & (PAGE_SIZE - 1) ||
+		 mem->private_offset > U64_MAX - mem->memory_size))
+		return -EINVAL;
 	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_MEM_SLOTS_NUM)
 		return -EINVAL;
 	if (mem->guest_phys_addr + mem->memory_size < mem->guest_phys_addr)
@@ -1897,6 +1993,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
 			return -EINVAL;
 	} else { /* Modify an existing slot. */
+		/* Private memslots are immutable, they can only be deleted. */
+		if (mem->flags & KVM_MEM_PRIVATE)
+			return -EINVAL;
 		if ((mem->userspace_addr != old->userspace_addr) ||
 		    (npages != old->npages) ||
 		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
@@ -1925,10 +2024,27 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	new->npages = npages;
 	new->flags = mem->flags;
 	new->userspace_addr = mem->userspace_addr;
+	if (mem->flags & KVM_MEM_PRIVATE) {
+		new->private_file = fget(mem->private_fd);
+		if (!new->private_file) {
+			r = -EINVAL;
+			goto out;
+		}
+		new->private_offset = mem->private_offset;
+	}
+
+	new->kvm = kvm;
 
 	r = kvm_set_memslot(kvm, old, new, change);
 	if (r)
-		kfree(new);
+		goto out;
+
+	return 0;
+
+out:
+	if (new->private_file)
+		fput(new->private_file);
+	kfree(new);
 	return r;
 }
 EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
@@ -4512,12 +4628,10 @@ static long kvm_vm_ioctl(struct file *filp,
 			(u32 __user *)(argp + offsetof(typeof(mem), flags))))
 			goto out;
 
-		if (flags & KVM_MEM_PRIVATE) {
-			r = -EINVAL;
-			goto out;
-		}
-
-		size = sizeof(struct kvm_userspace_memory_region);
+		if (flags & KVM_MEM_PRIVATE)
+			size = sizeof(struct kvm_userspace_memory_region_ext);
+		else
+			size = sizeof(struct kvm_userspace_memory_region);
 
 		if (copy_from_user(&mem, argp, size))
 			goto out;
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C4764006B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:21:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zP3-0005EF-6F; Fri, 02 Dec 2022 01:20:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p0zOz-0005CY-0r
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:20:01 -0500
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p0zOw-00084m-5t
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669961998; x=1701497998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=88Pkdv7kTSmlac+dsvaEbFSp3wXt4d9KWmWXJPdj1wM=;
 b=hEHxJDl39us7QWLRmlKCx21UZ/xi3nMf/KGCAZs7MdcqmNpk6mR4H9Go
 ozBFV6o9cvue2MIdlSGLdBmuJBuyeduBmEXqeqQKpgVfgNBb3rr8pWW8c
 33wKlqux2yCaW73kR0iqwkAwBLAIx25/XMUDlwyKzOaX86p7H1DTa0XJJ
 luLDHA4avWl2P3YIXK8oyiPbcKQSFnwr/MiFDnp9DI/cS4ukbMJkuzdpl
 LoB4f2dK6I/IysyyCwb3x3+P/c7NmMF7dMU3NV//0xoEVjtgAp1MAqHbv
 qL7UPwwmqNhdDSypM7agcJlR5s6Mw9hwRxmAWSR1aZrqfQuOZSly3YxvB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="380170721"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="380170721"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 22:19:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="733698820"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="733698820"
Received: from chaop.bj.intel.com ([10.240.193.75])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Dec 2022 22:19:45 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Arnd Bergmann <arnd@arndb.de>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: [PATCH v10 9/9] KVM: Enable and expose KVM_MEM_PRIVATE
Date: Fri,  2 Dec 2022 14:13:47 +0800
Message-Id: <20221202061347.1070246-10-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Register/unregister private memslot to fd-based memory backing store
restrictedmem and implement the callbacks for restrictedmem_notifier:
  - invalidate_start()/invalidate_end() to zap the existing memory
    mappings in the KVM page table.
  - error() to request KVM_REQ_MEMORY_MCE and later exit to userspace
    with KVM_EXIT_SHUTDOWN.

Expose KVM_MEM_PRIVATE for memslot and KVM_MEMORY_ATTRIBUTE_PRIVATE for
KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES to userspace but either are
controlled by kvm_arch_has_private_mem() which should be rewritten by
architecture code.

Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/include/asm/kvm_host.h |   1 +
 arch/x86/kvm/x86.c              |  13 +++
 include/linux/kvm_host.h        |   3 +
 virt/kvm/kvm_main.c             | 179 +++++++++++++++++++++++++++++++-
 4 files changed, 191 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 7772ab37ac89..27ef31133352 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -114,6 +114,7 @@
 	KVM_ARCH_REQ_FLAGS(31, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_HV_TLB_FLUSH \
 	KVM_ARCH_REQ_FLAGS(32, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
+#define KVM_REQ_MEMORY_MCE		KVM_ARCH_REQ(33)
 
 #define CR0_RESERVED_BITS                                               \
 	(~(unsigned long)(X86_CR0_PE | X86_CR0_MP | X86_CR0_EM | X86_CR0_TS \
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5aefcff614d2..c67e22f3e2ee 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6587,6 +6587,13 @@ int kvm_arch_pm_notifier(struct kvm *kvm, unsigned long state)
 }
 #endif /* CONFIG_HAVE_KVM_PM_NOTIFIER */
 
+#ifdef CONFIG_HAVE_KVM_RESTRICTED_MEM
+void kvm_arch_memory_mce(struct kvm *kvm)
+{
+	kvm_make_all_cpus_request(kvm, KVM_REQ_MEMORY_MCE);
+}
+#endif
+
 static int kvm_vm_ioctl_get_clock(struct kvm *kvm, void __user *argp)
 {
 	struct kvm_clock_data data = { 0 };
@@ -10357,6 +10364,12 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 
 		if (kvm_check_request(KVM_REQ_UPDATE_CPU_DIRTY_LOGGING, vcpu))
 			static_call(kvm_x86_update_cpu_dirty_logging)(vcpu);
+
+		if (kvm_check_request(KVM_REQ_MEMORY_MCE, vcpu)) {
+			vcpu->run->exit_reason = KVM_EXIT_SHUTDOWN;
+			r = 0;
+			goto out;
+		}
 	}
 
 	if (kvm_check_request(KVM_REQ_EVENT, vcpu) || req_int_win ||
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 153842bb33df..f032d878e034 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -590,6 +590,7 @@ struct kvm_memory_slot {
 	struct file *restricted_file;
 	loff_t restricted_offset;
 	struct restrictedmem_notifier notifier;
+	struct kvm *kvm;
 };
 
 static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
@@ -2363,6 +2364,8 @@ static inline int kvm_restricted_mem_get_pfn(struct kvm_memory_slot *slot,
 	*pfn = page_to_pfn(page);
 	return ret;
 }
+
+void kvm_arch_memory_mce(struct kvm *kvm);
 #endif /* CONFIG_HAVE_KVM_RESTRICTED_MEM */
 
 #endif
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e107afea32f0..ac835fc77273 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -936,6 +936,121 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
 
 #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
 
+#ifdef CONFIG_HAVE_KVM_RESTRICTED_MEM
+static bool restrictedmem_range_is_valid(struct kvm_memory_slot *slot,
+					 pgoff_t start, pgoff_t end,
+					 gfn_t *gfn_start, gfn_t *gfn_end)
+{
+	unsigned long base_pgoff = slot->restricted_offset >> PAGE_SHIFT;
+
+	if (start > base_pgoff)
+		*gfn_start = slot->base_gfn + start - base_pgoff;
+	else
+		*gfn_start = slot->base_gfn;
+
+	if (end < base_pgoff + slot->npages)
+		*gfn_end = slot->base_gfn + end - base_pgoff;
+	else
+		*gfn_end = slot->base_gfn + slot->npages;
+
+	if (*gfn_start >= *gfn_end)
+		return false;
+
+	return true;
+}
+
+static void kvm_restrictedmem_invalidate_begin(struct restrictedmem_notifier *notifier,
+					       pgoff_t start, pgoff_t end)
+{
+	struct kvm_memory_slot *slot = container_of(notifier,
+						    struct kvm_memory_slot,
+						    notifier);
+	struct kvm *kvm = slot->kvm;
+	gfn_t gfn_start, gfn_end;
+	struct kvm_gfn_range gfn_range;
+	int idx;
+
+	if (!restrictedmem_range_is_valid(slot, start, end,
+					  &gfn_start, &gfn_end))
+		return;
+
+	gfn_range.start = gfn_start;
+	gfn_range.end = gfn_end;
+	gfn_range.slot = slot;
+	gfn_range.pte = __pte(0);
+	gfn_range.may_block = true;
+
+	idx = srcu_read_lock(&kvm->srcu);
+	KVM_MMU_LOCK(kvm);
+
+	kvm_mmu_invalidate_begin(kvm);
+	kvm_mmu_invalidate_range_add(kvm, gfn_start, gfn_end);
+	if (kvm_unmap_gfn_range(kvm, &gfn_range))
+		kvm_flush_remote_tlbs(kvm);
+
+	KVM_MMU_UNLOCK(kvm);
+	srcu_read_unlock(&kvm->srcu, idx);
+}
+
+static void kvm_restrictedmem_invalidate_end(struct restrictedmem_notifier *notifier,
+					     pgoff_t start, pgoff_t end)
+{
+	struct kvm_memory_slot *slot = container_of(notifier,
+						    struct kvm_memory_slot,
+						    notifier);
+	struct kvm *kvm = slot->kvm;
+	gfn_t gfn_start, gfn_end;
+
+	if (!restrictedmem_range_is_valid(slot, start, end,
+					  &gfn_start, &gfn_end))
+		return;
+
+	KVM_MMU_LOCK(kvm);
+	kvm_mmu_invalidate_end(kvm);
+	KVM_MMU_UNLOCK(kvm);
+}
+
+static void kvm_restrictedmem_error(struct restrictedmem_notifier *notifier,
+				    pgoff_t start, pgoff_t end)
+{
+	struct kvm_memory_slot *slot = container_of(notifier,
+						    struct kvm_memory_slot,
+						    notifier);
+	kvm_arch_memory_mce(slot->kvm);
+}
+
+static struct restrictedmem_notifier_ops kvm_restrictedmem_notifier_ops = {
+	.invalidate_start = kvm_restrictedmem_invalidate_begin,
+	.invalidate_end = kvm_restrictedmem_invalidate_end,
+	.error = kvm_restrictedmem_error,
+};
+
+static inline void kvm_restrictedmem_register(struct kvm_memory_slot *slot)
+{
+	slot->notifier.ops = &kvm_restrictedmem_notifier_ops;
+	restrictedmem_register_notifier(slot->restricted_file, &slot->notifier);
+}
+
+static inline void kvm_restrictedmem_unregister(struct kvm_memory_slot *slot)
+{
+	restrictedmem_unregister_notifier(slot->restricted_file,
+					  &slot->notifier);
+}
+
+#else /* !CONFIG_HAVE_KVM_RESTRICTED_MEM */
+
+static inline void kvm_restrictedmem_register(struct kvm_memory_slot *slot)
+{
+	WARN_ON_ONCE(1);
+}
+
+static inline void kvm_restrictedmem_unregister(struct kvm_memory_slot *slot)
+{
+	WARN_ON_ONCE(1);
+}
+
+#endif /* CONFIG_HAVE_KVM_RESTRICTED_MEM */
+
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
 static int kvm_pm_notifier_call(struct notifier_block *bl,
 				unsigned long state,
@@ -980,6 +1095,11 @@ static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
 /* This does not remove the slot from struct kvm_memslots data structures */
 static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 {
+	if (slot->flags & KVM_MEM_PRIVATE) {
+		kvm_restrictedmem_unregister(slot);
+		fput(slot->restricted_file);
+	}
+
 	kvm_destroy_dirty_bitmap(slot);
 
 	kvm_arch_free_memslot(kvm, slot);
@@ -1551,10 +1671,14 @@ static void kvm_replace_memslot(struct kvm *kvm,
 	}
 }
 
-static int check_memory_region_flags(const struct kvm_user_mem_region *mem)
+static int check_memory_region_flags(struct kvm *kvm,
+				     const struct kvm_user_mem_region *mem)
 {
 	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
 
+	if (kvm_arch_has_private_mem(kvm))
+		valid_flags |= KVM_MEM_PRIVATE;
+
 #ifdef __KVM_HAVE_READONLY_MEM
 	valid_flags |= KVM_MEM_READONLY;
 #endif
@@ -1630,6 +1754,9 @@ static int kvm_prepare_memory_region(struct kvm *kvm,
 {
 	int r;
 
+	if (change == KVM_MR_CREATE && new->flags & KVM_MEM_PRIVATE)
+		kvm_restrictedmem_register(new);
+
 	/*
 	 * If dirty logging is disabled, nullify the bitmap; the old bitmap
 	 * will be freed on "commit".  If logging is enabled in both old and
@@ -1658,6 +1785,9 @@ static int kvm_prepare_memory_region(struct kvm *kvm,
 	if (r && new && new->dirty_bitmap && (!old || !old->dirty_bitmap))
 		kvm_destroy_dirty_bitmap(new);
 
+	if (r && change == KVM_MR_CREATE && new->flags & KVM_MEM_PRIVATE)
+		kvm_restrictedmem_unregister(new);
+
 	return r;
 }
 
@@ -1963,7 +2093,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	int as_id, id;
 	int r;
 
-	r = check_memory_region_flags(mem);
+	r = check_memory_region_flags(kvm, mem);
 	if (r)
 		return r;
 
@@ -1982,6 +2112,10 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	     !access_ok((void __user *)(unsigned long)mem->userspace_addr,
 			mem->memory_size))
 		return -EINVAL;
+	if (mem->flags & KVM_MEM_PRIVATE &&
+		(mem->restricted_offset & (PAGE_SIZE - 1) ||
+		 mem->restricted_offset > U64_MAX - mem->memory_size))
+		return -EINVAL;
 	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_MEM_SLOTS_NUM)
 		return -EINVAL;
 	if (mem->guest_phys_addr + mem->memory_size < mem->guest_phys_addr)
@@ -2020,6 +2154,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
 			return -EINVAL;
 	} else { /* Modify an existing slot. */
+		/* Private memslots are immutable, they can only be deleted. */
+		if (mem->flags & KVM_MEM_PRIVATE)
+			return -EINVAL;
 		if ((mem->userspace_addr != old->userspace_addr) ||
 		    (npages != old->npages) ||
 		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
@@ -2048,10 +2185,28 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	new->npages = npages;
 	new->flags = mem->flags;
 	new->userspace_addr = mem->userspace_addr;
+	if (mem->flags & KVM_MEM_PRIVATE) {
+		new->restricted_file = fget(mem->restricted_fd);
+		if (!new->restricted_file ||
+		    !file_is_restrictedmem(new->restricted_file)) {
+			r = -EINVAL;
+			goto out;
+		}
+		new->restricted_offset = mem->restricted_offset;
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
+	if (new->restricted_file)
+		fput(new->restricted_file);
+	kfree(new);
 	return r;
 }
 EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
@@ -2351,6 +2506,8 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
 #ifdef CONFIG_HAVE_KVM_MEMORY_ATTRIBUTES
 static u64 kvm_supported_mem_attributes(struct kvm *kvm)
 {
+	if (kvm_arch_has_private_mem(kvm))
+		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
 	return 0;
 }
 
@@ -4822,16 +4979,28 @@ static long kvm_vm_ioctl(struct file *filp,
 	}
 	case KVM_SET_USER_MEMORY_REGION: {
 		struct kvm_user_mem_region mem;
-		unsigned long size = sizeof(struct kvm_userspace_memory_region);
+		unsigned int flags_offset = offsetof(typeof(mem), flags);
+		unsigned long size;
+		u32 flags;
 
 		kvm_sanity_check_user_mem_region_alias();
 
+		memset(&mem, 0, sizeof(mem));
+
 		r = -EFAULT;
+		if (get_user(flags, (u32 __user *)(argp + flags_offset)))
+			goto out;
+
+		if (flags & KVM_MEM_PRIVATE)
+			size = sizeof(struct kvm_userspace_memory_region_ext);
+		else
+			size = sizeof(struct kvm_userspace_memory_region);
+
 		if (copy_from_user(&mem, argp, size))
 			goto out;
 
 		r = -EINVAL;
-		if (mem.flags & KVM_MEM_PRIVATE)
+		if ((flags ^ mem.flags) & KVM_MEM_PRIVATE)
 			goto out;
 
 		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
-- 
2.25.1



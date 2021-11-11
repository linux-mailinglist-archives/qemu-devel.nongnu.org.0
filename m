Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025E444D82C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:21:34 +0100 (CET)
Received: from localhost ([::1]:55554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlAxJ-0001QU-3i
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:21:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlArZ-0000BK-Be
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:15:37 -0500
Received: from mga05.intel.com ([192.55.52.43]:50072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlArW-0006Uy-NY
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:15:36 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="319117315"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="319117315"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 06:15:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="492555679"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 11 Nov 2021 06:15:22 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC PATCH 4/6] kvm: x86: implement private_ops for memfd backing
 store
Date: Thu, 11 Nov 2021 22:13:43 +0800
Message-Id: <20211111141352.26311-5-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
References: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

Call memfd_register_guest() module API to setup private_ops for a given
private memslot.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 arch/x86/kvm/Makefile    |  2 +-
 arch/x86/kvm/memfd.c     | 63 ++++++++++++++++++++++++++++++++++++++++
 include/linux/kvm_host.h |  6 ++++
 virt/kvm/kvm_main.c      | 29 ++++++++++++++++--
 4 files changed, 96 insertions(+), 4 deletions(-)
 create mode 100644 arch/x86/kvm/memfd.c

diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index e7ed25070206..72ad96c78bed 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -16,7 +16,7 @@ kvm-$(CONFIG_KVM_ASYNC_PF)	+= $(KVM)/async_pf.o
 
 kvm-y			+= x86.o emulate.o i8259.o irq.o lapic.o \
 			   i8254.o ioapic.o irq_comm.o cpuid.o pmu.o mtrr.o \
-			   hyperv.o debugfs.o mmu/mmu.o mmu/page_track.o \
+			   hyperv.o debugfs.o memfd.o mmu/mmu.o mmu/page_track.o \
 			   mmu/spte.o
 kvm-$(CONFIG_X86_64) += mmu/tdp_iter.o mmu/tdp_mmu.o
 kvm-$(CONFIG_KVM_XEN)	+= xen.o
diff --git a/arch/x86/kvm/memfd.c b/arch/x86/kvm/memfd.c
new file mode 100644
index 000000000000..e08ab61d09f2
--- /dev/null
+++ b/arch/x86/kvm/memfd.c
@@ -0,0 +1,63 @@
+
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * memfd.c: routines for fd based memory backing store
+ * Copyright (c) 2021, Intel Corporation.
+ *
+ */
+
+#include <linux/kvm_host.h>
+#include <linux/memfd.h>
+const static struct guest_mem_ops *memfd_ops;
+
+static void test_guest_invalidate_page_range(struct inode *inode, void *owner,
+					     pgoff_t start, pgoff_t end)
+{
+	//!!!We can get here after the owner no longer exists
+}
+
+static const struct guest_ops guest_ops = {
+	.invalidate_page_range = test_guest_invalidate_page_range,
+};
+
+static unsigned long memfd_get_lock_pfn(const struct kvm_memory_slot *slot,
+					gfn_t gfn, int *page_level)
+{
+	pgoff_t index = gfn - slot->base_gfn +
+			(slot->userspace_addr >> PAGE_SHIFT);
+
+	return memfd_ops->get_lock_pfn(slot->file->f_inode, index, page_level);
+}
+
+static void memfd_put_unlock_pfn(unsigned long pfn)
+{
+	memfd_ops->put_unlock_pfn(pfn);
+}
+
+static struct kvm_private_memory_ops memfd_private_ops = {
+	.get_lock_pfn = memfd_get_lock_pfn,
+	.put_unlock_pfn = memfd_put_unlock_pfn,
+};
+
+int kvm_register_private_memslot(struct kvm *kvm,
+				 const struct kvm_userspace_memory_region *mem,
+				 struct kvm_memory_slot *slot)
+{
+	struct fd memfd = fdget(mem->fd);
+
+	if(!memfd.file)
+		return -EINVAL;
+
+	slot->file = memfd.file;
+	slot->private_ops = &memfd_private_ops;
+
+	memfd_register_guest(slot->file->f_inode, kvm, &guest_ops, &memfd_ops);
+	return 0;
+}
+
+void kvm_unregister_private_memslot(struct kvm *kvm,
+				 const struct kvm_userspace_memory_region *mem,
+				 struct kvm_memory_slot *slot)
+{
+	fput(slot->file);
+}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 83345460c5f5..17fabb4f53bf 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -777,6 +777,12 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change);
+int kvm_register_private_memslot(struct kvm *kvm,
+				 const struct kvm_userspace_memory_region *mem,
+				 struct kvm_memory_slot *slot);
+void kvm_unregister_private_memslot(struct kvm *kvm,
+				 const struct kvm_userspace_memory_region *mem,
+				 struct kvm_memory_slot *slot);
 /* flush all memory translations */
 void kvm_arch_flush_shadow_all(struct kvm *kvm);
 /* flush memory translations pointing to 'slot' */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fe62df334054..e8e2c5b28aa4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1250,7 +1250,19 @@ static int kvm_set_memslot(struct kvm *kvm,
 		kvm_arch_flush_shadow_memslot(kvm, slot);
 	}
 
+#ifdef KVM_PRIVATE_ADDRESS_SPACE
+	if (change == KVM_MR_CREATE && as_id == KVM_PRIVATE_ADDRESS_SPACE) {
+		r = kvm_register_private_memslot(kvm, mem, new);
+		if (r)
+			goto out_slots;
+	}
+#endif
+
 	r = kvm_arch_prepare_memory_region(kvm, new, mem, change);
+#ifdef KVM_PRIVATE_ADDRESS_SPACE
+	if ((r || change == KVM_MR_DELETE) && as_id == KVM_PRIVATE_ADDRESS_SPACE)
+		kvm_unregister_private_memslot(kvm, mem, new);
+#endif
 	if (r)
 		goto out_slots;
 
@@ -1324,10 +1336,15 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		return -EINVAL;
 	if (mem->guest_phys_addr & (PAGE_SIZE - 1))
 		return -EINVAL;
-	/* We can read the guest memory with __xxx_user() later on. */
 	if ((mem->userspace_addr & (PAGE_SIZE - 1)) ||
-	    (mem->userspace_addr != untagged_addr(mem->userspace_addr)) ||
-	     !access_ok((void __user *)(unsigned long)mem->userspace_addr,
+	    (mem->userspace_addr != untagged_addr(mem->userspace_addr)))
+		return -EINVAL;
+	/* We can read the guest memory with __xxx_user() later on. */
+	if (
+#ifdef KVM_PRIVATE_ADDRESS_SPACE
+	    as_id != KVM_PRIVATE_ADDRESS_SPACE &&
+#endif
+	    !access_ok((void __user *)(unsigned long)mem->userspace_addr,
 			mem->memory_size))
 		return -EINVAL;
 	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_MEM_SLOTS_NUM)
@@ -1368,6 +1385,12 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		new.dirty_bitmap = NULL;
 		memset(&new.arch, 0, sizeof(new.arch));
 	} else { /* Modify an existing slot. */
+#ifdef KVM_PRIVATE_ADDRESS_SPACE
+		/* Private memslots are immutable, they can only be deleted. */
+		if (as_id == KVM_PRIVATE_ADDRESS_SPACE)
+			return -EINVAL;
+#endif
+
 		if ((new.userspace_addr != old.userspace_addr) ||
 		    (new.npages != old.npages) ||
 		    ((new.flags ^ old.flags) & KVM_MEM_READONLY))
-- 
2.17.1



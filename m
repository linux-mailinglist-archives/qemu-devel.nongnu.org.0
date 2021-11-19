Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38098457037
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:05:00 +0100 (CET)
Received: from localhost ([::1]:55438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4Vf-0000rS-Ax
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:04:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mo4GW-0006cf-SU
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:49:20 -0500
Received: from mga18.intel.com ([134.134.136.126]:21990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mo4GU-0000Je-JU
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:49:20 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="221293891"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="221293891"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 05:49:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="507904918"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 19 Nov 2021 05:49:08 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC v2 PATCH 05/13] KVM: Implement fd-based memory using new memfd
 interfaces
Date: Fri, 19 Nov 2021 21:47:31 +0800
Message-Id: <20211119134739.20218-6-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga18.intel.com
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

This patch pairs a fd-based memslot to a memory backing store. Two sides
handshake to exchange callbacks that will be called later.

KVM->memfd:
  - get_pfn: get or allocate(when alloc is true) page at specified
    offset in the fd, the page will be locked
  - put_pfn: put and unlock the pfn

memfd->KVM:
  - invalidate_page_range: called when userspace punch hole on the fd,
    KVM should unmap related pages in the second MMU
  - fallocate: called when userspace fallocate space on the fd, KVM
    can map related pages in the second MMU

Currently tmpfs behind memfd interface is supported.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 arch/x86/kvm/Makefile    |   3 +-
 include/linux/kvm_host.h |   6 +++
 virt/kvm/memfd.c         | 101 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 virt/kvm/memfd.c

diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index f919df73e5e3..5d7f289b1ca0 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -11,7 +11,8 @@ KVM := ../../../virt/kvm
 
 kvm-y			+= $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o \
 				$(KVM)/eventfd.o $(KVM)/irqchip.o $(KVM)/vfio.o \
-				$(KVM)/dirty_ring.o $(KVM)/binary_stats.o
+				$(KVM)/dirty_ring.o $(KVM)/binary_stats.o \
+				$(KVM)/memfd.o
 kvm-$(CONFIG_KVM_ASYNC_PF)	+= $(KVM)/async_pf.o
 
 kvm-y			+= x86.o emulate.o i8259.o irq.o lapic.o \
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 1d4ac0c9b63b..e8646103356b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -769,6 +769,12 @@ static inline void kvm_irqfd_exit(void)
 {
 }
 #endif
+
+int kvm_memfd_register(struct kvm *kvm,
+		       const struct kvm_userspace_memory_region_ext *mem,
+		       struct kvm_memory_slot *slot);
+void kvm_memfd_unregister(struct kvm *kvm, struct kvm_memory_slot *slot);
+
 int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 		  struct module *module);
 void kvm_exit(void);
diff --git a/virt/kvm/memfd.c b/virt/kvm/memfd.c
new file mode 100644
index 000000000000..bd930dcb455f
--- /dev/null
+++ b/virt/kvm/memfd.c
@@ -0,0 +1,101 @@
+
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * memfd.c: routines for fd based guest memory backing store
+ * Copyright (c) 2021, Intel Corporation.
+ *
+ * Author:
+ *	Chao Peng <chao.p.peng@linux.intel.com>
+ */
+
+#include <linux/kvm_host.h>
+#include <linux/memfd.h>
+const static struct guest_mem_ops *memfd_ops;
+
+static void memfd_invalidate_page_range(struct inode *inode, void *owner,
+					pgoff_t start, pgoff_t end)
+{
+	//!!!We can get here after the owner no longer exists
+}
+
+static void memfd_fallocate(struct inode *inode, void *owner,
+			    pgoff_t start, pgoff_t end)
+{
+	//!!!We can get here after the owner no longer exists
+}
+
+static const struct guest_ops memfd_notifier = {
+	.invalidate_page_range = memfd_invalidate_page_range,
+	.fallocate = memfd_fallocate,
+};
+
+static kvm_pfn_t kvm_memfd_get_pfn(struct kvm_memory_slot *slot,
+				   struct file *file, gfn_t gfn,
+				   bool alloc, int *order)
+{
+	pgoff_t index = gfn - slot->base_gfn +
+			(slot->userspace_addr >> PAGE_SHIFT);
+
+	return memfd_ops->get_lock_pfn(file->f_inode, index, alloc, order);
+}
+
+static void kvm_memfd_put_pfn(kvm_pfn_t pfn)
+{
+	memfd_ops->put_unlock_pfn(pfn);
+}
+
+static struct kvm_memfd_ops kvm_memfd_ops = {
+	.get_pfn = kvm_memfd_get_pfn,
+	.put_pfn = kvm_memfd_put_pfn,
+};
+
+int kvm_memfd_register(struct kvm *kvm,
+		       const struct kvm_userspace_memory_region_ext *mem,
+		       struct kvm_memory_slot *slot)
+{
+	int ret;
+	struct fd fd = fdget(mem->fd);
+
+	if (!fd.file)
+		return -EINVAL;
+
+	ret = memfd_register_guest(fd.file->f_inode, kvm,
+				   &memfd_notifier, &memfd_ops);
+	if (ret)
+		return ret;
+	slot->file = fd.file;
+
+	if (mem->private_fd >= 0) {
+		fd = fdget(mem->private_fd);
+		if (!fd.file) {
+			ret = -EINVAL;
+			goto err;
+		}
+
+		ret = memfd_register_guest(fd.file->f_inode, kvm,
+					   &memfd_notifier, &memfd_ops);
+		if (ret)
+			goto err;
+		slot->priv_file = fd.file;
+	}
+
+	slot->memfd_ops = &kvm_memfd_ops;
+	return 0;
+err:
+	kvm_memfd_unregister(kvm, slot);
+	return ret;
+}
+
+void kvm_memfd_unregister(struct kvm *kvm, struct kvm_memory_slot *slot)
+{
+	if (slot->file) {
+		fput(slot->file);
+		slot->file = NULL;
+	}
+
+	if (slot->priv_file) {
+		fput(slot->priv_file);
+		slot->priv_file = NULL;
+	}
+	slot->memfd_ops = NULL;
+}
-- 
2.17.1



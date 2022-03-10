Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8305F4D4962
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:22:41 +0100 (CET)
Received: from localhost ([::1]:58052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJge-0003GD-LW
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:22:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJUM-0005J5-GW
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:09:58 -0500
Received: from mga12.intel.com ([192.55.52.136]:3802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJUI-0004dS-RC
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646921394; x=1678457394;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=GbR4wRPHIwdHjPFQakoEmpS8z2SMsND5ZXVQtQDRCQY=;
 b=KZt9Kv+cCc8+gM6D45kuzByzwGG4mvyQWp3BwKL0xW55l+Lg+YCR0Px+
 e/lq/FNz/Wtr9dI4k1rGNytSnsP85gZICizmUO1JDVfqO0eVX+LYxSOrq
 8+A8C/A6pfPjfWWlooIL4/xj4cc00S2S1SAK9XoCjb549/AxfuGWgQToc
 3NA9pWCWRqonm38HEq2Gdck80seS1MvSmboxLmgXobf3YmCllVwshvcX5
 5J8DvSsuND9f9NDPS3nSSazp2lX3c6JZ3+tXUrSj4QUeyhvAbLPl8XgOF
 iI8KfNmmJDCGvwuYuwG6+g6AsPq9MGJUvb084ID5IhC/xyIofnkxPPNa4 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="235205944"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="235205944"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:09:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="554654831"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 10 Mar 2022 06:09:44 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v5 02/13] mm: Introduce memfile_notifier
Date: Thu, 10 Mar 2022 22:09:00 +0800
Message-Id: <20220310140911.50924-3-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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

This patch introduces memfile_notifier facility so existing memory file
subsystems (e.g. tmpfs/hugetlbfs) can provide memory pages to allow a
third kernel component to make use of memory bookmarked in the memory
file and gets notified when the pages in the memory file become
allocated/invalidated.

It will be used for KVM to use a file descriptor as the guest memory
backing store and KVM will use this memfile_notifier interface to
interact with memory file subsystems. In the future there might be other
consumers (e.g. VFIO with encrypted device memory).

It consists two sets of callbacks:
  - memfile_notifier_ops: callbacks for memory backing store to notify
    KVM when memory gets allocated/invalidated.
  - memfile_pfn_ops: callbacks for KVM to call into memory backing store
    to request memory pages for guest private memory.

Userspace is in charge of guest memory lifecycle: it first allocates
pages in memory backing store and then passes the fd to KVM and lets KVM
register each memory slot to memory backing store via
memfile_register_notifier.

The supported memory backing store should maintain a memfile_notifier list
and provide routine for memfile_notifier to get the list head address and
memfile_pfn_ops callbacks for memfile_register_notifier. It also should call
memfile_notifier_fallocate/memfile_notifier_invalidate when the bookmarked
memory gets allocated/invalidated.

Co-developed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/memfile_notifier.h |  64 +++++++++++++++++
 mm/Kconfig                       |   4 ++
 mm/Makefile                      |   1 +
 mm/memfile_notifier.c            | 114 +++++++++++++++++++++++++++++++
 4 files changed, 183 insertions(+)
 create mode 100644 include/linux/memfile_notifier.h
 create mode 100644 mm/memfile_notifier.c

diff --git a/include/linux/memfile_notifier.h b/include/linux/memfile_notifier.h
new file mode 100644
index 000000000000..e8d400558adb
--- /dev/null
+++ b/include/linux/memfile_notifier.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_MEMFILE_NOTIFIER_H
+#define _LINUX_MEMFILE_NOTIFIER_H
+
+#include <linux/rculist.h>
+#include <linux/spinlock.h>
+#include <linux/srcu.h>
+#include <linux/fs.h>
+
+struct memfile_notifier;
+
+struct memfile_notifier_ops {
+	void (*invalidate)(struct memfile_notifier *notifier,
+			   pgoff_t start, pgoff_t end);
+	void (*fallocate)(struct memfile_notifier *notifier,
+			  pgoff_t start, pgoff_t end);
+};
+
+struct memfile_pfn_ops {
+	long (*get_lock_pfn)(struct inode *inode, pgoff_t offset, int *order);
+	void (*put_unlock_pfn)(unsigned long pfn);
+};
+
+struct memfile_notifier {
+	struct list_head list;
+	struct memfile_notifier_ops *ops;
+};
+
+struct memfile_notifier_list {
+	struct list_head head;
+	spinlock_t lock;
+};
+
+struct memfile_backing_store {
+	struct list_head list;
+	struct memfile_pfn_ops pfn_ops;
+	struct memfile_notifier_list* (*get_notifier_list)(struct inode *inode);
+};
+
+#ifdef CONFIG_MEMFILE_NOTIFIER
+/* APIs for backing stores */
+static inline void memfile_notifier_list_init(struct memfile_notifier_list *list)
+{
+	INIT_LIST_HEAD(&list->head);
+	spin_lock_init(&list->lock);
+}
+
+extern void memfile_notifier_invalidate(struct memfile_notifier_list *list,
+					pgoff_t start, pgoff_t end);
+extern void memfile_notifier_fallocate(struct memfile_notifier_list *list,
+				       pgoff_t start, pgoff_t end);
+extern void memfile_register_backing_store(struct memfile_backing_store *bs);
+extern void memfile_unregister_backing_store(struct memfile_backing_store *bs);
+
+/*APIs for notifier consumers */
+extern int memfile_register_notifier(struct inode *inode,
+				     struct memfile_notifier *notifier,
+				     struct memfile_pfn_ops **pfn_ops);
+extern void memfile_unregister_notifier(struct inode *inode,
+					struct memfile_notifier *notifier);
+
+#endif /* CONFIG_MEMFILE_NOTIFIER */
+
+#endif /* _LINUX_MEMFILE_NOTIFIER_H */
diff --git a/mm/Kconfig b/mm/Kconfig
index 3326ee3903f3..7c6b1ad3dade 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -892,6 +892,10 @@ config ANON_VMA_NAME
 	  area from being merged with adjacent virtual memory areas due to the
 	  difference in their name.
 
+config MEMFILE_NOTIFIER
+	bool
+	select SRCU
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index 70d4309c9ce3..f628256dce0d 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -132,3 +132,4 @@ obj-$(CONFIG_PAGE_REPORTING) += page_reporting.o
 obj-$(CONFIG_IO_MAPPING) += io-mapping.o
 obj-$(CONFIG_HAVE_BOOTMEM_INFO_NODE) += bootmem_info.o
 obj-$(CONFIG_GENERIC_IOREMAP) += ioremap.o
+obj-$(CONFIG_MEMFILE_NOTIFIER) += memfile_notifier.o
diff --git a/mm/memfile_notifier.c b/mm/memfile_notifier.c
new file mode 100644
index 000000000000..a405db56fde2
--- /dev/null
+++ b/mm/memfile_notifier.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  linux/mm/memfile_notifier.c
+ *
+ *  Copyright (C) 2022  Intel Corporation.
+ *             Chao Peng <chao.p.peng@linux.intel.com>
+ */
+
+#include <linux/memfile_notifier.h>
+#include <linux/srcu.h>
+
+DEFINE_STATIC_SRCU(srcu);
+static LIST_HEAD(backing_store_list);
+
+void memfile_notifier_invalidate(struct memfile_notifier_list *list,
+				 pgoff_t start, pgoff_t end)
+{
+	struct memfile_notifier *notifier;
+	int id;
+
+	id = srcu_read_lock(&srcu);
+	list_for_each_entry_srcu(notifier, &list->head, list,
+				 srcu_read_lock_held(&srcu)) {
+		if (notifier->ops && notifier->ops->invalidate)
+			notifier->ops->invalidate(notifier, start, end);
+	}
+	srcu_read_unlock(&srcu, id);
+}
+
+void memfile_notifier_fallocate(struct memfile_notifier_list *list,
+				pgoff_t start, pgoff_t end)
+{
+	struct memfile_notifier *notifier;
+	int id;
+
+	id = srcu_read_lock(&srcu);
+	list_for_each_entry_srcu(notifier, &list->head, list,
+				 srcu_read_lock_held(&srcu)) {
+		if (notifier->ops && notifier->ops->fallocate)
+			notifier->ops->fallocate(notifier, start, end);
+	}
+	srcu_read_unlock(&srcu, id);
+}
+
+void memfile_register_backing_store(struct memfile_backing_store *bs)
+{
+	BUG_ON(!bs || !bs->get_notifier_list);
+
+	list_add_tail(&bs->list, &backing_store_list);
+}
+
+void memfile_unregister_backing_store(struct memfile_backing_store *bs)
+{
+	list_del(&bs->list);
+}
+
+static int memfile_get_notifier_info(struct inode *inode,
+				     struct memfile_notifier_list **list,
+				     struct memfile_pfn_ops **ops)
+{
+	struct memfile_backing_store *bs, *iter;
+	struct memfile_notifier_list *tmp;
+
+	list_for_each_entry_safe(bs, iter, &backing_store_list, list) {
+		tmp = bs->get_notifier_list(inode);
+		if (tmp) {
+			*list = tmp;
+			if (ops)
+				*ops = &bs->pfn_ops;
+			return 0;
+		}
+	}
+	return -EOPNOTSUPP;
+}
+
+int memfile_register_notifier(struct inode *inode,
+			      struct memfile_notifier *notifier,
+			      struct memfile_pfn_ops **pfn_ops)
+{
+	struct memfile_notifier_list *list;
+	int ret;
+
+	if (!inode || !notifier | !pfn_ops)
+		return -EINVAL;
+
+	ret = memfile_get_notifier_info(inode, &list, pfn_ops);
+	if (ret)
+		return ret;
+
+	spin_lock(&list->lock);
+	list_add_rcu(&notifier->list, &list->head);
+	spin_unlock(&list->lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(memfile_register_notifier);
+
+void memfile_unregister_notifier(struct inode *inode,
+				 struct memfile_notifier *notifier)
+{
+	struct memfile_notifier_list *list;
+
+	if (!inode || !notifier)
+		return;
+
+	BUG_ON(memfile_get_notifier_info(inode, &list, NULL));
+
+	spin_lock(&list->lock);
+	list_del_rcu(&notifier->list);
+	spin_unlock(&list->lock);
+
+	synchronize_srcu(&srcu);
+}
+EXPORT_SYMBOL_GPL(memfile_unregister_notifier);
-- 
2.17.1



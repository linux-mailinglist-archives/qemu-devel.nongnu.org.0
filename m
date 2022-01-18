Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF85492862
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:29:45 +0100 (CET)
Received: from localhost ([::1]:35552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pUW-0006Hr-8g
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:29:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oRT-0001Db-WE
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:22:32 -0500
Received: from mga06.intel.com ([134.134.136.31]:48472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oRQ-0003G7-Uv
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642512149; x=1674048149;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=HZ8RoYPmQ6m9k6Lgoc+xE+GTQI3+IhGwWjUNoTgoWzo=;
 b=ROoWUCb8HZMzILMU5r/gs0hCuS7ziciYkPS6/4OPDuqpTg4sg8rVUu1I
 mUnYSz/Q03nTfqZ6EVuor5gzw7Mh87aOz5PdFTnJ0ZFCdfccwm4VmPgJB
 lJckQYXdTnhxouh5qFHVUXCeJ9V45uB5x6DD5decsXw3FNEfZD52vDrsk
 6C92Z4lZPWqx9NdUxt2nM2IQNM9eK2y1XDpaeXfrNopgArQlcdnQk7CS2
 2pdAHWyCokhLxnYe3jPX9drE3CeyfiGTGQt6nUeBGRFMzGJkXc7CehB3b
 p7m9sN3hqeskMaaQTd3GR//KilYjHcAmyejevAFe1evW3uQIzwCW+7rx4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="305545793"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="305545793"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 05:22:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="531791758"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 05:22:20 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v4 04/12] mm/shmem: Support memfile_notifier
Date: Tue, 18 Jan 2022 21:21:13 +0800
Message-Id: <20220118132121.31388-5-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga06.intel.com
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

It maintains a memfile_notifier list in shmem_inode_info structure and
implements memfile_pfn_ops callbacks defined by memfile_notifier. It
then exposes them to memfile_notifier via
shmem_get_memfile_notifier_info.

We use SGP_NOALLOC in shmem_get_lock_pfn since the pages should be
allocated by userspace for private memory. If there is no pages
allocated at the offset then error should be returned so KVM knows that
the memory is not private memory.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/shmem_fs.h |  4 ++
 mm/memfile_notifier.c    | 12 +++++-
 mm/shmem.c               | 81 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index 166158b6e917..461633587eaf 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -9,6 +9,7 @@
 #include <linux/percpu_counter.h>
 #include <linux/xattr.h>
 #include <linux/fs_parser.h>
+#include <linux/memfile_notifier.h>
 
 /* inode in-kernel data */
 
@@ -24,6 +25,9 @@ struct shmem_inode_info {
 	struct shared_policy	policy;		/* NUMA memory alloc policy */
 	struct simple_xattrs	xattrs;		/* list of xattrs */
 	atomic_t		stop_eviction;	/* hold when working on inode */
+#ifdef CONFIG_MEMFILE_NOTIFIER
+	struct memfile_notifier_list memfile_notifiers;
+#endif
 	struct inode		vfs_inode;
 };
 
diff --git a/mm/memfile_notifier.c b/mm/memfile_notifier.c
index 8171d4601a04..b4699cbf629e 100644
--- a/mm/memfile_notifier.c
+++ b/mm/memfile_notifier.c
@@ -41,11 +41,21 @@ void memfile_notifier_fallocate(struct memfile_notifier_list *list,
 	srcu_read_unlock(&srcu, id);
 }
 
+#ifdef CONFIG_SHMEM
+extern int shmem_get_memfile_notifier_info(struct inode *inode,
+					struct memfile_notifier_list **list,
+					struct memfile_pfn_ops **ops);
+#endif
+
 static int memfile_get_notifier_info(struct inode *inode,
 				     struct memfile_notifier_list **list,
 				     struct memfile_pfn_ops **ops)
 {
-	return -EOPNOTSUPP;
+	int ret = -EOPNOTSUPP;
+#ifdef CONFIG_SHMEM
+	ret = shmem_get_memfile_notifier_info(inode, list, ops);
+#endif
+	return ret;
 }
 
 int memfile_register_notifier(struct inode *inode,
diff --git a/mm/shmem.c b/mm/shmem.c
index 72185630e7c4..00af869d26ce 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -906,6 +906,28 @@ static bool shmem_punch_compound(struct page *page, pgoff_t start, pgoff_t end)
 	return split_huge_page(page) >= 0;
 }
 
+static void notify_fallocate(struct inode *inode, pgoff_t start, pgoff_t end)
+{
+#ifdef CONFIG_MEMFILE_NOTIFIER
+	struct shmem_inode_info *info = SHMEM_I(inode);
+
+	memfile_notifier_fallocate(&info->memfile_notifiers, start, end);
+#endif
+}
+
+static void notify_invalidate_page(struct inode *inode, struct page *page,
+				   pgoff_t start, pgoff_t end)
+{
+#ifdef CONFIG_MEMFILE_NOTIFIER
+	struct shmem_inode_info *info = SHMEM_I(inode);
+
+	start = max(start, page->index);
+	end = min(end, page->index + thp_nr_pages(page));
+
+	memfile_notifier_invalidate(&info->memfile_notifiers, start, end);
+#endif
+}
+
 /*
  * Remove range of pages and swap entries from page cache, and free them.
  * If !unfalloc, truncate or punch hole; if unfalloc, undo failed fallocate.
@@ -949,6 +971,8 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, loff_t lend,
 			}
 			index += thp_nr_pages(page) - 1;
 
+			notify_invalidate_page(inode, page, start, end);
+
 			if (!unfalloc || !PageUptodate(page))
 				truncate_inode_page(mapping, page);
 			unlock_page(page);
@@ -1025,6 +1049,9 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, loff_t lend,
 					index--;
 					break;
 				}
+
+				notify_invalidate_page(inode, page, start, end);
+
 				VM_BUG_ON_PAGE(PageWriteback(page), page);
 				if (shmem_punch_compound(page, start, end))
 					truncate_inode_page(mapping, page);
@@ -2313,6 +2340,9 @@ static struct inode *shmem_get_inode(struct super_block *sb, const struct inode
 		info->flags = flags & VM_NORESERVE;
 		INIT_LIST_HEAD(&info->shrinklist);
 		INIT_LIST_HEAD(&info->swaplist);
+#ifdef CONFIG_MEMFILE_NOTIFIER
+		memfile_notifier_list_init(&info->memfile_notifiers);
+#endif
 		simple_xattrs_init(&info->xattrs);
 		cache_no_acl(inode);
 		mapping_set_large_folios(inode->i_mapping);
@@ -2818,6 +2848,7 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 	if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + len > inode->i_size)
 		i_size_write(inode, offset + len);
 	inode->i_ctime = current_time(inode);
+	notify_fallocate(inode, start, end);
 undone:
 	spin_lock(&inode->i_lock);
 	inode->i_private = NULL;
@@ -4002,6 +4033,56 @@ struct kobj_attribute shmem_enabled_attr =
 	__ATTR(shmem_enabled, 0644, shmem_enabled_show, shmem_enabled_store);
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE && CONFIG_SYSFS */
 
+#ifdef CONFIG_MEMFILE_NOTIFIER
+static long shmem_get_lock_pfn(struct inode *inode, pgoff_t offset, int *order)
+{
+	struct page *page;
+	int ret;
+
+	ret = shmem_getpage(inode, offset, &page, SGP_NOALLOC);
+	if (ret)
+		return ret;
+
+	*order = thp_order(compound_head(page));
+
+	return page_to_pfn(page);
+}
+
+static void shmem_put_unlock_pfn(unsigned long pfn)
+{
+	struct page *page = pfn_to_page(pfn);
+
+	VM_BUG_ON_PAGE(!PageLocked(page), page);
+
+	set_page_dirty(page);
+	unlock_page(page);
+	put_page(page);
+}
+
+static struct memfile_pfn_ops shmem_pfn_ops = {
+	.get_lock_pfn = shmem_get_lock_pfn,
+	.put_unlock_pfn = shmem_put_unlock_pfn,
+};
+
+int shmem_get_memfile_notifier_info(struct inode *inode,
+				    struct memfile_notifier_list **list,
+				    struct memfile_pfn_ops **ops)
+{
+	struct shmem_inode_info *info;
+
+	if (!shmem_mapping(inode->i_mapping))
+		return -EINVAL;
+
+	info = SHMEM_I(inode);
+	*list = &info->memfile_notifiers;
+	if (ops)
+		*ops = &shmem_pfn_ops;
+
+	return 0;
+}
+
+#endif /* CONFIG_MEMFILE_NOTIFIER */
+
 #else /* !CONFIG_SHMEM */
 
 /*
-- 
2.17.1



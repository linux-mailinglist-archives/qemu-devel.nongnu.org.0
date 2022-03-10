Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B1C4D4968
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:24:09 +0100 (CET)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJi4-0005tu-Rw
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:24:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJUR-0005WI-Ve
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:10:04 -0500
Received: from mga07.intel.com ([134.134.136.100]:62813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJUP-0004eI-M8
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646921401; x=1678457401;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=LshKgds1U2bNEdA3l08Zy9WrXI0Fxarkx0V/cuLKyUc=;
 b=azREEZj2WvSF3w5S7E5ujiwkNVcuTS3IHPy1PcR6ATAXKfa3BWeQ+Nwb
 qFfbO+iRa5ME16b5s4jVN+a1NQ/EX5ieWQppWEvZTzOKUrFy3EyzZ5sHs
 YodjDaLpPvbQNSqRc+o+rY76Czi2vwZ+QRXMiZJDAsYK1DZq0K6G1DP2A
 7E2yRIIgBdicB24Jcwo+LK3l2E/bDlsplluNzDBY0mvEjNz2WEhGeSLR/
 S32Y9mVJUGSf5fMzXu+LhBqNva62LoorwBO6cw3I9cOi1zOnR/fFGQyID
 mLX2N0jlpxdKMNc3yjxOp5UVNdOYyMjBH35uWfpEGZpl1Pih6juZzAfAA g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318479296"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="318479296"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:10:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="554654872"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 10 Mar 2022 06:09:52 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v5 03/13] mm/shmem: Support memfile_notifier
Date: Thu, 10 Mar 2022 22:09:01 +0800
Message-Id: <20220310140911.50924-4-chao.p.peng@linux.intel.com>
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

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

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
 include/linux/shmem_fs.h |  4 +++
 mm/shmem.c               | 76 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index 2dde843f28ef..7bb16f2d2825 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -9,6 +9,7 @@
 #include <linux/percpu_counter.h>
 #include <linux/xattr.h>
 #include <linux/fs_parser.h>
+#include <linux/memfile_notifier.h>
 
 /* inode in-kernel data */
 
@@ -28,6 +29,9 @@ struct shmem_inode_info {
 	struct simple_xattrs	xattrs;		/* list of xattrs */
 	atomic_t		stop_eviction;	/* hold when working on inode */
 	unsigned int		xflags;		/* shmem extended flags */
+#ifdef CONFIG_MEMFILE_NOTIFIER
+	struct memfile_notifier_list memfile_notifiers;
+#endif
 	struct inode		vfs_inode;
 };
 
diff --git a/mm/shmem.c b/mm/shmem.c
index 9b31a7056009..7b43e274c9a2 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -903,6 +903,28 @@ static struct folio *shmem_get_partial_folio(struct inode *inode, pgoff_t index)
 	return page ? page_folio(page) : NULL;
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
+static void notify_invalidate_page(struct inode *inode, struct folio *folio,
+				   pgoff_t start, pgoff_t end)
+{
+#ifdef CONFIG_MEMFILE_NOTIFIER
+	struct shmem_inode_info *info = SHMEM_I(inode);
+
+	start = max(start, folio->index);
+	end = min(end, folio->index + folio_nr_pages(folio));
+
+	memfile_notifier_invalidate(&info->memfile_notifiers, start, end);
+#endif
+}
+
 /*
  * Remove range of pages and swap entries from page cache, and free them.
  * If !unfalloc, truncate or punch hole; if unfalloc, undo failed fallocate.
@@ -946,6 +968,8 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, loff_t lend,
 			}
 			index += folio_nr_pages(folio) - 1;
 
+			notify_invalidate_page(inode, folio, start, end);
+
 			if (!unfalloc || !folio_test_uptodate(folio))
 				truncate_inode_folio(mapping, folio);
 			folio_unlock(folio);
@@ -1019,6 +1043,9 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, loff_t lend,
 					index--;
 					break;
 				}
+
+				notify_invalidate_page(inode, folio, start, end);
+
 				VM_BUG_ON_FOLIO(folio_test_writeback(folio),
 						folio);
 				truncate_inode_folio(mapping, folio);
@@ -2279,6 +2306,9 @@ static struct inode *shmem_get_inode(struct super_block *sb, const struct inode
 		info->flags = flags & VM_NORESERVE;
 		INIT_LIST_HEAD(&info->shrinklist);
 		INIT_LIST_HEAD(&info->swaplist);
+#ifdef CONFIG_MEMFILE_NOTIFIER
+		memfile_notifier_list_init(&info->memfile_notifiers);
+#endif
 		simple_xattrs_init(&info->xattrs);
 		cache_no_acl(inode);
 		mapping_set_large_folios(inode->i_mapping);
@@ -2802,6 +2832,7 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 	if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + len > inode->i_size)
 		i_size_write(inode, offset + len);
 	inode->i_ctime = current_time(inode);
+	notify_fallocate(inode, start, end);
 undone:
 	spin_lock(&inode->i_lock);
 	inode->i_private = NULL;
@@ -3909,6 +3940,47 @@ static struct file_system_type shmem_fs_type = {
 	.fs_flags	= FS_USERNS_MOUNT,
 };
 
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
+static struct memfile_notifier_list* shmem_get_notifier_list(struct inode *inode)
+{
+	if (!shmem_mapping(inode->i_mapping))
+		return NULL;
+
+	return  &SHMEM_I(inode)->memfile_notifiers;
+}
+
+static struct memfile_backing_store shmem_backing_store = {
+	.pfn_ops.get_lock_pfn = shmem_get_lock_pfn,
+	.pfn_ops.put_unlock_pfn = shmem_put_unlock_pfn,
+	.get_notifier_list = shmem_get_notifier_list,
+};
+#endif /* CONFIG_MEMFILE_NOTIFIER */
+
 int __init shmem_init(void)
 {
 	int error;
@@ -3934,6 +4006,10 @@ int __init shmem_init(void)
 	else
 		shmem_huge = SHMEM_HUGE_NEVER; /* just in case it was patched */
 #endif
+
+#ifdef CONFIG_MEMFILE_NOTIFIER
+	memfile_register_backing_store(&shmem_backing_store);
+#endif
 	return 0;
 
 out1:
-- 
2.17.1



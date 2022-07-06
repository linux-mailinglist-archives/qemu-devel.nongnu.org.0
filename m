Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9120B56820E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 10:48:25 +0200 (CEST)
Received: from localhost ([::1]:45538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o90hs-0005Jj-JH
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 04:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o90Kq-0005m2-MI
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:39 -0400
Received: from mga04.intel.com ([192.55.52.120]:8801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o90Km-0000MD-KA
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657095872; x=1688631872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MKQ/rcKgV3drdHlWuFoH8sIMBaUN6eYji0w3R3tli4U=;
 b=S0wNWYGkWgdx2DWk+/61SmAmVxk9H4/ME+K1uTSfYCOy5OmmZfqWaCQn
 MzTJPA8VfhwX8+wcGle0oVFUncYhLIucUdNvPFHVasnx64M9Wj7UBwFG5
 M9MFgUNX197g94vtOt3SWFkvcoUrybUyxtUQjhiF+jdanBGVZccwROvGD
 lMOnG3yFED8CXdrBoP7eUc480VvJLiKLVerjBnByekuEC7Olej9VUYJY/
 lE+hYLXqeoCi25cll3f3ndPQJFJ2ODVFYRwneU7dQgf1trayFHjXRfhF4
 KesDEh5z9aXObFvlglNgQ0qItZNd44MOC2sDas7cFcGEgqjnrnc9P0He1 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="282433239"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="282433239"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 01:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="567967895"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga006.jf.intel.com with ESMTP; 06 Jul 2022 01:24:19 -0700
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
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
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 04/14] mm/shmem: Support memfile_notifier
Date: Wed,  6 Jul 2022 16:20:06 +0800
Message-Id: <20220706082016.2603916-5-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Implement shmem as a memfile_notifier backing store. Essentially it
interacts with the memfile_notifier feature flags for userspace
access/page migration/page reclaiming and implements the necessary
memfile_backing_store callbacks.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/shmem_fs.h |   2 +
 mm/shmem.c               | 109 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index a68f982f22d1..6031c0b08d26 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -9,6 +9,7 @@
 #include <linux/percpu_counter.h>
 #include <linux/xattr.h>
 #include <linux/fs_parser.h>
+#include <linux/memfile_notifier.h>
 
 /* inode in-kernel data */
 
@@ -25,6 +26,7 @@ struct shmem_inode_info {
 	struct simple_xattrs	xattrs;		/* list of xattrs */
 	atomic_t		stop_eviction;	/* hold when working on inode */
 	struct timespec64	i_crtime;	/* file creation time */
+	struct memfile_node	memfile_node;	/* memfile node */
 	struct inode		vfs_inode;
 };
 
diff --git a/mm/shmem.c b/mm/shmem.c
index 6c8aef15a17d..627e315c3b4d 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -905,6 +905,17 @@ static struct folio *shmem_get_partial_folio(struct inode *inode, pgoff_t index)
 	return page ? page_folio(page) : NULL;
 }
 
+static void notify_invalidate(struct inode *inode, struct folio *folio,
+				   pgoff_t start, pgoff_t end)
+{
+	struct shmem_inode_info *info = SHMEM_I(inode);
+
+	start = max(start, folio->index);
+	end = min(end, folio->index + folio_nr_pages(folio));
+
+	memfile_notifier_invalidate(&info->memfile_node, start, end);
+}
+
 /*
  * Remove range of pages and swap entries from page cache, and free them.
  * If !unfalloc, truncate or punch hole; if unfalloc, undo failed fallocate.
@@ -948,6 +959,8 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, loff_t lend,
 			}
 			index += folio_nr_pages(folio) - 1;
 
+			notify_invalidate(inode, folio, start, end);
+
 			if (!unfalloc || !folio_test_uptodate(folio))
 				truncate_inode_folio(mapping, folio);
 			folio_unlock(folio);
@@ -1021,6 +1034,9 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, loff_t lend,
 					index--;
 					break;
 				}
+
+				notify_invalidate(inode, folio, start, end);
+
 				VM_BUG_ON_FOLIO(folio_test_writeback(folio),
 						folio);
 				truncate_inode_folio(mapping, folio);
@@ -1092,6 +1108,13 @@ static int shmem_setattr(struct user_namespace *mnt_userns,
 		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
 			return -EPERM;
 
+		if (info->memfile_node.flags & MEMFILE_F_USER_INACCESSIBLE) {
+			if (oldsize)
+				return -EPERM;
+			if (!PAGE_ALIGNED(newsize))
+				return -EINVAL;
+		}
+
 		if (newsize != oldsize) {
 			error = shmem_reacct_size(SHMEM_I(inode)->flags,
 					oldsize, newsize);
@@ -1336,6 +1359,8 @@ static int shmem_writepage(struct page *page, struct writeback_control *wbc)
 		goto redirty;
 	if (!total_swap_pages)
 		goto redirty;
+	if (info->memfile_node.flags & MEMFILE_F_UNRECLAIMABLE)
+		goto redirty;
 
 	/*
 	 * Our capabilities prevent regular writeback or sync from ever calling
@@ -2271,6 +2296,9 @@ static int shmem_mmap(struct file *file, struct vm_area_struct *vma)
 	if (ret)
 		return ret;
 
+	if (info->memfile_node.flags & MEMFILE_F_USER_INACCESSIBLE)
+		return -EPERM;
+
 	/* arm64 - allow memory tagging on RAM-based files */
 	vma->vm_flags |= VM_MTE_ALLOWED;
 
@@ -2306,6 +2334,7 @@ static struct inode *shmem_get_inode(struct super_block *sb, const struct inode
 		info->i_crtime = inode->i_mtime;
 		INIT_LIST_HEAD(&info->shrinklist);
 		INIT_LIST_HEAD(&info->swaplist);
+		memfile_node_init(&info->memfile_node);
 		simple_xattrs_init(&info->xattrs);
 		cache_no_acl(inode);
 		mapping_set_large_folios(inode->i_mapping);
@@ -2477,6 +2506,8 @@ shmem_write_begin(struct file *file, struct address_space *mapping,
 		if ((info->seals & F_SEAL_GROW) && pos + len > inode->i_size)
 			return -EPERM;
 	}
+	if (unlikely(info->memfile_node.flags & MEMFILE_F_USER_INACCESSIBLE))
+		return -EPERM;
 
 	if (unlikely(info->seals & F_SEAL_AUTO_ALLOCATE))
 		sgp = SGP_NOALLOC;
@@ -2556,6 +2587,13 @@ static ssize_t shmem_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		end_index = i_size >> PAGE_SHIFT;
 		if (index > end_index)
 			break;
+
+		if (SHMEM_I(inode)->memfile_node.flags &
+				MEMFILE_F_USER_INACCESSIBLE) {
+			error = -EPERM;
+			break;
+		}
+
 		if (index == end_index) {
 			nr = i_size & ~PAGE_MASK;
 			if (nr <= offset)
@@ -2697,6 +2735,12 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 			goto out;
 		}
 
+		if ((info->memfile_node.flags & MEMFILE_F_USER_INACCESSIBLE) &&
+		    (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))) {
+			error = -EINVAL;
+			goto out;
+		}
+
 		shmem_falloc.waitq = &shmem_falloc_waitq;
 		shmem_falloc.start = (u64)unmap_start >> PAGE_SHIFT;
 		shmem_falloc.next = (unmap_end + 1) >> PAGE_SHIFT;
@@ -3806,6 +3850,20 @@ static int shmem_error_remove_page(struct address_space *mapping,
 	return 0;
 }
 
+#ifdef CONFIG_MIGRATION
+static int shmem_migrate_page(struct address_space *mapping,
+			      struct page *newpage, struct page *page,
+			      enum migrate_mode mode)
+{
+	struct inode *inode = mapping->host;
+	struct shmem_inode_info *info = SHMEM_I(inode);
+
+	if (info->memfile_node.flags & MEMFILE_F_UNMOVABLE)
+		return -EOPNOTSUPP;
+	return migrate_page(mapping, newpage, page, mode);
+}
+#endif
+
 const struct address_space_operations shmem_aops = {
 	.writepage	= shmem_writepage,
 	.dirty_folio	= noop_dirty_folio,
@@ -3814,7 +3872,7 @@ const struct address_space_operations shmem_aops = {
 	.write_end	= shmem_write_end,
 #endif
 #ifdef CONFIG_MIGRATION
-	.migratepage	= migrate_page,
+	.migratepage	= shmem_migrate_page,
 #endif
 	.error_remove_page = shmem_error_remove_page,
 };
@@ -3931,6 +3989,51 @@ static struct file_system_type shmem_fs_type = {
 	.fs_flags	= FS_USERNS_MOUNT,
 };
 
+#ifdef CONFIG_MEMFILE_NOTIFIER
+static struct memfile_node *shmem_lookup_memfile_node(struct file *file)
+{
+	struct inode *inode = file_inode(file);
+
+	if (!shmem_mapping(inode->i_mapping))
+		return NULL;
+
+	return  &SHMEM_I(inode)->memfile_node;
+}
+
+
+static int shmem_get_pfn(struct file *file, pgoff_t offset, pfn_t *pfn,
+			 int *order)
+{
+	struct page *page;
+	int ret;
+
+	ret = shmem_getpage(file_inode(file), offset, &page, SGP_WRITE);
+	if (ret)
+		return ret;
+
+	unlock_page(page);
+	*pfn = page_to_pfn_t(page);
+	*order = thp_order(compound_head(page));
+	return 0;
+}
+
+static void shmem_put_pfn(pfn_t pfn)
+{
+	struct page *page = pfn_t_to_page(pfn);
+
+	if (!page)
+		return;
+
+	put_page(page);
+}
+
+static struct memfile_backing_store shmem_backing_store = {
+	.lookup_memfile_node = shmem_lookup_memfile_node,
+	.get_pfn = shmem_get_pfn,
+	.put_pfn = shmem_put_pfn,
+};
+#endif /* CONFIG_MEMFILE_NOTIFIER */
+
 void __init shmem_init(void)
 {
 	int error;
@@ -3956,6 +4059,10 @@ void __init shmem_init(void)
 	else
 		shmem_huge = SHMEM_HUGE_NEVER; /* just in case it was patched */
 #endif
+
+#ifdef CONFIG_MEMFILE_NOTIFIER
+	memfile_register_backing_store(&shmem_backing_store);
+#endif
 	return;
 
 out1:
-- 
2.25.1



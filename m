Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7445F4D48B6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:12:18 +0100 (CET)
Received: from localhost ([::1]:56244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJWa-0007hy-UB
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:12:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJUB-000580-WD
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:09:48 -0500
Received: from mga06.intel.com ([134.134.136.31]:42502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJU9-0004d4-Ii
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646921385; x=1678457385;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=HfTyQumQLz3rZd208DGi7M1QzPzA68CVqOu0FcAUOfs=;
 b=lEzIRTv+fBuighTO0sO7ivu5ohNf+B39GtwqINaVo/shdsihwAM2p+RD
 c8GQN2XJd01agHNfM+U9x1n4mf0HnK3TR+4d9VnEpUiz6oDFQKtaGwd3s
 jfIMrTWArTRalQayEGcJRS2YEaGUy6f+XRsUsVEwZN3lkrS0L7XthrgyX
 VjJupVvaPetXyo2psoktwJvM3zjHqx29oLEq9JyA1T5lGixDVZ01Ur8fD
 7u+xv9Eq8rK2TP5Bsu9ZS8JtVxhgaBQeWJnYesXjTlc43cv150pQm+S+3
 KGCN0Z0DrlknXf1cBbr4gyqHn8glja8M8KkewT0wDevb6ZDfyF+iGAbm2 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="315975592"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="315975592"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:09:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="554654769"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 10 Mar 2022 06:09:36 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v5 01/13] mm/memfd: Introduce MFD_INACCESSIBLE flag
Date: Thu, 10 Mar 2022 22:08:59 +0800
Message-Id: <20220310140911.50924-2-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga06.intel.com
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

Introduce a new memfd_create() flag indicating the content of the
created memfd is inaccessible from userspace through ordinary MMU
access (e.g., read/write/mmap). However, the file content can be
accessed via a different mechanism (e.g. KVM MMU) indirectly.

It provides semantics required for KVM guest private memory support
that a file descriptor with this flag set is going to be used as the
source of guest memory in confidential computing environments such
as Intel TDX/AMD SEV but may not be accessible from host userspace.

Since page migration/swapping is not yet supported for such usages
so these pages are currently marked as UNMOVABLE and UNEVICTABLE
which makes them behave like long-term pinned pages.

The flag can not coexist with MFD_ALLOW_SEALING, future sealing is
also impossible for a memfd created with this flag.

At this time only shmem implements this flag.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/shmem_fs.h   |  7 +++++
 include/uapi/linux/memfd.h |  1 +
 mm/memfd.c                 | 26 +++++++++++++++--
 mm/shmem.c                 | 57 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+), 3 deletions(-)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index e65b80ed09e7..2dde843f28ef 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -12,6 +12,9 @@
 
 /* inode in-kernel data */
 
+/* shmem extended flags */
+#define SHM_F_INACCESSIBLE	0x0001  /* prevent ordinary MMU access (e.g. read/write/mmap) to file content */
+
 struct shmem_inode_info {
 	spinlock_t		lock;
 	unsigned int		seals;		/* shmem seals */
@@ -24,6 +27,7 @@ struct shmem_inode_info {
 	struct shared_policy	policy;		/* NUMA memory alloc policy */
 	struct simple_xattrs	xattrs;		/* list of xattrs */
 	atomic_t		stop_eviction;	/* hold when working on inode */
+	unsigned int		xflags;		/* shmem extended flags */
 	struct inode		vfs_inode;
 };
 
@@ -61,6 +65,9 @@ extern struct file *shmem_file_setup(const char *name,
 					loff_t size, unsigned long flags);
 extern struct file *shmem_kernel_file_setup(const char *name, loff_t size,
 					    unsigned long flags);
+extern struct file *shmem_file_setup_xflags(const char *name, loff_t size,
+					    unsigned long flags,
+					    unsigned int xflags);
 extern struct file *shmem_file_setup_with_mnt(struct vfsmount *mnt,
 		const char *name, loff_t size, unsigned long flags);
 extern int shmem_zero_setup(struct vm_area_struct *);
diff --git a/include/uapi/linux/memfd.h b/include/uapi/linux/memfd.h
index 7a8a26751c23..48750474b904 100644
--- a/include/uapi/linux/memfd.h
+++ b/include/uapi/linux/memfd.h
@@ -8,6 +8,7 @@
 #define MFD_CLOEXEC		0x0001U
 #define MFD_ALLOW_SEALING	0x0002U
 #define MFD_HUGETLB		0x0004U
+#define MFD_INACCESSIBLE	0x0008U
 
 /*
  * Huge page size encoding when MFD_HUGETLB is specified, and a huge page
diff --git a/mm/memfd.c b/mm/memfd.c
index 9f80f162791a..74d45a26cf5d 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -245,16 +245,20 @@ long memfd_fcntl(struct file *file, unsigned int cmd, unsigned long arg)
 #define MFD_NAME_PREFIX_LEN (sizeof(MFD_NAME_PREFIX) - 1)
 #define MFD_NAME_MAX_LEN (NAME_MAX - MFD_NAME_PREFIX_LEN)
 
-#define MFD_ALL_FLAGS (MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB)
+#define MFD_ALL_FLAGS (MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB | \
+		       MFD_INACCESSIBLE)
 
 SYSCALL_DEFINE2(memfd_create,
 		const char __user *, uname,
 		unsigned int, flags)
 {
+	struct address_space *mapping;
 	unsigned int *file_seals;
+	unsigned int xflags;
 	struct file *file;
 	int fd, error;
 	char *name;
+	gfp_t gfp;
 	long len;
 
 	if (!(flags & MFD_HUGETLB)) {
@@ -267,6 +271,10 @@ SYSCALL_DEFINE2(memfd_create,
 			return -EINVAL;
 	}
 
+	/* Disallow sealing when MFD_INACCESSIBLE is set. */
+	if (flags & MFD_INACCESSIBLE && flags & MFD_ALLOW_SEALING)
+		return -EINVAL;
+
 	/* length includes terminating zero */
 	len = strnlen_user(uname, MFD_NAME_MAX_LEN + 1);
 	if (len <= 0)
@@ -301,8 +309,11 @@ SYSCALL_DEFINE2(memfd_create,
 					HUGETLB_ANONHUGE_INODE,
 					(flags >> MFD_HUGE_SHIFT) &
 					MFD_HUGE_MASK);
-	} else
-		file = shmem_file_setup(name, 0, VM_NORESERVE);
+	} else {
+		xflags = flags & MFD_INACCESSIBLE ? SHM_F_INACCESSIBLE : 0;
+		file = shmem_file_setup_xflags(name, 0, VM_NORESERVE, xflags);
+	}
+
 	if (IS_ERR(file)) {
 		error = PTR_ERR(file);
 		goto err_fd;
@@ -313,6 +324,15 @@ SYSCALL_DEFINE2(memfd_create,
 	if (flags & MFD_ALLOW_SEALING) {
 		file_seals = memfd_file_seals_ptr(file);
 		*file_seals &= ~F_SEAL_SEAL;
+	} else if (flags & MFD_INACCESSIBLE) {
+		mapping = file_inode(file)->i_mapping;
+		gfp = mapping_gfp_mask(mapping);
+		gfp &= ~__GFP_MOVABLE;
+		mapping_set_gfp_mask(mapping, gfp);
+		mapping_set_unevictable(mapping);
+
+		file_seals = memfd_file_seals_ptr(file);
+		*file_seals = F_SEAL_SEAL;
 	}
 
 	fd_install(fd, file);
diff --git a/mm/shmem.c b/mm/shmem.c
index a09b29ec2b45..9b31a7056009 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1084,6 +1084,13 @@ static int shmem_setattr(struct user_namespace *mnt_userns,
 		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
 			return -EPERM;
 
+		if (info->xflags & SHM_F_INACCESSIBLE) {
+			if(oldsize)
+				return -EPERM;
+			if (!PAGE_ALIGNED(newsize))
+				return -EINVAL;
+		}
+
 		if (newsize != oldsize) {
 			error = shmem_reacct_size(SHMEM_I(inode)->flags,
 					oldsize, newsize);
@@ -1331,6 +1338,8 @@ static int shmem_writepage(struct page *page, struct writeback_control *wbc)
 		goto redirty;
 	if (!total_swap_pages)
 		goto redirty;
+	if (info->xflags & SHM_F_INACCESSIBLE)
+		goto redirty;
 
 	/*
 	 * Our capabilities prevent regular writeback or sync from ever calling
@@ -2228,6 +2237,9 @@ static int shmem_mmap(struct file *file, struct vm_area_struct *vma)
 	if (ret)
 		return ret;
 
+	if (info->xflags & SHM_F_INACCESSIBLE)
+		return -EPERM;
+
 	/* arm64 - allow memory tagging on RAM-based files */
 	vma->vm_flags |= VM_MTE_ALLOWED;
 
@@ -2433,6 +2445,8 @@ shmem_write_begin(struct file *file, struct address_space *mapping,
 		if ((info->seals & F_SEAL_GROW) && pos + len > inode->i_size)
 			return -EPERM;
 	}
+	if (unlikely(info->xflags & SHM_F_INACCESSIBLE))
+		return -EPERM;
 
 	ret = shmem_getpage(inode, index, pagep, SGP_WRITE);
 
@@ -2517,6 +2531,21 @@ static ssize_t shmem_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		end_index = i_size >> PAGE_SHIFT;
 		if (index > end_index)
 			break;
+
+		/*
+		 * inode_lock protects setting up seals as well as write to
+		 * i_size. Setting SHM_F_INACCESSIBLE only allowed with
+		 * i_size == 0.
+		 *
+		 * Check SHM_F_INACCESSIBLE after i_size. It effectively
+		 * serialize read vs. setting SHM_F_INACCESSIBLE without
+		 * taking inode_lock in read path.
+		 */
+		if (SHMEM_I(inode)->xflags & SHM_F_INACCESSIBLE) {
+			error = -EPERM;
+			break;
+		}
+
 		if (index == end_index) {
 			nr = i_size & ~PAGE_MASK;
 			if (nr <= offset)
@@ -2648,6 +2677,12 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 			goto out;
 		}
 
+		if ((info->xflags & SHM_F_INACCESSIBLE) &&
+		    (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))) {
+			error = -EINVAL;
+			goto out;
+		}
+
 		shmem_falloc.waitq = &shmem_falloc_waitq;
 		shmem_falloc.start = (u64)unmap_start >> PAGE_SHIFT;
 		shmem_falloc.next = (unmap_end + 1) >> PAGE_SHIFT;
@@ -4082,6 +4117,28 @@ struct file *shmem_kernel_file_setup(const char *name, loff_t size, unsigned lon
 	return __shmem_file_setup(shm_mnt, name, size, flags, S_PRIVATE);
 }
 
+/**
+ * shmem_file_setup_xflags - get an unlinked file living in tmpfs with
+ *      additional xflags.
+ * @name: name for dentry (to be seen in /proc/<pid>/maps
+ * @size: size to be set for the file
+ * @flags: VM_NORESERVE suppresses pre-accounting of the entire object size
+ * @xflags: SHM_F_INACCESSIBLE prevents ordinary MMU access to the file content
+ */
+
+struct file *shmem_file_setup_xflags(const char *name, loff_t size,
+				     unsigned long flags, unsigned int xflags)
+{
+	struct shmem_inode_info *info;
+	struct file *res = __shmem_file_setup(shm_mnt, name, size, flags, 0);
+
+	if(!IS_ERR(res)) {
+		info = SHMEM_I(file_inode(res));
+		info->xflags = xflags & SHM_F_INACCESSIBLE;
+	}
+	return res;
+}
+
 /**
  * shmem_file_setup - get an unlinked file living in tmpfs
  * @name: name for dentry (to be seen in /proc/<pid>/maps
-- 
2.17.1



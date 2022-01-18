Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AB6492900
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:58:40 +0100 (CET)
Received: from localhost ([::1]:57452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pwV-0000cu-GM
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:58:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oRD-0000kX-1l
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:22:15 -0500
Received: from mga02.intel.com ([134.134.136.20]:57197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oR7-0003Ak-P8
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642512129; x=1674048129;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=4KNvuS2T6y3ZLkboDDDFll1RTzkK0ZIAxH/eOgdZ+S8=;
 b=Jnc+uvcKh/HKed+5WuEDRBJKqyNAI5e+x4EB2Yk/BcZqKYTgc1YSzKXk
 2/ezM/ITYO6wJq2pkywKijmdczUtVLRbpkGkIN78R/TLaZ75z5qg6TCul
 JlsNQdBOxXGdMsMeDlcH8d5Gx7UzqqrHUw/UwjL71F11SUfPxJXVOBMEA
 umqhFo/4ASXPHZu1Ppkt9hpguakvP09oaRgv5FrH6uSVSXNSYHH9liksb
 xzHdxRIgk09x0TZ94/LlL+qI4EErYaqTMRY+tG69Sw68nRcvKq6mVNBHt
 jk21biaEsQwrSPiaXwvwV+CdvEVdBPrT35CcYMIGKwAqbRGXDOxfrBvr3 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="232171777"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="232171777"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 05:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="531791632"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 05:21:59 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v4 01/12] mm/shmem: Introduce F_SEAL_INACCESSIBLE
Date: Tue, 18 Jan 2022 21:21:10 +0800
Message-Id: <20220118132121.31388-2-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Introduce a new seal F_SEAL_INACCESSIBLE indicating the content of
the file is inaccessible from userspace through ordinary MMU access
(e.g., read/write/mmap). However, the file content can be accessed
via a different mechanism (e.g. KVM MMU) indirectly.

It provides semantics required for KVM guest private memory support
that a file descriptor with this seal set is going to be used as the
source of guest memory in confidential computing environments such
as Intel TDX/AMD SEV but may not be accessible from host userspace.

At this time only shmem implements this seal.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/uapi/linux/fcntl.h |  1 +
 mm/shmem.c                 | 40 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
index 2f86b2ad6d7e..09ef34754dfa 100644
--- a/include/uapi/linux/fcntl.h
+++ b/include/uapi/linux/fcntl.h
@@ -43,6 +43,7 @@
 #define F_SEAL_GROW	0x0004	/* prevent file from growing */
 #define F_SEAL_WRITE	0x0008	/* prevent writes */
 #define F_SEAL_FUTURE_WRITE	0x0010  /* prevent future writes while mapped */
+#define F_SEAL_INACCESSIBLE	0x0020  /* prevent ordinary MMU access (e.g. read/write/mmap) to file content */
 /* (1U << 31) is reserved for signed error codes */
 
 /*
diff --git a/mm/shmem.c b/mm/shmem.c
index 18f93c2d68f1..72185630e7c4 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1098,6 +1098,13 @@ static int shmem_setattr(struct user_namespace *mnt_userns,
 		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
 			return -EPERM;
 
+		if (info->seals & F_SEAL_INACCESSIBLE) {
+			if(i_size_read(inode))
+				return -EPERM;
+			if (newsize & ~PAGE_MASK)
+				return -EINVAL;
+		}
+
 		if (newsize != oldsize) {
 			error = shmem_reacct_size(SHMEM_I(inode)->flags,
 					oldsize, newsize);
@@ -1364,6 +1371,8 @@ static int shmem_writepage(struct page *page, struct writeback_control *wbc)
 		goto redirty;
 	if (!total_swap_pages)
 		goto redirty;
+	if (info->seals & F_SEAL_INACCESSIBLE)
+		goto redirty;
 
 	/*
 	 * Our capabilities prevent regular writeback or sync from ever calling
@@ -2262,6 +2271,9 @@ static int shmem_mmap(struct file *file, struct vm_area_struct *vma)
 	if (ret)
 		return ret;
 
+	if (info->seals & F_SEAL_INACCESSIBLE)
+		return -EPERM;
+
 	/* arm64 - allow memory tagging on RAM-based files */
 	vma->vm_flags |= VM_MTE_ALLOWED;
 
@@ -2459,12 +2471,15 @@ shmem_write_begin(struct file *file, struct address_space *mapping,
 	pgoff_t index = pos >> PAGE_SHIFT;
 
 	/* i_rwsem is held by caller */
-	if (unlikely(info->seals & (F_SEAL_GROW |
-				   F_SEAL_WRITE | F_SEAL_FUTURE_WRITE))) {
+	if (unlikely(info->seals & (F_SEAL_GROW | F_SEAL_WRITE |
+				    F_SEAL_FUTURE_WRITE |
+				    F_SEAL_INACCESSIBLE))) {
 		if (info->seals & (F_SEAL_WRITE | F_SEAL_FUTURE_WRITE))
 			return -EPERM;
 		if ((info->seals & F_SEAL_GROW) && pos + len > inode->i_size)
 			return -EPERM;
+		if (info->seals & F_SEAL_INACCESSIBLE)
+			return -EPERM;
 	}
 
 	return shmem_getpage(inode, index, pagep, SGP_WRITE);
@@ -2538,6 +2553,21 @@ static ssize_t shmem_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		end_index = i_size >> PAGE_SHIFT;
 		if (index > end_index)
 			break;
+
+		/*
+		 * inode_lock protects setting up seals as well as write to
+		 * i_size. Setting F_SEAL_INACCESSIBLE only allowed with
+		 * i_size == 0.
+		 *
+		 * Check F_SEAL_INACCESSIBLE after i_size. It effectively
+		 * serialize read vs. setting F_SEAL_INACCESSIBLE without
+		 * taking inode_lock in read path.
+		 */
+		if (SHMEM_I(inode)->seals & F_SEAL_INACCESSIBLE) {
+			error = -EPERM;
+			break;
+		}
+
 		if (index == end_index) {
 			nr = i_size & ~PAGE_MASK;
 			if (nr <= offset)
@@ -2663,6 +2693,12 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 			goto out;
 		}
 
+		if ((info->seals & F_SEAL_INACCESSIBLE) &&
+		    (offset & ~PAGE_MASK || len & ~PAGE_MASK)) {
+			error = -EINVAL;
+			goto out;
+		}
+
 		shmem_falloc.waitq = &shmem_falloc_waitq;
 		shmem_falloc.start = (u64)unmap_start >> PAGE_SHIFT;
 		shmem_falloc.next = (unmap_end + 1) >> PAGE_SHIFT;
-- 
2.17.1



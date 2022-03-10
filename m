Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9184D48BC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:15:23 +0100 (CET)
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJZb-00052f-0W
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:15:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJUd-0005xv-8o
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:10:15 -0500
Received: from mga07.intel.com ([134.134.136.100]:62837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJUb-0004sI-ID
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646921413; x=1678457413;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=s3KeBsvI7L7pbUPmXrVsTjDsdOJOMmhGXQWiylgk8+Q=;
 b=c/6HdbyRBf0Psz1ChU4lpMVvt783BPJKrYvLcaLdJykEeXn6ZNnYQn8h
 iDuw3Ylm3e9l1bQ0M+gMJnE6J0FhLVtGfg7hIlozmy9tLOFIFH8ImalHO
 iWJY5qPItyA4TM5dyIB+ZMbU+trctW5uc36yt3331/uooim4TEGCLG2bc
 8EpW8QKa5jbLiYcL39G5UI36xn48vLElEwi9W4G5CtYSdTb/yCifdY520
 LgMS7+C2OELpOexqSpreiVHB1yLvZkNYHhUqF/uV+MJSkEV9QPC0FBAZ7
 2hUg1zI6j2kYqQhFUkhoo0bKRrr+989uz1CN/l25iB6k49W8ty5FXmxo8 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318479330"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="318479330"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:10:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="554654936"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 10 Mar 2022 06:10:00 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory against
 RLIMIT_MEMLOCK
Date: Thu, 10 Mar 2022 22:09:02 +0800
Message-Id: <20220310140911.50924-5-chao.p.peng@linux.intel.com>
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

Since page migration / swapping is not supported yet, MFD_INACCESSIBLE
memory behave like longterm pinned pages and thus should be accounted to
mm->pinned_vm and be restricted by RLIMIT_MEMLOCK.

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 mm/shmem.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 7b43e274c9a2..ae46fb96494b 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -915,14 +915,17 @@ static void notify_fallocate(struct inode *inode, pgoff_t start, pgoff_t end)
 static void notify_invalidate_page(struct inode *inode, struct folio *folio,
 				   pgoff_t start, pgoff_t end)
 {
-#ifdef CONFIG_MEMFILE_NOTIFIER
 	struct shmem_inode_info *info = SHMEM_I(inode);
 
+#ifdef CONFIG_MEMFILE_NOTIFIER
 	start = max(start, folio->index);
 	end = min(end, folio->index + folio_nr_pages(folio));
 
 	memfile_notifier_invalidate(&info->memfile_notifiers, start, end);
 #endif
+
+	if (info->xflags & SHM_F_INACCESSIBLE)
+		atomic64_sub(end - start, &current->mm->pinned_vm);
 }
 
 /*
@@ -2680,6 +2683,20 @@ static loff_t shmem_file_llseek(struct file *file, loff_t offset, int whence)
 	return offset;
 }
 
+static bool memlock_limited(unsigned long npages)
+{
+	unsigned long lock_limit;
+	unsigned long pinned;
+
+	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
+	pinned = atomic64_add_return(npages, &current->mm->pinned_vm);
+	if (pinned > lock_limit && !capable(CAP_IPC_LOCK)) {
+		atomic64_sub(npages, &current->mm->pinned_vm);
+		return true;
+	}
+	return false;
+}
+
 static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 							 loff_t len)
 {
@@ -2753,6 +2770,12 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
 		goto out;
 	}
 
+	if ((info->xflags & SHM_F_INACCESSIBLE) &&
+			memlock_limited(end - start)) {
+		error = -ENOMEM;
+		goto out;
+	}
+
 	shmem_falloc.waitq = NULL;
 	shmem_falloc.start = start;
 	shmem_falloc.next  = start;
-- 
2.17.1



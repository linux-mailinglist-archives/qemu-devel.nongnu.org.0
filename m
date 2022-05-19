Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C5552D9E5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 18:11:10 +0200 (CEST)
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrik1-0001h4-Jy
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 12:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nriHG-0001EY-7r
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:41:26 -0400
Received: from mga14.intel.com ([192.55.52.115]:30758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nriHE-0000b4-6N
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652974884; x=1684510884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ABx0lox6wHjWB9I6XpUkHY/Io9HXsLK8krHlywnoYY=;
 b=gdzEexhDkWSDgYa3U4UEDLFB8BZ8zEh+4Yzr1mC7UkwNoXaN74PacULo
 0+W1bf8vfSIM3pEXgy23YZ4gaFLgSz2IrRVJMP2jCUtxw15U9WJ01eFMh
 ie4eNtjEzPnaNM2y7Ee9I6qCA+aPa7P1VTaJssnlfKlljriOdomaFyMfm
 ZU2ypFmgevy8VkAg5hZeSMpzMM5J0f1Si+owWRj218aPwATtEMgwcRsL/
 IOJCevwHOU9WRLBlKjxuV2ZiwRfUBpe5yxKw+AgVKf8fB2gkrhiNnlwCN
 Gp8QMg+nQ/WjRQK8XWOfeFBUO3jxwcMinI/mdcDVGOvtrOfpqbMRft+bX g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="272377603"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="272377603"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 08:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="598635197"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 19 May 2022 08:41:12 -0700
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: [PATCH v6 3/8] mm/memfd: Introduce MFD_INACCESSIBLE flag
Date: Thu, 19 May 2022 23:37:08 +0800
Message-Id: <20220519153713.819591-4-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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

Introduce a new memfd_create() flag indicating the content of the
created memfd is inaccessible from userspace through ordinary MMU
access (e.g., read/write/mmap). However, the file content can be
accessed via a different mechanism (e.g. KVM MMU) indirectly.

It provides semantics required for KVM guest private memory support
that a file descriptor with this flag set is going to be used as the
source of guest memory in confidential computing environments such
as Intel TDX/AMD SEV but may not be accessible from host userspace.

The flag can not coexist with MFD_ALLOW_SEALING, future sealing is
also impossible for a memfd created with this flag.

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/uapi/linux/memfd.h |  1 +
 mm/memfd.c                 | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

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
index 08f5f8304746..775541d53f1b 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -18,6 +18,7 @@
 #include <linux/hugetlb.h>
 #include <linux/shmem_fs.h>
 #include <linux/memfd.h>
+#include <linux/memfile_notifier.h>
 #include <uapi/linux/memfd.h>
 
 /*
@@ -261,7 +262,8 @@ long memfd_fcntl(struct file *file, unsigned int cmd, unsigned long arg)
 #define MFD_NAME_PREFIX_LEN (sizeof(MFD_NAME_PREFIX) - 1)
 #define MFD_NAME_MAX_LEN (NAME_MAX - MFD_NAME_PREFIX_LEN)
 
-#define MFD_ALL_FLAGS (MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB)
+#define MFD_ALL_FLAGS (MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB | \
+		       MFD_INACCESSIBLE)
 
 SYSCALL_DEFINE2(memfd_create,
 		const char __user *, uname,
@@ -283,6 +285,10 @@ SYSCALL_DEFINE2(memfd_create,
 			return -EINVAL;
 	}
 
+	/* Disallow sealing when MFD_INACCESSIBLE is set. */
+	if (flags & MFD_INACCESSIBLE && flags & MFD_ALLOW_SEALING)
+		return -EINVAL;
+
 	/* length includes terminating zero */
 	len = strnlen_user(uname, MFD_NAME_MAX_LEN + 1);
 	if (len <= 0)
@@ -329,12 +335,19 @@ SYSCALL_DEFINE2(memfd_create,
 	if (flags & MFD_ALLOW_SEALING) {
 		file_seals = memfd_file_seals_ptr(file);
 		*file_seals &= ~F_SEAL_SEAL;
+	} else if (flags & MFD_INACCESSIBLE) {
+		error = memfile_node_set_flags(file,
+					       MEMFILE_F_USER_INACCESSIBLE);
+		if (error)
+			goto err_file;
 	}
 
 	fd_install(fd, file);
 	kfree(name);
 	return fd;
 
+err_file:
+	fput(file);
 err_fd:
 	put_unused_fd(fd);
 err_name:
-- 
2.25.1



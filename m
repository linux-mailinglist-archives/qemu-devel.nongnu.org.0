Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9790F49296F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:12:06 +0100 (CET)
Received: from localhost ([::1]:53474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9q9V-0001x5-Nh
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:12:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oRF-0000qs-2V
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:22:17 -0500
Received: from mga09.intel.com ([134.134.136.24]:39159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oRC-0003Ci-TX
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642512134; x=1674048134;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=tGgrzrdRsYU+NqPfrWvM/m/GPitol5J3LJPXDgJxTB8=;
 b=I1erD7Q9ENroY+8/OPNtN1yK2NJ56XLm27mOKZ3BhwV5swFcPV6+GZoi
 bdmTY8iJdQD1EeUSfj7E8qj0WX22Zur1hdCyDHFshZ6f3HSc2M1x4lWxQ
 KC3W8HobzeaCgQNDcbwJwvNPF3FJg72a7PdDmto1NLjbDRHR93K/ppgMw
 BsfpP/wgbgYszypK024LjvWcVJePrJPXqPMuDuM3Rv/NVIcNBFDtFT2Aj
 T5jZ48Yns+AizeQ/gtPxvgdkEgTBzm4ijlB0sOwocDfR3Bc5Rm9xUjFO3
 6NMzU2l/WwTiz5tFHE/wigYmyzASOTqxA9tOSlht+Fq+EYg4i4+WTxaC5 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="244609288"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="244609288"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 05:22:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="531791674"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 05:22:06 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v4 02/12] mm/memfd: Introduce MFD_INACCESSIBLE flag
Date: Tue, 18 Jan 2022 21:21:11 +0800
Message-Id: <20220118132121.31388-3-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
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

Introduce a new memfd_create() flag indicating the content of the
created memfd is inaccessible from userspace. It does this by force
setting F_SEAL_INACCESSIBLE seal when the file is created. It also set
F_SEAL_SEAL to prevent future sealing, which means, it can not coexist
with MFD_ALLOW_SEALING.

The pages backed by such memfd will be used as guest private memory in
confidential computing environments such as Intel TDX/AMD SEV. Since
page migration/swapping is not yet supported for such usages so these
pages are currently marked as UNMOVABLE and UNEVICTABLE which makes
them behave like long-term pinned pages.

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/uapi/linux/memfd.h |  1 +
 mm/memfd.c                 | 20 +++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

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
index 9f80f162791a..26998d96dc11 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -245,16 +245,19 @@ long memfd_fcntl(struct file *file, unsigned int cmd, unsigned long arg)
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
 	struct file *file;
 	int fd, error;
 	char *name;
+	gfp_t gfp;
 	long len;
 
 	if (!(flags & MFD_HUGETLB)) {
@@ -267,6 +270,10 @@ SYSCALL_DEFINE2(memfd_create,
 			return -EINVAL;
 	}
 
+	/* Disallow sealing when MFD_INACCESSIBLE is set. */
+	if (flags & MFD_INACCESSIBLE && flags & MFD_ALLOW_SEALING)
+		return -EINVAL;
+
 	/* length includes terminating zero */
 	len = strnlen_user(uname, MFD_NAME_MAX_LEN + 1);
 	if (len <= 0)
@@ -315,6 +322,17 @@ SYSCALL_DEFINE2(memfd_create,
 		*file_seals &= ~F_SEAL_SEAL;
 	}
 
+	if (flags & MFD_INACCESSIBLE) {
+		mapping = file_inode(file)->i_mapping;
+		gfp = mapping_gfp_mask(mapping);
+		gfp &= ~__GFP_MOVABLE;
+		mapping_set_gfp_mask(mapping, gfp);
+		mapping_set_unevictable(mapping);
+
+		file_seals = memfd_file_seals_ptr(file);
+		*file_seals &= F_SEAL_SEAL | F_SEAL_INACCESSIBLE;
+	}
+
 	fd_install(fd, file);
 	kfree(name);
 	return fd;
-- 
2.17.1



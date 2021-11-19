Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEA045704F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:08:20 +0100 (CET)
Received: from localhost ([::1]:36070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4Yt-0006x8-HH
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:08:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mo4HQ-00081S-Qr
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:50:16 -0500
Received: from mga11.intel.com ([192.55.52.93]:9938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mo4HP-0000eY-31
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:50:16 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="231896178"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="231896178"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 05:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="507905238"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 19 Nov 2021 05:50:05 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC v2 PATCH 12/13] KVM: Introduce kvm_memfd_fallocate_range
Date: Fri, 19 Nov 2021 21:47:38 +0800
Message-Id: <20211119134739.20218-13-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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

It reuses the same code for kvm_memfd_invalidate_range, except using
kvm_map_gfn_range as its handler.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 28 +++++++++++++++++++++++++---
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d841ed877b4b..f1d7856be05b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1887,5 +1887,7 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
 
 int kvm_memfd_invalidate_range(struct kvm *kvm, struct inode *inode,
 			       unsigned long start, unsigned long end);
+int kvm_memfd_fallocate_range(struct kvm *kvm, struct inode *inode,
+			      unsigned long start, unsigned long end);
 
 #endif
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 492c1a99ec63..7eaafc0ae6ab 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -828,8 +828,10 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
 	return mmu_notifier_register(&kvm->mmu_notifier, current->mm);
 }
 
-int kvm_memfd_invalidate_range(struct kvm *kvm, struct inode *inode,
-			       unsigned long start, unsigned long end)
+int kvm_memfd_handle_range(struct kvm *kvm, struct inode *inode,
+			   unsigned long start, unsigned long end,
+			   gfn_handler_t handler)
+
 {
 	int ret;
 	const struct kvm_useraddr_range useraddr_range = {
@@ -837,7 +839,7 @@ int kvm_memfd_invalidate_range(struct kvm *kvm, struct inode *inode,
 		.end		= end,
 		.inode		= inode,
 		.pte		= __pte(0),
-		.handler	= kvm_unmap_gfn_range,
+		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
 		.may_block	= false,
@@ -858,6 +860,20 @@ int kvm_memfd_invalidate_range(struct kvm *kvm, struct inode *inode,
 	return ret;
 }
 
+int kvm_memfd_invalidate_range(struct kvm *kvm, struct inode *inode,
+			       unsigned long start, unsigned long end)
+{
+	return kvm_memfd_handle_range(kvm, inode, start, end,
+				      kvm_unmap_gfn_range);
+}
+
+int kvm_memfd_fallocate_range(struct kvm *kvm, struct inode *inode,
+			      unsigned long start, unsigned long end)
+{
+	return kvm_memfd_handle_range(kvm, inode, start, end,
+				      kvm_map_gfn_range);
+}
+
 #else  /* !(CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER) */
 
 static int kvm_init_mmu_notifier(struct kvm *kvm)
@@ -871,6 +887,12 @@ int kvm_memfd_invalidate_range(struct kvm *kvm, struct inode *inode,
 	return 0;
 }
 
+int kvm_memfd_fallocate_range(struct kvm *kvm, struct inode *inode,
+			      unsigned long start, unsigned long end)
+{
+	return 0;
+}
+
 #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
 
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
-- 
2.17.1



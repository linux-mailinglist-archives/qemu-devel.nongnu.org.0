Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5251F47C2C8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 16:27:04 +0100 (CET)
Received: from localhost ([::1]:40726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzh2d-0001wP-FZ
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 10:27:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzgpI-0008B3-Oi
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:13:16 -0500
Received: from mga01.intel.com ([192.55.52.88]:50987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzgpG-0008HR-L7
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640099594; x=1671635594;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=mFDIpY3/LyMlA/FBo77jj+CP6HruamtUy42MpTsU/84=;
 b=Oq7/Z6ObVc5ksWtXk98iEoDoMMOMLLNAS5KlyVBd88/MlIb0q95P1MwL
 t+wdmvdvdgGpwkeAn+x4lG62fwpSLcjNS7ZYwu5W+lyOyWPIMTFsymTRQ
 yqXRg13sPzNvkOg84x0RMULcw701DNevFVnaFD3Yq/zvf9TtAinpRSNHt
 p5y7jLyNVxKJ4QuFiPVeAdbAiratRUZnFuIzgNEVtIuIynovgI1pc2vP4
 MgVtYk8u7H3h8GWNOyzedHR7NL5rhMTYgOIUrKad5ksSmaEX9Zx6j+Y+w
 3xpOKnbFKHbv14rxRNvh/XSYYr1VlkwjYDW8pE8Dfp+hNVPAEedOTwFrr A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="264601415"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="264601415"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 07:13:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="684688504"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga005.jf.intel.com with ESMTP; 21 Dec 2021 07:13:03 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 08/15] KVM: Split out common memory invalidation code
Date: Tue, 21 Dec 2021 23:11:18 +0800
Message-Id: <20211221151125.19446-9-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
References: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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

When fd-based memory is enabled, there will be two types of memory
invalidation:
  - memory invalidation from native MMU through mmu_notifier callback
    for hva-based memory, and,
  - memory invalidation from memfd through memfd_notifier callback for
    fd-based memory.

Some code can be shared between these two types of memory invalidation.
This patch moves these shared code into one place so that it can be
used for CONFIG_MMU_NOTIFIER as well as CONFIG_MEMFD_NOTIFIER.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 virt/kvm/kvm_main.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 0f2d1002f6a7..59f01e68337b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -454,22 +454,6 @@ void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 EXPORT_SYMBOL_GPL(kvm_vcpu_destroy);
 
 #if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
-static inline struct kvm *mmu_notifier_to_kvm(struct mmu_notifier *mn)
-{
-	return container_of(mn, struct kvm, mmu_notifier);
-}
-
-static void kvm_mmu_notifier_invalidate_range(struct mmu_notifier *mn,
-					      struct mm_struct *mm,
-					      unsigned long start, unsigned long end)
-{
-	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	int idx;
-
-	idx = srcu_read_lock(&kvm->srcu);
-	kvm_arch_mmu_notifier_invalidate_range(kvm, start, end);
-	srcu_read_unlock(&kvm->srcu, idx);
-}
 
 typedef bool (*gfn_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
 
@@ -580,6 +564,25 @@ static __always_inline int __kvm_handle_useraddr_range(struct kvm *kvm,
 	/* The notifiers are averse to booleans. :-( */
 	return (int)ret;
 }
+#endif
+
+#if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+static inline struct kvm *mmu_notifier_to_kvm(struct mmu_notifier *mn)
+{
+	return container_of(mn, struct kvm, mmu_notifier);
+}
+
+static void kvm_mmu_notifier_invalidate_range(struct mmu_notifier *mn,
+					      struct mm_struct *mm,
+					      unsigned long start, unsigned long end)
+{
+	struct kvm *kvm = mmu_notifier_to_kvm(mn);
+	int idx;
+
+	idx = srcu_read_lock(&kvm->srcu);
+	kvm_arch_mmu_notifier_invalidate_range(kvm, start, end);
+	srcu_read_unlock(&kvm->srcu, idx);
+}
 
 static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 						unsigned long start,
-- 
2.17.1



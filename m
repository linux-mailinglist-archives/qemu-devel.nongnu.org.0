Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F5147E3B2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:48:20 +0100 (CET)
Received: from localhost ([::1]:45718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0NW5-00062x-7G
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:48:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0NGd-00061L-M4
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:32:19 -0500
Received: from mga03.intel.com ([134.134.136.65]:51964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0NGb-0002i3-OO
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640262737; x=1671798737;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=ALhrDscz25NWpd8el8w795CyW0Z7WyWdszVSzOyAnwk=;
 b=ZiTJ5YVFNLM+aLYu6t54XU9hH92MkEbiTaU0UtuZB+ey97Z4o/QaNufd
 n7qdBWnXszYyyBTQHzDrmBdOsn9B/mwzNqzMbpzLvjjSm4rnfrnOLdzMy
 /VYV55sei7LdW9wBDf2eI1aoqQoo6o3xLXvxjqGur5IvOBNNkF086d3KD
 8DR42U+GQ9CUDDbAkr0bazS+JAiw5blzWYpz75Fbpm4cCtuFuf93Aq7wq
 QUIqFTZOBtNYd+rd/N0Q6KavhcRRj7L4cUs9jsc6G5LNx/YZm8gZvvENh
 aVDk1Tf3xLADnSVfuoVTRkbx3+Tkl1uu+HEZ4RtqqDu7I2O2F4JrTulqu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="240769685"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="240769685"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 04:32:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522078921"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 23 Dec 2021 04:31:58 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 kvm/queue 09/16] KVM: Split out common memory invalidation
 code
Date: Thu, 23 Dec 2021 20:30:04 +0800
Message-Id: <20211223123011.41044-10-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
This patch moves those shared code into one place so that it can be
used for both CONFIG_MMU_NOTIFIER and CONFIG_MEMFD_NOTIFIER.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 virt/kvm/kvm_main.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 19736a0013a0..7b7530b1ea1e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -469,22 +469,6 @@ void kvm_destroy_vcpus(struct kvm *kvm)
 EXPORT_SYMBOL_GPL(kvm_destroy_vcpus);
 
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
 
@@ -611,6 +595,25 @@ static __always_inline int __kvm_handle_useraddr_range(struct kvm *kvm,
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



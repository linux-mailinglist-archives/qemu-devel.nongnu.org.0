Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA1E47C2B9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 16:23:09 +0100 (CET)
Received: from localhost ([::1]:60926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzgyr-0004wn-23
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 10:23:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzgq1-0001Ek-1p
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:14:01 -0500
Received: from mga17.intel.com ([192.55.52.151]:9892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzgpn-0008MP-6g
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640099627; x=1671635627;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=UCZ3wCwPhn9VbKdlrvPKEkilFsRm15PDP2AM/u3UGdI=;
 b=KUiGmhAePyZTdmBDZfvmbrtdVkXj5RWQiBIQsKHyf2+xAFWiMN7YLbuc
 XA0Zh8h6I3ODtLl9TUy8a1iTSnyTNOzjz0XIR8+Zg+8TjMrFw/s32FQxB
 XFGsQ7gtCJTGrqLaqfHuXScbsTooMevKS5jsbtGu2yJYUr6u/FmDrZcm7
 XsKuh0/nxYRR60pGlU1LiS814Ov1z2mnaIuhd9sKt3ueCeVsjJqMeOYDj
 6NHTKyCUvPC2pA7FXTlY2/Ra/BpYchEmbqI2AB6oDVJM9+rAIfBpuQisQ
 7kF7WSJkcFd/8gc3dQ0fggiz1qToB8did8iiTr00vwd2eob90EmDlEowc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="221086019"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="221086019"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 07:13:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="684688544"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga005.jf.intel.com with ESMTP; 21 Dec 2021 07:13:18 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 10/15] KVM: Add kvm_map_gfn_range
Date: Tue, 21 Dec 2021 23:11:20 +0800
Message-Id: <20211221151125.19446-11-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
References: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

This new function establishes the mapping in KVM page tables for a
given gfn range. It can be used in the memory fallocate callback for
memfd based memory to establish the mapping for KVM secondary MMU when
the pages are allocated in the memory backend.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 arch/x86/kvm/mmu/mmu.c   | 47 ++++++++++++++++++++++++++++++++++++++++
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      |  5 +++++
 3 files changed, 54 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 2da19356679d..a7006e1ac2d2 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1781,6 +1781,53 @@ static __always_inline bool kvm_handle_gfn_range(struct kvm *kvm,
 	return ret;
 }
 
+bool kvm_map_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	struct kvm_vcpu *vcpu;
+	kvm_pfn_t pfn;
+	gfn_t gfn;
+	int idx;
+	bool ret = true;
+
+	/* Need vcpu context for kvm_mmu_do_page_fault. */
+	vcpu = kvm_get_vcpu(kvm, 0);
+	if (mutex_lock_killable(&vcpu->mutex))
+		return false;
+
+	vcpu_load(vcpu);
+	idx = srcu_read_lock(&kvm->srcu);
+
+	kvm_mmu_reload(vcpu);
+
+	gfn = range->start;
+	while (gfn < range->end) {
+		if (signal_pending(current)) {
+			ret = false;
+			break;
+		}
+
+		if (need_resched())
+			cond_resched();
+
+		pfn = kvm_mmu_do_page_fault(vcpu, gfn << PAGE_SHIFT,
+					PFERR_WRITE_MASK | PFERR_USER_MASK,
+					false);
+		if (is_error_noslot_pfn(pfn) || kvm->vm_bugged) {
+			ret = false;
+			break;
+		}
+
+		gfn++;
+	}
+
+	srcu_read_unlock(&kvm->srcu, idx);
+	vcpu_put(vcpu);
+
+	mutex_unlock(&vcpu->mutex);
+
+	return ret;
+}
+
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	bool flush = false;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d9573305e273..9c02fb53b8ab 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -237,6 +237,8 @@ struct kvm_gfn_range {
 	pte_t pte;
 	bool may_block;
 };
+
+bool kvm_map_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d84cb867b686..b9855b2fdaae 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -456,6 +456,11 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_destroy);
 #if defined(CONFIG_MEMFD_OPS) ||\
 	(defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER))
 
+bool __weak kvm_map_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	return false;
+}
+
 typedef bool (*gfn_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
 
 typedef void (*on_lock_fn_t)(struct kvm *kvm, unsigned long start,
-- 
2.17.1



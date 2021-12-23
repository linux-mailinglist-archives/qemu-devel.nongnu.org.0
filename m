Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F8C47E3BA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:52:42 +0100 (CET)
Received: from localhost ([::1]:54130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0NaL-0003lA-Tj
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:52:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0NGp-0006ds-0V
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:32:31 -0500
Received: from mga11.intel.com ([192.55.52.93]:22200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0NGn-0002jA-3u
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640262749; x=1671798749;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=nMOnvZvv3gJKoKC9EEW6w1t+Yt8L0I8cTqGCDM02VXY=;
 b=jztgK7xGMAbGj/QG128Wewi7Wjo+5MqrYx8/sDjatjvTCAWXQOl0ZV7y
 TmeyRXPmms6+AOjbrQ8IRVHkbYxW+yutkjfbWVHzluyYM+bGKP9bxQ91Y
 wa9GjIrWBXe8MxG6swVJmDrgBbX6uBFhJ6/0/AcSCy5lVK1U6AsoCAkzE
 tKQMfFqO0KT4yVkqwH1eRUCDNXvwqWYGGeytRdXNfZlsE/qLPglXF08ms
 qw+DCXlCvtbZhv/4FBHmOk2w2ETFzroQi2eRgfTr6NXCWypUvK0UFg5q6
 AI5WjkximmGkuAtiTOZJZXeoiy7PXGyP+ue2HuarQQpRCZAUSo3gjilkb Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="238352390"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="238352390"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 04:32:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522078967"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 23 Dec 2021 04:32:16 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 kvm/queue 11/16] KVM: Add kvm_map_gfn_range
Date: Thu, 23 Dec 2021 20:30:06 +0800
Message-Id: <20211223123011.41044-12-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index 1d275e9d76b5..2856eb662a21 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1568,6 +1568,53 @@ static __always_inline bool kvm_handle_gfn_range(struct kvm *kvm,
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
index be567925831b..8c2359175509 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -241,6 +241,8 @@ struct kvm_gfn_range {
 	pte_t pte;
 	bool may_block;
 };
+
+bool kvm_map_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f495c1a313bd..660ce15973ad 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -471,6 +471,11 @@ EXPORT_SYMBOL_GPL(kvm_destroy_vcpus);
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C354928B0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:47:27 +0100 (CET)
Received: from localhost ([::1]:34834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9ple-0001kt-No
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:47:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oSI-0001Po-Bh
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:23:23 -0500
Received: from mga04.intel.com ([192.55.52.120]:18828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oSG-0003I3-G9
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:23:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642512200; x=1674048200;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Doiq2R3hAItBU5LQnTBxQCkUWyVHPsvtgI1nQR7ap4A=;
 b=nw8XdpK83ub5ouEpKhp+qBIKBr4g+RbxGY6mo3JUfKQE4651wpbm/ldO
 tiiZYahVRlKoq1rv9vu4rAsbfLP4sgpYABxJQ32omRSvaStfJ9gAJ4szq
 Wf8z49am59aAANOXsWlDrWFHHgmmXu1o/8y9dyGVpvZb1I8b7F+/eOsW7
 MWrShOlbh6oHulKCi6A3FxFg/jufmjhQ3yMklfYSoxjbFeBh/6OxLiQ9q
 WoDI21BL5npeWJJRVAqgK7ldaa5N4XhklIs+jmMougUBzLS2awxpR9q9I
 O2TilyCST7BNcYdRB7Cq0cPK82yXgPHE0MnTx0DMzWoWpz+nMK0HN9CNZ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="243636413"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="243636413"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 05:23:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="531791936"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 05:23:11 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v4 11/12] KVM: Zap existing KVM mappings when pages changed in
 the private fd
Date: Tue, 18 Jan 2022 21:21:20 +0800
Message-Id: <20220118132121.31388-12-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

KVM gets notified when memory pages changed in the memory backing store.
When userspace allocates the memory with fallocate() or frees memory
with fallocate(FALLOC_FL_PUNCH_HOLE), memory backing store calls into
KVM fallocate/invalidate callbacks respectively. To ensure KVM never
maps both the private and shared variants of a GPA into the guest, in
the fallocate callback, we should zap the existing shared mapping and
in the invalidate callback we should zap the existing private mapping.

In the callbacks, KVM firstly converts the offset range into the
gfn_range and then calls existing kvm_unmap_gfn_range() which will zap
the shared or private mapping. Both callbacks pass in a memslot
reference but we need 'kvm' so add a reference in memslot structure.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/kvm_host.h |  3 ++-
 virt/kvm/kvm_main.c      | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 667efe839767..117cf0da9c5e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -235,7 +235,7 @@ bool kvm_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #endif
 
-#ifdef KVM_ARCH_WANT_MMU_NOTIFIER
+#if defined(KVM_ARCH_WANT_MMU_NOTIFIER) || defined(CONFIG_MEMFILE_NOTIFIER)
 struct kvm_gfn_range {
 	struct kvm_memory_slot *slot;
 	gfn_t start;
@@ -463,6 +463,7 @@ struct kvm_memory_slot {
 	loff_t private_offset;
 	struct memfile_pfn_ops *pfn_ops;
 	struct memfile_notifier notifier;
+	struct kvm *kvm;
 };
 
 static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6b78ddef7880..10e553215618 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -847,8 +847,43 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
 #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
 
 #ifdef CONFIG_MEMFILE_NOTIFIER
+static void kvm_memfile_notifier_handler(struct memfile_notifier *notifier,
+					 pgoff_t start, pgoff_t end)
+{
+	int idx;
+	struct kvm_memory_slot *slot = container_of(notifier,
+						    struct kvm_memory_slot,
+						    notifier);
+	struct kvm_gfn_range gfn_range = {
+		.slot		= slot,
+		.start		= start - (slot->private_offset >> PAGE_SHIFT),
+		.end		= end - (slot->private_offset >> PAGE_SHIFT),
+		.may_block 	= true,
+	};
+	struct kvm *kvm = slot->kvm;
+
+	gfn_range.start = max(gfn_range.start, slot->base_gfn);
+	gfn_range.end = min(gfn_range.end, slot->base_gfn + slot->npages);
+
+	if (gfn_range.start >= gfn_range.end)
+		return;
+
+	idx = srcu_read_lock(&kvm->srcu);
+	KVM_MMU_LOCK(kvm);
+	kvm_unmap_gfn_range(kvm, &gfn_range);
+	kvm_flush_remote_tlbs(kvm);
+	KVM_MMU_UNLOCK(kvm);
+	srcu_read_unlock(&kvm->srcu, idx);
+}
+
+static struct memfile_notifier_ops kvm_memfile_notifier_ops = {
+	.invalidate = kvm_memfile_notifier_handler,
+	.fallocate = kvm_memfile_notifier_handler,
+};
+
 static inline int kvm_memfile_register(struct kvm_memory_slot *slot)
 {
+	slot->notifier.ops = &kvm_memfile_notifier_ops;
 	return memfile_register_notifier(file_inode(slot->private_file),
 					 &slot->notifier,
 					 &slot->pfn_ops);
@@ -1969,6 +2004,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	new->private_file = file;
 	new->private_offset = mem->flags & KVM_MEM_PRIVATE ?
 			      region_ext->private_offset : 0;
+	new->kvm = kvm;
 
 	r = kvm_set_memslot(kvm, old, new, change);
 	if (!r)
-- 
2.17.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8EA4D496C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:28:18 +0100 (CET)
Received: from localhost ([::1]:37032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJm5-0001m3-Do
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:28:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJVj-0008TB-9z
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:11:24 -0500
Received: from mga17.intel.com ([192.55.52.151]:7593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJVh-000542-3v
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:11:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646921481; x=1678457481;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=UDNf/tndP7AKz2Uk9JPtbsxmn9QkdDXr+UJSlA/azbE=;
 b=G4EwD3KGIAyfHruAFlFkx9e9+pW8hr/MpqfZq8JnQQIddVRAOQcvkPHS
 I25z18qH9j2vWFfI5QB18Qe1ux+y7Tk1WewAViTANpYHc8PDVh/a5ZIpf
 HOQ7x/ByB6sLyX/Trtf+wbFvtjRyJATDC3bcfb5yHcBRcIv4x0isl/f4y
 c+z4v2gPbjp3HQkgQTAjdopGLTsYyT0IxnxRwBAWtyFPL0zbPFP61wKqH
 YiMKlFH45ZKqEMjX5UEFqkm7EtLlhLWBXq98eHV341VAEPVgn0a0NxQyt
 uD3tgTJUUzVTz57xOIOdpDogenPo3/csCqm3douWT7nXK6DsKNJos+MBw w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="235862653"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="235862653"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:11:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="554655204"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 10 Mar 2022 06:10:56 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v5 11/13] KVM: Zap existing KVM mappings when pages changed in
 the private fd
Date: Thu, 10 Mar 2022 22:09:09 +0800
Message-Id: <20220310140911.50924-12-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga17.intel.com
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
index 9b175aeca63f..186b9b981a65 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -236,7 +236,7 @@ bool kvm_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #endif
 
-#ifdef KVM_ARCH_WANT_MMU_NOTIFIER
+#if defined(KVM_ARCH_WANT_MMU_NOTIFIER) || defined(CONFIG_MEMFILE_NOTIFIER)
 struct kvm_gfn_range {
 	struct kvm_memory_slot *slot;
 	gfn_t start;
@@ -568,6 +568,7 @@ struct kvm_memory_slot {
 	loff_t private_offset;
 	struct memfile_pfn_ops *pfn_ops;
 	struct memfile_notifier notifier;
+	struct kvm *kvm;
 };
 
 static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 67349421eae3..52319f49d58a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -841,8 +841,43 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
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
@@ -1963,6 +1998,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	new->private_file = file;
 	new->private_offset = mem->flags & KVM_MEM_PRIVATE ?
 			      region_ext->private_offset : 0;
+	new->kvm = kvm;
 
 	r = kvm_set_memslot(kvm, old, new, change);
 	if (!r)
-- 
2.17.1



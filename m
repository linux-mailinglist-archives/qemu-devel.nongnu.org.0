Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A271860D060
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:22:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLii-0002m4-9N; Tue, 25 Oct 2022 11:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1onLiW-00021v-TI
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:19:51 -0400
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1onLiP-0004TY-8x
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666711181; x=1698247181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0kS2wF3HRGDR5BE6p747FISp0sobPFWYTxerbWnA2RQ=;
 b=axJp105aHZEHOqf49wA2B0/NfP8AITZ6xwroCMqu+U60Mehgnmu5GF5U
 DmDPgluNmkS7JZhDhgnWBqH1qJA8bcLsLM26lvXN5XsI5WbKw83Aq5G2k
 +ft5CVmmLf8d4lWq1FgwtdifgpS2VdWJGwFTqr4afvw/6448sL4ODVukP
 DOiinXZ4DUXuoCNgrXdt6JMrUrlyo1/A1owFCEQnx5pR3eZLDgbcFwlss
 jPHxl6orKe7LNzqF+cK1t77Ip+o7gJbckycC1MfIzZPnF1/e2iVboxxpa
 8qtyxDSZnAiyYJpDhDkCyrgJIXyQCNYbTQvDWdFiDJ1vNLNYX6xfzn/0X w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287424446"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="287424446"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 08:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="736865704"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="736865704"
Received: from chaop.bj.intel.com ([10.240.193.75])
 by fmsmga002.fm.intel.com with ESMTP; 25 Oct 2022 08:19:21 -0700
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: [PATCH v9 6/8] KVM: Update lpage info when private/shared memory are
 mixed
Date: Tue, 25 Oct 2022 23:13:42 +0800
Message-Id: <20221025151344.3784230-7-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_NONE=0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When private/shared memory are mixed in a large page, the lpage_info may
not be accurate and should be updated with this mixed info. A large page
has mixed pages can't be really mapped as large page since its
private/shared pages are from different physical memory.

Update lpage_info when private/shared memory attribute is changed. If
both private and shared pages are within a large page region, it can't
be mapped as large page. It's a bit challenge to track the mixed
info in a 'count' like variable, this patch instead reserves a bit in
'disallow_lpage' to indicate a large page has mixed private/share pages.

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 arch/x86/include/asm/kvm_host.h |   8 +++
 arch/x86/kvm/mmu/mmu.c          | 112 +++++++++++++++++++++++++++++++-
 arch/x86/kvm/x86.c              |   2 +
 include/linux/kvm_host.h        |  19 ++++++
 virt/kvm/kvm_main.c             |  16 +++--
 5 files changed, 152 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 7551b6f9c31c..db811a54e3fd 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -37,6 +37,7 @@
 #include <asm/hyperv-tlfs.h>
 
 #define __KVM_HAVE_ARCH_VCPU_DEBUGFS
+#define __KVM_HAVE_ARCH_UPDATE_MEM_ATTR
 
 #define KVM_MAX_VCPUS 1024
 
@@ -952,6 +953,13 @@ struct kvm_vcpu_arch {
 #endif
 };
 
+/*
+ * Use a bit in disallow_lpage to indicate private/shared pages mixed at the
+ * level. The remaining bits are used as a reference count.
+ */
+#define KVM_LPAGE_PRIVATE_SHARED_MIXED		(1U << 31)
+#define KVM_LPAGE_COUNT_MAX			((1U << 31) - 1)
+
 struct kvm_lpage_info {
 	int disallow_lpage;
 };
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 33b1aec44fb8..67a9823a8c35 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -762,11 +762,16 @@ static void update_gfn_disallow_lpage_count(const struct kvm_memory_slot *slot,
 {
 	struct kvm_lpage_info *linfo;
 	int i;
+	int disallow_count;
 
 	for (i = PG_LEVEL_2M; i <= KVM_MAX_HUGEPAGE_LEVEL; ++i) {
 		linfo = lpage_info_slot(gfn, slot, i);
+
+		disallow_count = linfo->disallow_lpage & KVM_LPAGE_COUNT_MAX;
+		WARN_ON(disallow_count + count < 0 ||
+			disallow_count > KVM_LPAGE_COUNT_MAX - count);
+
 		linfo->disallow_lpage += count;
-		WARN_ON(linfo->disallow_lpage < 0);
 	}
 }
 
@@ -6910,3 +6915,108 @@ void kvm_mmu_pre_destroy_vm(struct kvm *kvm)
 	if (kvm->arch.nx_lpage_recovery_thread)
 		kthread_stop(kvm->arch.nx_lpage_recovery_thread);
 }
+
+static inline bool linfo_is_mixed(struct kvm_lpage_info *linfo)
+{
+	return linfo->disallow_lpage & KVM_LPAGE_PRIVATE_SHARED_MIXED;
+}
+
+static inline void linfo_update_mixed(struct kvm_lpage_info *linfo, bool mixed)
+{
+	if (mixed)
+		linfo->disallow_lpage |= KVM_LPAGE_PRIVATE_SHARED_MIXED;
+	else
+		linfo->disallow_lpage &= ~KVM_LPAGE_PRIVATE_SHARED_MIXED;
+}
+
+static bool mem_attr_is_mixed_2m(struct kvm *kvm, unsigned int attr,
+				 gfn_t start, gfn_t end)
+{
+	XA_STATE(xas, &kvm->mem_attr_array, start);
+	gfn_t gfn = start;
+	void *entry;
+	bool shared = attr == KVM_MEM_ATTR_SHARED;
+	bool mixed = false;
+
+	rcu_read_lock();
+	entry = xas_load(&xas);
+	while (gfn < end) {
+		if (xas_retry(&xas, entry))
+			continue;
+
+		KVM_BUG_ON(gfn != xas.xa_index, kvm);
+
+		if ((entry && !shared) || (!entry && shared)) {
+			mixed = true;
+			goto out;
+		}
+
+		entry = xas_next(&xas);
+		gfn++;
+	}
+out:
+	rcu_read_unlock();
+	return mixed;
+}
+
+static bool mem_attr_is_mixed(struct kvm *kvm, struct kvm_memory_slot *slot,
+			      int level, unsigned int attr,
+			      gfn_t start, gfn_t end)
+{
+	unsigned long gfn;
+	void *entry;
+
+	if (level == PG_LEVEL_2M)
+		return mem_attr_is_mixed_2m(kvm, attr, start, end);
+
+	entry = xa_load(&kvm->mem_attr_array, start);
+	for (gfn = start; gfn < end; gfn += KVM_PAGES_PER_HPAGE(level - 1)) {
+		if (linfo_is_mixed(lpage_info_slot(gfn, slot, level - 1)))
+			return true;
+		if (xa_load(&kvm->mem_attr_array, gfn) != entry)
+			return true;
+	}
+	return false;
+}
+
+void kvm_arch_update_mem_attr(struct kvm *kvm, struct kvm_memory_slot *slot,
+			      unsigned int attr, gfn_t start, gfn_t end)
+{
+
+	unsigned long lpage_start, lpage_end;
+	unsigned long gfn, pages, mask;
+	int level;
+
+	WARN_ONCE(!(attr & (KVM_MEM_ATTR_PRIVATE | KVM_MEM_ATTR_SHARED)),
+			"Unsupported mem attribute.\n");
+
+	/*
+	 * The sequence matters here: we update the higher level basing on the
+	 * lower level's scanning result.
+	 */
+	for (level = PG_LEVEL_2M; level <= KVM_MAX_HUGEPAGE_LEVEL; level++) {
+		pages = KVM_PAGES_PER_HPAGE(level);
+		mask = ~(pages - 1);
+		lpage_start = max(start & mask, slot->base_gfn);
+		lpage_end = (end - 1) & mask;
+
+		/*
+		 * We only need to scan the head and tail page, for middle pages
+		 * we know they are not mixed.
+		 */
+		linfo_update_mixed(lpage_info_slot(lpage_start, slot, level),
+				   mem_attr_is_mixed(kvm, slot, level, attr,
+						     lpage_start, start));
+
+		if (lpage_start == lpage_end)
+			return;
+
+		for (gfn = lpage_start + pages; gfn < lpage_end; gfn += pages)
+			linfo_update_mixed(lpage_info_slot(gfn, slot, level),
+					   false);
+
+		linfo_update_mixed(lpage_info_slot(lpage_end, slot, level),
+				   mem_attr_is_mixed(kvm, slot, level, attr,
+						     end, lpage_end + pages));
+	}
+}
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 02ad31f46dd7..4276ca73bd7b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12563,6 +12563,8 @@ static int kvm_alloc_memslot_metadata(struct kvm *kvm,
 		if ((slot->base_gfn + npages) & (KVM_PAGES_PER_HPAGE(level) - 1))
 			linfo[lpages - 1].disallow_lpage = 1;
 		ugfn = slot->userspace_addr >> PAGE_SHIFT;
+		if (kvm_slot_can_be_private(slot))
+			ugfn |= slot->restricted_offset >> PAGE_SHIFT;
 		/*
 		 * If the gfn and userspace address are not aligned wrt each
 		 * other, disable large page support for this slot.
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4ce98fa0153c..6ce36065532c 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2284,4 +2284,23 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
+#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
+
+#define KVM_MEM_ATTR_SHARED	0x0001
+#define KVM_MEM_ATTR_PRIVATE	0x0002
+
+#ifdef __KVM_HAVE_ARCH_UPDATE_MEM_ATTR
+void kvm_arch_update_mem_attr(struct kvm *kvm, struct kvm_memory_slot *slot,
+			      unsigned int attr, gfn_t start, gfn_t end);
+#else
+static inline void kvm_arch_update_mem_attr(struct kvm *kvm,
+					    struct kvm_memory_slot *slot,
+					    unsigned int attr,
+					    gfn_t start, gfn_t end)
+{
+}
+#endif
+
+#endif /* CONFIG_KVM_GENERIC_PRIVATE_MEM */
+
 #endif
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fc3835826ace..13a37b4d9e97 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -939,7 +939,8 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
 
 #ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
 
-static void kvm_unmap_mem_range(struct kvm *kvm, gfn_t start, gfn_t end)
+static void kvm_unmap_mem_range(struct kvm *kvm, gfn_t start, gfn_t end,
+				unsigned int attr)
 {
 	struct kvm_gfn_range gfn_range;
 	struct kvm_memory_slot *slot;
@@ -963,6 +964,7 @@ static void kvm_unmap_mem_range(struct kvm *kvm, gfn_t start, gfn_t end)
 			gfn_range.slot = slot;
 
 			r |= kvm_unmap_gfn_range(kvm, &gfn_range);
+			kvm_arch_update_mem_attr(kvm, slot, attr, start, end);
 		}
 	}
 
@@ -970,7 +972,6 @@ static void kvm_unmap_mem_range(struct kvm *kvm, gfn_t start, gfn_t end)
 		kvm_flush_remote_tlbs(kvm);
 }
 
-#define KVM_MEM_ATTR_SHARED	0x0001
 static int kvm_vm_ioctl_set_mem_attr(struct kvm *kvm, gpa_t gpa, gpa_t size,
 				     bool is_private)
 {
@@ -979,6 +980,7 @@ static int kvm_vm_ioctl_set_mem_attr(struct kvm *kvm, gpa_t gpa, gpa_t size,
 	void *entry;
 	int idx;
 	int r = 0;
+	unsigned int attr;
 
 	if (size == 0 || gpa + size < gpa)
 		return -EINVAL;
@@ -992,7 +994,13 @@ static int kvm_vm_ioctl_set_mem_attr(struct kvm *kvm, gpa_t gpa, gpa_t size,
 	 * Guest memory defaults to private, kvm->mem_attr_array only stores
 	 * shared memory.
 	 */
-	entry = is_private ? NULL : xa_mk_value(KVM_MEM_ATTR_SHARED);
+	if (is_private) {
+		attr = KVM_MEM_ATTR_PRIVATE;
+		entry = NULL;
+	} else {
+		attr = KVM_MEM_ATTR_SHARED;
+		entry = xa_mk_value(KVM_MEM_ATTR_SHARED);
+	}
 
 	idx = srcu_read_lock(&kvm->srcu);
 	KVM_MMU_LOCK(kvm);
@@ -1005,7 +1013,7 @@ static int kvm_vm_ioctl_set_mem_attr(struct kvm *kvm, gpa_t gpa, gpa_t size,
 			goto err;
 	}
 
-	kvm_unmap_mem_range(kvm, start, end);
+	kvm_unmap_mem_range(kvm, start, end, attr);
 
 	goto ret;
 err:
-- 
2.25.1



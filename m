Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3687047E3AC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:44:57 +0100 (CET)
Received: from localhost ([::1]:41992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0NSq-0002l1-9C
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:44:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0NFz-0005S0-Qv
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:31:41 -0500
Received: from mga11.intel.com ([192.55.52.93]:22144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0NFx-0002cm-Lj
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640262697; x=1671798697;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=aIJ/jdrIZIbqeWf2gsio5EQmDbnrSHD8LOLFRVTJ4eg=;
 b=lroq2U4s0eugZzIqhn8nMPPvze3nkpPe2jtJ1JhbYCCq/Wp2CJfVAfFa
 CdlxPs14dJxfgfyOdzd16YsRoQxAEIzF4kMrqUixiwynZYIDhTZdoxPMz
 KCkoasG68m/7tXZ4KYCYQv2l5TVn0yO/Bd7TJsc/MMkIPjp7hKV1NZ9sM
 hDaKcFtgRlv4NRh3ldgfGV5hFgweg76JrXi+dk6m26ts3VUAUxt0swgzR
 PjivMYVC6WCEYP2/ZWMPNdn1bU80iWANkZhi37QBZAy9LFx38NxHq34XK
 AgATo5IqtusvCyY2pzaSbnAh0JxPpH7u5f0TVUOTRxJ2rLnLs2O3p3SX3 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="238352241"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="238352241"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 04:31:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522078687"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 23 Dec 2021 04:31:27 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 kvm/queue 05/16] KVM: Maintain ofs_tree for fast memslot
 lookup by file offset
Date: Thu, 23 Dec 2021 20:30:00 +0800
Message-Id: <20211223123011.41044-6-chao.p.peng@linux.intel.com>
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

Similar to hva_tree for hva range, maintain interval tree ofs_tree for
offset range of a fd-based memslot so the lookup by offset range can be
faster when memslot count is high.

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 17 +++++++++++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 2cd35560c44b..3bd875f9669f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -451,6 +451,7 @@ static inline int kvm_vcpu_exiting_guest_mode(struct kvm_vcpu *vcpu)
 struct kvm_memory_slot {
 	struct hlist_node id_node[2];
 	struct interval_tree_node hva_node[2];
+	struct interval_tree_node ofs_node[2];
 	struct rb_node gfn_node[2];
 	gfn_t base_gfn;
 	unsigned long npages;
@@ -560,6 +561,7 @@ struct kvm_memslots {
 	u64 generation;
 	atomic_long_t last_used_slot;
 	struct rb_root_cached hva_tree;
+	struct rb_root_cached ofs_tree;
 	struct rb_root gfn_tree;
 	/*
 	 * The mapping table from slot id to memslot.
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b0f7e6eb00ff..47e96d1eb233 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1087,6 +1087,7 @@ static struct kvm *kvm_create_vm(unsigned long type)
 
 			atomic_long_set(&slots->last_used_slot, (unsigned long)NULL);
 			slots->hva_tree = RB_ROOT_CACHED;
+			slots->ofs_tree = RB_ROOT_CACHED;
 			slots->gfn_tree = RB_ROOT;
 			hash_init(slots->id_hash);
 			slots->node_idx = j;
@@ -1363,7 +1364,7 @@ static void kvm_replace_gfn_node(struct kvm_memslots *slots,
  * With NULL @old this simply adds @new.
  * With NULL @new this simply removes @old.
  *
- * If @new is non-NULL its hva_node[slots_idx] range has to be set
+ * If @new is non-NULL its hva/ofs_node[slots_idx] range has to be set
  * appropriately.
  */
 static void kvm_replace_memslot(struct kvm *kvm,
@@ -1377,6 +1378,7 @@ static void kvm_replace_memslot(struct kvm *kvm,
 	if (old) {
 		hash_del(&old->id_node[idx]);
 		interval_tree_remove(&old->hva_node[idx], &slots->hva_tree);
+		interval_tree_remove(&old->ofs_node[idx], &slots->ofs_tree);
 
 		if ((long)old == atomic_long_read(&slots->last_used_slot))
 			atomic_long_set(&slots->last_used_slot, (long)new);
@@ -1388,20 +1390,27 @@ static void kvm_replace_memslot(struct kvm *kvm,
 	}
 
 	/*
-	 * Initialize @new's hva range.  Do this even when replacing an @old
+	 * Initialize @new's hva/ofs range.  Do this even when replacing an @old
 	 * slot, kvm_copy_memslot() deliberately does not touch node data.
 	 */
 	new->hva_node[idx].start = new->userspace_addr;
 	new->hva_node[idx].last = new->userspace_addr +
 				  (new->npages << PAGE_SHIFT) - 1;
+	if (kvm_slot_is_private(new)) {
+		new->ofs_node[idx].start = new->ofs;
+		new->ofs_node[idx].last = new->ofs +
+					  (new->npages << PAGE_SHIFT) - 1;
+	}
 
 	/*
 	 * (Re)Add the new memslot.  There is no O(1) interval_tree_replace(),
-	 * hva_node needs to be swapped with remove+insert even though hva can't
-	 * change when replacing an existing slot.
+	 * hva_node/ofs_node needs to be swapped with remove+insert even though
+	 * hva/ofs can't change when replacing an existing slot.
 	 */
 	hash_add(slots->id_hash, &new->id_node[idx], new->id);
 	interval_tree_insert(&new->hva_node[idx], &slots->hva_tree);
+	if (kvm_slot_is_private(new))
+		interval_tree_insert(&new->ofs_node[idx], &slots->ofs_tree);
 
 	/*
 	 * If the memslot gfn is unchanged, rb_replace_node() can be used to
-- 
2.17.1



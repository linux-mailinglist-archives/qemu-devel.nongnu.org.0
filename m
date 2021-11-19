Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EAC457038
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:05:33 +0100 (CET)
Received: from localhost ([::1]:55730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4WB-00013I-O2
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:05:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mo4Gn-0007NP-1N
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:49:37 -0500
Received: from mga02.intel.com ([134.134.136.20]:30673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mo4Gk-0000Ne-4W
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:49:36 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="221632385"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="221632385"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 05:49:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="507905038"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 19 Nov 2021 05:49:24 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC v2 PATCH 07/13] KVM: Handle page fault for fd based memslot
Date: Fri, 19 Nov 2021 21:47:33 +0800
Message-Id: <20211119134739.20218-8-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

Current code assume the private memory is persistent and KVM can check
with backing store to see if private memory exists at the same address
by calling get_pfn(alloc=false).

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 arch/x86/kvm/mmu/mmu.c | 75 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 40377901598b..cd5d1f923694 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3277,6 +3277,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
 	if (max_level == PG_LEVEL_4K)
 		return PG_LEVEL_4K;
 
+	if (memslot_is_memfd(slot))
+		return max_level;
+
 	host_level = host_pfn_mapping_level(kvm, gfn, pfn, slot);
 	return min(host_level, max_level);
 }
@@ -4555,6 +4558,65 @@ static bool kvm_arch_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 				  kvm_vcpu_gfn_to_hva(vcpu, gfn), &arch);
 }
 
+static bool kvm_faultin_pfn_memfd(struct kvm_vcpu *vcpu,
+				  struct kvm_page_fault *fault, int *r)
+{	int order;
+	kvm_pfn_t pfn;
+	struct kvm_memory_slot *slot = fault->slot;
+	bool priv_gfn = kvm_vcpu_is_private_gfn(vcpu, fault->addr >> PAGE_SHIFT);
+	bool priv_slot_exists = memslot_has_private(slot);
+	bool priv_gfn_exists = false;
+	int mem_convert_type;
+
+	if (priv_gfn && !priv_slot_exists) {
+		*r = RET_PF_INVALID;
+		return true;
+	}
+
+	if (priv_slot_exists) {
+		pfn = slot->memfd_ops->get_pfn(slot, slot->priv_file,
+					       fault->gfn, false, &order);
+		if (pfn >= 0)
+			priv_gfn_exists = true;
+	}
+
+	if (priv_gfn && !priv_gfn_exists) {
+		mem_convert_type = KVM_EXIT_MEM_MAP_PRIVATE;
+		goto out_convert;
+	}
+
+	if (!priv_gfn && priv_gfn_exists) {
+		slot->memfd_ops->put_pfn(pfn);
+		mem_convert_type = KVM_EXIT_MEM_MAP_SHARED;
+		goto out_convert;
+	}
+
+	if (!priv_gfn) {
+		pfn = slot->memfd_ops->get_pfn(slot, slot->file,
+					       fault->gfn, true, &order);
+		if (fault->pfn < 0) {
+			*r = RET_PF_INVALID;
+			return true;
+		}
+	}
+
+	if (slot->flags & KVM_MEM_READONLY)
+		fault->map_writable = false;
+	if (order == 0)
+		fault->max_level = PG_LEVEL_4K;
+
+	return false;
+
+out_convert:
+	vcpu->run->exit_reason = KVM_EXIT_MEMORY_ERROR;
+	vcpu->run->mem.type = mem_convert_type;
+	vcpu->run->mem.u.map.gpa = fault->gfn << PAGE_SHIFT;
+	vcpu->run->mem.u.map.size = PAGE_SIZE;
+	fault->pfn = -1;
+	*r = -1;
+	return true;
+}
+
 static bool kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault, int *r)
 {
 	struct kvm_memory_slot *slot = fault->slot;
@@ -4596,6 +4658,9 @@ static bool kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
 		}
 	}
 
+	if (memslot_is_memfd(slot))
+		return kvm_faultin_pfn_memfd(vcpu, fault, r);
+
 	async = false;
 	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, &async,
 					  fault->write, &fault->map_writable,
@@ -4660,7 +4725,8 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	else
 		write_lock(&vcpu->kvm->mmu_lock);
 
-	if (fault->slot && mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, fault->hva))
+	if (fault->slot && !memslot_is_memfd(fault->slot) &&
+			mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, fault->hva))
 		goto out_unlock;
 	r = make_mmu_pages_available(vcpu);
 	if (r)
@@ -4676,7 +4742,12 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 		read_unlock(&vcpu->kvm->mmu_lock);
 	else
 		write_unlock(&vcpu->kvm->mmu_lock);
-	kvm_release_pfn_clean(fault->pfn);
+
+	if (memslot_is_memfd(fault->slot))
+		fault->slot->memfd_ops->put_pfn(fault->pfn);
+	else
+		kvm_release_pfn_clean(fault->pfn);
+
 	return r;
 }
 
-- 
2.17.1



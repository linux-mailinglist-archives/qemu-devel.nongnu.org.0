Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4D545704E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:08:16 +0100 (CET)
Received: from localhost ([::1]:35884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4Yp-0006pQ-Rn
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:08:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mo4Ge-000737-HQ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:49:28 -0500
Received: from mga12.intel.com ([192.55.52.136]:23792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mo4Gc-0000LC-Db
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:49:28 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="214443915"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="214443915"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 05:49:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="507904988"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 19 Nov 2021 05:49:16 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC v2 PATCH 06/13] KVM: Register/unregister memfd backed memslot
Date: Fri, 19 Nov 2021 21:47:32 +0800
Message-Id: <20211119134739.20218-7-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 virt/kvm/kvm_main.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 271cef8d1cd0..b8673490d301 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1426,7 +1426,7 @@ static void update_memslots(struct kvm_memslots *slots,
 static int check_memory_region_flags(struct kvm *kvm,
 			     const struct kvm_userspace_memory_region_ext *mem)
 {
-	u32 valid_flags = 0;
+	u32 valid_flags = KVM_MEM_FD;
 
 	if (!kvm->dirty_log_unsupported)
 		valid_flags |= KVM_MEM_LOG_DIRTY_PAGES;
@@ -1604,10 +1604,20 @@ static int kvm_set_memslot(struct kvm *kvm,
 		kvm_copy_memslots(slots, __kvm_memslots(kvm, as_id));
 	}
 
+	if (mem->flags & KVM_MEM_FD && change == KVM_MR_CREATE) {
+		r = kvm_memfd_register(kvm, mem, new);
+		if (r)
+			goto out_slots;
+	}
+
 	r = kvm_arch_prepare_memory_region(kvm, new, mem, change);
 	if (r)
 		goto out_slots;
 
+	if (mem->flags & KVM_MEM_FD && (r || change == KVM_MR_DELETE)) {
+		kvm_memfd_unregister(kvm, new);
+	}
+
 	update_memslots(slots, new, change);
 	slots = install_new_memslots(kvm, as_id, slots);
 
@@ -1683,10 +1693,12 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		return -EINVAL;
 	if (mem->guest_phys_addr & (PAGE_SIZE - 1))
 		return -EINVAL;
-	/* We can read the guest memory with __xxx_user() later on. */
 	if ((mem->userspace_addr & (PAGE_SIZE - 1)) ||
-	    (mem->userspace_addr != untagged_addr(mem->userspace_addr)) ||
-	     !access_ok((void __user *)(unsigned long)mem->userspace_addr,
+	    (mem->userspace_addr != untagged_addr(mem->userspace_addr)))
+		return -EINVAL;
+	/* We can read the guest memory with __xxx_user() later on. */
+	if (!(mem->flags & KVM_MEM_FD) &&
+	    !access_ok((void __user *)(unsigned long)mem->userspace_addr,
 			mem->memory_size))
 		return -EINVAL;
 	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_MEM_SLOTS_NUM)
@@ -1727,6 +1739,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		new.dirty_bitmap = NULL;
 		memset(&new.arch, 0, sizeof(new.arch));
 	} else { /* Modify an existing slot. */
+		/* Private memslots are immutable, they can only be deleted. */
+		if (mem->flags & KVM_MEM_FD && mem->private_fd >= 0)
+			return -EINVAL;
 		if ((new.userspace_addr != old.userspace_addr) ||
 		    (new.npages != old.npages) ||
 		    ((new.flags ^ old.flags) & KVM_MEM_READONLY))
-- 
2.17.1



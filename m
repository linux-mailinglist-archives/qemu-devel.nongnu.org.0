Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611DA492982
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:17:42 +0100 (CET)
Received: from localhost ([::1]:39346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9qEv-0003LI-6t
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:17:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oSP-0001VC-ON
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:23:29 -0500
Received: from mga11.intel.com ([192.55.52.93]:38802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oSN-0003Ki-MM
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642512207; x=1674048207;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=WMNkcnSDaEvDrlJP1KgKm0jYnNbblXf6Dmx4W+l5lNg=;
 b=SBEaPUXBmWHMlnU7hMc4oKxMC67hTJCLH04WnmyeyAZU8PJckIagXJL1
 YrnAbB199u9T/SW9Y0/0CMuuTUhv5pgl46EXzULwqp6hhFI4/2oeE1cCV
 HnqrDw/oOL6Gs0JhPI4j/RH63IuGkTqAjHQ6EgfxySHML81M6lGptRu+B
 WJdVM5j7TxXY8USG7p0RaeOBjnKKb1iBBoMfKJ9phgHx8zbZ7Mn5do2UM
 ozvcv1j9YkYw0ssIsQmR/6KpvRwi6vTA5WWKxqR2GoC8AaSmsEIoWoHNN
 L7CAYmIzoOMmzN9YJ5vr7csTj/m55YYvHMl83xEEV8RoUnYQFVwY2InyE Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="242373200"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="242373200"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 05:23:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="531791967"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 05:23:19 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v4 12/12] KVM: Expose KVM_MEM_PRIVATE
Date: Tue, 18 Jan 2022 21:21:21 +0800
Message-Id: <20220118132121.31388-13-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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

KVM_MEM_PRIVATE is not exposed by default but architecture code can turn
on it by implementing kvm_arch_private_memory_supported().

Also private memslot cannot be movable and the same file+offset can not
be mapped into different GFNs.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/kvm_main.c      | 49 ++++++++++++++++++++++++++++++++++------
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 117cf0da9c5e..444b390261c0 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1328,6 +1328,7 @@ bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu);
 int kvm_arch_post_init_vm(struct kvm *kvm);
 void kvm_arch_pre_destroy_vm(struct kvm *kvm);
 int kvm_arch_create_vm_debugfs(struct kvm *kvm);
+bool kvm_arch_private_memory_supported(struct kvm *kvm);
 
 #ifndef __KVM_HAVE_ARCH_VM_ALLOC
 /*
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 10e553215618..51d0f08a8601 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1491,10 +1491,19 @@ static void kvm_replace_memslot(struct kvm *kvm,
 	}
 }
 
-static int check_memory_region_flags(const struct kvm_userspace_memory_region *mem)
+bool __weak kvm_arch_private_memory_supported(struct kvm *kvm)
+{
+	return false;
+}
+
+static int check_memory_region_flags(struct kvm *kvm,
+				const struct kvm_userspace_memory_region *mem)
 {
 	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
 
+	if (kvm_arch_private_memory_supported(kvm))
+		valid_flags |= KVM_MEM_PRIVATE;
+
 #ifdef __KVM_HAVE_READONLY_MEM
 	valid_flags |= KVM_MEM_READONLY;
 #endif
@@ -1873,15 +1882,32 @@ static int kvm_set_memslot(struct kvm *kvm,
 }
 
 static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
-				      gfn_t start, gfn_t end)
+				      struct file *file,
+				      gfn_t start, gfn_t end,
+				      loff_t start_off, loff_t end_off)
 {
 	struct kvm_memslot_iter iter;
+	struct kvm_memory_slot *slot;
+	struct inode *inode;
+	int bkt;
 
 	kvm_for_each_memslot_in_gfn_range(&iter, slots, start, end) {
 		if (iter.slot->id != id)
 			return true;
 	}
 
+	/* Disallow mapping the same file+offset into multiple gfns. */
+	if (file) {
+		inode = file_inode(file);
+		kvm_for_each_memslot(slot, bkt, slots) {
+			if (slot->private_file &&
+			     file_inode(slot->private_file) == inode &&
+			     !(end_off <= slot->private_offset ||
+			       start_off >= slot->private_offset
+					     + (slot->npages >> PAGE_SHIFT)))
+				return true;
+		}
+	}
 	return false;
 }
 
@@ -1906,7 +1932,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	int as_id, id;
 	int r;
 
-	r = check_memory_region_flags(mem);
+	r = check_memory_region_flags(kvm, mem);
 	if (r)
 		return r;
 
@@ -1919,10 +1945,12 @@ int __kvm_set_memory_region(struct kvm *kvm,
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
+	if (!(mem->flags & KVM_MEM_PRIVATE) &&
+	    !access_ok((void __user *)(unsigned long)mem->userspace_addr,
 			mem->memory_size))
 		return -EINVAL;
 	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_MEM_SLOTS_NUM)
@@ -1963,6 +1991,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
 			return -EINVAL;
 	} else { /* Modify an existing slot. */
+		/* Private memslots are immutable, they can only be deleted. */
+		if (mem->flags & KVM_MEM_PRIVATE)
+			return -EINVAL;
 		if ((mem->userspace_addr != old->userspace_addr) ||
 		    (npages != old->npages) ||
 		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
@@ -1983,7 +2014,11 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	}
 
 	if ((change == KVM_MR_CREATE || change == KVM_MR_MOVE) &&
-	    kvm_check_memslot_overlap(slots, id, base_gfn, base_gfn + npages)) {
+	    kvm_check_memslot_overlap(slots, id, file,
+				      base_gfn, base_gfn + npages,
+				      region_ext->private_offset,
+				      region_ext->private_offset +
+						mem->memory_size)) {
 		r = -EEXIST;
 		goto out;
 	}
-- 
2.17.1



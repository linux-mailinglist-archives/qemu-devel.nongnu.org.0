Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35D847C2CC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 16:27:25 +0100 (CET)
Received: from localhost ([::1]:42248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzh2y-000357-PM
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 10:27:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzgq7-0001Iy-Kj
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:14:07 -0500
Received: from mga11.intel.com ([192.55.52.93]:41795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzgq5-0008Qo-TC
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640099645; x=1671635645;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=We7gK/h+jEknZOV42LJTALD74jcdTiL5CfglrMRHFxI=;
 b=ZyhsokvGHo9XCsNX7JMF7y7+yP2PNu4BI135IcezbXRqYw+Xr2VkBli5
 i0VDXQlZMKnDoQs/QOYB9Q7+SGIGlil0WLPa31gRHsyKcoayNjHabS984
 K3dLdx4nhfMfrzkAo29kOi+/pKIEOQ54V1nR9/GXrTvzSJDE4Myzo96mn
 booPECQ/WUEtVBw/1yICqqr2rjZaESoJVh6eUk6w+2ojzPUGCLz6xoAWM
 +3BBUY8VeDJTqojkh6Cg+D2CgeOgHXpozTUcGCzpa1C/aE9T2gtRFSJfI
 vjBwdYC+B8YdmFICBNyu67B+Pz1kzurwseiCwuGXFcFSzNOmskjIanCam g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="237946939"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="237946939"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 07:14:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="684688711"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga005.jf.intel.com with ESMTP; 21 Dec 2021 07:13:56 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 15/15] KVM: Register/unregister private memory slot to memfd
Date: Tue, 21 Dec 2021 23:11:25 +0800
Message-Id: <20211221151125.19446-16-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
References: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
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

Expose KVM_MEM_PRIVATE flag and register/unregister private memory
slot to memfd when userspace sets the flag.

KVM_MEM_PRIVATE is disallowed by default but architecture code can
turn it on by implementing kvm_arch_private_memory_supported().

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 35 +++++++++++++++++++++++++++++++----
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 0c53df0a6b2e..0f0e24f19892 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1096,6 +1096,8 @@ int kvm_arch_post_init_vm(struct kvm *kvm);
 void kvm_arch_pre_destroy_vm(struct kvm *kvm);
 int kvm_arch_create_vm_debugfs(struct kvm *kvm);
 bool kvm_arch_dirty_log_supported(struct kvm *kvm);
+bool kvm_arch_private_memory_supported(struct kvm *kvm);
+
 
 #ifndef __KVM_HAVE_ARCH_VM_ALLOC
 /*
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 79313c549fb9..6eb0d86abdcf 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1509,6 +1509,11 @@ bool __weak kvm_arch_dirty_log_supported(struct kvm *kvm)
 	return true;
 }
 
+bool __weak kvm_arch_private_memory_supported(struct kvm *kvm)
+{
+	return false;
+}
+
 static int check_memory_region_flags(struct kvm *kvm,
 			     const struct kvm_userspace_memory_region_ext *mem)
 {
@@ -1517,6 +1522,9 @@ static int check_memory_region_flags(struct kvm *kvm,
 	if (kvm_arch_dirty_log_supported(kvm))
 		valid_flags |= KVM_MEM_LOG_DIRTY_PAGES;
 
+	if (kvm_arch_private_memory_supported(kvm))
+		valid_flags |= KVM_MEM_PRIVATE;
+
 #ifdef __KVM_HAVE_READONLY_MEM
 	valid_flags |= KVM_MEM_READONLY;
 #endif
@@ -1708,9 +1716,21 @@ static int kvm_set_memslot(struct kvm *kvm,
 	/* Copy the arch-specific data, again after (re)acquiring slots_arch_lock. */
 	memcpy(&new->arch, &old.arch, sizeof(old.arch));
 
+	if (mem->flags & KVM_MEM_PRIVATE && change == KVM_MR_CREATE) {
+		r = kvm_memfd_register(kvm, mem, new);
+		if (r)
+			goto out_slots;
+	}
+
 	r = kvm_arch_prepare_memory_region(kvm, new, mem, change);
-	if (r)
+	if (r) {
+		if (mem->flags & KVM_MEM_PRIVATE && change == KVM_MR_CREATE)
+			kvm_memfd_unregister(kvm, new);
 		goto out_slots;
+	}
+
+	if (mem->flags & KVM_MEM_PRIVATE && change == KVM_MR_DELETE)
+		kvm_memfd_unregister(kvm, new);
 
 	update_memslots(slots, new, change);
 	slots = install_new_memslots(kvm, as_id, slots);
@@ -1786,10 +1806,12 @@ int __kvm_set_memory_region(struct kvm *kvm,
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
@@ -1821,6 +1843,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	new.npages = mem->memory_size >> PAGE_SHIFT;
 	new.flags = mem->flags;
 	new.userspace_addr = mem->userspace_addr;
+	new.file = NULL;
+	new.file_ofs = 0;
 
 	if (new.npages > KVM_MEM_MAX_NR_PAGES)
 		return -EINVAL;
@@ -1829,6 +1853,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		change = KVM_MR_CREATE;
 		new.dirty_bitmap = NULL;
 	} else { /* Modify an existing slot. */
+		/* Private memslots are immutable, they can only be deleted. */
+		if (mem->flags & KVM_MEM_PRIVATE)
+			return -EINVAL;
 		if ((new.userspace_addr != old.userspace_addr) ||
 		    (new.npages != old.npages) ||
 		    ((new.flags ^ old.flags) & KVM_MEM_READONLY))
-- 
2.17.1



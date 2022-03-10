Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F94D48B7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:13:18 +0100 (CET)
Received: from localhost ([::1]:57898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJXZ-0000QF-Q9
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:13:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJUr-00065H-0D
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:10:29 -0500
Received: from mga03.intel.com ([134.134.136.65]:35090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJUo-0004xK-O2
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646921426; x=1678457426;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=aXDmGBTRlSAIbebZ1eKgmeAE+5/9H+lFwtsMHbxfleU=;
 b=NpAwKIFpSKCxjUC/3BiQkdsatjJed/h3nX90xj7t3osXE64se+4ruujM
 5T2H0aVZ+4ZQeaSSlc9d5cNvnhREIviOoDgUdwCSK07qG/Oo3yhR72U7y
 QNz54Z4H5o5iUUV9R9H1lrdluM+5v5r25FUfTW1eyxRC/Jjtl5DnF880a
 6571hpsb5wxBO0nA96w1zj8hJKrwHzi80Dcmm0mtio44l1eioSEYwngyE
 qEFhdtd3IynLdt14WwILoKiD8va0fSPU5Akml1TrixA9N6oAIhqIJQKob
 rgPKJ9KLr/sYdv0ZOl69fO6AccrLiU2M/hy86n/07U0s0JbyHFWGphGXr w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255203145"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="255203145"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:10:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="554655000"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 10 Mar 2022 06:10:16 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v5 06/13] KVM: Use kvm_userspace_memory_region_ext
Date: Thu, 10 Mar 2022 22:09:04 +0800
Message-Id: <20220310140911.50924-7-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
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

Use the new extended memslot structure kvm_userspace_memory_region_ext.
The extended part (private_fd/ private_offset) will be copied from
userspace only when KVM_MEM_PRIVATE is set. Internally old
kvm_userspace_memory_region will still be used for places where the
extended fields are not needed.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 arch/x86/kvm/x86.c       | 12 ++++++------
 include/linux/kvm_host.h |  4 ++--
 virt/kvm/kvm_main.c      | 30 ++++++++++++++++++++----------
 3 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 8c06b8204fca..1d9dbef67715 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11757,13 +11757,13 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 	}
 
 	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
-		struct kvm_userspace_memory_region m;
+		struct kvm_userspace_memory_region_ext m;
 
-		m.slot = id | (i << 16);
-		m.flags = 0;
-		m.guest_phys_addr = gpa;
-		m.userspace_addr = hva;
-		m.memory_size = size;
+		m.region.slot = id | (i << 16);
+		m.region.flags = 0;
+		m.region.guest_phys_addr = gpa;
+		m.region.userspace_addr = hva;
+		m.region.memory_size = size;
 		r = __kvm_set_memory_region(kvm, &m);
 		if (r < 0)
 			return ERR_PTR_USR(r);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3be8116079d4..c92c70174248 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1082,9 +1082,9 @@ enum kvm_mr_change {
 };
 
 int kvm_set_memory_region(struct kvm *kvm,
-			  const struct kvm_userspace_memory_region *mem);
+		const struct kvm_userspace_memory_region_ext *region_ext);
 int __kvm_set_memory_region(struct kvm *kvm,
-			    const struct kvm_userspace_memory_region *mem);
+		const struct kvm_userspace_memory_region_ext *region_ext);
 void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot);
 void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen);
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 69c318fdff61..d11a2628b548 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1809,8 +1809,9 @@ static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
  * Must be called holding kvm->slots_lock for write.
  */
 int __kvm_set_memory_region(struct kvm *kvm,
-			    const struct kvm_userspace_memory_region *mem)
+		const struct kvm_userspace_memory_region_ext *region_ext)
 {
+	const struct kvm_userspace_memory_region *mem = &region_ext->region;
 	struct kvm_memory_slot *old, *new;
 	struct kvm_memslots *slots;
 	enum kvm_mr_change change;
@@ -1913,24 +1914,24 @@ int __kvm_set_memory_region(struct kvm *kvm,
 EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
 
 int kvm_set_memory_region(struct kvm *kvm,
-			  const struct kvm_userspace_memory_region *mem)
+		const struct kvm_userspace_memory_region_ext *region_ext)
 {
 	int r;
 
 	mutex_lock(&kvm->slots_lock);
-	r = __kvm_set_memory_region(kvm, mem);
+	r = __kvm_set_memory_region(kvm, region_ext);
 	mutex_unlock(&kvm->slots_lock);
 	return r;
 }
 EXPORT_SYMBOL_GPL(kvm_set_memory_region);
 
 static int kvm_vm_ioctl_set_memory_region(struct kvm *kvm,
-					  struct kvm_userspace_memory_region *mem)
+			struct kvm_userspace_memory_region_ext *region_ext)
 {
-	if ((u16)mem->slot >= KVM_USER_MEM_SLOTS)
+	if ((u16)region_ext->region.slot >= KVM_USER_MEM_SLOTS)
 		return -EINVAL;
 
-	return kvm_set_memory_region(kvm, mem);
+	return kvm_set_memory_region(kvm, region_ext);
 }
 
 #ifndef CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT
@@ -4476,14 +4477,23 @@ static long kvm_vm_ioctl(struct file *filp,
 		break;
 	}
 	case KVM_SET_USER_MEMORY_REGION: {
-		struct kvm_userspace_memory_region kvm_userspace_mem;
+		struct kvm_userspace_memory_region_ext region_ext;
 
 		r = -EFAULT;
-		if (copy_from_user(&kvm_userspace_mem, argp,
-						sizeof(kvm_userspace_mem)))
+		if (copy_from_user(&region_ext, argp,
+				sizeof(struct kvm_userspace_memory_region)))
 			goto out;
+		if (region_ext.region.flags & KVM_MEM_PRIVATE) {
+			int offset = offsetof(
+				struct kvm_userspace_memory_region_ext,
+				private_offset);
+			if (copy_from_user(&region_ext.private_offset,
+					   argp + offset,
+					   sizeof(region_ext) - offset))
+				goto out;
+		}
 
-		r = kvm_vm_ioctl_set_memory_region(kvm, &kvm_userspace_mem);
+		r = kvm_vm_ioctl_set_memory_region(kvm, &region_ext);
 		break;
 	}
 	case KVM_GET_DIRTY_LOG: {
-- 
2.17.1



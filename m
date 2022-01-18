Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85EE49289B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:43:04 +0100 (CET)
Received: from localhost ([::1]:54376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9phP-00043j-K5
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:43:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oRr-0001GP-Ek
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:22:57 -0500
Received: from mga14.intel.com ([192.55.52.115]:49835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oRo-0003GX-Ty
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642512172; x=1674048172;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=sOy+oj7x4sTMI5lpkFFnOHPfnLg7BWRRkoBuCyEaorQ=;
 b=fZ4QihxW3OBMTUMwW3aQp3GX752y5ZSck4JLfYBij9zXCbEQCQ3WgcTb
 qNoLBEv7ZOxbtCN6b8wmlz4WpTZtb0a//4LkjMQeffm2S+5Jq/qxMgYvh
 NQeGcamB9EYj0cClWfk9nq8Lbw6WeyshQOYPVlpnE5ijfFj1ernyX9cqN
 2ntQSogYdv2cUpITCmEWf6kVo/MsInVw9KaAxYMZQ/6rVbB66kBjzgAh1
 +goy344aDQViSANSKy9/ZsrbuBWPA889E8AmZx7DDfvplpx8JVPQRzJdt
 dJ3Vor+60egCrFG0r32idGhogeBFnOZklxTRI9sVxoFY6FbpfjuPVGIjT A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="245007896"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="245007896"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 05:22:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="531791806"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 05:22:35 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v4 06/12] KVM: Use kvm_userspace_memory_region_ext
Date: Tue, 18 Jan 2022 21:21:15 +0800
Message-Id: <20220118132121.31388-7-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga14.intel.com
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
index c194a8cbd25f..7f8d87463391 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11572,13 +11572,13 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
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
index 5011ac35bc50..26118a45f0bb 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -977,9 +977,9 @@ enum kvm_mr_change {
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
index 168d0ab93c88..ecf94e2548f7 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1815,8 +1815,9 @@ static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
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
@@ -1919,24 +1920,24 @@ int __kvm_set_memory_region(struct kvm *kvm,
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
@@ -4482,14 +4483,23 @@ static long kvm_vm_ioctl(struct file *filp,
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



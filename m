Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2345447E3DA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:57:45 +0100 (CET)
Received: from localhost ([::1]:43196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0NfE-00073R-4i
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:57:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0NHO-0007uv-4i
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:33:06 -0500
Received: from mga05.intel.com ([192.55.52.43]:55614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0NHM-0002oT-AR
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:33:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640262784; x=1671798784;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=gr3qIQtqhPgZ2sWGOjcNk2j5JakW0dks3WgAyQ1CBMA=;
 b=G+K84tXEeIZIud3P8up/EW3dCApAyQXpPOHT/sWN+dn6xs9ClB4Ujl7U
 jUXeEd/gqxY44SOwkuK4Y+SLO8fL33b0r4B8Urxu33SIGzVEqVIdCvSCT
 hI/Z08QMtakfWHMzaYu1PyA7yhS8ZnsT78FX0KC/EoC1KUfdIagDsmcua
 Zy1c26JRZLSBvdVQ8W214xOp/aNzZrWYlILtdd6Lfamlt59slwwqakcQV
 7Q9TO2OtUBAIppO+HYomPJSxl8YsIFlxqqhQMFus541K1Abia4Hacy7Po
 N6dcFPSZc9Y2dAQ/sOLHdMETobi0McrnI5WQIItg1Ol5QqZhBNj+iCAUV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="327129988"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="327129988"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 04:33:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522079184"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 23 Dec 2021 04:32:54 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 kvm/queue 16/16] KVM: Register/unregister private memory
 slot to memfd
Date: Thu, 23 Dec 2021 20:30:11 +0800
Message-Id: <20211223123011.41044-17-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
turn on it by implementing kvm_arch_private_memory_supported().

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/kvm_main.c      | 34 ++++++++++++++++++++++++++++++++--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index fabab3b77d57..5173c52e70d4 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1229,6 +1229,7 @@ bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu);
 int kvm_arch_post_init_vm(struct kvm *kvm);
 void kvm_arch_pre_destroy_vm(struct kvm *kvm);
 int kvm_arch_create_vm_debugfs(struct kvm *kvm);
+bool kvm_arch_private_memory_supported(struct kvm *kvm);
 
 #ifndef __KVM_HAVE_ARCH_VM_ALLOC
 /*
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cf8dcb3b8c7f..1caebded52c4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1514,10 +1514,19 @@ static void kvm_replace_memslot(struct kvm *kvm,
 	}
 }
 
-static int check_memory_region_flags(const struct kvm_userspace_memory_region_ext *mem)
+bool __weak kvm_arch_private_memory_supported(struct kvm *kvm)
+{
+	return false;
+}
+
+static int check_memory_region_flags(struct kvm *kvm,
+			const struct kvm_userspace_memory_region_ext *mem)
 {
 	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
 
+	if (kvm_arch_private_memory_supported(kvm))
+		valid_flags |= KVM_MEM_PRIVATE;
+
 #ifdef __KVM_HAVE_READONLY_MEM
 	valid_flags |= KVM_MEM_READONLY;
 #endif
@@ -1756,6 +1765,8 @@ static void kvm_delete_memslot(struct kvm *kvm,
 			       struct kvm_memory_slot *old,
 			       struct kvm_memory_slot *invalid_slot)
 {
+	if (old->flags & KVM_MEM_PRIVATE)
+		kvm_memfd_unregister(old);
 	/*
 	 * Remove the old memslot (in the inactive memslots) by passing NULL as
 	 * the "new" slot, and for the invalid version in the active slots.
@@ -1836,6 +1847,14 @@ static int kvm_set_memslot(struct kvm *kvm,
 		kvm_invalidate_memslot(kvm, old, invalid_slot);
 	}
 
+	if (new->flags & KVM_MEM_PRIVATE && change == KVM_MR_CREATE) {
+		r = kvm_memfd_register(kvm, new);
+		if (r) {
+			mutex_unlock(&kvm->slots_arch_lock);
+			return r;
+		}
+	}
+
 	r = kvm_prepare_memory_region(kvm, old, new, change);
 	if (r) {
 		/*
@@ -1850,6 +1869,10 @@ static int kvm_set_memslot(struct kvm *kvm,
 		} else {
 			mutex_unlock(&kvm->slots_arch_lock);
 		}
+
+		if (new->flags & KVM_MEM_PRIVATE && change == KVM_MR_CREATE)
+			kvm_memfd_unregister(new);
+
 		return r;
 	}
 
@@ -1917,7 +1940,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	int as_id, id;
 	int r;
 
-	r = check_memory_region_flags(mem);
+	r = check_memory_region_flags(kvm, mem);
 	if (r)
 		return r;
 
@@ -1974,6 +1997,10 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
 			return -EINVAL;
 	} else { /* Modify an existing slot. */
+		/* Private memslots are immutable, they can only be deleted. */
+		if (mem->flags & KVM_MEM_PRIVATE)
+			return -EINVAL;
+
 		if ((mem->userspace_addr != old->userspace_addr) ||
 		    (npages != old->npages) ||
 		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
@@ -2002,6 +2029,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	new->npages = npages;
 	new->flags = mem->flags;
 	new->userspace_addr = mem->userspace_addr;
+	new->fd = mem->fd;
+	new->file = NULL;
+	new->ofs = mem->ofs;
 
 	r = kvm_set_memslot(kvm, old, new, change);
 	if (r)
-- 
2.17.1



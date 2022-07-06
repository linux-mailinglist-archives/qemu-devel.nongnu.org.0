Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF585683AE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:37:20 +0200 (CEST)
Received: from localhost ([::1]:53126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91TD-0001Ut-5n
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o90MD-00070l-Mj
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:26:03 -0400
Received: from mga18.intel.com ([134.134.136.126]:1750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o90MB-0000ol-HX
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657095959; x=1688631959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E5etUVyGAjbLnFNE6o2Ik8Z3TK8BR2wbeWe9rjh6p1w=;
 b=hzYAmxZ/+9yfwkxtw0g7OsXy9u++Kvc99Q4dOXQLIMYZ5lrAGiOIiTUw
 rHLVxioVQRO/wlS+/M5IWbzjDgGEXloHIdw4HElUp114ssW6JGzM0EBdj
 1DPkLViwdb7JqM4V0T5TVr04Vm54A7ioS6aVr1g27Gyl6nvsBd0hdh+4R
 TheXvUFFsTDfBJGFNYYw0fMu6ITjGBtfY8k69V+ZCK5fIG8jCm6AkPEx0
 GP0+6Du4m9oOyvIZtvx+rPEfZFLX4UCrtpb4XrGrwXknNmFdCgtXXs950
 gBByXIz7cU6w7HUMChBPZ2fJQtHP9A8DV5NCpeQgmcbz/9xAAf3yiFOn1 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="266710049"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="266710049"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 01:25:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="567968229"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga006.jf.intel.com with ESMTP; 06 Jul 2022 01:25:40 -0700
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org
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
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 11/14] KVM: Register/unregister the guest private memory
 regions
Date: Wed,  6 Jul 2022 16:20:13 +0800
Message-Id: <20220706082016.2603916-12-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If CONFIG_HAVE_KVM_PRIVATE_MEM=y, userspace can register/unregister the
guest private memory regions through KVM_MEMORY_ENCRYPT_{UN,}REG_REGION
ioctls. The patch reuses existing SEV ioctl but differs that the
address in the region for private memory is gpa while SEV case it's hva.

The private memory region is stored as xarray in KVM for memory
efficiency in normal usages and zapping existing memory mappings is also
a side effect of these two ioctls.

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 Documentation/virt/kvm/api.rst  | 17 +++++++---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/Kconfig            |  1 +
 arch/x86/kvm/mmu.h              |  2 --
 include/linux/kvm_host.h        |  8 +++++
 virt/kvm/kvm_main.c             | 57 +++++++++++++++++++++++++++++++++
 6 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 5ecfc7fbe0ee..dfb4caecab73 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -4715,10 +4715,19 @@ Documentation/virt/kvm/amd-memory-encryption.rst.
 This ioctl can be used to register a guest memory region which may
 contain encrypted data (e.g. guest RAM, SMRAM etc).
 
-It is used in the SEV-enabled guest. When encryption is enabled, a guest
-memory region may contain encrypted data. The SEV memory encryption
-engine uses a tweak such that two identical plaintext pages, each at
-different locations will have differing ciphertexts. So swapping or
+Currently this ioctl supports registering memory regions for two usages:
+private memory and SEV-encrypted memory.
+
+When private memory is enabled, this ioctl is used to register guest private
+memory region and the addr/size of kvm_enc_region represents guest physical
+address (GPA). In this usage, this ioctl zaps the existing guest memory
+mappings in KVM that fallen into the region.
+
+When SEV-encrypted memory is enabled, this ioctl is used to register guest
+memory region which may contain encrypted data for a SEV-enabled guest. The
+addr/size of kvm_enc_region represents userspace address (HVA). The SEV
+memory encryption engine uses a tweak such that two identical plaintext pages,
+each at different locations will have differing ciphertexts. So swapping or
 moving ciphertext of those pages will not result in plaintext being
 swapped. So relocating (or migrating) physical backing pages for the SEV
 guest will require some additional steps.
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index dae190e19fce..92120e3a224e 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -37,6 +37,7 @@
 #include <asm/hyperv-tlfs.h>
 
 #define __KVM_HAVE_ARCH_VCPU_DEBUGFS
+#define __KVM_HAVE_ZAP_GFN_RANGE
 
 #define KVM_MAX_VCPUS 1024
 
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 1f160801e2a7..05861b9656a4 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -50,6 +50,7 @@ config KVM
 	select HAVE_KVM_PM_NOTIFIER if PM
 	select HAVE_KVM_PRIVATE_MEM if X86_64
 	select MEMFILE_NOTIFIER if HAVE_KVM_PRIVATE_MEM
+	select XARRAY_MULTI if HAVE_KVM_PRIVATE_MEM
 	help
 	  Support hosting fully virtualized guest machines using hardware
 	  virtualization extensions.  You will need a fairly recent
diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index a99acec925eb..428cd2e88cbd 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -209,8 +209,6 @@ static inline u8 permission_fault(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
 	return -(u32)fault & errcode;
 }
 
-void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end);
-
 int kvm_arch_write_log_dirty(struct kvm_vcpu *vcpu);
 
 int kvm_mmu_post_init_vm(struct kvm *kvm);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 1b203c8aa696..da33f8828456 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -260,6 +260,10 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 #endif
 
+#ifdef __KVM_HAVE_ZAP_GFN_RANGE
+void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end);
+#endif
+
 enum {
 	OUTSIDE_GUEST_MODE,
 	IN_GUEST_MODE,
@@ -795,6 +799,9 @@ struct kvm {
 	struct notifier_block pm_notifier;
 #endif
 	char stats_id[KVM_STATS_NAME_SIZE];
+#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
+	struct xarray mem_attr_array;
+#endif
 };
 
 #define kvm_err(fmt, ...) \
@@ -1459,6 +1466,7 @@ bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu);
 int kvm_arch_post_init_vm(struct kvm *kvm);
 void kvm_arch_pre_destroy_vm(struct kvm *kvm);
 int kvm_arch_create_vm_debugfs(struct kvm *kvm);
+bool kvm_arch_private_mem_supported(struct kvm *kvm);
 
 #ifndef __KVM_HAVE_ARCH_VM_ALLOC
 /*
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 230c8ff9659c..bb714c2a4b06 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -914,6 +914,35 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
 
 #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
 
+#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
+#define KVM_MEM_ATTR_PRIVATE	0x0001
+static int kvm_vm_ioctl_set_encrypted_region(struct kvm *kvm, unsigned int ioctl,
+					     struct kvm_enc_region *region)
+{
+	unsigned long start, end;
+	void *entry;
+	int r;
+
+	if (region->size == 0 || region->addr + region->size < region->addr)
+		return -EINVAL;
+	if (region->addr & (PAGE_SIZE - 1) || region->size & (PAGE_SIZE - 1))
+		return -EINVAL;
+
+	start = region->addr >> PAGE_SHIFT;
+	end = (region->addr + region->size - 1) >> PAGE_SHIFT;
+
+	entry = ioctl == KVM_MEMORY_ENCRYPT_REG_REGION ?
+				xa_mk_value(KVM_MEM_ATTR_PRIVATE) : NULL;
+
+	r = xa_err(xa_store_range(&kvm->mem_attr_array, start, end,
+					entry, GFP_KERNEL_ACCOUNT));
+
+	kvm_zap_gfn_range(kvm, start, end + 1);
+
+	return r;
+}
+#endif /* CONFIG_HAVE_KVM_PRIVATE_MEM */
+
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
 static int kvm_pm_notifier_call(struct notifier_block *bl,
 				unsigned long state,
@@ -1138,6 +1167,9 @@ static struct kvm *kvm_create_vm(unsigned long type)
 	spin_lock_init(&kvm->mn_invalidate_lock);
 	rcuwait_init(&kvm->mn_memslots_update_rcuwait);
 	xa_init(&kvm->vcpu_array);
+#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
+	xa_init(&kvm->mem_attr_array);
+#endif
 
 	INIT_LIST_HEAD(&kvm->gpc_list);
 	spin_lock_init(&kvm->gpc_lock);
@@ -1305,6 +1337,9 @@ static void kvm_destroy_vm(struct kvm *kvm)
 		kvm_free_memslots(kvm, &kvm->__memslots[i][0]);
 		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
 	}
+#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
+	xa_destroy(&kvm->mem_attr_array);
+#endif
 	cleanup_srcu_struct(&kvm->irq_srcu);
 	cleanup_srcu_struct(&kvm->srcu);
 	kvm_arch_free_vm(kvm);
@@ -1508,6 +1543,11 @@ static void kvm_replace_memslot(struct kvm *kvm,
 	}
 }
 
+bool __weak kvm_arch_private_mem_supported(struct kvm *kvm)
+{
+	return false;
+}
+
 static int check_memory_region_flags(const struct kvm_user_mem_region *mem)
 {
 	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
@@ -4689,6 +4729,22 @@ static long kvm_vm_ioctl(struct file *filp,
 		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
 		break;
 	}
+#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
+	case KVM_MEMORY_ENCRYPT_REG_REGION:
+	case KVM_MEMORY_ENCRYPT_UNREG_REGION: {
+		struct kvm_enc_region region;
+
+		if (!kvm_arch_private_mem_supported(kvm))
+			goto arch_vm_ioctl;
+
+		r = -EFAULT;
+		if (copy_from_user(&region, argp, sizeof(region)))
+			goto out;
+
+		r = kvm_vm_ioctl_set_encrypted_region(kvm, ioctl, &region);
+		break;
+	}
+#endif
 	case KVM_GET_DIRTY_LOG: {
 		struct kvm_dirty_log log;
 
@@ -4842,6 +4898,7 @@ static long kvm_vm_ioctl(struct file *filp,
 		r = kvm_vm_ioctl_get_stats_fd(kvm);
 		break;
 	default:
+arch_vm_ioctl:
 		r = kvm_arch_vm_ioctl(filp, ioctl, arg);
 	}
 out:
-- 
2.25.1



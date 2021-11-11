Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C171344D833
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:24:44 +0100 (CET)
Received: from localhost ([::1]:35294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlB0N-0006vK-TS
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:24:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlArk-0000Ie-RK
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:15:49 -0500
Received: from mga01.intel.com ([192.55.52.88]:20973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlArg-0006Vo-WA
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:15:47 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="256621685"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="256621685"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 06:15:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="492555758"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 11 Nov 2021 06:15:32 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC PATCH 5/6] kvm: x86: add KVM_EXIT_MEMORY_ERROR exit
Date: Thu, 11 Nov 2021 22:13:44 +0800
Message-Id: <20211111141352.26311-6-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
References: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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

Currently support to exit to userspace for private/shared memory
conversion.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 arch/x86/kvm/mmu/mmu.c   | 20 ++++++++++++++++++++
 include/uapi/linux/kvm.h | 15 +++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index af5ecf4ef62a..780868888aa8 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3950,6 +3950,17 @@ static bool try_async_pf(struct kvm_vcpu *vcpu, bool prefault, gfn_t gfn,
 
 	slot = __kvm_vcpu_gfn_to_memslot(vcpu, gfn, private);
 
+	/*
+	 * Exit to userspace to map the requested private/shared memory region
+	 * if there is no memslot and (a) the access is private or (b) there is
+	 * an existing private memslot.  Emulated MMIO must be accessed through
+	 * shared GPAs, thus a memslot miss on a private GPA is always handled
+	 * as an implicit conversion "request".
+	 */
+	if (!slot &&
+	    (private || __kvm_vcpu_gfn_to_memslot(vcpu, gfn, true)))
+		goto out_convert;
+
 	/* Don't expose aliases for no slot GFNs or private memslots */
 	if ((cr2_or_gpa & vcpu_gpa_stolen_mask(vcpu)) &&
 	    !kvm_is_visible_memslot(slot)) {
@@ -3994,6 +4005,15 @@ static bool try_async_pf(struct kvm_vcpu *vcpu, bool prefault, gfn_t gfn,
 	*pfn = __gfn_to_pfn_memslot(slot, gfn, false, NULL,
 				    write, writable, hva);
 	return false;
+
+out_convert:
+	vcpu->run->exit_reason = KVM_EXIT_MEMORY_ERROR;
+	vcpu->run->mem.type = private ? KVM_EXIT_MEM_MAP_PRIVATE
+				      : KVM_EXIT_MEM_MAP_SHARE;
+	vcpu->run->mem.u.map.gpa = cr2_or_gpa;
+	vcpu->run->mem.u.map.size = PAGE_SIZE;
+	return true;
+
 }
 
 static int direct_page_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 8d20caae9180..470c472a9451 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -233,6 +233,18 @@ struct kvm_xen_exit {
 	} u;
 };
 
+struct kvm_memory_exit {
+#define KVM_EXIT_MEM_MAP_SHARE          1
+#define KVM_EXIT_MEM_MAP_PRIVATE        2
+	__u32 type;
+	union {
+		struct {
+			__u64 gpa;
+			__u64 size;
+		} map;
+	} u;
+};
+
 #define KVM_S390_GET_SKEYS_NONE   1
 #define KVM_S390_SKEYS_MAX        1048576
 
@@ -272,6 +284,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_X86_BUS_LOCK     33
 #define KVM_EXIT_XEN              34
 #define KVM_EXIT_TDVMCALL         35
+#define KVM_EXIT_MEMORY_ERROR	  36
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -455,6 +468,8 @@ struct kvm_run {
 			__u64 subfunc;
 			__u64 param[4];
 		} tdvmcall;
+		/* KVM_EXIT_MEMORY_ERROR */
+		struct kvm_memory_exit mem;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
-- 
2.17.1



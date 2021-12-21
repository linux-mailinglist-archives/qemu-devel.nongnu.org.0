Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EC147C298
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 16:17:15 +0100 (CET)
Received: from localhost ([::1]:46360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzgt8-0003W2-Oz
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 10:17:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzgos-0007N9-RV
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:12:50 -0500
Received: from mga07.intel.com ([134.134.136.100]:46497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzgom-0008AI-06
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640099563; x=1671635563;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=6+jEwSaQbRLyJYQpPbesRQbgqxxUkuctrfu8t5OfMl8=;
 b=ghGjEg+3tSJO2voNKVglY4Q4cU5M9+P7jp5khhJw9ESw0r+afDT97fl8
 NuW5XJSKPdfM8CBfoXEnIk9rxj/2/TsaO/riNYNmWqjJm76JP/lo21B1k
 JWqlCaW0S5uW+dLfd6QzJM0D8wX4E7ZDyRZ/NfAxSZbnoc8ys1Q9BQu6d
 T4w8rmqhgZ1cjkt59qqDi4pJaqOjWfpnCZBey0/axg47twMQgzMOt9Y5h
 8IowG6ukFjXnFOvbzYr/U5vivRkqsMjuFDz4Ma0coeJim1RLu9T8ngHD7
 uMGmQE9vrFPKkJujkGr+z/zZXSSXZIq8tcMt6afDxPlbNs9TxhJyNlGLt w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="303779737"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="303779737"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 07:12:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="684688364"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga005.jf.intel.com with ESMTP; 21 Dec 2021 07:12:33 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 04/15] KVM: Extend the memslot to support fd-based private
 memory
Date: Tue, 21 Dec 2021 23:11:14 +0800
Message-Id: <20211221151125.19446-5-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
References: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga07.intel.com
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

Extend the memslot definition to provide fd-based private memory support
by adding two new fields(fd/ofs). The memslot then can maintain memory
for both shared and private pages in a single memslot. Shared pages are
provided in the existing way by using userspace_addr(hva) field and
get_user_pages() while private pages are provided through the new
fields(fd/ofs). Since there is no 'hva' concept anymore for private
memory we cannot call get_user_pages() to get a pfn, instead we rely on
the newly introduced MEMFD_OPS callbacks to do the same job.

This new extension is indicated by a new flag KVM_MEM_PRIVATE.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/kvm_host.h |  9 +++++++++
 include/uapi/linux/kvm.h | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 865a677baf52..96e46b288ecd 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -433,8 +433,17 @@ struct kvm_memory_slot {
 	u32 flags;
 	short id;
 	u16 as_id;
+	struct file *file;
+	u64 file_ofs;
 };
 
+static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
+{
+	if (slot && (slot->flags & KVM_MEM_PRIVATE))
+		return true;
+	return false;
+}
+
 static inline bool kvm_slot_dirty_track_enabled(struct kvm_memory_slot *slot)
 {
 	return slot->flags & KVM_MEM_LOG_DIRTY_PAGES;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index e3706e574bd2..a2c1fb8c9843 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -103,6 +103,17 @@ struct kvm_userspace_memory_region {
 	__u64 userspace_addr; /* start of the userspace allocated memory */
 };
 
+struct kvm_userspace_memory_region_ext {
+	__u32 slot;
+	__u32 flags;
+	__u64 guest_phys_addr;
+	__u64 memory_size; /* bytes */
+	__u64 userspace_addr; /* hva */
+	__u64 ofs; /* offset into fd */
+	__u32 fd;
+	__u32 padding[5];
+};
+
 /*
  * The bit 0 ~ bit 15 of kvm_memory_region::flags are visible for userspace,
  * other bits are reserved for kvm internal use which are defined in
@@ -110,6 +121,7 @@ struct kvm_userspace_memory_region {
  */
 #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
 #define KVM_MEM_READONLY	(1UL << 1)
+#define KVM_MEM_PRIVATE		(1UL << 2)
 
 /* for KVM_IRQ_LINE */
 struct kvm_irq_level {
-- 
2.17.1



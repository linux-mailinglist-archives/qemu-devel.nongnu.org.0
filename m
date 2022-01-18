Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E74492887
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:38:00 +0100 (CET)
Received: from localhost ([::1]:45464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pcW-0005Y3-1C
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:38:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oRr-0001GO-69
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:22:57 -0500
Received: from mga17.intel.com ([192.55.52.151]:19329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oRa-0003GN-I2
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:22:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642512158; x=1674048158;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=7+c1sXkb+YZ1mlaZZMzVLTAk9/05+2xQQ6wigpDTqW0=;
 b=kHr0Op9IJN/vN2WhDhYuvh6DwaEgqNghUOg7NK7h6qDx48pJOlyPkPqP
 gj1IdB2rsF/F9amRf753mC7Cv5xz0iFhtosbRgjgORK1l+xfSbo0gxUzG
 2iZl2csvXJbNtIo4EiFQ4EzovVmkoi7wS6yNxxulS5cb0JY1pZtuGkMJi
 pHR/PriCFOfU7K/vLlq08/hcy2Yry3kLg5s4nokFd71fuqI8LJOrw4n3k
 Gqen0S+k85NRfalGpAQb/CcO7cf11aY9tBAOmCGiV3gijGip/ieswU/+A
 rovAmiW6IKuWwiuFBMMEM6j7G0Dj1tIHWdJm1xIecn0ZLmXk1rn9glbxH w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="225491039"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="225491039"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 05:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="531791785"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 05:22:27 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v4 05/12] KVM: Extend the memslot to support fd-based private
 memory
Date: Tue, 18 Jan 2022 21:21:14 +0800
Message-Id: <20220118132121.31388-6-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

Extend the memslot definition to provide fd-based private memory support
by adding two new fields (private_fd/private_offset). The memslot then
can maintain memory for both shared pages and private pages in a single
memslot. Shared pages are provided by existing userspace_addr(hva) field
and private pages are provided through the new private_fd/private_offset
fields.

Since there is no 'hva' concept anymore for private memory so we cannot
rely on get_user_pages() to get a pfn, instead we use the newly added
memfile_notifier to complete the same job.

This new extension is indicated by a new flag KVM_MEM_PRIVATE.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/linux/kvm_host.h | 7 +++++++
 include/uapi/linux/kvm.h | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f079820f52b5..5011ac35bc50 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -458,8 +458,15 @@ struct kvm_memory_slot {
 	u32 flags;
 	short id;
 	u16 as_id;
+	struct file *private_file;
+	loff_t private_offset;
 };
 
+static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
+{
+	return slot && (slot->flags & KVM_MEM_PRIVATE);
+}
+
 static inline bool kvm_slot_dirty_track_enabled(const struct kvm_memory_slot *slot)
 {
 	return slot->flags & KVM_MEM_LOG_DIRTY_PAGES;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index fbfd70d965c6..5d6dceb1b93e 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -103,6 +103,13 @@ struct kvm_userspace_memory_region {
 	__u64 userspace_addr; /* start of the userspace allocated memory */
 };
 
+struct kvm_userspace_memory_region_ext {
+	struct kvm_userspace_memory_region region;
+	__u64 private_offset;
+	__u32 private_fd;
+	__u32 padding[5];
+};
+
 /*
  * The bit 0 ~ bit 15 of kvm_memory_region::flags are visible for userspace,
  * other bits are reserved for kvm internal use which are defined in
@@ -110,6 +117,7 @@ struct kvm_userspace_memory_region {
  */
 #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
 #define KVM_MEM_READONLY	(1UL << 1)
+#define KVM_MEM_PRIVATE		(1UL << 2)
 
 /* for KVM_IRQ_LINE */
 struct kvm_irq_level {
-- 
2.17.1



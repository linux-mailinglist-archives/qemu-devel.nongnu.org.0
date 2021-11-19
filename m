Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F3B45702F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:00:54 +0100 (CET)
Received: from localhost ([::1]:42322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4Re-0000Js-By
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:00:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mo4HZ-00086I-H8
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:50:25 -0500
Received: from mga18.intel.com ([134.134.136.126]:22057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mo4HW-0000kB-SX
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:50:24 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="221294106"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="221294106"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 05:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="507905274"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 19 Nov 2021 05:50:13 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC v2 PATCH 13/13] KVM: Enable memfd based page
 invalidation/fallocate
Date: Fri, 19 Nov 2021 21:47:39 +0800
Message-Id: <20211119134739.20218-14-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

Since the memory backing store does not get notified when VM is
destroyed so need check if VM is still live in these callbacks.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 virt/kvm/memfd.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/virt/kvm/memfd.c b/virt/kvm/memfd.c
index bd930dcb455f..bcfdc685ce22 100644
--- a/virt/kvm/memfd.c
+++ b/virt/kvm/memfd.c
@@ -12,16 +12,38 @@
 #include <linux/memfd.h>
 const static struct guest_mem_ops *memfd_ops;
 
+static bool vm_is_dead(struct kvm *vm)
+{
+	struct kvm *kvm;
+
+	list_for_each_entry(kvm, &vm_list, vm_list) {
+		if (kvm == vm)
+			return false;
+	}
+
+	return true;
+}
+
 static void memfd_invalidate_page_range(struct inode *inode, void *owner,
 					pgoff_t start, pgoff_t end)
 {
 	//!!!We can get here after the owner no longer exists
+	if (vm_is_dead(owner))
+		return;
+
+	kvm_memfd_invalidate_range(owner, inode, start >> PAGE_SHIFT,
+						 end >> PAGE_SHIFT);
 }
 
 static void memfd_fallocate(struct inode *inode, void *owner,
 			    pgoff_t start, pgoff_t end)
 {
 	//!!!We can get here after the owner no longer exists
+	if (vm_is_dead(owner))
+		return;
+
+	kvm_memfd_fallocate_range(owner, inode, start >> PAGE_SHIFT,
+						end >> PAGE_SHIFT);
 }
 
 static const struct guest_ops memfd_notifier = {
-- 
2.17.1



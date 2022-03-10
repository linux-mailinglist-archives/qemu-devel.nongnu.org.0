Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F9F4D4954
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:16:32 +0100 (CET)
Received: from localhost ([::1]:39204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJah-0006qd-5z
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:16:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJUy-0006CS-Qd
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:10:37 -0500
Received: from mga11.intel.com ([192.55.52.93]:24075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJUw-0004z9-EQ
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646921434; x=1678457434;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Z4vQdKuwJGnUEOHT5u0YKIBAyF/sX/jaF7InK/l4l/o=;
 b=ORB6pm1Tg5a2uHP7B9VIRJOuf2Oxa3uuMi7eYg2rw4VM0v3lLtf2WObn
 GWehlNF5LskzaY9jlpB5czE3cpxo87ZBS53S9jg110OiIT4LJweJX+jFq
 OtSemtQr0B2p7RiTh4iNQnl5mPmk7PySEYhb9KqNF0t420lidSoNtdGNo
 8/yxH1uZSQGFvbCpiWtIEdnShRQHkTwImWz6kM04y9zmPu7m9i3J9yxx4
 F3TfldieVFny1B0uXY10c8wZoYoDWswH/3rFnk2objaPwPes2WOfwriMc
 dvWVmY+LZ/TbpFRmBw/H3g/yyGg1q2gr3RozRn7Jrn/xcIZgSeHGgGoTM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="252823508"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="252823508"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:10:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="554655053"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 10 Mar 2022 06:10:24 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v5 07/13] KVM: Add KVM_EXIT_MEMORY_ERROR exit
Date: Thu, 10 Mar 2022 22:09:05 +0800
Message-Id: <20220310140911.50924-8-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

This new KVM exit allows userspace to handle memory-related errors. It
indicates an error happens in KVM at guest memory range [gpa, gpa+size).
The flags includes additional information for userspace to handle the
error. Currently bit 0 is defined as 'private memory' where '1'
indicates error happens due to private memory access and '0' indicates
error happens due to shared memory access.

After private memory is enabled, this new exit will be used for KVM to
exit to userspace for shared memory <-> private memory conversion in
memory encryption usage.

In such usage, typically there are two kind of memory conversions:
  - explicit conversion: happens when guest explicitly calls into KVM to
    map a range (as private or shared), KVM then exits to userspace to
    do the map/unmap operations.
  - implicit conversion: happens in KVM page fault handler.
    * if the fault is due to a private memory access then causes a
      userspace exit for a shared->private conversion request when the
      page has not been allocated in the private memory backend.
    * If the fault is due to a shared memory access then causes a
      userspace exit for a private->shared conversion request when the
      page has already been allocated in the private memory backend.

Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 Documentation/virt/kvm/api.rst | 22 ++++++++++++++++++++++
 include/uapi/linux/kvm.h       |  9 +++++++++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index f76ac598606c..bad550c2212b 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6216,6 +6216,28 @@ array field represents return values. The userspace should update the return
 values of SBI call before resuming the VCPU. For more details on RISC-V SBI
 spec refer, https://github.com/riscv/riscv-sbi-doc.
 
+::
+
+		/* KVM_EXIT_MEMORY_ERROR */
+		struct {
+  #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1 << 0)
+			__u32 flags;
+			__u32 padding;
+			__u64 gpa;
+			__u64 size;
+		} memory;
+If exit reason is KVM_EXIT_MEMORY_ERROR then it indicates that the VCPU has
+encountered a memory error which is not handled by KVM kernel module and
+userspace may choose to handle it. The 'flags' field indicates the memory
+properties of the exit.
+
+ - KVM_MEMORY_EXIT_FLAG_PRIVATE - indicates the memory error is caused by
+   private memory access when the bit is set otherwise the memory error is
+   caused by shared memory access when the bit is clear.
+
+'gpa' and 'size' indicate the memory range the error occurs at. The userspace
+may handle the error and return to KVM to retry the previous memory access.
+
 ::
 
 		/* Fix the size of the union. */
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index a523d834efc8..9ad0c8aa0263 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -278,6 +278,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_X86_BUS_LOCK     33
 #define KVM_EXIT_XEN              34
 #define KVM_EXIT_RISCV_SBI        35
+#define KVM_EXIT_MEMORY_ERROR     36
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -495,6 +496,14 @@ struct kvm_run {
 			unsigned long args[6];
 			unsigned long ret[2];
 		} riscv_sbi;
+		/* KVM_EXIT_MEMORY_ERROR */
+		struct {
+#define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1 << 0)
+			__u32 flags;
+			__u32 padding;
+			__u64 gpa;
+			__u64 size;
+		} memory;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
-- 
2.17.1



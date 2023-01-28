Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E0667F884
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 15:09:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLlsi-0002jb-GF; Sat, 28 Jan 2023 09:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pLlsg-0002jO-OJ
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 09:08:34 -0500
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pLlsd-0000o0-L8
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 09:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674914911; x=1706450911;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=jGLKHUiTup0wR3d32S/+noCZxMpThHkENbyPsFWyI2U=;
 b=L2yZVK4bqbSxucZ4DAkMohGSCQrKjJ4AiEnbAjv8ool8aMHlXc0MVLkf
 3KMHdOO2T+wsH2C2jLD5+k7jqx9UXct0vxfip23iZ28cRc1sesLgai/qo
 wS6BNA40mCqqZJI7dg3f8O09lvODTPORfy+ej+j0TeRR67Vz2TB1mdREF
 pQ/pVXdwvDcxHQojzF3ff9KEdpqb8utRkgYvbaTTY1ksFQIATNa3hNS9v
 K11K0872wUqCN1wz+PoOQIrapvLGKa9IK0EHfwu/6EGqHml+fMBNugtf1
 xYy1niTeiZHyJ2hLyGlrup6FsrcjvAfnssU/FVLm0OoxVfCOsq2RGn8t6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="328579163"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="328579163"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 06:08:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="663602794"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="663602794"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.105])
 by orsmga002.jf.intel.com with ESMTP; 28 Jan 2023 06:08:15 -0800
Date: Sat, 28 Jan 2023 22:00:30 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 9/9] KVM: Enable and expose KVM_MEM_PRIVATE
Message-ID: <20230128140030.GB700688@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-10-chao.p.peng@linux.intel.com>
 <Y8HwvTik/2avrCOU@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8HwvTik/2avrCOU@google.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Jan 14, 2023 at 12:01:01AM +0000, Sean Christopherson wrote:
> On Fri, Dec 02, 2022, Chao Peng wrote:
... 
> Strongly prefer to use similar logic to existing code that detects wraps:
> 
> 		mem->restricted_offset + mem->memory_size < mem->restricted_offset
> 
> This is also where I'd like to add the "gfn is aligned to offset" check, though
> my brain is too fried to figure that out right now.

Used count_trailing_zeros() for this TODO, unsure we have other better
approach.

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index afc8c26fa652..fd34c5f7cd2f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -56,6 +56,7 @@
 #include <asm/processor.h>
 #include <asm/ioctl.h>
 #include <linux/uaccess.h>
+#include <linux/count_zeros.h>
 
 #include "coalesced_mmio.h"
 #include "async_pf.h"
@@ -2087,6 +2088,19 @@ static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
 	return false;
 }
 
+/*
+ * Return true when ALIGNMENT(offset) >= ALIGNMENT(gpa).
+ */
+static bool kvm_check_rmem_offset_alignment(u64 offset, u64 gpa)
+{
+	if (!offset)
+		return true;
+	if (!gpa)
+		return false;
+
+	return !!(count_trailing_zeros(offset) >= count_trailing_zeros(gpa));
+}
+
 /*
  * Allocate some memory and give it an address in the guest physical address
  * space.
@@ -2128,7 +2142,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	if (mem->flags & KVM_MEM_PRIVATE &&
 	    (mem->restrictedmem_offset & (PAGE_SIZE - 1) ||
 	     mem->restrictedmem_offset + mem->memory_size < mem->restrictedmem_offset ||
-	     0 /* TODO: require gfn be aligned with restricted offset */))
+	     !kvm_check_rmem_offset_alignment(mem->restrictedmem_offset,
+					      mem->guest_phys_addr)))
 		return -EINVAL;
 	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_MEM_SLOTS_NUM)
 		return -EINVAL;



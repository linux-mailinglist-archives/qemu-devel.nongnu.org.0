Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031EB492858
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:27:31 +0100 (CET)
Received: from localhost ([::1]:54942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pSL-0000Ds-PN
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:27:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oR4-0000Xe-2I
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:22:06 -0500
Received: from mga12.intel.com ([192.55.52.136]:1472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n9oR0-00038x-4g
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642512122; x=1674048122;
 h=from:to:cc:subject:date:message-id;
 bh=PpPDuKlK4KNFGBWBo+UuY5gc5zGtdKCEIZbTqvtOkeE=;
 b=OZthqXIs9CPbGK0M98jHUereczn/InpjwbJV3TXaV7qFKAwE47mpOvBp
 RV95mgnI3JJWWqO1DJFm2wHHt7WZQplFztNUO8oPbp61M1Yso+q75oYpe
 8KH8pFnK7onQAKhuqOlVe+cxcDMLmCK2Ai3mR5JmtdvuPpkwYJd2KtJLv
 klrA872XTyZvApllPR5Zid8DyC70hXSE6sNnPdrDJCY0P91F3HGND6Bzh
 Q0o6ClnLUv62teBfLMBjzLbZovlymssXnFPkGICdgv/fMn0gsykMNm8hQ
 01Qg4c9Jon7R22lrEFJaoSNzo1DWHsyYl8GDXKogfWh4fg8ECYf5Df7tw w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="224790857"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="224790857"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 05:21:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="531791597"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 05:21:51 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v4 00/12] KVM: mm: fd-based approach for supporting KVM guest
 private memory 
Date: Tue, 18 Jan 2022 21:21:09 +0800
Message-Id: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This is the v4 of this series which try to implement the fd-based KVM
guest private memory. The patches are based on latest kvm/queue branch
commit:

  fea31d169094 KVM: x86/pmu: Fix available_event_types check for
               REF_CPU_CYCLES event

Introduction
------------
In general this patch series introduce fd-based memslot which provides
guest memory through memory file descriptor fd[offset,size] instead of
hva/size. The fd can be created from a supported memory filesystem
like tmpfs/hugetlbfs etc. which we refer as memory backing store. KVM
and the the memory backing store exchange callbacks when such memslot
gets created. At runtime KVM will call into callbacks provided by the
backing store to get the pfn with the fd+offset. Memory backing store
will also call into KVM callbacks when userspace fallocate/punch hole
on the fd to notify KVM to map/unmap secondary MMU page tables.

Comparing to existing hva-based memslot, this new type of memslot allows
guest memory unmapped from host userspace like QEMU and even the kernel
itself, therefore reduce attack surface and prevent bugs.

Based on this fd-based memslot, we can build guest private memory that
is going to be used in confidential computing environments such as Intel
TDX and AMD SEV. When supported, the memory backing store can provide
more enforcement on the fd and KVM can use a single memslot to hold both
the private and shared part of the guest memory. 

mm extension
---------------------
Introduces new F_SEAL_INACCESSIBLE for shmem and new MFD_INACCESSIBLE
flag for memfd_create(), the file created with these flags cannot read(),
write() or mmap() etc via normal MMU operations. The file content can
only be used with the newly introduced memfile_notifier extension.

The memfile_notifier extension provides two sets of callbacks for KVM to
interact with the memory backing store:
  - memfile_notifier_ops: callbacks for memory backing store to notify
    KVM when memory gets allocated/invalidated.
  - memfile_pfn_ops: callbacks for KVM to call into memory backing store
    to request memory pages for guest private memory.

memslot extension
-----------------
Add the private fd and the fd offset to existing 'shared' memslot so that
both private/shared guest memory can live in one single memslot. A page in
the memslot is either private or shared. A page is private only when it's
already allocated in the backing store fd, all the other cases it's treated
as shared, this includes those already mapped as shared as well as those
having not been mapped. This means the memory backing store is the place
which tells the truth of which page is private.

Private memory map/unmap and conversion
---------------------------------------
Userspace's map/unmap operations are done by fallocate() ioctl on the
backing store fd.
  - map: default fallocate() with mode=0.
  - unmap: fallocate() with FALLOC_FL_PUNCH_HOLE.
The map/unmap will trigger above memfile_notifier_ops to let KVM map/unmap
secondary MMU page tables.

Test
----
To test the new functionalities of this patch TDX patchset is needed.
Since TDX patchset has not been merged so I did two kinds of test:

-  Regresion test on kvm/queue (this patch)
   Most new code are not covered. I only tested building and booting.

-  New Funational test on latest TDX code
   The patch is rebased to latest TDX code and tested the new
   funcationalities.

For TDX test please see below repos:
Linux: https://github.com/chao-p/linux/tree/privmem-v4.3
QEMU: https://github.com/chao-p/qemu/tree/privmem-v4

And an example QEMU command line:
-object tdx-guest,id=tdx \
-object memory-backend-memfd-private,id=ram1,size=2G \
-machine q35,kvm-type=tdx,pic=no,kernel_irqchip=split,memory-encryption=tdx,memory-backend=ram1

Changelog
----------
v4:
  - Decoupled the callbacks between KVM/mm from memfd and use new
    name 'memfile_notifier'.
  - Supported register multiple memslots to the same backing store.
  - Added per-memslot pfn_ops instead of per-system.
  - Reworked the invalidation part.
  - Improved new KVM uAPIs (private memslot extension and memory
    error) per Sean's suggestions.
  - Addressed many other minor fixes for comments from v3.
v3:
  - Added locking protection when calling
    invalidate_page_range/fallocate callbacks.
  - Changed memslot structure to keep use useraddr for shared memory.
  - Re-organized F_SEAL_INACCESSIBLE and MEMFD_OPS.
  - Added MFD_INACCESSIBLE flag to force F_SEAL_INACCESSIBLE.
  - Commit message improvement.
  - Many small fixes for comments from the last version.

Links of previous discussions
-----------------------------
[1] Original design proposal:
https://lkml.kernel.org/kvm/20210824005248.200037-1-seanjc@google.com/
[2] Updated proposal and RFC patch v1:
https://lkml.kernel.org/linux-fsdevel/20211111141352.26311-1-chao.p.peng@linux.intel.com/
[3] Patch v3: https://lkml.org/lkml/2021/12/23/283

Chao Peng (11):
  mm/memfd: Introduce MFD_INACCESSIBLE flag
  mm: Introduce memfile_notifier
  mm/shmem: Support memfile_notifier
  KVM: Extend the memslot to support fd-based private memory
  KVM: Use kvm_userspace_memory_region_ext
  KVM: Add KVM_EXIT_MEMORY_ERROR exit
  KVM: Use memfile_pfn_ops to obtain pfn for private pages
  KVM: Handle page fault for private memory
  KVM: Register private memslot to memory backing store
  KVM: Zap existing KVM mappings when pages changed in the private fd
  KVM: Expose KVM_MEM_PRIVATE

Kirill A. Shutemov (1):
  mm/shmem: Introduce F_SEAL_INACCESSIBLE

 arch/x86/kvm/Kconfig             |   1 +
 arch/x86/kvm/mmu/mmu.c           |  73 +++++++++++-
 arch/x86/kvm/mmu/paging_tmpl.h   |  11 +-
 arch/x86/kvm/x86.c               |  12 +-
 include/linux/kvm_host.h         |  49 +++++++-
 include/linux/memfile_notifier.h |  53 +++++++++
 include/linux/shmem_fs.h         |   4 +
 include/uapi/linux/fcntl.h       |   1 +
 include/uapi/linux/kvm.h         |  17 +++
 include/uapi/linux/memfd.h       |   1 +
 mm/Kconfig                       |   4 +
 mm/Makefile                      |   1 +
 mm/memfd.c                       |  20 +++-
 mm/memfile_notifier.c            |  99 ++++++++++++++++
 mm/shmem.c                       | 121 +++++++++++++++++++-
 virt/kvm/kvm_main.c              | 188 +++++++++++++++++++++++++++----
 16 files changed, 614 insertions(+), 41 deletions(-)
 create mode 100644 include/linux/memfile_notifier.h
 create mode 100644 mm/memfile_notifier.c

-- 
2.17.1



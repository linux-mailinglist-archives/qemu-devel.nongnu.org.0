Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FED34D48B5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:12:15 +0100 (CET)
Received: from localhost ([::1]:56144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJWY-0007e4-OL
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:12:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJU6-00053m-9j
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:09:42 -0500
Received: from mga18.intel.com ([134.134.136.126]:12253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJU3-0004bx-Ma
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646921379; x=1678457379;
 h=from:to:cc:subject:date:message-id;
 bh=qOgHsb0TerXs6BotdtqnRubNe5gkoi8JAE7y4owcZNM=;
 b=jLZ7rbRFS/vftgFyUwoajOK72CK7nUUssm0bW+ZH94GREGzZPXN62Crb
 kOeJw/XxvqjK7HYfL2X59kNB2snjcYXN7toKfgbKoxVOPFfROhzN+sk4x
 NaNZOuSaYt+a0sZ24as5snHdM2MlbqkMMX5RyumBfJP9WahY4C1S3TCRQ
 qt3CyZlB3NZUbm3cfuuCNmpkM926xwvR34n7svEg+bwo1F4JvBYDJ94U4
 5zyKcLAJ5NEfA6emY9Ld6C7ivEmMU+MxNKJb9uFvXvd6MCkpc9BbqtDNK
 PeVdo6tmCBwRaXkDQxx6kbAXu7N0OCqvW9o2/jlWNbEXVtK3XbAWKBF0n Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="237426158"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="237426158"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:09:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="554654744"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 10 Mar 2022 06:09:27 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM guest
 private memory 
Date: Thu, 10 Mar 2022 22:08:58 +0800
Message-Id: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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

This is the v5 of this series which tries to implement the fd-based KVM
guest private memory. The patches are based on latest kvm/queue branch
commit:

  d5089416b7fb KVM: x86: Introduce KVM_CAP_DISABLE_QUIRKS2
 
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
Introduces new MFD_INACCESSIBLE flag for memfd_create(), the file created
with these flags cannot read(), write() or mmap() etc via normal
MMU operations. The file content can only be used with the newly
introduced memfile_notifier extension.

The memfile_notifier extension provides two sets of callbacks for KVM to
interact with the memory backing store:
  - memfile_notifier_ops: callbacks for memory backing store to notify
    KVM when memory gets allocated/invalidated.
  - memfile_pfn_ops: callbacks for KVM to call into memory backing store
    to request memory pages for guest private memory.

The memfile_notifier extension also provides APIs for memory backing
store to register/unregister itself and to trigger the notifier when the
bookmarked memory gets fallocated/invalidated.

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
Linux: https://github.com/chao-p/linux/tree/privmem-v5.1
QEMU: https://github.com/chao-p/qemu/tree/privmem-v4

And an example QEMU command line:
-object tdx-guest,id=tdx \
-object memory-backend-memfd-private,id=ram1,size=2G \
-machine q35,kvm-type=tdx,pic=no,kernel_irqchip=split,memory-encryption=tdx,memory-backend=ram1

Changelog
----------
v5:
  - Removed userspace visible F_SEAL_INACCESSIBLE, instead using an
    in-kernel flag (SHM_F_INACCESSIBLE for shmem). Private fd can only
    be created by MFD_INACCESSIBLE.
  - Introduced new APIs for backing store to register itself to
    memfile_notifier instead of direct function call.
  - Added the accounting and restriction for MFD_INACCESSIBLE memory.
  - Added KVM API doc for new memslot extensions and man page for the new
    MFD_INACCESSIBLE flag.
  - Removed the overlap check for mapping the same file+offset into
    multiple gfns due to perf consideration, warned in document.
  - Addressed other comments in v4.
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

Links to previous discussions
-----------------------------
[1] Original design proposal:
https://lkml.kernel.org/kvm/20210824005248.200037-1-seanjc@google.com/
[2] Updated proposal and RFC patch v1:
https://lkml.kernel.org/linux-fsdevel/20211111141352.26311-1-chao.p.peng@linux.intel.com/
[3] Patch v4: https://lkml.org/lkml/2022/1/18/395

Chao Peng (10):
  mm: Introduce memfile_notifier
  mm/shmem: Restrict MFD_INACCESSIBLE memory against RLIMIT_MEMLOCK
  KVM: Extend the memslot to support fd-based private memory
  KVM: Use kvm_userspace_memory_region_ext
  KVM: Add KVM_EXIT_MEMORY_ERROR exit
  KVM: Use memfile_pfn_ops to obtain pfn for private pages
  KVM: Handle page fault for private memory
  KVM: Register private memslot to memory backing store
  KVM: Zap existing KVM mappings when pages changed in the private fd
  KVM: Expose KVM_MEM_PRIVATE

Kirill A. Shutemov (2):
  mm/memfd: Introduce MFD_INACCESSIBLE flag
  mm/shmem: Support memfile_notifier

 Documentation/virt/kvm/api.rst   |  59 +++++++++--
 arch/x86/kvm/Kconfig             |   1 +
 arch/x86/kvm/mmu/mmu.c           |  73 +++++++++++++-
 arch/x86/kvm/mmu/paging_tmpl.h   |  11 ++-
 arch/x86/kvm/x86.c               |  12 +--
 include/linux/kvm_host.h         |  49 ++++++++-
 include/linux/memfile_notifier.h |  64 ++++++++++++
 include/linux/shmem_fs.h         |  11 +++
 include/uapi/linux/kvm.h         |  17 ++++
 include/uapi/linux/memfd.h       |   1 +
 mm/Kconfig                       |   4 +
 mm/Makefile                      |   1 +
 mm/memfd.c                       |  26 ++++-
 mm/memfile_notifier.c            | 114 +++++++++++++++++++++
 mm/shmem.c                       | 156 +++++++++++++++++++++++++++++
 virt/kvm/kvm_main.c              | 165 +++++++++++++++++++++++++++----
 16 files changed, 717 insertions(+), 47 deletions(-)
 create mode 100644 include/linux/memfile_notifier.h
 create mode 100644 mm/memfile_notifier.c

-- 
2.17.1



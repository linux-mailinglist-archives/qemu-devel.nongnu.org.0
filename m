Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF1947E3E7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 14:02:23 +0100 (CET)
Received: from localhost ([::1]:56074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Nji-0007Ni-BQ
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 08:02:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0NFS-0004f2-H2
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:31:06 -0500
Received: from mga03.intel.com ([134.134.136.65]:51850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0NFM-0002TP-EJ
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640262660; x=1671798660;
 h=from:to:cc:subject:date:message-id;
 bh=B7UjJz2o8U/7WlNmnQCiNqRvJtB8Iir2uHf+buyKLjk=;
 b=HzM1Vl87pOJfZIU3Dy9wul5yISpmQBrS74nH4zHNP1H2sAyLHpvACQiR
 Diuvp9yT10jHHffPKtp/kM6LQ8wcC4wvvlYeDYeo/poKyHqz2dp5majT9
 PRIWYFvn17IHRZ2cP3HrvM9LSqWPV2mCd0QkVZO5zEc7QUCMgSk4ntHLq
 P7Yd9EK4qgqRwzVFPg620eiyMd6EkGgX3dmRPxatE9ZWqE7N2AbX656TM
 qDPUQwrZFtoVxECZMzt+IDPPv+BkzVGII8nyCbZG2hGdycARwxUYYC9jO
 U2woTGibo6YZi8NpBeO7YmrhnnjVkVS40IBRXaUQDjF77pvBvgFvDKKVk Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="240769460"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="240769460"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 04:30:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522078427"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 23 Dec 2021 04:30:48 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 kvm/queue 00/16] KVM: mm: fd-based approach for supporting
 KVM guest private memory 
Date: Thu, 23 Dec 2021 20:29:55 +0800
Message-Id: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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

This is the third version of this series which try to implement the
fd-based KVM guest private memory. Earlier this week I sent another v3 
version at link:

https://lore.kernel.org/linux-mm/20211222012223.GA22448@chaop.bj.intel.com/T/

That version is based on the latest TDX codebase. In contrast the one you
are reading is the same code rebased to latest kvm/queue branch at commit:

  c34c87a69727  KVM: x86: Update vPMCs when retiring branch instructions

There are some changes made to fit into the kvm queue branch but
generally the two versions are the same code in logic.

There is also difference in test. In the previous one I tested the new
private memory feature with TDX but in this rebased version I can not
test the new feature because lack TDX. I did run simple regression
test on this new version.

Introduction
------------
In general this patch series introduce fd-based memslot which provide
guest memory through a memfd file descriptor fd[offset,size] instead of
hva/size. The fd then can be created from a supported memory filesystem
like tmpfs/hugetlbfs etc which we refer as memory backend. KVM and the
memory backend exchange some callbacks when such memslot gets created.
At runtime KVM will call into callbacks provided by backend to get the
pfn with the fd+offset. Memory backend will also call into KVM callbacks
when userspace fallocate/punch hole on the fd to notify KVM to map/unmap
secondary MMU page tables.

Comparing to existing hva-based memslot, this new type of memslot allow
guest memory unmapped from host userspace like QEMU and even the kernel
itself, therefore reduce attack surface and prevent userspace bugs.

Based on this fd-based memslot, we can build guest private memory that
is going to be used in confidential computing environments such as Intel
TDX and AMD SEV. When supported, the memory backend can provide more
enforcement on the fd and KVM can use a single memslot to hold both the
private and shared part of the guest memory. 

Memfd/shmem extension
---------------------
Introduces new MFD_INACCESSIBLE flag for memfd_create(), the file
created with this flag cannot read(), write() or mmap() etc.

In addition, two sets of callbacks are introduced as new MEMFD_OPS:
  - memfd_falloc_notifier: memfd -> KVM notifier when memory gets
    allocated/invalidated through fallocate().
  - memfd_pfn_ops: kvm -> memfd to get a pfn with the fd+offset.

Memslot extension
-----------------
Add the private fd and the offset into the fd to existing 'shared' memslot
so that both private/shared guest memory can live in one single memslot.
A page in the memslot is either private or shared. A page is private only
when it's already allocated in the backend fd, all the other cases it's
treated as shared, this includes those already mapped as shared as well as
those having not been mapped. This means the memory backend is the place
which tells the truth of which page is private.

Private memory map/unmap and conversion
---------------------------------------
Userspace's map/unmap operations are done by fallocate() ioctl on the
backend fd.
  - map: default fallocate() with mode=0.
  - unmap: fallocate() with FALLOC_FL_PUNCH_HOLE.
The map/unmap will trigger above memfd_falloc_notifier to let KVM
map/unmap second MMU page tables.

Test
----
NOTE: below is the test for previous TDX based version. For this version
I only tested regular vm booting.

This code has been tested with latest TDX code patches hosted at
(https://github.com/intel/tdx/tree/kvm-upstream) with minimal TDX
adaption and QEMU support.

Example QEMU command line:
-object tdx-guest,id=tdx \
-object memory-backend-memfd-private,id=ram1,size=2G \
-machine q35,kvm-type=tdx,pic=no,kernel_irqchip=split,memory-encryption=tdx,memory-backend=ram1

Changelog
----------
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
[3] RFC patch v2:
https://x-lore.kernel.org/qemu-devel/20211119134739.20218-1-chao.p.peng@linux.intel.com/

Chao Peng (14):
  mm/memfd: Introduce MFD_INACCESSIBLE flag
  KVM: Extend the memslot to support fd-based private memory
  KVM: Maintain ofs_tree for fast memslot lookup by file offset
  KVM: Implement fd-based memory using MEMFD_OPS interfaces
  KVM: Refactor hva based memory invalidation code
  KVM: Special handling for fd-based memory invalidation
  KVM: Split out common memory invalidation code
  KVM: Implement fd-based memory invalidation
  KVM: Add kvm_map_gfn_range
  KVM: Implement fd-based memory fallocation
  KVM: Add KVM_EXIT_MEMORY_ERROR exit
  KVM: Handle page fault for private memory
  KVM: Use kvm_userspace_memory_region_ext
  KVM: Register/unregister private memory slot to memfd

Kirill A. Shutemov (2):
  mm/shmem: Introduce F_SEAL_INACCESSIBLE
  mm/memfd: Introduce MEMFD_OPS

 arch/x86/kvm/Kconfig           |   1 +
 arch/x86/kvm/mmu/mmu.c         | 120 ++++++++++++++-
 arch/x86/kvm/mmu/paging_tmpl.h |  11 +-
 arch/x86/kvm/x86.c             |   2 +-
 include/linux/kvm_host.h       |  43 +++++-
 include/linux/memfd.h          |  22 +++
 include/linux/shmem_fs.h       |  16 ++
 include/uapi/linux/fcntl.h     |   1 +
 include/uapi/linux/kvm.h       |  27 ++++
 include/uapi/linux/memfd.h     |   1 +
 mm/Kconfig                     |   4 +
 mm/memfd.c                     |  33 ++++-
 mm/shmem.c                     | 195 +++++++++++++++++++++++-
 virt/kvm/Makefile.kvm          |   2 +-
 virt/kvm/kvm_main.c            | 262 +++++++++++++++++++++++++--------
 virt/kvm/memfd.c               |  95 ++++++++++++
 16 files changed, 753 insertions(+), 82 deletions(-)
 create mode 100644 virt/kvm/memfd.c

-- 
2.17.1



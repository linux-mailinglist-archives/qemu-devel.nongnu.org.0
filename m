Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB98945701D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 14:54:52 +0100 (CET)
Received: from localhost ([::1]:58080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4Lr-0008Jp-NX
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 08:54:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mo4Fu-0004lw-2G
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:48:42 -0500
Received: from mga12.intel.com ([192.55.52.136]:23751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mo4Fq-0000D7-Do
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:48:41 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="214443810"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="214443810"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 05:48:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="507904726"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 19 Nov 2021 05:48:26 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC v2 PATCH 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Date: Fri, 19 Nov 2021 21:47:26 +0800
Message-Id: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

This RFC series try to implement the fd-based KVM guest private memory
proposal described at [1] and an improved 'New Proposal' described at [2].

In general this patch series introduce fd-based memslot which provide
guest memory through fd[offset,size] instead of hva/size. The fd then
can be created from a supported memory filesystem like tmpfs/hugetlbfs,
etc which we refer as memory backing store. KVM and backing store
exchange some callbacks when such memslot gets created. At runtime KVM
will call into callbacks provided by backing store to get the pfn with
the fd+offset. Backing store will also call into KVM callbacks when
userspace fallocate/punch hole on fd to notify KVM to map/unmap second
MMU page tables.

Comparing to existing hva-based memslot, this new type of memslot allow
guest memory unmapped from host userspace like QEMU and even the kernel
itself, therefore reduce attack surface and bring some other benefits. 

Based on this fd-based memslot, we can build guest private memory that
is going to be used in confidential computing environments such as Intel
TDX and AMD SEV. When supported, the backing store can provide more
enforcement on the fd and KVM can use a single memslot to hold both
private and shared part of the guest memory. For more detailed
description please refer to [2].

Because this design introducing some callbacks between memory backing
store and KVM, and for private memory KVM relies on backing store to do
additonal enforcement and to tell if a address is private or shared,
I would like KVM/mm/fs people can have a look at this part.


[1]
https://lkml.kernel.org/kvm/51a6f74f-6c05-74b9-3fd7-b7cd900fb8cc@redhat.com/
[2]
https://lkml.kernel.org/linux-fsdevel/20211111141352.26311-1-chao.p.peng@linux.intel.com/

Thanks,
Chao
---
Chao Peng (12):
  KVM: Add KVM_EXIT_MEMORY_ERROR exit
  KVM: Extend kvm_userspace_memory_region to support fd based memslot
  KVM: Add fd-based memslot data structure and utils
  KVM: Implement fd-based memory using new memfd interfaces
  KVM: Register/unregister memfd backed memslot
  KVM: Handle page fault for fd based memslot
  KVM: Rename hva memory invalidation code to cover fd-based offset
  KVM: Introduce kvm_memfd_invalidate_range
  KVM: Match inode for invalidation of fd-based slot
  KVM: Add kvm_map_gfn_range
  KVM: Introduce kvm_memfd_fallocate_range
  KVM: Enable memfd based page invalidation/fallocate

Kirill A. Shutemov (1):
  mm/shmem: Introduce F_SEAL_GUEST

 arch/arm64/kvm/mmu.c               |  14 +--
 arch/mips/kvm/mips.c               |  14 +--
 arch/powerpc/include/asm/kvm_ppc.h |  28 ++---
 arch/powerpc/kvm/book3s.c          |  14 +--
 arch/powerpc/kvm/book3s_hv.c       |  14 +--
 arch/powerpc/kvm/book3s_pr.c       |  14 +--
 arch/powerpc/kvm/booke.c           |  14 +--
 arch/powerpc/kvm/powerpc.c         |  14 +--
 arch/riscv/kvm/mmu.c               |  14 +--
 arch/s390/kvm/kvm-s390.c           |  14 +--
 arch/x86/include/asm/kvm_host.h    |   6 +-
 arch/x86/kvm/Makefile              |   3 +-
 arch/x86/kvm/mmu/mmu.c             | 122 ++++++++++++++++++++-
 arch/x86/kvm/vmx/main.c            |   6 +-
 arch/x86/kvm/vmx/tdx.c             |   6 +-
 arch/x86/kvm/vmx/tdx_stubs.c       |   6 +-
 arch/x86/kvm/x86.c                 |  16 +--
 include/linux/kvm_host.h           |  58 ++++++++--
 include/linux/memfd.h              |  24 +++++
 include/linux/shmem_fs.h           |   9 ++
 include/uapi/linux/fcntl.h         |   1 +
 include/uapi/linux/kvm.h           |  27 +++++
 mm/memfd.c                         |  33 +++++-
 mm/shmem.c                         | 123 ++++++++++++++++++++-
 virt/kvm/kvm_main.c                | 165 +++++++++++++++++++++++------
 virt/kvm/memfd.c                   | 123 +++++++++++++++++++++
 26 files changed, 733 insertions(+), 149 deletions(-)
 create mode 100644 virt/kvm/memfd.c

-- 
2.17.1



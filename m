Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695195B9D86
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 16:41:08 +0200 (CEST)
Received: from localhost ([::1]:57890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYq39-0002BN-C5
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 10:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oYpwm-0004u2-R2
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 10:34:33 -0400
Received: from mga12.intel.com ([192.55.52.136]:60345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oYpwi-0000pb-Ci
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 10:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663252468; x=1694788468;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ki7gTNXhfVnHCe1rkeDjQttXYp0nJgWH1gx/Z4CHDjQ=;
 b=eFdrNDMjp+r1wo0FCTlGYWh8UMJuIvRAXUFDUM96WvNvy1CYlIap0YtB
 /dgmQ4iL04fg1qCqtipmV2GKbucqHkZDBNu/cMLgEbgYpVyzSNCRC2gVe
 nLlXHFFXvbIu9GIn1ekp2X2bw0w3bo5RBEGO79c1luD21FTctz0Sl/aYG
 zaXZI58ohB30DJnyk0YkNmxyXLJxu9WreeJIY6WTxmj97pSzD5GmzmSZL
 GBWmIdanJdluoODZQjGNimaY/6lqXK6MB6tw/IeY4xouCd2Rd1kUPDj8u
 asiH7eq9Nsl7LzFe8r+iYoSdaXd8rTKMM87imZckCj4pWxygYRJyUqeXo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="278458274"
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; d="scan'208";a="278458274"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 07:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; d="scan'208";a="945976865"
Received: from chaop.bj.intel.com ([10.240.193.75])
 by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2022 07:33:52 -0700
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: [PATCH v8 0/8] KVM: mm: fd-based approach for supporting KVM
Date: Thu, 15 Sep 2022 22:29:05 +0800
Message-Id: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series implements KVM guest private memory for confidential
computing scenarios like Intel TDX[1]. If a TDX host accesses
TDX-protected guest memory, machine check can happen which can further
crash the running host system, this is terrible for multi-tenant
configurations. The host accesses include those from KVM userspace like
QEMU. This series addresses KVM userspace induced crash by introducing
new mm and KVM interfaces so KVM userspace can still manage guest memory
via a fd-based approach, but it can never access the guest memory
content.

The patch series touches both core mm and KVM code. I appreciate
Andrew/Hugh and Paolo/Sean can review and pick these patches. Any other
reviews are always welcome.
  - 01: mm change, target for mm tree
  - 02-08: KVM change, target for KVM tree

Given KVM is the only current user for the mm part, I have chatted with
Paolo and he is OK to merge the mm change through KVM tree, but
reviewed-by/acked-by is still expected from the mm people.

The patches have been verified in Intel TDX environment, but Vishal has
done an excellent work on the selftests[4] which are dedicated for this
series, making it possible to test this series without innovative
hardware and fancy steps of building a VM environment. See Test section
below for more info.

Comparing to previous version, this version redesigned mm part code and
excluded F_SEAL_AUTO_ALLOCATE and man page changes from this series. See
Changelog section below for more info.


Introduction
============
KVM userspace being able to crash the host is horrible. Under current
KVM architecture, all guest memory is inherently accessible from KVM
userspace and is exposed to the mentioned crash issue. The goal of this
series is to provide a solution to align mm and KVM, on a userspace
inaccessible approach of exposing guest memory. 

Normally, KVM populates secondary page table (e.g. EPT) by using a host
virtual address (hva) from core mm page table (e.g. x86 userspace page
table). This requires guest memory being mmaped into KVM userspace, but
this is also the source where the mentioned crash issue can happen. In
theory, apart from those 'shared' memory for device emulation etc, guest
memory doesn't have to be mmaped into KVM userspace.

This series introduces fd-based guest memory which will not be mmaped
into KVM userspace. KVM populates secondary page table by using a
fd/offset pair backed by a memory file system. The fd can be created
from a supported memory filesystem like tmpfs/hugetlbfs and KVM can
directly interact with them with newly introduced in-kernel interface,
therefore remove the KVM userspace from the path of accessing/mmaping
the guest memory. 

Kirill had a patch [2] to address the same issue in a different way. It
tracks guest encrypted memory at the 'struct page' level and relies on
HWPOISON to reject the userspace access. The patch has been discussed in
several online and offline threads and resulted in a design document [3]
which is also the original proposal for this series. Later this patch
series evolved as more comments received in community but the major
concepts in [3] still hold true so recommend reading.

The patch series may also be useful for other usages, for example, pure
software approach may use it to harden itself against unintentional
access to guest memory. This series is designed with these usages in
mind but doesn't have code directly support them and extension might be
needed.


mm change
=========
Introduces a new userspace MFD_INACCESSIBLE flag for memfd_create() so
that the memory fd created with this flag cannot read(), write() or
mmap() etc via normal MMU operations and the only way to use it is
passing it to a third kernel module like KVM and relying on it to
access the fd through the newly added inaccessible_memfd kernel
interface. The inaccessible_memfd interface bridges the memory file
subsystems (e.g.tmpfs/hugetlbfs) and their users (KVM in this case) and
provides bi-directional communication between them. 


KVM change
==========
Extends the KVM memslot to provide guest private (encrypted) memory from
a fd. With this extension, a single memslot can maintain both private
memory through private fd (private_fd/private_offset) and shared
(unencrypted) memory through userspace mmaped host virtual address
(userspace_addr). For a particular guest page, the corresponding page in
KVM memslot can be only either private or shared and only one of the
shared/private parts of the memslot is visible to guest.

Introduces new KVM_EXIT_MEMORY_FAULT exit to allow userspace to get the
chance on decision-making for shared <-> private memory conversion. The
exit can be an implicit conversion in KVM page fault handler or an
explicit conversion from guest OS.

Extends existing SEV ioctls KVM_MEMORY_ENCRYPT_{UN,}REG_REGION to
convert a guest page between private <-> shared. The data saved in these
ioctls tells the truth whether a guest page is private or shared and
this information will be used in KVM page fault handler to decide
whether the private or the shared part of the memslot is visible to
guest.


Test
====
Ran two kinds of tests:
  - Selftests [4] from Vishal and VM boot tests in non-TDX environment
    Code also in below repo: https://github.com/chao-p/linux/tree/privmem-v8

  - Functional tests in TDX capable environment
    Tested the new functionalities in TDX environment. Code repos:
    Linux: https://github.com/chao-p/linux/tree/privmem-v8-tdx
    QEMU: https://github.com/chao-p/qemu/tree/privmem-v8

    An example QEMU command line for TDX test:
    -object tdx-guest,id=tdx,debug=off,sept-ve-disable=off \
    -machine confidential-guest-support=tdx \
    -object memory-backend-memfd-private,id=ram1,size=${mem} \
    -machine memory-backend=ram1


TODO
====
  - Page accounting and limiting for encrypted memory
  - hugetlbfs support


Changelog
=========
v8:
  - mm: redesign mm part by introducing a shim layer(inaccessible_memfd)
    in memfd to avoid touch the memory file systems directly.
  - mm: exclude F_SEAL_AUTO_ALLOCATE as it is for shared memory and
    cause confusion in this series, will send out separately.
  - doc: exclude the man page change, it's not kernel patch and will
    send out separately.
  - KVM: adapt to use the new mm inaccessible_memfd interface.
  - KVM: update lpage_info when setting mem_attr_array to support
    large page.
  - KVM: change from xa_store_range to xa_store for mem_attr_array due
    to xa_store_range overrides all entries which is not intended
    behavior for us.
  - KVM: refine the mmu_invalidate_retry_gfn mechanism for private page.
  - KVM: reorganize KVM_MEMORY_ENCRYPT_{UN,}REG_REGION and private page
    handling code suggested by Sean.
v7:
  - mm: introduce F_SEAL_AUTO_ALLOCATE to avoid double allocation.
  - KVM: use KVM_MEMORY_ENCRYPT_{UN,}REG_REGION to record
    private/shared info.
  - KVM: use similar sync mechanism between zap/page fault paths as
    mmu_notifier for memfile_notifier based invalidation.
v6:
  - mm: introduce MEMFILE_F_* flags into memfile_node to allow checking
    feature consistence among all memfile_notifier users and get rid of
    internal flags like SHM_F_INACCESSIBLE.
  - mm: make pfn_ops callbacks being members of memfile_backing_store
    and then refer to it directly in memfile_notifier.
  - mm: remove backing store unregister.
  - mm: remove RLIMIT_MEMLOCK based memory accounting and limiting.
  - KVM: reorganize patch sequence for page fault handling and private
    memory enabling.
v5:
  - Add man page for MFD_INACCESSIBLE flag and improve KVM API do for
    the new memslot extensions.
  - mm: introduce memfile_{un}register_backing_store to allow memory
    backing store to register/unregister it from memfile_notifier.
  - mm: remove F_SEAL_INACCESSIBLE, use in-kernel flag
    (SHM_F_INACCESSIBLE for shmem) instead. 
  - mm: add memory accounting and limiting (RLIMIT_MEMLOCK based) for
    MFD_INACCESSIBLE memory.
  - KVM: remove the overlap check for mapping the same file+offset into
    multiple gfns due to perf consideration, warned in document.
v4:
  - mm: rename memfd_ops to memfile_notifier and separate it from
    memfd.c to standalone memfile-notifier.c.
  - KVM: move pfn_ops to per-memslot scope from per-vm scope and allow
    registering multiple memslots to the same memory backing store.
  - KVM: add a 'kvm' reference in memslot so that we can recover kvm in
    memfile_notifier handlers.
  - KVM: add 'private_' prefix for the new fields in memslot.
  - KVM: reshape the 'type' to 'flag' for kvm_memory_exit
v3:
  - Remove 'RFC' prefix.
  - Fix race condition between memfile_notifier handlers and kvm destroy.
  - mm: introduce MFD_INACCESSIBLE flag for memfd_create() to force
    setting F_SEAL_INACCESSIBLE when the fd is created.
  - KVM: add the shared part of the memslot back to make private/shared
    pages live in one memslot.

Reference
=========
[1] Intel TDX:
https://www.intel.com/content/www/us/en/developer/articles/technical/intel-trust-domain-extensions.html
[2] Kirill's implementation:
https://lore.kernel.org/all/20210416154106.23721-1-kirill.shutemov@linux.intel.com/T/ 
[3] Original design proposal:
https://lore.kernel.org/all/20210824005248.200037-1-seanjc@google.com/  
[4] Selftest:
https://lore.kernel.org/all/20220819174659.2427983-1-vannapurve@google.com/ 


Chao Peng (7):
  KVM: Extend the memslot to support fd-based private memory
  KVM: Add KVM_EXIT_MEMORY_FAULT exit
  KVM: Use gfn instead of hva for mmu_notifier_retry
  KVM: Register/unregister the guest private memory regions
  KVM: Update lpage info when private/shared memory are mixed
  KVM: Handle page fault for private memory
  KVM: Enable and expose KVM_MEM_PRIVATE

Kirill A. Shutemov (1):
  mm/memfd: Introduce userspace inaccessible memfd

 Documentation/virt/kvm/api.rst  |  78 +++++++--
 arch/x86/include/asm/kvm_host.h |   9 +
 arch/x86/kvm/Kconfig            |   1 +
 arch/x86/kvm/mmu.h              |   2 -
 arch/x86/kvm/mmu/mmu.c          | 175 +++++++++++++++++++-
 arch/x86/kvm/mmu/mmu_internal.h |  18 ++
 arch/x86/kvm/mmu/mmutrace.h     |   1 +
 arch/x86/kvm/x86.c              |   4 +-
 include/linux/kvm_host.h        |  86 ++++++++--
 include/linux/memfd.h           |  24 +++
 include/uapi/linux/kvm.h        |  37 +++++
 include/uapi/linux/magic.h      |   1 +
 include/uapi/linux/memfd.h      |   1 +
 mm/Makefile                     |   2 +-
 mm/memfd.c                      |  25 ++-
 mm/memfd_inaccessible.c         | 219 +++++++++++++++++++++++++
 virt/kvm/Kconfig                |   3 +
 virt/kvm/kvm_main.c             | 282 +++++++++++++++++++++++++++++---
 18 files changed, 912 insertions(+), 56 deletions(-)
 create mode 100644 mm/memfd_inaccessible.c

base-commit: 372d07084593dc7a399bf9bee815711b1fb1bcf2
-- 
2.25.1



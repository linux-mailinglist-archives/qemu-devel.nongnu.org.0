Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA7C49FEBE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:15:00 +0100 (CET)
Received: from localhost ([::1]:40544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUpv-0000g1-LS
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:14:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1nDUPP-00062c-La
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:47:35 -0500
Received: from foss.arm.com ([217.140.110.172]:46318)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1nDUPM-0000tv-7q
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:47:34 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EB6F113E;
 Fri, 28 Jan 2022 08:47:30 -0800 (PST)
Received: from [10.57.13.224] (unknown [10.57.13.224])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0C573F793;
 Fri, 28 Jan 2022 08:47:25 -0800 (PST)
Message-ID: <3326f57a-169d-8eb8-2b8b-0379c33ba7a5@arm.com>
Date: Fri, 28 Jan 2022 16:47:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 00/12] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Content-Language: en-GB
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, luto@kernel.org, david@redhat.com,
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Borislav Petkov <bp@alien8.de>, jun.nakajima@intel.com,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, Sean Christopherson <seanjc@google.com>,
 Jeff Layton <jlayton@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/2022 13:21, Chao Peng wrote:
> This is the v4 of this series which try to implement the fd-based KVM
> guest private memory. The patches are based on latest kvm/queue branch
> commit:
> 
>   fea31d169094 KVM: x86/pmu: Fix available_event_types check for
>                REF_CPU_CYCLES event
> 
> Introduction
> ------------
> In general this patch series introduce fd-based memslot which provides
> guest memory through memory file descriptor fd[offset,size] instead of
> hva/size. The fd can be created from a supported memory filesystem
> like tmpfs/hugetlbfs etc. which we refer as memory backing store. KVM
> and the the memory backing store exchange callbacks when such memslot
> gets created. At runtime KVM will call into callbacks provided by the
> backing store to get the pfn with the fd+offset. Memory backing store
> will also call into KVM callbacks when userspace fallocate/punch hole
> on the fd to notify KVM to map/unmap secondary MMU page tables.
> 
> Comparing to existing hva-based memslot, this new type of memslot allows
> guest memory unmapped from host userspace like QEMU and even the kernel
> itself, therefore reduce attack surface and prevent bugs.
> 
> Based on this fd-based memslot, we can build guest private memory that
> is going to be used in confidential computing environments such as Intel
> TDX and AMD SEV. When supported, the memory backing store can provide
> more enforcement on the fd and KVM can use a single memslot to hold both
> the private and shared part of the guest memory. 

This looks like it will be useful for Arm's Confidential Compute
Architecture (CCA) too - in particular we need a way of ensuring that
user space cannot 'trick' the kernel into accessing memory which has
been delegated to a realm (i.e. protected guest), and a memfd seems like
a good match.

Some comments below.

> mm extension
> ---------------------
> Introduces new F_SEAL_INACCESSIBLE for shmem and new MFD_INACCESSIBLE
> flag for memfd_create(), the file created with these flags cannot read(),
> write() or mmap() etc via normal MMU operations. The file content can
> only be used with the newly introduced memfile_notifier extension.

For Arm CCA we are expecting to seed the realm with an initial memory
contents (e.g. kernel and initrd) which will then be measured before
execution starts. The 'obvious' way of doing this with a memfd would be
to populate parts of the memfd then seal it with F_SEAL_INACCESSIBLE.

However as things stand it's not possible to set the INACCESSIBLE seal
after creating a memfd (F_ALL_SEALS hasn't been updated to include it).

One potential workaround would be for arm64 to provide a custom KVM
ioctl to effectively memcpy() into the guest's protected memory which
would only be accessible before the guest has started. The drawback is
that it requires two copies of the data during guest setup.

Do you think things could be relaxed so the F_SEAL_INACCESSIBLE flag
could be set after a memfd has been created (and partially populated)?

Thanks,

Steve

> The memfile_notifier extension provides two sets of callbacks for KVM to
> interact with the memory backing store:
>   - memfile_notifier_ops: callbacks for memory backing store to notify
>     KVM when memory gets allocated/invalidated.
>   - memfile_pfn_ops: callbacks for KVM to call into memory backing store
>     to request memory pages for guest private memory.
> 
> memslot extension
> -----------------
> Add the private fd and the fd offset to existing 'shared' memslot so that
> both private/shared guest memory can live in one single memslot. A page in
> the memslot is either private or shared. A page is private only when it's
> already allocated in the backing store fd, all the other cases it's treated
> as shared, this includes those already mapped as shared as well as those
> having not been mapped. This means the memory backing store is the place
> which tells the truth of which page is private.
> 
> Private memory map/unmap and conversion
> ---------------------------------------
> Userspace's map/unmap operations are done by fallocate() ioctl on the
> backing store fd.
>   - map: default fallocate() with mode=0.
>   - unmap: fallocate() with FALLOC_FL_PUNCH_HOLE.
> The map/unmap will trigger above memfile_notifier_ops to let KVM map/unmap
> secondary MMU page tables.
> 
> Test
> ----
> To test the new functionalities of this patch TDX patchset is needed.
> Since TDX patchset has not been merged so I did two kinds of test:
> 
> -  Regresion test on kvm/queue (this patch)
>    Most new code are not covered. I only tested building and booting.
> 
> -  New Funational test on latest TDX code
>    The patch is rebased to latest TDX code and tested the new
>    funcationalities.
> 
> For TDX test please see below repos:
> Linux: https://github.com/chao-p/linux/tree/privmem-v4.3
> QEMU: https://github.com/chao-p/qemu/tree/privmem-v4
> 
> And an example QEMU command line:
> -object tdx-guest,id=tdx \
> -object memory-backend-memfd-private,id=ram1,size=2G \
> -machine q35,kvm-type=tdx,pic=no,kernel_irqchip=split,memory-encryption=tdx,memory-backend=ram1
> 
> Changelog
> ----------
> v4:
>   - Decoupled the callbacks between KVM/mm from memfd and use new
>     name 'memfile_notifier'.
>   - Supported register multiple memslots to the same backing store.
>   - Added per-memslot pfn_ops instead of per-system.
>   - Reworked the invalidation part.
>   - Improved new KVM uAPIs (private memslot extension and memory
>     error) per Sean's suggestions.
>   - Addressed many other minor fixes for comments from v3.
> v3:
>   - Added locking protection when calling
>     invalidate_page_range/fallocate callbacks.
>   - Changed memslot structure to keep use useraddr for shared memory.
>   - Re-organized F_SEAL_INACCESSIBLE and MEMFD_OPS.
>   - Added MFD_INACCESSIBLE flag to force F_SEAL_INACCESSIBLE.
>   - Commit message improvement.
>   - Many small fixes for comments from the last version.
> 
> Links of previous discussions
> -----------------------------
> [1] Original design proposal:
> https://lkml.kernel.org/kvm/20210824005248.200037-1-seanjc@google.com/
> [2] Updated proposal and RFC patch v1:
> https://lkml.kernel.org/linux-fsdevel/20211111141352.26311-1-chao.p.peng@linux.intel.com/
> [3] Patch v3: https://lkml.org/lkml/2021/12/23/283
> 
> Chao Peng (11):
>   mm/memfd: Introduce MFD_INACCESSIBLE flag
>   mm: Introduce memfile_notifier
>   mm/shmem: Support memfile_notifier
>   KVM: Extend the memslot to support fd-based private memory
>   KVM: Use kvm_userspace_memory_region_ext
>   KVM: Add KVM_EXIT_MEMORY_ERROR exit
>   KVM: Use memfile_pfn_ops to obtain pfn for private pages
>   KVM: Handle page fault for private memory
>   KVM: Register private memslot to memory backing store
>   KVM: Zap existing KVM mappings when pages changed in the private fd
>   KVM: Expose KVM_MEM_PRIVATE
> 
> Kirill A. Shutemov (1):
>   mm/shmem: Introduce F_SEAL_INACCESSIBLE
> 
>  arch/x86/kvm/Kconfig             |   1 +
>  arch/x86/kvm/mmu/mmu.c           |  73 +++++++++++-
>  arch/x86/kvm/mmu/paging_tmpl.h   |  11 +-
>  arch/x86/kvm/x86.c               |  12 +-
>  include/linux/kvm_host.h         |  49 +++++++-
>  include/linux/memfile_notifier.h |  53 +++++++++
>  include/linux/shmem_fs.h         |   4 +
>  include/uapi/linux/fcntl.h       |   1 +
>  include/uapi/linux/kvm.h         |  17 +++
>  include/uapi/linux/memfd.h       |   1 +
>  mm/Kconfig                       |   4 +
>  mm/Makefile                      |   1 +
>  mm/memfd.c                       |  20 +++-
>  mm/memfile_notifier.c            |  99 ++++++++++++++++
>  mm/shmem.c                       | 121 +++++++++++++++++++-
>  virt/kvm/kvm_main.c              | 188 +++++++++++++++++++++++++++----
>  16 files changed, 614 insertions(+), 41 deletions(-)
>  create mode 100644 include/linux/memfile_notifier.h
>  create mode 100644 mm/memfile_notifier.c
> 



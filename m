Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5A46138DC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 15:20:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opVdm-0005sX-VX; Mon, 31 Oct 2022 10:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1opVdL-0005nV-3P
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 10:19:24 -0400
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1opVdI-0000wt-T7
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 10:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667225960; x=1698761960;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=tqW2d6h1UDzp5U1oT1GYec0J1/UWlA3NgSO3LKyeYTY=;
 b=MgZEfTYwQ0ybGlE1u78+v7roYDNKUBinUbF1Z9mXsbbivAobTQho0ium
 QQ9DpLMt0tvalVltlltYsvuhsMLwuhdlsHHh7ovHAG7SjTGckRh63l47N
 7WjjZixUCMq0bvNTBFsL+/Jbgx3K2zEYki7bzXL9mJFxRVIo2bqxi20Np
 wsJEMiv476GdsMRV/L8v+99KFY1mzOw+GDcjgONQzIW71Y+pFl7r4X0PR
 G7kdkj844znUEuoCELOzu0A8BjTm+0ydZy9Kt/goaJXRDhIJCfbJ5iXOI
 oAz0ld5+XzkjGTMOl3zjbwNwnvjO5/fHqDBDExah6CqMKQq2+zrd4E/y7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="335565868"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="335565868"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 07:19:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="628252321"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="628252321"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 31 Oct 2022 07:18:54 -0700
Date: Mon, 31 Oct 2022 22:14:26 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
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
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v9 2/8] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20221031141426.GA3994099@chaop.bj.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-3-chao.p.peng@linux.intel.com>
 <f324f02c-cf76-08a9-07a3-4af60778056f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f324f02c-cf76-08a9-07a3-4af60778056f@intel.com>
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -79
X-Spam_score: -8.0
X-Spam_bar: --------
X-Spam_report: (-8.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 03:04:27PM +0800, Xiaoyao Li wrote:
> On 10/25/2022 11:13 PM, Chao Peng wrote:
> > In memory encryption usage, guest memory may be encrypted with special
> > key and can be accessed only by the guest itself. We call such memory
> > private memory. It's valueless and sometimes can cause problem to allow
> > userspace to access guest private memory. This new KVM memslot extension
> > allows guest private memory being provided though a restrictedmem
>                                                  ^
> 
> typo

Thanks!

> 
> > backed file descriptor(fd) and userspace is restricted to access the
> > bookmarked memory in the fd.
> > 
> > This new extension, indicated by the new flag KVM_MEM_PRIVATE, adds two
> > additional KVM memslot fields restricted_fd/restricted_offset to allow
> > userspace to instruct KVM to provide guest memory through restricted_fd.
> > 'guest_phys_addr' is mapped at the restricted_offset of restricted_fd
> > and the size is 'memory_size'.
> > 
> > The extended memslot can still have the userspace_addr(hva). When use, a
> > single memslot can maintain both private memory through restricted_fd
> > and shared memory through userspace_addr. Whether the private or shared
> > part is visible to guest is maintained by other KVM code.
> > 
> > A restrictedmem_notifier field is also added to the memslot structure to
> > allow the restricted_fd's backing store to notify KVM the memory change,
> > KVM then can invalidate its page table entries.
> > 
> > Together with the change, a new config HAVE_KVM_RESTRICTED_MEM is added
> > and right now it is selected on X86_64 only. A KVM_CAP_PRIVATE_MEM is
> > also introduced to indicate KVM support for KVM_MEM_PRIVATE.
> > 
> > To make code maintenance easy, internally we use a binary compatible
> > alias struct kvm_user_mem_region to handle both the normal and the
> > '_ext' variants.
> > 
> > Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >   Documentation/virt/kvm/api.rst | 48 ++++++++++++++++++++++++++++-----
> >   arch/x86/kvm/Kconfig           |  2 ++
> >   arch/x86/kvm/x86.c             |  2 +-
> >   include/linux/kvm_host.h       | 13 +++++++--
> >   include/uapi/linux/kvm.h       | 29 ++++++++++++++++++++
> >   virt/kvm/Kconfig               |  3 +++
> >   virt/kvm/kvm_main.c            | 49 ++++++++++++++++++++++++++++------
> >   7 files changed, 128 insertions(+), 18 deletions(-)
> > 
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index eee9f857a986..f3fa75649a78 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -1319,7 +1319,7 @@ yet and must be cleared on entry.
> >   :Capability: KVM_CAP_USER_MEMORY
> >   :Architectures: all
> >   :Type: vm ioctl
> > -:Parameters: struct kvm_userspace_memory_region (in)
> > +:Parameters: struct kvm_userspace_memory_region(_ext) (in)
> >   :Returns: 0 on success, -1 on error
> >   ::
> > @@ -1332,9 +1332,18 @@ yet and must be cleared on entry.
> >   	__u64 userspace_addr; /* start of the userspace allocated memory */
> >     };
> > +  struct kvm_userspace_memory_region_ext {
> > +	struct kvm_userspace_memory_region region;
> > +	__u64 restricted_offset;
> > +	__u32 restricted_fd;
> > +	__u32 pad1;
> > +	__u64 pad2[14];
> > +  };
> > +
> >     /* for kvm_memory_region::flags */
> >     #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
> >     #define KVM_MEM_READONLY	(1UL << 1)
> > +  #define KVM_MEM_PRIVATE		(1UL << 2)
> >   This ioctl allows the user to create, modify or delete a guest physical
> >   memory slot.  Bits 0-15 of "slot" specify the slot id and this value
> > @@ -1365,12 +1374,27 @@ It is recommended that the lower 21 bits of guest_phys_addr and userspace_addr
> >   be identical.  This allows large pages in the guest to be backed by large
> >   pages in the host.
> > -The flags field supports two flags: KVM_MEM_LOG_DIRTY_PAGES and
> > -KVM_MEM_READONLY.  The former can be set to instruct KVM to keep track of
> > -writes to memory within the slot.  See KVM_GET_DIRTY_LOG ioctl to know how to
> > -use it.  The latter can be set, if KVM_CAP_READONLY_MEM capability allows it,
> > -to make a new slot read-only.  In this case, writes to this memory will be
> > -posted to userspace as KVM_EXIT_MMIO exits.
> > +kvm_userspace_memory_region_ext struct includes all fields of
> > +kvm_userspace_memory_region struct, while also adds additional fields for some
> > +other features. See below description of flags field for more information.
> > +It's recommended to use kvm_userspace_memory_region_ext in new userspace code.
> > +
> > +The flags field supports following flags:
> > +
> > +- KVM_MEM_LOG_DIRTY_PAGES to instruct KVM to keep track of writes to memory
> > +  within the slot.  For more details, see KVM_GET_DIRTY_LOG ioctl.
> > +
> > +- KVM_MEM_READONLY, if KVM_CAP_READONLY_MEM allows, to make a new slot
> > +  read-only.  In this case, writes to this memory will be posted to userspace as
> > +  KVM_EXIT_MMIO exits.
> > +
> > +- KVM_MEM_PRIVATE, if KVM_CAP_PRIVATE_MEM allows, to indicate a new slot has
> > +  private memory backed by a file descriptor(fd) and userspace access to the
> > +  fd may be restricted. Userspace should use restricted_fd/restricted_offset in
> > +  kvm_userspace_memory_region_ext to instruct KVM to provide private memory
> > +  to guest. Userspace should guarantee not to map the same pfn indicated by
> > +  restricted_fd/restricted_offset to different gfns with multiple memslots.
> > +  Failed to do this may result undefined behavior.
> >   When the KVM_CAP_SYNC_MMU capability is available, changes in the backing of
> >   the memory region are automatically reflected into the guest.  For example, an
> > @@ -8215,6 +8239,16 @@ structure.
> >   When getting the Modified Change Topology Report value, the attr->addr
> >   must point to a byte where the value will be stored or retrieved from.
> > +8.36 KVM_CAP_PRIVATE_MEM
> > +------------------------
> > +
> > +:Architectures: x86
> > +
> > +This capability indicates that private memory is supported and userspace can
> > +set KVM_MEM_PRIVATE flag for KVM_SET_USER_MEMORY_REGION ioctl.  See
> > +KVM_SET_USER_MEMORY_REGION for details on the usage of KVM_MEM_PRIVATE and
> > +kvm_userspace_memory_region_ext fields.
> > +
> >   9. Known KVM API problems
> >   =========================
> > diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> > index 67be7f217e37..8d2bd455c0cd 100644
> > --- a/arch/x86/kvm/Kconfig
> > +++ b/arch/x86/kvm/Kconfig
> > @@ -49,6 +49,8 @@ config KVM
> >   	select SRCU
> >   	select INTERVAL_TREE
> >   	select HAVE_KVM_PM_NOTIFIER if PM
> > +	select HAVE_KVM_RESTRICTED_MEM if X86_64
> > +	select RESTRICTEDMEM if HAVE_KVM_RESTRICTED_MEM
> >   	help
> >   	  Support hosting fully virtualized guest machines using hardware
> >   	  virtualization extensions.  You will need a fairly recent
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 4bd5f8a751de..02ad31f46dd7 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -12425,7 +12425,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
> >   	}
> >   	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> > -		struct kvm_userspace_memory_region m;
> > +		struct kvm_user_mem_region m;
> >   		m.slot = id | (i << 16);
> >   		m.flags = 0;
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 32f259fa5801..739a7562a1f3 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -44,6 +44,7 @@
> >   #include <asm/kvm_host.h>
> >   #include <linux/kvm_dirty_ring.h>
> > +#include <linux/restrictedmem.h>
> >   #ifndef KVM_MAX_VCPU_IDS
> >   #define KVM_MAX_VCPU_IDS KVM_MAX_VCPUS
> > @@ -575,8 +576,16 @@ struct kvm_memory_slot {
> >   	u32 flags;
> >   	short id;
> >   	u16 as_id;
> > +	struct file *restricted_file;
> > +	loff_t restricted_offset;
> > +	struct restrictedmem_notifier notifier;
> >   };
> > +static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
> > +{
> > +	return slot && (slot->flags & KVM_MEM_PRIVATE);
> > +}
> > +
> 
> We can introduce this function in patch 6 when it's first used.

Good to me.

Chao
> 
> 


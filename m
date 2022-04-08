Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D354F9698
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 15:23:48 +0200 (CEST)
Received: from localhost ([::1]:55500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncoaZ-0001R7-Qc
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 09:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ncoYf-0000dD-7f
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 09:21:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:39496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ncoYc-0001Bv-3i
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 09:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649424106; x=1680960106;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=yJ+a09qZfU8xn/sBjF/pizQ4GwvK+1hMB8dFu0xFHhY=;
 b=OqDyGCx/7Y6X3lR7Ru8TdMl95nKC6iYLu0F3ZPgt7wzVjUaJ4l0Nuufs
 kZvENsQq/8ZJlSF37w/ZyE7s12Rg4m7G5iSi0VsMDqnqgcyhoqms055qL
 Rg8fyIOxTWfEgDCkcG/ytkXPNnYXTl0hH6yskOTLXLofCM2L1f7FhDgVA
 ZUwTjHgQsJ+u24oD9UMX/uqaZdYa/3AHsqhVmw3/yp9SsgtCfgtdJikIE
 E8/LX+RVYBsXjJGwmgWmnbHP5n1OzMVWPfhnCDHY2Iz1Cc3K3l1+yQSHb
 nlPcCGMOtiiTMccXcQBIHAvhk38MReJpqAqwUKA2cMwFqcIAxHrn1tZhI g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261280688"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="261280688"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 06:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="571485977"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 08 Apr 2022 06:21:16 -0700
Date: Fri, 8 Apr 2022 21:21:05 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v5 05/13] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20220408132105.GC57095@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-6-chao.p.peng@linux.intel.com>
 <YkIoRDNbwJH/IDeC@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkIoRDNbwJH/IDeC@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, linux-api@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 28, 2022 at 09:27:32PM +0000, Sean Christopherson wrote:
> On Thu, Mar 10, 2022, Chao Peng wrote:
> > Extend the memslot definition to provide fd-based private memory support
> > by adding two new fields (private_fd/private_offset). The memslot then
> > can maintain memory for both shared pages and private pages in a single
> > memslot. Shared pages are provided by existing userspace_addr(hva) field
> > and private pages are provided through the new private_fd/private_offset
> > fields.
> > 
> > Since there is no 'hva' concept anymore for private memory so we cannot
> > rely on get_user_pages() to get a pfn, instead we use the newly added
> > memfile_notifier to complete the same job.
> > 
> > This new extension is indicated by a new flag KVM_MEM_PRIVATE.
> > 
> > Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> 
> Needs a Co-developed-by: for Yu, or a From: if Yu is the sole author.

Yes a Co-developed-by for Yu is needed, for all the patches throught the series.

> 
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >  Documentation/virt/kvm/api.rst | 37 +++++++++++++++++++++++++++-------
> >  include/linux/kvm_host.h       |  7 +++++++
> >  include/uapi/linux/kvm.h       |  8 ++++++++
> >  3 files changed, 45 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 3acbf4d263a5..f76ac598606c 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -1307,7 +1307,7 @@ yet and must be cleared on entry.
> >  :Capability: KVM_CAP_USER_MEMORY
> >  :Architectures: all
> >  :Type: vm ioctl
> > -:Parameters: struct kvm_userspace_memory_region (in)
> > +:Parameters: struct kvm_userspace_memory_region(_ext) (in)
> >  :Returns: 0 on success, -1 on error
> >  
> >  ::
> > @@ -1320,9 +1320,17 @@ yet and must be cleared on entry.
> >  	__u64 userspace_addr; /* start of the userspace allocated memory */
> >    };
> >  
> > +  struct kvm_userspace_memory_region_ext {
> > +	struct kvm_userspace_memory_region region;
> > +	__u64 private_offset;
> > +	__u32 private_fd;
> > +	__u32 padding[5];
> 
> Uber nit, I'd prefer we pad u32 for private_fd separate from padding the size of
> the structure for future expansion.
> 
> Regarding future expansion, any reason not to go crazy and pad like 128+ bytes?
> It'd be rather embarassing if the next memslot extension needs 3 u64s and we end
> up with region_ext2 :-)

OK, so maybe:
	__u64 private_offset;
	__u32 private_fd;
	__u32 pad1;
	__u32 pad2[28];
> 
> > +};
> > +
> >    /* for kvm_memory_region::flags */
> >    #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
> >    #define KVM_MEM_READONLY	(1UL << 1)
> > +  #define KVM_MEM_PRIVATE		(1UL << 2)
> >  
> >  This ioctl allows the user to create, modify or delete a guest physical
> >  memory slot.  Bits 0-15 of "slot" specify the slot id and this value
> 
> ...
> 
> > +static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
> 
> I 100% think we should usurp the name "private" for these memslots, but as prep
> work this series should first rename KVM_PRIVATE_MEM_SLOTS to avoid confusion.
> Maybe KVM_INTERNAL_MEM_SLOTS?

Oh, I didn't realized 'PRIVATE' is already taken.  KVM_INTERNAL_MEM_SLOTS
sounds good.

Thanks,
Chao


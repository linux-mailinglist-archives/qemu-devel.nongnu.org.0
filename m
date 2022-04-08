Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD154F976E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 15:57:00 +0200 (CEST)
Received: from localhost ([::1]:60864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncp6i-0001zi-2P
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 09:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ncoxK-0004th-1u
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 09:47:18 -0400
Received: from mga01.intel.com ([192.55.52.88]:34796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ncoxA-0005br-05
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 09:47:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649425628; x=1680961628;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Z2KoO20U5Gou3STOQQVbT5tvwIoJoZ5aoHHnzZT/K3Y=;
 b=UJbi0GxgiqeRxKwGBdT5x/A4+JPBR8+j/0hAwcDwWjV8uHeFVpFCAEiB
 Nyphs/WmTJec0Pfw91K3PWSDX8oPA0fH1Ui1zvesHWcrfvNAO99vgyyz0
 f5tYj3VOaVnkfDAUImTLMYKYL5hPss0oNMv/r1HTxeYtubGuQy7yQayTE
 N+37CYP2a22K2Ey/pK6hfMJ7OTe1xJBrdYsAganrFfPnFCJcehRFF1VyN
 1Be+VsZqAIU/eg2BHAlX8f892iUj6x4bGXZHKN9FOVuB6CyglEy4uPX42
 ZC9y/voC16Li2T196ECpav1Sd69EZTzxNn9UTUFFqeOFIQCrCFfwOfqvt g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="286584555"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="286584555"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 06:47:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="698187600"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2022 06:46:52 -0700
Date: Fri, 8 Apr 2022 21:46:41 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v5 05/13] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20220408134641.GD57095@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-6-chao.p.peng@linux.intel.com>
 <YkIvEeC3/lgKTLPt@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkIvEeC3/lgKTLPt@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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

On Mon, Mar 28, 2022 at 09:56:33PM +0000, Sean Christopherson wrote:
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
> 
> Peeking ahead, the partial switch to the _ext variant is rather gross.  I would
> prefer that KVM use an entirely different, but binary compatible, struct internally.
> And once the kernel supports C11[*], I'm pretty sure we can make the "region" in
> _ext an anonymous struct, and make KVM's internal struct a #define of _ext.  That
> should minimize the churn (no need to get the embedded "region" field), reduce
> line lengths, and avoid confusion due to some flows taking the _ext but others
> dealing with only the "base" struct.

Will try that.

> 
> Maybe kvm_user_memory_region or kvm_user_mem_region?  Though it's tempting to be
> evil and usurp the old kvm_memory_region :-)
> 
> E.g. pre-C11 do
> 
> struct kvm_userspace_memory_region_ext {
> 	struct kvm_userspace_memory_region region;
> 	__u64 private_offset;
> 	__u32 private_fd;
> 	__u32 padding[5];
> };
> 
> #ifdef __KERNEL__
> struct kvm_user_mem_region {
> 	__u32 slot;
> 	__u32 flags;
> 	__u64 guest_phys_addr;
> 	__u64 memory_size; /* bytes */
> 	__u64 userspace_addr; /* start of the userspace allocated memory */
> 	__u64 private_offset;
> 	__u32 private_fd;
> 	__u32 padding[5];
> };
> #endif
> 
> and then post-C11 do
> 
> struct kvm_userspace_memory_region_ext {
> #ifdef __KERNEL__

Is this #ifndef? As I think anonymous struct is only for kernel?

Thanks,
Chao

> 	struct kvm_userspace_memory_region region;
> #else
> 	struct kvm_userspace_memory_region;
> #endif
> 	__u64 private_offset;
> 	__u32 private_fd;
> 	__u32 padding[5];
> };
> 
> #ifdef __KERNEL__
> #define kvm_user_mem_region kvm_userspace_memory_region_ext
> #endif
> 
> [*] https://lore.kernel.org/all/20220301145233.3689119-1-arnd@kernel.org
> 
> > +	__u64 private_offset;
> > +	__u32 private_fd;
> > +	__u32 padding[5];
> > +};


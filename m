Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8110C48E419
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 07:12:59 +0100 (CET)
Received: from localhost ([::1]:42238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Fpa-0006tz-BN
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 01:12:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1n8Fno-00066x-4V
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:11:08 -0500
Received: from mga05.intel.com ([192.55.52.43]:56751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1n8Fni-0002H5-Ed
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642140662; x=1673676662;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=vFkrUx7JlBhH8tQHdr680ZVtcCkoqOiY56p9j5M74UM=;
 b=I1O4E6LyCTJTRgZatGglQ85HF+ZafOo+6RegQBI6SJ24uRgTJgtmzE/6
 46EEXcjcrLdJMculvZGi0gfY5fVQFCRs70cTsutlT8yPMvUJ1fS/ptQ2F
 BzguEWMaCsg5N/6YRmFfJ1fVva1r/4L7lWwSPoSOdoUtsjcv5g5mKkSz0
 QaRKxcblFe4y6HDav2rNgdddLXCeZzrJLnRitInYNch8s6rtBnHBUx6s5
 tXYxP/fR6uh/ZGRkiFkO3un7kdMnWCU5F3lx34nDCuMESDcDMoxV2VGCF
 3bVUi6LyV+SF60z1UU5J+ALXefZ3qtOTf3y4nomacrlpD73fNFphOMzOQ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="330539081"
X-IronPort-AV: E=Sophos;i="5.88,287,1635231600"; d="scan'208";a="330539081"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 22:10:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,287,1635231600"; d="scan'208";a="559370934"
Received: from yzhao56-desk.sh.intel.com ([10.239.159.43])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 22:10:52 -0800
Date: Fri, 14 Jan 2022 13:53:15 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v3 kvm/queue 14/16] KVM: Handle page fault for private
 memory
Message-ID: <20220114055315.GA29165@yzhao56-desk.sh.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-15-chao.p.peng@linux.intel.com>
 <20220104014629.GA2330@yzhao56-desk.sh.intel.com>
 <20220104091008.GA21806@chaop.bj.intel.com>
 <20220104100612.GA19947@yzhao56-desk.sh.intel.com>
 <20220105062810.GB25283@chaop.bj.intel.com>
 <20220105075356.GB19947@yzhao56-desk.sh.intel.com>
 <YdYFFzlPTvgFdSXL@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdYFFzlPTvgFdSXL@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yan.y.zhao@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 ak@linux.intel.com, Jonathan Corbet <corbet@lwn.net>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, dave.hansen@intel.com, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 john.ji@intel.com, Yu Zhang <yu.c.zhang@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hi Sean,
Sorry for the late reply. I just saw this mail in my mailbox.

On Wed, Jan 05, 2022 at 08:52:39PM +0000, Sean Christopherson wrote:
> On Wed, Jan 05, 2022, Yan Zhao wrote:
> > Sorry, maybe I didn't express it clearly.
> > 
> > As in the kvm_faultin_pfn_private(), 
> > static bool kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > 				    struct kvm_page_fault *fault,
> > 				    bool *is_private_pfn, int *r)
> > {
> > 	int order;
> > 	int mem_convert_type;
> > 	struct kvm_memory_slot *slot = fault->slot;
> > 	long pfn = kvm_memfd_get_pfn(slot, fault->gfn, &order);
> > 	...
> > }
> > Currently, kvm_memfd_get_pfn() is called unconditionally.
> > However, if the backend of a private memslot is not memfd, and is device
> > fd for example, a different xxx_get_pfn() is required here.
> 
> Ya, I've complained about this in a different thread[*].  This should really be
> something like kvm_private_fd_get_pfn(), where the underlying ops struct can point
> at any compatible backing store.
> 
> https://lore.kernel.org/all/YcuMUemyBXFYyxCC@google.com/
>
ok. 

> > Further, though mapped to a private gfn, it might be ok for QEMU to
> > access the device fd in hva-based way (or call it MMU access way, e.g.
> > read/write/mmap), it's desired that it could use the traditional to get
> > pfn without convert the range to a shared one.
> 
> No, this is expressly forbidden.  The backing store for a private gfn must not
> be accessible by userspace.  It's possible a backing store could support both, but
> not concurrently, and any conversion must be done without KVM being involved.
> In other words, resolving a private gfn must either succeed or fail (exit to
> userspace), KVM cannot initiate any conversions.
>
When it comes to a device passthrough via VFIO, there might be more work
related to the device fd as a backend.

First, unlike memfd which can allocate one private fd for a set of PFNs,
and one shared fd for another set of PFNs, for device fd, it needs to open
the same physical device twice, one for shared fd, and one for private fd.

Then, for private device fd, now its ramblock has to use qemu_ram_alloc_from_fd()
instead of current qemu_ram_alloc_from_ptr().
And as in VFIO, this private fd is shared by several ramblocks (each locating from
a different base offset), the base offsets also need to be kept somewhere 
in order to call get_pfn successfully. (this info is kept in
vma through mmap() previously, so without mmap(), a new interface might
be required). 

Also, for shared device fd,  mmap() is required in order to allocate the
ramblock with qemu_ram_alloc_from_ptr(), and more importantly to make
the future gfn_to_hva, and hva_to_pfn possible.
But as the shared and private fds are based on the same physical device,
the vfio driver needs to record which vma ranges are allowed for the actual
mmap_fault, which vma area are not.

With the above changes, it only prevents the host user space from accessing
the device mapped to private GFNs.
For memory backends, host kernel space accessing is prevented via MKTME.
And for device, the device needs to the work to disallow host kernel
space access.
However, unlike memory side, the device side would not cause any MCE. 
Thereby, host user space access to the device also would not cause MCEs, either. 

So, I'm not sure if the above work is worthwhile to the device fd.


> > pfn = __gfn_to_pfn_memslot(slot, fault->gfn, ...)
> > 	|->addr = __gfn_to_hva_many (slot, gfn,...)
> > 	|  pfn = hva_to_pfn (addr,...)
> > 
> > 
> > So, is it possible to recognize such kind of backends in KVM, and to get
> > the pfn in traditional way without converting them to shared?
> > e.g.
> > - specify KVM_MEM_PRIVATE_NONPROTECT to memory regions with such kind
> > of backends, or
> > - detect the fd type and check if get_pfn is provided. if no, go the
> >   traditional way.
> 
> No, because the whole point of this is to make guest private memory inaccessible
> to host userspace.  Or did I misinterpret your questions?
I think the host unmap series is based on the assumption that host user
space access to the memory based to private guest GFNs would cause fatal
MCEs.
So, I hope for backends who will not bring this fatal error can keep
using traditional way to get pfn and be mapped to private GFNs at the
same time.

Thanks
Yan


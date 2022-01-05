Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843F2484F37
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 09:23:03 +0100 (CET)
Received: from localhost ([::1]:59602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n51ZW-0000x8-9K
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 03:23:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1n51Oq-0003Ag-88
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 03:12:06 -0500
Received: from mga04.intel.com ([192.55.52.120]:62446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1n51Oa-0007Hp-9A
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 03:11:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641370304; x=1672906304;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=VVpNUBQjFn92mN2xWVrn6+q6FmyXhBeMOJG28wluJ7k=;
 b=YziPmyIwTBqWnsCECGqwvASzv6Nu3VsVslWfjPh2susY6AsBbfLY6SbJ
 uO+nREIpJjFX+J0q4Z93UwTGWEs0CVK6tF1x3XgdGiaJEEdE4QAGd7+yz
 qxJ/sMr9dtcZODCfVr/86ea9fIMmIYCKTfz0DCrq69WEIQCHMZanxYKT0
 eZbUB3hFYm8o22q8Ev7u49Oudh7CRLjPjmw5LVkfi/Gs8K+h3l/B2wlfQ
 5U6P9Cy+eZBKydrRHuBnyVbLsTl6COgHruaSxDWzSe/QYRv5c7Pr3l0tD
 il/bZN3w6qW0e1t8DGIc3a9dYQeUF7AjJPizQmFBjwEczJoN1q3OUEuii w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="241212427"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="241212427"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 00:11:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="611379321"
Received: from yzhao56-desk.sh.intel.com ([10.239.159.43])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 00:11:28 -0800
Date: Wed, 5 Jan 2022 15:53:56 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Subject: Re: [PATCH v3 kvm/queue 14/16] KVM: Handle page fault for private
 memory
Message-ID: <20220105075356.GB19947@yzhao56-desk.sh.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-15-chao.p.peng@linux.intel.com>
 <20220104014629.GA2330@yzhao56-desk.sh.intel.com>
 <20220104091008.GA21806@chaop.bj.intel.com>
 <20220104100612.GA19947@yzhao56-desk.sh.intel.com>
 <20220105062810.GB25283@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105062810.GB25283@chaop.bj.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yan.y.zhao@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 02:28:10PM +0800, Chao Peng wrote:
> On Tue, Jan 04, 2022 at 06:06:12PM +0800, Yan Zhao wrote:
> > On Tue, Jan 04, 2022 at 05:10:08PM +0800, Chao Peng wrote:
<...> 
> > Thanks. So QEMU will re-generate memslots and set KVM_MEM_PRIVATE
> > accordingly? Will it involve slot deletion and create?
> 
> KVM will not re-generate memslots when do the conversion, instead, it
> does unmap/map a range on the same memslot. For memslot with tag
> KVM_MEM_PRIVATE, it always have two mappings (private/shared) but at a
> time only one is effective. What conversion does is to turn off the
> existing mapping and turn on the other mapping for specified range in
> that slot.
>
got it. thanks!

<...>
> > > > > +static bool kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > > > > +				    struct kvm_page_fault *fault,
> > > > > +				    bool *is_private_pfn, int *r)
> > > > > +{
> > > > > +	int order;
> > > > > +	int mem_convert_type;
> > > > > +	struct kvm_memory_slot *slot = fault->slot;
> > > > > +	long pfn = kvm_memfd_get_pfn(slot, fault->gfn, &order);
> > > > For private memory slots, it's possible to have pfns backed by
> > > > backends other than memfd, e.g. devicefd.
> > > 
> > > Surely yes, although this patch only supports memfd, but it's designed
> > > to be extensible to support other memory backing stores than memfd. There
> > > is one assumption in this design however: one private memslot can be
> > > backed by only one type of such memory backing store, e.g. if the
> > > devicefd you mentioned can independently provide memory for a memslot
> > > then that's no issue.
> > > 
> > > >So is it possible to let those
> > > > private memslots keep private and use traditional hva-based way?
> > > 
> > > Typically this fd-based private memory uses the 'offset' as the
> > > userspace address to get a pfn from the backing store fd. But I believe
> > > the current code does not prevent you from using the hva as the
> > By hva-based way, I mean mmap is required for this fd.
> > 
> > > userspace address, as long as your memory backing store understand that
> > > address and can provide the pfn basing on it. But since you already have
> > > the hva, you probably already mmap-ed the fd to userspace, that seems
> > > not this private memory patch can protect you. Probably I didn't quite
> > Yes, for this fd, though mapped in private memslot, there's no need to
> > prevent QEMU/host from accessing it as it will not cause the severe machine
> > check.
> > 
> > > understand 'keep private' you mentioned here.
> > 'keep private' means allow this kind of private memslot which does not
> > require protection from this private memory patch :)
> 
> Then I think such memory can be the shared part of memory of the
> KVM_MEM_PRIVATE memslot. As said above, this is initially supported :)
>
Sorry, maybe I didn't express it clearly.

As in the kvm_faultin_pfn_private(), 
static bool kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
				    struct kvm_page_fault *fault,
				    bool *is_private_pfn, int *r)
{
	int order;
	int mem_convert_type;
	struct kvm_memory_slot *slot = fault->slot;
	long pfn = kvm_memfd_get_pfn(slot, fault->gfn, &order);
	...
}
Currently, kvm_memfd_get_pfn() is called unconditionally.
However, if the backend of a private memslot is not memfd, and is device
fd for example, a different xxx_get_pfn() is required here.

Further, though mapped to a private gfn, it might be ok for QEMU to
access the device fd in hva-based way (or call it MMU access way, e.g.
read/write/mmap), it's desired that it could use the traditional to get
pfn without convert the range to a shared one.
pfn = __gfn_to_pfn_memslot(slot, fault->gfn, ...)
	|->addr = __gfn_to_hva_many (slot, gfn,...)
	|  pfn = hva_to_pfn (addr,...)


So, is it possible to recognize such kind of backends in KVM, and to get
the pfn in traditional way without converting them to shared?
e.g.
- specify KVM_MEM_PRIVATE_NONPROTECT to memory regions with such kind
of backends, or
- detect the fd type and check if get_pfn is provided. if no, go the
  traditional way.

Thanks
Yan

> > > > Reasons below:
> > > > 1. only memfd is supported in this patch set.
> > > > 2. qemu/host read/write to those private memslots backing up by devicefd may
> > > > not cause machine check.



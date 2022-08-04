Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CDD589911
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 10:13:04 +0200 (CEST)
Received: from localhost ([::1]:57638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJVyY-0002VI-QZ
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 04:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oJVpM-0004tB-Nz
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:03:33 -0400
Received: from mga02.intel.com ([134.134.136.20]:21182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oJVpK-0000V2-BE
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659600210; x=1691136210;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=n6vj1E+K6IGerPlEyIy+T8JA9iaBmJsVY3SC0cCq/5I=;
 b=TQya8axLc1SQrS901zHWItsI/efYIpjS8J19ESZ3UuDTPEl8VdHxc+8U
 4YsUlzCtakuduLmyZTuW42fC9BpoNAhi1telZ7mHQJI7b3R2/3UWwZoHr
 TKvvjab7ku/zmVA4Y/kaTTnruUB1cwRPJ18O5LPn43HFzSf4AiKan8/QI
 fEblBLf7qvFyMeOtBYFyEv2m3Mt4wDUhkDbeXgSWUcWuyvl9U0xfZfChv
 10xke+ZYr8Ql3MJsvyhpiuewwDEd2KD+D75/q6LIE+2jo49/RgtIOFYTB
 qtP+IleSrxiLWb5EZU/ErCDsJ6i9fwqFoZmv99pHEDdVTbexaT0iBUPeJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="276787785"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="276787785"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 01:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="631482938"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 04 Aug 2022 01:03:17 -0700
Date: Thu, 4 Aug 2022 15:58:30 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Wei Wang <wei.w.wang@linux.intel.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
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
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 11/14] KVM: Register/unregister the guest private
 memory regions
Message-ID: <20220804075830.GA645378@chaop.bj.intel.com>
References: <YtgrkXqP/GIi9ujZ@google.com>
 <45ae9f57-d595-f202-abb5-26a03a2ca131@linux.intel.com>
 <20220721092906.GA153288@chaop.bj.intel.com>
 <YtmT2irvgInX1kPp@google.com>
 <20220725130417.GA304216@chaop.bj.intel.com>
 <YuQ64RgWqdoAAGdY@google.com> <Yuh0ikhoh+tCK6VW@google.com>
 <YulTH7bL4MwT5v5K@google.com>
 <20220803094827.GA607465@chaop.bj.intel.com>
 <YuqZfPvRo+3GvLF1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuqZfPvRo+3GvLF1@google.com>
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 03, 2022 at 03:51:24PM +0000, Sean Christopherson wrote:
> On Wed, Aug 03, 2022, Chao Peng wrote:
> > On Tue, Aug 02, 2022 at 04:38:55PM +0000, Sean Christopherson wrote:
> > > On Tue, Aug 02, 2022, Sean Christopherson wrote:
> > > > I think we should avoid UNMAPPABLE even on the KVM side of things for the core
> > > > memslots functionality and instead be very literal, e.g.
> > > > 
> > > > 	KVM_HAS_FD_BASED_MEMSLOTS
> > > > 	KVM_MEM_FD_VALID
> > > > 
> > > > We'll still need KVM_HAS_USER_UNMAPPABLE_MEMORY, but it won't be tied directly to
> > > > the memslot.  Decoupling the two thingis will require a bit of extra work, but the
> > > > code impact should be quite small, e.g. explicitly query and propagate
> > > > MEMFILE_F_USER_INACCESSIBLE to kvm_memory_slot to track if a memslot can be private.
> > > > And unless I'm missing something, it won't require an additional memslot flag.
> > > > The biggest oddity (if we don't also add KVM_MEM_PRIVATE) is that KVM would
> > > > effectively ignore the hva for fd-based memslots for VM types that don't support
> > > > private memory, i.e. userspace can't opt out of using the fd-based backing, but that
> > > > doesn't seem like a deal breaker.
> > 
> > I actually love this idea. I don't mind adding extra code for potential
> > usage other than confidential VMs if we can have a workable solution for
> > it.
> > 
> > > 
> > > Hrm, but basing private memory on top of a generic FD_VALID would effectively require
> > > shared memory to use hva-based memslots for confidential VMs.  That'd yield a very
> > > weird API, e.g. non-confidential VMs could be backed entirely by fd-based memslots,
> > > but confidential VMs would be forced to use hva-based memslots.
> > 
> > It would work if we can treat userspace_addr as optional for
> > KVM_MEM_FD_VALID, e.g. userspace can opt in to decide whether needing
> > the mappable part or not for a regular VM and we can enforce KVM for
> > confidential VMs. But the u64 type of userspace_addr doesn't allow us to
> > express a 'null' value so sounds like we will end up needing another
> > flag anyway.
> > 
> > In concept, we could have three cofigurations here:
> >   1. hva-only: without any flag and use userspace_addr;
> >   2. fd-only:  another new flag is needed and use fd/offset;
> >   3. hva/fd mixed: both userspace_addr and fd/offset is effective.
> >      KVM_MEM_PRIVATE is a subset of it for confidential VMs. Not sure
> >      regular VM also wants this.
> 
> My mental model breaks things down slightly differently, though the end result is
> more or less the same. 
> 
> After this series, there will be two types of memory: private and "regular" (I'm
> trying to avoid "shared").  "Regular" memory is always hva-based (userspace_addr),
> and private always fd-based (fd+offset).
> 
> In the future, if we want to support fd-based memory for "regular" memory, then
> as you said we'd need to add a new flag, and a new fd+offset pair.
> 
> At that point, we'd have two new (relatively to current) flags:
> 
>   KVM_MEM_PRIVATE_FD_VALID
>   KVM_MEM_FD_VALID
> 
> along with two new pairs of fd+offset (private_* and "regular").  Mapping those
> to your above list:

I previously thought we could reuse the private_fd (name should be
changed) for regular VM as well so only need one pair of fd+offset, the
meaning of the fd can be decided by the flag. But introducing two pairs
of them may support extra usages like one fd for regular memory and
another private_fd for private memory, though unsure this is a useful
configuration.

>   
>   1.  Neither *_FD_VALID flag set.
>   2a. Both PRIVATE_FD_VALID and FD_VALID are set
>   2b. FD_VALID is set and the VM doesn't support private memory
>   3.  Only PRIVATE_FD_VALID is set (which private memory support in the VM).
> 
> Thus, "regular" VMs can't have a mix in a single memslot because they can't use
> private memory.
> 
> > There is no direct relationship between unmappable and fd-based since
> > even fd-based can also be mappable for regular VM?

Hmm, yes, for private memory we have special treatment in page fault
handler and that is not applied to regular VM.

> 
> Yep.
> 
> > > Ignore this idea for now.  If there's an actual use case for generic fd-based memory
> > > then we'll want a separate flag, fd, and offset, i.e. that support could be added
> > > independent of KVM_MEM_PRIVATE.
> > 
> > If we ignore this idea now (which I'm also fine), do you still think we
> > need change KVM_MEM_PRIVATE to KVM_MEM_USER_UNMAPPBLE?
> 
> Hmm, no.  After working through this, I think it's safe to say KVM_MEM_USER_UNMAPPABLE
> is bad name because we could end up with "regular" memory that's backed by an
> inaccessible (unmappable) file.
> 
> One alternative would be to call it KVM_MEM_PROTECTED.  That shouldn't cause
> problems for the known use of "private" (TDX and SNP), and it gives us a little
> wiggle room, e.g. if we ever get a use case where VMs can share memory that is
> otherwise protected.
> 
> That's a pretty big "if" though, and odds are good we'd need more memslot flags and
> fd+offset pairs to allow differentiating "private" vs. "protected-shared" without
> forcing userspace to punch holes in memslots, so I don't know that hedging now will
> buy us anything.
> 
> So I'd say that if people think KVM_MEM_PRIVATE brings additional and meaningful
> clarity over KVM_MEM_PROTECTECD, then lets go with PRIVATE.  But if PROTECTED is
> just as good, go with PROTECTED as it gives us a wee bit of wiggle room for the
> future.

Then I'd stay with PRIVATE.

> 
> Note, regardless of what name we settle on, I think it makes to do the
> KVM_PRIVATE_MEM_SLOTS => KVM_INTERNAL_MEM_SLOTS rename.

Agreed.

Chao


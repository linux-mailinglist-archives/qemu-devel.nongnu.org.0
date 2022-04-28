Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182515133D4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 14:36:04 +0200 (CEST)
Received: from localhost ([::1]:45434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk3NL-0004oY-8E
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 08:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nk3L0-00023J-0i
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:33:38 -0400
Received: from mga14.intel.com ([192.55.52.115]:41918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nk3Kx-0006L5-JE
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651149215; x=1682685215;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=JLTwnb6knAU2NJRTOD5Wxmiw692WpVrgjBsDWSNIg3I=;
 b=lQn1s6u8Iq4uDvAvfxLLK7t+GpngNIVi3nYGeaF2m3rQ6AQs8wLDDNN9
 u9nSd6LaHH4fAhe8Cq6OwaSoPF/BPHaHIeuDI4M2hXx8i8LU9sy+pxYN+
 RDk9qfOn29Kgaf0S6sDTmPRzXHbqFygg2QfDl7rM7bBN5bNJsAYil4dQ/
 geTrYrCZaBJeC8fENCUUhTgZ1fBGvPk9LZyYfcrfUgqNKCnrFwyMIrRof
 IN3C9Otmg30C3lbByShy4EZ799LExzmfRVUmIsCIJlmsFOfRhd8AtuwYJ
 89fAekUOzNoSHGNF/DsS1TU0LQo8/BlQZ/xxMTzen8QVuc50iky7tdbqe Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="266434080"
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; d="scan'208";a="266434080"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 05:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; d="scan'208";a="706037490"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2022 05:33:24 -0700
Date: Thu, 28 Apr 2022 20:29:52 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220428122952.GA10508@chaop.bj.intel.com>
References: <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
 <YksIQYdG41v3KWkr@google.com> <Ykslo2eo2eRXrpFR@google.com>
 <eefc3c74-acca-419c-8947-726ce2458446@www.fastmail.com>
 <Ykwbqv90C7+8K+Ao@google.com> <YkyEaYiL0BrDYcZv@google.com>
 <20220422105612.GB61987@chaop.bj.intel.com>
 <3b99f157-0f30-4b30-8399-dd659250ab8d@www.fastmail.com>
 <20220425134051.GA175928@chaop.bj.intel.com>
 <27616b2f-1eff-42ff-91e0-047f531639ea@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27616b2f-1eff-42ff-91e0-047f531639ea@www.fastmail.com>
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, the arch/x86 maintainers <x86@kernel.org>,
 Hugh Dickins <hughd@google.com>, Steven Price <steven.price@arm.com>,
 Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Michael Roth <michael.roth@amd.com>, Borislav Petkov <bp@alien8.de>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, Quentin Perret <qperret@google.com>,
 Sean Christopherson <seanjc@google.com>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux API <linux-api@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


+ Michael in case he has comment from SEV side.

On Mon, Apr 25, 2022 at 07:52:38AM -0700, Andy Lutomirski wrote:
> 
> 
> On Mon, Apr 25, 2022, at 6:40 AM, Chao Peng wrote:
> > On Sun, Apr 24, 2022 at 09:59:37AM -0700, Andy Lutomirski wrote:
> >> 
> 
> >> 
> >> 2. Bind the memfile to a VM (or at least to a VM technology).  Now it's in the initial state appropriate for that VM.
> >> 
> >> For TDX, this completely bypasses the cases where the data is prepopulated and TDX can't handle it cleanly.  For SEV, it bypasses a situation in which data might be written to the memory before we find out whether that data will be unreclaimable or unmovable.
> >
> > This sounds a more strict rule to avoid semantics unclear.
> >
> > So userspace needs to know what excatly happens for a 'bind' operation.
> > This is different when binds to different technologies. E.g. for SEV, it
> > may imply after this call, the memfile can be accessed (through mmap or
> > what ever) from userspace, while for current TDX this should be not allowed.
> 
> I think this is actually a good thing.  While SEV, TDX, pKVM, etc achieve similar goals and have broadly similar ways of achieving them, they really are different, and having userspace be aware of the differences seems okay to me.
> 
> (Although I don't think that allowing userspace to mmap SEV shared pages is particularly wise -- it will result in faults or cache incoherence depending on the variant of SEV in use.)
> 
> >
> > And I feel we still need a third flow/operation to indicate the
> > completion of the initialization on the memfile before the guest's 
> > first-time launch. SEV needs to check previous mmap-ed areas are munmap-ed
> > and prevent future userspace access. After this point, then the memfile
> > becomes truely private fd.
> 
> Even that is technology-dependent.  For TDX, this operation doesn't really exist.  For SEV, I'm not sure (I haven't read the specs in nearly enough detail).  For pKVM, I guess it does exist and isn't quite the same as a shared->private conversion.
> 
> Maybe this could be generalized a bit as an operation "measure and make private" that would be supported by the technologies for which it's useful.

Then I think we need callback instead of static flag field. Backing
store implements this callback and consumers change the flags
dynamically with this callback. This implements kind of state machine
flow.

> 
> 
> >
> >> 
> >> 
> >> ----------------------------------------------
> >> 
> >> Now I have a question, since I don't think anyone has really answered it: how does this all work with SEV- or pKVM-like technologies in which private and shared pages share the same address space?  I sounds like you're proposing to have a big memfile that contains private and shared pages and to use that same memfile as pages are converted back and forth.  IO and even real physical DMA could be done on that memfile.  Am I understanding correctly?
> >
> > For TDX case, and probably SEV as well, this memfile contains private memory
> > only. But this design at least makes it possible for usage cases like
> > pKVM which wants both private/shared memory in the same memfile and rely
> > on other ways like mmap/munmap or mprotect to toggle private/shared instead
> > of fallocate/hole punching.
> 
> Hmm.  Then we still need some way to get KVM to generate the correct SEV pagetables.  For TDX, there are private memslots and shared memslots, and they can overlap.  If they overlap and both contain valid pages at the same address, then the results may not be what the guest-side ABI expects, but everything will work.  So, when a single logical guest page transitions between shared and private, no change to the memslots is needed.  For SEV, this is not the case: everything is in one set of pagetables, and there isn't a natural way to resolve overlaps.

I don't see SEV has problem. Note for all the cases, both private/shared
memory are in the same memslot. For a given GPA, if there is no private
page, then shared page will be used to establish KVM pagetables, so this
can guarantee there is no overlaps.

> 
> If the memslot code becomes efficient enough, then the memslots could be fragmented.  Or the memfile could support private and shared data in the same memslot.  And if pKVM does this, I don't see why SEV couldn't also do it and hopefully reuse the same code.

For pKVM, that might be the case. For SEV, I don't think we require
private/shared data in the same memfile. The same model that works for
TDX should also work for SEV. Or maybe I misunderstood something here?

> 
> >
> >> 
> >> If so, I think this makes sense, but I'm wondering if the actual memslot setup should be different.  For TDX, private memory lives in a logically separate memslot space.  For SEV and pKVM, it doesn't.  I assume the API can reflect this straightforwardly.
> >
> > I believe so. The flow should be similar but we do need pass different
> > flags during the 'bind' to the backing store for different usages. That
> > should be some new flags for pKVM but the callbacks (API here) between
> > memfile_notifile and its consumers can be reused.
> 
> And also some different flag in the operation that installs the fd as a memslot?
> 
> >
> >> 
> >> And the corresponding TDX question: is the intent still that shared pages aren't allowed at all in a TDX memfile?  If so, that would be the most direct mapping to what the hardware actually does.
> >
> > Exactly. TDX will still use fallocate/hole punching to turn on/off the
> > private page. Once off, the traditional shared page will become
> > effective in KVM.
> 
> Works for me.
> 
> For what it's worth, I still think it should be fine to land all the TDX memfile bits upstream as long as we're confident that SEV, pKVM, etc can be added on without issues.
> 
> I think we can increase confidence in this by either getting one other technology's maintainers to get far enough along in the design to be confident

AFAICS, SEV shouldn't have any problem, But would like to see AMD people
can comment. For pKVM, definitely need more work, but isn't totally
undoable. Also would be good if pKVM people can comment.

Thanks,
Chao

> and/or by having a pure-kernel-software implementation that serves as a testbed.  For the latter, maybe it could support two different models with little overhead:
> 
> Pure software "interleaved" model: pages are shared or private and a hypercall converts them.  The access mode is entirely determined by the state programmed by hypercall.  I think this is essentially what Vishal implemented, but with the "HACK" replaced by something permanent and (if they're not already in the series) appropriate access checks implemented to actually protect the private memory.
> 
> Pure software "separate" mode: one GPA bit is set aside as the shared vs private bit.  The normal memslots are restricted to the shared half of GPA space.  Private memslots use the private half.  This works a lot like TDX.  This would be new code.  We don't *really* need this for testing, since TDX itself exercises the same programming model, but it would let people without TDX hardware exercise the interesting bits of the memory management.
> 
> Paolo, etc: what do you think?
> 
> >
> > Chao
> >> 
> >> --Andy


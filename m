Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5578A50B654
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:44:15 +0200 (CEST)
Received: from localhost ([::1]:58826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrhu-0003NB-EJ
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nhqxr-00029i-Al
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:56:39 -0400
Received: from mga04.intel.com ([192.55.52.120]:38398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nhqxl-0002FE-PP
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650624993; x=1682160993;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=rJVd1tK/Yiyruq2AWcvjVHLhacTHQWBMSusJV1SX9dM=;
 b=P2s8AGydxmZssBgD99kC/APi+4LyvTKrnNSCIgSPtYTL7yxTF6AttsN+
 C88JRWzYvJmH7cYQs4BtJi5y1GbAt3zG0wjiB6PYprc2VUnJaYNwJgid/
 DgPF9x4qFHkoH8rJM8xT9lAC1idVaMmte4LVbzm7p88pUGKmCqYOhO1hX
 B1p6raZu34O7uDLKAu0WcyxoYRYuBkAlNYF0KUa8L/UYKGXCry5mDa3Fb
 EAP0vHh+5+xe0S83u2AoG+2bxFWoYBIrWWRq+9j4WE6eVcN1cm2mb5hAj
 DjCpr33euOyNvMOMQ9PK7JQsfzGzNK00p3k702/Kf5yTLG73grjm8d54s g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="263497185"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="263497185"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 03:56:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="703511229"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2022 03:56:21 -0700
Date: Fri, 22 Apr 2022 18:56:12 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220422105612.GB61987@chaop.bj.intel.com>
References: <YkQzfjgTQaDd2E2T@google.com> <YkSaUQX89ZEojsQb@google.com>
 <80aad2f9-9612-4e87-a27a-755d3fa97c92@www.fastmail.com>
 <YkcTTY4YjQs5BRhE@google.com>
 <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
 <YksIQYdG41v3KWkr@google.com> <Ykslo2eo2eRXrpFR@google.com>
 <eefc3c74-acca-419c-8947-726ce2458446@www.fastmail.com>
 <Ykwbqv90C7+8K+Ao@google.com> <YkyEaYiL0BrDYcZv@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkyEaYiL0BrDYcZv@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, the arch/x86 maintainers <x86@kernel.org>,
 Hugh Dickins <hughd@google.com>, Steven Price <steven.price@arm.com>,
 Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, Quentin Perret <qperret@google.com>,
 Linux API <linux-api@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 05, 2022 at 06:03:21PM +0000, Sean Christopherson wrote:
> On Tue, Apr 05, 2022, Quentin Perret wrote:
> > On Monday 04 Apr 2022 at 15:04:17 (-0700), Andy Lutomirski wrote:
> > > >>  - it can be very useful for protected VMs to do shared=>private
> > > >>    conversions. Think of a VM receiving some data from the host in a
> > > >>    shared buffer, and then it wants to operate on that buffer without
> > > >>    risking to leak confidential informations in a transient state. In
> > > >>    that case the most logical thing to do is to convert the buffer back
> > > >>    to private, do whatever needs to be done on that buffer (decrypting a
> > > >>    frame, ...), and then share it back with the host to consume it;
> > > >
> > > > If performance is a motivation, why would the guest want to do two
> > > > conversions instead of just doing internal memcpy() to/from a private
> > > > page?  I would be quite surprised if multiple exits and TLB shootdowns is
> > > > actually faster, especially at any kind of scale where zapping stage-2
> > > > PTEs will cause lock contention and IPIs.
> > > 
> > > I don't know the numbers or all the details, but this is arm64, which is a
> > > rather better architecture than x86 in this regard.  So maybe it's not so
> > > bad, at least in very simple cases, ignoring all implementation details.
> > > (But see below.)  Also the systems in question tend to have fewer CPUs than
> > > some of the massive x86 systems out there.
> > 
> > Yep. I can try and do some measurements if that's really necessary, but
> > I'm really convinced the cost of the TLBI for the shared->private
> > conversion is going to be significantly smaller than the cost of memcpy
> > the buffer twice in the guest for us.
> 
> It's not just the TLB shootdown, the VM-Exits aren't free.   And barring non-trivial
> improvements to KVM's MMU, e.g. sharding of mmu_lock, modifying the page tables will
> block all other updates and MMU operations.  Taking mmu_lock for read, should arm64
> ever convert to a rwlock, is not an option because KVM needs to block other
> conversions to avoid races.
> 
> Hmm, though batching multiple pages into a single request would mitigate most of
> the overhead.
> 
> > There are variations of that idea: e.g. allow userspace to mmap the
> > entire private fd but w/o taking a reference on pages mapped with
> > PROT_NONE. And then the VMM can use mprotect() in response to
> > share/unshare requests. I think Marc liked that idea as it keeps the
> > userspace API closer to normal KVM -- there actually is a
> > straightforward gpa->hva relation. Not sure how much that would impact
> > the implementation at this point.
> > 
> > For the shared=>private conversion, this would be something like so:
> > 
> >  - the guest issues a hypercall to unshare a page;
> > 
> >  - the hypervisor forwards the request to the host;
> > 
> >  - the host kernel forwards the request to userspace;
> > 
> >  - userspace then munmap()s the shared page;
> > 
> >  - KVM then tries to take a reference to the page. If it succeeds, it
> >    re-enters the guest with a flag of some sort saying that the share
> >    succeeded, and the hypervisor will adjust pgtables accordingly. If
> >    KVM failed to take a reference, it flags this and the hypervisor will
> >    be responsible for communicating that back to the guest. This means
> >    the guest must handle failures (possibly fatal).
> > 
> > (There are probably many ways in which we can optimize this, e.g. by
> > having the host proactively munmap() pages it no longer needs so that
> > the unshare hypercall from the guest doesn't need to exit all the way
> > back to host userspace.)
> 
> ...
> 
> > > Maybe there could be a special mode for the private memory fds in which
> > > specific pages are marked as "managed by this fd but actually shared".
> > > pread() and pwrite() would work on those pages, but not mmap().  (Or maybe
> > > mmap() but the resulting mappings would not permit GUP.)
> 
> Unless I misunderstand what you intend by pread()/pwrite(), I think we'd need to
> allow mmap(), otherwise e.g. uaccess from the kernel wouldn't work.
> 
> > > And transitioning them would be a special operation on the fd that is
> > > specific to pKVM and wouldn't work on TDX or SEV.
> 
> To keep things feature agnostic (IMO, baking TDX vs SEV vs pKVM info into private-fd
> is a really bad idea), this could be handled by adding a flag and/or callback into
> the notifier/client stating whether or not it supports mapping a private-fd, and then
> mapping would be allowed if and only if all consumers support/allow mapping.
> 
> > > Hmm.  Sean and Chao, are we making a bit of a mistake by making these fds
> > > technology-agnostic?  That is, would we want to distinguish between a TDX
> > > backing fd, a SEV backing fd, a software-based backing fd, etc?  API-wise
> > > this could work by requiring the fd to be bound to a KVM VM instance and
> > > possibly even configured a bit before any other operations would be
> > > allowed.
> 
> I really don't want to distinguish between between each exact feature, but I've
> no objection to adding flags/callbacks to track specific properties of the
> downstream consumers, e.g. "can this memory be accessed by userspace" is a fine
> abstraction.  It also scales to multiple consumers (see above).

Great thanks for the discussions. I summarized the requirements/gaps and the
potential changes for next step. Please help to review.


Terminologies:
--------------
  - memory conversion: the action of converting guest memory between private
    and shared.
  - explicit conversion: an enlightened guest uses a hypercall to explicitly
    request a memory conversion to VMM.
  - implicit conversion: the conversion when VMM reacts to a page fault due
    to different guest/host memory attributes (private/shared).
  - destructive conversion: the memory content is lost/destroyed during
    conversion.
  - non-destructive conversion: the memory content is preserved during
    conversion.


Requirements & Gaps
-------------------------------------
  - Confidential computing(CC): TDX/SEV/CCA
    * Need support both explicit/implicit conversions.
    * Need support only destructive conversion at runtime.
    * The current patch should just work, but prefer to have pre-boot guest
      payload/firmware population into private memory for performance.

  - pKVM
    * Support explicit conversion only. Hard to achieve implicit conversion,
      does not record the guest access info (private/shared) in page fault,
      also makes little sense.
    * Expect to support non-destructive conversion at runtime. Additionally
      in-place conversion (the underlying physical page is unchanged) is
      desirable since copy is not disirable. The current destructive conversion
      does not fit well.
    * The current callbacks between mm/KVM is useful and reusable for pKVM.
    * Pre-boot guest payload population is nice to have.


Change Proposal
---------------
Since there are some divergences for pKVM from CC usages and at this time looks
whether we will and how we will support pKVM with this private memory patchset
is still not quite clear, so this proposal does not imply certain detailed pKVM
implementation. But from the API level, we want this can be possible to be future
extended for pKVM or other potential usages.

  - No new user APIs introduced for memory backing store, e.g. remove the
    current MFD_INACCESSIBLE. This info will be communicated from memfile_notifier
    consumers to backing store via the new 'flag' field in memfile_notifier
    described below. At creation time, the fd is normal shared fd. At rumtime CC
    usages will keep using current fallocate/FALLOC_FL_PUNCH_HOLE to do the
    conversion, but pKVM may also possible use a different way (e.g. rely on
    mmap/munmap or mprotect as discussed). These are all not new APIs anyway.

  - Add a flag to memfile_notifier so its consumers can state the requirements.

        struct memfile_notifier {
                struct list_head list;
                unsigned long flags;     /* consumer states its requirements here */
                struct memfile_notifier_ops *ops; /* future function may also extend ops when necessary */
        };

    For current CC usage, we can define and set below flags from KVM.

        /* memfile notifier flags */
        #define MFN_F_USER_INACCESSIBLE   0x0001  /* memory allocated in the file is inaccessible from userspace (e.g. read/write/mmap) */
        #define MFN_F_UNMOVABLE           0x0002  /* memory allocated in the file is unmovable */
        #define MFN_F_UNRECLAIMABLE       0x0003  /* memory allocated in the file is unreclaimable (e.g. via kswapd or any other pathes) */

    When memfile_notifier is being registered, memfile_register_notifier will
    need check these flags. E.g. for MFN_F_USER_INACCESSIBLE, it fails when
    previous mmap-ed mapping exists on the fd (I'm still unclear on how to do
    this). When multiple consumers are supported it also need check all
    registered consumers to see if any conflict (e.g. all consumers should have
    MFN_F_USER_INACCESSIBLE set). Only when the register succeeds, the fd is
    converted into a private fd, before that, the fd is just a normal (shared)
    one. During this conversion, the previous data is preserved so you can put
    some initial data in guest pages (whether the architecture allows this is
    architecture-specific and out of the scope of this patch).

  - Pre-boot guest payload populating is done by normal mmap/munmap on the fd
    before it's converted into private fd when KVM registers itself to the
    backing store.

  - Implicit conversion: maybe it's worthy to discuss again: how about totally
    remove implicit converion support? TDX should be OK, unsure SEV/CCA. pKVM
    should be happy to see. Removing also makes the work much easier and prevents
    guest bugs/unitended behaviors early. If it turns out that there is reason to
    keep it, then for pKVM we can make it an optional feature (e.g. via a new
    module param). But that can be added when pKVM really gets supported.

  - non-destructive in-place conversion: Out of scope for this series, pKVM can
    invent other pKVM specific interfaces (either extend memfile_notifier and using
    mmap/mprotect or use totaly different ways like access through vmfd as Sean
    suggested).

Thanks,
Chao


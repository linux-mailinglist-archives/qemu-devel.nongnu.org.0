Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F9854C498
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 11:25:51 +0200 (CEST)
Received: from localhost ([::1]:60246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1PHa-0003U7-Qq
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 05:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o1PDZ-00010k-5K
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:21:41 -0400
Received: from mga12.intel.com ([192.55.52.136]:1590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o1PDU-0003YX-FM
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:21:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655284896; x=1686820896;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=35w+G+fbWucz8txfjhA1uFhTpuj87R9d/qHcnOEmPeM=;
 b=gu06UQ9Zkj4KYhkN0fQn6WnWtUS0nw4s9bDeBylitZYmz5CIFRJoEKb1
 vzWNw3yK50YoVv3HRMrdCkgO4eC9djhRHQAj5xku0yGHJyMX2BvEapoTV
 Tbs2SusilNC9RyhlQNww4f1WUc0furGgagxVaTLadInNQOp/yEy5E+Bqz
 PeRLUvrT+uOzFKCvKx/1xWvdJCV2YVc7LNObL0wfIxyhQ8+gxP9zM6xW4
 nR5UwoYnAi2yeQHk/xSXLulC7bjETiij6NfUtUj/qYrP841yWHaMDSdf3
 PuuQuf8QUVZRd/tb95eoEWo2cxaTJ/J3k2nEcU7PFu2RPP6p4x8aBYXNp Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="258747512"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="258747512"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 02:21:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="583119186"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 15 Jun 2022 02:21:21 -0700
Date: Wed, 15 Jun 2022 17:17:59 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Vishal Annapurve <vannapurve@google.com>,
 Marc Orr <marcorr@google.com>, kvm list <kvm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86 <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Dave Hansen <dave.hansen@intel.com>,
 Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 0/8] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220615091759.GB1823790@chaop.bj.intel.com>
References: <CAGtprH_83CEC0U-cBR2FzHsxbwbGn0QJ87WFNOEet8sineOcbQ@mail.gmail.com>
 <20220607065749.GA1513445@chaop.bj.intel.com>
 <CAA03e5H_vOQS-qdZgacnmqP5T5jJLnEfm44yfRzJQ2KVu0Br+Q@mail.gmail.com>
 <20220608021820.GA1548172@chaop.bj.intel.com>
 <CAGtprH8xyf07jMN7ubTC__BvDj+z41uVGRiCJ7Rc5cv3KWg03w@mail.gmail.com>
 <YqJYEheLiGI4KqXF@google.com>
 <20220614072800.GB1783435@chaop.bj.intel.com>
 <CALCETrWw=Q=1AKW0Jcj3ZGscjyjDJXAjuxOnQx_sabQ6ZtS-wg@mail.gmail.com>
 <Yqjcx6u0KJcJuZfI@google.com>
 <CALCETrUdGoZ2yUnNGbxJ-Xr3KD7QhTi-ddhS8AUMjFyJM5pDfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrUdGoZ2yUnNGbxJ-Xr3KD7QhTi-ddhS8AUMjFyJM5pDfA@mail.gmail.com>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 14, 2022 at 01:59:41PM -0700, Andy Lutomirski wrote:
> On Tue, Jun 14, 2022 at 12:09 PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Tue, Jun 14, 2022, Andy Lutomirski wrote:
> > > On Tue, Jun 14, 2022 at 12:32 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > > >
> > > > On Thu, Jun 09, 2022 at 08:29:06PM +0000, Sean Christopherson wrote:
> > > > > On Wed, Jun 08, 2022, Vishal Annapurve wrote:
> > > > >
> > > > > One argument is that userspace can simply rely on cgroups to detect misbehaving
> > > > > guests, but (a) those types of OOMs will be a nightmare to debug and (b) an OOM
> > > > > kill from the host is typically considered a _host_ issue and will be treated as
> > > > > a missed SLO.
> > > > >
> > > > > An idea for handling this in the kernel without too much complexity would be to
> > > > > add F_SEAL_FAULT_ALLOCATIONS (terrible name) that would prevent page faults from
> > > > > allocating pages, i.e. holes can only be filled by an explicit fallocate().  Minor
> > > > > faults, e.g. due to NUMA balancing stupidity, and major faults due to swap would
> > > > > still work, but writes to previously unreserved/unallocated memory would get a
> > > > > SIGSEGV on something it has mapped.  That would allow the userspace VMM to prevent
> > > > > unintentional allocations without having to coordinate unmapping/remapping across
> > > > > multiple processes.
> > > >
> > > > Since this is mainly for shared memory and the motivation is catching
> > > > misbehaved access, can we use mprotect(PROT_NONE) for this? We can mark
> > > > those range backed by private fd as PROT_NONE during the conversion so
> > > > subsequence misbehaved accesses will be blocked instead of causing double
> > > > allocation silently.
> >
> > PROT_NONE, a.k.a. mprotect(), has the same vma downsides as munmap().

Yes, right.

> >
> > > This patch series is fairly close to implementing a rather more
> > > efficient solution.  I'm not familiar enough with hypervisor userspace
> > > to really know if this would work, but:
> > >
> > > What if shared guest memory could also be file-backed, either in the
> > > same fd or with a second fd covering the shared portion of a memslot?
> > > This would allow changes to the backing store (punching holes, etc) to
> > > be some without mmap_lock or host-userspace TLB flushes?  Depending on
> > > what the guest is doing with its shared memory, userspace might need
> > > the memory mapped or it might not.
> >
> > That's what I'm angling for with the F_SEAL_FAULT_ALLOCATIONS idea.  The issue,
> > unless I'm misreading code, is that punching a hole in the shared memory backing
> > store doesn't prevent reallocating that hole on fault, i.e. a helper process that
> > keeps a valid mapping of guest shared memory can silently fill the hole.
> >
> > What we're hoping to achieve is a way to prevent allocating memory without a very
> > explicit action from userspace, e.g. fallocate().
> 
> Ah, I misunderstood.  I thought your goal was to mmap it and prevent
> page faults from allocating.

I think we still need the mmap, but want to prevent allocating when
userspace touches previously mmaped area that has never filled the page.
I don't have clear answer if other operations like read/write should be
also prevented (probably yes). And only after an explicit fallocate() to
allocate the page these operations would act normally.

> 
> It is indeed the case (and has been since before quite a few of us
> were born) that a hole in a sparse file is logically just a bunch of
> zeros.  A way to make a file for which a hole is an actual hole seems
> like it would solve this problem nicely.  It could also be solved more
> specifically for KVM by making sure that the private/shared mode that
> userspace programs is strict enough to prevent accidental allocations
> -- if a GPA is definitively private, shared, neither, or (potentially,
> on TDX only) both, then a page that *isn't* shared will never be
> accidentally allocated by KVM.

KVM is clever enough to not allocate since it knows a GPA is shared or
not. This case it's the host userspace that can cause the allocating and
is too complex to check on every access from guest.

> If the shared backing is not mmapped,
> it also won't be accidentally allocated by host userspace on a stray
> or careless write.

As said above, mmap is still prefered, otherwise too many changes are
needed for usespace VMM.

Thanks,
Chao
> 
> 
> --Andy


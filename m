Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551BF5420BF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 04:23:23 +0200 (CEST)
Received: from localhost ([::1]:32858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nylLu-00083O-0J
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 22:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nylKd-0007NM-62
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 22:22:03 -0400
Received: from mga02.intel.com ([134.134.136.20]:3071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nylKW-0000fl-Km
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 22:21:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654654916; x=1686190916;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=qzLzlpXmYtyfLnr9kD61/kS6Q6YUitGZU8+jgBaVRi8=;
 b=SrAtPkYEpbBrGe4L3VpDTrb/8tH5/r30BrRgje3FQKriPpwo+CyowRES
 shA0F2QiLbNrguJt2TA+GmW9GWkYqWeSs1GUNKkDNAopTUW3miGd0NKxq
 DdifFcTsCiy2+qvJFkRdCRvhlZtX+x3VUPZgOfdxkiMoPpPHdCKu2yf35
 HsgzHIkkW4bBM8GnBEf4rs1/NA0OF30eCWtvIF3M96pB/PE0BGvLDIz4l
 UiGrLp7DEPnUym8fU6X0H2Rsl1tp8JvXEeprUNvF7m0zgaJEOXwSxWRL5
 55C5yBfbOEbA0R1w1UCoTKOy5l2q6UG3D/vGjEPeUrHO3+7zNMZd8nrgc Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="265502543"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="265502543"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 19:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="579856828"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 07 Jun 2022 19:21:44 -0700
Date: Wed, 8 Jun 2022 10:18:20 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Marc Orr <marcorr@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>,
 kvm list <kvm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
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
 Andy Lutomirski <luto@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 0/8] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220608021820.GA1548172@chaop.bj.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <CAGtprH_83CEC0U-cBR2FzHsxbwbGn0QJ87WFNOEet8sineOcbQ@mail.gmail.com>
 <20220607065749.GA1513445@chaop.bj.intel.com>
 <CAA03e5H_vOQS-qdZgacnmqP5T5jJLnEfm44yfRzJQ2KVu0Br+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA03e5H_vOQS-qdZgacnmqP5T5jJLnEfm44yfRzJQ2KVu0Br+Q@mail.gmail.com>
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

On Tue, Jun 07, 2022 at 05:55:46PM -0700, Marc Orr wrote:
> On Tue, Jun 7, 2022 at 12:01 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >
> > On Mon, Jun 06, 2022 at 01:09:50PM -0700, Vishal Annapurve wrote:
> > > >
> > > > Private memory map/unmap and conversion
> > > > ---------------------------------------
> > > > Userspace's map/unmap operations are done by fallocate() ioctl on the
> > > > backing store fd.
> > > >   - map: default fallocate() with mode=0.
> > > >   - unmap: fallocate() with FALLOC_FL_PUNCH_HOLE.
> > > > The map/unmap will trigger above memfile_notifier_ops to let KVM map/unmap
> > > > secondary MMU page tables.
> > > >
> > > ....
> > > >    QEMU: https://github.com/chao-p/qemu/tree/privmem-v6
> > > >
> > > > An example QEMU command line for TDX test:
> > > > -object tdx-guest,id=tdx \
> > > > -object memory-backend-memfd-private,id=ram1,size=2G \
> > > > -machine q35,kvm-type=tdx,pic=no,kernel_irqchip=split,memory-encryption=tdx,memory-backend=ram1
> > > >
> > >
> > > There should be more discussion around double allocation scenarios
> > > when using the private fd approach. A malicious guest or buggy
> > > userspace VMM can cause physical memory getting allocated for both
> > > shared (memory accessible from host) and private fds backing the guest
> > > memory.
> > > Userspace VMM will need to unback the shared guest memory while
> > > handling the conversion from shared to private in order to prevent
> > > double allocation even with malicious guests or bugs in userspace VMM.
> >
> > I don't know how malicious guest can cause that. The initial design of
> > this serie is to put the private/shared memory into two different
> > address spaces and gives usersapce VMM the flexibility to convert
> > between the two. It can choose respect the guest conversion request or
> > not.
> 
> For example, the guest could maliciously give a device driver a
> private page so that a host-side virtual device will blindly write the
> private page.

With this patch series, it's actually even not possible for userspace VMM
to allocate private page by a direct write, it's basically unmapped from
there. If it really wants to, it should so something special, by intention,
that's basically the conversion, which we should allow.

> 
> > It's possible for a usrspace VMM to cause double allocation if it fails
> > to call the unback operation during the conversion, this may be a bug
> > or not. Double allocation may not be a wrong thing, even in conception.
> > At least TDX allows you to use half shared half private in guest, means
> > both shared/private can be effective. Unbacking the memory is just the
> > current QEMU implementation choice.
> 
> Right. But the idea is that this patch series should accommodate all
> of the CVM architectures. Or at least that's what I know was
> envisioned last time we discussed this topic for SNP [*].

AFAICS, this series should work for both TDX and SNP, and other CVM
architectures. I don't see where TDX can work but SNP cannot, or I
missed something here?

> 
> Regardless, it's important to ensure that the VM respects its memory
> budget. For example, within Google, we run VMs inside of containers.
> So if we double allocate we're going to OOM. This seems acceptable for
> an early version of CVMs. But ultimately, I think we need a more
> robust way to ensure that the VM operates within its memory container.
> Otherwise, the OOM is going to be hard to diagnose and distinguish
> from a real OOM.

Thanks for bringing this up. But in my mind I still think userspace VMM
can do and it's its responsibility to guarantee that, if that is hard
required. By design, userspace VMM is the decision-maker for page
conversion and has all the necessary information to know which page is
shared/private. It also has the necessary knobs to allocate/free the
physical pages for guest memory. Definitely, we should make userspace
VMM more robust.

Chao
> 
> [*] https://lore.kernel.org/all/20210820155918.7518-1-brijesh.singh@amd.com/
> 
> >
> > Chao
> > >
> > > Options to unback shared guest memory seem to be:
> > > 1) madvise(.., MADV_DONTNEED/MADV_REMOVE) - This option won't stop
> > > kernel from backing the shared memory on subsequent write accesses
> > > 2) fallocate(..., FALLOC_FL_PUNCH_HOLE...) - For file backed shared
> > > guest memory, this option still is similar to madvice since this would
> > > still allow shared memory to get backed on write accesses
> > > 3) munmap - This would give away the contiguous virtual memory region
> > > reservation with holes in the guest backing memory, which might make
> > > guest memory management difficult.
> > > 4) mprotect(... PROT_NONE) - This would keep the virtual memory
> > > address range backing the guest memory preserved
> > >
> > > ram_block_discard_range_fd from reference implementation:
> > > https://github.com/chao-p/qemu/tree/privmem-v6 seems to be relying on
> > > fallocate/madvise.
> > >
> > > Any thoughts/suggestions around better ways to unback the shared
> > > memory in order to avoid double allocation scenarios?
> 
> I agree with Vishal. I think this patch set is making great progress.
> But the double allocation scenario seems like a high-level design
> issue that warrants more discussion.


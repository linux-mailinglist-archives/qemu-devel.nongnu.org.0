Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C15A604BEE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:43:59 +0200 (CEST)
Received: from localhost ([::1]:46240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBEc-00009f-2K
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1olB3n-00059y-M1
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:32:57 -0400
Received: from mga06b.intel.com ([134.134.136.31]:34634 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1olB3k-0004cI-BT
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666193564; x=1697729564;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UHIaR+J+RVnHQe0Epq5Q2DkYje1xjf/qW1B/YS+Op6c=;
 b=cZMutjcqIJKsaeDv+L4greePSsUsXfi1fcH5xcQf9Jm6lOaPcngSFoRR
 Szx+AA2NEternjmPmjVGcvW621/qljJvI8IBCT1Kgyvwc7+6iLrSWd0kb
 OBWaGUtJPanWnYjQnZviuwM48YDhOU9BaSOP6mm9pJP8JwSYOPGOsn6q4
 ttdjiRBa4B3PRkQdu9FPhXYF7oap5i6pavZmT4eQ8m+WenkOGLadRyEyw
 KGgF10HIIyOwdf74pq3Z3cOqlJt08cZeKX2xJ2CwMPkxsUKhaH9VmnPPc
 bbKez8xjMU0msGFi+bCHCZzfGXcu1eVPymHH1CnN5X7VdwsN7HGp20AY/ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="368497079"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="368497079"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 08:32:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="607149381"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="607149381"
Received: from selvaku-mobl.ger.corp.intel.com (HELO box.shutemov.name)
 ([10.249.38.73])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 08:32:28 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
 id DEF33106C73; Wed, 19 Oct 2022 18:32:25 +0300 (+03)
Date: Wed, 19 Oct 2022 18:32:25 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: "Gupta, Pankaj" <pankaj.gupta@amd.com>, Vlastimil Babka <vbabka@suse.cz>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
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
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
Message-ID: <20221019153225.njvg45glehlnjgc7@box.shutemov.name>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <de680280-f6b1-9337-2ae4-4b2faf2b823b@suse.cz>
 <20221017161955.t4gditaztbwijgcn@box.shutemov.name>
 <c63ad0cd-d517-0f1e-59e9-927d8ae15a1a@amd.com>
 <20221017215640.hobzcz47es7dq2bi@box.shutemov.name>
 <CAGtprH8xEdgATjQdhi2b_KqUuSOZHUM-Lh+O-ZtcFKbHf2_75g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGtprH8xEdgATjQdhi2b_KqUuSOZHUM-Lh+O-ZtcFKbHf2_75g@mail.gmail.com>
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 18, 2022 at 07:12:10PM +0530, Vishal Annapurve wrote:
> On Tue, Oct 18, 2022 at 3:27 AM Kirill A . Shutemov
> <kirill.shutemov@linux.intel.com> wrote:
> >
> > On Mon, Oct 17, 2022 at 06:39:06PM +0200, Gupta, Pankaj wrote:
> > > On 10/17/2022 6:19 PM, Kirill A . Shutemov wrote:
> > > > On Mon, Oct 17, 2022 at 03:00:21PM +0200, Vlastimil Babka wrote:
> > > > > On 9/15/22 16:29, Chao Peng wrote:
> > > > > > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > > > > >
> > > > > > KVM can use memfd-provided memory for guest memory. For normal userspace
> > > > > > accessible memory, KVM userspace (e.g. QEMU) mmaps the memfd into its
> > > > > > virtual address space and then tells KVM to use the virtual address to
> > > > > > setup the mapping in the secondary page table (e.g. EPT).
> > > > > >
> > > > > > With confidential computing technologies like Intel TDX, the
> > > > > > memfd-provided memory may be encrypted with special key for special
> > > > > > software domain (e.g. KVM guest) and is not expected to be directly
> > > > > > accessed by userspace. Precisely, userspace access to such encrypted
> > > > > > memory may lead to host crash so it should be prevented.
> > > > > >
> > > > > > This patch introduces userspace inaccessible memfd (created with
> > > > > > MFD_INACCESSIBLE). Its memory is inaccessible from userspace through
> > > > > > ordinary MMU access (e.g. read/write/mmap) but can be accessed via
> > > > > > in-kernel interface so KVM can directly interact with core-mm without
> > > > > > the need to map the memory into KVM userspace.
> > > > > >
> > > > > > It provides semantics required for KVM guest private(encrypted) memory
> > > > > > support that a file descriptor with this flag set is going to be used as
> > > > > > the source of guest memory in confidential computing environments such
> > > > > > as Intel TDX/AMD SEV.
> > > > > >
> > > > > > KVM userspace is still in charge of the lifecycle of the memfd. It
> > > > > > should pass the opened fd to KVM. KVM uses the kernel APIs newly added
> > > > > > in this patch to obtain the physical memory address and then populate
> > > > > > the secondary page table entries.
> > > > > >
> > > > > > The userspace inaccessible memfd can be fallocate-ed and hole-punched
> > > > > > from userspace. When hole-punching happens, KVM can get notified through
> > > > > > inaccessible_notifier it then gets chance to remove any mapped entries
> > > > > > of the range in the secondary page tables.
> > > > > >
> > > > > > The userspace inaccessible memfd itself is implemented as a shim layer
> > > > > > on top of real memory file systems like tmpfs/hugetlbfs but this patch
> > > > > > only implemented tmpfs. The allocated memory is currently marked as
> > > > > > unmovable and unevictable, this is required for current confidential
> > > > > > usage. But in future this might be changed.
> > > > > >
> > > > > > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > > > > > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > > > > > ---
> > > > >
> > > > > ...
> > > > >
> > > > > > +static long inaccessible_fallocate(struct file *file, int mode,
> > > > > > +                                  loff_t offset, loff_t len)
> > > > > > +{
> > > > > > +       struct inaccessible_data *data = file->f_mapping->private_data;
> > > > > > +       struct file *memfd = data->memfd;
> > > > > > +       int ret;
> > > > > > +
> > > > > > +       if (mode & FALLOC_FL_PUNCH_HOLE) {
> > > > > > +               if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> > > > > > +                       return -EINVAL;
> > > > > > +       }
> > > > > > +
> > > > > > +       ret = memfd->f_op->fallocate(memfd, mode, offset, len);
> > > > > > +       inaccessible_notifier_invalidate(data, offset, offset + len);
> > > > >
> > > > > Wonder if invalidate should precede the actual hole punch, otherwise we open
> > > > > a window where the page tables point to memory no longer valid?
> > > >
> > > > Yes, you are right. Thanks for catching this.
> > >
> > > I also noticed this. But then thought the memory would be anyways zeroed
> > > (hole punched) before this call?
> >
> > Hole punching can free pages, given that offset/len covers full page.
> >
> > --
> >   Kiryl Shutsemau / Kirill A. Shutemov
> 
> I think moving this notifier_invalidate before fallocate may not solve
> the problem completely. Is it possible that between invalidate and
> fallocate, KVM tries to handle the page fault for the guest VM from
> another vcpu and uses the pages to be freed to back gpa ranges? Should
> hole punching here also update mem_attr first to say that KVM should
> consider the corresponding gpa ranges to be no more backed by
> inaccessible memfd?

We rely on external synchronization to prevent this. See code around
mmu_invalidate_retry_hva().

-- 
  Kiryl Shutsemau / Kirill A. Shutemov


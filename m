Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584DA6294E4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 10:54:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ousdU-0007wV-Ge; Tue, 15 Nov 2022 04:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ousdE-0007Xp-Df
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 04:53:30 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ousdB-00040Y-L4
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 04:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668506005; x=1700042005;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=4aNJ2YOK3rk2Xxfz14Mm6Z9Et6IN8H9Ru4xzr7aFyfQ=;
 b=c9KHcTmVgcMKBhXOIABPH8y7MklGIdYyo6Gs6zZwJVv4s8i2XaKtAnew
 jksPvoHN3BM6Maluv5NxUs1FJu3qgKJ92o9jYWbQTGdBLOlPO4NYK2xO4
 Udw6gCu2XOqdkP6L+jaGB9hFUEnwOjL6Fmh2en5hlM8Lda6JdAZvkkWxT
 eddT3n2FXhLp1BzB2jjkUm/3yCVOImJzGAp0tI4aL90EFaRhAeGyElnTX
 lZpcRrj+i7A0a9th09xsLt8xfX72nFqvTBDYgHy7rKAqfWTLlnjdzgtgO
 GPNRZUsdrPOurZSY9KJMwWAFNYx+1iThnSEGDjvdmANmkuZ0AD4upGmfb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="314021392"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; d="scan'208";a="314021392"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 01:53:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="702376949"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; d="scan'208";a="702376949"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 15 Nov 2022 01:53:11 -0800
Date: Tue, 15 Nov 2022 17:48:46 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Michael Roth <michael.roth@amd.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Vlastimil Babka <vbabka@suse.cz>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
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
 Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>,
 wei.w.wang@intel.com
Subject: Re: [PATCH v9 1/8] mm: Introduce memfd_restricted system call to
 create restricted user memory
Message-ID: <20221115094846.GB338422@chaop.bj.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-2-chao.p.peng@linux.intel.com>
 <20221031174738.fklhlia5fmaiinpe@amd.com>
 <20221101113729.GA4015495@chaop.bj.intel.com>
 <20221101151944.rhpav47pdulsew7l@amd.com>
 <20a11042-2cfb-8f42-9d80-6672e155ca2c@suse.cz>
 <20221114152843.ylxe4dis254vrj5u@box.shutemov.name>
 <20221114221632.5xaz24adkghfjr2q@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114221632.5xaz24adkghfjr2q@amd.com>
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 14, 2022 at 04:16:32PM -0600, Michael Roth wrote:
> On Mon, Nov 14, 2022 at 06:28:43PM +0300, Kirill A. Shutemov wrote:
> > On Mon, Nov 14, 2022 at 03:02:37PM +0100, Vlastimil Babka wrote:
> > > On 11/1/22 16:19, Michael Roth wrote:
> > > > On Tue, Nov 01, 2022 at 07:37:29PM +0800, Chao Peng wrote:
> > > >> > 
> > > >> >   1) restoring kernel directmap:
> > > >> > 
> > > >> >      Currently SNP (and I believe TDX) need to either split or remove kernel
> > > >> >      direct mappings for restricted PFNs, since there is no guarantee that
> > > >> >      other PFNs within a 2MB range won't be used for non-restricted
> > > >> >      (which will cause an RMP #PF in the case of SNP since the 2MB
> > > >> >      mapping overlaps with guest-owned pages)
> > > >> 
> > > >> Has the splitting and restoring been a well-discussed direction? I'm
> > > >> just curious whether there is other options to solve this issue.
> > > > 
> > > > For SNP it's been discussed for quite some time, and either splitting or
> > > > removing private entries from directmap are the well-discussed way I'm
> > > > aware of to avoid RMP violations due to some other kernel process using
> > > > a 2MB mapping to access shared memory if there are private pages that
> > > > happen to be within that range.
> > > > 
> > > > In both cases the issue of how to restore directmap as 2M becomes a
> > > > problem.
> > > > 
> > > > I was also under the impression TDX had similar requirements. If so,
> > > > do you know what the plan is for handling this for TDX?
> > > > 
> > > > There are also 2 potential alternatives I'm aware of, but these haven't
> > > > been discussed in much detail AFAIK:
> > > > 
> > > > a) Ensure confidential guests are backed by 2MB pages. shmem has a way to
> > > >    request 2MB THP pages, but I'm not sure how reliably we can guarantee
> > > >    that enough THPs are available, so if we went that route we'd probably
> > > >    be better off requiring the use of hugetlbfs as the backing store. But
> > > >    obviously that's a bit limiting and it would be nice to have the option
> > > >    of using normal pages as well. One nice thing with invalidation
> > > >    scheme proposed here is that this would "Just Work" if implement
> > > >    hugetlbfs support, so an admin that doesn't want any directmap
> > > >    splitting has this option available, otherwise it's done as a
> > > >    best-effort.
> > > > 
> > > > b) Implement general support for restoring directmap as 2M even when
> > > >    subpages might be in use by other kernel threads. This would be the
> > > >    most flexible approach since it requires no special handling during
> > > >    invalidations, but I think it's only possible if all the CPA
> > > >    attributes for the 2M range are the same at the time the mapping is
> > > >    restored/unsplit, so some potential locking issues there and still
> > > >    chance for splitting directmap over time.
> > > 
> > > I've been hoping that
> > > 
> > > c) using a mechanism such as [1] [2] where the goal is to group together
> > > these small allocations that need to increase directmap granularity so
> > > maximum number of large mappings are preserved.
> > 
> > As I mentioned in the other thread the restricted memfd can be backed by
> > secretmem instead of plain memfd. It already handles directmap with care.
> 
> It looks like it would handle direct unmapping/cleanup nicely, but it
> seems to lack fallocate(PUNCH_HOLE) support which we'd probably want to
> avoid additional memory requirements. I think once we added that we'd
> still end up needing some sort of handling for the invalidations.
> 
> Also, I know Chao has been considering hugetlbfs support, I assume by
> leveraging the support that already exists in shmem. Ideally SNP would
> be able to make use of that support as well, but relying on a separate
> backend seems likely to result in more complications getting there
> later.
> 
> > 
> > But I don't think it has to be part of initial restricted memfd
> > implementation. It is SEV-specific requirement and AMD folks can extend
> > implementation as needed later.
> 
> Admittedly the suggested changes to the invalidation mechanism made a
> lot more sense to me when I was under the impression that TDX would have
> similar requirements and we might end up with a common hook. Since that
> doesn't actually seem to be the case, it makes sense to try to do it as
> a platform-specific hook for SNP.
> 
> I think, given a memslot, a GFN range, and kvm_restricted_mem_get_pfn(),
> we should be able to get the same information needed to figure out whether
> the range is backed by huge pages or not. I'll see how that works out
> instead.

Sounds a viable solution, just that kvm_restricted_mem_get_pfn() will
only give you the ability to check a page, not a range. But you can
still call it many times I think.

The invalidation callback will be still needed, it gives you the chance
to do the restoring.

Chao
> 
> Thanks,
> 
> Mike
> 
> > 
> > -- 
> >   Kiryl Shutsemau / Kirill A. Shutemov


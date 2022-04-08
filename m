Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDE64F965A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 15:04:55 +0200 (CEST)
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncoII-00078P-7b
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 09:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ncoGo-0005TU-0w
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 09:03:22 -0400
Received: from mga06.intel.com ([134.134.136.31]:46642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ncoGh-0006Z3-LO
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 09:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649422995; x=1680958995;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=fGTAiXBITEf6vhZtefTnJfo1Ql9L0wnvDyySANGwVrA=;
 b=cR/caJAAz0lCZzhYOWp45HlfYdTr0HqeR14cbyJV5aMxOtjTvoyqDBGk
 wi5KDRWc8KBH3Qq776n0L9VqNjBb9btpCZzOHLv6ZfqcEcsdlEqO6ybnr
 Osjz2DUp/v2fCoNh+qPE6/nAw2GagEwckjEZ9n/fY7/0zOpIs/gThAQwq
 eeBQdHg0LfyPvH2cMJWJG70WlVJZX9RTl1QMG0Yq8Ky5+QDLcHdI7ey5a
 inq9V9ZZwJr9i6kCi8CV9MIjhiiLdxciGqfLhkq3EWp08Q4ogIksTzRV8
 zB5JZbZj/QqM6oTTPPJbd8qSRi4mdrw0hTF9sAn7SnA11svhKGWcK6XsV Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="322275321"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="322275321"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 06:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="698175603"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2022 06:03:05 -0700
Date: Fri, 8 Apr 2022 21:02:54 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory
 against RLIMIT_MEMLOCK
Message-ID: <20220408130254.GB57095@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-5-chao.p.peng@linux.intel.com>
 <Yk8L0CwKpTrv3Rg3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yk8L0CwKpTrv3Rg3@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
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

On Thu, Apr 07, 2022 at 04:05:36PM +0000, Sean Christopherson wrote:
> On Thu, Mar 10, 2022, Chao Peng wrote:
> > Since page migration / swapping is not supported yet, MFD_INACCESSIBLE
> > memory behave like longterm pinned pages and thus should be accounted to
> > mm->pinned_vm and be restricted by RLIMIT_MEMLOCK.
> > 
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >  mm/shmem.c | 25 ++++++++++++++++++++++++-
> >  1 file changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 7b43e274c9a2..ae46fb96494b 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -915,14 +915,17 @@ static void notify_fallocate(struct inode *inode, pgoff_t start, pgoff_t end)
> >  static void notify_invalidate_page(struct inode *inode, struct folio *folio,
> >  				   pgoff_t start, pgoff_t end)
> >  {
> > -#ifdef CONFIG_MEMFILE_NOTIFIER
> >  	struct shmem_inode_info *info = SHMEM_I(inode);
> >  
> > +#ifdef CONFIG_MEMFILE_NOTIFIER
> >  	start = max(start, folio->index);
> >  	end = min(end, folio->index + folio_nr_pages(folio));
> >  
> >  	memfile_notifier_invalidate(&info->memfile_notifiers, start, end);
> >  #endif
> > +
> > +	if (info->xflags & SHM_F_INACCESSIBLE)
> > +		atomic64_sub(end - start, &current->mm->pinned_vm);
> 
> As Vishal's to-be-posted selftest discovered, this is broken as current->mm may
> be NULL.  Or it may be a completely different mm, e.g. AFAICT there's nothing that
> prevents a different process from punching hole in the shmem backing.
> 
> I don't see a sane way of tracking this in the backing store unless the inode is
> associated with a single mm when it's created, and that opens up a giant can of
> worms, e.g. what happens with the accounting if the creating process goes away?

Yes, I realized this.

> 
> I think the correct approach is to not do the locking automatically for SHM_F_INACCESSIBLE,
> and instead require userspace to do shmctl(.., SHM_LOCK, ...) if userspace knows the
> consumers don't support migrate/swap.  That'd require wrapping migrate_page() and then
> wiring up notifier hooks for migrate/swap, but IMO that's a good thing to get sorted
> out sooner than later.  KVM isn't planning on support migrate/swap for TDX or SNP,
> but supporting at least migrate for a software-only implementation a la pKVM should
> be relatively straightforward.  On the notifiee side, KVM can terminate the VM if it
> gets an unexpected migrate/swap, e.g. so that TDX/SEV VMs don't die later with
> exceptions and/or data corruption (pre-SNP SEV guests) in the guest.

SHM_LOCK sounds like a good match.

Thanks,
Chao
> 
> Hmm, shmem_writepage() already handles SHM_F_INACCESSIBLE by rejecting the swap, so
> maybe it's just the page migration path that needs to be updated?


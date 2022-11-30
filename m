Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A3163D24B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:44:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0JdU-0002fP-GG; Wed, 30 Nov 2022 04:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p0JdR-0002f8-Pe
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 04:44:09 -0500
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p0JdO-0002lX-JT
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 04:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669801446; x=1701337446;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=S7IFmJUYj2DIJw7QNc2jhnguuUzMp+pGaR87dR42Bvg=;
 b=IsqtfCBVyRTaotpEAHpEXnzD2zumsBn4zXbVilksWCiLYwyxRRP47cZE
 W/0fp4dsJyyxdib9yo8A1kgor4oWvnmOGk5BITWgHLe8FSRr0R+RfjeAM
 JPydg8cdDM7F7BNgdou7C/UDCjcdbbCIInLx31j/HdG0aPoGG+1eYo8Hr
 F4PmEV0Ats/FmpajUWr47vs/Mz5EdYv+KQIFoIRcZogZzmk0TiMkrlq8C
 Lzhr55AQxYhIJ0RE5HSUFEZTxO8csLfNcDXGDQTWh7MTAdpI6UdZIXp0j
 vS/4PJ/mFJjr7x5IOSwV28AH/4KWVKQ1JBgWlGIXMcbycvfmPHi3SZXag Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="379633053"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="379633053"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 01:44:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="637934502"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="637934502"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 30 Nov 2022 01:43:53 -0800
Date: Wed, 30 Nov 2022 17:39:31 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
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
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
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
Message-ID: <20221130093931.GA945726@chaop.bj.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-2-chao.p.peng@linux.intel.com>
 <20221129003725.l34qhx6n44mq2gtl@amd.com>
 <20221129140615.GC902164@chaop.bj.intel.com>
 <20221129190658.jefuep7nglp25ugt@amd.com>
 <20221129191815.atuv6arhodjbnvb2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129191815.atuv6arhodjbnvb2@amd.com>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga07.intel.com
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

On Tue, Nov 29, 2022 at 01:18:15PM -0600, Michael Roth wrote:
> On Tue, Nov 29, 2022 at 01:06:58PM -0600, Michael Roth wrote:
> > On Tue, Nov 29, 2022 at 10:06:15PM +0800, Chao Peng wrote:
> > > On Mon, Nov 28, 2022 at 06:37:25PM -0600, Michael Roth wrote:
> > > > On Tue, Oct 25, 2022 at 11:13:37PM +0800, Chao Peng wrote:
> > > ...
> > > > > +static long restrictedmem_fallocate(struct file *file, int mode,
> > > > > +				    loff_t offset, loff_t len)
> > > > > +{
> > > > > +	struct restrictedmem_data *data = file->f_mapping->private_data;
> > > > > +	struct file *memfd = data->memfd;
> > > > > +	int ret;
> > > > > +
> > > > > +	if (mode & FALLOC_FL_PUNCH_HOLE) {
> > > > > +		if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> > > > > +			return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	restrictedmem_notifier_invalidate(data, offset, offset + len, true);
> > > > 
> > > > The KVM restrictedmem ops seem to expect pgoff_t, but here we pass
> > > > loff_t. For SNP we've made this strange as part of the following patch
> > > > and it seems to produce the expected behavior:
> > > 
> > > That's correct. Thanks.
> > > 
> > > > 
> > > >   https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fmdroth%2Flinux%2Fcommit%2Fd669c7d3003ff7a7a47e73e8c3b4eeadbd2c4eb6&amp;data=05%7C01%7CMichael.Roth%40amd.com%7C0c26815eb6af4f1a243508dad23cf713%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638053456609134623%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=kAL42bmyBB0alVwh%2FN%2BT3D%2BiVTdxxMsJ7V4TNuCTjM4%3D&amp;reserved=0
> > > > 
> > > > > +	ret = memfd->f_op->fallocate(memfd, mode, offset, len);
> > > > > +	restrictedmem_notifier_invalidate(data, offset, offset + len, false);
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > 
> > > > <snip>
> > > > 
> > > > > +int restrictedmem_get_page(struct file *file, pgoff_t offset,
> > > > > +			   struct page **pagep, int *order)
> > > > > +{
> > > > > +	struct restrictedmem_data *data = file->f_mapping->private_data;
> > > > > +	struct file *memfd = data->memfd;
> > > > > +	struct page *page;
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = shmem_getpage(file_inode(memfd), offset, &page, SGP_WRITE);
> > > > 
> > > > This will result in KVM allocating pages that userspace hasn't necessary
> > > > fallocate()'d. In the case of SNP we need to get the PFN so we can clean
> > > > up the RMP entries when restrictedmem invalidations are issued for a GFN
> > > > range.
> > > 
> > > Yes fallocate() is unnecessary unless someone wants to reserve some
> > > space (e.g. for determination or performance purpose), this matches its
> > > semantics perfectly at:
> > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.man7.org%2Flinux%2Fman-pages%2Fman2%2Ffallocate.2.html&amp;data=05%7C01%7CMichael.Roth%40amd.com%7C0c26815eb6af4f1a243508dad23cf713%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638053456609134623%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=acBSquFG%2FHtpbcZfHDZrP2O63bu06rI0pjiPJFSJSj8%3D&amp;reserved=0
> > > 
> > > > 
> > > > If the guest supports lazy-acceptance however, these pages may not have
> > > > been faulted in yet, and if the VMM defers actually fallocate()'ing space
> > > > until the guest actually tries to issue a shared->private for that GFN
> > > > (to support lazy-pinning), then there may never be a need to allocate
> > > > pages for these backends.
> > > > 
> > > > However, the restrictedmem invalidations are for GFN ranges so there's
> > > > no way to know inadvance whether it's been allocated yet or not. The
> > > > xarray is one option but currently it defaults to 'private' so that
> > > > doesn't help us here. It might if we introduced a 'uninitialized' state
> > > > or something along that line instead of just the binary
> > > > 'shared'/'private' though...
> > > 
> > > How about if we change the default to 'shared' as we discussed at
> > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2FY35gI0L8GMt9%2BOkK%40google.com%2F&amp;data=05%7C01%7CMichael.Roth%40amd.com%7C0c26815eb6af4f1a243508dad23cf713%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638053456609134623%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=Q1vZWQiZ7mx12Qn5aKl4s8Ea9hNbwCJBb%2BjiA1du3Os%3D&amp;reserved=0?
> > 
> > Need to look at this a bit more, but I think that could work as well.
> > 
> > > > 
> > > > But for now we added a restrictedmem_get_page_noalloc() that uses
> > > > SGP_NONE instead of SGP_WRITE to avoid accidentally allocating a bunch
> > > > of memory as part of guest shutdown, and a
> > > > kvm_restrictedmem_get_pfn_noalloc() variant to go along with that. But
> > > > maybe a boolean param is better? Or maybe SGP_NOALLOC is the better
> > > > default, and we just propagate an error to userspace if they didn't
> > > > fallocate() in advance?
> > > 
> > > This (making fallocate() a hard requirement) not only complicates the
> > > userspace but also forces the lazy-faulting going through a long path of
> > > exiting to userspace. Unless we don't have other options I would not go
> > > this way.
> > 
> > Unless I'm missing something, it's already the case that userspace is
> > responsible for handling all the shared->private transitions in response
> > to KVM_EXIT_MEMORY_FAULT or (in our case) KVM_EXIT_VMGEXIT. So it only
> > places the additional requirements on the VMM that if they *don't*
> > preallocate, then they'll need to issue the fallocate() prior to issuing
> > the KVM_MEM_ENCRYPT_REG_REGION ioctl in response to these events.

Preallocating and memory conversion between shared<->private are two
different things. No double fallocate() and conversion can be called
together in response to KVM_EXIT_MEMORY_FAULT, but they don't have to be
paired. And the fallocate() does not have to operate on the same memory
range as memory conversion does.

> > 
> > QEMU for example already has a separate 'prealloc' option for cases
> > where they want to prefault all the guest memory, so it makes sense to
> > continue making that an optional thing with regard to UPM.

Making 'prealloc' work for UPM in QEMU does sound reasonable. Anyway,
it's just an option so not change the assumption here.

> 
> Although I guess what you're suggesting doesn't stop userspace from
> deciding whether they want to prefault or not. I know the Google folks
> had some concerns over unexpected allocations causing 2x memory usage
> though so giving userspace full control of what is/isn't allocated in
> the restrictedmem backend seems to make it easier to guard against this,
> but I think checking the xarray and defaulting to 'shared' would work
> for us if that's the direction we end up going.

Yeah, that looks very likely the direction satisfying all people here.

Chao
> 
> -Mike
> 
> > 
> > -Mike
> > 
> > > 
> > > Chao
> > > > 
> > > > -Mike
> > > > 
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	*pagep = page;
> > > > > +	if (order)
> > > > > +		*order = thp_order(compound_head(page));
> > > > > +
> > > > > +	SetPageUptodate(page);
> > > > > +	unlock_page(page);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(restrictedmem_get_page);
> > > > > -- 
> > > > > 2.25.1
> > > > > 


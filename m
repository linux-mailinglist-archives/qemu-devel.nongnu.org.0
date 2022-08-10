Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B558E9B7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 11:36:55 +0200 (CEST)
Received: from localhost ([::1]:42744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLi8z-0001Pe-Mq
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 05:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oLi2s-0007N6-SG
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 05:30:34 -0400
Received: from mga01.intel.com ([192.55.52.88]:31212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oLi2p-0003ql-Vr
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 05:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660123831; x=1691659831;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=zHygXbTWCyPOJ+4aJpksT5a9YTzKkpyV1mfD/3Fs2Cg=;
 b=hXTJ1/cRcbwtT4VowGnYl/0GeJsO6cwkz/ZZck6L0EddxhjOELruANSn
 Mk7UXBsmKPnxeqRSkfwa2h9s1JcvgJ+5bkxUfcKo3vqPJgfJ4sz7l1Gy8
 CXRJ0LgUgvA5Tp1XZae3atx24F+Fai47cZ0Oz7LrRbjbvQX6UxitG0cjx
 VqAcaw93t+0XsnXM1bH9OLUr8kkD3gefFawXQxTEy4TGYVzeJxoEIE7/J
 Xk+gR6YgiIQI+k9Bz1Gn1CXexWo/oZSg33YoQTgLQWQMeIvMejEasOrLY
 PVWyNxvPEAkNHMR67eF0LQRhXzx2YYwKj69Z9OhHqDDeEdSk6w8ecbjNQ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="316987585"
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; d="scan'208";a="316987585"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 02:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; d="scan'208";a="664821304"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 10 Aug 2022 02:30:18 -0700
Date: Wed, 10 Aug 2022 17:25:32 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
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
 ak@linux.intel.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 04/14] mm/shmem: Support memfile_notifier
Message-ID: <20220810092532.GD862421@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-5-chao.p.peng@linux.intel.com>
 <a34d88b9-a4b9-cb9e-91d9-c5a89449fcd5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a34d88b9-a4b9-cb9e-91d9-c5a89449fcd5@redhat.com>
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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

On Fri, Aug 05, 2022 at 03:26:02PM +0200, David Hildenbrand wrote:
> On 06.07.22 10:20, Chao Peng wrote:
> > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > 
> > Implement shmem as a memfile_notifier backing store. Essentially it
> > interacts with the memfile_notifier feature flags for userspace
> > access/page migration/page reclaiming and implements the necessary
> > memfile_backing_store callbacks.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> 
> [...]
> 
> > +#ifdef CONFIG_MEMFILE_NOTIFIER
> > +static struct memfile_node *shmem_lookup_memfile_node(struct file *file)
> > +{
> > +	struct inode *inode = file_inode(file);
> > +
> > +	if (!shmem_mapping(inode->i_mapping))
> > +		return NULL;
> > +
> > +	return  &SHMEM_I(inode)->memfile_node;
> > +}
> > +
> > +
> > +static int shmem_get_pfn(struct file *file, pgoff_t offset, pfn_t *pfn,
> > +			 int *order)
> > +{
> > +	struct page *page;
> > +	int ret;
> > +
> > +	ret = shmem_getpage(file_inode(file), offset, &page, SGP_WRITE);
> > +	if (ret)
> > +		return ret;
> > +
> > +	unlock_page(page);
> > +	*pfn = page_to_pfn_t(page);
> > +	*order = thp_order(compound_head(page));
> > +	return 0;
> > +}
> > +
> > +static void shmem_put_pfn(pfn_t pfn)
> > +{
> > +	struct page *page = pfn_t_to_page(pfn);
> > +
> > +	if (!page)
> > +		return;
> > +
> > +	put_page(page);
> 
> 
> Why do we export shmem_get_pfn/shmem_put_pfn and not simply
> 
> get_folio()
> 
> and let the caller deal with putting the folio? What's the reason to
> 
> a) Operate on PFNs and not folios
> b) Have these get/put semantics?

We have a design assumption that somedays this can even support non-page
based backing stores. There are some discussions:
  https://lkml.org/lkml/2022/3/28/1440
I should add document for this two callbacks.

> 
> > +}
> > +
> > +static struct memfile_backing_store shmem_backing_store = {
> > +	.lookup_memfile_node = shmem_lookup_memfile_node,
> > +	.get_pfn = shmem_get_pfn,
> > +	.put_pfn = shmem_put_pfn,
> > +};
> > +#endif /* CONFIG_MEMFILE_NOTIFIER */
> > +
> >  void __init shmem_init(void)
> >  {
> >  	int error;
> > @@ -3956,6 +4059,10 @@ void __init shmem_init(void)
> >  	else
> >  		shmem_huge = SHMEM_HUGE_NEVER; /* just in case it was patched */
> >  #endif
> > +
> > +#ifdef CONFIG_MEMFILE_NOTIFIER
> > +	memfile_register_backing_store(&shmem_backing_store);
> 
> Can we instead prove a dummy function that does nothing without
> CONFIG_MEMFILE_NOTIFIER?

Sounds good.

Chao
> 
> > +#endif
> >  	return;
> >  
> >  out1:
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 


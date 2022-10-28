Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618F1610B3D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 09:24:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooJig-0006Zp-6v; Fri, 28 Oct 2022 03:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ooIgM-0005Yf-6F
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 02:17:31 -0400
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ooIgH-00005Y-Cc
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 02:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666937845; x=1698473845;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=dF/aWwaNQggwj6gD+KJTCT5Ni9qMvVF3l+TfbYoad8o=;
 b=QCAFH5fw57Zaa7jyH20HcEVePUFMN1QozcFW3jU7SmizqzF3ZkvbQHis
 uWW7l7Kj1YZl/X3fCUfbOB7EVEaHnoxE4Fd94uKctTO+OQKh677AxdySz
 CzEXBaCPaFUpM9joHmFXsYaBTpN2A4Aoi7DHogW/lbZKLDxux+FLxn4kr
 D2lcbhk3tyVKmU3O3QxLv8PVk46gYtbMzIhWY0buZBTSwZFfmHY7UxzKv
 qATZMkKgqMeEJF3R4lwOMR8wGM2DbKD2cqetZERVvlxRuI66AlTqiY+ga
 8QdnRXfVg9gE39MaVmbl3R4tB/c52dUGuWQ5x6g5yaNqBw0efruc9VdiS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="309512363"
X-IronPort-AV: E=Sophos;i="5.95,220,1661842800"; d="scan'208";a="309512363"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 23:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="627427865"
X-IronPort-AV: E=Sophos;i="5.95,220,1661842800"; d="scan'208";a="627427865"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 27 Oct 2022 23:17:01 -0700
Date: Fri, 28 Oct 2022 14:12:32 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
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
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v9 1/8] mm: Introduce memfd_restricted system call to
 create restricted user memory
Message-ID: <20221028061232.GA3885130@chaop.bj.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-2-chao.p.peng@linux.intel.com>
 <20221026173145.GA3819453@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026173145.GA3819453@ls.amr.corp.intel.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Oct 26, 2022 at 10:31:45AM -0700, Isaku Yamahata wrote:
> On Tue, Oct 25, 2022 at 11:13:37PM +0800,
> Chao Peng <chao.p.peng@linux.intel.com> wrote:
> 
> > +int restrictedmem_get_page(struct file *file, pgoff_t offset,
> > +			   struct page **pagep, int *order)
> > +{
> > +	struct restrictedmem_data *data = file->f_mapping->private_data;
> > +	struct file *memfd = data->memfd;
> > +	struct page *page;
> > +	int ret;
> > +
> > +	ret = shmem_getpage(file_inode(memfd), offset, &page, SGP_WRITE);
> 
> shmem_getpage() was removed.
> https://lkml.kernel.org/r/20220902194653.1739778-34-willy@infradead.org

Thanks for pointing out. My current base(kvm/queue) has not included
this change yet so still use shmem_getpage().

Chao
> 
> I needed the following fix to compile.
> 
> thanks,
> 
> diff --git a/mm/restrictedmem.c b/mm/restrictedmem.c
> index e5bf8907e0f8..4694dd5609d6 100644
> --- a/mm/restrictedmem.c
> +++ b/mm/restrictedmem.c
> @@ -231,13 +231,15 @@ int restrictedmem_get_page(struct file *file, pgoff_t offset,
>  {
>         struct restrictedmem_data *data = file->f_mapping->private_data;
>         struct file *memfd = data->memfd;
> +       struct folio *folio = NULL;
>         struct page *page;
>         int ret;
>  
> -       ret = shmem_getpage(file_inode(memfd), offset, &page, SGP_WRITE);
> +       ret = shmem_get_folio(file_inode(memfd), offset, &folio, SGP_WRITE);
>         if (ret)
>                 return ret;
>  
> +       page = folio_file_page(folio, offset);
>         *pagep = page;
>         if (order)
>                 *order = thp_order(compound_head(page));
> -- 
> Isaku Yamahata <isaku.yamahata@gmail.com>


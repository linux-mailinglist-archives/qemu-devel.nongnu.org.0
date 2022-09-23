Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D215E7107
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 03:00:33 +0200 (CEST)
Received: from localhost ([::1]:38528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obX3Q-0008Th-5v
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 21:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1obX1L-00074s-U1
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 20:58:23 -0400
Received: from mga01.intel.com ([192.55.52.88]:11314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1obX1K-0003KN-2F
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 20:58:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663894702; x=1695430702;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ml+yVLdWFYzsyDqjZioBXvGBweEy273hCGRMNDKeVO8=;
 b=b3vObVIiIJiDQcSkDcHo1rie+bO9swIf5UIQrjhahPAP3PSEmwPknxsI
 J5dQOb9LqBCoxz47xQ3FFg57Za056gxEKL40pYy8jX6z4WdjmPHR7OMyG
 Rc+vFPQcmSmJ4JDvCzQe3ilsq1Xwpn/D8JC21xImXswyEO1xm/4Utf0KN
 YbzmzSumM5fAIbPhwPp54RbK/LA7BWBHWIkAgPJbK+umeKl25/PKqsa7u
 KfD8E4GnxJf0AtMalD2iPduNTou1xvdppjwJSlDQvj49m6GRoTYHdS7aQ
 Yb9+ODB8SR+0RJu1Wzwb5oazpM1VBQQk3XntFcXJftewAzHGG6mZm1PMG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="326804554"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="326804554"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 17:58:20 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="615437441"
Received: from dnessim-mobl1.ger.corp.intel.com (HELO box.shutemov.name)
 ([10.252.60.183])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 17:58:10 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 5F4F01044E2; Fri, 23 Sep 2022 03:58:08 +0300 (+03)
Date: Fri, 23 Sep 2022 03:58:08 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 David Hildenbrand <david@redhat.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
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
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
Message-ID: <20220923005808.vfltoecttoatgw5o@box.shutemov.name>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 19, 2022 at 11:12:46AM +0200, David Hildenbrand wrote:
> > diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
> > index 6325d1d0e90f..9d066be3d7e8 100644
> > --- a/include/uapi/linux/magic.h
> > +++ b/include/uapi/linux/magic.h
> > @@ -101,5 +101,6 @@
> >   #define DMA_BUF_MAGIC		0x444d4142	/* "DMAB" */
> >   #define DEVMEM_MAGIC		0x454d444d	/* "DMEM" */
> >   #define SECRETMEM_MAGIC		0x5345434d	/* "SECM" */
> > +#define INACCESSIBLE_MAGIC	0x494e4143	/* "INAC" */
> 
> 
> [...]
> 
> > +
> > +int inaccessible_get_pfn(struct file *file, pgoff_t offset, pfn_t *pfn,
> > +			 int *order)
> > +{
> > +	struct inaccessible_data *data = file->f_mapping->private_data;
> > +	struct file *memfd = data->memfd;
> > +	struct page *page;
> > +	int ret;
> > +
> > +	ret = shmem_getpage(file_inode(memfd), offset, &page, SGP_WRITE);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*pfn = page_to_pfn_t(page);
> > +	*order = thp_order(compound_head(page));
> > +	SetPageUptodate(page);
> > +	unlock_page(page);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(inaccessible_get_pfn);
> > +
> > +void inaccessible_put_pfn(struct file *file, pfn_t pfn)
> > +{
> > +	struct page *page = pfn_t_to_page(pfn);
> > +
> > +	if (WARN_ON_ONCE(!page))
> > +		return;
> > +
> > +	put_page(page);
> > +}
> > +EXPORT_SYMBOL_GPL(inaccessible_put_pfn);
> 
> Sorry, I missed your reply regarding get/put interface.
> 
> https://lore.kernel.org/linux-mm/20220810092532.GD862421@chaop.bj.intel.com/
> 
> "We have a design assumption that somedays this can even support non-page
> based backing stores."
> 
> As long as there is no such user in sight (especially how to get the memfd
> from even allocating such memory which will require bigger changes), I
> prefer to keep it simple here and work on pages/folios. No need to
> over-complicate it for now.

Sean, Paolo , what is your take on this? Do you have conrete use case of
pageless backend for the mechanism in sight? Maybe DAX?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov


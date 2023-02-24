Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1456A166B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 06:52:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVQzL-0008Ud-9b; Fri, 24 Feb 2023 00:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pVQz5-0008SN-9O
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 00:51:08 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pVQyz-0001AR-FS
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 00:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677217861; x=1708753861;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=V5pIfvtAVZdi4oFKptzL072SqpQseaciK4VwcTkzV+I=;
 b=XzD/MuEbCDnwR4XV0NKCyZfM5UcqXQPp4WUdafI9Dqc9gqj2HQRyHEmq
 4hDxUrkhfM0UAW4JjOLzxXUpth1WIEYjJhCTCHO5uQNc7UHXhQy2Sruj+
 OFOLErwJKjbQx4PPZaSvgh7WrqjOMXxvTZYhGJ7Cfbh1VuDAjSnWe05hQ
 jfL9/q2o7FMn/vFkLZeUZ39wrJuGam6jJnycgRctsOQdX1gSRJnrUAbvf
 VOTHyXI8VOA3okeLw/XHQH6xjAze2Zq3nVAln5jXmsKAB90djA0ffDM6/
 JqkfQM01BTh/+V6+acltoe6StzKPtKtr2wccGIPUiVR35BeebrdkK0nqt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="419636448"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="419636448"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 21:50:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="741550783"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="741550783"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.105])
 by fmsmga004.fm.intel.com with ESMTP; 23 Feb 2023 21:50:36 -0800
Date: Fri, 24 Feb 2023 13:42:56 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
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
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 1/9] mm: Introduce memfd_restricted system call to
 create restricted user memory
Message-ID: <20230224054256.GA1701111@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-2-chao.p.peng@linux.intel.com>
 <Y8HTITl1+Oe0H7Gd@google.com>
 <7555a235-76be-abf5-075a-80dbe6f1ea8e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7555a235-76be-abf5-075a-80dbe6f1ea8e@amd.com>
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga05.intel.com
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

> > int restrictedmem_bind(struct file *file, pgoff_t start, pgoff_t end,
> > 		       struct restrictedmem_notifier *notifier, bool exclusive)
> > {
> > 	struct restrictedmem *rm = file->f_mapping->private_data;
> > 	int ret = -EINVAL;
> > 
> > 	down_write(&rm->lock);
> > 
> > 	/* Non-exclusive mappings are not yet implemented. */
> > 	if (!exclusive)
> > 		goto out_unlock;
> > 
> > 	if (!xa_empty(&rm->bindings)) {
> > 		if (exclusive != rm->exclusive)
> > 			goto out_unlock;
> > 
> > 		if (exclusive && xa_find(&rm->bindings, &start, end, XA_PRESENT))
> > 			goto out_unlock;
> > 	}
> > 
> > 	xa_store_range(&rm->bindings, start, end, notifier, GFP_KERNEL);
> 
> 
> || ld: mm/restrictedmem.o: in function `restrictedmem_bind':
> mm/restrictedmem.c|295| undefined reference to `xa_store_range'

Right, xa_store_range() is only available for XARRAY_MULTI.

> 
> 
> This is missing:
> ===
> diff --git a/mm/Kconfig b/mm/Kconfig
> index f952d0172080..03aca542c0da 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1087,6 +1087,7 @@ config SECRETMEM
>  config RESTRICTEDMEM
>         bool
>         depends on TMPFS
> +       select XARRAY_MULTI
> ===
> 
> Thanks,
> 
> 
> 
> > 	rm->exclusive = exclusive;
> > 	ret = 0;
> > out_unlock:
> > 	up_write(&rm->lock);
> > 	return ret;
> > }
> > EXPORT_SYMBOL_GPL(restrictedmem_bind);
> > 
> > void restrictedmem_unbind(struct file *file, pgoff_t start, pgoff_t end,
> > 			  struct restrictedmem_notifier *notifier)
> > {
> > 	struct restrictedmem *rm = file->f_mapping->private_data;
> > 
> > 	down_write(&rm->lock);
> > 	xa_store_range(&rm->bindings, start, end, NULL, GFP_KERNEL);
> > 	synchronize_rcu();
> > 	up_write(&rm->lock);
> > }
> > EXPORT_SYMBOL_GPL(restrictedmem_unbind);
> 
> -- 
> Alexey


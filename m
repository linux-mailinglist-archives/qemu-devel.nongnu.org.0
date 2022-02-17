Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC654BA1E1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 14:49:55 +0100 (CET)
Received: from localhost ([::1]:50630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKhAQ-000414-GD
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 08:49:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nKglM-0003Zc-Nl
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:24:02 -0500
Received: from mga11.intel.com ([192.55.52.93]:40250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nKglG-0007Vj-Uz
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:23:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645104234; x=1676640234;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=7ROqYA+WyEzn2lj20W8JxFtIkCz3sbVl7IBm5h9FArM=;
 b=RYLFAAkSHiinnAP1VxQedn0Jb0p09V6Q+4TXrwP3N6wnjW6Tboz2IRRT
 43cYGkXcKRxKKPZUnTETsZ1x7OUalhQp7PfxQ2LkoVv20NNnz0aCh4kY4
 lF4rgX+i7ZOxaaFkbczGIeb2wYpFZo+0+bDL9HYMGxUsCeJdtUOMmUupq
 +Ajz97jCv6DL5Tz/q/f4KKGud03Us9ZYS0KMFmmYe8Aiwn+D2gIb/cWN8
 oAWIgPaJBR4/o8vGljfEr2PPZfoRE9+Z8ggmZcPxYI9wh/OLyinJkNt63
 u1Mc7wI+xNf3YuHH/sImWK9MIxVf+uJEIANBrPIqSv7OYWX+KisIrbylS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="248467396"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="248467396"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 05:23:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="681959596"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2022 05:23:47 -0800
Date: Thu, 17 Feb 2022 21:23:25 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v4 04/12] mm/shmem: Support memfile_notifier
Message-ID: <20220217132325.GD32679@chaop.bj.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-5-chao.p.peng@linux.intel.com>
 <314affa4-fbcb-2cb9-deb7-f61a2ac99260@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <314affa4-fbcb-2cb9-deb7-f61a2ac99260@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org, david@redhat.com,
 qemu-devel@nongnu.org, "J . Bruce Fields" <bfields@fieldses.org>,
 linux-mm@kvack.org, "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 jun.nakajima@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 11, 2022 at 03:40:09PM -0800, Andy Lutomirski wrote:
> On 1/18/22 05:21, Chao Peng wrote:
> > It maintains a memfile_notifier list in shmem_inode_info structure and
> > implements memfile_pfn_ops callbacks defined by memfile_notifier. It
> > then exposes them to memfile_notifier via
> > shmem_get_memfile_notifier_info.
> > 
> > We use SGP_NOALLOC in shmem_get_lock_pfn since the pages should be
> > allocated by userspace for private memory. If there is no pages
> > allocated at the offset then error should be returned so KVM knows that
> > the memory is not private memory.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> 
> >   static int memfile_get_notifier_info(struct inode *inode,
> >   				     struct memfile_notifier_list **list,
> >   				     struct memfile_pfn_ops **ops)
> >   {
> > -	return -EOPNOTSUPP;
> > +	int ret = -EOPNOTSUPP;
> > +#ifdef CONFIG_SHMEM
> > +	ret = shmem_get_memfile_notifier_info(inode, list, ops);
> > +#endif
> > +	return ret;
> >   }
> 
> > +int shmem_get_memfile_notifier_info(struct inode *inode,
> > +				    struct memfile_notifier_list **list,
> > +				    struct memfile_pfn_ops **ops)
> > +{
> > +	struct shmem_inode_info *info;
> > +
> > +	if (!shmem_mapping(inode->i_mapping))
> > +		return -EINVAL;
> > +
> > +	info = SHMEM_I(inode);
> > +	*list = &info->memfile_notifiers;
> > +	if (ops)
> > +		*ops = &shmem_pfn_ops;
> > +
> > +	return 0;
> 
> I can't wrap my head around exactly who is supposed to call these functions
> and when, but there appears to be a missing check that the inode is actually
> a shmem inode.
> 
> What is this code trying to do?  It's very abstract.

This is to be called by memfile_(un)register_notifier in patch-03 to
allow shmem to be connected to memfile_notifer. But as Mike pointed out,
probably introducing a memfile_notifier_register_backing_store() sounds
better so backing store (e.g. shmem) can register itself to
memfile_notifier.

Chao


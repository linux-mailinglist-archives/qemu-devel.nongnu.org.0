Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0D24BA102
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 14:23:42 +0100 (CET)
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKgl2-0000pJ-Fp
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 08:23:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nKgYx-0002wB-CU
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:11:12 -0500
Received: from mga11.intel.com ([192.55.52.93]:39434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nKgYs-0004to-IE
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645103466; x=1676639466;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=3j1F15BrCbKN2Xpg8Gu2Cb+UfX7fWFXHLd+x9nlgm/s=;
 b=jziW/xClDS3HIWj4fzMMa9JtivGNxni87xPzKfO3jpbNMnQ0mXCdQrVQ
 1mgMkCDivDWudja8agjEv1QlPBSlkDO/Cnat1xzXzsTp9ySM1nOFLhM2X
 UPx9el7/9JhMC9Y39byBkuoMTtRtT8OTzAcVlz7GxVwZEJ/ggW75LwSYF
 T4qLNgWvg0d6BscBYOaLykhSKOP981jZ00JUPzbcHsrtqnqGsdBlOsx5+
 bW4nDz7+TO/dTGqqu2KwLv+eDzopsVnLmKPEW3534/YJGojv5YgfIysMW
 SrdLEXsrhaSk+5gEsK7bfHqu+srrSeTCIjL4mkw2G5Hkd6M7s1pbVhcwX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="248465321"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="248465321"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 05:11:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="704791747"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga005.jf.intel.com with ESMTP; 17 Feb 2022 05:10:57 -0800
Date: Thu, 17 Feb 2022 21:10:36 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v4 04/12] mm/shmem: Support memfile_notifier
Message-ID: <20220217131036.GC32679@chaop.bj.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-5-chao.p.peng@linux.intel.com>
 <YgK2pDB34AsqCHd0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgK2pDB34AsqCHd0@kernel.org>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 08, 2022 at 08:29:56PM +0200, Mike Rapoport wrote:
> Hi,
> 
> On Tue, Jan 18, 2022 at 09:21:13PM +0800, Chao Peng wrote:
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
> > ---
> >  include/linux/shmem_fs.h |  4 ++
> >  mm/memfile_notifier.c    | 12 +++++-
> >  mm/shmem.c               | 81 ++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 96 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
> > index 166158b6e917..461633587eaf 100644
> > --- a/include/linux/shmem_fs.h
> > +++ b/include/linux/shmem_fs.h
> > @@ -9,6 +9,7 @@
> >  #include <linux/percpu_counter.h>
> >  #include <linux/xattr.h>
> >  #include <linux/fs_parser.h>
> > +#include <linux/memfile_notifier.h>
> >  
> >  /* inode in-kernel data */
> >  
> > @@ -24,6 +25,9 @@ struct shmem_inode_info {
> >  	struct shared_policy	policy;		/* NUMA memory alloc policy */
> >  	struct simple_xattrs	xattrs;		/* list of xattrs */
> >  	atomic_t		stop_eviction;	/* hold when working on inode */
> > +#ifdef CONFIG_MEMFILE_NOTIFIER
> > +	struct memfile_notifier_list memfile_notifiers;
> > +#endif
> >  	struct inode		vfs_inode;
> >  };
> >  
> > diff --git a/mm/memfile_notifier.c b/mm/memfile_notifier.c
> > index 8171d4601a04..b4699cbf629e 100644
> > --- a/mm/memfile_notifier.c
> > +++ b/mm/memfile_notifier.c
> > @@ -41,11 +41,21 @@ void memfile_notifier_fallocate(struct memfile_notifier_list *list,
> >  	srcu_read_unlock(&srcu, id);
> >  }
> >  
> > +#ifdef CONFIG_SHMEM
> > +extern int shmem_get_memfile_notifier_info(struct inode *inode,
> > +					struct memfile_notifier_list **list,
> > +					struct memfile_pfn_ops **ops);
> > +#endif
> > +
> >  static int memfile_get_notifier_info(struct inode *inode,
> >  				     struct memfile_notifier_list **list,
> >  				     struct memfile_pfn_ops **ops)
> >  {
> > -	return -EOPNOTSUPP;
> > +	int ret = -EOPNOTSUPP;
> > +#ifdef CONFIG_SHMEM
> > +	ret = shmem_get_memfile_notifier_info(inode, list, ops);
> > +#endif
> 
> This looks backwards. Can we have some register method for memory backing
> store and call it from shmem.c?

Agreed. That would be clearer.

Chao
> 
> > +	return ret;
> >  }
> >  
> >  int memfile_register_notifier(struct inode *inode,
> 
> -- 
> Sincerely yours,
> Mike.


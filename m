Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B27F4D5DB2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 09:46:45 +0100 (CET)
Received: from localhost ([::1]:51952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSav6-0001UU-Ii
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 03:46:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSar8-0000az-By
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 03:42:39 -0500
Received: from mga17.intel.com ([192.55.52.151]:33871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSar5-00009A-Hj
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 03:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646988155; x=1678524155;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=rnnCy0Hbi4uhBKWJV93SLPhz7c/vwnMymNdqjK9CGiI=;
 b=miqjQIXSg7SBUVK1bladzPXtFnsYMGTfCeW/IGf8ddiKkxw6YS7i6rQe
 ebbu9NljOQ1mCMyOHjUqDi8UQaMDyA4ajI/0dLykmDLGEfGUAUXnezG/g
 xvQpr9XeM9Cy1ksiGX7q1Gtysrvkrl0XVL1HmZqendsN1aVNMWj3oa2II
 OQKxYV0iVNqVeAZ9p6u5YMQrwqAQhTItOctv2XTiO8cvz/5aLI8qS27cL
 5wIfd/NA+mkXmtSc/IFUp6zTAM430ThB9Vt6BeVNEJL3EM1b9KYo6+L2o
 j65s9K3kc7YvPi5dD9Gc5exRO3X7yTBm7xSN2brCUPODJVymoka6QHEpO Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="236133833"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="236133833"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 00:42:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="538926645"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 11 Mar 2022 00:42:24 -0800
Date: Fri, 11 Mar 2022 16:42:08 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Dave Chinner <david@fromorbit.com>
Subject: Re: [PATCH v5 03/13] mm/shmem: Support memfile_notifier
Message-ID: <20220311084208.GB56193@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-4-chao.p.peng@linux.intel.com>
 <20220310230822.GO661808@dread.disaster.area>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310230822.GO661808@dread.disaster.area>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
 Sean Christopherson <seanjc@google.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 11, 2022 at 10:08:22AM +1100, Dave Chinner wrote:
> On Thu, Mar 10, 2022 at 10:09:01PM +0800, Chao Peng wrote:
> > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > 
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
> >  include/linux/shmem_fs.h |  4 +++
> >  mm/shmem.c               | 76 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 80 insertions(+)
> > 
> > diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
> > index 2dde843f28ef..7bb16f2d2825 100644
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
> > @@ -28,6 +29,9 @@ struct shmem_inode_info {
> >  	struct simple_xattrs	xattrs;		/* list of xattrs */
> >  	atomic_t		stop_eviction;	/* hold when working on inode */
> >  	unsigned int		xflags;		/* shmem extended flags */
> > +#ifdef CONFIG_MEMFILE_NOTIFIER
> > +	struct memfile_notifier_list memfile_notifiers;
> > +#endif
> >  	struct inode		vfs_inode;
> >  };
> >  
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 9b31a7056009..7b43e274c9a2 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -903,6 +903,28 @@ static struct folio *shmem_get_partial_folio(struct inode *inode, pgoff_t index)
> >  	return page ? page_folio(page) : NULL;
> >  }
> >  
> > +static void notify_fallocate(struct inode *inode, pgoff_t start, pgoff_t end)
> > +{
> > +#ifdef CONFIG_MEMFILE_NOTIFIER
> > +	struct shmem_inode_info *info = SHMEM_I(inode);
> > +
> > +	memfile_notifier_fallocate(&info->memfile_notifiers, start, end);
> > +#endif
> > +}
> 
> *notify_populate(), not fallocate.  This is a notification that a
> range has been populated, not that the fallocate() syscall was run
> to populate the backing store of a file.
> 
> i.e.  fallocate is the name of a userspace filesystem API that can
> be used to manipulate the backing store of a file in various ways.
> It can both populate and punch away the backing store of a file, and
> some operations that fallocate() can run will do both (e.g.
> FALLOC_FL_ZERO_RANGE) and so could generate both
> notify_invalidate() and a notify_populate() events.

Yes, I fully agreed fallocate syscall has both populating and hole
punching semantics so notify_fallocate can be misleading since we
actually mean populate here.

> 
> Hence "fallocate" as an internal mm namespace or operation does not
> belong anywhere in core MM infrastructure - it should never get used
> anywhere other than the VFS/filesystem layers that implement the
> fallocate() syscall or use it directly.

Will use your suggestion through the series where applied. Thanks for
your suggestion.

Chao
> 
> Cheers,
> 
> Dave.
> 
> -- 
> Dave Chinner
> david@fromorbit.com


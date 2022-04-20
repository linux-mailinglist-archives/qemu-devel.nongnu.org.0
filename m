Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F75507F99
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 05:26:55 +0200 (CEST)
Received: from localhost ([::1]:38722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh0zW-0006L8-BT
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 23:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nh0xH-0005Vl-BQ
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 23:24:35 -0400
Received: from mga02.intel.com ([134.134.136.20]:30181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nh0xB-00089S-KM
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 23:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650425069; x=1681961069;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=ABPdNmHHBR0xLY/Ru6EV3J58j73qsnuwoz1VPUML71M=;
 b=NFd0iAb/OBtYD0ipmxlV26NBzUhjjZLMU7pcV+PZDgksBayDh9V9+dDI
 FLtPGndUT70kAz8PFzKhUUCRJAaZPH1wK/vRXUwJoRXDIU8c/Z+Jr50Ru
 +JgFiphQlvmRM+4Q+GputQDHVlzBDNOXet80xqJ+OrW8EcsAVo1lR92Cw
 m3eqzhJrLZYT3tr+/e7k0dGrescxEr4x2kT9gZYxRVhzAvJv1WmBzY7cD
 vGw6SQE7XQyZnFiLVCfOn0ebg1dHFZX5R+2nmkQiwkbU3BMmMbL8dLDQc
 3HamqatB66dOll3yXX7dy+jfpuEnMf7dW/R9IGL2ToI+NOj3uxBZNzxhZ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="251234281"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="251234281"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 20:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="667599784"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga004.jf.intel.com with ESMTP; 19 Apr 2022 20:24:19 -0700
Date: Wed, 20 Apr 2022 11:24:10 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v5 03/13] mm/shmem: Support memfile_notifier
Message-ID: <20220420032410.GB39591@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-4-chao.p.peng@linux.intel.com>
 <CAGtprH9X-v-R+UiAvdvKgqAqoc4MBJAWTnoEtP+Y2nip_y8Heg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGtprH9X-v-R+UiAvdvKgqAqoc4MBJAWTnoEtP+Y2nip_y8Heg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, Jun Nakajima <jun.nakajima@intel.com>,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, linux-api@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 03:40:09PM -0700, Vishal Annapurve wrote:
> On Thu, Mar 10, 2022 at 6:10 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >
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
> >         struct simple_xattrs    xattrs;         /* list of xattrs */
> >         atomic_t                stop_eviction;  /* hold when working on inode */
> >         unsigned int            xflags;         /* shmem extended flags */
> > +#ifdef CONFIG_MEMFILE_NOTIFIER
> > +       struct memfile_notifier_list memfile_notifiers;
> > +#endif
> >         struct inode            vfs_inode;
> >  };
> >
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 9b31a7056009..7b43e274c9a2 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -903,6 +903,28 @@ static struct folio *shmem_get_partial_folio(struct inode *inode, pgoff_t index)
> >         return page ? page_folio(page) : NULL;
> >  }
> >
> > +static void notify_fallocate(struct inode *inode, pgoff_t start, pgoff_t end)
> > +{
> > +#ifdef CONFIG_MEMFILE_NOTIFIER
> > +       struct shmem_inode_info *info = SHMEM_I(inode);
> > +
> > +       memfile_notifier_fallocate(&info->memfile_notifiers, start, end);
> > +#endif
> > +}
> > +
> > +static void notify_invalidate_page(struct inode *inode, struct folio *folio,
> > +                                  pgoff_t start, pgoff_t end)
> > +{
> > +#ifdef CONFIG_MEMFILE_NOTIFIER
> > +       struct shmem_inode_info *info = SHMEM_I(inode);
> > +
> > +       start = max(start, folio->index);
> > +       end = min(end, folio->index + folio_nr_pages(folio));
> > +
> > +       memfile_notifier_invalidate(&info->memfile_notifiers, start, end);
> > +#endif
> > +}
> > +
> >  /*
> >   * Remove range of pages and swap entries from page cache, and free them.
> >   * If !unfalloc, truncate or punch hole; if unfalloc, undo failed fallocate.
> > @@ -946,6 +968,8 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, loff_t lend,
> >                         }
> >                         index += folio_nr_pages(folio) - 1;
> >
> > +                       notify_invalidate_page(inode, folio, start, end);
> > +
> >                         if (!unfalloc || !folio_test_uptodate(folio))
> >                                 truncate_inode_folio(mapping, folio);
> >                         folio_unlock(folio);
> > @@ -1019,6 +1043,9 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, loff_t lend,
> >                                         index--;
> >                                         break;
> >                                 }
> > +
> > +                               notify_invalidate_page(inode, folio, start, end);
> > +
> 
> Should this be done in batches or done once for all of range [start, end)?

Batching is definitely prefered. Will look at that.

Thanks,
Chao
> 
> >                                 VM_BUG_ON_FOLIO(folio_test_writeback(folio),
> >                                                 folio);
> >                                 truncate_inode_folio(mapping, folio);
> > @@ -2279,6 +2306,9 @@ static struct inode *shmem_get_inode(struct super_block *sb, const struct inode
> >                 info->flags = flags & VM_NORESERVE;
> >                 INIT_LIST_HEAD(&info->shrinklist);
> >                 INIT_LIST_HEAD(&info->swaplist);
> > +#ifdef CONFIG_MEMFILE_NOTIFIER
> > +               memfile_notifier_list_init(&info->memfile_notifiers);
> > +#endif
> >                 simple_xattrs_init(&info->xattrs);
> >                 cache_no_acl(inode);
> >                 mapping_set_large_folios(inode->i_mapping);
> > @@ -2802,6 +2832,7 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
> >         if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + len > inode->i_size)
> >                 i_size_write(inode, offset + len);
> >         inode->i_ctime = current_time(inode);
> > +       notify_fallocate(inode, start, end);
> >  undone:
> >         spin_lock(&inode->i_lock);
> >         inode->i_private = NULL;
> > @@ -3909,6 +3940,47 @@ static struct file_system_type shmem_fs_type = {
> >         .fs_flags       = FS_USERNS_MOUNT,
> >  };
> >
> > +#ifdef CONFIG_MEMFILE_NOTIFIER
> > +static long shmem_get_lock_pfn(struct inode *inode, pgoff_t offset, int *order)
> > +{
> > +       struct page *page;
> > +       int ret;
> > +
> > +       ret = shmem_getpage(inode, offset, &page, SGP_NOALLOC);
> > +       if (ret)
> > +               return ret;
> > +
> > +       *order = thp_order(compound_head(page));
> > +
> > +       return page_to_pfn(page);
> > +}
> > +
> > +static void shmem_put_unlock_pfn(unsigned long pfn)
> > +{
> > +       struct page *page = pfn_to_page(pfn);
> > +
> > +       VM_BUG_ON_PAGE(!PageLocked(page), page);
> > +
> > +       set_page_dirty(page);
> > +       unlock_page(page);
> > +       put_page(page);
> > +}
> > +
> > +static struct memfile_notifier_list* shmem_get_notifier_list(struct inode *inode)
> > +{
> > +       if (!shmem_mapping(inode->i_mapping))
> > +               return NULL;
> > +
> > +       return  &SHMEM_I(inode)->memfile_notifiers;
> > +}
> > +
> > +static struct memfile_backing_store shmem_backing_store = {
> > +       .pfn_ops.get_lock_pfn = shmem_get_lock_pfn,
> > +       .pfn_ops.put_unlock_pfn = shmem_put_unlock_pfn,
> > +       .get_notifier_list = shmem_get_notifier_list,
> > +};
> > +#endif /* CONFIG_MEMFILE_NOTIFIER */
> > +
> >  int __init shmem_init(void)
> >  {
> >         int error;
> > @@ -3934,6 +4006,10 @@ int __init shmem_init(void)
> >         else
> >                 shmem_huge = SHMEM_HUGE_NEVER; /* just in case it was patched */
> >  #endif
> > +
> > +#ifdef CONFIG_MEMFILE_NOTIFIER
> > +       memfile_register_backing_store(&shmem_backing_store);
> > +#endif
> >         return 0;
> >
> >  out1:
> > --
> > 2.17.1
> >


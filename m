Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCD84D5512
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 00:09:59 +0100 (CET)
Received: from localhost ([::1]:35458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSRuw-000143-4e
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 18:09:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@fromorbit.com>)
 id 1nSRti-0000EI-RG
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 18:08:43 -0500
Received: from mail105.syd.optusnet.com.au ([211.29.132.249]:57092)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1nSRte-0001Hi-K1
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 18:08:41 -0500
Received: from dread.disaster.area (pa49-186-150-27.pa.vic.optusnet.com.au
 [49.186.150.27])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 73D1310E29AA;
 Fri, 11 Mar 2022 10:08:23 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1nSRtO-003xhf-9L; Fri, 11 Mar 2022 10:08:22 +1100
Date: Fri, 11 Mar 2022 10:08:22 +1100
From: Dave Chinner <david@fromorbit.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Subject: Re: [PATCH v5 03/13] mm/shmem: Support memfile_notifier
Message-ID: <20220310230822.GO661808@dread.disaster.area>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-4-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310140911.50924-4-chao.p.peng@linux.intel.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=deDjYVbe c=1 sm=1 tr=0 ts=622a84f0
 a=sPqof0Mm7fxWrhYUF33ZaQ==:117 a=sPqof0Mm7fxWrhYUF33ZaQ==:17
 a=kj9zAlcOel0A:10 a=o8Y5sQTvuykA:10 a=QyXUC8HyAAAA:8 a=7-415B0cAAAA:8
 a=RCrhQ6IY2R1Uy-UsxHgA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
Received-SPF: none client-ip=211.29.132.249; envelope-from=david@fromorbit.com;
 helo=mail105.syd.optusnet.com.au
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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

On Thu, Mar 10, 2022 at 10:09:01PM +0800, Chao Peng wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> It maintains a memfile_notifier list in shmem_inode_info structure and
> implements memfile_pfn_ops callbacks defined by memfile_notifier. It
> then exposes them to memfile_notifier via
> shmem_get_memfile_notifier_info.
> 
> We use SGP_NOALLOC in shmem_get_lock_pfn since the pages should be
> allocated by userspace for private memory. If there is no pages
> allocated at the offset then error should be returned so KVM knows that
> the memory is not private memory.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  include/linux/shmem_fs.h |  4 +++
>  mm/shmem.c               | 76 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
> 
> diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
> index 2dde843f28ef..7bb16f2d2825 100644
> --- a/include/linux/shmem_fs.h
> +++ b/include/linux/shmem_fs.h
> @@ -9,6 +9,7 @@
>  #include <linux/percpu_counter.h>
>  #include <linux/xattr.h>
>  #include <linux/fs_parser.h>
> +#include <linux/memfile_notifier.h>
>  
>  /* inode in-kernel data */
>  
> @@ -28,6 +29,9 @@ struct shmem_inode_info {
>  	struct simple_xattrs	xattrs;		/* list of xattrs */
>  	atomic_t		stop_eviction;	/* hold when working on inode */
>  	unsigned int		xflags;		/* shmem extended flags */
> +#ifdef CONFIG_MEMFILE_NOTIFIER
> +	struct memfile_notifier_list memfile_notifiers;
> +#endif
>  	struct inode		vfs_inode;
>  };
>  
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 9b31a7056009..7b43e274c9a2 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -903,6 +903,28 @@ static struct folio *shmem_get_partial_folio(struct inode *inode, pgoff_t index)
>  	return page ? page_folio(page) : NULL;
>  }
>  
> +static void notify_fallocate(struct inode *inode, pgoff_t start, pgoff_t end)
> +{
> +#ifdef CONFIG_MEMFILE_NOTIFIER
> +	struct shmem_inode_info *info = SHMEM_I(inode);
> +
> +	memfile_notifier_fallocate(&info->memfile_notifiers, start, end);
> +#endif
> +}

*notify_populate(), not fallocate.  This is a notification that a
range has been populated, not that the fallocate() syscall was run
to populate the backing store of a file.

i.e.  fallocate is the name of a userspace filesystem API that can
be used to manipulate the backing store of a file in various ways.
It can both populate and punch away the backing store of a file, and
some operations that fallocate() can run will do both (e.g.
FALLOC_FL_ZERO_RANGE) and so could generate both
notify_invalidate() and a notify_populate() events.

Hence "fallocate" as an internal mm namespace or operation does not
belong anywhere in core MM infrastructure - it should never get used
anywhere other than the VFS/filesystem layers that implement the
fallocate() syscall or use it directly.

Cheers,

Dave.

-- 
Dave Chinner
david@fromorbit.com


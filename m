Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3F64AE288
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:24:02 +0100 (CET)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHX1t-00085H-Fe
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:24:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rppt@kernel.org>) id 1nHVGG-0006QW-9M
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:30:56 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:44192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rppt@kernel.org>) id 1nHVFr-0007K0-0N
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:30:20 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 803D860B66;
 Tue,  8 Feb 2022 18:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE202C004E1;
 Tue,  8 Feb 2022 18:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644345012;
 bh=K1+hCMMTsSLAKEwPC2EsRQPw6UUAUoQD7/b994l5uXs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hU0/lVYyJT31vQOIQHTGA9EAF5MsH0yBJrrzVhzs5zFaILZgEK67dSeqfC+QFLTOv
 wDEHu/wGnGQw/izyM8f2rVPRjKCmfSIBJWN6OXDQqz9FlGcsE9HTE8xL9T+wK1nCqo
 VYSc96T4yxQHoazACG8qE7ItaZZ0/+e5f4t9qECopa0WKxq14XUpwujb/465+ADL4l
 ZrqaO8XGD1kFMx77cphrzAUlOLE0AJ1YRnylOk654H7ZFivYUhkhnpZdMA+z4jUb9o
 osb53N7WGxlLdzYzz0RvOz0lLWVajHKxZvJpjtYwCPk76/Ufz4GDZ4WuwK6HIcASMh
 DEm/eb7KgyCbQ==
Date: Tue, 8 Feb 2022 20:29:56 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chao Peng <chao.p.peng@linux.intel.com>
Subject: Re: [PATCH v4 04/12] mm/shmem: Support memfile_notifier
Message-ID: <YgK2pDB34AsqCHd0@kernel.org>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-5-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118132121.31388-5-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=rppt@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi,

On Tue, Jan 18, 2022 at 09:21:13PM +0800, Chao Peng wrote:
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
>  include/linux/shmem_fs.h |  4 ++
>  mm/memfile_notifier.c    | 12 +++++-
>  mm/shmem.c               | 81 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 96 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
> index 166158b6e917..461633587eaf 100644
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
> @@ -24,6 +25,9 @@ struct shmem_inode_info {
>  	struct shared_policy	policy;		/* NUMA memory alloc policy */
>  	struct simple_xattrs	xattrs;		/* list of xattrs */
>  	atomic_t		stop_eviction;	/* hold when working on inode */
> +#ifdef CONFIG_MEMFILE_NOTIFIER
> +	struct memfile_notifier_list memfile_notifiers;
> +#endif
>  	struct inode		vfs_inode;
>  };
>  
> diff --git a/mm/memfile_notifier.c b/mm/memfile_notifier.c
> index 8171d4601a04..b4699cbf629e 100644
> --- a/mm/memfile_notifier.c
> +++ b/mm/memfile_notifier.c
> @@ -41,11 +41,21 @@ void memfile_notifier_fallocate(struct memfile_notifier_list *list,
>  	srcu_read_unlock(&srcu, id);
>  }
>  
> +#ifdef CONFIG_SHMEM
> +extern int shmem_get_memfile_notifier_info(struct inode *inode,
> +					struct memfile_notifier_list **list,
> +					struct memfile_pfn_ops **ops);
> +#endif
> +
>  static int memfile_get_notifier_info(struct inode *inode,
>  				     struct memfile_notifier_list **list,
>  				     struct memfile_pfn_ops **ops)
>  {
> -	return -EOPNOTSUPP;
> +	int ret = -EOPNOTSUPP;
> +#ifdef CONFIG_SHMEM
> +	ret = shmem_get_memfile_notifier_info(inode, list, ops);
> +#endif

This looks backwards. Can we have some register method for memory backing
store and call it from shmem.c?

> +	return ret;
>  }
>  
>  int memfile_register_notifier(struct inode *inode,

-- 
Sincerely yours,
Mike.


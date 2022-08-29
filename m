Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 783EF5A5027
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 17:26:25 +0200 (CEST)
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSgeZ-0005UJ-EK
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 11:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oSgcS-0003OO-3j
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 11:24:08 -0400
Received: from mga09.intel.com ([134.134.136.24]:19204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oSgcP-0001Ob-Hy
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 11:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661786645; x=1693322645;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=ojePtwk4DKFWlMS7jqKVqTyPcBJTssA2BelkXh7kDvA=;
 b=bbtwDK2AVMdlpvm3Vxq7qdghkqnq6Zz9g8Bu6gmt/BQGZl31P/ya1D5x
 U1Hfdcw0XD61gBk006UBG+s2++2nxn8EvKgOMrtdKcO2grWzsho3nhcCJ
 iENT8CkV76TPavJi/cM4o+LGNnOPwPkeARSr+0L8UOn+NAal+gk0WFqx1
 kJf1S3QXdqioqDFreOdccGqagc2w/Lek+SpggV91FMUh+fzMoPWTwUVL7
 /zmLSe021yX0AeYkYLrVPJZx6PNYLjzyRSp/t3s1v/aQ8P0mpsH5GQRxe
 5QguSjpltCmyjoxpSNWS4M+MyLCkWl7hLC/ef7r+vV4KvQFobinP6/+sH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="295699272"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="295699272"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 08:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="640972615"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 29 Aug 2022 08:23:11 -0700
Date: Mon, 29 Aug 2022 23:18:30 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Fuad Tabba <tabba@google.com>
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
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 01/14] mm: Add F_SEAL_AUTO_ALLOCATE seal to memfd
Message-ID: <20220829151830.GC1586678@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-2-chao.p.peng@linux.intel.com>
 <CA+EHjTzRcEQcZRJixBa=fBXd4=-oZK=unmBLwBAFVixCPfY-dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzRcEQcZRJixBa=fBXd4=-oZK=unmBLwBAFVixCPfY-dQ@mail.gmail.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 26, 2022 at 04:19:32PM +0100, Fuad Tabba wrote:
> Hi Chao,
> 
> On Wed, Jul 6, 2022 at 9:25 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >
> > Normally, a write to unallocated space of a file or the hole of a sparse
> > file automatically causes space allocation, for memfd, this equals to
> > memory allocation. This new seal prevents such automatically allocating,
> > either this is from a direct write() or a write on the previously
> > mmap-ed area. The seal does not prevent fallocate() so an explicit
> > fallocate() can still cause allocating and can be used to reserve
> > memory.
> >
> > This is used to prevent unintentional allocation from userspace on a
> > stray or careless write and any intentional allocation should use an
> > explicit fallocate(). One of the main usecases is to avoid memory double
> > allocation for confidential computing usage where we use two memfds to
> > back guest memory and at a single point only one memfd is alive and we
> > want to prevent memory allocation for the other memfd which may have
> > been mmap-ed previously. More discussion can be found at:
> >
> >   https://lkml.org/lkml/2022/6/14/1255
> >
> > Suggested-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >  include/uapi/linux/fcntl.h |  1 +
> >  mm/memfd.c                 |  3 ++-
> >  mm/shmem.c                 | 16 ++++++++++++++--
> >  3 files changed, 17 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> > index 2f86b2ad6d7e..98bdabc8e309 100644
> > --- a/include/uapi/linux/fcntl.h
> > +++ b/include/uapi/linux/fcntl.h
> > @@ -43,6 +43,7 @@
> >  #define F_SEAL_GROW    0x0004  /* prevent file from growing */
> >  #define F_SEAL_WRITE   0x0008  /* prevent writes */
> >  #define F_SEAL_FUTURE_WRITE    0x0010  /* prevent future writes while mapped */
> > +#define F_SEAL_AUTO_ALLOCATE   0x0020  /* prevent allocation for writes */
> 
> I think this should also be added to tools/include/uapi/linux/fcntl.h

Yes, thanks.

Chao
> 
> Cheers,
> /fuad
> 
> 
> >  /* (1U << 31) is reserved for signed error codes */
> >
> >  /*
> > diff --git a/mm/memfd.c b/mm/memfd.c
> > index 08f5f8304746..2afd898798e4 100644
> > --- a/mm/memfd.c
> > +++ b/mm/memfd.c
> > @@ -150,7 +150,8 @@ static unsigned int *memfd_file_seals_ptr(struct file *file)
> >                      F_SEAL_SHRINK | \
> >                      F_SEAL_GROW | \
> >                      F_SEAL_WRITE | \
> > -                    F_SEAL_FUTURE_WRITE)
> > +                    F_SEAL_FUTURE_WRITE | \
> > +                    F_SEAL_AUTO_ALLOCATE)
> >
> >  static int memfd_add_seals(struct file *file, unsigned int seals)
> >  {
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index a6f565308133..6c8aef15a17d 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -2051,6 +2051,8 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
> >         struct vm_area_struct *vma = vmf->vma;
> >         struct inode *inode = file_inode(vma->vm_file);
> >         gfp_t gfp = mapping_gfp_mask(inode->i_mapping);
> > +       struct shmem_inode_info *info = SHMEM_I(inode);
> > +       enum sgp_type sgp;
> >         int err;
> >         vm_fault_t ret = VM_FAULT_LOCKED;
> >
> > @@ -2113,7 +2115,12 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
> >                 spin_unlock(&inode->i_lock);
> >         }
> >
> > -       err = shmem_getpage_gfp(inode, vmf->pgoff, &vmf->page, SGP_CACHE,
> > +       if (unlikely(info->seals & F_SEAL_AUTO_ALLOCATE))
> > +               sgp = SGP_NOALLOC;
> > +       else
> > +               sgp = SGP_CACHE;
> > +
> > +       err = shmem_getpage_gfp(inode, vmf->pgoff, &vmf->page, sgp,
> >                                   gfp, vma, vmf, &ret);
> >         if (err)
> >                 return vmf_error(err);
> > @@ -2459,6 +2466,7 @@ shmem_write_begin(struct file *file, struct address_space *mapping,
> >         struct inode *inode = mapping->host;
> >         struct shmem_inode_info *info = SHMEM_I(inode);
> >         pgoff_t index = pos >> PAGE_SHIFT;
> > +       enum sgp_type sgp;
> >         int ret = 0;
> >
> >         /* i_rwsem is held by caller */
> > @@ -2470,7 +2478,11 @@ shmem_write_begin(struct file *file, struct address_space *mapping,
> >                         return -EPERM;
> >         }
> >
> > -       ret = shmem_getpage(inode, index, pagep, SGP_WRITE);
> > +       if (unlikely(info->seals & F_SEAL_AUTO_ALLOCATE))
> > +               sgp = SGP_NOALLOC;
> > +       else
> > +               sgp = SGP_WRITE;
> > +       ret = shmem_getpage(inode, index, pagep, sgp);
> >
> >         if (ret)
> >                 return ret;
> > --
> > 2.25.1
> >


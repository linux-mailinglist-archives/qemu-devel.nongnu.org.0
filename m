Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86A850D075
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 10:18:42 +0200 (CEST)
Received: from localhost ([::1]:49432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niXS5-0005CS-O9
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 04:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1niXPF-0004QY-I4
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 04:15:45 -0400
Received: from mga17.intel.com ([192.55.52.151]:6891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1niXPD-00015u-Eq
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 04:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650788143; x=1682324143;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=R5/zZF/IyIdTwmbR+/CpSjzujNVRZET5P/KUYqz4hbY=;
 b=FeGmg3/771vSlcoCPk5Y9e3NM4Dy3+hG9VcRvqy59BOieTVa0BMjcPDW
 WFIHsRxlHGC8tgrIpbLV6N0xk20X/D///quEGzbGPBr+JygEhArhaAm0E
 DZ6UCoe2LGEEeP4LVEWZQVmG02V+j4/5Dm71g2CAcx8YbOqy5KIuE1V2P
 7XPPg1QSRgtmWvxLzvTZPE2+kSxYcprk4b10TM4jKmuDSRSCOzRfpjee7
 x7YCZdTPjGSqWNyH/Qk18jtpy8txsMjxoFSmaun+uhiFyNzEx1Nu0yNfy
 NTfCYWN9hYBF/iIrlrzdaoEfA0NXA0r1X62M7JYfnRbgs8Zx9M38alMFX w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10326"; a="245584697"
X-IronPort-AV: E=Sophos;i="5.90,286,1643702400"; d="scan'208";a="245584697"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2022 01:15:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,286,1643702400"; d="scan'208";a="704147618"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 24 Apr 2022 01:15:34 -0700
Date: Sun, 24 Apr 2022 16:15:25 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v5 01/13] mm/memfd: Introduce MFD_INACCESSIBLE flag
Message-ID: <20220424081525.GB4207@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-2-chao.p.peng@linux.intel.com>
 <CAGtprH9sncAeS7-=ewr07B=Q+htVDdwRJhbqF+GhehHMYmvw5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGtprH9sncAeS7-=ewr07B=Q+htVDdwRJhbqF+GhehHMYmvw5w@mail.gmail.com>
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

On Fri, Apr 22, 2022 at 10:43:50PM -0700, Vishal Annapurve wrote:
> On Thu, Mar 10, 2022 at 6:09 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >
> > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> >
> > Introduce a new memfd_create() flag indicating the content of the
> > created memfd is inaccessible from userspace through ordinary MMU
> > access (e.g., read/write/mmap). However, the file content can be
> > accessed via a different mechanism (e.g. KVM MMU) indirectly.
> >
> > It provides semantics required for KVM guest private memory support
> > that a file descriptor with this flag set is going to be used as the
> > source of guest memory in confidential computing environments such
> > as Intel TDX/AMD SEV but may not be accessible from host userspace.
> >
> > Since page migration/swapping is not yet supported for such usages
> > so these pages are currently marked as UNMOVABLE and UNEVICTABLE
> > which makes them behave like long-term pinned pages.
> >
> > The flag can not coexist with MFD_ALLOW_SEALING, future sealing is
> > also impossible for a memfd created with this flag.
> >
> > At this time only shmem implements this flag.
> >
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >  include/linux/shmem_fs.h   |  7 +++++
> >  include/uapi/linux/memfd.h |  1 +
> >  mm/memfd.c                 | 26 +++++++++++++++--
> >  mm/shmem.c                 | 57 ++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 88 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
> > index e65b80ed09e7..2dde843f28ef 100644
> > --- a/include/linux/shmem_fs.h
> > +++ b/include/linux/shmem_fs.h
> > @@ -12,6 +12,9 @@
> >
> >  /* inode in-kernel data */
> >
> > +/* shmem extended flags */
> > +#define SHM_F_INACCESSIBLE     0x0001  /* prevent ordinary MMU access (e.g. read/write/mmap) to file content */
> > +
> >  struct shmem_inode_info {
> >         spinlock_t              lock;
> >         unsigned int            seals;          /* shmem seals */
> > @@ -24,6 +27,7 @@ struct shmem_inode_info {
> >         struct shared_policy    policy;         /* NUMA memory alloc policy */
> >         struct simple_xattrs    xattrs;         /* list of xattrs */
> >         atomic_t                stop_eviction;  /* hold when working on inode */
> > +       unsigned int            xflags;         /* shmem extended flags */
> >         struct inode            vfs_inode;
> >  };
> >
> > @@ -61,6 +65,9 @@ extern struct file *shmem_file_setup(const char *name,
> >                                         loff_t size, unsigned long flags);
> >  extern struct file *shmem_kernel_file_setup(const char *name, loff_t size,
> >                                             unsigned long flags);
> > +extern struct file *shmem_file_setup_xflags(const char *name, loff_t size,
> > +                                           unsigned long flags,
> > +                                           unsigned int xflags);
> >  extern struct file *shmem_file_setup_with_mnt(struct vfsmount *mnt,
> >                 const char *name, loff_t size, unsigned long flags);
> >  extern int shmem_zero_setup(struct vm_area_struct *);
> > diff --git a/include/uapi/linux/memfd.h b/include/uapi/linux/memfd.h
> > index 7a8a26751c23..48750474b904 100644
> > --- a/include/uapi/linux/memfd.h
> > +++ b/include/uapi/linux/memfd.h
> > @@ -8,6 +8,7 @@
> >  #define MFD_CLOEXEC            0x0001U
> >  #define MFD_ALLOW_SEALING      0x0002U
> >  #define MFD_HUGETLB            0x0004U
> > +#define MFD_INACCESSIBLE       0x0008U
> >
> >  /*
> >   * Huge page size encoding when MFD_HUGETLB is specified, and a huge page
> > diff --git a/mm/memfd.c b/mm/memfd.c
> > index 9f80f162791a..74d45a26cf5d 100644
> > --- a/mm/memfd.c
> > +++ b/mm/memfd.c
> > @@ -245,16 +245,20 @@ long memfd_fcntl(struct file *file, unsigned int cmd, unsigned long arg)
> >  #define MFD_NAME_PREFIX_LEN (sizeof(MFD_NAME_PREFIX) - 1)
> >  #define MFD_NAME_MAX_LEN (NAME_MAX - MFD_NAME_PREFIX_LEN)
> >
> > -#define MFD_ALL_FLAGS (MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB)
> > +#define MFD_ALL_FLAGS (MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB | \
> > +                      MFD_INACCESSIBLE)
> >
> >  SYSCALL_DEFINE2(memfd_create,
> >                 const char __user *, uname,
> >                 unsigned int, flags)
> >  {
> > +       struct address_space *mapping;
> >         unsigned int *file_seals;
> > +       unsigned int xflags;
> >         struct file *file;
> >         int fd, error;
> >         char *name;
> > +       gfp_t gfp;
> >         long len;
> >
> >         if (!(flags & MFD_HUGETLB)) {
> > @@ -267,6 +271,10 @@ SYSCALL_DEFINE2(memfd_create,
> >                         return -EINVAL;
> >         }
> >
> > +       /* Disallow sealing when MFD_INACCESSIBLE is set. */
> > +       if (flags & MFD_INACCESSIBLE && flags & MFD_ALLOW_SEALING)
> > +               return -EINVAL;
> > +
> >         /* length includes terminating zero */
> >         len = strnlen_user(uname, MFD_NAME_MAX_LEN + 1);
> >         if (len <= 0)
> > @@ -301,8 +309,11 @@ SYSCALL_DEFINE2(memfd_create,
> >                                         HUGETLB_ANONHUGE_INODE,
> >                                         (flags >> MFD_HUGE_SHIFT) &
> >                                         MFD_HUGE_MASK);
> 
> Should hugetlbfs also be modified to be a backing store for private
> memory like shmem when hugepages are to be used?
> As of now, this series doesn't seem to support using private memfds
> with backing hugepages.
> 

Right, as the first step tmpfs is the first backing store supported,
hugetlbfs would be potentially the second one to support once the user
semantics and kAPIs exposed to KVM are well understood.

Thanks,
Chao


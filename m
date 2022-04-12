Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A206D4FE1D0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 15:13:57 +0200 (CEST)
Received: from localhost ([::1]:48876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neGLE-0003Tz-Gz
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 09:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1neGJD-0002ir-Ot
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 09:11:51 -0400
Received: from mga02.intel.com ([134.134.136.20]:58899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1neGJB-00057U-Ef
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 09:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649769109; x=1681305109;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=1KeYAHX9pm/ikMj2hiQRjLWmiTvrzP7m01hIo3GA0o4=;
 b=YMbD5Ndz39XwXKC4oq9xr6U64pLUQa8s+uhunHW1IL0ZeGKXIsTC597t
 e68CiGWNpkAklot6lZ7kZtQPp2Ptpq9rn1YkEgIAWbuTDPwg7M7YZuQPp
 2858zY/RbzatAXkOU+UeXglcCcv0HrbGowiBRKmXMB2soZMFcievtgnPr
 CG3HNgxmkcKcxXYdTX2FWLp70teP3UD/TIgO3nuBfvqFDtkYDILn3S6YB
 5e8IIufkGPgXwB78TGDdzTAH4OQeNfCO76YDmskixRIAg0Pys1T/kJ/fb
 C7bkBmRzlIwScCEg21P7bmczhPa7e+GUR95n47GAk4AzX04OsD1Igjliy Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="249654520"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="249654520"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="699828702"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2022 06:11:38 -0700
Date: Tue, 12 Apr 2022 21:11:28 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v5 01/13] mm/memfd: Introduce MFD_INACCESSIBLE flag
Message-ID: <20220412131128.GE8013@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-2-chao.p.peng@linux.intel.com>
 <20220411151023.4nx34pxyg5amj44m@box.shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411151023.4nx34pxyg5amj44m@box.shutemov.name>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
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

On Mon, Apr 11, 2022 at 06:10:23PM +0300, Kirill A. Shutemov wrote:
> On Thu, Mar 10, 2022 at 10:08:59PM +0800, Chao Peng wrote:
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
> > +#define SHM_F_INACCESSIBLE	0x0001  /* prevent ordinary MMU access (e.g. read/write/mmap) to file content */
> > +
> >  struct shmem_inode_info {
> >  	spinlock_t		lock;
> >  	unsigned int		seals;		/* shmem seals */
> > @@ -24,6 +27,7 @@ struct shmem_inode_info {
> >  	struct shared_policy	policy;		/* NUMA memory alloc policy */
> >  	struct simple_xattrs	xattrs;		/* list of xattrs */
> >  	atomic_t		stop_eviction;	/* hold when working on inode */
> > +	unsigned int		xflags;		/* shmem extended flags */
> >  	struct inode		vfs_inode;
> >  };
> >  
> 
> AFAICS, only two bits of 'flags' are used. And that's very strange that
> VM_ flags are used for the purpose. My guess that someone was lazy to
> introduce new constants for this.
> 
> I think we should fix this: introduce SHM_F_LOCKED and SHM_F_NORESERVE
> alongside with SHM_F_INACCESSIBLE and stuff them all into info->flags.
> It also makes shmem_file_setup_xflags() go away.

Did a quick search and sounds we only use SHM_F_LOCKED/SHM_F_NORESERVE and
that definitely don't have to be VM_ flags.

Chao
> 
> -- 
>  Kirill A. Shutemov


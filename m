Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AA84864FE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:11:51 +0100 (CET)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5SYY-0008Fd-KE
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:11:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n5SUR-00060b-8u
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:07:35 -0500
Received: from mga02.intel.com ([134.134.136.20]:52815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n5SUL-0007Ab-9t
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641474449; x=1673010449;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=znSuPJrdIfXZBPs+/0Wp7F8ajuSAzZTJWGMLAVEn470=;
 b=kPVTIttwgVhvQPYGIfxL+xqP7d+J7CKeo4eI8bdS7ZhdER7CEi+EJXxe
 KEG1/eEWcL8MNT6KZABXR5ligqVZXjTUHx1yNWVy1LIUE/yPezcUkbXGN
 z/I29qaOh0l+2SqGJWsQzUW0uEJqMIJLlDx7wtmbwW+cGdh0+Q1uwAY2P
 EoxndN0r6C85lPntjn11aHKdQAJt3DvD0ybnDbN3B7f0/mJyRL2j/x7TY
 gsjQd91dIVTB67hTj09S10G09Qw4OBrgVN8Zx15FQnJp/OGt5PueChDeD
 EAG9hniF/Vf4+cQi2E1I81/McwLi8es1MY2xep8rk0NWQkc1B/0SVM6wX A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="229980550"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="229980550"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 05:07:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="526972284"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 06 Jan 2022 05:07:19 -0800
Date: Thu, 6 Jan 2022 21:06:38 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 kvm/queue 01/16] mm/shmem: Introduce F_SEAL_INACCESSIBLE
Message-ID: <20220106130638.GB43371@chaop.bj.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-2-chao.p.peng@linux.intel.com>
 <7eb40902-45dd-9193-37f1-efaca381529b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eb40902-45dd-9193-37f1-efaca381529b@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 kvm@vger.kernel.org, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 04, 2022 at 03:22:07PM +0100, David Hildenbrand wrote:
> On 23.12.21 13:29, Chao Peng wrote:
> > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > 
> > Introduce a new seal F_SEAL_INACCESSIBLE indicating the content of
> > the file is inaccessible from userspace in any possible ways like
> > read(),write() or mmap() etc.
> > 
> > It provides semantics required for KVM guest private memory support
> > that a file descriptor with this seal set is going to be used as the
> > source of guest memory in confidential computing environments such
> > as Intel TDX/AMD SEV but may not be accessible from host userspace.
> > 
> > At this time only shmem implements this seal.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >  include/uapi/linux/fcntl.h |  1 +
> >  mm/shmem.c                 | 37 +++++++++++++++++++++++++++++++++++--
> >  2 files changed, 36 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> > index 2f86b2ad6d7e..e2bad051936f 100644
> > --- a/include/uapi/linux/fcntl.h
> > +++ b/include/uapi/linux/fcntl.h
> > @@ -43,6 +43,7 @@
> >  #define F_SEAL_GROW	0x0004	/* prevent file from growing */
> >  #define F_SEAL_WRITE	0x0008	/* prevent writes */
> >  #define F_SEAL_FUTURE_WRITE	0x0010  /* prevent future writes while mapped */
> > +#define F_SEAL_INACCESSIBLE	0x0020  /* prevent file from accessing */
> 
> I think this needs more clarification: the file content can still be
> accessed using in-kernel mechanisms such as MEMFD_OPS for KVM. It
> effectively disallows traditional access to a file (read/write/mmap)
> that will result in ordinary MMU access to file content.
> 
> Not sure how to best clarify that: maybe, prevent ordinary MMU access
> (e.g., read/write/mmap) to file content?

Or: prevent userspace access (e.g., read/write/mmap) to file content?
> 
> >  /* (1U << 31) is reserved for signed error codes */
> >  
> >  /*
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 18f93c2d68f1..faa7e9b1b9bc 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -1098,6 +1098,10 @@ static int shmem_setattr(struct user_namespace *mnt_userns,
> >  		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
> >  			return -EPERM;
> >  
> > +		if ((info->seals & F_SEAL_INACCESSIBLE) &&
> > +		    (newsize & ~PAGE_MASK))
> > +			return -EINVAL;
> > +
> 
> What happens when sealing and there are existing mmaps?

I think this is similar to ftruncate, in either case we just allow that.
The existing mmaps will be unmapped and KVM will be notified to
invalidate the mapping in the secondary MMU as well. This assume we
trust the userspace even though it can not access the file content.

Thanks,
Chao
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb


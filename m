Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049D7498135
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 14:34:50 +0100 (CET)
Received: from localhost ([::1]:51384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBzUe-0002sY-NV
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 08:34:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nBzQN-0001br-Hy
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 08:30:30 -0500
Received: from mga03.intel.com ([134.134.136.65]:59327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nBzQK-0005j8-5G
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 08:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643031020; x=1674567020;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=s3MS9jlacq/GjKUc1J7BgRzARDrYpUsH/uofSxi2lpg=;
 b=PKiSghyHHSMBD2Ikv/GZTc6xV1dkUpPItAc+EvGEEpA9gTXuSg46K+5p
 KqdyEmNgXtw70rKrM2D/khwAXEDpHs1k4YFfX4a+uI0sSPej4lEWAQvtc
 KlF/4Lr6eceXyAfo4+drzVXE6EnAZSgug0IiQ4zNZ1N+tBR3DeyE4B+SS
 Ua6gA1Se3KjAPQVtwzZ0vmuqwH2oezstz6Z3vx+C/wTrbX7ClUpk4r9y1
 aCx9i2QITbl22pLVC9xgiUhXp2tB/sYZws7KgxoV2Kps2E9rgx05GVQsq
 pk6wK/w6R8QB2uJKii34s8El/bRBvTqQR3Ilh60KEkl0KkEuGWdslqgkI Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="245988833"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="245988833"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 05:30:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="532077916"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga007.fm.intel.com with ESMTP; 24 Jan 2022 05:30:05 -0800
Date: Mon, 24 Jan 2022 21:29:36 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v4 02/12] mm/memfd: Introduce MFD_INACCESSIBLE flag
Message-ID: <20220124132936.GA55051@chaop.bj.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-3-chao.p.peng@linux.intel.com>
 <8f1eba03-e5e9-e9fc-084d-0ef683093d65@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f1eba03-e5e9-e9fc-084d-0ef683093d65@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Fri, Jan 21, 2022 at 03:50:55PM +0000, Steven Price wrote:
> On 18/01/2022 13:21, Chao Peng wrote:
> > Introduce a new memfd_create() flag indicating the content of the
> > created memfd is inaccessible from userspace. It does this by force
> > setting F_SEAL_INACCESSIBLE seal when the file is created. It also set
> > F_SEAL_SEAL to prevent future sealing, which means, it can not coexist
> > with MFD_ALLOW_SEALING.
> > 
> > The pages backed by such memfd will be used as guest private memory in
> > confidential computing environments such as Intel TDX/AMD SEV. Since
> > page migration/swapping is not yet supported for such usages so these
> > pages are currently marked as UNMOVABLE and UNEVICTABLE which makes
> > them behave like long-term pinned pages.
> > 
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >  include/uapi/linux/memfd.h |  1 +
> >  mm/memfd.c                 | 20 +++++++++++++++++++-
> >  2 files changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/uapi/linux/memfd.h b/include/uapi/linux/memfd.h
> > index 7a8a26751c23..48750474b904 100644
> > --- a/include/uapi/linux/memfd.h
> > +++ b/include/uapi/linux/memfd.h
> > @@ -8,6 +8,7 @@
> >  #define MFD_CLOEXEC		0x0001U
> >  #define MFD_ALLOW_SEALING	0x0002U
> >  #define MFD_HUGETLB		0x0004U
> > +#define MFD_INACCESSIBLE	0x0008U
> >  
> >  /*
> >   * Huge page size encoding when MFD_HUGETLB is specified, and a huge page
> > diff --git a/mm/memfd.c b/mm/memfd.c
> > index 9f80f162791a..26998d96dc11 100644
> > --- a/mm/memfd.c
> > +++ b/mm/memfd.c
> > @@ -245,16 +245,19 @@ long memfd_fcntl(struct file *file, unsigned int cmd, unsigned long arg)
> >  #define MFD_NAME_PREFIX_LEN (sizeof(MFD_NAME_PREFIX) - 1)
> >  #define MFD_NAME_MAX_LEN (NAME_MAX - MFD_NAME_PREFIX_LEN)
> >  
> > -#define MFD_ALL_FLAGS (MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB)
> > +#define MFD_ALL_FLAGS (MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB | \
> > +		       MFD_INACCESSIBLE)
> >  
> >  SYSCALL_DEFINE2(memfd_create,
> >  		const char __user *, uname,
> >  		unsigned int, flags)
> >  {
> > +	struct address_space *mapping;
> >  	unsigned int *file_seals;
> >  	struct file *file;
> >  	int fd, error;
> >  	char *name;
> > +	gfp_t gfp;
> >  	long len;
> >  
> >  	if (!(flags & MFD_HUGETLB)) {
> > @@ -267,6 +270,10 @@ SYSCALL_DEFINE2(memfd_create,
> >  			return -EINVAL;
> >  	}
> >  
> > +	/* Disallow sealing when MFD_INACCESSIBLE is set. */
> > +	if (flags & MFD_INACCESSIBLE && flags & MFD_ALLOW_SEALING)
> > +		return -EINVAL;
> > +
> >  	/* length includes terminating zero */
> >  	len = strnlen_user(uname, MFD_NAME_MAX_LEN + 1);
> >  	if (len <= 0)
> > @@ -315,6 +322,17 @@ SYSCALL_DEFINE2(memfd_create,
> >  		*file_seals &= ~F_SEAL_SEAL;
> >  	}
> >  
> > +	if (flags & MFD_INACCESSIBLE) {
> > +		mapping = file_inode(file)->i_mapping;
> > +		gfp = mapping_gfp_mask(mapping);
> > +		gfp &= ~__GFP_MOVABLE;
> > +		mapping_set_gfp_mask(mapping, gfp);
> > +		mapping_set_unevictable(mapping);
> > +
> > +		file_seals = memfd_file_seals_ptr(file);
> > +		*file_seals &= F_SEAL_SEAL | F_SEAL_INACCESSIBLE;
> 
> This looks backwards - the flags should be set on *file_seals, but here
> you are unsetting all other flags.

Thanks Steve. '|=' actually should be used here.

Chao
> 
> Steve
> 
> > +	}
> > +
> >  	fd_install(fd, file);
> >  	kfree(name);
> >  	return fd;
> > 


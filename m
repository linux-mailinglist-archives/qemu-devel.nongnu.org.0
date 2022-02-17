Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98364BA11D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 14:29:21 +0100 (CET)
Received: from localhost ([::1]:59722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKgqX-00072m-1w
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 08:29:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nKgLi-0002eT-KJ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:57:32 -0500
Received: from mga14.intel.com ([192.55.52.115]:55807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nKgLg-0002nz-H4
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645102648; x=1676638648;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=muUyZFkT/XUwYXtZ4KuQ8w3WazrYqWNDm8XTjig5hYY=;
 b=D91GABD51DROhfeANHHG8jAUDtT3oatQtbYw/rG8sN8cZ+GTVWQyPqoe
 SI85fyFhNmEF3bjxd+5yiFfy8yeChnDp/ANL/lkU0Pg3f1veQx9UaBA8x
 3HJucDSfeWJM8kXv4hHNnonQ73YOLBOXJFA0ybwISOqjFDPXPh4LpJ5OM
 AXI56ZSEj8GbAbPLJXdBN9QRH4NdjhOVgevlOpTxFwTPJVNP32kzZaBdz
 ZZ8f8y+H2btbI996qUsCzXAi8i779Ez4M5oHxjaN6MUdKzUH4Ewphe3CX
 B7UNHDIpBBuPm21RFTVIuROD7AKjH2Iat8zWmIx2EVwP/E41DarCl/1HA A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="251064852"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="251064852"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 04:57:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="704785987"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga005.jf.intel.com with ESMTP; 17 Feb 2022 04:57:18 -0800
Date: Thu, 17 Feb 2022 20:56:57 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v4 01/12] mm/shmem: Introduce F_SEAL_INACCESSIBLE
Message-ID: <20220217125656.GA32679@chaop.bj.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-2-chao.p.peng@linux.intel.com>
 <64407833-1387-0c46-c569-8b6a3db8e88c@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64407833-1387-0c46-c569-8b6a3db8e88c@suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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

On Mon, Feb 07, 2022 at 01:24:42PM +0100, Vlastimil Babka wrote:
> On 1/18/22 14:21, Chao Peng wrote:
> > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > 
> >  /*
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 18f93c2d68f1..72185630e7c4 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -1098,6 +1098,13 @@ static int shmem_setattr(struct user_namespace *mnt_userns,
> >  		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
> >  			return -EPERM;
> >  
> > +		if (info->seals & F_SEAL_INACCESSIBLE) {
> > +			if(i_size_read(inode))
> 
> Is this needed? The rest of the function seems to trust oldsize obtained by
> plain reading inode->i_size well enough, so why be suddenly paranoid here?

oldsize sounds enough here, unless kirill has different mind.

> 
> > +				return -EPERM;
> > +			if (newsize & ~PAGE_MASK)
> > +				return -EINVAL;
> > +		}
> > +
> >  		if (newsize != oldsize) {
> >  			error = shmem_reacct_size(SHMEM_I(inode)->flags,
> > +		if ((info->seals & F_SEAL_INACCESSIBLE) &&
> > +		    (offset & ~PAGE_MASK || len & ~PAGE_MASK)) {
> 
> Could we use PAGE_ALIGNED()?

Yes, definitely, thanks.

Chao
> 
> > +			error = -EINVAL;
> > +			goto out;
> > +		}
> > +
> >  		shmem_falloc.waitq = &shmem_falloc_waitq;
> >  		shmem_falloc.start = (u64)unmap_start >> PAGE_SHIFT;
> >  		shmem_falloc.next = (unmap_end + 1) >> PAGE_SHIFT;


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF764FE220
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 15:17:15 +0200 (CEST)
Received: from localhost ([::1]:53452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neGOQ-0006hS-Be
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 09:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1neGKb-0003eV-OP
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 09:13:17 -0400
Received: from mga18.intel.com ([134.134.136.126]:4745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1neGKY-0005Eq-JO
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 09:13:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649769194; x=1681305194;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=THXNbE6uwc6VmEva3UG39/ka2/jfkbL0RmRgTIEQt8M=;
 b=AjLCNt8PMlJ24qgllIgBLIUTPg1ACQPOhAvRUtWDdA+o7CLRyZFxj42E
 saI8eibVqUkG7RREFqS8Uy6weAAzzNU1TvMUne/MFtRwwDnDQHDU/vYIm
 Sx9geUbtTmjI67Q33tarIyRbgXUxvwSJsz0MBy2qJQxDGzfy4MoiiNodH
 UNQu1+K5KZLiWcJT78ToLAaNeL5K6hfckHPPJ0klJbPcJoEl5EGNHc+xN
 +6LzKqS1qt0x/N+r06UKA7QhomuKGJsOauLrTrc4NbNBw45eOOKxX382u
 s0AB8lpUidDuzIwSIYnhy614ARc4ro3j42e1U8HkSPih44YNJ3AFEDW62 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244253342"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="244253342"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="699828966"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2022 06:13:04 -0700
Date: Tue, 12 Apr 2022 21:12:54 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v5 03/13] mm/shmem: Support memfile_notifier
Message-ID: <20220412131254.GF8013@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-4-chao.p.peng@linux.intel.com>
 <20220411152647.uvl2ukuwishsckys@box.shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411152647.uvl2ukuwishsckys@box.shutemov.name>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, linux-mm@kvack.org,
 linux-api@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Yu Zhang <yu.c.zhang@linux.intel.com>,
 Mike Rapoport <rppt@kernel.org>, Sean Christopherson <seanjc@google.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vishal Annapurve <vannapurve@google.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 11, 2022 at 06:26:47PM +0300, Kirill A. Shutemov wrote:
> On Thu, Mar 10, 2022 at 10:09:01PM +0800, Chao Peng wrote:
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
> 
> All these #ifdefs look ugly. Could you provide dummy memfile_* for
> !MEMFILE_NOTIFIER case?
Sure.

Chao
> 
> -- 
>  Kirill A. Shutemov


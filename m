Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD2848219D
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 03:42:17 +0100 (CET)
Received: from localhost ([::1]:44720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n37rz-0000fK-Ss
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 21:42:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n37pX-0007m4-G1
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 21:39:44 -0500
Received: from mga03.intel.com ([134.134.136.65]:51467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n37pV-00047C-Oo
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 21:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640918381; x=1672454381;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=TzNuTr+rkRfs/siMv5ThwCQ6SRkD7qmXiB7orZOuuAY=;
 b=luSFsxL31KBVC8nklpBea3TcgFto6ZVbiLAyvKoQpPZ+DDPHKUuNSPei
 kOlJJr4/mW+0IVAf03YaL+Xxj2zrVwSx03neupQGaz+E9yJlpzn+zYvRZ
 VveQcU3PjRBApjBn7AysqzFuRXBm7/HmyxCwTEd5+sk8Aak52qRK4xbAH
 2/93gmaSnVc8fGTG/lEd/OhzDKamIVfTOdKOjLLiEpewwHV+mZLVWJGiF
 f/Pb5G6oiRMMZY12ED8jc6WUtE+kxM5XNvDNb823qDiTFUV1pcKj0I7VR
 CMsZsHlI5J1+5GlKub9PfvVD4Q7A7wiq+UvJuvta8kpHrimEdZrwdZtHk w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="241718629"
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="241718629"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 18:39:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="666708085"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2021 18:39:29 -0800
Date: Fri, 31 Dec 2021 10:38:53 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH v3 kvm/queue 03/16] mm/memfd: Introduce MEMFD_OPS
Message-ID: <20211231023853.GB7255@chaop.bj.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-4-chao.p.peng@linux.intel.com>
 <95d13ac7da32aa1530d6883777ef3279e4ad825d.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95d13ac7da32aa1530d6883777ef3279e4ad825d.camel@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 24, 2021 at 11:53:15AM +0800, Robert Hoo wrote:
> On Thu, 2021-12-23 at 20:29 +0800, Chao Peng wrote:
> > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> >  
> > +static void notify_fallocate(struct inode *inode, pgoff_t start,
> > pgoff_t end)
> > +{
> > +#ifdef CONFIG_MEMFD_OPS
> > +	struct shmem_inode_info *info = SHMEM_I(inode);
> > +	const struct memfd_falloc_notifier *notifier;
> > +	void *owner;
> > +	bool ret;
> > +
> > +	if (!info->falloc_notifier)
> > +		return;
> > +
> > +	spin_lock(&info->lock);
> > +	notifier = info->falloc_notifier;
> > +	if (!notifier) {
> > +		spin_unlock(&info->lock);
> > +		return;
> > +	}
> > +
> > +	owner = info->owner;
> > +	ret = notifier->get_owner(owner);
> > +	spin_unlock(&info->lock);
> > +	if (!ret)
> > +		return;
> > +
> > +	notifier->fallocate(inode, owner, start, end);
> 
> I see notifier->fallocate(), i.e. memfd_fallocate(), discards
> kvm_memfd_fallocate_range()'s return value. Should it be checked?

I think we can ignore it, just like how current mmu_notifier does,
the return value of __kvm_handle_hva_range is discarded in
kvm_mmu_notifier_invalidate_range_start(). Even when KVM side failed,
it's not fatal, it should not block the operation in the primary MMU.

Thanks,
Chao
> 
> > +	notifier->put_owner(owner);
> > +#endif
> > +}
> > +



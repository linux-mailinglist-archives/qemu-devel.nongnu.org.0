Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4988484E0B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 07:11:36 +0100 (CET)
Received: from localhost ([::1]:46012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4zWJ-0004YA-5Z
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 01:11:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n4zSi-0003o6-0q
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:07:53 -0500
Received: from mga03.intel.com ([134.134.136.65]:54371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n4zSf-0002MY-F1
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641362869; x=1672898869;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=07p9MpW9zMg9Qp6lAa6OCqWxIJ+2lO0bV8d8+HqWdzA=;
 b=Ws/mM52/omj2Mut3ufcLB7BKQpHPmd+uSgN7vrWld/caCla0qf/tylFB
 fCpMHojKuJ22QseYnOtMmspct1BMqVluyMc6FmM77A8Dkv+deqgVg5Qt4
 itLgt05qQReZUuHOghaqClMOXap5hZqyvru+3MY0GycgDSRypvQ/2d/VA
 dxzAK+FbVza/i2n6464sRBuoTHqiIMSNnkvUK4lmCT1LRSXGgdeOO5mWU
 9gT9G4GVzRO+XGhawcW9NMCI58Z+HEumZmVqfv63bkvA+4D69PBYnkLXd
 q080V+DTPKpq3Yp60Fs0HQtnd4ZdkzTKjvxhl5inc7HSfwJOYJf4VTXT8 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242334640"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="242334640"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 22:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="526379627"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 04 Jan 2022 22:07:38 -0800
Date: Wed, 5 Jan 2022 14:07:04 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v3 kvm/queue 03/16] mm/memfd: Introduce MEMFD_OPS
Message-ID: <20220105060704.GA25009@chaop.bj.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-4-chao.p.peng@linux.intel.com>
 <95d13ac7da32aa1530d6883777ef3279e4ad825d.camel@linux.intel.com>
 <20211231023853.GB7255@chaop.bj.intel.com>
 <YdSGHnMFV5Mu9vdF@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdSGHnMFV5Mu9vdF@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
 Robert Hoo <robert.hu@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, dave.hansen@intel.com, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 john.ji@intel.com, Yu Zhang <yu.c.zhang@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 04, 2022 at 05:38:38PM +0000, Sean Christopherson wrote:
> On Fri, Dec 31, 2021, Chao Peng wrote:
> > On Fri, Dec 24, 2021 at 11:53:15AM +0800, Robert Hoo wrote:
> > > On Thu, 2021-12-23 at 20:29 +0800, Chao Peng wrote:
> > > > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > > >  
> > > > +static void notify_fallocate(struct inode *inode, pgoff_t start,
> > > > pgoff_t end)
> > > > +{
> > > > +#ifdef CONFIG_MEMFD_OPS
> > > > +	struct shmem_inode_info *info = SHMEM_I(inode);
> > > > +	const struct memfd_falloc_notifier *notifier;
> > > > +	void *owner;
> > > > +	bool ret;
> > > > +
> > > > +	if (!info->falloc_notifier)
> > > > +		return;
> > > > +
> > > > +	spin_lock(&info->lock);
> > > > +	notifier = info->falloc_notifier;
> > > > +	if (!notifier) {
> > > > +		spin_unlock(&info->lock);
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	owner = info->owner;
> > > > +	ret = notifier->get_owner(owner);
> > > > +	spin_unlock(&info->lock);
> > > > +	if (!ret)
> > > > +		return;
> > > > +
> > > > +	notifier->fallocate(inode, owner, start, end);
> > > 
> > > I see notifier->fallocate(), i.e. memfd_fallocate(), discards
> > > kvm_memfd_fallocate_range()'s return value. Should it be checked?
> > 
> > I think we can ignore it, just like how current mmu_notifier does,
> > the return value of __kvm_handle_hva_range is discarded in
> > kvm_mmu_notifier_invalidate_range_start(). Even when KVM side failed,
> > it's not fatal, it should not block the operation in the primary MMU.
> 
> If the return value is ignored, it'd be better to have no return value at all so
> that it's clear fallocate() will continue on regardless of whether or not the
> secondary MMU callback succeeds.  E.g. if KVM can't handle the fallocate() for
> whatever reason, then knowing that fallocate() will continue on means KVM should
> mark the VM as dead so that the broken setup cannot be abused by userspace.

After a close look, kvm_unmap_gfn_range() actually does not return a
error code, so it's safe to not return in kvm_memfd_handle_range().

Chao


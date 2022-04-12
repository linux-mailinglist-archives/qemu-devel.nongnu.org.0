Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8014FE0BE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:46:37 +0200 (CEST)
Received: from localhost ([::1]:51320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neFun-000818-39
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1neFsT-0006WR-BK
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:44:36 -0400
Received: from mga18.intel.com ([134.134.136.126]:2427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1neFsK-00074M-H0
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649767444; x=1681303444;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=dy/TdJnUMbUKhIlocJ/LouJFjjtZwg5GwrTeZmhomcI=;
 b=Ie94hS7F8YeGIzLDkxVvTCfIIxAu2shuxEb2iS0anjCGsvIRHl2FJ8xK
 hb+cIA7Bh3y9bAicroLlbzunSuQbhAWsOflaxOboGLHAZ0OzQMC0+wp+Z
 MaTeMPql784xmkc8I0lrHqoHq6Rgp/JgFlbtuGoQFFPl+QHt0EnkwQGqd
 GcCNYnMzaHyFF973QJYWI7pwazqBZevSoyMrXSkjTdVaFzp/+aJ2PKpsz
 uoRlczEZ5Q6TcYXzDLECrlojMTu7JoXWUjKrjaNJYFWegnFgWROuk4l4E
 8d/weY++5bgBsz+JZaUxwJK1cVuRyDHOd3Hox98mE1/Vt2hPvsfyEVhqj Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244248246"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="244248246"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 05:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="526024498"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga002.jf.intel.com with ESMTP; 12 Apr 2022 05:43:36 -0700
Date: Tue, 12 Apr 2022 20:43:25 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v5 11/13] KVM: Zap existing KVM mappings when pages
 changed in the private fd
Message-ID: <20220412124325.GB8013@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-12-chao.p.peng@linux.intel.com>
 <YkNcmGsOw4MThaym@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkNcmGsOw4MThaym@google.com>
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
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 07:23:04PM +0000, Sean Christopherson wrote:
> On Thu, Mar 10, 2022, Chao Peng wrote:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 67349421eae3..52319f49d58a 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -841,8 +841,43 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
> >  #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
> >  
> >  #ifdef CONFIG_MEMFILE_NOTIFIER
> > +static void kvm_memfile_notifier_handler(struct memfile_notifier *notifier,
> > +					 pgoff_t start, pgoff_t end)
> > +{
> > +	int idx;
> > +	struct kvm_memory_slot *slot = container_of(notifier,
> > +						    struct kvm_memory_slot,
> > +						    notifier);
> > +	struct kvm_gfn_range gfn_range = {
> > +		.slot		= slot,
> > +		.start		= start - (slot->private_offset >> PAGE_SHIFT),
> > +		.end		= end - (slot->private_offset >> PAGE_SHIFT),
> > +		.may_block 	= true,
> > +	};
> > +	struct kvm *kvm = slot->kvm;
> > +
> > +	gfn_range.start = max(gfn_range.start, slot->base_gfn);
> > +	gfn_range.end = min(gfn_range.end, slot->base_gfn + slot->npages);
> > +
> > +	if (gfn_range.start >= gfn_range.end)
> > +		return;
> > +
> > +	idx = srcu_read_lock(&kvm->srcu);
> > +	KVM_MMU_LOCK(kvm);
> > +	kvm_unmap_gfn_range(kvm, &gfn_range);
> > +	kvm_flush_remote_tlbs(kvm);
> 
> This should check the result of kvm_unmap_gfn_range() and flush only if necessary.

Yep.

> 
> kvm->mmu_notifier_seq needs to be incremented, otherwise KVM will incorrectly
> install a SPTE if the mapping is zapped between retrieving the pfn in faultin and
> installing it after acquire mmu_lock.

Good catch.

Chao
> 
> 
> > +	KVM_MMU_UNLOCK(kvm);
> > +	srcu_read_unlock(&kvm->srcu, idx);
> > +}
> > +
> > +static struct memfile_notifier_ops kvm_memfile_notifier_ops = {
> > +	.invalidate = kvm_memfile_notifier_handler,
> > +	.fallocate = kvm_memfile_notifier_handler,
> > +};
> > +
> >  static inline int kvm_memfile_register(struct kvm_memory_slot *slot)
> >  {
> > +	slot->notifier.ops = &kvm_memfile_notifier_ops;
> >  	return memfile_register_notifier(file_inode(slot->private_file),
> >  					 &slot->notifier,
> >  					 &slot->pfn_ops);
> > @@ -1963,6 +1998,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
> >  	new->private_file = file;
> >  	new->private_offset = mem->flags & KVM_MEM_PRIVATE ?
> >  			      region_ext->private_offset : 0;
> > +	new->kvm = kvm;
> >  
> >  	r = kvm_set_memslot(kvm, old, new, change);
> >  	if (!r)
> > -- 
> > 2.17.1
> > 


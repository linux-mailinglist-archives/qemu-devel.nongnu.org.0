Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB835595A9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:50:42 +0200 (CEST)
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4f1V-0001gh-OG
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o4eyL-0007M2-3g
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:47:25 -0400
Received: from mga12.intel.com ([192.55.52.136]:19228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o4eyI-0008JM-KK
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656060442; x=1687596442;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Jc8yORiINhpFzMTo8QL55TU28YhiMcNQ45ukyK/l2T4=;
 b=f5JEjVXLcaCcu1mWDyjEIgSMd2V6zEmovsVe0gLON4BxWtg8ISAhWoyE
 QtLyBi1zW/1DApvqf8h0ZVP4/gX2bseAZpwtEcH8tagg4NmEJTnHcYToM
 JEH5zZTLMRN5XMb1stzJogsG+I4g5XtlOeOTpMu91x5MBgBQUQxh4wSMu
 cUhd+gTGs2fwOcFn4wEAbc48mVSMc6y+jtOiZnEN4FJn4Z3vaCd8V5/qq
 X8v2Qpj8beLS7yLjqpiMFlsr2BkpT220IrcImS8GuBi8k0KynLoyTiDmC
 S8Bj0x5jOKylEqXqKnKw42mn7mozEUK8Io3EXFnj0oN19/4IaPVG83mby Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="260773228"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="260773228"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 01:47:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="586508201"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 24 Jun 2022 01:47:01 -0700
Date: Fri, 24 Jun 2022 16:43:41 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, mhocko@suse.com
Subject: Re: [PATCH v6 7/8] KVM: Enable and expose KVM_MEM_PRIVATE
Message-ID: <20220624084341.GA2178308@chaop.bj.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-8-chao.p.peng@linux.intel.com>
 <20220623220751.emt3iqq77faxfzzy@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623220751.emt3iqq77faxfzzy@amd.com>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 23, 2022 at 05:07:51PM -0500, Michael Roth wrote:
...
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index db9d39a2d3a6..f93ac7cdfb53 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -843,6 +843,73 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
> >  
> >  #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
> >  
> > +#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
> > +static void kvm_private_mem_notifier_handler(struct memfile_notifier *notifier,
> > +					     pgoff_t start, pgoff_t end)
> > +{
> > +	int idx;
> > +	struct kvm_memory_slot *slot = container_of(notifier,
> > +						    struct kvm_memory_slot,
> > +						    notifier);
> > +	struct kvm_gfn_range gfn_range = {
> > +		.slot		= slot,
> > +		.start		= start - (slot->private_offset >> PAGE_SHIFT),
> > +		.end		= end - (slot->private_offset >> PAGE_SHIFT),
> 
> This code assumes that 'end' is greater than slot->private_offset, but
> even if slot->private_offset is non-zero, nothing stops userspace from
> allocating pages in the range of 0 through slot->private_offset, which
> will still end up triggering this notifier. In that case gfn_range.end
> will end up going negative, and the below code will limit that to
> slot->npages and do a populate/invalidate for the entire range.
> 
> Not sure if this covers all the cases, but this fixes the issue for me:

Right, already noticed this issue, will fix in next version. Thanks.

> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 903ffdb5f01c..4c744d8f7527 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -872,6 +872,19 @@ static void kvm_private_mem_notifier_handler(struct memfile_notifier *notifier,
>                 .may_block      = true,
>         };
> 
>         struct kvm *kvm = slot->kvm;
> +
> +       if (slot->private_offset > end)
> +               return;
> +
> 


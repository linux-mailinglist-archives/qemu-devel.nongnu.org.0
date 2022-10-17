Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FED66011E6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 16:57:00 +0200 (CEST)
Received: from localhost ([::1]:56122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okRY2-0001e3-UZ
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 10:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1okRUp-0007jz-5f
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 10:53:39 -0400
Received: from mga05.intel.com ([192.55.52.43]:22891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1okRUm-0008UT-En
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 10:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666018416; x=1697554416;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=I4wfniHW10JfPeprn5rTb+kTvRXkxXZTaEZmmRNpMCk=;
 b=PndSSUeuKoGNgjrBntBuZjwOJdcrQI9ycH1EWtvpDPE/fvQYH60O8sCN
 AT+D1W1J9mAr+gF3bOkH2IrdWOhRlAP9XmorXbst3fXvY9MzRhM/loPD7
 Rqz19EfMxL2NXk4+h/QaL2T4M2TVtwcoLa1x32CqMVdViNp3rZfKmupcL
 V15aRmk+CNydIo0u3u9kWv1VRPBx9twLCsodzO0yQskBr775+MzUAPYY1
 i7zD1SpnAQF6KZN6zNNPqUHyQPjb5ZJnzAlijm3g6JY54jYBvr/jDH0V2
 4W6xejSKZReNsaZ0N7xfurLBJPd5qAx++EWpsFXjAX22BsfOECf0Y5dCr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="392120408"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="392120408"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 07:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="691384101"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="691384101"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 17 Oct 2022 07:53:06 -0700
Date: Mon, 17 Oct 2022 22:48:35 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v8 7/8] KVM: Handle page fault for private memory
Message-ID: <20221017144835.GA3417432@chaop.bj.intel.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-8-chao.p.peng@linux.intel.com>
 <Y0mxEFpvS7O96CCD@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0mxEFpvS7O96CCD@google.com>
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 14, 2022 at 06:57:20PM +0000, Sean Christopherson wrote:
> On Thu, Sep 15, 2022, Chao Peng wrote:
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index a0f198cede3d..81ab20003824 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -3028,6 +3028,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
> >  			break;
> >  	}
> >  
> > +	if (kvm_mem_is_private(kvm, gfn))
> 
> Rather than reload the Xarray info, which is unnecessary overhead, pass in
> @is_private.  The caller must hold mmu_lock, i.e. invalidations from
> private<->shared conversions will be stalled and will zap the new SPTE if the
> state is changed.

Make sense. TDX/SEV should be easy to query that.

Chao
> 
> E.g.
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index d68944f07b4b..44eea47697d8 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3072,8 +3072,8 @@ void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>          * Enforce the iTLB multihit workaround after capturing the requested
>          * level, which will be used to do precise, accurate accounting.
>          */
> -       fault->req_level = kvm_mmu_max_mapping_level(vcpu->kvm, slot,
> -                                                    fault->gfn, fault->max_level);
> +       fault->req_level = kvm_mmu_max_mapping_level(vcpu->kvm, slot, fault->gfn,
> +                                                    fault->max_level, fault->is_private);
>         if (fault->req_level == PG_LEVEL_4K || fault->huge_page_disallowed)
>                 return;
>  
> @@ -6460,7 +6460,7 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
>                  */
>                 if (sp->role.direct &&
>                     sp->role.level < kvm_mmu_max_mapping_level(kvm, slot, sp->gfn,
> -                                                              PG_LEVEL_NUM)) {
> +                                                              PG_LEVEL_NUM, false)) {
>                         kvm_zap_one_rmap_spte(kvm, rmap_head, sptep);
>  
>                         if (kvm_available_flush_tlb_with_range())
> diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
> index 7670c13ce251..9acdf72537ce 100644
> --- a/arch/x86/kvm/mmu/spte.h
> +++ b/arch/x86/kvm/mmu/spte.h
> @@ -315,6 +315,12 @@ static inline bool is_dirty_spte(u64 spte)
>         return dirty_mask ? spte & dirty_mask : spte & PT_WRITABLE_MASK;
>  }
>  
> +static inline bool is_private_spte(u64 spte)
> +{
> +       /* FIXME: Query C-bit/S-bit for SEV/TDX. */
> +       return false;
> +}
> +
>  static inline u64 get_rsvd_bits(struct rsvd_bits_validate *rsvd_check, u64 pte,
>                                 int level)
>  {
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index 672f0432d777..69ba00157e90 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -1767,8 +1767,9 @@ static void zap_collapsible_spte_range(struct kvm *kvm,
>                 if (iter.gfn < start || iter.gfn >= end)
>                         continue;
>  
> -               max_mapping_level = kvm_mmu_max_mapping_level(kvm, slot,
> -                                                             iter.gfn, PG_LEVEL_NUM);
> +               max_mapping_level = kvm_mmu_max_mapping_level(kvm, slot, iter.gfn,
> +                                                             PG_LEVEL_NUM,
> +                                                             is_private_spte(iter.old_spte));
>                 if (max_mapping_level < iter.level)
>                         continue;
>  


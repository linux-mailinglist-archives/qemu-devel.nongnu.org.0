Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA9C62DCD1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 14:31:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oveyP-0000lZ-6k; Thu, 17 Nov 2022 08:30:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oveyM-0000lC-L3
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:30:30 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oveyK-0008VG-G1
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668691828; x=1700227828;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=kkui0TYDb/IbaSu7o0K1fhPB2oH/R5viDFHkl5cBAL8=;
 b=AeGwAgechVjPHLrA0D/IH/Kjzu7hPUPW7D/BB1KA3Ae5KApu4JLwkEHY
 Ipqxp2fHGFYYWJ2YE6okiktp1mBvUlUzkvWNNYZJhuRGXgezLhNmNkmuK
 /XM2OAIs4A8lUiwAuXL43aYVIuLapWZQlxHTxjqbume2ZWoSJkP2Sim0U
 b+ALT1Ah3ZwgiC6QmP97h735i+ZgLIvdm04T7EPbTkB96/HfAEnc0cwYM
 l/gzQceDxq+JbdbcTdhvq4vFC4QfvVdeUtHwVDp1gPXRccJMjIXq5+K/y
 asH8mqXHHbE//RjCYkFz8Zu2xPSPjed5xH6qtrwT9q8hblYrm5gfkHV6j w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="300382402"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="300382402"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 05:30:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="703332498"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="703332498"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 17 Nov 2022 05:30:16 -0800
Date: Thu, 17 Nov 2022 21:25:51 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, aarcange@redhat.com,
 ak@linux.intel.com, akpm@linux-foundation.org, bfields@fieldses.org,
 bp@alien8.de, corbet@lwn.net, dave.hansen@intel.com,
 david@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 hpa@zytor.com, hughd@google.com, jlayton@kernel.org,
 jmattson@google.com, joro@8bytes.org, jun.nakajima@intel.com,
 kirill.shutemov@linux.intel.com, kvm@vger.kernel.org,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
 mail@maciej.szmigiero.name, mhocko@suse.com, michael.roth@amd.com,
 mingo@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 qperret@google.com, rppt@kernel.org, shuah@kernel.org,
 songmuchun@bytedance.com, steven.price@arm.com, tabba@google.com,
 tglx@linutronix.de, vannapurve@google.com, vbabka@suse.cz,
 vkuznets@redhat.com, wanpengli@tencent.com, wei.w.wang@intel.com,
 x86@kernel.org, yu.c.zhang@linux.intel.com
Subject: Re: [PATCH v9 7/8] KVM: Handle page fault for private memory
Message-ID: <20221117132551.GB422408@chaop.bj.intel.com>
References: <20221025151344.3784230-8-chao.p.peng@linux.intel.com>
 <20221116205025.1510291-1-ackerleytng@google.com>
 <Y3Vgc5KrNRA8r6vh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3Vgc5KrNRA8r6vh@google.com>
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 16, 2022 at 10:13:07PM +0000, Sean Christopherson wrote:
> On Wed, Nov 16, 2022, Ackerley Tng wrote:
> > >@@ -4173,6 +4203,22 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> > > 			return RET_PF_EMULATE;
> > > 	}
> > >
> > >+	if (kvm_slot_can_be_private(slot) &&
> > >+	    fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
> > >+		vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> > >+		if (fault->is_private)
> > >+			vcpu->run->memory.flags = KVM_MEMORY_EXIT_FLAG_PRIVATE;
> > >+		else
> > >+			vcpu->run->memory.flags = 0;
> > >+		vcpu->run->memory.padding = 0;
> > >+		vcpu->run->memory.gpa = fault->gfn << PAGE_SHIFT;
> > >+		vcpu->run->memory.size = PAGE_SIZE;
> > >+		return RET_PF_USER;
> > >+	}
> > >+
> > >+	if (fault->is_private)
> > >+		return kvm_faultin_pfn_private(fault);
> > >+
> > 
> > Since each memslot may also not be backed by restricted memory, we
> > should also check if the memslot has been set up for private memory
> > with
> > 
> > 	if (fault->is_private && kvm_slot_can_be_private(slot))
> > 		return kvm_faultin_pfn_private(fault);
> > 
> > Without this check, restrictedmem_get_page will get called with NULL
> > in slot->restricted_file, which causes a NULL pointer dereference.
> 
> Hmm, silently skipping the faultin would result in KVM faulting in the shared
> portion of the memslot, and I believe would end up mapping that pfn as private,
> i.e. would map a non-UPM PFN as a private mapping.  For TDX and SNP, that would
> be double ungood as it would let the host access memory that is mapped private,
> i.e. lead to #MC or #PF(RMP) in the host.

That's correct.

> 
> I believe the correct solution is to drop the "can be private" check from the
> above check, and instead handle that in kvm_faultin_pfn_private().  That would fix
> another bug, e.g. if the fault is shared, the slot can't be private, but for
> whatever reason userspace marked the gfn as private.  Even though KVM might be
> able service the fault, the correct thing to do in that case is to exit to userspace.

It makes sense to me.

Chao
> 
> E.g.
> 
> ---
>  arch/x86/kvm/mmu/mmu.c | 36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 10017a9f26ee..e2ac8873938e 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -4158,11 +4158,29 @@ static inline u8 order_to_level(int order)
>  	return PG_LEVEL_4K;
>  }
>  
> -static int kvm_faultin_pfn_private(struct kvm_page_fault *fault)
> +static int kvm_do_memory_fault_exit(struct kvm_vcpu *vcpu,
> +					struct kvm_page_fault *fault)
> +{
> +	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> +	if (fault->is_private)
> +		vcpu->run->memory.flags = KVM_MEMORY_EXIT_FLAG_PRIVATE;
> +	else
> +		vcpu->run->memory.flags = 0;
> +	vcpu->run->memory.padding = 0;
> +	vcpu->run->memory.gpa = fault->gfn << PAGE_SHIFT;
> +	vcpu->run->memory.size = PAGE_SIZE;
> +	return RET_PF_USER;
> +}
> +
> +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> +				   struct kvm_page_fault *fault)
>  {
>  	int order;
>  	struct kvm_memory_slot *slot = fault->slot;
>  
> +	if (kvm_slot_can_be_private(slot))
> +		return kvm_do_memory_fault_exit(vcpu, fault);
> +
>  	if (kvm_restricted_mem_get_pfn(slot, fault->gfn, &fault->pfn, &order))
>  		return RET_PF_RETRY;
>  
> @@ -4203,21 +4221,11 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>  			return RET_PF_EMULATE;
>  	}
>  
> -	if (kvm_slot_can_be_private(slot) &&
> -	    fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
> -		vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> -		if (fault->is_private)
> -			vcpu->run->memory.flags = KVM_MEMORY_EXIT_FLAG_PRIVATE;
> -		else
> -			vcpu->run->memory.flags = 0;
> -		vcpu->run->memory.padding = 0;
> -		vcpu->run->memory.gpa = fault->gfn << PAGE_SHIFT;
> -		vcpu->run->memory.size = PAGE_SIZE;
> -		return RET_PF_USER;
> -	}
> +	if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn))
> +		return kvm_do_memory_fault_exit(vcpu, fault);
>  
>  	if (fault->is_private)
> -		return kvm_faultin_pfn_private(fault);
> +		return kvm_faultin_pfn_private(vcpu, fault);
>  
>  	async = false;
>  	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, &async,
> 
> base-commit: 969d761bb7b8654605937f31ae76123dcb7f15a3
> -- 


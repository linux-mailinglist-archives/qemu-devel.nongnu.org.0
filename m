Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3A6483A75
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 03:06:21 +0100 (CET)
Received: from localhost ([::1]:38362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ZDP-0005xh-O7
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 21:06:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1n4ZBW-00059p-Mq
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:04:22 -0500
Received: from mga03.intel.com ([134.134.136.65]:12655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1n4ZBT-0002SS-E0
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641261859; x=1672797859;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=rOuUJmbr74WI4ZIAyOLlAU0/SD3eXv+IaIUsKvmCi7c=;
 b=QOmzr4HVuhEtgLKWF0wxAO/tR5E7shzsh0xjIjAnTCizRIYMY0gIY/cn
 tr+8sPlw4c10yDrpIapUFSiuUYagLSSzOTtZjK24gahlGQOn0eSykOp+H
 QTS8dNGPNCbBMvVFMErrz9FKH5L6rKrVwDIgPCUX0keNAjMxTEh1Me2Oj
 gVI7cas61gFPfSGkyPhepVIoJd8IhAlum8kApMu1SBtY9z8H9gcPg8zJb
 HJOvnys7KSeUlWoal3Qa/GxICo3JHR/KpLK8RZQ8U7CTRbhB8/Gi0tXdb
 PLJ8o14qGit9VipvI/+2N650I68zLEpK0NcwUaRrTGGGbBYBDyVXDi4TS A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="242096675"
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; d="scan'208";a="242096675"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2022 18:04:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; d="scan'208";a="512282072"
Received: from yzhao56-desk.sh.intel.com ([10.239.159.43])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2022 18:04:06 -0800
Date: Tue, 4 Jan 2022 09:46:35 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Subject: Re: [PATCH v3 kvm/queue 14/16] KVM: Handle page fault for private
 memory
Message-ID: <20220104014629.GA2330@yzhao56-desk.sh.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-15-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223123011.41044-15-chao.p.peng@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=134.134.136.65; envelope-from=yan.y.zhao@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
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

On Thu, Dec 23, 2021 at 08:30:09PM +0800, Chao Peng wrote:
> When a page fault from the secondary page table while the guest is
> running happens in a memslot with KVM_MEM_PRIVATE, we need go
> different paths for private access and shared access.
> 
>   - For private access, KVM checks if the page is already allocated in
>     the memory backend, if yes KVM establishes the mapping, otherwise
>     exits to userspace to convert a shared page to private one.
>
will this conversion be atomical or not?
For example, after punching a hole in a private memory slot, will KVM
see two notifications: one for invalidation of the whole private memory
slot, and one for fallocate of the rest ranges besides the hole?
Or, KVM only sees one invalidation notification for the hole?
Could you please show QEMU code about this conversion?


>   - For shared access, KVM also checks if the page is already allocated
>     in the memory backend, if yes then exit to userspace to convert a
>     private page to shared one, otherwise it's treated as a traditional
>     hva-based shared memory, KVM lets existing code to obtain a pfn with
>     get_user_pages() and establish the mapping.
> 
> The above code assume private memory is persistent and pre-allocated in
> the memory backend so KVM can use this information as an indicator for
> a page is private or shared. The above check is then performed by
> calling kvm_memfd_get_pfn() which currently is implemented as a
> pagecache search but in theory that can be implemented differently
> (i.e. when the page is even not mapped into host pagecache there should
> be some different implementation).
> 
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  arch/x86/kvm/mmu/mmu.c         | 73 ++++++++++++++++++++++++++++++++--
>  arch/x86/kvm/mmu/paging_tmpl.h | 11 +++--
>  2 files changed, 77 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 2856eb662a21..fbcdf62f8281 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -2920,6 +2920,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
>  	if (max_level == PG_LEVEL_4K)
>  		return PG_LEVEL_4K;
>  
> +	if (kvm_slot_is_private(slot))
> +		return max_level;
> +
>  	host_level = host_pfn_mapping_level(kvm, gfn, pfn, slot);
>  	return min(host_level, max_level);
>  }
> @@ -3950,7 +3953,59 @@ static bool kvm_arch_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
>  				  kvm_vcpu_gfn_to_hva(vcpu, gfn), &arch);
>  }
>  
> -static bool kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault, int *r)
> +static bool kvm_vcpu_is_private_gfn(struct kvm_vcpu *vcpu, gfn_t gfn)
> +{
> +	/*
> +	 * At this time private gfn has not been supported yet. Other patch
> +	 * that enables it should change this.
> +	 */
> +	return false;
> +}
> +
> +static bool kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> +				    struct kvm_page_fault *fault,
> +				    bool *is_private_pfn, int *r)
> +{
> +	int order;
> +	int mem_convert_type;
> +	struct kvm_memory_slot *slot = fault->slot;
> +	long pfn = kvm_memfd_get_pfn(slot, fault->gfn, &order);
For private memory slots, it's possible to have pfns backed by
backends other than memfd, e.g. devicefd. So is it possible to let those
private memslots keep private and use traditional hva-based way?
Reasons below:
1. only memfd is supported in this patch set.
2. qemu/host read/write to those private memslots backing up by devicefd may
not cause machine check.

Thanks
Yan


> +
> +	if (kvm_vcpu_is_private_gfn(vcpu, fault->addr >> PAGE_SHIFT)) {
> +		if (pfn < 0)
> +			mem_convert_type = KVM_EXIT_MEM_MAP_PRIVATE;
> +		else {
> +			fault->pfn = pfn;
> +			if (slot->flags & KVM_MEM_READONLY)
> +				fault->map_writable = false;
> +			else
> +				fault->map_writable = true;
> +
> +			if (order == 0)
> +				fault->max_level = PG_LEVEL_4K;
> +			*is_private_pfn = true;
> +			*r = RET_PF_FIXED;
> +			return true;
> +		}
> +	} else {
> +		if (pfn < 0)
> +			return false;
> +
> +		kvm_memfd_put_pfn(pfn);
> +		mem_convert_type = KVM_EXIT_MEM_MAP_SHARED;
> +	}
> +
> +	vcpu->run->exit_reason = KVM_EXIT_MEMORY_ERROR;
> +	vcpu->run->mem.type = mem_convert_type;
> +	vcpu->run->mem.u.map.gpa = fault->gfn << PAGE_SHIFT;
> +	vcpu->run->mem.u.map.size = PAGE_SIZE;
> +	fault->pfn = -1;
> +	*r = -1;
> +	return true;
> +}
> +
> +static bool kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
> +			    bool *is_private_pfn, int *r)
>  {
>  	struct kvm_memory_slot *slot = fault->slot;
>  	bool async;
> @@ -3984,6 +4039,10 @@ static bool kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
>  		}
>  	}
>  
> +	if (kvm_slot_is_private(slot) &&
> +	    kvm_faultin_pfn_private(vcpu, fault, is_private_pfn, r))
> +		return *r == RET_PF_FIXED ? false : true;
> +
>  	async = false;
>  	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, &async,
>  					  fault->write, &fault->map_writable,
> @@ -4044,6 +4103,7 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  	bool is_tdp_mmu_fault = is_tdp_mmu(vcpu->arch.mmu);
>  
>  	unsigned long mmu_seq;
> +	bool is_private_pfn = false;
>  	int r;
>  
>  	fault->gfn = fault->addr >> PAGE_SHIFT;
> @@ -4063,7 +4123,7 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  	mmu_seq = vcpu->kvm->mmu_notifier_seq;
>  	smp_rmb();
>  
> -	if (kvm_faultin_pfn(vcpu, fault, &r))
> +	if (kvm_faultin_pfn(vcpu, fault, &is_private_pfn, &r))
>  		return r;
>  
>  	if (handle_abnormal_pfn(vcpu, fault, ACC_ALL, &r))
> @@ -4076,7 +4136,7 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  	else
>  		write_lock(&vcpu->kvm->mmu_lock);
>  
> -	if (is_page_fault_stale(vcpu, fault, mmu_seq))
> +	if (!is_private_pfn && is_page_fault_stale(vcpu, fault, mmu_seq))
>  		goto out_unlock;
>  
>  	r = make_mmu_pages_available(vcpu);
> @@ -4093,7 +4153,12 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  		read_unlock(&vcpu->kvm->mmu_lock);
>  	else
>  		write_unlock(&vcpu->kvm->mmu_lock);
> -	kvm_release_pfn_clean(fault->pfn);
> +
> +	if (is_private_pfn)
> +		kvm_memfd_put_pfn(fault->pfn);
> +	else
> +		kvm_release_pfn_clean(fault->pfn);
> +
>  	return r;
>  }
>  
> diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
> index 5b5bdac97c7b..640fd1e2fe4c 100644
> --- a/arch/x86/kvm/mmu/paging_tmpl.h
> +++ b/arch/x86/kvm/mmu/paging_tmpl.h
> @@ -825,6 +825,8 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  	int r;
>  	unsigned long mmu_seq;
>  	bool is_self_change_mapping;
> +	bool is_private_pfn = false;
> +
>  
>  	pgprintk("%s: addr %lx err %x\n", __func__, fault->addr, fault->error_code);
>  	WARN_ON_ONCE(fault->is_tdp);
> @@ -873,7 +875,7 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  	mmu_seq = vcpu->kvm->mmu_notifier_seq;
>  	smp_rmb();
>  
> -	if (kvm_faultin_pfn(vcpu, fault, &r))
> +	if (kvm_faultin_pfn(vcpu, fault, &is_private_pfn, &r))
>  		return r;
>  
>  	if (handle_abnormal_pfn(vcpu, fault, walker.pte_access, &r))
> @@ -901,7 +903,7 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  	r = RET_PF_RETRY;
>  	write_lock(&vcpu->kvm->mmu_lock);
>  
> -	if (is_page_fault_stale(vcpu, fault, mmu_seq))
> +	if (!is_private_pfn && is_page_fault_stale(vcpu, fault, mmu_seq))
>  		goto out_unlock;
>  
>  	kvm_mmu_audit(vcpu, AUDIT_PRE_PAGE_FAULT);
> @@ -913,7 +915,10 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  
>  out_unlock:
>  	write_unlock(&vcpu->kvm->mmu_lock);
> -	kvm_release_pfn_clean(fault->pfn);
> +	if (is_private_pfn)
> +		kvm_memfd_put_pfn(fault->pfn);
> +	else
> +		kvm_release_pfn_clean(fault->pfn);
>  	return r;
>  }
>  
> -- 
> 2.17.1
> 
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF9162DCB8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 14:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovetU-0007BN-VQ; Thu, 17 Nov 2022 08:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ovetI-0007Aw-Qw
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:25:18 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ovetE-0007By-Uf
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:25:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668691512; x=1700227512;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=5axGlSLhPtmuHt4PaXeWSd8Q7yJdQcmlwNx/L+JedqY=;
 b=TW5qsVFzxzDnAA6BRMsCOZQv6ieA67rMUDDyDmYBFBS4IKB8UeS6S4Cw
 T25ZJj+0pNllCAJ3e3TiLCENAIQgpHXIiNgpa59zGISKheNxmFZX9PvPB
 6jehqGlfWs62IUoIcdil++fPMKamXUTugPcmaMfbk5Dm1fl22b7jONG2+
 //OhMev20h51SHs5LKUJHIfSIrUHr25t2f7tlvyJhsEdmNpqUDNZtZhSJ
 SBr40SL3kHILOnwbkUyIxZ1ILkkljE01+qM7rgEaTZscwDI66IiXQ/a2k
 CMvlJIuKpuqaiXoM/8LLWsWBp2XGPMMuyDLj+PgEx6XbV1Hb+2lbVdGQW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="312861087"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="312861087"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 05:25:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="703331041"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="703331041"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 17 Nov 2022 05:24:56 -0800
Date: Thu, 17 Nov 2022 21:20:32 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
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
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v9 5/8] KVM: Register/unregister the guest private memory
 regions
Message-ID: <20221117132032.GA422408@chaop.bj.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-6-chao.p.peng@linux.intel.com>
 <Y3VjCxCiujCOLP7x@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3VjCxCiujCOLP7x@google.com>
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 16, 2022 at 10:24:11PM +0000, Sean Christopherson wrote:
> On Tue, Oct 25, 2022, Chao Peng wrote:
> > +static int kvm_vm_ioctl_set_mem_attr(struct kvm *kvm, gpa_t gpa, gpa_t size,
> > +				     bool is_private)
> > +{
> > +	gfn_t start, end;
> > +	unsigned long i;
> > +	void *entry;
> > +	int idx;
> > +	int r = 0;
> > +
> > +	if (size == 0 || gpa + size < gpa)
> > +		return -EINVAL;
> > +	if (gpa & (PAGE_SIZE - 1) || size & (PAGE_SIZE - 1))
> > +		return -EINVAL;
> > +
> > +	start = gpa >> PAGE_SHIFT;
> > +	end = (gpa + size - 1 + PAGE_SIZE) >> PAGE_SHIFT;
> > +
> > +	/*
> > +	 * Guest memory defaults to private, kvm->mem_attr_array only stores
> > +	 * shared memory.
> > +	 */
> > +	entry = is_private ? NULL : xa_mk_value(KVM_MEM_ATTR_SHARED);
> > +
> > +	idx = srcu_read_lock(&kvm->srcu);
> > +	KVM_MMU_LOCK(kvm);
> > +	kvm_mmu_invalidate_begin(kvm, start, end);
> > +
> > +	for (i = start; i < end; i++) {
> > +		r = xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> > +				    GFP_KERNEL_ACCOUNT));
> > +		if (r)
> > +			goto err;
> > +	}
> > +
> > +	kvm_unmap_mem_range(kvm, start, end);
> > +
> > +	goto ret;
> > +err:
> > +	for (; i > start; i--)
> > +		xa_erase(&kvm->mem_attr_array, i);
> 
> I don't think deleting previous entries is correct.  To unwind, the correct thing
> to do is restore the original values.  E.g. if userspace space is mapping a large
> range as shared, and some of the previous entries were shared, deleting them would
> incorrectly "convert" those entries to private.

Ah, right!

> 
> Tracking the previous state likely isn't the best approach, e.g. it would require
> speculatively allocating extra memory for a rare condition that is likely going to
> lead to OOM anyways.

Agree.

> 
> Instead of trying to unwind, what about updating the ioctl() params such that
> retrying with the updated addr+size would Just Work?  E.g.

Looks good to me. Thanks!

Chao
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 55b07aae67cc..f1de592a1a06 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1015,15 +1015,12 @@ static int kvm_vm_ioctl_set_mem_attr(struct kvm *kvm, gpa_t gpa, gpa_t size,
>  
>         kvm_unmap_mem_range(kvm, start, end, attr);
>  
> -       goto ret;
> -err:
> -       for (; i > start; i--)
> -               xa_erase(&kvm->mem_attr_array, i);
> -ret:
>         kvm_mmu_invalidate_end(kvm, start, end);
>         KVM_MMU_UNLOCK(kvm);
>         srcu_read_unlock(&kvm->srcu, idx);
>  
> +       <update gpa and size>
> +
>         return r;
>  }
>  #endif /* CONFIG_KVM_GENERIC_PRIVATE_MEM */
> @@ -4989,6 +4986,8 @@ static long kvm_vm_ioctl(struct file *filp,
>  
>                 r = kvm_vm_ioctl_set_mem_attr(kvm, region.addr,
>                                               region.size, set);
> +               if (copy_to_user(argp, &region, sizeof(region)) && !r)
> +                       r = -EFAULT
>                 break;
>         }
>  #endif


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3346192D5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 09:35:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqs9P-0005YG-6i; Fri, 04 Nov 2022 04:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oqs9A-0005Xp-9b
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 04:33:56 -0400
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oqs94-0003by-IU
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 04:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667550826; x=1699086826;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=LBhw6eQcS71AQTHPgtJidpmNdTMwoZDoM5imFH5VGeA=;
 b=RWdIBc/c6yRV9Ds5CQ8LFlX/64CF2CU2CiOa0C3EP1qMCcQCddyewWqS
 IGly1VcsEcqmQyQgNeQFsSnI5dDS1ytifJc/PSb+LW2DKqwmLAjpcufVL
 MjI+AUDxm6EjXarU1VkY8gTv8HO5FyOZR8E0Q7mT32uVssC1NK1LAJoVp
 xv1SlcuqzQ8BN7WbmPpLcljuxTBrboUOPR7W62uuRJNSVl53rapnmOTII
 HlW/5Kj04EeRDx5y1ITsHfH/Q0jk2v0xv3tkWvBprhKLknB0/XGJDaUtE
 zbCx8CEKt1QDpEhYswRJ8mRKHaw6t5X1jVyx/VmfJlERT3TKpJRqhZvis A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="293240809"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; d="scan'208";a="293240809"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 01:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="637512630"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; d="scan'208";a="637512630"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga007.fm.intel.com with ESMTP; 04 Nov 2022 01:33:10 -0700
Date: Fri, 4 Nov 2022 16:28:43 +0800
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
Message-ID: <20221104082843.GA4142342@chaop.bj.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-6-chao.p.peng@linux.intel.com>
 <Y2RJFWplouV2iF5E@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2RJFWplouV2iF5E@google.com>
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 03, 2022 at 11:04:53PM +0000, Sean Christopherson wrote:
> On Tue, Oct 25, 2022, Chao Peng wrote:
> > @@ -4708,6 +4802,24 @@ static long kvm_vm_ioctl(struct file *filp,
> >  		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
> >  		break;
> >  	}
> > +#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
> > +	case KVM_MEMORY_ENCRYPT_REG_REGION:
> > +	case KVM_MEMORY_ENCRYPT_UNREG_REGION: {
> 
> I'm having second thoughts about usurping KVM_MEMORY_ENCRYPT_(UN)REG_REGION.  Aside
> from the fact that restricted/protected memory may not be encrypted, there are
> other potential use cases for per-page memory attributes[*], e.g. to make memory
> read-only (or no-exec, or exec-only, etc...) without having to modify memslots.
> 
> Any paravirt use case where the attributes of a page are effectively dictated by
> the guest is going to run into the exact same performance problems with memslots,
> which isn't suprising in hindsight since shared vs. private is really just an
> attribute, albeit with extra special semantics.
> 
> And if we go with a brand new ioctl(), maybe someday in the very distant future
> we can deprecate and delete KVM_MEMORY_ENCRYPT_(UN)REG_REGION.
> 
> Switching to a new ioctl() should be a minor change, i.e. shouldn't throw too big
> of a wrench into things.
> 
> Something like:
> 
>   KVM_SET_MEMORY_ATTRIBUTES
> 
>   struct kvm_memory_attributes {
> 	__u64 address;
> 	__u64 size;
> 	__u64 flags;
>   }

I like the idea of adding a new ioctl(). But putting all attributes into
a flags in uAPI sounds not good to me, e.g. forcing userspace to set all
attributes in one call can cause pain for userspace, probably for KVM
implementation as well. For private<->shared memory conversion, we
actually only care the KVM_MEM_ATTR_SHARED or KVM_MEM_ATTR_PRIVATE bit,
but we force userspace to set other irrelevant bits as well if use this
API.

I looked at kvm_device_attr, sounds we can do similar:

  KVM_SET_MEMORY_ATTR

  struct kvm_memory_attr {
	__u64 address;
	__u64 size;
#define KVM_MEM_ATTR_SHARED	BIT(0)
#define KVM_MEM_ATTR_READONLY	BIT(1)
#define KVM_MEM_ATTR_NOEXEC	BIT(2)
	__u32 attr;
	__u32 pad;
  }

I'm not sure if we need KVM_GET_MEMORY_ATTR/KVM_HAS_MEMORY_ATTR as well,
but sounds like we need a KVM_UNSET_MEMORY_ATTR.

Since we are exposing the attribute directly to userspace I also think
we'd better treat shared memory as the default, so even when the private
memory is not used, the bit can still be meaningful. So define BIT(0) as
KVM_MEM_ATTR_PRIVATE instead of KVM_MEM_ATTR_SHARED.

Thanks,
Chao

> 
> [*] https://lore.kernel.org/all/Y1a1i9vbJ%2FpVmV9r@google.com
> 
> > +		struct kvm_enc_region region;
> > +		bool set = ioctl == KVM_MEMORY_ENCRYPT_REG_REGION;
> > +
> > +		if (!kvm_arch_has_private_mem(kvm))
> > +			goto arch_vm_ioctl;
> > +
> > +		r = -EFAULT;
> > +		if (copy_from_user(&region, argp, sizeof(region)))
> > +			goto out;
> > +
> > +		r = kvm_vm_ioctl_set_mem_attr(kvm, region.addr,
> > +					      region.size, set);
> > +		break;
> > +	}
> > +#endif


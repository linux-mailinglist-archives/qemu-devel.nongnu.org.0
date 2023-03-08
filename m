Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB7E6B0033
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 08:49:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZoXG-0006uF-H5; Wed, 08 Mar 2023 02:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pZoX8-0006ts-4U
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 02:48:22 -0500
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pZoX5-0003o9-VY
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 02:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678261699; x=1709797699;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=MPjpMnF2pYRp601r/CV/4rcJZOvf9VGuPDqjdu0MkGE=;
 b=c/qtl/QIFt1hAgg/OHk5wUebh4g8Gb6Be5NG+kLSK7uSmcL6GirKcBBb
 6TfKCMmNyTU40PqF691LntPoj15RlM+D0Ogh1s2DvyNg/ttgOGmLvUfdY
 1WOiBT++hvKH9STfjlVmyjV/wtxcqA4pi7sj+xHfXrHElB+HxnrSAQEfF
 kBpnbr61f086RKApdolhbAbMPwxhLieoh2B0RuhzJ2V/iRfZczfya3Q38
 5EDTv8OVLZGEOgOgNgW7Fst9b4EVeI0GdvVc2pihUnl6PNnkWQJCyPTy4
 RiHKO7Jp/EMCvmm/WM54hRIdBjXJjXXr9/JmlmQMATBS1wLlROi1tgXQL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="363727041"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="363727041"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 23:48:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="745821383"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="745821383"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.105])
 by fmsmga004.fm.intel.com with ESMTP; 07 Mar 2023 23:48:04 -0800
Date: Wed, 8 Mar 2023 15:40:26 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: seanjc@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com, corbet@lwn.net, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, arnd@arndb.de,
 naoya.horiguchi@nec.com, linmiaohe@huawei.com, x86@kernel.org,
 hpa@zytor.com, hughd@google.com, jlayton@kernel.org,
 bfields@fieldses.org, akpm@linux-foundation.org, shuah@kernel.org,
 rppt@kernel.org, steven.price@arm.com, mail@maciej.szmigiero.name,
 vbabka@suse.cz, vannapurve@google.com, yu.c.zhang@linux.intel.com,
 kirill.shutemov@linux.intel.com, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, qperret@google.com, tabba@google.com,
 michael.roth@amd.com, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 9/9] KVM: Enable and expose KVM_MEM_PRIVATE
Message-ID: <20230308074026.GA2183207@chaop.bj.intel.com>
References: <20230128140030.GB700688@chaop.bj.intel.com>
 <diqz5ybc3xsr.fsf@ackerleytng-cloudtop.c.googlers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <diqz5ybc3xsr.fsf@ackerleytng-cloudtop.c.googlers.com>
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

On Wed, Mar 08, 2023 at 12:13:24AM +0000, Ackerley Tng wrote:
> Chao Peng <chao.p.peng@linux.intel.com> writes:
> 
> > On Sat, Jan 14, 2023 at 12:01:01AM +0000, Sean Christopherson wrote:
> > > On Fri, Dec 02, 2022, Chao Peng wrote:
> > ...
> > > Strongly prefer to use similar logic to existing code that detects wraps:
> 
> > > 		mem->restricted_offset + mem->memory_size < mem->restricted_offset
> 
> > > This is also where I'd like to add the "gfn is aligned to offset"
> > > check, though
> > > my brain is too fried to figure that out right now.
> 
> > Used count_trailing_zeros() for this TODO, unsure we have other better
> > approach.
> 
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index afc8c26fa652..fd34c5f7cd2f 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -56,6 +56,7 @@
> >   #include <asm/processor.h>
> >   #include <asm/ioctl.h>
> >   #include <linux/uaccess.h>
> > +#include <linux/count_zeros.h>
> 
> >   #include "coalesced_mmio.h"
> >   #include "async_pf.h"
> > @@ -2087,6 +2088,19 @@ static bool kvm_check_memslot_overlap(struct
> > kvm_memslots *slots, int id,
> >   	return false;
> >   }
> 
> > +/*
> > + * Return true when ALIGNMENT(offset) >= ALIGNMENT(gpa).
> > + */
> > +static bool kvm_check_rmem_offset_alignment(u64 offset, u64 gpa)
> > +{
> > +	if (!offset)
> > +		return true;
> > +	if (!gpa)
> > +		return false;
> > +
> > +	return !!(count_trailing_zeros(offset) >= count_trailing_zeros(gpa));
> 
> Perhaps we could do something like
> 
> #define lowest_set_bit(val) (val & -val)
> 
> and use
> 
> return lowest_set_bit(offset) >= lowest_set_bit(gpa);

I see kernel already has fls64(), that looks what we need ;)

> 
> Please help me to understand: why must ALIGNMENT(offset) >=
> ALIGNMENT(gpa)? Why is it not sufficient to have both gpa and offset be
> aligned to PAGE_SIZE?

Yes, it's sufficient. Here we just want to be conservative on the uAPI
as Sean explained this at [1]:

  I would rather reject memslot if the gfn has lesser alignment than the
  offset. I'm totally ok with this approach _if_ there's a use case. 
  Until such a use case presents itself, I would rather be conservative
  from a uAPI perspective.

[1] https://lore.kernel.org/all/Y8HldeHBrw+OOZVm@google.com/

Chao
> 
> > +}
> > +
> >   /*
> >    * Allocate some memory and give it an address in the guest physical
> > address
> >    * space.
> > @@ -2128,7 +2142,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
> >   	if (mem->flags & KVM_MEM_PRIVATE &&
> >   	    (mem->restrictedmem_offset & (PAGE_SIZE - 1) ||
> >   	     mem->restrictedmem_offset + mem->memory_size <
> > mem->restrictedmem_offset ||
> > -	     0 /* TODO: require gfn be aligned with restricted offset */))
> > +	     !kvm_check_rmem_offset_alignment(mem->restrictedmem_offset,
> > +					      mem->guest_phys_addr)))
> >   		return -EINVAL;
> >   	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_MEM_SLOTS_NUM)
> >   		return -EINVAL;


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8166C7943
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 08:56:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfX2O-00016i-UO; Thu, 23 Mar 2023 22:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pfX2I-00016K-IO
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 22:20:10 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pfX1j-0001Ll-53
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 22:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679624375; x=1711160375;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=M4FQzDrjs+QeI9XLnd+NfZpr2fRqKi1DscOllLq4wCk=;
 b=N1XudOA8/cRvmpqoLsd/WvKp0U6rF5noOiDTvNKGHPPddNuNTQxOUZms
 Md9ff09nYSsyhkNdeFYePRnZWgMLU3fKErdE5b7V2Jp5aGPfbyzbzLYFi
 dodDrj7xpKHrCFeFc59KhQzKhFVWgKxrXOOOc/NadkA450p3P13ruGK6X
 Ncl6BEID2W8Yrv6KLLy7q9GR5cnLCLyPRXoF1rxj/wMvwpI+ooIZtkPA0
 4MRF1xC/ob5WmPV5SbZvRxpSOw8dfmxFvsgWsprJXatpHpL9FTH6MPDIY
 03rS5u9/+xgrzTJ88G2SLlyQzg52frZBtEJLwcLOD1L98KsgBEjiiiC7i A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="338400949"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="338400949"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 19:18:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="659886402"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="659886402"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.105])
 by orsmga006.jf.intel.com with ESMTP; 23 Mar 2023 19:18:04 -0700
Date: Fri, 24 Mar 2023 10:10:29 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: Ackerley Tng <ackerleytng@google.com>, seanjc@google.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Message-ID: <20230324021029.GA2774613@chaop.bj.intel.com>
References: <20230128140030.GB700688@chaop.bj.intel.com>
 <diqz5ybc3xsr.fsf@ackerleytng-cloudtop.c.googlers.com>
 <20230308074026.GA2183207@chaop.bj.intel.com>
 <20230323004131.GA214881@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323004131.GA214881@ls.amr.corp.intel.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 22, 2023 at 05:41:31PM -0700, Isaku Yamahata wrote:
> On Wed, Mar 08, 2023 at 03:40:26PM +0800,
> Chao Peng <chao.p.peng@linux.intel.com> wrote:
> 
> > On Wed, Mar 08, 2023 at 12:13:24AM +0000, Ackerley Tng wrote:
> > > Chao Peng <chao.p.peng@linux.intel.com> writes:
> > > 
> > > > On Sat, Jan 14, 2023 at 12:01:01AM +0000, Sean Christopherson wrote:
> > > > > On Fri, Dec 02, 2022, Chao Peng wrote:
> > > > ...
> > > > > Strongly prefer to use similar logic to existing code that detects wraps:
> > > 
> > > > > 		mem->restricted_offset + mem->memory_size < mem->restricted_offset
> > > 
> > > > > This is also where I'd like to add the "gfn is aligned to offset"
> > > > > check, though
> > > > > my brain is too fried to figure that out right now.
> > > 
> > > > Used count_trailing_zeros() for this TODO, unsure we have other better
> > > > approach.
> > > 
> > > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > > index afc8c26fa652..fd34c5f7cd2f 100644
> > > > --- a/virt/kvm/kvm_main.c
> > > > +++ b/virt/kvm/kvm_main.c
> > > > @@ -56,6 +56,7 @@
> > > >   #include <asm/processor.h>
> > > >   #include <asm/ioctl.h>
> > > >   #include <linux/uaccess.h>
> > > > +#include <linux/count_zeros.h>
> > > 
> > > >   #include "coalesced_mmio.h"
> > > >   #include "async_pf.h"
> > > > @@ -2087,6 +2088,19 @@ static bool kvm_check_memslot_overlap(struct
> > > > kvm_memslots *slots, int id,
> > > >   	return false;
> > > >   }
> > > 
> > > > +/*
> > > > + * Return true when ALIGNMENT(offset) >= ALIGNMENT(gpa).
> > > > + */
> > > > +static bool kvm_check_rmem_offset_alignment(u64 offset, u64 gpa)
> > > > +{
> > > > +	if (!offset)
> > > > +		return true;
> > > > +	if (!gpa)
> > > > +		return false;
> > > > +
> > > > +	return !!(count_trailing_zeros(offset) >= count_trailing_zeros(gpa));
> 
> This check doesn't work expected. For example, offset = 2GB, gpa=4GB
> this check fails.

This case is expected to fail as Sean initially suggested[*]:
  I would rather reject memslot if the gfn has lesser alignment than
  the offset. I'm totally ok with this approach _if_ there's a use case.
  Until such a use case presents itself, I would rather be conservative
  from a uAPI perspective.

I understand that we put tighter restriction on this but if you see such
restriction is really a big issue for real usage, instead of a
theoretical problem, then we can loosen the check here. But at that time
below code is kind of x86 specific and may need improve.

BTW, in latest code, I replaced count_trailing_zeros() with fls64():
  return !!(fls64(offset) >= fls64(gpa));

[*] https://lore.kernel.org/all/Y8HldeHBrw+OOZVm@google.com/

Chao
> I come up with the following.
> 
> >From ec87e25082f0497431b732702fae82c6a05071bf Mon Sep 17 00:00:00 2001
> Message-Id: <ec87e25082f0497431b732702fae82c6a05071bf.1679531995.git.isaku.yamahata@intel.com>
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> Date: Wed, 22 Mar 2023 15:32:56 -0700
> Subject: [PATCH] KVM: Relax alignment check for restricted mem
> 
> kvm_check_rmem_offset_alignment() only checks based on offset alignment
> and GPA alignment.  However, the actual alignment for offset depends
> on architecture.  For x86 case, it can be 1G, 2M or 4K.  So even if
> GPA is aligned for 1G+, only 1G-alignment is required for offset.
> 
> Without this patch, gpa=4G, offset=2G results in failure of memory slot
> creation.
> 
> Fixes: edc8814b2c77 ("KVM: Require gfn be aligned with restricted offset")
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 15 +++++++++++++++
>  virt/kvm/kvm_main.c             |  9 ++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 88e11dd3afde..03af44650f24 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -16,6 +16,7 @@
>  #include <linux/irq_work.h>
>  #include <linux/irq.h>
>  #include <linux/workqueue.h>
> +#include <linux/count_zeros.h>
>  
>  #include <linux/kvm.h>
>  #include <linux/kvm_para.h>
> @@ -143,6 +144,20 @@
>  #define KVM_HPAGE_MASK(x)	(~(KVM_HPAGE_SIZE(x) - 1))
>  #define KVM_PAGES_PER_HPAGE(x)	(KVM_HPAGE_SIZE(x) / PAGE_SIZE)
>  
> +#define kvm_arch_required_alignment	kvm_arch_required_alignment
> +static inline int kvm_arch_required_alignment(u64 gpa)
> +{
> +	int zeros = count_trailing_zeros(gpa);
> +
> +	WARN_ON_ONCE(!PAGE_ALIGNED(gpa));
> +	if (zeros >= KVM_HPAGE_SHIFT(PG_LEVEL_1G))
> +		return KVM_HPAGE_SHIFT(PG_LEVEL_1G);
> +	else if (zeros >= KVM_HPAGE_SHIFT(PG_LEVEL_2M))
> +		return KVM_HPAGE_SHIFT(PG_LEVEL_2M);
> +
> +	return PAGE_SHIFT;
> +}
> +
>  #define KVM_MEMSLOT_PAGES_TO_MMU_PAGES_RATIO 50
>  #define KVM_MIN_ALLOC_MMU_PAGES 64UL
>  #define KVM_MMU_HASH_SHIFT 12
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index c9c4eef457b0..f4ff96171d24 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2113,6 +2113,13 @@ static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
>  	return false;
>  }
>  
> +#ifndef kvm_arch_required_alignment
> +__weak int kvm_arch_required_alignment(u64 gpa)
> +{
> +	return PAGE_SHIFT
> +}
> +#endif
> +
>  /*
>   * Return true when ALIGNMENT(offset) >= ALIGNMENT(gpa).
>   */
> @@ -2123,7 +2130,7 @@ static bool kvm_check_rmem_offset_alignment(u64 offset, u64 gpa)
>  	if (!gpa)
>  		return false;
>  
> -	return !!(count_trailing_zeros(offset) >= count_trailing_zeros(gpa));
> +	return !!(count_trailing_zeros(offset) >= kvm_arch_required_alignment(gpa));
>  }
>  
>  /*
> -- 
> 2.25.1
> 
> 
> 
> -- 
> Isaku Yamahata <isaku.yamahata@gmail.com>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0DA620A1A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 08:22:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osIvY-0001dt-O4; Tue, 08 Nov 2022 02:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1osIv9-0001bT-3Q
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 02:21:25 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1osIuw-0007go-9O
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 02:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667892066; x=1699428066;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=upQwL5A0Maekh82raTC60T5oBKGppSiNQzfVbZZR6Q8=;
 b=NwG3RxTUwP/Tw9WaaNqdfnbdrSYIpPIWIndFFWYsmpGswP535dF3M9Rz
 sj/RIQGzap0kM7HKtVM76xHmQyeTdbdGqh/HU5Dk2lDCLk8xoHv6VRcbD
 mpeh210tckoc2LPuv8pYRuDKy4zxozlrK2DCUEO9JGPmqoTndpq+GZJWS
 Ke/Kj6kB+7m0mRahxx3YSucPlAJiWipZbvmkJlrL+Pg490vN0ym50YZXY
 B1zUNFxB7nIU21lH0JTM7kuLTPbKt5RfeyVQ0Sipx8VpmwWKAmBcXacVz
 hoGfSZMIeujnfwe5725B5HzZQMcmRqyFXZKkjq/4+36Y0mWzQqUn7AWIi w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="290346347"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="290346347"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 23:21:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="638690908"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="638690908"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga007.fm.intel.com with ESMTP; 07 Nov 2022 23:20:50 -0800
Date: Tue, 8 Nov 2022 15:16:24 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
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
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v9 4/8] KVM: Use gfn instead of hva for mmu_notifier_retry
Message-ID: <20221108071624.GA76278@chaop.bj.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-5-chao.p.peng@linux.intel.com>
 <CA+EHjTySnJTuLB+XoRya6kS_zw2iMahW9-Ze70oKTf+6k0GrGQ@mail.gmail.com>
 <20221104022813.GA4129873@chaop.bj.intel.com>
 <Y2WSXLtcJOpWPtuv@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2WSXLtcJOpWPtuv@google.com>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Fri, Nov 04, 2022 at 10:29:48PM +0000, Sean Christopherson wrote:
> On Fri, Nov 04, 2022, Chao Peng wrote:
> > On Thu, Oct 27, 2022 at 11:29:14AM +0100, Fuad Tabba wrote:
> > > Hi,
> > > 
> > > On Tue, Oct 25, 2022 at 4:19 PM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > > >
> > > > Currently in mmu_notifier validate path, hva range is recorded and then
> > > > checked against in the mmu_notifier_retry_hva() of the page fault path.
> > > > However, for the to be introduced private memory, a page fault may not
> > > > have a hva associated, checking gfn(gpa) makes more sense.
> > > >
> > > > For existing non private memory case, gfn is expected to continue to
> > > > work. The only downside is when aliasing multiple gfns to a single hva,
> > > > the current algorithm of checking multiple ranges could result in a much
> > > > larger range being rejected. Such aliasing should be uncommon, so the
> > > > impact is expected small.
> > > >
> > > > It also fixes a bug in kvm_zap_gfn_range() which has already been using
> > > 
> > > nit: Now it's kvm_unmap_gfn_range().
> > 
> > Forgot to mention: the bug is still with kvm_zap_gfn_range(). It calls
> > kvm_mmu_invalidate_begin/end with a gfn range but before this series
> > kvm_mmu_invalidate_begin/end actually accept a hva range. Note it's
> > unrelated to whether we use kvm_zap_gfn_range() or kvm_unmap_gfn_range()
> > in the following patch (patch 05).
> 
> Grr, in the future, if you find an existing bug, please send a patch.  At the
> very least, report the bug.

Agreed, this can be sent out separately from this series.

> The APICv case that this was added for could very
> well be broken because of this, and the resulting failures would be an absolute
> nightmare to debug.

Given the apicv_inhibit should be rare, the change looks good to me.
Just to be clear, your will send out this fix, right?

Chao

> 
> Compile tested only...
> 
> --
> From: Sean Christopherson <seanjc@google.com>
> Date: Fri, 4 Nov 2022 22:20:33 +0000
> Subject: [PATCH] KVM: x86/mmu: Block all page faults during
>  kvm_zap_gfn_range()
> 
> When zapping a GFN range, pass 0 => ALL_ONES for the to-be-invalidated
> range to effectively block all page faults while the zap is in-progress.
> The invalidation helpers take a host virtual address, whereas zapping a
> GFN obviously provides a guest physical address and with the wrong unit
> of measurement (frame vs. byte).
> 
> Alternatively, KVM could walk all memslots to get the associated HVAs,
> but thanks to SMM, that would require multiple lookups.  And practically
> speaking, kvm_zap_gfn_range() usage is quite rare and not a hot path,
> e.g. MTRR and CR0.CD are almost guaranteed to be done only on vCPU0
> during boot, and APICv inhibits are similarly infrequent operations.
> 
> Fixes: edb298c663fc ("KVM: x86/mmu: bump mmu notifier count in kvm_zap_gfn_range")
> Cc: stable@vger.kernel.org
> Cc: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 6f81539061d6..1ccb769f62af 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -6056,7 +6056,7 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
>  
>  	write_lock(&kvm->mmu_lock);
>  
> -	kvm_mmu_invalidate_begin(kvm, gfn_start, gfn_end);
> +	kvm_mmu_invalidate_begin(kvm, 0, -1ul);
>  
>  	flush = kvm_rmap_zap_gfn_range(kvm, gfn_start, gfn_end);
>  
> @@ -6070,7 +6070,7 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
>  		kvm_flush_remote_tlbs_with_address(kvm, gfn_start,
>  						   gfn_end - gfn_start);
>  
> -	kvm_mmu_invalidate_end(kvm, gfn_start, gfn_end);
> +	kvm_mmu_invalidate_end(kvm, 0, -1ul);
>  
>  	write_unlock(&kvm->mmu_lock);
>  }
> 
> base-commit: c12879206e47730ff5ab255bbf625b28ade4028f
> -- 


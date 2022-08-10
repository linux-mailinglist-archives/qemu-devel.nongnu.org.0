Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C8458E8BB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 10:28:26 +0200 (CEST)
Received: from localhost ([::1]:49218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLh4j-0006uM-5m
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 04:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oLh1J-0004VW-15
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 04:24:56 -0400
Received: from mga17.intel.com ([192.55.52.151]:62324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oLh1G-0001cl-GL
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 04:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660119890; x=1691655890;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=6kT9mTMxRWS6E11jw9PH26Anrkm3qIMlLthMQe7yaTk=;
 b=iFaSmLfvVY54sbRP/KAN9L7f/u+bbXgV81axHwJ/C39zW+bEQTwQf6Oq
 wEIjDQqwWuVQZ4zv1naTY64mL0Aau3t2DsHE9YeHf44275AaZd0xJ2i+d
 hA38acpTZC289/Ewgeg1s8cl1ncD5zQcsnXomsxaghwPEDAN17+hB8m9V
 p7rLP2o8NOpONpUO96zsBJPiU9//WUi2RLCfC8Q6+x6a/h5DQRE2xgSgb
 aH4MA2x5iwTS18IJWTU9tZ8c9wdGAc+hd3+Kyjjw8Gj5k6PynkerIPdyg
 5t3IVyO0EWE4dGn8IlqDv7xTl1wHvkoWE4NqzChxm99AlUTU0TZNT65LF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="271414502"
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; d="scan'208";a="271414502"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 01:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; d="scan'208";a="601738890"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 10 Aug 2022 01:24:29 -0700
Date: Wed, 10 Aug 2022 16:19:43 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
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
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 07/14] KVM: Use gfn instead of hva for
 mmu_notifier_retry
Message-ID: <20220810081943.GB862421@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-8-chao.p.peng@linux.intel.com>
 <20220804071044.GA4091749@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804071044.GA4091749@ls.amr.corp.intel.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

On Thu, Aug 04, 2022 at 12:10:44AM -0700, Isaku Yamahata wrote:
> On Wed, Jul 06, 2022 at 04:20:09PM +0800,
> Chao Peng <chao.p.peng@linux.intel.com> wrote:
> 
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 0bdb6044e316..e9153b54e2a4 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -1362,10 +1362,8 @@ void kvm_mmu_free_memory_cache(struct kvm_mmu_memory_cache *mc);
> >  void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
> >  #endif
> >  
> > -void kvm_inc_notifier_count(struct kvm *kvm, unsigned long start,
> > -				   unsigned long end);
> > -void kvm_dec_notifier_count(struct kvm *kvm, unsigned long start,
> > -				   unsigned long end);
> > +void kvm_inc_notifier_count(struct kvm *kvm, gfn_t start, gfn_t end);
> > +void kvm_dec_notifier_count(struct kvm *kvm, gfn_t start, gfn_t end);
> >  
> >  long kvm_arch_dev_ioctl(struct file *filp,
> >  			unsigned int ioctl, unsigned long arg);
> 
> The corresponding changes in kvm_main.c are missing.

Exactly! Actually it's in the next patch while it should indeed in
this patch.

Chao
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index b2c79bef61bd..0184e327f6f5 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -711,8 +711,7 @@ static void kvm_mmu_notifier_change_pte(struct mmu_notifier *mn,
>         kvm_handle_hva_range(mn, address, address + 1, pte, kvm_set_spte_gfn);
>  }
>  
> -void kvm_inc_notifier_count(struct kvm *kvm, unsigned long start,
> -                                  unsigned long end)
> +void kvm_inc_notifier_count(struct kvm *kvm, gfn_t start, gfn_t end)
>  {
>         /*
>          * The count increase must become visible at unlock time as no
> @@ -786,8 +785,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
>         return 0;
>  }
>  
> -void kvm_dec_notifier_count(struct kvm *kvm, unsigned long start,
> -                                  unsigned long end)
> +void kvm_dec_notifier_count(struct kvm *kvm, gfn_t start, gfn_t end)
>  {
>         /*
>          * This sequence increase will notify the kvm page fault that
> 
> 
> -- 
> Isaku Yamahata <isaku.yamahata@gmail.com>


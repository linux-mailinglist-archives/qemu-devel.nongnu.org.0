Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C8160EA86
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:49:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onnIN-0000ow-JM; Wed, 26 Oct 2022 16:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1onnIK-0000Q1-8J
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:46:36 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1onnIA-00011x-Fa
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:46:35 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso3943475pjg.5
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=osbqX8leV6g/SkiEHlFgEuxy7LRzWU2Y7Uh+l7tX15w=;
 b=jpYjPBLG06J9WOn/bBWpwBCbAYRsRYqGtpSJMTFmnFYTA2ZFnazgRXI8p//toCQ2TJ
 y0spJgx5cSlhzZ3SljvtDIADHdIjucdfN8NSuX9QNmLHoPzorq79XbjryWXjfHFl30lq
 a+yGNHUmONi8/9fjz20oKzw3ydyHBmBZfyBBhDMaJiuRleHwSAzhKieuIBUJl+OaRWkx
 J8ePiRgrp1obhqOjSj/zBR/mn+zZs1yFys+iRMsX91dPwar3019jAkA21DzvD4AEs3Ci
 EqQhVJdb++3PMZsV4Ve+oth/VTO9h3hSFBdHXErMhMsb9uXlU65Dc3fy+9wGFc3kxwVE
 7xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=osbqX8leV6g/SkiEHlFgEuxy7LRzWU2Y7Uh+l7tX15w=;
 b=S63HRMUnTWY7pVTngz/3Khx8CePgPgEqXGkpZBoRFh+TmTaFiOL9CS2H2tRzpoV5nz
 V9xsB6GjTA/AmIHX6YmFRbCcOPNDAA7IG7l3UIvsuP9TRCZX1Mf0TEu/wDucS6TBrgyF
 b0+ytSM2/mgVqn8XghocnZFfOi2e4Ao//JlvihGCVHL+U3wvbO9ckHqsK8v0hSKHjTf4
 LXEmVL3V64YQIf54d5jlipUZOA7GAWYjuiHbk9V5+cHVFvwAoj9jsa/ik3wyVFy9yPZE
 mLpOoepebp+6DROGStqzbdBQXD3TiiyUCeAA+7XgaSB0/TrVHTK4aE+9bXjx+pfEjOeo
 8IeA==
X-Gm-Message-State: ACrzQf22WSOzgY6nBQ8AdF0XHKFeDHxo+qkIpF3ZkRHHhB/UaK9Ln7Vl
 H37C2+trgCFGO5GQQnLk1Kw=
X-Google-Smtp-Source: AMsMyM7NaRTKclIWYEWcxpgdPdqgRZFy22OSD7N8p45NptTu2RyVSV2oujVK1I0Ov2AG9q7XgNRCoQ==
X-Received: by 2002:a17:902:7b95:b0:178:ab50:76b5 with SMTP id
 w21-20020a1709027b9500b00178ab5076b5mr46490591pll.161.1666817182250; 
 Wed, 26 Oct 2022 13:46:22 -0700 (PDT)
Received: from localhost ([192.55.54.55]) by smtp.gmail.com with ESMTPSA id
 a8-20020a170902710800b00172973d3cd9sm3308650pll.55.2022.10.26.13.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:46:21 -0700 (PDT)
Date: Wed, 26 Oct 2022 13:46:20 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
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
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com,
 isaku.yamahata@gmail.com
Subject: Re: [PATCH v9 6/8] KVM: Update lpage info when private/shared memory
 are mixed
Message-ID: <20221026204620.GB3819453@ls.amr.corp.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-7-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221025151344.3784230-7-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022 at 11:13:42PM +0800,
Chao Peng <chao.p.peng@linux.intel.com> wrote:

> When private/shared memory are mixed in a large page, the lpage_info may
> not be accurate and should be updated with this mixed info. A large page
> has mixed pages can't be really mapped as large page since its
> private/shared pages are from different physical memory.
> 
> Update lpage_info when private/shared memory attribute is changed. If
> both private and shared pages are within a large page region, it can't
> be mapped as large page. It's a bit challenge to track the mixed
> info in a 'count' like variable, this patch instead reserves a bit in
> 'disallow_lpage' to indicate a large page has mixed private/share pages.
> 
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  arch/x86/include/asm/kvm_host.h |   8 +++
>  arch/x86/kvm/mmu/mmu.c          | 112 +++++++++++++++++++++++++++++++-
>  arch/x86/kvm/x86.c              |   2 +
>  include/linux/kvm_host.h        |  19 ++++++
>  virt/kvm/kvm_main.c             |  16 +++--
>  5 files changed, 152 insertions(+), 5 deletions(-)
> 
...
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 33b1aec44fb8..67a9823a8c35 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
...
> @@ -6910,3 +6915,108 @@ void kvm_mmu_pre_destroy_vm(struct kvm *kvm)
>  	if (kvm->arch.nx_lpage_recovery_thread)
>  		kthread_stop(kvm->arch.nx_lpage_recovery_thread);
>  }
> +
> +static inline bool linfo_is_mixed(struct kvm_lpage_info *linfo)
> +{
> +	return linfo->disallow_lpage & KVM_LPAGE_PRIVATE_SHARED_MIXED;
> +}
> +
> +static inline void linfo_update_mixed(struct kvm_lpage_info *linfo, bool mixed)
> +{
> +	if (mixed)
> +		linfo->disallow_lpage |= KVM_LPAGE_PRIVATE_SHARED_MIXED;
> +	else
> +		linfo->disallow_lpage &= ~KVM_LPAGE_PRIVATE_SHARED_MIXED;
> +}
> +
> +static bool mem_attr_is_mixed_2m(struct kvm *kvm, unsigned int attr,
> +				 gfn_t start, gfn_t end)
> +{
> +	XA_STATE(xas, &kvm->mem_attr_array, start);
> +	gfn_t gfn = start;
> +	void *entry;
> +	bool shared = attr == KVM_MEM_ATTR_SHARED;
> +	bool mixed = false;
> +
> +	rcu_read_lock();
> +	entry = xas_load(&xas);
> +	while (gfn < end) {
> +		if (xas_retry(&xas, entry))
> +			continue;
> +
> +		KVM_BUG_ON(gfn != xas.xa_index, kvm);
> +
> +		if ((entry && !shared) || (!entry && shared)) {
> +			mixed = true;
> +			goto out;

nitpick: goto isn't needed. break should work.

> +		}
> +
> +		entry = xas_next(&xas);
> +		gfn++;
> +	}
> +out:
> +	rcu_read_unlock();
> +	return mixed;
> +}
> +
> +static bool mem_attr_is_mixed(struct kvm *kvm, struct kvm_memory_slot *slot,
> +			      int level, unsigned int attr,
> +			      gfn_t start, gfn_t end)
> +{
> +	unsigned long gfn;
> +	void *entry;
> +
> +	if (level == PG_LEVEL_2M)
> +		return mem_attr_is_mixed_2m(kvm, attr, start, end);
> +
> +	entry = xa_load(&kvm->mem_attr_array, start);
> +	for (gfn = start; gfn < end; gfn += KVM_PAGES_PER_HPAGE(level - 1)) {
> +		if (linfo_is_mixed(lpage_info_slot(gfn, slot, level - 1)))
> +			return true;
> +		if (xa_load(&kvm->mem_attr_array, gfn) != entry)
> +			return true;
> +	}
> +	return false;
> +}
> +
> +void kvm_arch_update_mem_attr(struct kvm *kvm, struct kvm_memory_slot *slot,
> +			      unsigned int attr, gfn_t start, gfn_t end)
> +{
> +
> +	unsigned long lpage_start, lpage_end;
> +	unsigned long gfn, pages, mask;
> +	int level;
> +
> +	WARN_ONCE(!(attr & (KVM_MEM_ATTR_PRIVATE | KVM_MEM_ATTR_SHARED)),
> +			"Unsupported mem attribute.\n");
> +
> +	/*
> +	 * The sequence matters here: we update the higher level basing on the
> +	 * lower level's scanning result.
> +	 */
> +	for (level = PG_LEVEL_2M; level <= KVM_MAX_HUGEPAGE_LEVEL; level++) {
> +		pages = KVM_PAGES_PER_HPAGE(level);
> +		mask = ~(pages - 1);

nitpick: KVM_HPAGE_MASK(level).  Maybe matter of preference.


> +		lpage_start = max(start & mask, slot->base_gfn);
> +		lpage_end = (end - 1) & mask;
> +
> +		/*
> +		 * We only need to scan the head and tail page, for middle pages
> +		 * we know they are not mixed.
> +		 */
> +		linfo_update_mixed(lpage_info_slot(lpage_start, slot, level),
> +				   mem_attr_is_mixed(kvm, slot, level, attr,
> +						     lpage_start, start));
> +
> +		if (lpage_start == lpage_end)
> +			return;
> +
> +		for (gfn = lpage_start + pages; gfn < lpage_end; gfn += pages)
> +			linfo_update_mixed(lpage_info_slot(gfn, slot, level),
> +					   false);
> +
> +		linfo_update_mixed(lpage_info_slot(lpage_end, slot, level),
> +				   mem_attr_is_mixed(kvm, slot, level, attr,
> +						     end, lpage_end + pages));
> +	}
> +}

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>


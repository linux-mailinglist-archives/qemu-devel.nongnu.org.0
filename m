Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2175EFB7E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:05:06 +0200 (CEST)
Received: from localhost ([::1]:55788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwy9-0000ZM-PS
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1odwlk-0002c9-Al
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:52:16 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1odwlg-0006bH-1x
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:52:15 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 d1-20020a17090a6a4100b002095b319b9aso609045pjm.0
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=x9smInTAbexJo9FMfDYVJQZwAv5RTV0u/BRwYhuyUIM=;
 b=PwjBr2d/k51WljMRLL/MtzEUzt/CV8BMwu9RVh5Qp64ULy6sMBEfD0X0V19DymfIUD
 thmUX8sJzb/9C05zq+6yW6pJoeUsZ4oBK1z5HZ5tus02z3yu/0eDEWpo+suieXqzpO4y
 g/fMYriQN9IU911un2COmNuISl00RmkN+KNzAFgzWxzHAw8GDOA3b4hBP7FDqUqgkSBk
 x4dDRHxZPQ4cAJRh/OBmcol+Zg9vythYVGgIu2g3K1fkJfpesTKQulYk7WgVpxsd79p2
 EBpRetruvY1JFl2Q68g5TRpODWeocIr50AdShiLZwkkLmH4C5dWh9Zwa9cPFK5EQItUQ
 ndCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=x9smInTAbexJo9FMfDYVJQZwAv5RTV0u/BRwYhuyUIM=;
 b=dUZBg5dkNA1/kA2tAxLsTNnio4UlHDSn2HvaL39ZT2ULh2VjPt5QCXcnylYLa3ijiC
 cxm0pCQIJqS69eeXXuxXj43akKCl9p56XaFFDIWHgMWAzkffDuWxbdmMWzKbTSYfzoIG
 Q+0Zzwjogi9DDx3FN1Wh9CZQr6AVgZzKZOVMhJvGoYeYU4EopNxTDKXA61R1oOdzikev
 lVhXHbHvgPf7BURRFfiyea0wWZhJ2Vmm7lrGGaPTlLfMrzuMykSIra2RO1ni/I09RrUi
 wMahjlS/Ktr9k5UYUXnQIj7iCy9qpex3i+I2SaOWsvlwm5yrHog8+wvDnK9HhAIT0puy
 82EA==
X-Gm-Message-State: ACrzQf0QLP8YufwMEa9uBXUgZ1IX3RpOmUhsbJo+qqe82299n/562xiL
 CCHFjqYOKDiT90iQWeWHJU4=
X-Google-Smtp-Source: AMsMyM6raR6uUEz9DHqlfOrbVWNAKhfnOrks6W/5gYqM980XfqIW8voC8f+sAqt/40JCIMp7SocU0Q==
X-Received: by 2002:a17:902:b194:b0:17a:ccae:4ceb with SMTP id
 s20-20020a170902b19400b0017accae4cebmr4359490plr.36.1664470329501; 
 Thu, 29 Sep 2022 09:52:09 -0700 (PDT)
Received: from localhost ([192.55.54.55]) by smtp.gmail.com with ESMTPSA id
 z16-20020a170902ccd000b00176677a893bsm119123ple.82.2022.09.29.09.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:52:08 -0700 (PDT)
Date: Thu, 29 Sep 2022 09:52:06 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
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
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com,
 isaku.yamahata@gmail.com
Subject: Re: [PATCH v8 6/8] KVM: Update lpage info when private/shared memory
 are mixed
Message-ID: <20220929165206.GA1963093@ls.amr.corp.intel.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-7-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915142913.2213336-7-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 15, 2022 at 10:29:11PM +0800,
Chao Peng <chao.p.peng@linux.intel.com> wrote:

> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 08abad4f3e6f..a0f198cede3d 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
...
> @@ -6894,3 +6899,115 @@ void kvm_mmu_pre_destroy_vm(struct kvm *kvm)
>  	if (kvm->arch.nx_lpage_recovery_thread)
>  		kthread_stop(kvm->arch.nx_lpage_recovery_thread);
>  }
> +
> +static bool mem_attr_is_mixed(struct kvm *kvm, unsigned int attr,
> +			      gfn_t start, gfn_t end)
> +{
> +	XA_STATE(xas, &kvm->mem_attr_array, start);
> +	gfn_t gfn = start;
> +	void *entry;
> +	bool shared, private;
> +	bool mixed = false;
> +
> +	if (attr == KVM_MEM_ATTR_SHARED) {
> +		shared = true;
> +		private = false;
> +	} else {
> +		shared = false;
> +		private = true;
> +	}

We don't have to care the target is shared or private.  We need to check
only same or not.

> +
> +	rcu_read_lock();
> +	entry = xas_load(&xas);
> +	while (gfn < end) {
> +		if (xas_retry(&xas, entry))
> +			continue;
> +
> +		KVM_BUG_ON(gfn != xas.xa_index, kvm);
> +
> +		if (entry)
> +			private = true;
> +		else
> +			shared = true;
> +
> +		if (private && shared) {
> +			mixed = true;
> +			goto out;
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
> +static inline void update_mixed(struct kvm_lpage_info *linfo, bool mixed)
> +{
> +	if (mixed)
> +		linfo->disallow_lpage |= KVM_LPAGE_PRIVATE_SHARED_MIXED;
> +	else
> +		linfo->disallow_lpage &= ~KVM_LPAGE_PRIVATE_SHARED_MIXED;
> +}
> +
> +static void update_mem_lpage_info(struct kvm *kvm,
> +				  struct kvm_memory_slot *slot,
> +				  unsigned int attr,
> +				  gfn_t start, gfn_t end)
> +{
> +	unsigned long lpage_start, lpage_end;
> +	unsigned long gfn, pages, mask;
> +	int level;
> +
> +	for (level = PG_LEVEL_2M; level <= KVM_MAX_HUGEPAGE_LEVEL; level++) {
> +		pages = KVM_PAGES_PER_HPAGE(level);
> +		mask = ~(pages - 1);
> +		lpage_start = start & mask;
> +		lpage_end = (end - 1) & mask;
> +
> +		/*
> +		 * We only need to scan the head and tail page, for middle pages
> +		 * we know they are not mixed.
> +		 */
> +		update_mixed(lpage_info_slot(lpage_start, slot, level),
> +			     mem_attr_is_mixed(kvm, attr, lpage_start,
> +							  lpage_start + pages));
> +
> +		if (lpage_start == lpage_end)
> +			return;
> +
> +		for (gfn = lpage_start + pages; gfn < lpage_end; gfn += pages)
> +			update_mixed(lpage_info_slot(gfn, slot, level), false);


For >2M case, we don't have to check all entry. just check lower level case.

> +
> +		update_mixed(lpage_info_slot(lpage_end, slot, level),
> +			     mem_attr_is_mixed(kvm, attr, lpage_end,
> +							  lpage_end + pages));
> +	}
> +}
> +
> +void kvm_arch_update_mem_attr(struct kvm *kvm, unsigned int attr,
> +			      gfn_t start, gfn_t end)
> +{
> +	struct kvm_memory_slot *slot;
> +	struct kvm_memslots *slots;
> +	struct kvm_memslot_iter iter;
> +	int i;
> +
> +	WARN_ONCE(!(attr & (KVM_MEM_ATTR_PRIVATE | KVM_MEM_ATTR_SHARED)),
> +			"Unsupported mem attribute.\n");
> +
> +	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> +		slots = __kvm_memslots(kvm, i);
> +
> +		kvm_for_each_memslot_in_gfn_range(&iter, slots, start, end) {
> +			slot = iter.slot;
> +			start = max(start, slot->base_gfn);
> +			end = min(end, slot->base_gfn + slot->npages);
> +			if (WARN_ON_ONCE(start >= end))
> +				continue;
> +
> +			update_mem_lpage_info(kvm, slot, attr, start, end);
> +		}
> +	}
> +}


Here is my updated version.

bool kvm_mem_attr_is_mixed(struct kvm_memory_slot *slot, gfn_t gfn, int level)
{
	gfn_t pages = KVM_PAGES_PER_HPAGE(level);
	gfn_t mask = ~(pages - 1);
	struct kvm_lpage_info *linfo = lpage_info_slot(gfn & mask, slot, level);

	WARN_ON_ONCE(level == PG_LEVEL_4K);
	return linfo->disallow_lpage & KVM_LPAGE_PRIVATE_SHARED_MIXED;
}

#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM_ATTR
static void update_mixed(struct kvm_lpage_info *linfo, bool mixed)
{
	if (mixed)
		linfo->disallow_lpage |= KVM_LPAGE_PRIVATE_SHARED_MIXED;
	else
		linfo->disallow_lpage &= ~KVM_LPAGE_PRIVATE_SHARED_MIXED;
}

static bool __mem_attr_is_mixed(struct kvm *kvm, gfn_t start, gfn_t end)
{
	XA_STATE(xas, &kvm->mem_attr_array, start);
	bool mixed = false;
	gfn_t gfn = start;
	void *s_entry;
	void *entry;

	rcu_read_lock();
	s_entry = xas_load(&xas);
	entry = s_entry;
	while (gfn < end) {
		if (xas_retry(&xas, entry))
			continue;

		KVM_BUG_ON(gfn != xas.xa_index, kvm);

		entry = xas_next(&xas);
		if (entry != s_entry) {
			mixed = true;
			break;
		}
		gfn++;
	}
	rcu_read_unlock();
	return mixed;
}

static bool mem_attr_is_mixed(struct kvm *kvm,
			      struct kvm_memory_slot *slot, int level,
			      gfn_t start, gfn_t end)
{
	struct kvm_lpage_info *child_linfo;
	unsigned long child_pages;
	bool mixed = false;
	unsigned long gfn;
	void *entry;

	if (WARN_ON_ONCE(level == PG_LEVEL_4K))
		return false;

	if (level == PG_LEVEL_2M)
		return __mem_attr_is_mixed(kvm, start, end);

	/* This assumes that level - 1 is already updated. */
	rcu_read_lock();
	child_pages = KVM_PAGES_PER_HPAGE(level - 1);
	entry = xa_load(&kvm->mem_attr_array, start);
	for (gfn = start; gfn < end; gfn += child_pages) {
		child_linfo = lpage_info_slot(gfn, slot, level - 1);
		if (child_linfo->disallow_lpage & KVM_LPAGE_PRIVATE_SHARED_MIXED) {
			mixed = true;
			break;
		}
		if (xa_load(&kvm->mem_attr_array, gfn) != entry) {
			mixed = true;
			break;
		}
	}
	rcu_read_unlock();
	return mixed;
}

static void update_mem_lpage_info(struct kvm *kvm,
				  struct kvm_memory_slot *slot,
				  unsigned int attr,
				  gfn_t start, gfn_t end)
{
	unsigned long lpage_start, lpage_end;
	unsigned long gfn, pages, mask;
	int level;

	for (level = PG_LEVEL_2M; level <= KVM_MAX_HUGEPAGE_LEVEL; level++) {
		pages = KVM_PAGES_PER_HPAGE(level);
		mask = ~(pages - 1);
		lpage_start = start & mask;
		lpage_end = (end - 1) & mask;

		/*
		 * We only need to scan the head and tail page, for middle pages
		 * we know they are not mixed.
		 */
		update_mixed(lpage_info_slot(lpage_start, slot, level),
			     mem_attr_is_mixed(kvm, slot, level,
					       lpage_start, lpage_start + pages));

		if (lpage_start == lpage_end)
			return;

		for (gfn = lpage_start + pages; gfn < lpage_end; gfn += pages)
			update_mixed(lpage_info_slot(gfn, slot, level), false);

		update_mixed(lpage_info_slot(lpage_end, slot, level),
			     mem_attr_is_mixed(kvm, slot, level,
					       lpage_end, lpage_end + pages));
	}
}

void kvm_arch_update_mem_attr(struct kvm *kvm, unsigned int attr,
			      gfn_t start, gfn_t end)
{
	struct kvm_memory_slot *slot;
	struct kvm_memslots *slots;
	struct kvm_memslot_iter iter;
	int idx;
	int i;

	WARN_ONCE(!(attr & (KVM_MEM_ATTR_PRIVATE | KVM_MEM_ATTR_SHARED)),
		  "Unsupported mem attribute.\n");

	idx = srcu_read_lock(&kvm->srcu);
	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
		slots = __kvm_memslots(kvm, i);

		kvm_for_each_memslot_in_gfn_range(&iter, slots, start, end) {
			slot = iter.slot;
			start = max(start, slot->base_gfn);
			end = min(end, slot->base_gfn + slot->npages);
			if (WARN_ON_ONCE(start >= end))
				continue;

			update_mem_lpage_info(kvm, slot, attr, start, end);
		}
	}
	srcu_read_unlock(&kvm->srcu, idx);
}
#endif


-- 
Isaku Yamahata <isaku.yamahata@gmail.com>


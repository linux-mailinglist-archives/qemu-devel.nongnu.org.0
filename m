Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2E64EA46C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 03:10:15 +0200 (CEST)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ0NC-0006Yj-FM
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 21:10:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nZ0KU-0005Ka-HD
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 21:07:26 -0400
Received: from [2607:f8b0:4864:20::62d] (port=35561
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nZ0KS-0003DF-Od
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 21:07:26 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y6so13695599plg.2
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 18:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cNnTmAvvT74txMtnR1Krg2oFiWxKy8LARzL6TDyTD4o=;
 b=DvgMoOvqdYe05z7xIk2xxTjtFeY0wTCREKrq+N4CnyKjdrRt8WUVn7fDh/7Hv33Yvw
 6vGSPZrLwGmej2gARCAHRGm5JjspY9xemeSP9SyTLApd+gm2vh5EqX5ZtAjmYjQLxJlM
 mTCxddjigvYS6sZSL9uITKgA/cwxk07nvRE9bu63miL2bFkDja/VBSYemnKH22fCNYNA
 N99zAG33rrNyqC/iG/AidER5o/TivRzMV7cH+M0zDOdlOG5jUdAzykuasEJiAcdCD8uw
 wV68VMfWHAtxgveLagbihh6cakI4+fUdQla2XnEcgKB9K07pevIvSoIwi3oSenHtrewI
 ofsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cNnTmAvvT74txMtnR1Krg2oFiWxKy8LARzL6TDyTD4o=;
 b=fnGuPaqYXzXDnELhTzQ0xBLttpawhWhoFy77dQXU9y6F7JEq7dcPeuXZGbYiwXp9Wk
 JvNuO8IB7lwvNxJzQjksuJ3a2rOKWpxR7W6SLBRU9QspA6dXfvnkG3WfDCa2ojG6lP1H
 nIWzROYrZdd/1dy8n75HARZrKh0FvqkRdcKfK7Xa/zsPsvojfe5S73Y7BHiyorjEZcE5
 Wp+bessHPWBM0QUpoOmdJzVCgr5Kx1tfPu0fbkNbg85dfRqSqywpNljnlpPhU5/4a22P
 ZJ/hI/YqhPIuHEhkF4IcTe1RQVFEQsNNpGRo3Yn8GyD1x7JdEfDpnzKpM008AMrURqij
 /cLQ==
X-Gm-Message-State: AOAM531uK3qVKoeExJzN9YtBjYv4ewUUrSH5CPcrGIGOBw3Qvy8Re6W0
 0oHi1biJJ0bKlHill/tcrMGm7g==
X-Google-Smtp-Source: ABdhPJwFVDGrpZrIFv666CmEg0Frn74tTh8fMgDvSijnAmWVcdIxb5iQWG0VKn06IiR/gpJrlSZDdg==
X-Received: by 2002:a17:90a:3181:b0:1c7:6d18:391a with SMTP id
 j1-20020a17090a318100b001c76d18391amr1893417pjb.30.1648516042944; 
 Mon, 28 Mar 2022 18:07:22 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 y16-20020a637d10000000b00381268f2c6fsm14432627pgc.4.2022.03.28.18.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 18:07:22 -0700 (PDT)
Date: Tue, 29 Mar 2022 01:07:18 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com
Subject: Re: [PATCH v5 09/13] KVM: Handle page fault for private memory
Message-ID: <YkJbxiL/Az7olWlq@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-10-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310140911.50924-10-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=seanjc@google.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

On Thu, Mar 10, 2022, Chao Peng wrote:
> @@ -3890,7 +3893,59 @@ static bool kvm_arch_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
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

@is_private_pfn should be a field in @fault, not a separate parameter, and it
should be a const property set by the original caller.  I would also name it
"is_private", because if KVM proceeds past this point, it will be a property of
the fault/access _and_ the pfn

I say it's a property of the fault because the below kvm_vcpu_is_private_gfn()
should instead be:

	if (fault->is_private)

The kvm_vcpu_is_private_gfn() check is TDX centric.  For SNP, private vs. shared
is communicated via error code.  For software-only (I'm being optimistic ;-) ),
we'd probably need to track private vs. shared internally in KVM, I don't think
we'd want to force it to be a property of the gfn.

Then you can also move the fault->is_private waiver into is_page_fault_stale(),
and drop the local is_private_pfn in direct_page_fault().

> +{
> +	int order;
> +	unsigned int flags = 0;
> +	struct kvm_memory_slot *slot = fault->slot;
> +	long pfn = kvm_memfile_get_pfn(slot, fault->gfn, &order);

If get_lock_pfn() and thus kvm_memfile_get_pfn() returns a pure error code instead
of multiplexing the pfn, then this can be:

	bool is_private_pfn;

	is_private_pfn = !!kvm_memfile_get_pfn(slot, fault->gfn, &fault->pfn, &order);

That self-documents the "pfn < 0" == shared logic.

> +
> +	if (kvm_vcpu_is_private_gfn(vcpu, fault->addr >> PAGE_SHIFT)) {
> +		if (pfn < 0)
> +			flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
> +		else {
> +			fault->pfn = pfn;
> +			if (slot->flags & KVM_MEM_READONLY)
> +				fault->map_writable = false;
> +			else
> +				fault->map_writable = true;
> +
> +			if (order == 0)
> +				fault->max_level = PG_LEVEL_4K;

This doesn't correctly handle order > 0, but less than the next page size, in which
case max_level needs to be PG_LEVEL_4k.  It also doesn't handle the case where
max_level > PG_LEVEL_2M.

That said, I think the proper fix is to have the get_lock_pfn() API return the max
mapping level, not the order.  KVM, and presumably any other secondary MMU that might
use these APIs, doesn't care about the order of the struct page, KVM cares about the
max size/level of page it can map into the guest.  And similar to the previous patch,
"order" is specific to struct page, which we are trying to avoid.

> +			*is_private_pfn = true;

This is where KVM guarantees that is_private_pfn == fault->is_private.

> +			*r = RET_PF_FIXED;
> +			return true;

Ewww.  This is super confusing.  Ditto for the "*r = -1" magic number.  I totally
understand why you took this approach, it's just hard to follow because it kinda
follows the kvm_faultin_pfn() semantics, but then inverts true and false in this
one case.

I think the least awful option is to forego the helper and open code everything.
If we ever refactor kvm_faultin_pfn() to be less weird then we can maybe move this
to a helper.

Open coding isn't too bad if you reorganize things so that the exit-to-userspace
path is a dedicated, early check.  IMO, it's a lot easier to read this way, open
coded or not.

I think this is correct?  "is_private_pfn" and "level" are locals, everything else
is in @fault.

	if (kvm_slot_is_private(slot)) {
		is_private_pfn = !!kvm_memfile_get_pfn(slot, fault->gfn,
						       &fault->pfn, &level);

		if (fault->is_private != is_private_pfn) {
			if (is_private_pfn)
				kvm_memfile_put_pfn(slot, fault->pfn);

			vcpu->run->exit_reason = KVM_EXIT_MEMORY_ERROR;
			if (fault->is_private)
				vcpu->run->memory.flags = KVM_MEMORY_EXIT_FLAG_PRIVATE;
			else
				vcpu->run->memory.flags = 0;
			vcpu->run->memory.padding = 0;
			vcpu->run->memory.gpa = fault->gfn << PAGE_SHIFT;
			vcpu->run->memory.size = PAGE_SIZE;
			*r = 0;
			return true;
		}

		/*
		 * fault->pfn is all set if the fault is for a private pfn, just
		 * need to update other metadata.
		 */
		if (fault->is_private) {
			fault->max_level = min(fault->max_level, level);
			fault->map_writable = !(slot->flags & KVM_MEM_READONLY);
			return false;
		}

		/* Fault is shared, fallthrough to the standard path. */
	}

	async = false;

> @@ -4016,7 +4076,7 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  	else
>  		write_lock(&vcpu->kvm->mmu_lock);
>  
> -	if (is_page_fault_stale(vcpu, fault, mmu_seq))
> +	if (!is_private_pfn && is_page_fault_stale(vcpu, fault, mmu_seq))

As above, I'd prefer this check go in is_page_fault_stale().  It means shadow MMUs
will suffer a pointless check, but I don't think that's a big issue.  Oooh, unless
we support software-only, which would play nice with nested and probably even legacy
shadow paging.  Fun :-)

>  		goto out_unlock;
>  
>  	r = make_mmu_pages_available(vcpu);
> @@ -4033,7 +4093,12 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  		read_unlock(&vcpu->kvm->mmu_lock);
>  	else
>  		write_unlock(&vcpu->kvm->mmu_lock);
> -	kvm_release_pfn_clean(fault->pfn);
> +
> +	if (is_private_pfn)

And this can be

	if (fault->is_private)

Same feedback for paging_tmpl.h.


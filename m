Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1774D4EB415
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 21:25:00 +0200 (CEST)
Received: from localhost ([::1]:58592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZHSc-0007dY-PF
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 15:24:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nZHQv-0006aP-9g
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:23:13 -0400
Received: from [2607:f8b0:4864:20::530] (port=43996
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nZHQt-0005uO-7A
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:23:12 -0400
Received: by mail-pg1-x530.google.com with SMTP id c2so15637786pga.10
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 12:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=leHL94h+MpS4/OEOPtJEdh0aJz+CrPTMrBVs83Qfv3E=;
 b=f9RP67uwP/U4yYMwWleoqNxKjYfD+VZ9bI5mxhlSyD+CCMlJ5FCF77eVp5wFXeZEON
 V2IkeIbb0iHzwsqI2Do5dROL5K53gUBZaDEYt42cPjujky5xN1evllqzZccVhRjtEiQc
 BtFaX3WWMuJUXnlj4vHNmqhdRoF82wpMpPdh3QXX4XHcC1vsLHj9RZKCIyFRbJXDEpb4
 6grrlWOCR3R9b9US42EBjL5V5jC63ILxWOO/exIV0gi7WqmoC2YAHWbBTYwrE7uxi8LY
 nvZYtSC+jvXOJc6q3t8LNy6rdjjy8WQl8/HONzcHWfFl4cAyGvjbsH3Nd/l/9l36p+7v
 Jaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=leHL94h+MpS4/OEOPtJEdh0aJz+CrPTMrBVs83Qfv3E=;
 b=56z+xEQMvg2FWpdcpZOa4BdolfBcqgP5pmPGn53lf9GPA88UcXmlIbtvKj2M7vqYWm
 jU31rsNOCHd6+FN3O5jEa1uAtfBURh9fpXmgKHaScbCcyMZNOCqBZTLMybHQfAutfIGM
 5WR0a8mSgGruIT4LW+lx3ylEWdPNqpiCPpullwiqBTfQbK7oQImPhhlKCHDSoTbq17C/
 LEN4myAwWUMauIi0MQWcFM2/2H1JBPo/eVYAr/tl6Mqty63BCHaJUEaXv5D+dVcBIyIJ
 ko5Hw9I5yvoAlBlC3qVJnzXRPKOIUzuwbBMtCgAxSPSCotNPMu1BtAC+o9Fj9jxhPryw
 UUxg==
X-Gm-Message-State: AOAM531dt+7S0NalBoG/SqluECAea2LDhsqg3EEKvJOq+d+hiOVvSZZR
 4IhFoCXWxnXpmy5m/lALtEvvUg==
X-Google-Smtp-Source: ABdhPJwjnUern9b0nwzFDfrc+KHUoi+vzEO/eEg7u0tJsu4zhLLogQOi1j9Ecq4LcoDSrQKd/DUgkw==
X-Received: by 2002:a05:6a00:1908:b0:4f7:8813:b2cb with SMTP id
 y8-20020a056a00190800b004f78813b2cbmr28993474pfi.54.1648581789396; 
 Tue, 29 Mar 2022 12:23:09 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 j6-20020a17090a588600b001c699d77503sm3584376pji.2.2022.03.29.12.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 12:23:08 -0700 (PDT)
Date: Tue, 29 Mar 2022 19:23:04 +0000
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
Subject: Re: [PATCH v5 11/13] KVM: Zap existing KVM mappings when pages
 changed in the private fd
Message-ID: <YkNcmGsOw4MThaym@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-12-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310140911.50924-12-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=seanjc@google.com; helo=mail-pg1-x530.google.com
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
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 67349421eae3..52319f49d58a 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -841,8 +841,43 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
>  #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
>  
>  #ifdef CONFIG_MEMFILE_NOTIFIER
> +static void kvm_memfile_notifier_handler(struct memfile_notifier *notifier,
> +					 pgoff_t start, pgoff_t end)
> +{
> +	int idx;
> +	struct kvm_memory_slot *slot = container_of(notifier,
> +						    struct kvm_memory_slot,
> +						    notifier);
> +	struct kvm_gfn_range gfn_range = {
> +		.slot		= slot,
> +		.start		= start - (slot->private_offset >> PAGE_SHIFT),
> +		.end		= end - (slot->private_offset >> PAGE_SHIFT),
> +		.may_block 	= true,
> +	};
> +	struct kvm *kvm = slot->kvm;
> +
> +	gfn_range.start = max(gfn_range.start, slot->base_gfn);
> +	gfn_range.end = min(gfn_range.end, slot->base_gfn + slot->npages);
> +
> +	if (gfn_range.start >= gfn_range.end)
> +		return;
> +
> +	idx = srcu_read_lock(&kvm->srcu);
> +	KVM_MMU_LOCK(kvm);
> +	kvm_unmap_gfn_range(kvm, &gfn_range);
> +	kvm_flush_remote_tlbs(kvm);

This should check the result of kvm_unmap_gfn_range() and flush only if necessary.

kvm->mmu_notifier_seq needs to be incremented, otherwise KVM will incorrectly
install a SPTE if the mapping is zapped between retrieving the pfn in faultin and
installing it after acquire mmu_lock.


> +	KVM_MMU_UNLOCK(kvm);
> +	srcu_read_unlock(&kvm->srcu, idx);
> +}
> +
> +static struct memfile_notifier_ops kvm_memfile_notifier_ops = {
> +	.invalidate = kvm_memfile_notifier_handler,
> +	.fallocate = kvm_memfile_notifier_handler,
> +};
> +
>  static inline int kvm_memfile_register(struct kvm_memory_slot *slot)
>  {
> +	slot->notifier.ops = &kvm_memfile_notifier_ops;
>  	return memfile_register_notifier(file_inode(slot->private_file),
>  					 &slot->notifier,
>  					 &slot->pfn_ops);
> @@ -1963,6 +1998,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
>  	new->private_file = file;
>  	new->private_offset = mem->flags & KVM_MEM_PRIVATE ?
>  			      region_ext->private_offset : 0;
> +	new->kvm = kvm;
>  
>  	r = kvm_set_memslot(kvm, old, new, change);
>  	if (!r)
> -- 
> 2.17.1
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D8766A63C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 23:51:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGSsf-0005en-My; Fri, 13 Jan 2023 17:50:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pGSsZ-0005e8-Ex
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:50:32 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pGSsX-0003ko-Bd
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:50:30 -0500
Received: by mail-pj1-x1033.google.com with SMTP id v23so23805306pju.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 14:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yQZCEBEaghsOR+zhl/QRIXPVX+uCKPvU91VQuy/V94s=;
 b=X76rLWdZrm8cdm781bGE/NuVpMIrvPOi9lGhvncTfFs81VVxsQB/QGGTWKxHh1GL1W
 d/AoRzt/BgZEnefw0frAVABgAhcfb0NjbvQQ6PThCX1YXedTBAqOobICTThGoiP6om5q
 O3KMRfb6M32Bg7CVQSQvIy3h9U9bkySatLBmzLp/OFGTsGTVJq+w1gHMbDBjfBgq7rHh
 ADYr+PPp2TF3nGbuwOKFE5/4euBQA3ZQaQSM4gqqLZGzGNJeHa+tfxiLoUS2z+t4YmPi
 kKxrLU/4iehY+TcpZNW1WLdBUrSh7cY4mTcXmXq7RCEGkbTb53lk/EI3QzzxovpqZqg9
 0htA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yQZCEBEaghsOR+zhl/QRIXPVX+uCKPvU91VQuy/V94s=;
 b=WB1WFbsJMRViw2n+TiJ6TGLi4UCdSVno74oDLzRR4oTfMN6ds6qiOEDnh3IbmisHLf
 j9Y38uh+AJMTLl+q+t/xwWwKg/Jof0OlMefl+5SpNwf4eIXv89SIGkU7HTO+HNfLBJDX
 lRAWCLXEtPs9NqijbUNlpAEblhRN/HEty2VMibjALCW5OSWULS7oFyx+h9seKMb5ljFh
 KH3htxg9s4D0urPgmGvbroNO085MQEQDkyDc64EVT+OFVf6gRZGl/f7gg0LkN5GS9ggW
 u1aopxicv3axKO4jPEJEtXK5YhVvv4zisLNfCoFeAHMcAh3dNmaidaVAfyVJE47F81aB
 10uw==
X-Gm-Message-State: AFqh2krGz9KN8TVK+tNQgKB5nllkPeSPWucUDam4cdwMx+USKmOj9uzd
 unMfRJxC3Uw2LV0SlbTrysr5mg==
X-Google-Smtp-Source: AMrXdXuS4zXTytfOZ5xIh4bs+rkmeZmK+QXoBwGpkC3p2EnL8ac6bXz6nz3yQ+yKSuiIei2pYWQMCA==
X-Received: by 2002:a17:902:b10e:b0:191:4367:7fde with SMTP id
 q14-20020a170902b10e00b0019143677fdemr1360463plr.0.1673650227268; 
 Fri, 13 Jan 2023 14:50:27 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 13-20020a170902c24d00b0019460ac7c6asm3819704plg.283.2023.01.13.14.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 14:50:26 -0800 (PST)
Date: Fri, 13 Jan 2023 22:50:22 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
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
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 6/9] KVM: Unmap existing mappings when change the
 memory attributes
Message-ID: <Y8HgLq/CqTaEi/ME@google.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-7-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202061347.1070246-7-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 02, 2022, Chao Peng wrote:
> @@ -785,11 +786,12 @@ struct kvm {
>  
>  #if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
>  	struct mmu_notifier mmu_notifier;
> +#endif
>  	unsigned long mmu_invalidate_seq;
>  	long mmu_invalidate_in_progress;
>  	gfn_t mmu_invalidate_range_start;
>  	gfn_t mmu_invalidate_range_end;
> -#endif

Blech.  The existing code is a bit ugly, and trying to extend for this use case
makes things even worse.

Rather than use the base MMU_NOTIFIER Kconfig and an arbitrary define, I think we
should first add a proper Kconfig, e.g. KVM_GENERIC_MMU_NOTIFIER, to replace the
combination.  E.g

	config KVM_GENERIC_MMU_NOTIFIER
	       select MMU_NOTIFIER
	       bool

and then all architectures that currently #define KVM_ARCH_WANT_MMU_NOTIFIER can
simply select the Kconfig, which is everything except s390.  "GENERIC" again because
s390 does select MMU_NOTIFER and actually registers its own notifier for s390's
version of protected VMs (at least, I think that's what its "pv" stands for).

And then later down the line in this series, when the attributes and private mem
needs to tie into the notifiers, we can do:


	config KVM_GENERIC_MEMORY_ATTRIBUTES
	       select KVM_GENERIC_MMU_NOTIFIER
	       bool

I.e. that way this patch doesn't need to partially expose KVM's notifier stuff
and can instead just keep the soon-to-be-existing KVM_GENERIC_MMU_NOTIFIER.

Taking a depending on KVM_GENERIC_MMU_NOTIFIER for KVM_GENERIC_MEMORY_ATTRIBUTES
makes sense, because AFAICT, changing any type of attribute, e.g. RWX bits, is
going to necessitate unmapping the affected gfn range.

>  	struct list_head devices;
>  	u64 manual_dirty_log_protect;
>  	struct dentry *debugfs_dentry;
> @@ -1480,6 +1482,7 @@ bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu);
>  int kvm_arch_post_init_vm(struct kvm *kvm);
>  void kvm_arch_pre_destroy_vm(struct kvm *kvm);
>  int kvm_arch_create_vm_debugfs(struct kvm *kvm);
> +bool kvm_arch_has_private_mem(struct kvm *kvm);

The reference to private memory belongs in a later patch.  More below.

> +static void kvm_unmap_mem_range(struct kvm *kvm, gfn_t start, gfn_t end)
> +{
> +	struct kvm_gfn_range gfn_range;
> +	struct kvm_memory_slot *slot;
> +	struct kvm_memslots *slots;
> +	struct kvm_memslot_iter iter;
> +	int i;
> +	int r = 0;

The return from kvm_unmap_gfn_range() is a bool, this should be:

	bool flush = false;

> +
> +	gfn_range.pte = __pte(0);
> +	gfn_range.may_block = true;
> +
> +	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> +		slots = __kvm_memslots(kvm, i);
> +
> +		kvm_for_each_memslot_in_gfn_range(&iter, slots, start, end) {
> +			slot = iter.slot;
> +			gfn_range.start = max(start, slot->base_gfn);
> +			gfn_range.end = min(end, slot->base_gfn + slot->npages);
> +			if (gfn_range.start >= gfn_range.end)
> +				continue;
> +			gfn_range.slot = slot;
> +
> +			r |= kvm_unmap_gfn_range(kvm, &gfn_range);
> +		}
> +	}
> +
> +	if (r)
> +		kvm_flush_remote_tlbs(kvm);
> +}
> +
>  static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
>  					   struct kvm_memory_attributes *attrs)
>  {
>  	gfn_t start, end;
>  	unsigned long i;
>  	void *entry;
> +	int idx;
>  	u64 supported_attrs = kvm_supported_mem_attributes(kvm);
>  
> -	/* flags is currently not used. */
> +	/* 'flags' is currently not used. */

Kind of a spurious change.

>  	if (attrs->flags)
>  		return -EINVAL;
>  	if (attrs->attributes & ~supported_attrs)
> @@ -2372,6 +2409,13 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
>  
>  	entry = attrs->attributes ? xa_mk_value(attrs->attributes) : NULL;
>  
> +	if (kvm_arch_has_private_mem(kvm)) {

I think we should assume that any future attributes will necessitate unmapping
and invalidation, i.e. drop the private mem check.  That allows introducing
kvm_arch_has_private_mem() in a later patch that is more directly related to
private memory.

> +		KVM_MMU_LOCK(kvm);
> +		kvm_mmu_invalidate_begin(kvm);
> +		kvm_mmu_invalidate_range_add(kvm, start, end);
> +		KVM_MMU_UNLOCK(kvm);
> +	}
> +
>  	mutex_lock(&kvm->lock);
>  	for (i = start; i < end; i++)
>  		if (xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> @@ -2379,6 +2423,16 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
>  			break;
>  	mutex_unlock(&kvm->lock);
>  
> +	if (kvm_arch_has_private_mem(kvm)) {
> +		idx = srcu_read_lock(&kvm->srcu);

Mostly for reference, this goes away if slots_lock is used instead of kvm->lock.

> +		KVM_MMU_LOCK(kvm);
> +		if (i > start)
> +			kvm_unmap_mem_range(kvm, start, i);
> +		kvm_mmu_invalidate_end(kvm);
> +		KVM_MMU_UNLOCK(kvm);
> +		srcu_read_unlock(&kvm->srcu, idx);
> +	}
> +
>  	attrs->address = i << PAGE_SHIFT;
>  	attrs->size = (end - i) << PAGE_SHIFT;
>  
> -- 
> 2.25.1
> 


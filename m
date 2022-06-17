Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B273854FF63
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 23:33:11 +0200 (CEST)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2JaY-0008IP-CI
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 17:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1o2JYT-0006dy-3U
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 17:31:01 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1o2JYR-0005Rp-7O
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 17:31:00 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o6so4896168plg.2
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 14:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UqA+O2iAjJVJVS6ckVZAwOszKMvVWnDYVURyulma9/8=;
 b=rLPJAR88grVVrICam06LN8y5WgV/N1UDXOZUtwxnT05CZs2/+ScUbmlvPg7YNGt8jN
 CP/H23Hb5io+PPWzCiRobvcwa6QKaczN/XFJbCJ1xw5FJnKufBcNrQBq2QH3TVs6m/8S
 pT7Ot2jqLIXY5UYrEa9kMivftMhJQ3dtAiEYVicHj41LHpVN49WNN2gyfFOFkPL51bRO
 e2VE7PExegoxz8xRDdxSEKwgJlf0YXMCZQmM3cCvHURRIH33DMEbdALixtIGM0z5DMcv
 vU/sCc0n/YzSIEkmBVf46E+uON/ergwqcFB9WJP4GXemBs6Udj4I3LMO75CQIwPrcj5u
 /Kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UqA+O2iAjJVJVS6ckVZAwOszKMvVWnDYVURyulma9/8=;
 b=GXvLlUxE3G3zAJC/9NSCPQ4Wh7C6CyDieCxp00a5/vNEBySzGjaBXUyQ0URLBignui
 dtVGd9DkmELWoW+k8LBQJ/Vf4P1Am/lvdgQ34YUwrk7zF8cLsmTbyE1MR+8t1X8Au9wP
 JO0n7DKqitQVxy6GdQ1YIzvZSVB9/i3ienGAzp8s5/gEESYXHxSTYwKn6GyF0ztY0u1m
 3LC6vmsa6nE8yeZHpOZR4u8obK5AF6oM7KPn7y+aKNmSw1JWFFR2xPOtdONxV1ziGl8x
 7ivQs6LANosIytQ+/+XUXNZhnMjw1fdVbcrp86o41KYdOZuCA7rPrGh8OuZO1nUWgald
 LG+w==
X-Gm-Message-State: AJIora+prnAGpgTS7uJBttHbG4YWJ4x8qbqNjPAwjiAu0HLmbr4lYKeS
 0aeuib6U0dhN+g3VSJqnCsExzQ==
X-Google-Smtp-Source: AGRyM1uGkQimPoB8kL1Wht4vTq43JoT8EC6dik/7IAdBWeLMjfdAenHlbc0UpgOFY4oFjdeqquWEtw==
X-Received: by 2002:a17:90a:e507:b0:1ea:fa43:21de with SMTP id
 t7-20020a17090ae50700b001eafa4321demr9134913pjy.177.1655501457594; 
 Fri, 17 Jun 2022 14:30:57 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com.
 [35.230.65.123]) by smtp.gmail.com with ESMTPSA id
 f16-20020a633810000000b003fd9b8b865dsm4281929pga.0.2022.06.17.14.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 14:30:57 -0700 (PDT)
Date: Fri, 17 Jun 2022 21:30:53 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
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
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 6/8] KVM: Handle page fault for private memory
Message-ID: <YqzyjZnflCMPo8b/@google.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-7-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519153713.819591-7-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=seanjc@google.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 19, 2022, Chao Peng wrote:
> @@ -4028,8 +4081,11 @@ static bool is_page_fault_stale(struct kvm_vcpu *vcpu,
>  	if (!sp && kvm_test_request(KVM_REQ_MMU_FREE_OBSOLETE_ROOTS, vcpu))
>  		return true;
>  
> -	return fault->slot &&
> -	       mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, fault->hva);
> +	if (fault->is_private)
> +		return mmu_notifier_retry(vcpu->kvm, mmu_seq);

Hmm, this is somewhat undesirable, because faulting in private pfns will be blocked
by unrelated mmu_notifier updates.  The issue is mitigated to some degree by bumping
the sequence count if and only if overlap with a memslot is detected, e.g. mapping
changes that affects only userspace won't block the guest.

It probably won't be an issue, but at the same time it's easy to solve, and I don't
like piggybacking mmu_notifier_seq as private mappings shouldn't be subject to the
mmu_notifier.

That would also fix a theoretical bug in this patch where mmu_notifier_retry()
wouldn't be defined if CONFIG_MEMFILE_NOTIFIER=y && CONFIG_MMU_NOTIFIER=n.a

---
 arch/x86/kvm/mmu/mmu.c   | 11 ++++++-----
 include/linux/kvm_host.h | 16 +++++++++++-----
 virt/kvm/kvm_main.c      |  2 +-
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 0b455c16ec64..a4cbd29433e7 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4100,10 +4100,10 @@ static bool is_page_fault_stale(struct kvm_vcpu *vcpu,
 		return true;

 	if (fault->is_private)
-		return mmu_notifier_retry(vcpu->kvm, mmu_seq);
-	else
-		return fault->slot &&
-			mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, fault->hva);
+		return memfile_notifier_retry(vcpu->kvm, mmu_seq);
+
+	return fault->slot &&
+	       mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, fault->hva);
 }

 static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
@@ -4127,7 +4127,8 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	if (r)
 		return r;

-	mmu_seq = vcpu->kvm->mmu_notifier_seq;
+	mmu_seq = fault->is_private ? vcpu->kvm->memfile_notifier_seq :
+				      vcpu->kvm->mmu_notifier_seq;
 	smp_rmb();

 	r = kvm_faultin_pfn(vcpu, fault);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 92afa5bddbc5..31f704c83099 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -773,16 +773,15 @@ struct kvm {
 	struct hlist_head irq_ack_notifier_list;
 #endif

-#if (defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)) ||\
-	defined(CONFIG_MEMFILE_NOTIFIER)
+#if (defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER))
 	unsigned long mmu_notifier_seq;
-#endif
-
-#if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
 	struct mmu_notifier mmu_notifier;
 	long mmu_notifier_count;
 	unsigned long mmu_notifier_range_start;
 	unsigned long mmu_notifier_range_end;
+#endif
+#ifdef CONFIG_MEMFILE_NOTIFIER
+	unsigned long memfile_notifier_seq;
 #endif
 	struct list_head devices;
 	u64 manual_dirty_log_protect;
@@ -1964,6 +1963,13 @@ static inline int mmu_notifier_retry_hva(struct kvm *kvm,
 }
 #endif

+#ifdef CONFIG_MEMFILE_NOTIFIER
+static inline bool memfile_notifier_retry(struct kvm *kvm, unsigned long mmu_seq)
+{
+	return kvm->memfile_notifier_seq != mmu_seq;
+}
+#endif
+
 #ifdef CONFIG_HAVE_KVM_IRQ_ROUTING

 #define KVM_MAX_IRQ_ROUTES 4096 /* might need extension/rework in the future */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2b416d3bd60e..e6d34c964d51 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -898,7 +898,7 @@ static void kvm_private_mem_notifier_handler(struct memfile_notifier *notifier,
 	KVM_MMU_LOCK(kvm);
 	if (kvm_unmap_gfn_range(kvm, &gfn_range))
 		kvm_flush_remote_tlbs(kvm);
-	kvm->mmu_notifier_seq++;
+	kvm->memfile_notifier_seq++;
 	KVM_MMU_UNLOCK(kvm);
 	srcu_read_unlock(&kvm->srcu, idx);
 }

base-commit: 333ef501c7f6c6d4ef2b7678905cad0f8ef3e271
--

> +	else
> +		return fault->slot &&
> +			mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, fault->hva);
>  }
>  
>  static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> @@ -4088,7 +4144,12 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  		read_unlock(&vcpu->kvm->mmu_lock);
>  	else
>  		write_unlock(&vcpu->kvm->mmu_lock);
> -	kvm_release_pfn_clean(fault->pfn);
> +
> +	if (fault->is_private)
> +		kvm_private_mem_put_pfn(fault->slot, fault->pfn);

Why does the shmem path lock the page, and then unlock it here?

Same question for why this path marks it dirty?  The guest has the page mapped
so the dirty flag is immediately stale.

In other words, why does KVM need to do something different for private pfns?

> +	else
> +		kvm_release_pfn_clean(fault->pfn);
> +
>  	return r;
>  }
>  

...

> diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
> index 7f8f1c8dbed2..1d857919a947 100644
> --- a/arch/x86/kvm/mmu/paging_tmpl.h
> +++ b/arch/x86/kvm/mmu/paging_tmpl.h
> @@ -878,7 +878,10 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  
>  out_unlock:
>  	write_unlock(&vcpu->kvm->mmu_lock);
> -	kvm_release_pfn_clean(fault->pfn);
> +	if (fault->is_private)

Indirect MMUs can't support private faults, i.e. this is unnecessary.

> +		kvm_private_mem_put_pfn(fault->slot, fault->pfn);
> +	else
> +		kvm_release_pfn_clean(fault->pfn);
>  	return r;
>  }
>  
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3fd168972ecd..b0a7910505ed 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2241,4 +2241,26 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
>  /* Max number of entries allowed for each kvm dirty ring */
>  #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
>  
> +#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
> +static inline int kvm_private_mem_get_pfn(struct kvm_memory_slot *slot,
> +					  gfn_t gfn, kvm_pfn_t *pfn, int *order)
> +{
> +	int ret;
> +	pfn_t pfnt;
> +	pgoff_t index = gfn - slot->base_gfn +
> +			(slot->private_offset >> PAGE_SHIFT);
> +
> +	ret = slot->notifier.bs->get_lock_pfn(slot->private_file, index, &pfnt,
> +						order);
> +	*pfn = pfn_t_to_pfn(pfnt);
> +	return ret;
> +}
> +
> +static inline void kvm_private_mem_put_pfn(struct kvm_memory_slot *slot,
> +					   kvm_pfn_t pfn)
> +{
> +	slot->notifier.bs->put_unlock_pfn(pfn_to_pfn_t(pfn));
> +}
> +#endif /* CONFIG_HAVE_KVM_PRIVATE_MEM */
> +
>  #endif
> -- 
> 2.25.1
> 


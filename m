Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DA14EA3E5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 01:57:22 +0200 (CEST)
Received: from localhost ([::1]:49782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYzEf-00085A-4V
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 19:57:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYzDa-0007NT-Pl
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 19:56:14 -0400
Received: from [2607:f8b0:4864:20::634] (port=45764
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYzDZ-0001Fd-3x
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 19:56:14 -0400
Received: by mail-pl1-x634.google.com with SMTP id i11so4829546plg.12
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 16:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=R5oHCy312DV02dgL2mbxc6XsFyRp35/nzV9uAHuDVL8=;
 b=VdeMGDhBvYtE+tVfMkspuND3/7DIoOMPUCVTDtTlEioK4Zp5hqbOfTFDiZt5K44ayS
 fnvlBEdPsoSL7x/DbpE7cgK+SfpEKdBSB73Z0G459wlOPyvqyXpjszHn5jZxV954Y1m+
 kGEdjSVuItAQwgX97aOEemfU1wnkxTdxglSoMzxoatlN8MoeBrVjAW62nJb0oTxRhDev
 ZbdqY4WeMFHrp8BIIgBZ/dpZ8uGNofipq0r54d/7/2DNqRhUnOG6G0byQfKsrs8taS9d
 UJB9bfRxpxBlPxluUE6silYECHfQnTGdtWDbmLuSXWXNy9ykNzkceeJBNRFaESkJx2jL
 vn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R5oHCy312DV02dgL2mbxc6XsFyRp35/nzV9uAHuDVL8=;
 b=RcHOQHRcnNga+YEW1fu/YNfs3YXiMZYnW/cE3y3f0x7Ijw2tZUaeIUhrLCObBSwoSu
 RlAOL8PyCtPRANiTf93aJdFNGsJc9vfDHXZV8BswTYfpiMB+nIPNjxNCcqsAdMBq73E/
 +kdt5MHyUDMbXj1XuthbRPthLjG1i81Hi/6XHSOSaplEOaEedObxBkviKcta0mXOykf5
 sQSspxhT/fI1GUVpZsdA3wkajkM8nBkyssQedxF3LlVLMfS/RuCH9GrmLWWnHMF7Hw/2
 nOHcU3YyZzTGdoOOaQctocda0Wibf1JxPRYwtkqTlCHxmC8VDsc6VEa8jbNbKVgh3Vlw
 9kzA==
X-Gm-Message-State: AOAM532aKy+5O6PZojq3BU8g6lHUBu7O4Q0wSMyCIsUva+F2Ebe/31x5
 I44W/5DxbS+1h0DW9hpJM1Dl/Q==
X-Google-Smtp-Source: ABdhPJwWwKwcbx4mWnZcS0vNwCcr+CGjSoNFeM3hP68m739AGvq4ty6tV34XjWMljTYtL4iWZ09X6A==
X-Received: by 2002:a17:90a:889:b0:1c9:8baa:3eeb with SMTP id
 v9-20020a17090a088900b001c98baa3eebmr1612687pjc.44.1648511771099; 
 Mon, 28 Mar 2022 16:56:11 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 p128-20020a625b86000000b004fa666a1327sm16920043pfb.102.2022.03.28.16.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 16:56:10 -0700 (PDT)
Date: Mon, 28 Mar 2022 23:56:06 +0000
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
Subject: Re: [PATCH v5 08/13] KVM: Use memfile_pfn_ops to obtain pfn for
 private pages
Message-ID: <YkJLFu98hZOvTSrL@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-9-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310140911.50924-9-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=seanjc@google.com; helo=mail-pl1-x634.google.com
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
> @@ -2217,4 +2220,34 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
>  /* Max number of entries allowed for each kvm dirty ring */
>  #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
>  
> +#ifdef CONFIG_MEMFILE_NOTIFIER
> +static inline long kvm_memfile_get_pfn(struct kvm_memory_slot *slot, gfn_t gfn,
> +				       int *order)
> +{
> +	pgoff_t index = gfn - slot->base_gfn +
> +			(slot->private_offset >> PAGE_SHIFT);

This is broken for 32-bit kernels, where gfn_t is a 64-bit value but pgoff_t is a
32-bit value.  There's no reason to support this for 32-bit kernels, so...

The easiest fix, and likely most maintainable for other code too, would be to
add a dedicated CONFIG for private memory, and then have KVM check that for all
the memfile stuff.  x86 can then select it only for 64-bit kernels, and in turn
select MEMFILE_NOTIFIER iff private memory is supported.

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index ca7b2a6a452a..ee9c8c155300 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -48,7 +48,9 @@ config KVM
        select SRCU
        select INTERVAL_TREE
        select HAVE_KVM_PM_NOTIFIER if PM
-       select MEMFILE_NOTIFIER
+       select HAVE_KVM_PRIVATE_MEM if X86_64
+       select MEMFILE_NOTIFIER if HAVE_KVM_PRIVATE_MEM
+
        help
          Support hosting fully virtualized guest machines using hardware
          virtualization extensions.  You will need a fairly recent

And in addition to replacing checks on CONFIG_MEMFILE_NOTIFIER, the probing of
whether or not KVM_MEM_PRIVATE is allowed can be:

@@ -1499,23 +1499,19 @@ static void kvm_replace_memslot(struct kvm *kvm,
        }
 }

-bool __weak kvm_arch_private_memory_supported(struct kvm *kvm)
-{
-       return false;
-}
-
 static int check_memory_region_flags(struct kvm *kvm,
                                const struct kvm_userspace_memory_region *mem)
 {
        u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;

-       if (kvm_arch_private_memory_supported(kvm))
-               valid_flags |= KVM_MEM_PRIVATE;
-
 #ifdef __KVM_HAVE_READONLY_MEM
        valid_flags |= KVM_MEM_READONLY;
 #endif

+#ifdef CONFIG_KVM_HAVE_PRIVATE_MEM
+       valid_flags |= KVM_MEM_PRIVATE;
+#endif
+
        if (mem->flags & ~valid_flags)
                return -EINVAL;

> +
> +	return slot->pfn_ops->get_lock_pfn(file_inode(slot->private_file),
> +					   index, order);

In a similar vein, get_locK_pfn() shouldn't return a "long".  KVM likely won't use
these APIs on 32-bit kernels, but that may not hold true for other subsystems, and
this code is confusing and technically wrong.  The pfns for struct page squeeze
into an unsigned long because PAE support is capped at 64gb, but casting to a
signed long could result in a pfn with bit 31 set being misinterpreted as an error.

Even returning an "unsigned long" for the pfn is wrong.  It "works" for the shmem
code because shmem deals only with struct page, but it's technically wrong, especially
since one of the selling points of this approach is that it can work without struct
page.

OUT params suck, but I don't see a better option than having the return value be
0/-errno, with "pfn_t *pfn" for the resolved pfn.

> +}
> +
> +static inline void kvm_memfile_put_pfn(struct kvm_memory_slot *slot,
> +				       kvm_pfn_t pfn)
> +{
> +	slot->pfn_ops->put_unlock_pfn(pfn);
> +}
> +
> +#else
> +static inline long kvm_memfile_get_pfn(struct kvm_memory_slot *slot, gfn_t gfn,
> +				       int *order)
> +{

This should be a WARN_ON() as its usage should be guarded by a KVM_PRIVATE_MEM
check, and private memslots should be disallowed in this case.

Alternatively, it might be a good idea to #ifdef these out entirely and not provide
stubs.  That'd likely require a stub or two in arch code, but overall it might be
less painful in the long run, e.g. would force us to more carefully consider the
touch points for private memory.  Definitely not a requirement, just an idea.


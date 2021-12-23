Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B860F47E734
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 18:42:03 +0100 (CET)
Received: from localhost ([::1]:55820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0S6M-00012V-9X
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 12:42:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n0S0W-0003no-1Z
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:36:00 -0500
Received: from [2607:f8b0:4864:20::102e] (port=52204
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n0S0G-0000NI-I0
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:35:59 -0500
Received: by mail-pj1-x102e.google.com with SMTP id v16so5622139pjn.1
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 09:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yIw9Fjpgijj44IXOUKUCZEBlyaVdzzfrrZ8Lojvg1lY=;
 b=KchQe9EBbruIMjeYeJXQs0w3O4kx4AL6Hoo8jlZapI4ZOjlRLvTUKO57VG05cszkq/
 cxCx8ttS1wS+jESFzGiuNO8JRwklcfN6a0abl+aSLXx0ykUiCxgRj6UJb3XfwontSdT+
 Pal7HtLokeKseV78BPG+ZFrr1TzNamA/WdL3i2cCdSkQYrTK4lMRF81oZHgXWIm42LQ+
 AyZCyLTVbMX3OiICY5MitKDc2envJnLaX51xjFXqoiwUNMWIBKJlQ/5crWWzop9kAcgc
 e8RvOe5wFMZOhSy5s3N6DCPw0YeMa8o2m2iUEczeKV/8cBVE5bg1YbhZwv4BBhZiVzP6
 Y3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yIw9Fjpgijj44IXOUKUCZEBlyaVdzzfrrZ8Lojvg1lY=;
 b=V1kyGxhI8JQCIWX+Ot1/WVYcGgE5NhNTjSZx026WtqQFNwW5rSfgVl0ryqpexvmwAr
 JQdy37/MriERNcxvJMeVHKF0Msq9MwwJs97QKHfMHMw5AtQF2hBlSTp+bys9jvxO6Ie0
 PXBvvWGDVh3lVDoJA0HhKXSdARYxpWK8nVhN5SCdWuLZEIp15IPqheIbwBhSmFyhMArr
 sROXH9MUKcBoFEh5QcWaEJna2JjIygM3L2u9z8PFVl/z5dpTddkaDqBdWLBZw3oC8Lw/
 uOn250VjcUTv8dTyGeNLuT2Rsaq+QrtYPsk84rEqGYXN8rOuaA9i3b8bEXJIG7M/WD46
 aR9Q==
X-Gm-Message-State: AOAM532Cd8vetyMmt3t3QBTKGbmjyrIbOdiUU88WMnHddEtacCGFDeD6
 BofyLkFgMxlSIlzAS4EFncSZbw==
X-Google-Smtp-Source: ABdhPJwwfNHbtzXtFf76NGe6MOSECepzIn2qqq6XNXeecRXGPz/CfFnejBjUga6fpLtCWNPFFSHAWA==
X-Received: by 2002:a17:90a:d792:: with SMTP id
 z18mr3774755pju.182.1640280941694; 
 Thu, 23 Dec 2021 09:35:41 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id t3sm6683459pfj.207.2021.12.23.09.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 09:35:41 -0800 (PST)
Date: Thu, 23 Dec 2021 17:35:37 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, john.ji@intel.com, susie.li@intel.com,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com
Subject: Re: [PATCH v3 kvm/queue 04/16] KVM: Extend the memslot to support
 fd-based private memory
Message-ID: <YcSzafzpjMy6m28B@google.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-5-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223123011.41044-5-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -138
X-Spam_score: -13.9
X-Spam_bar: -------------
X-Spam_report: (-13.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=2.899, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01, USER_IN_DEF_DKIM_WL=-7.5,
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

On Thu, Dec 23, 2021, Chao Peng wrote:
> Extend the memslot definition to provide fd-based private memory support
> by adding two new fields(fd/ofs). The memslot then can maintain memory
> for both shared and private pages in a single memslot. Shared pages are
> provided in the existing way by using userspace_addr(hva) field and
> get_user_pages() while private pages are provided through the new
> fields(fd/ofs). Since there is no 'hva' concept anymore for private
> memory we cannot call get_user_pages() to get a pfn, instead we rely on
> the newly introduced MEMFD_OPS callbacks to do the same job.
> 
> This new extension is indicated by a new flag KVM_MEM_PRIVATE.
> 
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  include/linux/kvm_host.h | 10 ++++++++++
>  include/uapi/linux/kvm.h | 12 ++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index f8ed799e8674..2cd35560c44b 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -460,8 +460,18 @@ struct kvm_memory_slot {
>  	u32 flags;
>  	short id;
>  	u16 as_id;
> +	u32 fd;

There should be no need to store the fd in the memslot, the fd should be unneeded
outside of __kvm_set_memory_region(), e.g.

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1caebded52c4..4e43262887a3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2029,10 +2029,10 @@ int __kvm_set_memory_region(struct kvm *kvm,
        new->npages = npages;
        new->flags = mem->flags;
        new->userspace_addr = mem->userspace_addr;
-       new->fd = mem->fd;
-       new->file = NULL;
-       new->ofs = mem->ofs;
-
+       if (mem->flags & KVM_MEM_PRIVATE) {
+               new->private_file = fget(mem->private_fd);
+               new->private_offset = mem->private_offset;
+       }
        r = kvm_set_memslot(kvm, old, new, change);
        if (r)
                kfree(new);

> +	struct file *file;

Please use more descriptive names, shaving characters is not at all priority.

> +	u64 ofs;

I believe this should be loff_t.

	struct file *private_file;
	struct loff_t private_offset;

>  };
>  
> +static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
> +{
> +	if (slot && (slot->flags & KVM_MEM_PRIVATE))
> +		return true;
> +	return false;

	return slot && (slot->flags & KVM_MEM_PRIVATE);

> +}
> +
>  static inline bool kvm_slot_dirty_track_enabled(const struct kvm_memory_slot *slot)
>  {
>  	return slot->flags & KVM_MEM_LOG_DIRTY_PAGES;
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 1daa45268de2..41434322fa23 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -103,6 +103,17 @@ struct kvm_userspace_memory_region {
>  	__u64 userspace_addr; /* start of the userspace allocated memory */
>  };
>  
> +struct kvm_userspace_memory_region_ext {
> +	__u32 slot;
> +	__u32 flags;
> +	__u64 guest_phys_addr;
> +	__u64 memory_size; /* bytes */
> +	__u64 userspace_addr; /* hva */

Would it make sense to embed "struct kvm_userspace_memory_region"?

> +	__u64 ofs; /* offset into fd */
> +	__u32 fd;

Again, use descriptive names, then comments like "offset into fd" are unnecessary.

	__u64 private_offset;
	__u32 private_fd;

> +	__u32 padding[5];
> +};
> +
>  /*
>   * The bit 0 ~ bit 15 of kvm_memory_region::flags are visible for userspace,
>   * other bits are reserved for kvm internal use which are defined in
> @@ -110,6 +121,7 @@ struct kvm_userspace_memory_region {
>   */
>  #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
>  #define KVM_MEM_READONLY	(1UL << 1)
> +#define KVM_MEM_PRIVATE		(1UL << 2)
>  
>  /* for KVM_IRQ_LINE */
>  struct kvm_irq_level {
> -- 
> 2.17.1
> 


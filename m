Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C4847E7AB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 19:36:06 +0100 (CET)
Received: from localhost ([::1]:32784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Swf-0002jy-NA
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 13:36:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n0Sv7-0001xg-5a
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 13:34:29 -0500
Received: from [2607:f8b0:4864:20::633] (port=39657
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n0Sv5-0006yh-MB
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 13:34:28 -0500
Received: by mail-pl1-x633.google.com with SMTP id h6so1136420plf.6
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 10:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wgoegRi5bG9RfU6sMp0VEJxN3NnOXgdV/DTIFT/FP9s=;
 b=L+zXpuXCNgLWcMvoCH32XVHU3LmaAvryhek/ia9zaFUu0ZSn7rADevGixqyB2soisL
 lb8sy3eZ0Qb13+uIbTieaElB9/eNeY1LdDq+a6B1I4SCMgjk8KynVB6mC3VxCjS62dVR
 shouleL8Xc9cW4Wz78SXSVxVyqQLoN4F0NG+DvAR8pOfjTfWeQzVKxXB0o9Pq4oNeD2u
 D/l3mjhlcj2MVLlMZngH+SksfEZR9/1Wk/yngiydrBqbgLH3qAIjqS5gEc7eeKDfOTuB
 avLlOIlX+XDpMaVWp30QaJoxFQY/I8sNhRtyyMDPfKjd8Jl1YaMQ7pZgNNA9C4UmrgVB
 9akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wgoegRi5bG9RfU6sMp0VEJxN3NnOXgdV/DTIFT/FP9s=;
 b=nooPtG830S2FX6Cnryb21wdV8i5LoIZ+GNgwqwffKqy999yL8GNwU9u1xi9z3Q/wXq
 IRDVK8LXvS0DBl4fWAA58dNbrzOpA0qyMVxjHNnQunJan6k5DZnY3gxfu1t0Hi0nouXr
 3gbl0NtWv4+zwyqE8JPg3QweWAR7Mkgkawmjwh6R7qHNfo4uRW90yzW0zU7f5ZC6qD4L
 SqpiKIfvVNasU8bnMC3xemTeDCNegIw51GafRL8Jn5zbMQLTDdBBxjl4xYlWD11cjGTo
 ncSKIKuOPO1JeOUSGlMteGJRIDHNHeP9FKcZNNW5os9YexQ9FuSu0ldq8UEdGsBfmDpW
 xX7A==
X-Gm-Message-State: AOAM531dvBK97HA+TKb0mgolPLmcb6bTZI5zOwYniydJvteYF1wfwrSH
 b3hqp8VfqiOF6To9/WCFi2uBtg==
X-Google-Smtp-Source: ABdhPJymsNE7J9ptKr2BtgChAzAfQEzAGp2WzRVvToHDYcXxBbfV5GZE58CrgE/W67Py/7kxVbiHvg==
X-Received: by 2002:a17:90a:c58f:: with SMTP id
 l15mr3967558pjt.227.1640284466086; 
 Thu, 23 Dec 2021 10:34:26 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id k6sm6898801pff.17.2021.12.23.10.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 10:34:25 -0800 (PST)
Date: Thu, 23 Dec 2021 18:34:22 +0000
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
Subject: Re: [PATCH v3 kvm/queue 06/16] KVM: Implement fd-based memory using
 MEMFD_OPS interfaces
Message-ID: <YcTBLpVlETdI8JHi@google.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-7-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223123011.41044-7-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=seanjc@google.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -138
X-Spam_score: -13.9
X-Spam_bar: -------------
X-Spam_report: (-13.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=2.899, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
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
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 03b2ce34e7f4..86655cd660ca 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -46,6 +46,7 @@ config KVM
>  	select SRCU
>  	select INTERVAL_TREE
>  	select HAVE_KVM_PM_NOTIFIER if PM
> +	select MEMFD_OPS

MEMFD_OPS is a weird Kconfig name given that it's not just memfd() that can
implement the ops.

>  	help
>  	  Support hosting fully virtualized guest machines using hardware
>  	  virtualization extensions.  You will need a fairly recent
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3bd875f9669f..21f8b1880723 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -806,6 +806,12 @@ static inline void kvm_irqfd_exit(void)
>  {
>  }
>  #endif
> +
> +int kvm_memfd_register(struct kvm *kvm, struct kvm_memory_slot *slot);
> +void kvm_memfd_unregister(struct kvm_memory_slot *slot);
> +long kvm_memfd_get_pfn(struct kvm_memory_slot *slot, gfn_t gfn, int *order);
> +void kvm_memfd_put_pfn(kvm_pfn_t pfn);
> +
>  int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>  		  struct module *module);
>  void kvm_exit(void);
> diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
> index ffdcad3cc97a..8842128d8429 100644
> --- a/virt/kvm/Makefile.kvm
> +++ b/virt/kvm/Makefile.kvm
> @@ -5,7 +5,7 @@
>  
>  KVM ?= ../../../virt/kvm
>  
> -kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
> +kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o $(KVM)/memfd.o

This should be

   kvm-$(CONFIG_MEMFD_OPS) += $(KVM)/memfd.o

with stubs provided in a header file as needed.  I also really dislike naming KVM's
file memfd.c, though I don't have a good alternative off the top of my head.

>  kvm-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
>  kvm-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
>  kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o


> +#ifdef CONFIG_MEMFD_OPS
> +static const struct memfd_pfn_ops *memfd_ops;

memfd_ops needs to be associated with the slot, e.g. userspace should be able to
map multiple types of a backing stores into a single VM.  This doesn't even allow
that for multiple VMs, and there are all kinds of ordering issues.

> +void kvm_memfd_unregister(struct kvm_memory_slot *slot)
> +{
> +#ifdef CONFIG_MEMFD_OPS
> +	if (slot->file) {
> +		fput(slot->file);

Needs to actually unregister.

> +		slot->file = NULL;
> +	}
> +#endif
> +}
> -- 
> 2.17.1
> 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91EB4EA295
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 23:58:44 +0200 (CEST)
Received: from localhost ([::1]:46160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxNr-0000qB-Fr
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 17:58:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYxLs-0007tl-Nb
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:56:40 -0400
Received: from [2607:f8b0:4864:20::630] (port=41931
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYxLr-0001Ru-0n
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:56:40 -0400
Received: by mail-pl1-x630.google.com with SMTP id j13so15885762plj.8
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6f0ymM3PuwfqwB+Ks8BX5URDH2m1K5HGD6I5Zz3ti5Q=;
 b=NH33JvMBIiaBL7bqX1PZbItw0IUfTlXD/v9oqWvIintdpR2SKhlN4igL4tSF3ZcIDp
 sV7t/z5vUZKMAtkNNIq3fFQIP8pHmS/iH5/d3fDdTtMOUOLAAD1+ikzXU14mMAKEblor
 4qnKBqDpRZ8YwY9xRDH8/eoduqsp55EmqJBNPUueA0rhCUGOiGOlII+LABdG9Wk0Hc3R
 2awwTxAZNazlQDZKuyoiqCopjHbUAqm/HeKkYLztMk8p5n3ui448LMrVKA1TASyWX6yl
 sdiO5htV6zcmiQKdeSxAr5/4UbEU2TU1WB53fCfupefYoUkwxYsso2NclryjmPsTGZ3j
 ZU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6f0ymM3PuwfqwB+Ks8BX5URDH2m1K5HGD6I5Zz3ti5Q=;
 b=Ph/VDL0f6lYpyf3bsUPHNbyVEnQy5GVG+dEfB4B0Ccyf/VQCRtyuPthaLoH+2dQy5b
 hJJF9uKAfGuKy3Wd7rvkA1vB6NhSTUjz8UaAwkeakUYcjzSDV4UBgiUzAsN4B+0oYwna
 nLZo4QDleOz0sM61ukR33WTan0MJ0MSXWg/GBHYzlfwh15NXdsXhebkN/XdzkJAAWF+x
 LcxjbZiwZO6pVFyJJgfz9F5X5U7pVf/tVsEG/Dd0do891sgrZkV15CZnr+FFhivjYoP8
 hCwN7KxtZQC3oOM0c1Dfv8wMHjCtUF5v7Pb5aUwUcCiVOaiMCuP6p1M8B4hkzkQnTgRl
 c8TA==
X-Gm-Message-State: AOAM533Z3mB9/E3SWz85qy9uSY7CZ/haWgSAbM+8o6XOei6HcJLcavBM
 0Vqpex0brqQ1RVUQyDV9TcF3ug==
X-Google-Smtp-Source: ABdhPJxzsrphJ5SAHT6xGnE9Zsu1eetVvZtTotZHLXscXA64kqeWZA3FguQ77T0PrIoYl9MNauVa6A==
X-Received: by 2002:a17:90a:d3d1:b0:1bb:fdc5:182 with SMTP id
 d17-20020a17090ad3d100b001bbfdc50182mr1207841pjw.206.1648504597150; 
 Mon, 28 Mar 2022 14:56:37 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 3-20020a630003000000b003828fc1455esm13974792pga.60.2022.03.28.14.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:56:36 -0700 (PDT)
Date: Mon, 28 Mar 2022 21:56:33 +0000
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
Subject: Re: [PATCH v5 05/13] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <YkIvEeC3/lgKTLPt@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-6-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310140911.50924-6-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=seanjc@google.com; helo=mail-pl1-x630.google.com
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
> Extend the memslot definition to provide fd-based private memory support
> by adding two new fields (private_fd/private_offset). The memslot then
> can maintain memory for both shared pages and private pages in a single
> memslot. Shared pages are provided by existing userspace_addr(hva) field
> and private pages are provided through the new private_fd/private_offset
> fields.
> 
> Since there is no 'hva' concept anymore for private memory so we cannot
> rely on get_user_pages() to get a pfn, instead we use the newly added
> memfile_notifier to complete the same job.
> 
> This new extension is indicated by a new flag KVM_MEM_PRIVATE.
> 
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  Documentation/virt/kvm/api.rst | 37 +++++++++++++++++++++++++++-------
>  include/linux/kvm_host.h       |  7 +++++++
>  include/uapi/linux/kvm.h       |  8 ++++++++
>  3 files changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 3acbf4d263a5..f76ac598606c 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -1307,7 +1307,7 @@ yet and must be cleared on entry.
>  :Capability: KVM_CAP_USER_MEMORY
>  :Architectures: all
>  :Type: vm ioctl
> -:Parameters: struct kvm_userspace_memory_region (in)
> +:Parameters: struct kvm_userspace_memory_region(_ext) (in)
>  :Returns: 0 on success, -1 on error
>  
>  ::
> @@ -1320,9 +1320,17 @@ yet and must be cleared on entry.
>  	__u64 userspace_addr; /* start of the userspace allocated memory */
>    };
>  
> +  struct kvm_userspace_memory_region_ext {
> +	struct kvm_userspace_memory_region region;

Peeking ahead, the partial switch to the _ext variant is rather gross.  I would
prefer that KVM use an entirely different, but binary compatible, struct internally.
And once the kernel supports C11[*], I'm pretty sure we can make the "region" in
_ext an anonymous struct, and make KVM's internal struct a #define of _ext.  That
should minimize the churn (no need to get the embedded "region" field), reduce
line lengths, and avoid confusion due to some flows taking the _ext but others
dealing with only the "base" struct.

Maybe kvm_user_memory_region or kvm_user_mem_region?  Though it's tempting to be
evil and usurp the old kvm_memory_region :-)

E.g. pre-C11 do

struct kvm_userspace_memory_region_ext {
	struct kvm_userspace_memory_region region;
	__u64 private_offset;
	__u32 private_fd;
	__u32 padding[5];
};

#ifdef __KERNEL__
struct kvm_user_mem_region {
	__u32 slot;
	__u32 flags;
	__u64 guest_phys_addr;
	__u64 memory_size; /* bytes */
	__u64 userspace_addr; /* start of the userspace allocated memory */
	__u64 private_offset;
	__u32 private_fd;
	__u32 padding[5];
};
#endif

and then post-C11 do

struct kvm_userspace_memory_region_ext {
#ifdef __KERNEL__
	struct kvm_userspace_memory_region region;
#else
	struct kvm_userspace_memory_region;
#endif
	__u64 private_offset;
	__u32 private_fd;
	__u32 padding[5];
};

#ifdef __KERNEL__
#define kvm_user_mem_region kvm_userspace_memory_region_ext
#endif

[*] https://lore.kernel.org/all/20220301145233.3689119-1-arnd@kernel.org

> +	__u64 private_offset;
> +	__u32 private_fd;
> +	__u32 padding[5];
> +};


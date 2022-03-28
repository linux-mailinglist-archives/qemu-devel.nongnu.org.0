Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3965A4EA26D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 23:28:41 +0200 (CEST)
Received: from localhost ([::1]:37890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwum-00029A-BY
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 17:28:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYwto-0001O6-Jl
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:27:40 -0400
Received: from [2607:f8b0:4864:20::1035] (port=38564
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYwtm-0005u2-TK
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:27:40 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 gp15-20020a17090adf0f00b001c7cd11b0b3so421788pjb.3
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WVVxBxlyVCxS7vEDq6k+BkZvn5usLnrTMDhIOyfoQRA=;
 b=F3l3l0SrNcazav4z9RryKfjHbpu2VZCStqEvabNnrpQsKduUOQ3GJ4YLD/Bnt3UC53
 9gigw6DRFNxzp6Tn0uRX1OSxCzSfPN1szWmGrwz4vNHvV9VLYO4WmYDXdPaWdH8TblyA
 El5pN/YNKIMy+iw6lu+xed7E4QwRzAZ0FR3pSWjUWLUUPJwMVJMtE8E6wGN4E5LNs8u0
 yM55QJ2oVDQAWknXjyDPGA1Gh8t7X0l+yW2q0hEFkIUxZQxSu7VSEXhtFwFrkoLq0Y0h
 pW8wbdUJiuzKmB2oEiRn9NUOZIq9e6JfKX2gwfUvAStK/w8sCzYOPevQeMdOmxmqtm3Z
 UnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WVVxBxlyVCxS7vEDq6k+BkZvn5usLnrTMDhIOyfoQRA=;
 b=2LBunZN6IiPXK3FFAbh64KlJ0pKkHi8acigjFWecTPClwegx2bIuID2fkQhq25rkz0
 IZy/kSyd64ziQ5hJAUw1lqH/pnhXApKmKJJ2Eaue2HaqOnaqJ7D9i5edK+8s52tmZL+d
 At/Vylx36MhRFzviUDeyBawBq1AMbCBjhi8wwauOd3UHuql8W1nKsk0IqivFuQcR+W4p
 jZsVkaXmXS5wo0g3elcOKCdnGhAkjfLHsSmk2VBu+um0WAxdER0rIP2w0aC0hsnqWoVo
 ffQCixD8X83FQ5KgMMpuRudK/STh5p+yvCZBxaqebeP0UT/f/TBh3d61W816BZrk/phe
 sO7w==
X-Gm-Message-State: AOAM5326ZWCh8EdUZidKlXQRrOw4AB5L46qHsLFfOivmZk5Tk7v/bG7G
 LDFqbUKfKv8Jpsw92mSpf4tKoQ==
X-Google-Smtp-Source: ABdhPJwWeZMb9Wt1LCrjPclYKOZxIau/iyRcg9FuFBqfs0Ro5aFT1BqcZ/SiNPFqKlNMwaMh8+jAOw==
X-Received: by 2002:a17:903:2288:b0:153:bfbe:7354 with SMTP id
 b8-20020a170903228800b00153bfbe7354mr27601061plh.112.1648502856956; 
 Mon, 28 Mar 2022 14:27:36 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 22-20020a17090a019600b001c6457e1760sm410018pjc.21.2022.03.28.14.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:27:36 -0700 (PDT)
Date: Mon, 28 Mar 2022 21:27:32 +0000
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
Message-ID: <YkIoRDNbwJH/IDeC@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-6-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310140911.50924-6-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1035.google.com
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

Needs a Co-developed-by: for Yu, or a From: if Yu is the sole author.

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
> +	__u64 private_offset;
> +	__u32 private_fd;
> +	__u32 padding[5];

Uber nit, I'd prefer we pad u32 for private_fd separate from padding the size of
the structure for future expansion.

Regarding future expansion, any reason not to go crazy and pad like 128+ bytes?
It'd be rather embarassing if the next memslot extension needs 3 u64s and we end
up with region_ext2 :-)

> +};
> +
>    /* for kvm_memory_region::flags */
>    #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
>    #define KVM_MEM_READONLY	(1UL << 1)
> +  #define KVM_MEM_PRIVATE		(1UL << 2)
>  
>  This ioctl allows the user to create, modify or delete a guest physical
>  memory slot.  Bits 0-15 of "slot" specify the slot id and this value

...

> +static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)

I 100% think we should usurp the name "private" for these memslots, but as prep
work this series should first rename KVM_PRIVATE_MEM_SLOTS to avoid confusion.
Maybe KVM_INTERNAL_MEM_SLOTS?


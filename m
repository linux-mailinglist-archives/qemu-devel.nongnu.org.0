Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0F64EA307
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:36:08 +0200 (CEST)
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxy3-0005i3-8D
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:36:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYxvk-0004oc-Iu
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:33:44 -0400
Received: from [2607:f8b0:4864:20::529] (port=46888
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYxvi-0006oK-Qh
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:33:44 -0400
Received: by mail-pg1-x529.google.com with SMTP id b130so11845136pga.13
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2ABviws9BXbfxTsMHoYmEcQBLN3yu8stMpTqnw9eDk8=;
 b=rYUjTKzGOFHx6d15Tswooja+d30xBTDDUHatG0/ZcYrDXuH0PfkjhUH1PWeOTfidl+
 vYJIWPT6oxLsddoyOabTrOO1tVAq7mc/vYWGRF/xHT6Zkm9YinxTH/0vsmRSLsdzVkKr
 6pd96qJfscL7yKbX4y+A5Mu5s1jsgn8U+dy5S4ZqCvCfco0t//embRohXdJdoJUpkoR/
 +rAdfVLcRZcp7qqE5ZtyTqie24GhbftV5PTRJAHm1SFW93aYXxALqSwG5/AMgSwMco3+
 dtnGSwv8eE42JLUTvRoXFyxnboBZbMprh1RRTGVK+iAeHGKfsjUevmvmc+QSSrVtaClB
 o0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2ABviws9BXbfxTsMHoYmEcQBLN3yu8stMpTqnw9eDk8=;
 b=bgp61wWTOq6Mp9Hp8LH8/9n8ltQ3d6RKifdjdquHeYi1hkHPVxmZuf5GspC+ZNMQXF
 y7CNLhRFWOLIUbc/l09qZUKuTy8r+yiaKS4HNsn4yxOvUOvrTrmk81oF8h9oXHh1Blpw
 NcxJ0bEa6PXBW8RRkUo3yZaRTM16z59gYICd3oCyXs4UCpnx9SLSr8/GZn/BN8o5+DSH
 0ddqEgwBXUtMHFHQivYn24wc5SsPU2Da7x2KGlADkhw5rSzsdKjZQp8zgA2bXtd5S9Pz
 WVFfGuEgIHGpQsRj0lkm/saztLXdLE1jrGuRWa4Fr78JFh2WE5tV/jOq7IpkjLZ3g4+z
 mgZw==
X-Gm-Message-State: AOAM531JIhCtGHV8PS/0L5N0J2drCPwWdHHRQ334oOoiKBgPdG+zkwx9
 LlBPM7nWIx1i3hagHorstBje4Q==
X-Google-Smtp-Source: ABdhPJwxvlht5QIP7qnxQ/NrpyslimX+9K7yNm7qbqA6RcGg490QKIvotfYQ+yrSTDNk0Bag7lNL6A==
X-Received: by 2002:a05:6a00:21c8:b0:4c4:4bd:dc17 with SMTP id
 t8-20020a056a0021c800b004c404bddc17mr24814255pfj.57.1648506821242; 
 Mon, 28 Mar 2022 15:33:41 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 22-20020a17090a019600b001c6457e1760sm479337pjc.21.2022.03.28.15.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 15:33:40 -0700 (PDT)
Date: Mon, 28 Mar 2022 22:33:37 +0000
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
Subject: Re: [PATCH v5 07/13] KVM: Add KVM_EXIT_MEMORY_ERROR exit
Message-ID: <YkI3wa3rmWTOrpmw@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-8-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310140911.50924-8-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=seanjc@google.com; helo=mail-pg1-x529.google.com
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
> This new KVM exit allows userspace to handle memory-related errors. It
> indicates an error happens in KVM at guest memory range [gpa, gpa+size).
> The flags includes additional information for userspace to handle the
> error. Currently bit 0 is defined as 'private memory' where '1'
> indicates error happens due to private memory access and '0' indicates
> error happens due to shared memory access.
> 
> After private memory is enabled, this new exit will be used for KVM to
> exit to userspace for shared memory <-> private memory conversion in
> memory encryption usage.
> 
> In such usage, typically there are two kind of memory conversions:
>   - explicit conversion: happens when guest explicitly calls into KVM to
>     map a range (as private or shared), KVM then exits to userspace to
>     do the map/unmap operations.
>   - implicit conversion: happens in KVM page fault handler.
>     * if the fault is due to a private memory access then causes a
>       userspace exit for a shared->private conversion request when the
>       page has not been allocated in the private memory backend.
>     * If the fault is due to a shared memory access then causes a
>       userspace exit for a private->shared conversion request when the
>       page has already been allocated in the private memory backend.
> 
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  Documentation/virt/kvm/api.rst | 22 ++++++++++++++++++++++
>  include/uapi/linux/kvm.h       |  9 +++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index f76ac598606c..bad550c2212b 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6216,6 +6216,28 @@ array field represents return values. The userspace should update the return
>  values of SBI call before resuming the VCPU. For more details on RISC-V SBI
>  spec refer, https://github.com/riscv/riscv-sbi-doc.
>  
> +::
> +
> +		/* KVM_EXIT_MEMORY_ERROR */
> +		struct {
> +  #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1 << 0)
> +			__u32 flags;
> +			__u32 padding;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory;
> +If exit reason is KVM_EXIT_MEMORY_ERROR then it indicates that the VCPU has

Doh, I'm pretty sure I suggested KVM_EXIT_MEMORY_ERROR.  Any objection to using
KVM_EXIT_MEMORY_FAULT instead of KVM_EXIT_MEMORY_ERROR?  "ERROR" makes me think
of ECC errors, i.e. uncorrected #MC in x86 land, not more generic "faults".  That
would align nicely with -EFAULT.

> +encountered a memory error which is not handled by KVM kernel module and
> +userspace may choose to handle it. The 'flags' field indicates the memory
> +properties of the exit.


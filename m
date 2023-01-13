Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB6D66A59A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 23:02:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGS7y-0005yH-4h; Fri, 13 Jan 2023 17:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pGS7v-0005tq-O3
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:02:19 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pGS7t-0002vh-OL
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:02:19 -0500
Received: by mail-pl1-x634.google.com with SMTP id v23so19870951plo.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 14:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z7l9vd6TJMxdcmrmIlHi+1aamG6yNr9jBZqHMxmbVBg=;
 b=BR3tUqUT1wdTPEhuyI88J1yG4yZUf5PuICve+KLW/6jG7Wb1v6McPHOp0JH41FPvHo
 cA2xNTdp4kP3XHFHgUTLdE2qj40XKo3fIu/xNDgFentclcLH8D4+aqHtGytwQRH7EFT0
 SvW3dkQzsILPvPKa4Is4mjjYyZmLU2ZjXaSMTILUI2Ql4PmYTWFYg91PuBLsgKKGoru5
 2kNrKIxXaIvBTzLY81Ye3wChF7mPYngBYjfHrPWew9lZluOUDNoM3QdVM4dxlS9vgJCj
 1PCCo9ULYh3HxSCxalWt2dPVhw7cT4s2LG6uTB7ArEkfMypRVuMINSetLuB5egod0Oa5
 0CYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z7l9vd6TJMxdcmrmIlHi+1aamG6yNr9jBZqHMxmbVBg=;
 b=avvZBShC+MwEx32Th6D9vSBekX5p/8EONtbwqB+Tlba8JphDB8FHC3Ut5LFkxkFap0
 zh6ix3gVZsFASmbUl2Kh98ZleWEAlesgxJrTZ4mpSCM83la8h/u8i61Y/gHu3fsEtf1m
 H6+35+CWxhEj43wJLPuYn1Kh+ADvD61riakk3XX/wKqM9w8LddxZSUcnrmZBuKm7gAvH
 a2fOv9qmYYrmU0c+I0R+y9isKyHPYqmqL6dfUiwORmlWPJGMw4L/VjGxQK7wg4bWzhSy
 4m1uIw+uAV/k2ZClCQtxSQWwuEbaiWA14L/jFo7aqPb28GmDvI4yMLQDPlthahGYeSmL
 o8nQ==
X-Gm-Message-State: AFqh2kr5r1yrsDgbecZFnk+ZT0lPAeWLXcfQQDDuPPXWEPT9fOqayzvU
 5DIc1GY/zW2SdvSHq+IoqI6XUA==
X-Google-Smtp-Source: AMrXdXttju4or509XUsZuP2ElabXRLq+UGu6WNhuAKj6QmwsUs3kftnSPzMWDd6fhBAAvxes/xEs1A==
X-Received: by 2002:a05:6a20:47de:b0:b3:66b7:24ff with SMTP id
 ey30-20020a056a2047de00b000b366b724ffmr1359880pzb.1.1673647335304; 
 Fri, 13 Jan 2023 14:02:15 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 k36-20020a635a64000000b0048988ed9e4bsm11687157pgm.19.2023.01.13.14.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 14:02:14 -0800 (PST)
Date: Fri, 13 Jan 2023 22:02:11 +0000
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
Subject: Re: [PATCH v10 2/9] KVM: Introduce per-page memory attributes
Message-ID: <Y8HU45aISOPwX76D@google.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-3-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202061347.1070246-3-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=seanjc@google.com; helo=mail-pl1-x634.google.com
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
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index fbeaa9ddef59..a8e379a3afee 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -49,6 +49,7 @@ config KVM
>  	select SRCU
>  	select INTERVAL_TREE
>  	select HAVE_KVM_PM_NOTIFIER if PM
> +	select HAVE_KVM_MEMORY_ATTRIBUTES

I would prefer to call this KVM_GENERIC_MEMORY_ATTRIBUTES.  Similar to
KVM_GENERIC_HARDWARE_ENABLING, ARM does need/have hardware enabling, it just
doesn't want KVM's generic implementation.  In this case, pKVM does support memory
attributes, but uses stage-2 tables to track ownership and doesn't need/want the
overhead of the generic implementation.

>  	help

...

> +#define KVM_MEMORY_ATTRIBUTE_READ              (1ULL << 0)
> +#define KVM_MEMORY_ATTRIBUTE_WRITE             (1ULL << 1)
> +#define KVM_MEMORY_ATTRIBUTE_EXECUTE           (1ULL << 2)
> +#define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)

I think we should carve out bits 0-2 for RWX, but I don't think we should actually
define them until they're actually accepted by KVM.

> +static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> +					   struct kvm_memory_attributes *attrs)
> +{
> +	gfn_t start, end;
> +	unsigned long i;
> +	void *entry;
> +	u64 supported_attrs = kvm_supported_mem_attributes(kvm);
> +
> +	/* flags is currently not used. */
> +	if (attrs->flags)
> +		return -EINVAL;
> +	if (attrs->attributes & ~supported_attrs)

Nit, no need for "supported_attrs", just consume kvm_supported_mem_attributes()
directly.

> +		return -EINVAL;
> +	if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
> +		return -EINVAL;
> +	if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
> +		return -EINVAL;
> +
> +	start = attrs->address >> PAGE_SHIFT;
> +	end = (attrs->address + attrs->size - 1 + PAGE_SIZE) >> PAGE_SHIFT;
> +
> +	entry = attrs->attributes ? xa_mk_value(attrs->attributes) : NULL;
> +
> +	mutex_lock(&kvm->lock);

Peeking forward multiple patches, this needs to take kvm->slots_lock, not kvm->lock.
There's a bug in the lpage_disallowed patch that I believe can most easily be
solved by making this mutually exclusive with memslot changes.

When a memslot is created, KVM needs to walk through the attributes to detect
whether or not the attributes are identical for the entire slot.  To avoid races,
that means taking slots_lock.

The alternative would be to query the attributes when adjusting the hugepage level
and avoid lpage_disallowed entirely, but in the (very brief) time I've thought
about this I haven't come up with a way to do that in a performant manner.

> +	for (i = start; i < end; i++)

Curly braces needed on the for-loop.


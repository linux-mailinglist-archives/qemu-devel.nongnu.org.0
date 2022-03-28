Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F7E4EA2E1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:28:12 +0200 (CEST)
Received: from localhost ([::1]:36430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxqM-0006X6-Oh
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:28:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYxpH-0005d9-B2
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:27:03 -0400
Received: from [2607:f8b0:4864:20::435] (port=46825
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYxpF-00060X-OT
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:27:03 -0400
Received: by mail-pf1-x435.google.com with SMTP id s11so14115551pfu.13
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EaW6LnFnD0yHSZLOEoOdmGP4SdnTb3yLLH8IPqs77KY=;
 b=Xyvle5xj+iytheGd+opSaVUcJMrxydFolbbLLB0cfjcq5NLgRpKcyY8LmvKaLgqjGf
 4Wz+LYcSQ0FaI+N5y+VY4SzfRHCjtAZByjFVMXJ2KOnIAwrohQC+hThWqUCVqG+4NbES
 3SNF28Gr4dRvSXnzRTTpxIDvLztpdn1WZNrxh8Q8n7iGr0rCaj4r9+fp3XG393ZBWs6k
 SHSEkJqmZ3YIGgDpQAEgtvU4ck1H0tPnbq3AaPzkvTPpDKGc7uoyX0A9YsGMVeSengHe
 iGHaJiaF81xnBQn+5IhcSf8NxcBCjbS8eFYH7svcMpAomWcPYrKr0MsWl6ZnU5x0GLV1
 TUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EaW6LnFnD0yHSZLOEoOdmGP4SdnTb3yLLH8IPqs77KY=;
 b=PEgCmEPV2uA09ZexhACvDpQuiNwtIlX1zrXIyPMaNl0AX+HWLrUQeaegN9sR2BYYTR
 iJDb9JAxV1Uu15YI/GN+L3t4e+4tFNuu+r7hTaheI7QlEtH236uGrElWiio7lsRrSYix
 V7AnL+HCED9eEDmDlEUgwdbPKm3MBpdOGhGwTZkFpOGR3LZC/INFPBWCNkCiSN2O+mbQ
 hjztRhEX95uZgRm2oAt7cLID+C9CDbF5JAyQkVve2AwEbl4TDfAGjdqWGEr9/7KW/2DX
 Ekxbhq/4vJft3oA3bdEi35kXSstBbj+65XIynU9ldgm5yt2G5x+D2oWgPMj7i7xdQRbX
 TSkw==
X-Gm-Message-State: AOAM531ss1hmPHwlLTFB4TBHPzG8+Bhp5rz42V+4/NTiAChtHg8nDdzl
 yxrfdKDwV0Lqlkbr96N/YFyoMw==
X-Google-Smtp-Source: ABdhPJyCCih0kMQlx0T3Lnxi+OwtGBTbKYzIPbgZGi6J5hxjxW3HSWsT0UQDj72qn+FBmxrSiRdwKg==
X-Received: by 2002:a62:e215:0:b0:4fa:87f1:dc16 with SMTP id
 a21-20020a62e215000000b004fa87f1dc16mr25067148pfi.19.1648506420043; 
 Mon, 28 Mar 2022 15:27:00 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056a001ad000b004fb358ffe86sm8955991pfv.137.2022.03.28.15.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 15:26:59 -0700 (PDT)
Date: Mon, 28 Mar 2022 22:26:55 +0000
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
Subject: Re: [PATCH v5 06/13] KVM: Use kvm_userspace_memory_region_ext
Message-ID: <YkI2Lyv9SJaGPDz+@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-7-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310140911.50924-7-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=seanjc@google.com; helo=mail-pf1-x435.google.com
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
> @@ -4476,14 +4477,23 @@ static long kvm_vm_ioctl(struct file *filp,
>  		break;
>  	}
>  	case KVM_SET_USER_MEMORY_REGION: {
> -		struct kvm_userspace_memory_region kvm_userspace_mem;
> +		struct kvm_userspace_memory_region_ext region_ext;

It's probably a good idea to zero initialize the full region to avoid consuming
garbage stack data if there's a bug and an _ext field is accessed without first
checking KVM_MEM_PRIVATE.  I'm usually opposed to unnecessary initialization, but
this seems like something we could screw up quite easily.

>  		r = -EFAULT;
> -		if (copy_from_user(&kvm_userspace_mem, argp,
> -						sizeof(kvm_userspace_mem)))
> +		if (copy_from_user(&region_ext, argp,
> +				sizeof(struct kvm_userspace_memory_region)))
>  			goto out;
> +		if (region_ext.region.flags & KVM_MEM_PRIVATE) {
> +			int offset = offsetof(
> +				struct kvm_userspace_memory_region_ext,
> +				private_offset);
> +			if (copy_from_user(&region_ext.private_offset,
> +					   argp + offset,
> +					   sizeof(region_ext) - offset))

In this patch, KVM_MEM_PRIVATE should result in an -EINVAL as it's not yet
supported.  Copying the _ext on KVM_MEM_PRIVATE belongs in the "Expose KVM_MEM_PRIVATE"
patch.

Mechnically, what about first reading flags via get_user(), and then doing a single
copy_from_user()?  It's technically more work in the common case, and requires an
extra check to guard against TOCTOU attacks, but this isn't a fast path by any means
and IMO the end result makes it easier to understand the relationship between
KVM_MEM_PRIVATE and the two different structs.

E.g.

	case KVM_SET_USER_MEMORY_REGION: {
		struct kvm_user_mem_region region;
		unsigned long size;
		u32 flags;

		memset(&region, 0, sizeof(region));

		r = -EFAULT;
		if (get_user(flags, (u32 __user *)(argp + offsetof(typeof(region), flags))))
			goto out;

		if (flags & KVM_MEM_PRIVATE)
			size = sizeof(struct kvm_userspace_memory_region_ext);
		else
			size = sizeof(struct kvm_userspace_memory_region);
		if (copy_from_user(&region, argp, size))
			goto out;

		r = -EINVAL;
		if ((flags ^ region.flags) & KVM_MEM_PRIVATE)
			goto out;

		r = kvm_vm_ioctl_set_memory_region(kvm, &region);
		break;
	}

> +				goto out;
> +		}
>  
> -		r = kvm_vm_ioctl_set_memory_region(kvm, &kvm_userspace_mem);
> +		r = kvm_vm_ioctl_set_memory_region(kvm, &region_ext);
>  		break;
>  	}
>  	case KVM_GET_DIRTY_LOG: {
> -- 
> 2.17.1
> 


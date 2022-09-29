Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3865F00F4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 00:48:41 +0200 (CEST)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe2Ke-00063p-HO
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 18:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1oe2HU-0003E9-4B
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:45:24 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1oe2HS-0003Vt-8D
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:45:23 -0400
Received: by mail-pg1-x535.google.com with SMTP id q9so2661333pgq.8
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 15:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=ByScpYkyRiCU42lbuVk6qEFlopY8wZGmivn5KTd4TkE=;
 b=lCAg7J5XBsmL67S4ZX++/AHEh9LqfKfUqfXAwLH9JogkhvyRO83RZ1Du9C4di0rODz
 kLZh/NE3uWWM/16Hp3uljQIoX0MFNKNuV3C68eln7snytpYC2ZwiQ/V0cLeGd1eHLwBC
 xZUPST6xsPprIa2dWHCykDOU91y140Q5KWomGApBmM0iNB3o1LdjW/DQ7VqhYIf1E8u2
 h43ebHa7BCSKFwUduXxQhPuT5TwVny9wTPKsyTwC1K3cE1PDMdpfFs5LAi7yM1CLwhBA
 SRQHTIlNp9clZhJVcQu1Dmhn2ngA/E21LXi/BXNoOBp9H7PEa/hZUshHWpvqrAmmDNji
 +OWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=ByScpYkyRiCU42lbuVk6qEFlopY8wZGmivn5KTd4TkE=;
 b=wt/FaXXfOf/oQNDNax3RsOFtS0oIQIS+lhfHS+nin2DcJtAFuRVhxfnnmvi41Ldl3P
 MYOztvMKcKzsdZ4ftnk5r3Cqrxl9aLeTolGI1jVEWhu3EStIWCBj3pxV0ISPyrWM4IH9
 hdynNindv0h4Nf7QZWPpYPQc5mhPse9hdJMZGoxPaU7degqaHb4yEDwJYcbGbC0RlUa7
 +EWWrYogTXTJJslpmR/7zdYbHnAsW/NS4Z0Grrytk68/I+VhVYKDhR3xR7Se9k6JJTXh
 VQYPB+u5wA6TUudopgEwYyqHg5JCIZ3HKy8Fory6yKsk/PEEPJxpYGlUu1317qdmoiLJ
 xppg==
X-Gm-Message-State: ACrzQf1/6k8MXcsDxExogGiEo1xH5vMtOOIcil8f0sWSDfMYZZ3QEKTv
 oE5PHuASoKScBONmlO8+QSo=
X-Google-Smtp-Source: AMsMyM6MQvFe701ujja7rvZea79ByiauTnUf8YlkU9ZkqGQBYquDrfuLbNd+uGgJ3lljB5PQecL3LA==
X-Received: by 2002:a63:4d4:0:b0:438:ce28:757f with SMTP id
 203-20020a6304d4000000b00438ce28757fmr4873802pge.441.1664491520310; 
 Thu, 29 Sep 2022 15:45:20 -0700 (PDT)
Received: from localhost ([192.55.54.55]) by smtp.gmail.com with ESMTPSA id
 u11-20020a170903124b00b001754cfb5e21sm415508plh.96.2022.09.29.15.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 15:45:18 -0700 (PDT)
Date: Thu, 29 Sep 2022 15:45:16 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
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
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com,
 isaku.yamahata@gmail.com
Subject: Re: [PATCH v8 2/8] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20220929224516.GA2260388@ls.amr.corp.intel.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-3-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915142913.2213336-3-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 15, 2022 at 10:29:07PM +0800,
Chao Peng <chao.p.peng@linux.intel.com> wrote:
...
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 584a5bab3af3..12dc0dc57b06 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
...
> @@ -4622,6 +4622,33 @@ static int kvm_vm_ioctl_get_stats_fd(struct kvm *kvm)
>  	return fd;
>  }
>  
> +#define SANITY_CHECK_MEM_REGION_FIELD(field)					\
> +do {										\
> +	BUILD_BUG_ON(offsetof(struct kvm_user_mem_region, field) !=		\
> +		     offsetof(struct kvm_userspace_memory_region, field));	\
> +	BUILD_BUG_ON(sizeof_field(struct kvm_user_mem_region, field) !=		\
> +		     sizeof_field(struct kvm_userspace_memory_region, field));	\
> +} while (0)
> +
> +#define SANITY_CHECK_MEM_REGION_EXT_FIELD(field)					\
> +do {											\
> +	BUILD_BUG_ON(offsetof(struct kvm_user_mem_region, field) !=			\
> +		     offsetof(struct kvm_userspace_memory_region_ext, field));		\
> +	BUILD_BUG_ON(sizeof_field(struct kvm_user_mem_region, field) !=			\
> +		     sizeof_field(struct kvm_userspace_memory_region_ext, field));	\
> +} while (0)
> +
> +static void kvm_sanity_check_user_mem_region_alias(void)
> +{
> +	SANITY_CHECK_MEM_REGION_FIELD(slot);
> +	SANITY_CHECK_MEM_REGION_FIELD(flags);
> +	SANITY_CHECK_MEM_REGION_FIELD(guest_phys_addr);
> +	SANITY_CHECK_MEM_REGION_FIELD(memory_size);
> +	SANITY_CHECK_MEM_REGION_FIELD(userspace_addr);
> +	SANITY_CHECK_MEM_REGION_EXT_FIELD(private_offset);
> +	SANITY_CHECK_MEM_REGION_EXT_FIELD(private_fd);
> +}
> +
>  static long kvm_vm_ioctl(struct file *filp,
>  			   unsigned int ioctl, unsigned long arg)
>  {
> @@ -4645,14 +4672,20 @@ static long kvm_vm_ioctl(struct file *filp,
>  		break;
>  	}
>  	case KVM_SET_USER_MEMORY_REGION: {
> -		struct kvm_userspace_memory_region kvm_userspace_mem;
> +		struct kvm_user_mem_region mem;
> +		unsigned long size = sizeof(struct kvm_userspace_memory_region);
> +
> +		kvm_sanity_check_user_mem_region_alias();
>  
>  		r = -EFAULT;
> -		if (copy_from_user(&kvm_userspace_mem, argp,
> -						sizeof(kvm_userspace_mem)))
> +		if (copy_from_user(&mem, argp, size);
> +			goto out;
> +
> +		r = -EINVAL;
> +		if (mem.flags & KVM_MEM_PRIVATE)
>  			goto out;

Nit:  It's better to check if padding is zero.  Maybe rename it to reserved.

+               if (mem.pad1 || memchr_inv(mem.pad2, 0, sizeof(mem.pad2)))
+                       goto out;
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>


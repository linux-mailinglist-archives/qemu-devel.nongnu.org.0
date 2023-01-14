Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3906F66A754
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 01:02:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGTyz-0006ei-TT; Fri, 13 Jan 2023 19:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pGTyx-0006eI-Mw
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 19:01:11 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pGTyt-00074z-24
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 19:01:11 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 o7-20020a17090a0a0700b00226c9b82c3aso25935628pjo.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 16:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pnZMr3msysr3F7hQXLH7AQBYvEUMLHsk9nNkCMpDY14=;
 b=AKE7gl1eiHLqGoN0SnyVqNEPplEIwVO+riNAN02PwmozMjE2L10QCVf4rXYqWYXwrc
 nM+dfsbEmjg4aU4wDbXk81gsNGcxDwcFMrhjKV0dxv5tgPv5HRD69rmvva17U2MwBylu
 ox8qjH1cD99q2HmCdnSQ0OAN2PKSiP6XIZtUS7wpznd/WxqipSgn4SXTj5GoK28DsB/h
 /h+/U8gm5nSazzO1cze9VAQXTqkUirpJW7NcMgscsM2IWWic/84oK1838Dl2K3mrzzcM
 +5+ItvAPTnRvsTbhTQfUPMUE3qPaOrcvkhrQopsnh/lwNWCnC0CJndMiYCyxUMoXegK5
 gjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pnZMr3msysr3F7hQXLH7AQBYvEUMLHsk9nNkCMpDY14=;
 b=7FzmLfsBILcMGF8mhj2rcCqtMqm0ddxp0tjuS4WbMS2ToxJ+lvehDztZ3pC5dU31//
 XIm8eHXZihWosnOt3x9F/PXtp7gd1aDtMQmjcBpzYUKkmieFJIp+GBQqqmlzsjYRK+Q6
 uZ2FrFbyn8nWetaOmh10G80/OFMqrVmrPD+ktPNYqLLSXZg1tcLzeH33UMufJcpdrjNc
 dVJFJ3UaPz0vLWvuqqkh8aLA+ZowMEMC0tCBcDiwkUiCKgRYDGCn95Jld4CCVqEnqYmr
 KtZYxvj8KKvwt2TJ/7S0hu3V6TJFF1d27Le6GuNIWvP2W6q2yFjJEG3qcO4FXwApm1fB
 RYIg==
X-Gm-Message-State: AFqh2kpSoL8EsknJqLiyxpcN2+raHA0j+7qgL5jp1J0U04A7qYrDyHRK
 FgvILqJY0IAumInzzyGGE1oJQg==
X-Google-Smtp-Source: AMrXdXvNkNwg47euRwsow9ZzGgWEDAGEi69lwgz85sCYleqYo1kdNQOKNRaLha4U2UlUoVuWv9B/fQ==
X-Received: by 2002:a17:902:c409:b0:194:6d3c:38a5 with SMTP id
 k9-20020a170902c40900b001946d3c38a5mr516748plk.1.1673654465280; 
 Fri, 13 Jan 2023 16:01:05 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 k7-20020a170902760700b00192bf7eaf28sm14649057pll.286.2023.01.13.16.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 16:01:04 -0800 (PST)
Date: Sat, 14 Jan 2023 00:01:01 +0000
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
Subject: Re: [PATCH v10 9/9] KVM: Enable and expose KVM_MEM_PRIVATE
Message-ID: <Y8HwvTik/2avrCOU@google.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-10-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202061347.1070246-10-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102c.google.com
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
> @@ -10357,6 +10364,12 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
>  
>  		if (kvm_check_request(KVM_REQ_UPDATE_CPU_DIRTY_LOGGING, vcpu))
>  			static_call(kvm_x86_update_cpu_dirty_logging)(vcpu);
> +
> +		if (kvm_check_request(KVM_REQ_MEMORY_MCE, vcpu)) {
> +			vcpu->run->exit_reason = KVM_EXIT_SHUTDOWN;

Synthesizing triple fault shutdown is not the right approach.  Even with TDX's
MCE "architecture" (heavy sarcasm), it's possible that host userspace and the
guest have a paravirt interface for handling memory errors without killing the
host.

> +			r = 0;
> +			goto out;
> +		}
>  	}


> @@ -1982,6 +2112,10 @@ int __kvm_set_memory_region(struct kvm *kvm,
>  	     !access_ok((void __user *)(unsigned long)mem->userspace_addr,
>  			mem->memory_size))
>  		return -EINVAL;
> +	if (mem->flags & KVM_MEM_PRIVATE &&
> +		(mem->restricted_offset & (PAGE_SIZE - 1) ||

Align indentation.

> +		 mem->restricted_offset > U64_MAX - mem->memory_size))

Strongly prefer to use similar logic to existing code that detects wraps:

		mem->restricted_offset + mem->memory_size < mem->restricted_offset

This is also where I'd like to add the "gfn is aligned to offset" check, though
my brain is too fried to figure that out right now.

> +		return -EINVAL;
>  	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_MEM_SLOTS_NUM)
>  		return -EINVAL;
>  	if (mem->guest_phys_addr + mem->memory_size < mem->guest_phys_addr)
> @@ -2020,6 +2154,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
>  		if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
>  			return -EINVAL;
>  	} else { /* Modify an existing slot. */
> +		/* Private memslots are immutable, they can only be deleted. */

I'm 99% certain I suggested this, but if we're going to make these memslots
immutable, then we should straight up disallow dirty logging, otherwise we'll
end up with a bizarre uAPI.

> +		if (mem->flags & KVM_MEM_PRIVATE)
> +			return -EINVAL;
>  		if ((mem->userspace_addr != old->userspace_addr) ||
>  		    (npages != old->npages) ||
>  		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
> @@ -2048,10 +2185,28 @@ int __kvm_set_memory_region(struct kvm *kvm,
>  	new->npages = npages;
>  	new->flags = mem->flags;
>  	new->userspace_addr = mem->userspace_addr;
> +	if (mem->flags & KVM_MEM_PRIVATE) {
> +		new->restricted_file = fget(mem->restricted_fd);
> +		if (!new->restricted_file ||
> +		    !file_is_restrictedmem(new->restricted_file)) {
> +			r = -EINVAL;
> +			goto out;
> +		}
> +		new->restricted_offset = mem->restricted_offset;
> +	}
> +
> +	new->kvm = kvm;

Set this above, just so that the code flows better.


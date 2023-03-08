Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1966AFAEF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 01:14:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZhQy-00071k-MQ; Tue, 07 Mar 2023 19:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JtMHZAsKChMtv3xA4xHC6zz77z4x.v759x5D-wxEx4676z6D.7Az@flex--ackerleytng.bounces.google.com>)
 id 1pZhQw-0006wO-Ft
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 19:13:30 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JtMHZAsKChMtv3xA4xHC6zz77z4x.v759x5D-wxEx4676z6D.7Az@flex--ackerleytng.bounces.google.com>)
 id 1pZhQu-0007ou-Fi
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 19:13:30 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 a137-20020a25ca8f000000b0091b90b20cd9so15801372ybg.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 16:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678234406;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mmMlzzjnms9LP64W1EI4s9J2Aar/VS+/OpXG4YzMt1g=;
 b=DQipY5o6kwt2urMmc3ga0lGBCwLobU1Ifep42NoUNsZIX8Td2En8TfxAl5sbGzyNBB
 LIWsf3t77LSuCc0pGvjcZjIWULi+KlePCMmeN/QbMHXhC1Ixa4kOh+7152WsxGf2VC2d
 Ms1xKb6gHNm+/4O8RDcSjT+AzBbqUzpwW93RRiqm6+BJSL4+2HqKul5reyJxS2qUjQVn
 TjBmoEh1iNCS+lDVRczhTC0nw7EmFFlXj/fUYAlIAjyVh4kOpH9EZLnti4uHp00WyheW
 Vcv6eAX7BJrGIniLd7INUu4OdKbDatMzJF7cbOv0xYoxbaZDVLO31xC6G1jgMlMxSBxo
 JYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678234406;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mmMlzzjnms9LP64W1EI4s9J2Aar/VS+/OpXG4YzMt1g=;
 b=Qwtodw0Y/aGVtuWwWVrPQyYerwZ696OnxKkP0NoScyShLgt+VYvoEhCIsMPFF5Cp7y
 jgPkWCSkSi0liXjR3dqIrqDumPli3+OxlbmLaHo6P13dAQ/G6MEHktu12ayJUfIiowsD
 n7jntXsaDJT0/BqRtFY0xzRB1LaH2df53fQEh8M7kSlamFkTCO/E6FsDhsAk1u1x3ntj
 gp3StX7tor4Jq41UW+QKdT/h4V+W4zjLFHhQPwCpGIFowBaj8z3ird5m8bDuxvGWdokI
 KmjWyhJm7cl4Ym0uRMOeYuMu2oq4hzfkgFipN3WI8Nqf7wVw4zZq7PYIF8mlcKh8tw1S
 Ye/A==
X-Gm-Message-State: AO0yUKWOsF+VQtGuue0gSBLwmmL50zaNXdUjQDfuv16J68/Mp5mn8yws
 xkKU/P38LTS18v+aVx59vOE265zQEVKL/LcVBA==
X-Google-Smtp-Source: AK7set9fM9oqHN6RTfjUl1adN2jlRFEqmkZWFcTMizE5EgbRXDHz1eOesgkblPkKuD6/cVScAGsGMu92G3PJwAt7ew==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a05:6902:145:b0:ac2:a7a7:23c3 with
 SMTP id p5-20020a056902014500b00ac2a7a723c3mr5937614ybh.12.1678234406173;
 Tue, 07 Mar 2023 16:13:26 -0800 (PST)
Date: Wed, 08 Mar 2023 00:13:24 +0000
In-Reply-To: <20230128140030.GB700688@chaop.bj.intel.com> (message from Chao
 Peng on Sat, 28 Jan 2023 22:00:30 +0800)
Mime-Version: 1.0
Message-ID: <diqz5ybc3xsr.fsf@ackerleytng-cloudtop.c.googlers.com>
Subject: Re: [PATCH v10 9/9] KVM: Enable and expose KVM_MEM_PRIVATE
From: Ackerley Tng <ackerleytng@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: seanjc@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 pbonzini@redhat.com, corbet@lwn.net, vkuznets@redhat.com, 
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, 
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, arnd@arndb.de, 
 naoya.horiguchi@nec.com, linmiaohe@huawei.com, x86@kernel.org, hpa@zytor.com, 
 hughd@google.com, jlayton@kernel.org, bfields@fieldses.org, 
 akpm@linux-foundation.org, shuah@kernel.org, rppt@kernel.org, 
 steven.price@arm.com, mail@maciej.szmigiero.name, vbabka@suse.cz, 
 vannapurve@google.com, yu.c.zhang@linux.intel.com, 
 kirill.shutemov@linux.intel.com, luto@kernel.org, jun.nakajima@intel.com, 
 dave.hansen@intel.com, ak@linux.intel.com, david@redhat.com, 
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, 
 qperret@google.com, tabba@google.com, michael.roth@amd.com, mhocko@suse.com, 
 wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3JtMHZAsKChMtv3xA4xHC6zz77z4x.v759x5D-wxEx4676z6D.7Az@flex--ackerleytng.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Chao Peng <chao.p.peng@linux.intel.com> writes:

> On Sat, Jan 14, 2023 at 12:01:01AM +0000, Sean Christopherson wrote:
>> On Fri, Dec 02, 2022, Chao Peng wrote:
> ...
>> Strongly prefer to use similar logic to existing code that detects wraps:

>> 		mem->restricted_offset + mem->memory_size < mem->restricted_offset

>> This is also where I'd like to add the "gfn is aligned to offset" check,  
>> though
>> my brain is too fried to figure that out right now.

> Used count_trailing_zeros() for this TODO, unsure we have other better
> approach.

> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index afc8c26fa652..fd34c5f7cd2f 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -56,6 +56,7 @@
>   #include <asm/processor.h>
>   #include <asm/ioctl.h>
>   #include <linux/uaccess.h>
> +#include <linux/count_zeros.h>

>   #include "coalesced_mmio.h"
>   #include "async_pf.h"
> @@ -2087,6 +2088,19 @@ static bool kvm_check_memslot_overlap(struct  
> kvm_memslots *slots, int id,
>   	return false;
>   }

> +/*
> + * Return true when ALIGNMENT(offset) >= ALIGNMENT(gpa).
> + */
> +static bool kvm_check_rmem_offset_alignment(u64 offset, u64 gpa)
> +{
> +	if (!offset)
> +		return true;
> +	if (!gpa)
> +		return false;
> +
> +	return !!(count_trailing_zeros(offset) >= count_trailing_zeros(gpa));

Perhaps we could do something like

#define lowest_set_bit(val) (val & -val)

and use

return lowest_set_bit(offset) >= lowest_set_bit(gpa);

Please help me to understand: why must ALIGNMENT(offset) >=
ALIGNMENT(gpa)? Why is it not sufficient to have both gpa and offset be
aligned to PAGE_SIZE?

> +}
> +
>   /*
>    * Allocate some memory and give it an address in the guest physical  
> address
>    * space.
> @@ -2128,7 +2142,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
>   	if (mem->flags & KVM_MEM_PRIVATE &&
>   	    (mem->restrictedmem_offset & (PAGE_SIZE - 1) ||
>   	     mem->restrictedmem_offset + mem->memory_size <  
> mem->restrictedmem_offset ||
> -	     0 /* TODO: require gfn be aligned with restricted offset */))
> +	     !kvm_check_rmem_offset_alignment(mem->restrictedmem_offset,
> +					      mem->guest_phys_addr)))
>   		return -EINVAL;
>   	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_MEM_SLOTS_NUM)
>   		return -EINVAL;


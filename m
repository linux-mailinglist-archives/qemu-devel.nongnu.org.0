Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F52557C56C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 09:38:01 +0200 (CEST)
Received: from localhost ([::1]:48282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEQky-0002hq-5A
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 03:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@linux.intel.com>)
 id 1oEQia-0008GK-Ql
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 03:35:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:52428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@linux.intel.com>)
 id 1oEQiO-0006Uu-R7
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 03:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658388920; x=1689924920;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HDZ5ADD7H00ujzYo8f6UW7EI5DQuY8pQPtvATJDvm4I=;
 b=Gpp4mNX5TgGXIxLcLi7JxjdHo6nL+UhaGWNNA7aKLfourKlQskt5eceu
 IrqwRQqtyUWtE7hJ7K0G6tE6nniX/GjUa4UTuTmG9JED/aEXBJb3Nq8OI
 HEzcean3J+P/rDCziY48v0QCXvkbkgI4SG6htD184XTCHMoL5XMPtmxfS
 +Yv/Up/zz1/ueExIFz0lc+ZzMxTGJLWSDS2sqTflMmzfa69gy4ndH/HLy
 zgRk1V3G5HMR+A75uZCb9gI3TZTbZGA5nSLnIJq4y43dnPoMUD6V6gBSA
 knck+OI461iHuUZe5fffIBLSp4IaUOtE+BmRE1HFr8BX7lh2BmAgLz8AQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="267373466"
X-IronPort-AV: E=Sophos;i="5.92,288,1650956400"; d="scan'208";a="267373466"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 00:35:16 -0700
X-IronPort-AV: E=Sophos;i="5.92,288,1650956400"; d="scan'208";a="626004190"
Received: from wangwei-desk.sh.intel.com (HELO [10.239.159.152])
 ([10.239.159.152])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 00:35:06 -0700
Message-ID: <45ae9f57-d595-f202-abb5-26a03a2ca131@linux.intel.com>
Date: Thu, 21 Jul 2022 15:34:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 11/14] KVM: Register/unregister the guest private
 memory regions
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-12-chao.p.peng@linux.intel.com>
 <f02baa37-8d34-5d07-a0ae-300ffefc7fee@amd.com>
 <20220719140843.GA84779@chaop.bj.intel.com>
 <36e671d2-6b95-8e4f-c2ac-fee4b2670c6e@amd.com>
 <20220720150706.GB124133@chaop.bj.intel.com>
 <d0fd229d-afa6-c66d-3e55-09ac5877453e@amd.com> <YtgrkXqP/GIi9ujZ@google.com>
From: Wei Wang <wei.w.wang@linux.intel.com>
In-Reply-To: <YtgrkXqP/GIi9ujZ@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=wei.w.wang@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 7/21/22 00:21, Sean Christopherson wrote:
> On Wed, Jul 20, 2022, Gupta, Pankaj wrote:
>>>>>>> +bool __weak kvm_arch_private_mem_supported(struct kvm *kvm)
> Use kvm_arch_has_private_mem(), both because "has" makes it obvious this is checking
> a flag of sorts, and to align with other helpers of this nature (and with
> CONFIG_HAVE_KVM_PRIVATE_MEM).
>
>    $ git grep kvm_arch | grep supported | wc -l
>    0
>    $ git grep kvm_arch | grep has | wc -l
>    26
>
>>>>>>> +#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
>>>>>>> +	case KVM_MEMORY_ENCRYPT_REG_REGION:
>>>>>>> +	case KVM_MEMORY_ENCRYPT_UNREG_REGION: {
>>>>>>> +		struct kvm_enc_region region;
>>>>>>> +
>>>>>>> +		if (!kvm_arch_private_mem_supported(kvm))
>>>>>>> +			goto arch_vm_ioctl;
>>>>>>> +
>>>>>>> +		r = -EFAULT;
>>>>>>> +		if (copy_from_user(&region, argp, sizeof(region)))
>>>>>>> +			goto out;
>>>>>>> +
>>>>>>> +		r = kvm_vm_ioctl_set_encrypted_region(kvm, ioctl, &region);
>>>>>> this is to store private region metadata not only the encrypted region?
>>>>> Correct.
>>>> Sorry for not being clear, was suggesting name change of this function from:
>>>> "kvm_vm_ioctl_set_encrypted_region" to "kvm_vm_ioctl_set_private_region"
>>> Though I don't have strong reason to change it, I'm fine with this and
>> Yes, no strong reason, just thought "kvm_vm_ioctl_set_private_region" would
>> depict the actual functionality :)
>>
>>> this name matches the above kvm_arch_private_mem_supported perfectly.
>> BTW could not understand this, how "kvm_vm_ioctl_set_encrypted_region"
>> matches "kvm_arch_private_mem_supported"?
> Chao is saying that kvm_vm_ioctl_set_private_region() pairs nicely with
> kvm_arch_private_mem_supported(), not that the "encrypted" variant pairs nicely.
>
> I also like using "private" instead of "encrypted", though we should probably
> find a different verb than "set", because calling "set_private" when making the
> region shared is confusing.  I'm struggling to come up with a good alternative
> though.
>
> kvm_vm_ioctl_set_memory_region() is already taken by KVM_SET_USER_MEMORY_REGION,
> and that also means that anything with "memory_region" in the name is bound to be
> confusing.
>
> Hmm, and if we move away from "encrypted", it probably makes sense to pass in
> addr+size instead of a kvm_enc_region.
>
> Maybe this?
>
> static int kvm_vm_ioctl_set_or_clear_mem_private(struct kvm *kvm, gpa_t gpa,
> 					         gpa_t size, bool set_private)
>
> and then:
>
> #ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
> 	case KVM_MEMORY_ENCRYPT_REG_REGION:
> 	case KVM_MEMORY_ENCRYPT_UNREG_REGION: {
> 		bool set = ioctl == KVM_MEMORY_ENCRYPT_REG_REGION;
> 		struct kvm_enc_region region;
>
> 		if (!kvm_arch_private_mem_supported(kvm))
> 			goto arch_vm_ioctl;
>
> 		r = -EFAULT;
> 		if (copy_from_user(&region, argp, sizeof(region)))
> 			goto out;
>
> 		r = kvm_vm_ioctl_set_or_clear_mem_private(kvm, region.addr,
> 							  region.size, set);
> 		break;
> 	}
> #endif
>
> I don't love it, so if someone has a better idea...
>
Maybe you could tag it with cgs for all the confidential guest support 
related stuff:
e.g. kvm_vm_ioctl_set_cgs_mem()

bool is_private = ioctl == KVM_MEMORY_ENCRYPT_REG_REGION;
...
kvm_vm_ioctl_set_cgs_mem(, is_private)



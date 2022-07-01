Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F31B562818
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 03:23:34 +0200 (CEST)
Received: from localhost ([::1]:59850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o75Nd-0004jH-6i
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 21:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1o75MC-0003zM-R4
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 21:22:04 -0400
Received: from mga18.intel.com ([134.134.136.126]:13442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1o75M7-0007Xf-R8
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 21:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656638519; x=1688174519;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=G2fAQsutHSI8kLKVVakNXwxot1Yyc0ooUkqIi8b15IA=;
 b=OxREnW1UkZQlB3aUN7pO3KHisfs1N3aFK+AKtgag2rMa06WRFamjPM+U
 Ix10sRFXTc0y61/9yB2/m27P9Vhde3o2A2H6+l6iqRDb983/9HfGiQf2x
 9JiPosSgcmy8RjGwwXd1NEWSOlR2x7KvDUpB3B8Bkmave3lH7APZHQXH1
 lYPhzP2FKlY5vNwUVdBdvA6jAGB+ZdqkFp9QxsrtfHAqvXodZH3tj+SiB
 +tSj8bhh18MRbIK1WRTZFwSHtGg0hJvSf9rQy6xMzELtBxFFFxGum+7ea
 yFD5F05DNeOpyGSIkPgguziH+2RdkRJoH8/gQILS9HNvc6ln9nMAicJnZ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="265547493"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="265547493"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 18:21:52 -0700
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="596042946"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.169.250])
 ([10.249.169.250])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 18:21:42 -0700
Message-ID: <4fe3b47d-e94a-890a-5b87-6dfb7763bc7e@intel.com>
Date: Fri, 1 Jul 2022 09:21:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v6 6/8] KVM: Handle page fault for private memory
Content-Language: en-US
To: Michael Roth <michael.roth@amd.com>,
 Vishal Annapurve <vannapurve@google.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>,
 "Nikunj A. Dadhania" <nikunj@amd.com>, kvm list <kvm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86 <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com, Quentin Perret
 <qperret@google.com>, mhocko@suse.com
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-7-chao.p.peng@linux.intel.com>
 <b3ce0855-0e4b-782a-599c-26590df948dd@amd.com>
 <20220624090246.GA2181919@chaop.bj.intel.com>
 <CAGtprH82H_fjtRbL0KUxOkgOk4pgbaEbAydDYfZ0qxz41JCnAQ@mail.gmail.com>
 <20220630222140.of4md7bufd5jv5bh@amd.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220630222140.of4md7bufd5jv5bh@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=xiaoyao.li@intel.com; helo=mga18.intel.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 7/1/2022 6:21 AM, Michael Roth wrote:
> On Thu, Jun 30, 2022 at 12:14:13PM -0700, Vishal Annapurve wrote:
>> With transparent_hugepages=always setting I see issues with the
>> current implementation.
>>
>> Scenario:
>> 1) Guest accesses a gfn range 0x800-0xa00 as private
>> 2) Guest calls mapgpa to convert the range 0x84d-0x86e as shared
>> 3) Guest tries to access recently converted memory as shared for the first time
>> Guest VM shutdown is observed after step 3 -> Guest is unable to
>> proceed further since somehow code section is not as expected
>>
>> Corresponding KVM trace logs after step 3:
>> VCPU-0-61883   [078] ..... 72276.115679: kvm_page_fault: address
>> 84d000 error_code 4
>> VCPU-0-61883   [078] ..... 72276.127005: kvm_mmu_spte_requested: gfn
>> 84d pfn 100b4a4d level 2
>> VCPU-0-61883   [078] ..... 72276.127008: kvm_tdp_mmu_spte_changed: as
>> id 0 gfn 800 level 2 old_spte 100b1b16827 new_spte 100b4a00ea7
>> VCPU-0-61883   [078] ..... 72276.127009: kvm_mmu_prepare_zap_page: sp
>> gen 0 gfn 800 l1 8-byte q0 direct wux nxe ad root 0 sync
>> VCPU-0-61883   [078] ..... 72276.127009: kvm_tdp_mmu_spte_changed: as
>> id 0 gfn 800 level 1 old_spte 1003eb27e67 new_spte 5a0
>> VCPU-0-61883   [078] ..... 72276.127010: kvm_tdp_mmu_spte_changed: as
>> id 0 gfn 801 level 1 old_spte 10056cc8e67 new_spte 5a0
>> VCPU-0-61883   [078] ..... 72276.127010: kvm_tdp_mmu_spte_changed: as
>> id 0 gfn 802 level 1 old_spte 10056fa2e67 new_spte 5a0
>> VCPU-0-61883   [078] ..... 72276.127010: kvm_tdp_mmu_spte_changed: as
>> id 0 gfn 803 level 1 old_spte 0 new_spte 5a0
>> ....
>>   VCPU-0-61883   [078] ..... 72276.127089: kvm_tdp_mmu_spte_changed: as
>> id 0 gfn 9ff level 1 old_spte 100a43f4e67 new_spte 5a0
>>   VCPU-0-61883   [078] ..... 72276.127090: kvm_mmu_set_spte: gfn 800
>> spte 100b4a00ea7 (rwxu) level 2 at 10052fa5020
>>   VCPU-0-61883   [078] ..... 72276.127091: kvm_fpu: unload
>>
>> Looks like with transparent huge pages enabled kvm tried to handle the
>> shared memory fault on 0x84d gfn by coalescing nearby 4K pages
>> to form a contiguous 2MB page mapping at gfn 0x800, since level 2 was
>> requested in kvm_mmu_spte_requested.
>> This caused the private memory contents from regions 0x800-0x84c and
>> 0x86e-0xa00 to get unmapped from the guest leading to guest vm
>> shutdown.
> 
> Interesting... seems like that wouldn't be an issue for non-UPM SEV, since
> the private pages would still be mapped as part of that 2M mapping, and
> it's completely up to the guest as to whether it wants to access as
> private or shared. But for UPM it makes sense this would cause issues.
> 
>>
>> Does getting the mapping level as per the fault access type help
>> address the above issue? Any such coalescing should not cross between
>> private to
>> shared or shared to private memory regions.
> 
> Doesn't seem like changing the check to fault->is_private would help in
> your particular case, since the subsequent host_pfn_mapping_level() call
> only seems to limit the mapping level to whatever the mapping level is
> for the HVA in the host page table.
> 
> Seems like with UPM we need some additional handling here that also
> checks that the entire 2M HVA range is backed by non-private memory.
> 
> Non-UPM SNP hypervisor patches already have a similar hook added to
> host_pfn_mapping_level() which implements such a check via RMP table, so
> UPM might need something similar:
> 
>    https://github.com/AMDESE/linux/commit/ae4475bc740eb0b9d031a76412b0117339794139
> 
> -Mike
> 

For TDX, we try to track the page type (shared, private, mixed) of each 
gfn at given level. Only when the type is shared/private, can it be 
mapped at that level. When it's mixed, i.e., it contains both shared 
pages and private pages at given level, it has to go to next smaller level.

https://github.com/intel/tdx/commit/ed97f4042eb69a210d9e972ccca6a84234028cad




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C354730F512
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:34:55 +0100 (CET)
Received: from localhost ([::1]:35142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fig-0007Lk-Rr
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1l7fh0-0005h2-OH
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:33:10 -0500
Received: from foss.arm.com ([217.140.110.172]:52030)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1l7fgx-00060A-7R
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:33:10 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F34011FB;
 Thu,  4 Feb 2021 06:33:06 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B07DF3F694;
 Thu,  4 Feb 2021 06:33:03 -0800 (PST)
Subject: Re: [PATCH v7 2/3] arm64: kvm: Introduce MTE VCPU feature
To: Marc Zyngier <maz@kernel.org>
References: <20210115152811.8398-1-steven.price@arm.com>
 <20210115152811.8398-3-steven.price@arm.com>
 <0c0adbcd250690f703ac4a28faf99263@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <844e72df-9a24-23f6-fb7c-e6f499c29af1@arm.com>
Date: Thu, 4 Feb 2021 14:33:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0c0adbcd250690f703ac4a28faf99263@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.182,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, qemu-devel@nongnu.org,
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/02/2021 17:12, Marc Zyngier wrote:
> On 2021-01-15 15:28, Steven Price wrote:
>> Add a new VM feature 'KVM_ARM_CAP_MTE' which enables memory tagging
>> for a VM. This exposes the feature to the guest and automatically tags
>> memory pages touched by the VM as PG_mte_tagged (and clears the tags
>> storage) to ensure that the guest cannot see stale tags, and so that the
>> tags are correctly saved/restored across swap.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>  arch/arm64/include/asm/kvm_emulate.h |  3 +++
>>  arch/arm64/include/asm/kvm_host.h    |  3 +++
>>  arch/arm64/include/asm/pgtable.h     |  2 +-
>>  arch/arm64/kernel/mte.c              | 36 +++++++++++++++++-----------
>>  arch/arm64/kvm/arm.c                 |  9 +++++++
>>  arch/arm64/kvm/hyp/exception.c       |  3 ++-
>>  arch/arm64/kvm/mmu.c                 | 16 +++++++++++++
>>  arch/arm64/kvm/sys_regs.c            |  6 ++++-
>>  include/uapi/linux/kvm.h             |  1 +
>>  9 files changed, 62 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_emulate.h
>> b/arch/arm64/include/asm/kvm_emulate.h
>> index f612c090f2e4..6bf776c2399c 100644
>> --- a/arch/arm64/include/asm/kvm_emulate.h
>> +++ b/arch/arm64/include/asm/kvm_emulate.h
>> @@ -84,6 +84,9 @@ static inline void vcpu_reset_hcr(struct kvm_vcpu 
>> *vcpu)
>>      if (cpus_have_const_cap(ARM64_MISMATCHED_CACHE_TYPE) ||
>>          vcpu_el1_is_32bit(vcpu))
>>          vcpu->arch.hcr_el2 |= HCR_TID2;
>> +
>> +    if (kvm_has_mte(vcpu->kvm))
>> +        vcpu->arch.hcr_el2 |= HCR_ATA;
>>  }
>>
>>  static inline unsigned long *vcpu_hcr(struct kvm_vcpu *vcpu)
>> diff --git a/arch/arm64/include/asm/kvm_host.h
>> b/arch/arm64/include/asm/kvm_host.h
>> index 51590a397e4b..1ca5785fb0e9 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -132,6 +132,8 @@ struct kvm_arch {
>>
>>      u8 pfr0_csv2;
>>      u8 pfr0_csv3;
>> +    /* Memory Tagging Extension enabled for the guest */
>> +    bool mte_enabled;
>>  };
>>
>>  struct kvm_vcpu_fault_info {
>> @@ -749,6 +751,7 @@ bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu 
>> *vcpu);
>>  #define kvm_arm_vcpu_sve_finalized(vcpu) \
>>      ((vcpu)->arch.flags & KVM_ARM64_VCPU_SVE_FINALIZED)
>>
>> +#define kvm_has_mte(kvm) (system_supports_mte() && 
>> (kvm)->arch.mte_enabled)
>>  #define kvm_vcpu_has_pmu(vcpu)                    \
>>      (test_bit(KVM_ARM_VCPU_PMU_V3, (vcpu)->arch.features))
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h 
>> b/arch/arm64/include/asm/pgtable.h
>> index 501562793ce2..27416d52f6a9 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -312,7 +312,7 @@ static inline void set_pte_at(struct mm_struct
>> *mm, unsigned long addr,
>>          __sync_icache_dcache(pte);
>>
>>      if (system_supports_mte() &&
>> -        pte_present(pte) && pte_tagged(pte) && !pte_special(pte))
>> +        pte_present(pte) && pte_valid_user(pte) && !pte_special(pte))
>>          mte_sync_tags(ptep, pte);
> 
> Care to elaborate on this change?

Sorry I should have called this out in the commit message. The change 
here is instead of only calling mte_sync_tags() on pages which are 
already tagged in the PTE, it is called for all (normal) user pages 
instead. See below for why.

>>
>>      __check_racy_pte_update(mm, ptep, pte);
>> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
>> index dc9ada64feed..f9e089be1603 100644
>> --- a/arch/arm64/kernel/mte.c
>> +++ b/arch/arm64/kernel/mte.c
>> @@ -25,27 +25,33 @@
>>
>>  u64 gcr_kernel_excl __ro_after_init;
>>
>> -static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool 
>> check_swap)
>> +static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool 
>> check_swap,
>> +                   bool pte_is_tagged)
>>  {
>>      pte_t old_pte = READ_ONCE(*ptep);
>>
>>      if (check_swap && is_swap_pte(old_pte)) {
>>          swp_entry_t entry = pte_to_swp_entry(old_pte);
>>
>> -        if (!non_swap_entry(entry) && mte_restore_tags(entry, page))
>> +        if (!non_swap_entry(entry) && mte_restore_tags(entry, page)) {
>> +            set_bit(PG_mte_tagged, &page->flags);
>>              return;
>> +        }
>>      }
>>
>> -    page_kasan_tag_reset(page);
>> -    /*
>> -     * We need smp_wmb() in between setting the flags and clearing the
>> -     * tags because if another thread reads page->flags and builds a
>> -     * tagged address out of it, there is an actual dependency to the
>> -     * memory access, but on the current thread we do not guarantee that
>> -     * the new page->flags are visible before the tags were updated.
>> -     */
>> -    smp_wmb();
>> -    mte_clear_page_tags(page_address(page));
>> +    if (pte_is_tagged) {
>> +        set_bit(PG_mte_tagged, &page->flags);
>> +        page_kasan_tag_reset(page);
>> +        /*
>> +         * We need smp_wmb() in between setting the flags and 
>> clearing the
>> +         * tags because if another thread reads page->flags and builds a
>> +         * tagged address out of it, there is an actual dependency to 
>> the
>> +         * memory access, but on the current thread we do not 
>> guarantee that
>> +         * the new page->flags are visible before the tags were updated.
>> +         */
>> +        smp_wmb();
>> +        mte_clear_page_tags(page_address(page));
>> +    }
>>  }
>>
>>  void mte_sync_tags(pte_t *ptep, pte_t pte)
>> @@ -53,11 +59,13 @@ void mte_sync_tags(pte_t *ptep, pte_t pte)
>>      struct page *page = pte_page(pte);
>>      long i, nr_pages = compound_nr(page);
>>      bool check_swap = nr_pages == 1;
>> +    bool pte_is_tagged = pte_tagged(pte);
>>
>>      /* if PG_mte_tagged is set, tags have already been initialised */
>>      for (i = 0; i < nr_pages; i++, page++) {
>> -        if (!test_and_set_bit(PG_mte_tagged, &page->flags))
>> -            mte_sync_page_tags(page, ptep, check_swap);
>> +        if (!test_bit(PG_mte_tagged, &page->flags))
>> +            mte_sync_page_tags(page, ptep, check_swap,
>> +                       pte_is_tagged);
>>      }
>>  }
> 
> This part really wants to have its own patch and be documented,
> explaining why it is still valid not to atomically test and set
> the PG_mte_tagged bit.

I think you're right - this patch needs splitting. There are two parts here:

1) Changing mte_sync_tags() to be called whether the page is tagged or 
not. This is because we want the opportunity to restore tags even if 
there is no user space mapping with tags enabled (i.e. KVM has tags 
enabled, but the VMM hasn't mapped with PROT_MTE).

2) Actually introducing the MTE VM feature.

I'll split it and hopefully the commit messages can then document what's 
going on.

>>
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 6e637d2b4cfb..f4c2fd2e7c49 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -97,6 +97,12 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>>          r = 0;
>>          kvm->arch.return_nisv_io_abort_to_user = true;
>>          break;
>> +    case KVM_CAP_ARM_MTE:
>> +        if (!system_supports_mte() || kvm->created_vcpus)
>> +            return -EINVAL;
>> +        r = 0;
>> +        kvm->arch.mte_enabled = true;
>> +        break;
>>      default:
>>          r = -EINVAL;
>>          break;
>> @@ -238,6 +244,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, 
>> long ext)
>>           */
>>          r = 1;
>>          break;
>> +    case KVM_CAP_ARM_MTE:
>> +        r = system_supports_mte();
>> +        break;
>>      case KVM_CAP_STEAL_TIME:
>>          r = kvm_arm_pvtime_supported();
>>          break;
>> diff --git a/arch/arm64/kvm/hyp/exception.c 
>> b/arch/arm64/kvm/hyp/exception.c
>> index 73629094f903..56426565600c 100644
>> --- a/arch/arm64/kvm/hyp/exception.c
>> +++ b/arch/arm64/kvm/hyp/exception.c
>> @@ -112,7 +112,8 @@ static void enter_exception64(struct kvm_vcpu
>> *vcpu, unsigned long target_mode,
>>      new |= (old & PSR_C_BIT);
>>      new |= (old & PSR_V_BIT);
>>
>> -    // TODO: TCO (if/when ARMv8.5-MemTag is exposed to guests)
>> +    if (kvm_has_mte(vcpu->kvm))
>> +        new |= PSR_TCO_BIT;
>>
>>      new |= (old & PSR_DIT_BIT);
>>
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 7d2257cc5438..b9f9fb462de6 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -879,6 +879,22 @@ static int user_mem_abort(struct kvm_vcpu *vcpu,
>> phys_addr_t fault_ipa,
>>      if (vma_pagesize == PAGE_SIZE && !force_pte)
>>          vma_pagesize = transparent_hugepage_adjust(memslot, hva,
>>                                 &pfn, &fault_ipa);
>> +
>> +    if (kvm_has_mte(kvm) && pfn_valid(pfn)) {
>> +        /*
>> +         * VM will be able to see the page's tags, so we must ensure
>> +         * they have been initialised.
>> +         */
>> +        struct page *page = pfn_to_page(pfn);
>> +        long i, nr_pages = compound_nr(page);
> 
> "unsigned long" to match the return type of compound_nr().
> 
> Also, shouldn't you cap nr_pages to vma_pagesize? It could well
> be that what we end-up mapping at S2 has nothing to do with
> the view the kernel has of that page.

Good point - actually AFAICT I can just use vma_pagesize directly - 
there's no need to look at the kernel's view.

Thanks for the review,

Steve

>> +
>> +        /* if PG_mte_tagged is set, tags have already been 
>> initialised */
>> +        for (i = 0; i < nr_pages; i++, page++) {
>> +            if (!test_and_set_bit(PG_mte_tagged, &page->flags))
>> +                mte_clear_page_tags(page_address(page));
>> +        }
>> +    }
>> +
>>      if (writable) {
>>          prot |= KVM_PGTABLE_PROT_W;
>>          kvm_set_pfn_dirty(pfn);
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index 88d4f360949e..57e5be14f1cc 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -1029,7 +1029,8 @@ static u64 read_id_reg(const struct kvm_vcpu *vcpu,
>>          val &= ~(0xfUL << ID_AA64PFR0_CSV3_SHIFT);
>>          val |= ((u64)vcpu->kvm->arch.pfr0_csv3 << 
>> ID_AA64PFR0_CSV3_SHIFT);
>>      } else if (id == SYS_ID_AA64PFR1_EL1) {
>> -        val &= ~(0xfUL << ID_AA64PFR1_MTE_SHIFT);
>> +        if (!kvm_has_mte(vcpu->kvm))
>> +            val &= ~(0xfUL << ID_AA64PFR1_MTE_SHIFT);
>>      } else if (id == SYS_ID_AA64ISAR1_EL1 && !vcpu_has_ptrauth(vcpu)) {
>>          val &= ~((0xfUL << ID_AA64ISAR1_APA_SHIFT) |
>>               (0xfUL << ID_AA64ISAR1_API_SHIFT) |
>> @@ -1284,6 +1285,9 @@ static bool access_ccsidr(struct kvm_vcpu *vcpu,
>> struct sys_reg_params *p,
>>  static unsigned int mte_visibility(const struct kvm_vcpu *vcpu,
>>                     const struct sys_reg_desc *rd)
>>  {
>> +    if (kvm_has_mte(vcpu->kvm))
>> +        return 0;
>> +
>>      return REG_HIDDEN;
>>  }
>>
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index 886802b8ffba..de737d5102ca 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -1056,6 +1056,7 @@ struct kvm_ppc_resize_hpt {
>>  #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
>>  #define KVM_CAP_SYS_HYPERV_CPUID 191
>>  #define KVM_CAP_DIRTY_LOG_RING 192
>> +#define KVM_CAP_ARM_MTE 193
>>
>>  #ifdef KVM_CAP_IRQ_ROUTING
> 
> Thanks,
> 
>          M.


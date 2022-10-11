Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50DA5FB6B6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 17:15:18 +0200 (CEST)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiGyT-0005fn-Fr
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 11:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oiGrs-0007iy-MJ
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:08:29 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oiGrq-0008JY-13
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:08:28 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso1505553pjq.1
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ErH4l1T+ZGMpqR37mP7fSl7lfx/yCYTHKqdjvYhfNY=;
 b=wBOJrKDpYJj9zhBd8UO6m5303nFY+sWajoR8iJKb91TPON5iBmqrCTCVyN7iXCTpAn
 2htmhepGZ6R+XoVGuS86g6ueB5LRhRsxkxDmoi2UZtXi4VDoAr+bzCQK3pQeOQpeh77Y
 QFVR9TscKlFVWvsvgl03TuKiBTOdtZD94kGkFeHK5cNCsIMvt09WtMRDy48FOuN+El29
 C7ATdJiiw+h4EKfWK1IxIhERfYs4fKmhdpD5OljKKDoW7JI7e4eLVBkXZjsDWA9qogJ+
 yjStxeI4jhA+8qIgKoqXmArf90ys8kt3v4lY9+LSnLaam3dLJapxCDxW32ADAzgxNfKw
 x2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ErH4l1T+ZGMpqR37mP7fSl7lfx/yCYTHKqdjvYhfNY=;
 b=d3zDI2peWVCV5XveHQZAgxopuFwGgZIdEBfhiRvgSjsSOnWB37nbeN9/IWJIFSkqNG
 5wPkP7kjZbGyUkdNuZsE0FSL8n3vtLM1NoAk3TX3IZ8hj/YraUBNCAEMmOrozsrIzk60
 Im1ifJhCQA1IK6/+Spx+ED+OD6FOtuRGaaReiXg7OqV/5KgwIsF5I36pcVhiGbFXeCUw
 NSTqbpDlDY7zzdYcP0PRa/FSdHZYfXriWkUuZh1/4YhFL3IiWPH9+HN3dfe7Qqu1eLBy
 vRXLhtDDSYB9ZuxCmMKCH5mvAS0LXiLZk2avrtyJKsKMKdAbak3NZkejrEliK6GWfmCm
 1uXA==
X-Gm-Message-State: ACrzQf10PULBrIfzuRC2qK8yiWbOXRfw7bDVwlB3yS0lf/GwS7JXfQ6g
 saKgISbb0xiqrTFiB+/Fe2fB9Q==
X-Google-Smtp-Source: AMsMyM4X5p9IWHt0/3xJRM7qhs1W+dM1SbtKTUe9/WBf5mg5Br5xcSdX9C2PgrzL/Qdp0WfadQi3Xg==
X-Received: by 2002:a17:903:2284:b0:180:289f:7f09 with SMTP id
 b4-20020a170903228400b00180289f7f09mr22356281plh.120.1665500902924; 
 Tue, 11 Oct 2022 08:08:22 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:67e1:640e:ccb8:1a4a?
 ([2602:47:d49d:ec01:67e1:640e:ccb8:1a4a])
 by smtp.gmail.com with ESMTPSA id
 x64-20020a626343000000b005615c8a660csm9109178pfb.65.2022.10.11.08.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 08:08:22 -0700 (PDT)
Message-ID: <04de995b-8999-a7e0-21c5-566d749999ac@linaro.org>
Date: Tue, 11 Oct 2022 08:08:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 08/18] accel/tcg: Introduce tlb_set_page_full
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221004141051.110653-1-richard.henderson@linaro.org>
 <20221004141051.110653-9-richard.henderson@linaro.org>
 <CAKmqyKOoYbOispd4RxF9wBv-J3Wm0Go8TCPR9HZ4Ph8_f7FK=g@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAKmqyKOoYbOispd4RxF9wBv-J3Wm0Go8TCPR9HZ4Ph8_f7FK=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.934,
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

On 10/10/22 22:01, Alistair Francis wrote:
> On Wed, Oct 5, 2022 at 1:11 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Now that we have collected all of the page data into
>> CPUTLBEntryFull, provide an interface to record that
>> all in one go, instead of using 4 arguments.  This interface
>> allows CPUTLBEntryFull to be extended without having to
>> change the number of arguments.
>>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/cpu-defs.h | 14 +++++++++++
>>   include/exec/exec-all.h | 22 ++++++++++++++++++
>>   accel/tcg/cputlb.c      | 51 ++++++++++++++++++++++++++---------------
>>   3 files changed, 69 insertions(+), 18 deletions(-)
>>
>> diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
>> index f70f54d850..5e12cc1854 100644
>> --- a/include/exec/cpu-defs.h
>> +++ b/include/exec/cpu-defs.h
>> @@ -148,7 +148,21 @@ typedef struct CPUTLBEntryFull {
>>        *     + the offset within the target MemoryRegion (otherwise)
>>        */
>>       hwaddr xlat_section;
>> +
>> +    /*
>> +     * @phys_addr contains the physical address in the address space
>> +     * given by cpu_asidx_from_attrs(cpu, @attrs).
>> +     */
>> +    hwaddr phys_addr;
>> +
>> +    /* @attrs contains the memory transaction attributes for the page. */
>>       MemTxAttrs attrs;
>> +
>> +    /* @prot contains the complete protections for the page. */
>> +    uint8_t prot;
>> +
>> +    /* @lg_page_size contains the log2 of the page size. */
>> +    uint8_t lg_page_size;
>>   } CPUTLBEntryFull;
>>
>>   /*
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index d255d69bc1..b1b920a713 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -257,6 +257,28 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
>>                                                  uint16_t idxmap,
>>                                                  unsigned bits);
>>
>> +/**
>> + * tlb_set_page_full:
>> + * @cpu: CPU context
>> + * @mmu_idx: mmu index of the tlb to modify
>> + * @vaddr: virtual address of the entry to add
>> + * @full: the details of the tlb entry
>> + *
>> + * Add an entry to @cpu tlb index @mmu_idx.  All of the fields of
>> + * @full must be filled, except for xlat_section, and constitute
>> + * the complete description of the translated page.
>> + *
>> + * This is generally called by the target tlb_fill function after
>> + * having performed a successful page table walk to find the physical
>> + * address and attributes for the translation.
>> + *
>> + * At most one entry for a given virtual address is permitted. Only a
>> + * single TARGET_PAGE_SIZE region is mapped; @full->lg_page_size is only
>> + * used by tlb_flush_page.
>> + */
>> +void tlb_set_page_full(CPUState *cpu, int mmu_idx, target_ulong vaddr,
>> +                       CPUTLBEntryFull *full);
>> +
>>   /**
>>    * tlb_set_page_with_attrs:
>>    * @cpu: CPU to add this TLB entry for
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index e3ee4260bd..361078471b 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -1095,16 +1095,16 @@ static void tlb_add_large_page(CPUArchState *env, int mmu_idx,
>>       env_tlb(env)->d[mmu_idx].large_page_mask = lp_mask;
>>   }
>>
>> -/* Add a new TLB entry. At most one entry for a given virtual address
>> +/*
>> + * Add a new TLB entry. At most one entry for a given virtual address
>>    * is permitted. Only a single TARGET_PAGE_SIZE region is mapped, the
>>    * supplied size is only used by tlb_flush_page.
>>    *
>>    * Called from TCG-generated code, which is under an RCU read-side
>>    * critical section.
>>    */
>> -void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>> -                             hwaddr paddr, MemTxAttrs attrs, int prot,
>> -                             int mmu_idx, target_ulong size)
>> +void tlb_set_page_full(CPUState *cpu, int mmu_idx,
>> +                       target_ulong vaddr, CPUTLBEntryFull *full)
>>   {
>>       CPUArchState *env = cpu->env_ptr;
>>       CPUTLB *tlb = env_tlb(env);
>> @@ -1117,35 +1117,36 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>>       CPUTLBEntry *te, tn;
>>       hwaddr iotlb, xlat, sz, paddr_page;
>>       target_ulong vaddr_page;
>> -    int asidx = cpu_asidx_from_attrs(cpu, attrs);
>> -    int wp_flags;
>> +    int asidx, wp_flags, prot;
>>       bool is_ram, is_romd;
>>
>>       assert_cpu_is_self(cpu);
>>
>> -    if (size <= TARGET_PAGE_SIZE) {
>> +    if (full->lg_page_size <= TARGET_PAGE_BITS) {
>>           sz = TARGET_PAGE_SIZE;
>>       } else {
>> -        tlb_add_large_page(env, mmu_idx, vaddr, size);
>> -        sz = size;
>> +        sz = (hwaddr)1 << full->lg_page_size;
>> +        tlb_add_large_page(env, mmu_idx, vaddr, sz);
>>       }
>>       vaddr_page = vaddr & TARGET_PAGE_MASK;
>> -    paddr_page = paddr & TARGET_PAGE_MASK;
>> +    paddr_page = full->phys_addr & TARGET_PAGE_MASK;
>>
>> +    prot = full->prot;
>> +    asidx = cpu_asidx_from_attrs(cpu, full->attrs);
>>       section = address_space_translate_for_iotlb(cpu, asidx, paddr_page,
>> -                                                &xlat, &sz, attrs, &prot);
>> +                                                &xlat, &sz, full->attrs, &prot);
>>       assert(sz >= TARGET_PAGE_SIZE);
>>
>>       tlb_debug("vaddr=" TARGET_FMT_lx " paddr=0x" TARGET_FMT_plx
>>                 " prot=%x idx=%d\n",
>> -              vaddr, paddr, prot, mmu_idx);
>> +              vaddr, full->phys_addr, prot, mmu_idx);
>>
>>       address = vaddr_page;
>> -    if (size < TARGET_PAGE_SIZE) {
>> +    if (full->lg_page_size < TARGET_PAGE_BITS) {
>>           /* Repeat the MMU check and TLB fill on every access.  */
>>           address |= TLB_INVALID_MASK;
>>       }
>> -    if (attrs.byte_swap) {
>> +    if (full->attrs.byte_swap) {
>>           address |= TLB_BSWAP;
>>       }
>>
>> @@ -1236,8 +1237,10 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>>        * subtract here is that of the page base, and not the same as the
>>        * vaddr we add back in io_readx()/io_writex()/get_page_addr_code().
>>        */
>> +    desc->fulltlb[index] = *full;
>>       desc->fulltlb[index].xlat_section = iotlb - vaddr_page;
>> -    desc->fulltlb[index].attrs = attrs;
>> +    desc->fulltlb[index].phys_addr = paddr_page;
>> +    desc->fulltlb[index].prot = prot;
>>
>>       /* Now calculate the new entry */
>>       tn.addend = addend - vaddr_page;
>> @@ -1272,9 +1275,21 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>>       qemu_spin_unlock(&tlb->c.lock);
>>   }
>>
>> -/* Add a new TLB entry, but without specifying the memory
>> - * transaction attributes to be used.
>> - */
>> +void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>> +                             hwaddr paddr, MemTxAttrs attrs, int prot,
>> +                             int mmu_idx, target_ulong size)
>> +{
>> +    CPUTLBEntryFull full = {
>> +        .phys_addr = paddr,
>> +        .attrs = attrs,
>> +        .prot = prot,
>> +        .lg_page_size = ctz64(size)
>> +    };
>> +
>> +    assert(is_power_of_2(size));
> 
> I'm hitting this assert with embedded RISC-V machines using PMP
> 
> What's happening is that I'm going through riscv_cpu_tlb_fill() for a
> single stage machine mode (no MMU) lookup. This calls
> get_physical_address_pmp(), which then calls pmp_is_range_in_tlb() to
> determine the tlb size.
> 
> That ends up in pmp_get_tlb_size() with
> 
> pmp_sa: 0x10004abc
> pmp_ea: 0x1000ffff
> tlb_sa: 0x10004000
> tlb_ea: 0x10004fff
> 
> So we take the:
> 
>      if (pmp_sa >= tlb_sa && pmp_sa <= tlb_ea && pmp_ea >= tlb_ea) {
>          return tlb_ea - pmp_sa + 1;
>      }
> 
> path and return 1348 (0x544) for the tlb size, which isn't a multiple of 2.
> 
> Any ideas of what to do here?

Ah.  Well, this is less than TARGET_PAGE_SIZE, and any value less than that is not cached 
in the tlb (but is used for the one translation), so you can "round down" to 1.  Which is 
what Arm does for all of its sub-page-size translations.

For pmp, I would expect any value above TARGET_PAGE_SIZE, would just clamp to 
TARGET_PAGE_SIZE, since anything above T_P_S starts triggering large-page overflushing 
logic in the softmmu, which you don't need, since I expect there is no per-page tlb flush 
instruction that affects PMP, only changes to the system registers.


r~


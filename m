Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9438450A83B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:40:29 +0200 (CEST)
Received: from localhost ([::1]:59168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbjA-0007pw-KI
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhbdD-0003vs-FF
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:34:19 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhbdB-0004fb-KR
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:34:19 -0400
Received: by mail-pg1-x532.google.com with SMTP id g9so5334789pgc.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 11:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=erzgzmps/0ecRkzT0Fuy/nKO/oUmSPiH+r9lpEdELAc=;
 b=GTlf8uyVlmSXKRs16WR7vrSzdV0fwQ1W0zp7B47QvWVZlW5iSBFlpfhQ5/dsJJf3uR
 Q0q0qxhtiWawNcolvwaU0JF/czFbdhMTmmaToL57m5+jFyL9uINs2imU3BrAlDP3FHKW
 ssth8wmSRBy9uMCf/KY/se09Edf1c5KIM7B+gIvl/aWSXPhqBTk2i086fEf4GNjPj/Og
 1R3qGb1YzeVO7Y5qcFAanE91TCzffvB6ncAXs0nSaLGKCP1qNM2PQ//N8lWxsfDpfOGS
 iu6SMmxoopu9peiYi58pFZ4VFxHvfxE6R62qQHet6a8WASDNtQ0AFdL0weBvXLRZE1s/
 CJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=erzgzmps/0ecRkzT0Fuy/nKO/oUmSPiH+r9lpEdELAc=;
 b=IL9MaUmYEUOIaXqSY/xSxrHdgX53hLELT355SuZjniozq8b3U17yjJkSTw2T45Q8yh
 iTnjhP90KvmJg4IwTob3Kg8MHOBOCf06QfXorKCgf8i00WOpGxhQQBoKfQgDBGXa02Wt
 o70MYXGtirNAcKFU0kFZtt13vPnsaKMAMAB8fJDbn/pGftR7V/cwCLebqjKjJQaNKXZS
 sB2YDh9JzrDLRY7xHAnEWY94h5YnuecMXKR4cdh0dFztwOncJBKaz7NrZLTVWS4yQzBe
 a20uz1p/bZcxpwvqunzhhhbLLcJZTQtnUnRwDfnWejuZJ6Azw8tE/IZ1mmKYmXemqVQg
 WjOA==
X-Gm-Message-State: AOAM5325jGI4D2hgnxtte3NDc7KEr8Cdar5BPSbIDLBJzKXLjtfv482e
 8eh/RytpPY+MaZSkhDQm1E0j0AwYFjdANA==
X-Google-Smtp-Source: ABdhPJxDIkuilMlliZcZq1PUWKcvrDRvOOUStDWhl0qMqBZN3nqV1ClHT3ZvOBuRxtg1gJHncNKU4g==
X-Received: by 2002:a05:6a00:198b:b0:50a:90fd:59f8 with SMTP id
 d11-20020a056a00198b00b0050a90fd59f8mr1072039pfl.22.1650566055943; 
 Thu, 21 Apr 2022 11:34:15 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09?
 ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a17090a2e0d00b001cd4989feebsm3577453pjd.55.2022.04.21.11.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 11:34:15 -0700 (PDT)
Message-ID: <a0b4cf61-24f3-27ae-9800-a9b4d718d0d9@linaro.org>
Date: Thu, 21 Apr 2022 11:34:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] accel/tcg: Assert mmu_idx in range before use in cputlb
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220401170813.318609-1-richard.henderson@linaro.org>
In-Reply-To: <20220401170813.318609-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.

On 4/1/22 10:08, Richard Henderson wrote:
> Coverity reports out-of-bound accesses within cputlb.c.
> This should be a false positive due to how the index is
> decoded from MemOpIdx.  To be fair, nothing is checking
> the correct bounds during encoding either.
> 
> Assert index in range before use, both to catch user errors
> and to pacify static analysis.
> 
> Fixes: Coverity CID 1487120, 1487127, 1487170, 1487196, 1487215, 1487238
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cputlb.c | 40 +++++++++++++++++++++++++++-------------
>   1 file changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index dd45e0467b..f90f4312ea 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1761,7 +1761,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>                                  MemOpIdx oi, int size, int prot,
>                                  uintptr_t retaddr)
>   {
> -    size_t mmu_idx = get_mmuidx(oi);
> +    uintptr_t mmu_idx = get_mmuidx(oi);
>       MemOp mop = get_memop(oi);
>       int a_bits = get_alignment_bits(mop);
>       uintptr_t index;
> @@ -1769,6 +1769,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>       target_ulong tlb_addr;
>       void *hostaddr;
>   
> +    tcg_debug_assert(mmu_idx < NB_MMU_MODES);
> +
>       /* Adjust the given return address.  */
>       retaddr -= GETPC_ADJ;
>   
> @@ -1908,18 +1910,20 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
>               uintptr_t retaddr, MemOp op, bool code_read,
>               FullLoadHelper *full_load)
>   {
> -    uintptr_t mmu_idx = get_mmuidx(oi);
> -    uintptr_t index = tlb_index(env, mmu_idx, addr);
> -    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
> -    target_ulong tlb_addr = code_read ? entry->addr_code : entry->addr_read;
>       const size_t tlb_off = code_read ?
>           offsetof(CPUTLBEntry, addr_code) : offsetof(CPUTLBEntry, addr_read);
>       const MMUAccessType access_type =
>           code_read ? MMU_INST_FETCH : MMU_DATA_LOAD;
> -    unsigned a_bits = get_alignment_bits(get_memop(oi));
> +    const unsigned a_bits = get_alignment_bits(get_memop(oi));
> +    const size_t size = memop_size(op);
> +    uintptr_t mmu_idx = get_mmuidx(oi);
> +    uintptr_t index;
> +    CPUTLBEntry *entry;
> +    target_ulong tlb_addr;
>       void *haddr;
>       uint64_t res;
> -    size_t size = memop_size(op);
> +
> +    tcg_debug_assert(mmu_idx < NB_MMU_MODES);
>   
>       /* Handle CPU specific unaligned behaviour */
>       if (addr & ((1 << a_bits) - 1)) {
> @@ -1927,6 +1931,10 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
>                                mmu_idx, retaddr);
>       }
>   
> +    index = tlb_index(env, mmu_idx, addr);
> +    entry = tlb_entry(env, mmu_idx, addr);
> +    tlb_addr = code_read ? entry->addr_code : entry->addr_read;
> +
>       /* If the TLB entry is for a different page, reload and try again.  */
>       if (!tlb_hit(tlb_addr, addr)) {
>           if (!victim_tlb_hit(env, mmu_idx, index, tlb_off,
> @@ -2310,14 +2318,16 @@ static inline void QEMU_ALWAYS_INLINE
>   store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
>                MemOpIdx oi, uintptr_t retaddr, MemOp op)
>   {
> -    uintptr_t mmu_idx = get_mmuidx(oi);
> -    uintptr_t index = tlb_index(env, mmu_idx, addr);
> -    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
> -    target_ulong tlb_addr = tlb_addr_write(entry);
>       const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
> -    unsigned a_bits = get_alignment_bits(get_memop(oi));
> +    const unsigned a_bits = get_alignment_bits(get_memop(oi));
> +    const size_t size = memop_size(op);
> +    uintptr_t mmu_idx = get_mmuidx(oi);
> +    uintptr_t index;
> +    CPUTLBEntry *entry;
> +    target_ulong tlb_addr;
>       void *haddr;
> -    size_t size = memop_size(op);
> +
> +    tcg_debug_assert(mmu_idx < NB_MMU_MODES);
>   
>       /* Handle CPU specific unaligned behaviour */
>       if (addr & ((1 << a_bits) - 1)) {
> @@ -2325,6 +2335,10 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
>                                mmu_idx, retaddr);
>       }
>   
> +    index = tlb_index(env, mmu_idx, addr);
> +    entry = tlb_entry(env, mmu_idx, addr);
> +    tlb_addr = tlb_addr_write(entry);
> +
>       /* If the TLB entry is for a different page, reload and try again.  */
>       if (!tlb_hit(tlb_addr, addr)) {
>           if (!victim_tlb_hit(env, mmu_idx, index, tlb_off,



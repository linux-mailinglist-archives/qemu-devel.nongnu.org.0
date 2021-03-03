Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A0D32BA3D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:41:00 +0100 (CET)
Received: from localhost ([::1]:48916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHXMg-0003r3-NE
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHXLN-0003Mn-PM
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:39:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHXLK-0006ca-9K
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614800372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0QOeeXsyr2REXQU5GP+L3t6It24NXzM6ndSQ52RciZw=;
 b=V4L6tBLSDvvRcwfEcu4pfWaA7wcjPpADwbTlFZiuVkqll7PtvmUTh3/m0CiIUuE9QsVwqu
 JHeMc8sNdTz9+OAzt4tRVrm3CVBz76GRaVqD5uFu6VSV7MOBxOf1RZaVAn5kSNFChRL6Da
 8Q1M/MVy0p80jfewhNYRE0a0XFalGdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-htkwmhiYOLmoHBbz5XEvJg-1; Wed, 03 Mar 2021 14:39:30 -0500
X-MC-Unique: htkwmhiYOLmoHBbz5XEvJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F2FC427C5;
 Wed,  3 Mar 2021 19:39:28 +0000 (UTC)
Received: from [10.36.112.28] (ovpn-112-28.ams2.redhat.com [10.36.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85BD210016DB;
 Wed,  3 Mar 2021 19:39:26 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210303132850.459687-1-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG condition-code-option
 bit
Message-ID: <c938bfb6-7322-1738-8492-972b83cb7c99@redhat.com>
Date: Wed, 3 Mar 2021 20:39:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303132850.459687-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.03.21 14:28, Thomas Huth wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> If the CCO bit is set, MVPG should not generate an exception but
> report page translation faults via a CC code.
> 
> Create a new helper, access_prepare_nf, which can use probe_access_flags
> in non-faulting mode, and then handle watchpoints.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [thuth: Added logic to still inject protection exceptions]
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v4: Add logic to inject protection exceptions if necessary
> 
>   target/s390x/cpu.h         |  3 ++
>   target/s390x/excp_helper.c |  3 ++
>   target/s390x/mem_helper.c  | 93 ++++++++++++++++++++++++++++----------
>   3 files changed, 76 insertions(+), 23 deletions(-)
> 
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 60d434d5ed..825503c6c0 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -114,6 +114,9 @@ struct CPUS390XState {
>   
>       uint64_t diag318_info;
>   

Should we start wrapping that stuff into #ifdef CONFIG_TCG ?

> +    uint64_t tlb_fill_tec;   /* translation exception code during tlb_fill */
> +    int tlb_fill_exc;        /* exception number seen during tlb_fill */
> +
>       /* Fields up to this point are cleared by a CPU reset */
>       struct {} end_reset_fields;
>   
> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
> index ce16af394b..c48cd6b46f 100644
> --- a/target/s390x/excp_helper.c
> +++ b/target/s390x/excp_helper.c
> @@ -164,6 +164,9 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>           tec = 0; /* unused */
>       }
>   
> +    env->tlb_fill_exc = excp;
> +    env->tlb_fill_tec = tec;
> +

Just what I had in mind.

>       if (!excp) {
>           qemu_log_mask(CPU_LOG_MMU,
>                         "%s: set tlb %" PRIx64 " -> %" PRIx64 " (%x)\n",
> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
> index 25cfede806..cf741541d3 100644
> --- a/target/s390x/mem_helper.c
> +++ b/target/s390x/mem_helper.c
> @@ -130,28 +130,62 @@ typedef struct S390Access {
>       int mmu_idx;
>   } S390Access;
>   
> +static bool access_prepare_nf(S390Access *access, CPUS390XState *env,
> +                              bool nofault, vaddr vaddr1, int size,
> +                              MMUAccessType access_type,
> +                              int mmu_idx, uintptr_t ra)
> +{
> +    void *haddr1, *haddr2 = NULL;
> +    int size1, size2;
> +    vaddr vaddr2 = 0;
> +    int flags;
> +
> +    assert(size > 0 && size <= 4096);
> +
> +    size1 = MIN(size, -(vaddr1 | TARGET_PAGE_MASK)),
> +    size2 = size - size1;
> +
> +    flags = probe_access_flags(env, vaddr1, access_type, mmu_idx,
> +                               nofault, &haddr1, ra);
> +    if (unlikely(size2)) {
> +        /* The access crosses page boundaries. */
> +        vaddr2 = wrap_address(env, vaddr1 + size1);
> +        flags |= probe_access_flags(env, vaddr2, access_type, mmu_idx,
> +                                    nofault, &haddr2, ra);
> +    }
> +
> +    if (unlikely(flags & TLB_INVALID_MASK)) {
> +        return false;

^ I recall PAGE_WRITE_INV handling where we immediately set 
TLB_INVALID_MASK again on write access (to handle low-address protection 
cleanly). I suspect that TLB_INVALID_MASK will be set in that case (I 
could be wrong, though).

What certainly would work is checking for "haddr != NULL".

/* Don't rely on TLB_INVALID_MASK - see PAGE_WRITE_INV handling. */
if (unlikely(!haddr1)) {
	return false;
}

> +    }
> +    if (unlikely(flags & TLB_WATCHPOINT)) {
> +        /* S390 does not presently use transaction attributes. */
> +        cpu_check_watchpoint(env_cpu(env), vaddr1, size,
> +                             MEMTXATTRS_UNSPECIFIED,
> +                             (access_type == MMU_DATA_STORE
> +                              ? BP_MEM_WRITE : BP_MEM_READ), ra);
> +    }
> +

[...]

>   /* Helper to handle memset on a single page. */
> @@ -845,8 +879,10 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
>       const int mmu_idx = cpu_mmu_index(env, false);
>       const bool f = extract64(r0, 11, 1);
>       const bool s = extract64(r0, 10, 1);
> +    const bool cco = extract64(r0, 8, 1);
>       uintptr_t ra = GETPC();
>       S390Access srca, desta;
> +    bool ok;
>   
>       if ((f && s) || extract64(r0, 12, 4)) {
>           tcg_s390_program_interrupt(env, PGM_SPECIFICATION, GETPC());
> @@ -858,13 +894,24 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
>       /*
>        * TODO:
>        * - Access key handling
> -     * - CC-option with surpression of page-translation exceptions
>        * - Store r1/r2 register identifiers at real location 162
>        */
> -    srca = access_prepare(env, r2, TARGET_PAGE_SIZE, MMU_DATA_LOAD, mmu_idx,
> -                          ra);
> -    desta = access_prepare(env, r1, TARGET_PAGE_SIZE, MMU_DATA_STORE, mmu_idx,
> -                           ra);
> +    ok = access_prepare_nf(&srca, env, cco, r2, TARGET_PAGE_SIZE,
> +                           MMU_DATA_LOAD, mmu_idx, ra);
> +    if (!ok) {
> +        return 2;
> +    }
> +    ok = access_prepare_nf(&desta, env, cco, r1, TARGET_PAGE_SIZE,
> +                           MMU_DATA_STORE, mmu_idx, ra);
> +    if (!ok) {
> +        if (env->tlb_fill_exc == PGM_PROTECTION) {
> +            stq_phys(env_cpu(env)->as,
> +                     env->psa + offsetof(LowCore, trans_exc_code),
> +                     env->tlb_fill_tec);
> +            tcg_s390_program_interrupt(env, PGM_PROTECTION, ra);
> +        }
> +        return 1;
> +    }
>       access_memmove(env, &desta, &srca, ra);
>       return 0; /* data moved */
>   }
> 

Apart from that, looks good to me.

-- 
Thanks,

David / dhildenb



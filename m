Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099203379B4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:42:45 +0100 (CET)
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOOZ-00005B-RD
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lKO9U-0006cS-E0
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:27:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lKO9P-000613-8L
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615480022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+F8pF2j2ki1mIn/oldXTb1EJpokv68LugYoCRCeSo8=;
 b=ZSYH1vSfOwOh9c4YQmPSsN6Vd9vr1EDWDTBoRUphLgVDcg5i7pQtgjf6KNqD1aecw73Rk8
 J/4qRzdI4SNs19u7nkkn1qALGIlWTW5VDWyXgp4vHiwbAc+pskfEPQwM4YUi3l6VxZ2b75
 yU3K6RthsiNBJp7qXg8R9yWEsJK/0q4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-Bg-_qVO7PSyts_pzUXbINw-1; Thu, 11 Mar 2021 11:27:00 -0500
X-MC-Unique: Bg-_qVO7PSyts_pzUXbINw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CB011015C86;
 Thu, 11 Mar 2021 16:26:59 +0000 (UTC)
Received: from [10.36.115.26] (ovpn-115-26.ams2.redhat.com [10.36.115.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53F3210013D6;
 Thu, 11 Mar 2021 16:26:58 +0000 (UTC)
Subject: Re: [PATCH v5 2/2] target/s390x: Store r1/r2 for page-translation
 exceptions during MVPG
To: qemu-devel@nongnu.org
References: <20210311161747.129834-1-david@redhat.com>
 <20210311161747.129834-3-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <79a33419-2290-af39-b7ae-7b86717ed210@redhat.com>
Date: Thu, 11 Mar 2021 17:26:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311161747.129834-3-david@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.03.21 17:17, David Hildenbrand wrote:
> The PoP states:
> 
>      When EDAT-1 does not apply, and a program interruption due to a
>      page-translation exception is recognized by the MOVE PAGE
>      instruction, the contents of the R1 field of the instruction are
>      stored in bit positions 0-3 of location 162, and the contents of
>      the R2 field are stored in bit positions 4-7.
> 
>      If [...] an ASCE-type, region-first-translation,
>      region-second-translation, region-third-translation, or
>      segment-translation exception was recognized, the contents of
>      location 162 are unpredictable.
> 
> So we have to write r1/r2 into the lowcore on page-translation
> exceptions. Simply handle all exceptions inside our mvpg helper now.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/helper.h      |  2 +-
>   target/s390x/insn-data.def |  2 +-
>   target/s390x/mem_helper.c  | 44 ++++++++++++++++++++++----------------
>   target/s390x/translate.c   |  7 +++++-
>   4 files changed, 34 insertions(+), 21 deletions(-)
> 
> diff --git a/target/s390x/helper.h b/target/s390x/helper.h
> index 55bd1551e6..d4e4f3388f 100644
> --- a/target/s390x/helper.h
> +++ b/target/s390x/helper.h
> @@ -18,7 +18,7 @@ DEF_HELPER_3(srstu, void, env, i32, i32)
>   DEF_HELPER_4(clst, i64, env, i64, i64, i64)
>   DEF_HELPER_FLAGS_4(mvn, TCG_CALL_NO_WG, void, env, i32, i64, i64)
>   DEF_HELPER_FLAGS_4(mvo, TCG_CALL_NO_WG, void, env, i32, i64, i64)
> -DEF_HELPER_FLAGS_4(mvpg, TCG_CALL_NO_WG, i32, env, i64, i64, i64)
> +DEF_HELPER_FLAGS_4(mvpg, TCG_CALL_NO_WG, i32, env, i64, i32, i32)
>   DEF_HELPER_FLAGS_4(mvz, TCG_CALL_NO_WG, void, env, i32, i64, i64)
>   DEF_HELPER_3(mvst, i32, env, i32, i32)
>   DEF_HELPER_4(ex, void, env, i32, i64, i64)
> diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
> index e5b6efabf3..0bb1886a2e 100644
> --- a/target/s390x/insn-data.def
> +++ b/target/s390x/insn-data.def
> @@ -641,7 +641,7 @@
>   /* MOVE NUMERICS */
>       C(0xd100, MVN,     SS_a,  Z,   la1, a2, 0, 0, mvn, 0)
>   /* MOVE PAGE */
> -    C(0xb254, MVPG,    RRE,   Z,   r1_o, r2_o, 0, 0, mvpg, 0)
> +    C(0xb254, MVPG,    RRE,   Z,   0, 0, 0, 0, mvpg, 0)
>   /* MOVE STRING */
>       C(0xb255, MVST,    RRE,   Z,   0, 0, 0, 0, mvst, 0)
>   /* MOVE WITH OPTIONAL SPECIFICATION */
> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
> index ebb55884c9..432c1a4954 100644
> --- a/target/s390x/mem_helper.c
> +++ b/target/s390x/mem_helper.c
> @@ -905,8 +905,10 @@ uint64_t HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
>   }
>   
>   /* move page */
> -uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
> +uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint32_t r1, uint32_t r2)
>   {
> +    const uint64_t src = get_address(env, r2) & TARGET_PAGE_MASK;
> +    const uint64_t dst = get_address(env, r1) & TARGET_PAGE_MASK;
>       const int mmu_idx = cpu_mmu_index(env, false);
>       const bool f = extract64(r0, 11, 1);
>       const bool s = extract64(r0, 10, 1);
> @@ -919,34 +921,40 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
>           tcg_s390_program_interrupt(env, PGM_SPECIFICATION, GETPC());
>       }
>   
> -    r1 = wrap_address(env, r1 & TARGET_PAGE_MASK);
> -    r2 = wrap_address(env, r2 & TARGET_PAGE_MASK);
> -
>       /*
> -     * TODO:
> -     * - Access key handling
> -     * - Store r1/r2 register identifiers at real location 162
> +     * We always manually handle exceptions such that we can properly store
> +     * r1/r2 to the lowcore on page-translation exceptions.
> +     *
> +     * TODO: Access key handling
>        */
> -    exc = access_prepare_nf(&srca, env, cco, r2, TARGET_PAGE_SIZE,
> +    exc = access_prepare_nf(&srca, env, true, src, TARGET_PAGE_SIZE,
>                               MMU_DATA_LOAD, mmu_idx, ra);
>       if (exc) {
> -        return 2;
> +        if (cco) {
> +            return 2;
> +        }
> +        goto inject_exc;
>       }
> -    exc = access_prepare_nf(&desta, env, cco, r1, TARGET_PAGE_SIZE,
> +    exc = access_prepare_nf(&desta, env, true, dst, TARGET_PAGE_SIZE,
>                               MMU_DATA_STORE, mmu_idx, ra);
>       if (exc) {
> -#if !defined(CONFIG_USER_ONLY)
> -        if (exc == PGM_PROTECTION) {
> -            stq_phys(env_cpu(env)->as,
> -                     env->psa + offsetof(LowCore, trans_exc_code),
> -                     env->tlb_fill_tec);
> -            tcg_s390_program_interrupt(env, PGM_PROTECTION, ra);
> +        if (cco && exc != PGM_PROTECTION) {
> +            return 1;
>           }
> -#endif
> -        return 1;
> +        goto inject_exc;
>       }
>       access_memmove(env, &desta, &srca, ra);
>       return 0; /* data moved */
> +inject_exc:
> +#if !defined(CONFIG_USER_ONLY)
> +    stq_phys(env_cpu(env)->as, env->psa + offsetof(LowCore, trans_exc_code),
> +             env->tlb_fill_tec);

Just realized, we want a

if (exc != PGM_ADDRESSING) {

for this case. But let's hear other feedback first :)


-- 
Thanks,

David / dhildenb



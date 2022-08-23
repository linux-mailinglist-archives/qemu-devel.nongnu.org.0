Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7889D59D695
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:22:28 +0200 (CEST)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQ79-00065K-FH
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQQ4Y-0003yX-DE
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 05:19:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQQ4U-0004J7-RH
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 05:19:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661246382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7aXotZZwyUZA2DPwhWVZz8iU1/YYUbuZecYCGoNKZ8Y=;
 b=gq8GzyxkiOOJpk8vO5A/fNpMEZLflzbcCgZD51eOz6Cs7GmoeHwwcfD7l6tvMgNoNTH4Jh
 lno5c8f11I26HarKq90/5XRppo9ACOuFTY667EYkw/S9Va8nnpcnXPLiiWxNNNwbMhQiVI
 /q+bcy8TtXsh8IP0oDVIB6C2DgftKxA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-b_s1AoZLOym06rZ8PSBmoA-1; Tue, 23 Aug 2022 05:19:40 -0400
X-MC-Unique: b_s1AoZLOym06rZ8PSBmoA-1
Received: by mail-wm1-f71.google.com with SMTP id
 p19-20020a05600c1d9300b003a5c3141365so9974293wms.9
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 02:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=7aXotZZwyUZA2DPwhWVZz8iU1/YYUbuZecYCGoNKZ8Y=;
 b=Yqa3nB4abBMT5VYmTJUqPmgLm5EgNqIuoPJmF1TMtnFlwmd9Y/qL92bxlTKSlvxOwM
 tjoCGGO147WZPRh1lh/fc9xVFP8X08XOr6dpA59S706jcOedgalDZyK9RmeCX/OIsl6/
 tRj8NSMTNuTysEMhF42NamXDMVLAqEEmEqRIo8U4JKct3jpxkEW0nBf2RrS39Hc7wlqd
 yaxygCbdxGzIyKzat5l/BPAUihOY6QAhjVmg24q4X4Vs9LBOPfjWpQAjqE8/J3yckM9D
 kbjy/9+cfuQtXyNmOHBXx47vb5ncSAHu4ruKabtmZeDouuLb/q0DlEcxzZ0inlUYrMH0
 jEZg==
X-Gm-Message-State: ACgBeo2I4N6TrGaIGVvrAjTdC6rvKk9DjgSPpohg2xZjONP4aj39WF+R
 VVYkbaI3uu8rK3ONA2wyZrWnLy7j5xdJLhhDYEU6QuO2SLx6wNDuytmK3Au/A86KAOD6hcjLgHN
 s9gvOZ4qEAhCjKq8=
X-Received: by 2002:a5d:53c1:0:b0:225:30e2:29db with SMTP id
 a1-20020a5d53c1000000b0022530e229dbmr12278178wrw.667.1661246379373; 
 Tue, 23 Aug 2022 02:19:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ANPOF1Agt63sybwiDtBysix3fF0NIHQlbK3kE2DsLtWo4Hf9QKjRd75X1vY1JaLHEX8v5cA==
X-Received: by 2002:a5d:53c1:0:b0:225:30e2:29db with SMTP id
 a1-20020a5d53c1000000b0022530e229dbmr12278152wrw.667.1661246378952; 
 Tue, 23 Aug 2022 02:19:38 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:1600:c48b:1fab:a330:5182?
 (p200300cbc70b1600c48b1faba3305182.dip0.t-ipconnect.de.
 [2003:cb:c70b:1600:c48b:1fab:a330:5182])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c35c600b003a626055569sm17561325wmq.16.2022.08.23.02.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 02:19:38 -0700 (PDT)
Message-ID: <104a0560-e1ca-1aca-1ed5-07a00ee74240@redhat.com>
Date: Tue, 23 Aug 2022 11:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, eduardo@habkost.net
References: <20220822235803.1729290-1-richard.henderson@linaro.org>
 <20220822235803.1729290-4-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 03/14] accel/tcg: Suppress auto-invalidate in
 probe_access_internal
In-Reply-To: <20220822235803.1729290-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 23.08.22 01:57, Richard Henderson wrote:
> When PAGE_WRITE_INV is set when calling tlb_set_page,
> we immediately set TLB_INVALID_MASK in order to force
> tlb_fill to be called on the next lookup.  Here in
> probe_access_internal, we have just called tlb_fill
> and eliminated true misses, thus the lookup must be valid.
> 
> This allows us to remove a warning comment from s390x.
> There doesn't seem to be a reason to change the code though.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c            | 10 +++++++++-
>  target/s390x/tcg/mem_helper.c |  4 ----
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 1509df96b4..5359113e8d 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1602,6 +1602,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>      }
>      tlb_addr = tlb_read_ofs(entry, elt_ofs);
>  
> +    flags = TLB_FLAGS_MASK;
>      page_addr = addr & TARGET_PAGE_MASK;
>      if (!tlb_hit_page(tlb_addr, page_addr)) {
>          if (!victim_tlb_hit(env, mmu_idx, index, elt_ofs, page_addr)) {
> @@ -1617,10 +1618,17 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>  
>              /* TLB resize via tlb_fill may have moved the entry.  */
>              entry = tlb_entry(env, mmu_idx, addr);
> +
> +            /*
> +             * With PAGE_WRITE_INV, we set TLB_INVALID_MASK immediately,
> +             * to force the next access through tlb_fill.  We've just
> +             * called tlb_fill, so we know that this entry *is* valid.
> +             */
> +            flags &= ~TLB_INVALID_MASK;
>          }
>          tlb_addr = tlb_read_ofs(entry, elt_ofs);
>      }
> -    flags = tlb_addr & TLB_FLAGS_MASK;
> +    flags &= tlb_addr;
>  
>      /* Fold all "mmio-like" bits into TLB_MMIO.  This is not RAM.  */
>      if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY))) {
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index fc52aa128b..3758b9e688 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -148,10 +148,6 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
>  #else
>      int flags;
>  
> -    /*
> -     * For !CONFIG_USER_ONLY, we cannot rely on TLB_INVALID_MASK or haddr==NULL
> -     * to detect if there was an exception during tlb_fill().
> -     */

Yeah, that was primarily only a comment that we rely on tlb_fill_exc to
obtain the exact PGM_* value -- and at the same time use it to detect if
there was an exception at all.

>      env->tlb_fill_exc = 0;
>      flags = probe_access_flags(env, addr, access_type, mmu_idx, nonfault, phost,
>                                 ra);


Change itself looks good to me.


However, it's been a while since I stared at this code, but I wonder how
the CONFIG_USER_ONLY path is correct.

1) s390_probe_access() documents to "With nonfault=1, return the PGM_
exception that would have been injected into the guest; return 0 if no
exception was detected."

But in case of CONFIG_USER_ONLY, we return the flags returned by
s390_probe_access(), not a PGM__* value. Maybe it doesn't matter,
because we'll simply inject a SIGSEGV in any case ...

I'd have assume that we have to check here if there was an exception in
a similar way, and detect the actual type. As the old comment indicates,
we can either
* check for *phost == NULL
* flags having TLB_INVALID_MASK set

... and I wonder if we really care about the exception type for
CONFIG_USER_ONLY at all.


2) s390_probe_access() documents that for "CONFIG_USER_ONLY, the
faulting address is stored to env->__excp_addr.".

However, that's only set in s390_cpu_record_sigsegv(). With nonfault=1
that will never actually trigger, right?



I assume db9aab5783a2 ("target/s390x: Use probe_access_flags in
s390_probe_access") might have introduced both. We had a flag conversion
to PGM_ in there and stored env->__excp_addr:

flags = page_get_flags(addr);
if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ :
    PAGE_WRITE_ORG))) {
    env->__excp_addr = addr;
    flags = (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_ADDRESSING;
    if (nonfault) {
        return flags;
    }



-- 
Thanks,

David / dhildenb



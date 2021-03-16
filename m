Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE2033DC99
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 19:31:42 +0100 (CET)
Received: from localhost ([::1]:40648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMETj-0003tY-Sq
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 14:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lME8l-0005vr-O5
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:10:00 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:39730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lME8c-0004NE-Ns
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:09:59 -0400
Received: by mail-qk1-x732.google.com with SMTP id g185so36196043qkf.6
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 11:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5MT0O/YGi+MPoR64DU7rJuFuq6M626tu9cdgYzBXatY=;
 b=ECff8z5pW61l6FnC/sklUbqjoZO9xnVELwPw3hDmHNw0Vtye5SX3JMkODz3ASdu7cX
 NyxZOloT/AnpYfHiCNswn+bCtNeSfaeCs+qhT2LmBZouSOcWOnLctoWzrfXiwkCWeT0J
 6UwoZRRLoOtzZUaQOYzQtSWoiRdrw8yNwGdqsGCSVx5qabOf9VWBeCgzZDaQsMm2b24o
 g7PcGk8cwqM23YfS+/51p2QnCFBVms9skas/JanNUz+Fcwor1op+n4HvMo52tJzN0pap
 yLvKIQTwPuB45Sv/uIR25/Z8wPd2oDMS0rAl7EGLfeaREtJKCzVHKqRNIKFSxPYFcxiH
 vFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5MT0O/YGi+MPoR64DU7rJuFuq6M626tu9cdgYzBXatY=;
 b=B2NW/k4yODypX8tv7Mj2Xuv8OBalkukyjnB6N3Dmr3jPzIf2asxvT9406M1AhGBajl
 r/nzVF5ycvn/5LvS+f29myvsnZE+t2UIzmcLcfeuRoqsyq2SuKBC/VCDk9jauJf79jsF
 2zAk/b9bv1THf4qbZON8gqfrUToFTWiAUOhrkWU9uWWwUdSJLkZExaXoq16jDrh3ZbR0
 vpTRZF+8nHESfRzSCECZrk9q7Gnjs2Z0VgYEWXzWiHw6p/7BUBElkJESnrhIUm7uf4XY
 v3y+AdZFAs2C+yAG12ZLwrjcor2exIdf+lsszdZqHCsboKTb+EgRpVQeUDPZPvj7Rs7E
 23mQ==
X-Gm-Message-State: AOAM532kfJeJGTbXAabGm3C+qMcrlPsV/pgMlXuxoTYq72mWla6eTulw
 LSXXEKwOdCyn3clmCiteCDjl6bSYNfXlDY+S
X-Google-Smtp-Source: ABdhPJycXHNLU7kjRST/mhNteWaS5Xs1XCj4yeowI6cNeFKZHomGG4ODc0wEvBsNIpb4jQiy3bKW5g==
X-Received: by 2002:a37:6485:: with SMTP id y127mr346881qkb.174.1615918189251; 
 Tue, 16 Mar 2021 11:09:49 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b22sm15807852qkk.45.2021.03.16.11.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 11:09:48 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Rebecca Cran <rebecca@nuviainc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210316154910.25804-1-rebecca@nuviainc.com>
 <20210316154910.25804-2-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8124cf7a-1634-7232-465a-172aeec47d07@linaro.org>
Date: Tue, 16 Mar 2021 12:09:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210316154910.25804-2-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 9:49 AM, Rebecca Cran wrote:
> +    for (page = addr; page < (addr + length); page += TARGET_PAGE_SIZE) {

This test means that it's impossible to flush the last page of the address 
space (addr + length == 0).  I think better to do

   for (l = 0; l < length; l += TARGET_PAGE_SIZE)
       page = addr + l;
       ...

> +        for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
> +            if ((idxmap >> mmu_idx) & 1) {
> +                tlb_flush_page_bits_locked(env, mmu_idx, page, bits);

Hmm.  I'm not keen on this.  You're not able to notice the special cases 
within, where we flush the entire tlb -- and therefore you do not need to 
continue the outer loop for this mmuidx.

> +                tb_flush_jmp_cache(cpu, page);

This does not need to be in the mmuidx loop.  But since above means that the 
mmuidx loop should be the outer loop, this would go in a separate page loop by 
itself.

> +void tlb_flush_page_range_bits_by_mmuidx(CPUState *cpu,
> +                                         target_ulong addr,
> +                                         target_ulong length,
> +                                         uint16_t idxmap,
> +                                         unsigned bits)
> +{
> +    TLBFlushPageRangeBitsByMMUIdxData d;
> +    TLBFlushPageRangeBitsByMMUIdxData *p;
> +
> +    /* This should already be page aligned */
> +    addr &= TARGET_PAGE_BITS;
> +
> +    /* If all bits are significant, this devolves to tlb_flush_page. */
> +    if (bits >= TARGET_LONG_BITS) {
> +        tlb_flush_page_by_mmuidx(cpu, addr, idxmap);
> +        return;
> +    }

This case is incorrect.

The cputlb changes should have remained a separate patch.

> @@ -4759,6 +4759,241 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                                     ARMMMUIdxBit_SE3, bits);
>   }
>   
> +#ifdef TARGET_AARCH64
> +static uint64_t tlbi_aa64_range_get_length(CPUARMState *env,
> +                                           uint64_t value)
> +{
> +    unsigned int page_size;
> +    unsigned int page_size_granule;
> +    uint64_t num;
> +    uint64_t scale;
> +    uint64_t exponent;
> +    uint64_t length;
> +
> +    num = extract64(value, 39, 4);
> +    scale = extract64(value, 44, 2);
> +    page_size_granule = extract64(value, 46, 2);
> +
> +    switch (page_size_granule) {
> +    case 1:
> +      page_size = 4096;

Indentation is off?

> +      break;
> +    case 2:
> +      page_size = 16384;
> +      break;
> +    case 3:
> +      page_size = 65536;

You might as well have this as page_shift = {12,14,16}, or perhaps page_shift = 
page_size_granule * 2 + 10 instead of the full switch.

> +    exponent = (5 * scale) + 1;
> +    length = ((num + 1) << exponent) * page_size;

   length = (num + 1) << (exponent + page_shift);

> +    mask = vae1_tlbmask(env);
> +    if (regime_has_2_ranges(mask)) {

You can't pass in mask.

All of the mmuidx will have the same form, so ctz32(mask) would pick out the 
mmuidx for the first bit.

> +    if (regime_has_2_ranges(secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2)) {

again.  Only this time we know that E2 & SE2 have one range.  Only (S)EL1&0 and 
(S)EL2&0 have two ranges.

> +    if (regime_has_2_ranges(ARMMMUIdxBit_SE3)) {

Likewise, E3 has only one range.


r~


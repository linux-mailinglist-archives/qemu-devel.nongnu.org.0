Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C18E37733D
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 18:40:53 +0200 (CEST)
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfQ0Z-0004FG-E5
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 12:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfPzQ-0003BB-GI
 for qemu-devel@nongnu.org; Sat, 08 May 2021 12:39:40 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfPzN-0006Tz-Dt
 for qemu-devel@nongnu.org; Sat, 08 May 2021 12:39:40 -0400
Received: by mail-pg1-x532.google.com with SMTP id i14so9757138pgk.5
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 09:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KaDh9U24z9oRPqJJH7iC8nCqeSqygL1w8Wfb9a9XXSs=;
 b=PIWCcm1R62BX+XIYdYHLEe39Ff/jIUhyCqRiMenAsWfrpfQEgHjO73gilRoeGmui2g
 nIvfQuDblkjN9WAIuoyEnCEf48LBNcM3E3nRTD6FMKSc1fCl1HekPjjRabCT+CsD8aHV
 Wx4sGYLYa7n48kXj5YDezgNo6kV5pGE5lYh5PvgHg/rhLjGSlKCvJJ2OVfbviPrnuH+g
 JMg+SZvZuLWZ4BHt4lXhnWe2uQgTxtdoXD/mBQ3DJYs1pQGdNtqxSPztyB7C4qCicSYu
 nlu5X0HP/R0MgExirN+75jDk54LmbpfsEWAmBUVDHiZ5p+sIk4YY6xd8QmrawRV0nKvw
 gzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KaDh9U24z9oRPqJJH7iC8nCqeSqygL1w8Wfb9a9XXSs=;
 b=kiUb49APh/PYlel0RO0ORDDeY+/lfqhSOy/WByTERIWW/DSO2LnEK0QbZW5N3Ww0z4
 tfTp3ruJ9sZw8G5D5yKXQP+NpUJe6KKViGB+prOiaxpJ1ijcKo3rFc1gSJ8eij4blOOg
 TNrZK58nbAdxnJxLm81aOC9d2e3722N6ItWddAKGd4fP1ku+KfLARwXZKBh3YEG+nfVT
 zKdsDBLzPspdLbSrF0flExnWbXL5QIAKRG4hCtK3iGP8ytmQPKwIqyy05/mfbwFLSEiV
 C/84ewU3fI+AbR8Sp/uD+2u9Xep1pjnciHXdQunEoykxgUPVbfefVIqxgjJZ4W/EOBg/
 TMJA==
X-Gm-Message-State: AOAM530gvLmDytRvHK14ft852C0bz7YhP5Mvx8lhYn1tCvjERjrcoZnN
 q5v/uaZQUS66YLLTSfk8dX/F9Q==
X-Google-Smtp-Source: ABdhPJzl1d6spJbnFcTWsJ7xdPw8XkKDoFyVjgbWQW3O5Vwib0PFlhvQ2RnzJ7OXDDA6eGEOhI/s0g==
X-Received: by 2002:a63:5a43:: with SMTP id k3mr15987405pgm.308.1620491975809; 
 Sat, 08 May 2021 09:39:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id b13sm7823717pjl.38.2021.05.08.09.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 May 2021 09:39:35 -0700 (PDT)
Subject: Re: [PATCH v8 2/4] target/arm: Add support for FEAT_TLBIRANGE
To: Rebecca Cran <rebecca@nuviainc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210505030443.25310-1-rebecca@nuviainc.com>
 <20210505030443.25310-3-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4e9c32f-7812-1ed8-37a0-60612bda7c52@linaro.org>
Date: Sat, 8 May 2021 09:39:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505030443.25310-3-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 8:04 PM, Rebecca Cran wrote:
> +static uint64_t tlbi_aa64_range_get_length(CPUARMState *env,
> +                                           uint64_t value)
> +{
> +    unsigned int page_shift;
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
> +    page_shift = page_size_granule * 2 + 10;

Should be + 12, for the sequence 12, 14, 16 (4k, 16k, 64k).

> +static void tlbi_aa64_rvae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                  uint64_t value)
> +{
> +    /*
> +     * Invalidate by VA range, EL1&0.
> +     * Currently handles all of RVAE1, RVAAE1, RVAALE1 and RVALE1,
> +     * since we don't support flush-for-specific-ASID-only or
> +     * flush-last-level-only.
> +     */
> +    ARMMMUIdx mmu_idx;
> +    int mask;
> +    int bits;
> +    uint64_t pageaddr;
> +    uint64_t length;
> +
> +    CPUState *cs = env_cpu(env);
> +    mask = vae1_tlbmask(env);
> +    mmu_idx = ARM_MMU_IDX_A | ctz32(mask);
> +    if (regime_has_2_ranges(mmu_idx)) {
> +        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
> +    } else {
> +        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
> +    }

Let's extract the base address via a helper as well.  Add

   /* TODO: ARMv8.7 FEAT_LPA2 */

as that will change the extracted base address.

I think there's enough replicated between these functions to want a common 
function.  Something like

static void do_rvae_write(CPUARMState *env, uint64_t value,
                           int idxmap, bool synced)
{
     ARMMMUIdx one_idx = ARM_MMU_IDX_A | ctz32(idxmap);
     bool two_ranges = regime_has_2_ranges(one_idx);
     uint64_t baseaddr, length;
     int bits;

     baseaddr = tlbi_aa64_range_get_base(env, value, two_ranges);
     length = tlb_aa64_range_get_length(env, value);
     bits = tlbbits_for_regime(env, one_idx, baseaddr);

     if (synced) {
         tlb_flush_range_by_mmuidx_all_cpus_synced(...);
     } else {
         tlb_flush_range_by_mmuidx(...);
     }
}

static void tlbi_aa64_rvae1_write(...)
{
     do_rvae_write(env, value, vae1_tlbmask(env),
                   tlb_force_broadcast(env));
}

static void tlbi_aa64_rvae1is_write(...)
{
     do_rvae_write(env, value, vae1_tlbmask(env), true);
}

static int vae2_tlbmask(CPUARMState *env)
{
     return (arm_is_secure_below_el3(env)
             ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2);
}

static void tlbi_aa64_rvae2_write(...)
{
     do_rvae_write(env, value, vae2_tlbmask(env),
                   tlb_force_broadcast(env));
}

static void tlbi_aa64_rvae2is_write(...)
{
     do_rvae_write(env, value, vae2_tlbmask(env), true);
}

static void tlbi_aa64_rvae3_write(...)
{
     do_rvae_write(env, value, ARMMMUIdxBit_SE3,
                   tlb_force_broadcast(env));
}

static void tlbi_aa64_rvae3is_write(...)
{
     do_rvae_write(env, value, ARMMMUIdxBit_SE3, true);
}


r~


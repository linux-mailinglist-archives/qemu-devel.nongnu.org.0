Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F47769276B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 20:50:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQZOp-0002GJ-PO; Fri, 10 Feb 2023 14:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQZOo-0002G9-Fs
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 14:49:34 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQZOm-00032I-3k
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 14:49:34 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so11030608pjq.0
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 11:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QAaKHUL5/K4AWMd7yIpsN6lMrAsxy9enfdkkiYwDE/E=;
 b=nkXazfLo8TsTZykzhpLiIOgI3RG1KiT+DPxST6ssFNto5/b5gwVAgMNTWZccnAZPFk
 MAin9xVV/qL17dtp1+dkMR57P5bGpHofiBPnc35LZg5X5VrlkzSG6VfQUIAZJtshWkMS
 yai5rkSWHTYz0np39uI1YjrAXofx7a3ChAB0YSLZnt6KjYUXXIXwXS6wp1m3MBZ+C1xn
 SeKCSqH1m8tlVgRvX++s4dWkUX6F6X666l3P6aHIdALHowus0X5nqXf9TQVVWvdtonr7
 ieliWV0p/dGMY0SOEGWcPEaGdlG3oyAG3BPNJDPiA/8ijefa1P7Gcr9QE/BVeGjMgNNS
 H2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QAaKHUL5/K4AWMd7yIpsN6lMrAsxy9enfdkkiYwDE/E=;
 b=cE2lHLFiCtbLcq8YhbSj/2so++4Ms3P3pi3bbgFafK3DwVoLFoWXjwMKsyu2uRHzAF
 +K1HouFeGWPhcSgkPh6BTJfepSBFdWwWISMzXn2cO9EbpgygZ/udLGy+r8Uto1KUitLW
 D68/IsSqemStFDjCbFJqK7Vz1QfRPSeRfPJCG3aty2bsF6PRoGUS+guBoSjASJSQZBTf
 WTYcfmCFRyN8BEvgaGPtGypwB/N1Pl9YbkkxDpzweMAxIVuO47cJe5QSMkKN3bKSrdXU
 z1kE6ElH/6n1H+I6wVQ9WFOZ68c33Nj8KJASKgRWrmbzJ3eLxe9NqhLTNMUZ/WXvlagb
 NKDQ==
X-Gm-Message-State: AO0yUKVx8aQYNbYtxJn1CPx/4Iw3cx1vxefN9U/FvO0ofP8S/9G0SEf/
 HM7OfxwliuYjDXzZ+N9pDKUovg==
X-Google-Smtp-Source: AK7set/XCHFML9FI67TQRG3vr9GsSUgpKyUq8iXmSvisOgfT0U3ki9GP+bKU/j4LnvNx2ZAe3+X56A==
X-Received: by 2002:a17:90b:3b87:b0:230:9f49:4335 with SMTP id
 pc7-20020a17090b3b8700b002309f494335mr17715448pjb.11.1676058570167; 
 Fri, 10 Feb 2023 11:49:30 -0800 (PST)
Received: from [172.20.101.43] (rrcs-74-87-59-235.west.biz.rr.com.
 [74.87.59.235]) by smtp.gmail.com with ESMTPSA id
 y5-20020a17090a134500b0023317104415sm1413037pjf.17.2023.02.10.11.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 11:49:29 -0800 (PST)
Message-ID: <858e9f86-672c-9be3-1826-0267b43969b1@linaro.org>
Date: Fri, 10 Feb 2023 09:49:13 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 12/22] target/arm: NSTable is RES0 for the RME EL3 regime
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com,
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-13-richard.henderson@linaro.org>
 <CAFEAcA_wApEJEweyoGc_oSmyt6xcTKKRPW1X8xYkFO3agjS8jA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_wApEJEweyoGc_oSmyt6xcTKKRPW1X8xYkFO3agjS8jA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/10/23 01:36, Peter Maydell wrote:
> On Tue, 24 Jan 2023 at 00:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Test in_space instead of in_secure so that we don't switch
>> out of Root space.  Handle the output space change immediately,
>> rather than try and combine the NSTable and NS bits later.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/ptw.c | 31 ++++++++++++++-----------------
>>   1 file changed, 14 insertions(+), 17 deletions(-)
>>
>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>> index c1b0b8e610..ddafb1f329 100644
>> --- a/target/arm/ptw.c
>> +++ b/target/arm/ptw.c
>> @@ -1240,7 +1240,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>>   {
>>       ARMCPU *cpu = env_archcpu(env);
>>       ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
>> -    bool is_secure = ptw->in_secure;
>>       int32_t level;
>>       ARMVAParameters param;
>>       uint64_t ttbr;
>> @@ -1256,7 +1255,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>>       uint64_t descaddrmask;
>>       bool aarch64 = arm_el_is_aa64(env, el);
>>       uint64_t descriptor, new_descriptor;
>> -    bool nstable;
>>
>>       /* TODO: This code does not support shareability levels. */
>>       if (aarch64) {
>> @@ -1417,29 +1415,29 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>>           descaddrmask = MAKE_64BIT_MASK(0, 40);
>>       }
>>       descaddrmask &= ~indexmask_grainsize;
>> -
>> -    /*
>> -     * Secure accesses start with the page table in secure memory and
>> -     * can be downgraded to non-secure at any step. Non-secure accesses
>> -     * remain non-secure. We implement this by just ORing in the NSTable/NS
>> -     * bits at each step.
>> -     */
>> -    tableattrs = is_secure ? 0 : (1 << 4);
>> +    tableattrs = 0;
>>
>>    next_level:
>>       descaddr |= (address >> (stride * (4 - level))) & indexmask;
>>       descaddr &= ~7ULL;
>> -    nstable = extract32(tableattrs, 4, 1);
>> -    if (nstable && ptw->in_secure) {
>> -        /*
>> -         * Stage2_S -> Stage2 or Phys_S -> Phys_NS
>> -         * Assert that the non-secure idx are even, and relative order.
>> -         */
>> +
>> +    /*
>> +     * Process the NSTable bit from the previous level.  This changes
>> +     * the table address space and the output space from Secure to
>> +     * NonSecure.  With RME, the EL3 translation regime does not change
>> +     * from Root to NonSecure.
>> +     */
> 
> To check my understanding, this means that the bit that the spec
> describes as FEAT_RME changing the behaviour of NSTable in the EL3
> stage 1 translation regime is implemented by us by having the
> in_space for EL3 be different for FEAT_RME and not-FEAT_RME ?

Correct -- space is Secure for non-RME EL3, and Root for RME EL3.

>>       attrs = new_descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
>>       if (!regime_is_stage2(mmu_idx)) {
>> -        attrs |= nstable << 5; /* NS */
> 
> This removes the code where we copy the NSTable bit across to attrs,
> but there's still code below here that assumes it can get the combined
> NS bit from bit 5 of attrs, isn't there? (It passes it to get_S1prot().)

Oops.  This gets fixed in patch 14.  Some reordering needed...


r~



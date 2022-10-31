Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ECE614170
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 00:16:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opdzL-0003wk-P2; Mon, 31 Oct 2022 19:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opdzJ-0003wQ-Ur
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 19:14:37 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opdzI-00020B-1A
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 19:14:37 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso1199932wme.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 16:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z92IlSwtsY8kX5401VVjb3wGalOot0UMc5CJy2tuvAg=;
 b=dpQ0+PldY2IcvuLIalyR4qzhNYyIOiiOV9MzNb9pXqp1mlAaxXB7klrd6P/AU1UZmK
 rUbzJWxFhONFG/+FIU0xd+HAvV2tldJ/oi3zfhs0jlXnITRnRv10ZI3hGkiMz8umgI0t
 qYVQLnNSLI8e5je9smj0esoElriX1V8C7Hw8Rt3ysFqMutq6GphFA6T0IOO165TdKMD8
 iX4E16gIIgVZriO8A5+BU+TC6AN8eyj2JUwNhmScK1hHXpLBWdRxTvlZkYSZTlPPKUHj
 liFD2OpjboYg2IIenBm7ympn7kWGd7CZuqTKfo1nvH5XRd3eFS3uawAJ+E6PRsGQ7KPq
 y9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z92IlSwtsY8kX5401VVjb3wGalOot0UMc5CJy2tuvAg=;
 b=JWrb2GYFsJa3Ln0QLwwo8kWHQq8dYnLCxvZICW6CZHFUgCP2cyRJkRtrbcYzmXrho9
 qNY3l9O8W99FI8X8QXucjlfqg/gdulO0MupvscAHMcphtq15ojwhilBw/lhjo4pp467F
 FoADMBIZ4g4I6gWEloxxCCXrTu5uQS2yyaywZGt1PfWPeRyPqKemkFL52Efo0XAS7Laz
 f2opwb/UurZNNLDTheNNNhwMru7maY8arbKJELjsByBWDy2zhW4UW/iKsXBSLkxUQx/j
 TE0DIMRqb34VV1a5egJboQX2CPR1dHQ4PqDyibnF7PT530eXX/UhscjEFVLwxZ4B5ge7
 TLCg==
X-Gm-Message-State: ACrzQf1aDkXdefgfP998696BFdno9gA0yw1Fe8cCb7zGEVS4/TMTKWWq
 CyzBk03BXyDkNqb75lA/sFIB+g==
X-Google-Smtp-Source: AMsMyM5G1cExDhcZSXM1kXbG+UaLBJuRUo1eVqBPqpkhTUDWjksXfiLbpJ+mlwnbvHTE2Ac7jhnthA==
X-Received: by 2002:a05:600c:a4c:b0:3b4:fc1b:81 with SMTP id
 c12-20020a05600c0a4c00b003b4fc1b0081mr9616134wmq.125.1667258074169; 
 Mon, 31 Oct 2022 16:14:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k36-20020a05600c1ca400b003b47b80cec3sm8899623wms.42.2022.10.31.16.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 16:14:33 -0700 (PDT)
Message-ID: <2a7722fc-fd5c-709b-b7d5-2ccafb82b363@linaro.org>
Date: Tue, 1 Nov 2022 00:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PULL 08/30] target/arm: Add ptw_idx to S1Translate
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
 <20221025163952.4131046-9-peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221025163952.4131046-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 25/10/22 18:39, Peter Maydell wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Hoist the computation of the mmu_idx for the ptw up to
> get_phys_addr_with_struct and get_phys_addr_twostage.
> This removes the duplicate check for stage2 disabled
> from the middle of the walk, performing it only once.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Message-id: 20221024051851.3074715-3-richard.henderson@linaro.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 71 ++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 54 insertions(+), 17 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 32d64125865..3c153f68318 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -17,6 +17,7 @@
>   
>   typedef struct S1Translate {
>       ARMMMUIdx in_mmu_idx;
> +    ARMMMUIdx in_ptw_idx;
>       bool in_secure;
>       bool in_debug;
>       bool out_secure;
> @@ -214,33 +215,24 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
>   {
>       bool is_secure = ptw->in_secure;
>       ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
> -    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
> -    bool s2_phys = false;
> +    ARMMMUIdx s2_mmu_idx = ptw->in_ptw_idx;
>       uint8_t pte_attrs;
>       bool pte_secure;
>   
> -    if (!arm_mmu_idx_is_stage1_of_2(mmu_idx)
> -        || regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
> -        s2_mmu_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
> -        s2_phys = true;
> -    }
> -
>       if (unlikely(ptw->in_debug)) {
>           /*
>            * From gdbstub, do not use softmmu so that we don't modify the
>            * state of the cpu at all, including softmmu tlb contents.
>            */
> -        if (s2_phys) {
> -            ptw->out_phys = addr;
> -            pte_attrs = 0;
> -            pte_secure = is_secure;
> -        } else {
> +        if (regime_is_stage2(s2_mmu_idx)) {
>               S1Translate s2ptw = {
>                   .in_mmu_idx = s2_mmu_idx,
> +                .in_ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS,
>                   .in_secure = is_secure,
>                   .in_debug = true,
>               };
>               GetPhysAddrResult s2 = { };
> +
>               if (!get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
>                                       false, &s2, fi)) {
>                   goto fail;
> @@ -248,6 +240,11 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
>               ptw->out_phys = s2.f.phys_addr;
>               pte_attrs = s2.cacheattrs.attrs;
>               pte_secure = s2.f.attrs.secure;
> +        } else {
> +            /* Regime is physical. */
> +            ptw->out_phys = addr;
> +            pte_attrs = 0;
> +            pte_secure = is_secure;
>           }
>           ptw->out_host = NULL;
>       } else {
> @@ -268,7 +265,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
>           pte_secure = full->attrs.secure;
>       }
>   
> -    if (!s2_phys) {
> +    if (regime_is_stage2(s2_mmu_idx)) {
>           uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
>   
>           if ((hcr & HCR_PTW) && S2_attrs_are_device(hcr, pte_attrs)) {
> @@ -1263,7 +1260,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>           descaddr |= (address >> (stride * (4 - level))) & indexmask;
>           descaddr &= ~7ULL;
>           nstable = extract32(tableattrs, 4, 1);
> -        ptw->in_secure = !nstable;
> +        if (!nstable) {
> +            /*
> +             * Stage2_S -> Stage2 or Phys_S -> Phys_NS
> +             * Assert that the non-secure idx are even, and relative order.
> +             */
> +            QEMU_BUILD_BUG_ON((ARMMMUIdx_Phys_NS & 1) != 0);
> +            QEMU_BUILD_BUG_ON((ARMMMUIdx_Stage2 & 1) != 0);
> +            QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS + 1 != ARMMMUIdx_Phys_S);
> +            QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2 + 1 != ARMMMUIdx_Stage2_S);
> +            ptw->in_ptw_idx &= ~1;
> +            ptw->in_secure = false;
> +        }
>           descriptor = arm_ldq_ptw(env, ptw, descaddr, fi);
>           if (fi->type != ARMFault_None) {
>               goto do_fault;
> @@ -2449,6 +2457,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>   
>       is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
>       ptw->in_mmu_idx = s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
> +    ptw->in_ptw_idx = s2walk_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
>       ptw->in_secure = s2walk_secure;
>   
>       /*
> @@ -2508,10 +2517,32 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>                                         ARMMMUFaultInfo *fi)
>   {
>       ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
> -    ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
>       bool is_secure = ptw->in_secure;
> +    ARMMMUIdx s1_mmu_idx;
>   
> -    if (mmu_idx != s1_mmu_idx) {
> +    switch (mmu_idx) {
> +    case ARMMMUIdx_Phys_S:
> +    case ARMMMUIdx_Phys_NS:
> +        /* Checking Phys early avoids special casing later vs regime_el. */
> +        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
> +                                      is_secure, result, fi);
> +
> +    case ARMMMUIdx_Stage1_E0:
> +    case ARMMMUIdx_Stage1_E1:
> +    case ARMMMUIdx_Stage1_E1_PAN:
> +        /* First stage lookup uses second stage for ptw. */
> +        ptw->in_ptw_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
> +        break;
> +
> +    case ARMMMUIdx_E10_0:
> +        s1_mmu_idx = ARMMMUIdx_Stage1_E0;
> +        goto do_twostage;
> +    case ARMMMUIdx_E10_1:
> +        s1_mmu_idx = ARMMMUIdx_Stage1_E1;
> +        goto do_twostage;
> +    case ARMMMUIdx_E10_1_PAN:
> +        s1_mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
> +    do_twostage:
>           /*
>            * Call ourselves recursively to do the stage 1 and then stage 2
>            * translations if mmu_idx is a two-stage regime, and EL2 present.
> @@ -2522,6 +2553,12 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>               return get_phys_addr_twostage(env, ptw, address, access_type,
>                                             result, fi);
>           }
> +        /* fall through */
> +
> +    default:
> +        /* Single stage and second stage uses physical for ptw. */
> +        ptw->in_ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
> +        break;
>       }

Since this commit I can not boot Trusted Firmware on the SBSA-ref machine.

--- ok  2022-10-31 23:11:48.131829719 +0000
+++ bad 2022-10-31 23:11:27.210091574 +0000
@@ -176,68 +176,68 @@
-IN:
-0x000000003fcd4b14:
-OBJD-T: 030000d4
-
-Taking exception 13 [Secure Monitor Call] on CPU 0
-...from EL1 to EL3
-...with ESR 0x17/0x5e000000
-...with ELR 0x3fcd4b18
-...to EL3 PC 0x3400 PSTATE 0x3cd
+Taking exception 3 [Prefetch Abort] on CPU 0
+...from EL3 to EL3
+...with ESR 0x21/0x86000004
+...with FAR 0x28b8
+...with ELR 0x28b8
+...to EL3 PC 0x3000 PSTATE 0x3cd


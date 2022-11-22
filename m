Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E24063436A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:14:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxXli-0005RS-NR; Tue, 22 Nov 2022 13:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxXlZ-0005Qa-Ce
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:13:06 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxXl0-0001V5-KF
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:13:04 -0500
Received: by mail-pl1-x631.google.com with SMTP id w23so14407769ply.12
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 10:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J8sLl/B+4PLgUSKja6GGZ2RRje+SPCnCFmyUi1rWG3Y=;
 b=QXTJWjidrCVGUY0s0cSLnhqLKsPJWQI/XvN0BPhrezPXHB/l06Bp78KWl5rsCtLPdS
 j3I1KmUZQyxGKXpOY5I5byMrRzrAwLoO/uK9+H0WowdEcXFCmeEmNYxoOHzHquAKW3Et
 Eu7ib4TU8vvtQKsVR669wWoAQV6OybrAx/pIOX+wSdM9tVg5sK3uWkRrlIThqzghdOFS
 J56fEPD2gxv3O2A/f7IJvV0Q9UnZ5QqT/uvLkfJWLRvL6ZqBoJIFUV//2hX4EOST+CGD
 Mo7K32ek7WE5MFyXHzUSqYzD00qakzZzggHl6+0lE/OuqpVeMV1jajkyPlhS4uluek3r
 9uLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J8sLl/B+4PLgUSKja6GGZ2RRje+SPCnCFmyUi1rWG3Y=;
 b=lvinCRaewq+4+fCvrVT6ksokrZtQwKaF/Df2hbSEXgm4ZHJB91P8j70S0ed4cbhviU
 8V/3Axj6D6OOJu2BRDJtbJIbjteo72Z9hi8pGE2IDcCP9utyjNt+kdQ47ZbIgSRkwh0+
 yihnW0wXl/ktr8CrHtApwhaHBcuuirm9YKVRLHaEtxMGz2Ywj8rcnHcXcy4aMoTZud+B
 dLo6DJwc46OOh5tkj5HpkGQDODQME4fpWGwlb6X29Rl8AV31BPSKe4h9scO/UiLOvdfn
 FVM3lrpZR4OCndhIY6nyrw/bBvp32Yvm0GUG6zv9M60TkOyraSOTf7B1DqGt/goeaZO1
 Yo+w==
X-Gm-Message-State: ANoB5plbL4uKodFhsLYYzcdtjUxlnkVqwPVmv800ZatNB/RErkpOTsZN
 Y2ffVhraOCShLGFPD0OLObvlbA==
X-Google-Smtp-Source: AA0mqf7a32KNSMkc3XjDfXGK0pMzD1FQ28R2Xx7KZJkAaJyMQuzM2StlIdwZzn3oDQhARbuO1/vlUA==
X-Received: by 2002:a17:903:d1:b0:186:8376:209f with SMTP id
 x17-20020a17090300d100b001868376209fmr10639381plc.161.1669140749216; 
 Tue, 22 Nov 2022 10:12:29 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:90f5:6f8b:e78a:4a0?
 ([2602:47:d48a:1201:90f5:6f8b:e78a:4a0])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a62a10e000000b00571f66721aesm10916054pff.42.2022.11.22.10.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 10:12:28 -0800 (PST)
Message-ID: <713de12d-e13f-a061-0019-93e6758fdaa5@linaro.org>
Date: Tue, 22 Nov 2022 10:12:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/arm: align exposed ID registers with Linux
Content-Language: en-US
To: Zhuojia Shen <chaosdefinition@hotmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <DS7PR12MB6309CF26249A273C1E2A6AAAAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <DS7PR12MB6309CF26249A273C1E2A6AAAAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/21/22 18:48, Zhuojia Shen wrote:
> In CPUID registers exposed to userspace, some registers were missing
> and some fields were not exposed.  This patch aligns exposed ID
> registers and their fields with what Linux exposes currently.
> 
> Specifically, the following new ID registers/fields are exposed to
> userspace:
> 
> ID_AA64PFR1_EL1.BT:       bits 3-0
> ID_AA64PFR1_EL1.MTE:      bits 11-8
> ID_AA64PFR1_EL1.SME:      bits 27-24
> 
> ID_AA64ZFR0_EL1.SVEver:   bits 3-0
> ID_AA64ZFR0_EL1.AES:      bits 7-4
> ID_AA64ZFR0_EL1.BitPerm:  bits 19-16
> ID_AA64ZFR0_EL1.BF16:     bits 23-20
> ID_AA64ZFR0_EL1.SHA3:     bits 35-32
> ID_AA64ZFR0_EL1.SM4:      bits 43-40
> ID_AA64ZFR0_EL1.I8MM:     bits 47-44
> ID_AA64ZFR0_EL1.F32MM:    bits 55-52
> ID_AA64ZFR0_EL1.F64MM:    bits 59-56
> 
> ID_AA64SMFR0_EL1.F32F32:  bit 32
> ID_AA64SMFR0_EL1.B16F32:  bit 34
> ID_AA64SMFR0_EL1.F16F32:  bit 35
> ID_AA64SMFR0_EL1.I8I32:   bits 39-36
> ID_AA64SMFR0_EL1.F64F64:  bit 48
> ID_AA64SMFR0_EL1.I16I64:  bits 55-52
> ID_AA64SMFR0_EL1.FA64:    bit 63
> 
> ID_AA64MMFR0_EL1.ECV:     bits 63-60
> 
> ID_AA64MMFR1_EL1.AFP:     bits 47-44
> 
> ID_AA64MMFR2_EL1.AT:      bits 35-32
> 
> ID_AA64ISAR0_EL1.RNDR:    bits 63-60
> 
> ID_AA64ISAR1_EL1.FRINTTS: bits 35-32
> ID_AA64ISAR1_EL1.BF16:    bits 47-44
> ID_AA64ISAR1_EL1.DGH:     bits 51-48
> ID_AA64ISAR1_EL1.I8MM:    bits 55-52
> 
> ID_AA64ISAR2_EL1.WFxT:    bits 3-0
> ID_AA64ISAR2_EL1.RPRES:   bits 7-4
> ID_AA64ISAR2_EL1.GPA3:    bits 11-8
> ID_AA64ISAR2_EL1.APA3:    bits 15-12
> 
> Signed-off-by: Zhuojia Shen <chaosdefinition@hotmail.com>
> ---
>   target/arm/helper.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d8c8223ec3..ce6fd7a96d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7826,13 +7826,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                 .exported_bits = 0x000f000f00ff0000,
>                 .fixed_bits    = 0x0000000000000011 },
>               { .name = "ID_AA64PFR1_EL1",
> -              .exported_bits = 0x00000000000000f0 },
> +              .exported_bits = 0x000000000f000fff },

Existing, but I think it would be nicer to do this symbolically.  e.g.

    .exported_bits = R_ID_AA64PFR1_BT_MASK |
                     R_ID_AA64PFR1_SBSS_MASK |
                     R_ID_AA64PFR1_MTE_MASK |
                     R_ID_AA64PFR1_SME_MASK,

etc.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F086D3566
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 05:36:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pioVW-0001NJ-EC; Sat, 01 Apr 2023 23:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pioVT-0001Mu-TO
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 23:35:51 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pioVR-0001Dg-MC
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 23:35:51 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso29396605pjb.3
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 20:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680406548;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rHudBHCiF+JjDHG3Th/Vau7yXcE+T1ArOGjSDvt/hC4=;
 b=rcEv1DlUybRmPi/xYHTdWDI69JOauUSvb2vRk6Ve10hBnNZjSVwNT54/E9YRIeZZ9B
 YN4AGmIFhF0ARXmNthfuLYLW/Ucg+DUmqav6v8XlUpHaI5ks9UbEH+CND9SwJnSdPG3F
 H88RXjT0COeWvcSu2qgH3wakcnXC7Y89yJZvvdMchpxHm3rsj7tI6iiWchasb0UNff0c
 kkcTEVu+6LVtHyR630pzeGIWAyV3uVg8dRp/5QXSH1Mxffh0QOh8JWwvFXwfj+lEHHw2
 QMy8DfMejvcBwF0zUTy1m53KEoTr00wSK718ircoYcAcw7SI3TniJsdOLfJUhx84Enpb
 3IQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680406548;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rHudBHCiF+JjDHG3Th/Vau7yXcE+T1ArOGjSDvt/hC4=;
 b=H0tteWRq/aJUOCPnfVNcHKBplU8R9VOvNMn4qsgAI2LLrS66wAf1TlIC0iNrlFHZUR
 ZDcRy0k1uRF8E94dkKhgBNosFB/+P4Gp3UnGYOJb0xH4FFegpTH7RLRwc8zzjML0dtgH
 Zw6lKXLAT0P42J7JTGdn3ow3OMBow5uLEVioqYGwgMtHNzro7qRRVxBfdxh0QrBfZ9d3
 zvpY9Pf7/p+P4PPFs4Evb/3tl3jjKOxkWtMJf7wvGrBvk/GlTanL22NCQxycrgwce+L9
 RqcMkpRryRpYxQ3WSYnXx1H4ePdJcUuDi8Ke5hxeVusEG1WvIwY2cv1m3Uq7kShPRFxR
 V5rg==
X-Gm-Message-State: AO0yUKUQ1FxVcMkxD41ibS2qr5NnU0unDO97p6TuQKrohDLyz4ydeWI8
 M3Os/IR8uq8Ytd7Qi/j9ljV66hhqceer3NNVFCg=
X-Google-Smtp-Source: AK7set8GuQe3mDdOcimXzCGKjNBpETt3JGbZwlJpo0nYVujH17avcCrKYPeNbsA/0OF++5MqzPMQEw==
X-Received: by 2002:a05:6a20:3ba3:b0:cb:af96:ace7 with SMTP id
 b35-20020a056a203ba300b000cbaf96ace7mr30229242pzh.46.1680406548133; 
 Sat, 01 Apr 2023 20:35:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:f30a:3ab0:889f:f03d?
 ([2602:ae:1541:f901:f30a:3ab0:889f:f03d])
 by smtp.gmail.com with ESMTPSA id
 e22-20020aa78256000000b00625cfe645ddsm4282627pfn.2.2023.04.01.20.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 20:35:47 -0700 (PDT)
Message-ID: <7bf403ab-7258-bedb-e8dc-36f20d31c303@linaro.org>
Date: Sat, 1 Apr 2023 20:35:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 31/44] target/loongarch: Implement vpcnt
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-32-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-32-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 3/27/23 20:06, Song Gao wrote:
> +static uint64_t do_vpcnt(uint64_t u1)
> +{
> +    u1 = (u1 & 0x5555555555555555ULL) + ((u1 >>  1) & 0x5555555555555555ULL);
> +    u1 = (u1 & 0x3333333333333333ULL) + ((u1 >>  2) & 0x3333333333333333ULL);
> +    u1 = (u1 & 0x0F0F0F0F0F0F0F0FULL) + ((u1 >>  4) & 0x0F0F0F0F0F0F0F0FULL);
> +    u1 = (u1 & 0x00FF00FF00FF00FFULL) + ((u1 >>  8) & 0x00FF00FF00FF00FFULL);
> +    u1 = (u1 & 0x0000FFFF0000FFFFULL) + ((u1 >> 16) & 0x0000FFFF0000FFFFULL);
> +    u1 = (u1 & 0x00000000FFFFFFFFULL) + ((u1 >> 32));
> +
> +    return u1;
> +}
> +
> +#define VPCNT(NAME, BIT, E, T)                                      \
> +void HELPER(NAME)(CPULoongArchState *env, uint32_t vd, uint32_t vj) \
> +{                                                                   \
> +    int i;                                                          \
> +    VReg *Vd = &(env->fpr[vd].vreg);                                \
> +    VReg *Vj = &(env->fpr[vj].vreg);                                \
> +                                                                    \
> +    for (i = 0; i < LSX_LEN/BIT; i++)                               \
> +    {                                                               \
> +        Vd->E(i) = do_vpcnt((T)Vj->E(i));                           \
> +    }                                                               \
> +}
> +
> +VPCNT(vpcnt_b, 8, B, uint8_t)
> +VPCNT(vpcnt_h, 16, H, uint16_t)
> +VPCNT(vpcnt_w, 32, W, uint32_t)
> +VPCNT(vpcnt_d, 64, D, uint64_t)

host-utils.h has ctpop{8,16,32,64}.


r~


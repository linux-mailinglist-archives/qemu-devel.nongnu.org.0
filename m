Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272476CCB5E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 22:17:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phFkv-000365-C4; Tue, 28 Mar 2023 16:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFkk-0002xW-Sy
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:17:15 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFkj-00041C-7c
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:17:10 -0400
Received: by mail-pl1-x633.google.com with SMTP id le6so12813963plb.12
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 13:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680034627;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=onAONDVj+PMK6ls5Kn07KW0FWRcupO7DPjPf3NoHqOo=;
 b=dXPZry+lrBQb2AZ15rj93+k8MT5Zzrv8aJMc4gLx6J+I62A0nJqfwwJV3NYqfgHfXF
 jcwPsFWn7HROJIMEnqghKdKYjqxlqVAfkPBXEvYwZlug+fK2joAOvAJeNvD8tPW/BpG4
 a/tOyNTa0x81tnU3/tsG91w+L7QDZB1FquTeIWi1kLdT4OR80WooRgKBMw/7wSCinT45
 JLp3hjTb+i6JbKsGJ122DeoaFN0L3avZUDxY1kNQDiFdqUqzqzdSehQAvWT75CZdmxVG
 NCmQs3zhV8biB75anLn7nGO60/M88Tmt6pfhNTGgELkYC1mlRtNZWXk2xgz+1LFBTr8z
 DEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680034627;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=onAONDVj+PMK6ls5Kn07KW0FWRcupO7DPjPf3NoHqOo=;
 b=DH/1Fyt5k5oun+YmQHyReer9nGENfIC/DOB2qJuiI0dr5Q+3Tia7BVf7idVfPlpJy3
 Vf3OVMzE2+qmie6LBVxAWHG11q1086fwLai/qzdW0wylgTlgLQ6P7Cps7LrUdfYcfhwq
 Xj4/RjyCv4L/SiGPtYR+eQBSAyP/NNWAcwrSS5G4pwOfIKObXgwqaeHT7h4uzxBGbabs
 8NgZuXh4F06RHyvRXCFTqX0nes3k5xE5w+xpBgURvC2qYl1U94a7jNjNCkBpuQAsZOCg
 RNe+0DN5crySstvkGmiGEuNHZF1dGyWdR+JUoxSM71CR1B1tjK2paTCj6CkjKMMdSOlm
 uQRQ==
X-Gm-Message-State: AO0yUKWSXFLfjoqFw9UbXzHFtkuqCXSfYCtIVRneu+lgiz+/f+tIDT72
 hdDKL9LIaXtyw4WMmuLMMlJ8+A==
X-Google-Smtp-Source: AK7set/qxmVNXnVBdTP/pp5Idu92+P85qApcFbhxu9Yv/NfOjzckrGhOJj3BXk3rDw93pIaAfAINQA==
X-Received: by 2002:a05:6a20:4d96:b0:dd:e6f5:a798 with SMTP id
 gj22-20020a056a204d9600b000dde6f5a798mr16108273pzb.6.1680034627498; 
 Tue, 28 Mar 2023 13:17:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a656445000000b004fb3e5681cesm20378636pgv.20.2023.03.28.13.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 13:17:07 -0700 (PDT)
Message-ID: <6c587ced-fcb2-f537-94c7-9612e1499f2e@linaro.org>
Date: Tue, 28 Mar 2023 13:17:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 09/44] target/loongarch: Implement vhaddw/vhsubw
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-10-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-10-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

On 3/27/23 20:05, Song Gao wrote:
> +#define DO_ODD_EVEN_S(NAME, BIT, T, E1, E2, DO_OP)                 \
> +void HELPER(NAME)(CPULoongArchState *env,                          \
> +                  uint32_t vd, uint32_t vj, uint32_t vk)           \
> +{                                                                  \
> +    int i;                                                         \
> +    VReg *Vd = &(env->fpr[vd].vreg);                               \
> +    VReg *Vj = &(env->fpr[vj].vreg);                               \
> +    VReg *Vk = &(env->fpr[vk].vreg);                               \
> +                                                                   \
> +    for (i = 0; i < LSX_LEN/BIT; i++) {                            \
> +        Vd->E1(i) = DO_OP((T)Vj->E2(2 * i + 1), (T)Vk->E2(2 * i)); \
> +    }                                                              \
> +}
...
> +#define DO_ODD_EVEN_U(NAME, BIT, TD, TS,  E1, E2, DO_OP)                     \
> +void HELPER(NAME)(CPULoongArchState *env,                                    \
> +                  uint32_t vd, uint32_t vj, uint32_t vk)                     \
> +{                                                                            \
> +    int i;                                                                   \
> +    VReg *Vd = &(env->fpr[vd].vreg);                                         \
> +    VReg *Vj = &(env->fpr[vj].vreg);                                         \
> +    VReg *Vk = &(env->fpr[vk].vreg);                                         \
> +                                                                             \
> +    for (i = 0; i < LSX_LEN/BIT; i++) {                                      \
> +        Vd->E1(i) = DO_OP((TD)(TS)Vj->E2(2 * i + 1), (TD)(TS)Vk->E2(2 * i)); \
> +    }                                                                        \
> +}

In the first case we have one cast, in the second case we have two.  I wonder if it would 
be clearer to have both signed and unsigned members in the VReg union?  Then these two 
macros could be combined.

I also think we could make use of (__typeof(Vd->E1(0))) instead of separately passing the 
output type?  It would appear to be less error-prone.

All that said, the code as written is correct so,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


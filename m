Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B8E6D55B4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 03:05:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjV5j-0005wx-2t; Mon, 03 Apr 2023 21:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjV5Z-0005w0-2V
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:03:57 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjV50-0005SC-2y
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:03:56 -0400
Received: by mail-pl1-x633.google.com with SMTP id le6so29777326plb.12
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 18:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680570199;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I79MuwzCZkQ+aoJ6sNG7czkMhwqzTSZIQsEbLMlPlUk=;
 b=XYe5j1Vf2CaU0fL6uKTGAS37B2Z3EJ12en7bhzpPRtCH1gd144o+ZnK7JaJuFTG24+
 PTuYdr+nX/JyWD38hm0QT/0jQ9nJ/Y1BApIqqMVFffKkLXuQAUetCBDoY0vmP4VLmvvs
 kOWx7Tu9Ju9ORLV/Fr+GvWpyDDkCuB1ruSI5LgpbH1v6RlI3p1zyjoijAckuPmmCiEIy
 wiCKDDNlRFXd0AdBnjw9JHwrDTIbCLu+j/zni+fB7+3Fib8Jb5fMDer1ql5Az0UYG44i
 bd1MyaDhvPDTS5TZZI/CZ0EVU4XiFLyvfYr1nMBbeix3DcS+GcoHQvhcYGlaRo3lK4+b
 As/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680570199;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I79MuwzCZkQ+aoJ6sNG7czkMhwqzTSZIQsEbLMlPlUk=;
 b=5vKtKY2WkN96zVRUvaqH70SqDiB2KIN/213orV1YSzphhwYo1QxkS7fV5pRhqM17lL
 5/uz6ujC5o+Bq//6pphgrKZ7W4pLcU/PoFJovJCVkQ5smMqpxxIbQMgmplhyDAYVh256
 54KzH8p3qXhExfQ/JqHzh6knpSxdFbOkZbqD+FxS8Lcl0xEOOxJ9STUuXF7Fkrwz3oT7
 jx29S118EbllB2KrOqKi+ekpMOgsHCz5nrKsxLTK652yLm88YE+9lA2JuJOf8hB3CnjX
 wibFf8Jav3iocKlBCm3U8JKP1jsvZ5OViiYYa5XL2+2zO0dMnpPi+4Xsbm1olgCGhnn9
 aadg==
X-Gm-Message-State: AAQBX9fl7QnPp90mpRTksWjnw4VvchQuoowL+BuAGo73koMxNfum8y0N
 Knnvlv0/Ix6lZUTD/8izQfeWfQ==
X-Google-Smtp-Source: AKy350aXLWnpbJPWMFcfYiuOZtDcemGYzjpJibdEruk+TOh/q7YNPx7eBLEgkYqogEvqH01jdnsZDw==
X-Received: by 2002:a05:6a20:304a:b0:d6:7d3a:c6e with SMTP id
 10-20020a056a20304a00b000d67d3a0c6emr510046pzx.44.1680570199205; 
 Mon, 03 Apr 2023 18:03:19 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a62b405000000b005a7c892b435sm7549419pfn.25.2023.04.03.18.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 18:03:18 -0700 (PDT)
Message-ID: <dc51342e-952c-c014-3b60-4dd751646468@linaro.org>
Date: Mon, 3 Apr 2023 18:03:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 38/44] target/loongarch: Implement vbitsel vset
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-39-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-39-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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
> +static void gen_vbitseli(unsigned vece, TCGv_vec a, TCGv_vec b, int64_t imm)
> +{
> +    TCGv_vec t;
> +
> +    t = tcg_temp_new_vec_matching(a);
> +    tcg_gen_dupi_vec(vece, t, imm);

tcg_constant_vec_matching.

> +void HELPER(vseteqz_v)(CPULoongArchState *env, uint32_t cd, uint32_t vj)
> +{
> +    VReg *Vj = &(env->fpr[vj].vreg);
> +    env->cf[cd & 0x7] = (Vj->Q(0) == 0);
> +}
> +
> +void HELPER(vsetnez_v)(CPULoongArchState *env, uint32_t cd, uint32_t vj)
> +{
> +    VReg *Vj = &(env->fpr[vj].vreg);
> +    env->cf[cd & 0x7] = (Vj->Q(0) != 0);
> +}

This is trivial inline.

> +#define SETANYEQZ(NAME, BIT, E)                                     \
> +void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
> +{                                                                   \
> +    int i;                                                          \
> +    bool ret = false;                                               \
> +    VReg *Vj = &(env->fpr[vj].vreg);                                \
> +                                                                    \
> +    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
> +        ret |= (Vj->E(i) == 0);                                     \
> +    }                                                               \
> +    env->cf[cd & 0x7] = ret;                                        \
> +}
> +SETANYEQZ(vsetanyeqz_b, 8, B)
> +SETANYEQZ(vsetanyeqz_h, 16, H)
> +SETANYEQZ(vsetanyeqz_w, 32, W)
> +SETANYEQZ(vsetanyeqz_d, 64, D)

These could be inlined, though slightly harder.
C.f. target/arm/sve_helper.c, do_match2 (your n == 0).

Anyway, leaving this as-is for now is also ok.


r~


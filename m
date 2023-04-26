Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFECD6EFC4D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 23:17:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prmUm-0001fq-3r; Wed, 26 Apr 2023 17:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prmUk-0001fT-9R
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 17:16:10 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prmUb-0000sj-M0
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 17:16:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1527so78613095e9.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 14:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682543759; x=1685135759;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kdJECu86fjshxxSf1wmKN/W4hb9TAnFxrWtaNs9wAeQ=;
 b=tml3g5QfvsySa46cjjaVZlz2Yo82K/005iB+PKGL2EHgxkCRxAWIs+NaKhm7CA04lT
 upZuWUX7jDEM0EVPmNGtPIi3Sahn+XWsembSARejWj1uB9WTCG2jRyFXGnMefe7Mr4s6
 GLhiBgm9YWK4UWX4nXjNwDdUNrz3+fx7Mtlu+/WUk7UrD6ZSZt2OaHroJSG9FbjgraI7
 kcLZIahg02ig92w4JE0BeDpukICyYdOu4ULEmrSjbGcn6NT/P9Eh511Y5wizDCcgESOO
 Me2tsEl0+F1twrsUibqCUxW4HHtyNMwdHswkAOvYuDbSeE9f0ceVo7NnS3rdwFnV2Q84
 35Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682543759; x=1685135759;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kdJECu86fjshxxSf1wmKN/W4hb9TAnFxrWtaNs9wAeQ=;
 b=UW9uf+qHBO4JFtRJ/+TakWc/7BYC7xbo5hBQnuwco2EbJ7HvN5hk16F87CQwNG+/uB
 ofbYjQpzxbdltdbIBh+iljabLfjSm4AB+QhG57kieQPR/v2bKfM+LPUHasushno5MkUd
 Q5RhAimXSrFrzVhEjPQW93xoeA4l9bd5AdvaoCQYoukSd98bcLGIbqdH5H2qD2zKFEjA
 Q5VGniwX4sCPuEMUJJUV6Q7oHZUUqO8noRi6uuwLCK7Sf4XVA2DhCdjH6+n0HAYPttO5
 X4425mJJwQTHMmDOaN9IKHdTv1lf7W59CIf/qeUkd2EoREI1JOICHSyhTzouz66rjF9G
 DU5g==
X-Gm-Message-State: AAQBX9ePoYvKePBBc08ReoQp2UYq6P3Nigg2WevNhEdyerpXFYb1cp+m
 rL34jE1BYITmOuOcHPwvDGelzQ==
X-Google-Smtp-Source: AKy350YaUVI1ahD+xf7p1aCh2RR1YbFqiANVqx3Z/p1Rh9RwOdz1w423DRdzgV1eaduCIY2VAU0i/w==
X-Received: by 2002:a1c:7716:0:b0:3f1:70d5:1bee with SMTP id
 t22-20020a1c7716000000b003f170d51beemr13581364wmi.29.1682543759551; 
 Wed, 26 Apr 2023 14:15:59 -0700 (PDT)
Received: from [192.168.5.111]
 (cpc148070-lewi21-2-0-cust450.2-4.cable.virginm.net. [82.15.53.195])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c1d0900b003f17eded97bsm22890591wms.19.2023.04.26.14.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 14:15:59 -0700 (PDT)
Message-ID: <f228e4b5-45a0-2223-6fb8-2047fbd9eb03@linaro.org>
Date: Wed, 26 Apr 2023 22:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/21] Hexagon (target/hexagon) Add overrides for
 clr[tf]new
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004137.1319051-1-tsimpson@quicinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004137.1319051-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/26/23 01:41, Taylor Simpson wrote:
> These instructions have implicit reads from p0, so we don't want
> them in helpers when idef-parser is off.
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h | 18 ++++++++++++++++++
>   target/hexagon/macros.h  |  4 ----
>   2 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
> index 7c5cb93297..5e87d1d861 100644
> --- a/target/hexagon/gen_tcg.h
> +++ b/target/hexagon/gen_tcg.h
> @@ -1097,6 +1097,24 @@
>           gen_jump(ctx, riV); \
>       } while (0)
>   
> +/* if (p0.new) r0 = #0 */
> +#define fGEN_TCG_SA1_clrtnew(SHORTCODE) \
> +    do { \
> +        TCGLabel *skip = gen_new_label(); \
> +        tcg_gen_brcondi_tl(TCG_COND_EQ, hex_new_pred_value[0], 0, skip); \
> +        tcg_gen_movi_tl(RdV, 0); \
> +        gen_set_label(skip); \
> +    } while (0)

This ought to be a movcond.

> +
> +/* if (!p0.new) r0 = #0 */
> +#define fGEN_TCG_SA1_clrfnew(SHORTCODE) \
> +    do { \
> +        TCGLabel *skip = gen_new_label(); \
> +        tcg_gen_brcondi_tl(TCG_COND_NE, hex_new_pred_value[0], 0, skip); \
> +        tcg_gen_movi_tl(RdV, 0); \
> +        gen_set_label(skip); \
> +    } while (0)

Likewise.


r~


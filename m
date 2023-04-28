Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B646F12F6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 10:05:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psJ5m-0005cc-0j; Fri, 28 Apr 2023 04:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psJ5j-0005cM-BD
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:04:31 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psJ5g-0005TR-1W
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:04:30 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-956eacbe651so1767224366b.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 01:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682669066; x=1685261066;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yvceLZaxkYMKkFztTr8GC/VrL+sjLIQG7MZiVrEsGhU=;
 b=Uot+1ctn3xUST3eRB8e3OS3u3okXbg+GivCtMVTZr9HNdUdBtcqaFeF0TjtzTmQDms
 wuiw1aVXoHHxhwcEj22c8pI8Op4d6EVfTEOi89Q8XHS9eJJ3s5jqu2ZG3RY+KzR+IwY0
 d22/rXDT3K9xMgmy/x1zMtfg3gtWuMFXl+yWmbf6JwVuOpsKPpv28VhsWEICnk30N8x2
 J/1SkcqZL32HVlN5I/Wp60t0pOUhWrvhSKo+NCJ6lXaWKSSDPUS4xde2VvPABUl2pLPt
 aBDlA/qGoeLg2DWGyeEVJ3T1BeUcAtf9ZagBjavbG1JDE/sTHoGhdvF2nAWv4Fk0f6ZZ
 pxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682669066; x=1685261066;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yvceLZaxkYMKkFztTr8GC/VrL+sjLIQG7MZiVrEsGhU=;
 b=InB8NynPOCciF4VMxcgpIqB0nalrvUA3zbn/wYNYhYFyuSLL9T7v+oigAQ4fT+M9xN
 teylGUe4LwhTT7pgAa1w2kkpEOWO3l5V8Cn7Srmh9kHNbWbfSGrrhP99B7ZxTl2oXC7E
 zvY2cH7GOz9TuXsZ1lNCN2ZIKvz14Cpa7Fb+p9LkHVm2BZi46fhKpzWI//LMMMFHLpOb
 193smAcKCKegD2uxgJk+hvlLQNsrZHQuDJbhF48gEdmQ2S+cxCpkXVWqcVWWgOZMzNLh
 f+MYUCwWXkPHT8ALUrK3t6hUbMuylqRVQuPXml/R6xcB7MqcJAoFM2WsrkFx0tjBlg/e
 +NSQ==
X-Gm-Message-State: AC+VfDxXvEyiembCFlbitVDrxMm7qRGQ3gtLh3nKIAcBnlPwZCkj+irz
 3fmUrVff4L6PtWBug7dpIB3yQNM6V+it5hNNDXS+Sw==
X-Google-Smtp-Source: ACHHUZ6U3V4rTngXuqRr8Ry4kpwurkz7LZLr93eU1peg61thl2UUsV9nYe7QFXlrEhfhYdwjNsSRyA==
X-Received: by 2002:a17:907:6d25:b0:94f:7a8:a902 with SMTP id
 sa37-20020a1709076d2500b0094f07a8a902mr4729385ejc.14.1682669066365; 
 Fri, 28 Apr 2023 01:04:26 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 tk5-20020a170907c28500b0095004c87676sm10686626ejc.199.2023.04.28.01.04.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 01:04:26 -0700 (PDT)
Message-ID: <21f16356-56f5-1968-806e-744883b4e62e@linaro.org>
Date: Fri, 28 Apr 2023 09:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 05/21] Hexagon (target/hexagon) Add overrides for
 clr[tf]new
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230427230012.3800327-1-tsimpson@quicinc.com>
 <20230427230012.3800327-6-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427230012.3800327-6-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
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

On 4/27/23 23:59, Taylor Simpson wrote:
> These instructions have implicit reads from p0, so we don't want
> them in helpers when idef-parser is off.
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h | 16 ++++++++++++++++
>   target/hexagon/macros.h  |  4 ----
>   2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
> index 7c5cb93297..f3e9c280b0 100644
> --- a/target/hexagon/gen_tcg.h
> +++ b/target/hexagon/gen_tcg.h
> @@ -1097,6 +1097,22 @@
>           gen_jump(ctx, riV); \
>       } while (0)
>   
> +/* if (p0.new) r0 = #0 */
> +#define fGEN_TCG_SA1_clrtnew(SHORTCODE) \
> +    do { \
> +        tcg_gen_movcond_tl(TCG_COND_EQ, RdV, \
> +                           hex_new_pred_value[0], tcg_constant_tl(0), \
> +                           RdV, tcg_constant_tl(0)); \
> +    } while (0)
> +
> +/* if (!p0.new) r0 = #0 */
> +#define fGEN_TCG_SA1_clrfnew(SHORTCODE) \
> +    do { \
> +        tcg_gen_movcond_tl(TCG_COND_NE, RdV, \
> +                           hex_new_pred_value[0], tcg_constant_tl(0), \
> +                           RdV, tcg_constant_tl(0)); \
> +    } while (0)
> +

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

>   #define fGEN_TCG_J2_pause(SHORTCODE) \
>       do { \
>           uiV = uiV; \
> diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
> index 3e162de3a7..2cb0647ce2 100644
> --- a/target/hexagon/macros.h
> +++ b/target/hexagon/macros.h
> @@ -227,12 +227,8 @@ static inline void gen_cancel(uint32_t slot)
>   
>   #ifdef QEMU_GENERATE
>   #define fLSBNEW(PVAL)   tcg_gen_andi_tl(LSB, (PVAL), 1)
> -#define fLSBNEW0        tcg_gen_andi_tl(LSB, hex_new_pred_value[0], 1)
> -#define fLSBNEW1        tcg_gen_andi_tl(LSB, hex_new_pred_value[1], 1)
>   #else
>   #define fLSBNEW(PVAL)   ((PVAL) & 1)
> -#define fLSBNEW0        (env->new_pred_value[0] & 1)
> -#define fLSBNEW1        (env->new_pred_value[1] & 1)
>   #endif
>   
>   #ifdef QEMU_GENERATE



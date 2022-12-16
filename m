Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AD264EF16
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:30:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Dap-00072t-0F; Fri, 16 Dec 2022 11:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Daj-00071M-Dn
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:29:45 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Dah-0002CJ-QD
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:29:45 -0500
Received: by mail-pl1-x62d.google.com with SMTP id g10so2790278plo.11
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 08:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D22KZ0tJaorPu9mnBvc/MQz6gmJfR9l5cuAq3FOn1YY=;
 b=TBEQFgztiAbaWD9+ifUwdvpNfaNb+2FZ2MD7L81VQRzvkalojbsubMUfz/HG4XEB6b
 gAqdA0tTLuEjDsKwekXUkpUCuBtoaYGNmS7rBmo8+UVj2YJgt6Aart+4lp1DxJasS4Be
 ssYAMMpTGcILziqg0A9+0u4B6/KfQRJJOd984fvlXgF3FdeFzWchBMUd6lzLLELMrXii
 udrw+6xL343ycwCiMJd58+GOWLDSaVzZucznqUHo4/I8iuNrdpYlhQBHcpYD5XurNLbK
 /wI3CzCSE+JWNxLdZ0O/OPH7yKFQxeKz7+AWa34OgzLkkRsYyqYCjMfKZjNPp39qDoiM
 tM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D22KZ0tJaorPu9mnBvc/MQz6gmJfR9l5cuAq3FOn1YY=;
 b=7wOdTKUOx/WiQPs5NPLazfsksinvdt0GIkr55yFV2wSBRhzc9TDDyUwwMuWDOytWZO
 LkOeIJSwePCHDXpPrj2N9xtmUNL2/UBTWNDMWd7gUJmAQUOT332aF3wj1DtIJ0R0tyez
 I+w5/67pSvTXtA/xRmSTtB3fEz4UeEo+3Ha7E8AY4Hh7sQ/s2gCddfivgsDtrSrlmxVu
 5VpD/e4MrxhL1pVx/54FcrA+bb93t8IUnp+HcwjrP0CTlqIraN4ZMBfNpWYSk30N/IHT
 HD8F1Krewn3lBjYkpPd8OGptPXMOdHgzbg+D/ewUenpKxSMji2gpaRTgaq3jg1wRO7PJ
 747w==
X-Gm-Message-State: ANoB5pmm8ji67Brrwx7cP1rCb7T+TCKXpIWlwfrMv0oZ7CsCkEKkCTxu
 YEjAhOLQ55Q+eXIA95derc7LDA==
X-Google-Smtp-Source: AA0mqf6IPlb602gKV6787RkbPZzs2E0ePwKDdPrq+LH8qygyBSxV/Rt39MXt1Ycb8ZRID7+0WNeuRg==
X-Received: by 2002:a17:902:e74e:b0:18b:ed3f:c6ca with SMTP id
 p14-20020a170902e74e00b0018bed3fc6camr42248447plf.12.1671208182149; 
 Fri, 16 Dec 2022 08:29:42 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170902eb8200b001898ca438fcsm1813575plg.282.2022.12.16.08.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 08:29:41 -0800 (PST)
Message-ID: <6900a10d-8128-72cd-c827-715e73473e3e@linaro.org>
Date: Fri, 16 Dec 2022 08:29:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/arm: Don't set EXC_RETURN.ES if Security Extension
 not present
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Igor Kotrasinski <i.kotrasinsk@samsung.com>
References: <20221216152410.1185369-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216152410.1185369-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 12/16/22 07:24, Peter Maydell wrote:
> In v7m_exception_taken(), for v8M we set the EXC_RETURN.ES bit if
> either the exception targets Secure or if the CPU doesn't implement
> the Security Extension.  This is incorrect: the v8M Arm ARM specifies
> that the ES bit should be RES0 if the Security Extension is not
> implemented, and the pseudocode agrees.
> 
> Remove the incorrect condition, so that we leave the ES bit 0
> if the Security Extension isn't implemented.
> 
> This doesn't have any guest-visible effects for our current set of
> emulated CPUs, because all our v8M CPUs implement the Security
> Extension; but it's worth fixing in case we add a v8M CPU without
> the extension in future.
> 
> Reported-by: Igor Kotrasinski <i.kotrasinsk@samsung.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> ---
>   target/arm/m_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
> index 355cd4d60a7..2b55e90ea9d 100644
> --- a/target/arm/m_helper.c
> +++ b/target/arm/m_helper.c
> @@ -895,7 +895,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
>           }
>   
>           lr &= ~R_V7M_EXCRET_ES_MASK;
> -        if (targets_secure || !arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> +        if (targets_secure) {
>               lr |= R_V7M_EXCRET_ES_MASK;
>           }
>           lr &= ~R_V7M_EXCRET_SPSEL_MASK;



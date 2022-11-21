Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA1F632979
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:31:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9fY-0003M2-Pw; Mon, 21 Nov 2022 11:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox9fC-0003Bm-Ip
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:28:58 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox9f9-00024v-7q
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:28:52 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so9239328wms.0
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 08:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i8aH5OhTqQkh2ej0tCjtMlHO0KR7pcnhnj4t12bV5fs=;
 b=jrr9Zb3cn7I6z1Ptck4u3Bbc+UdzD4iZv0+HaL+HXClZXfzcJO+pCISDKAnvVLSae/
 qOjAJkST6Rmo5Mz3HC+bE0U4zJfynPb6CLi0FrSMzasvVzHR3Ys8IzAsPhQeYy/wv501
 W3LkPwb6i8vLjvf2ADiZV4eEtyM/0RdxhrTsUJ4pRXvZbTalOumtzO04Wm5429cxz7Pj
 IU7MnV01DApox8TDcIJYSElf7sGp97Q8hk5ArhaLbBhIodCE2+6gCTGowaA2Cf7Igctq
 n9SdowCFx2hkbGKX8aJgRpftnb3vpWsRlBtNuey+PaYFqveZox6Ro3/JCc9TVYYhl+SO
 3xIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i8aH5OhTqQkh2ej0tCjtMlHO0KR7pcnhnj4t12bV5fs=;
 b=beuaZoMIlm238RnnK8oiYw7CT1YbBD0s8j7bJPfr05mhIHP1KYGn/u/6dGEEe8Sf4Q
 Wh84wOCblqaK5+w5v+rsmZVif+RxR236nWJ6nXYaGRH+52YpHb6fBbooV1QfTFBMeOYU
 NTdEEmf/bVc23pcwY9bxryg6+Sq5y7YRihRYJzOtRFodF9N0+J9jFHI6ZsdEbSTP5Ofk
 6a3z+EUPRQFkUhFJwJQPNWK47TH1DpXoOFOx1dhnZoqZxbxzCSuIcAu5lzwi+T7yrXNx
 fu0yCOCoGyg/t/iJdBOW4UhySaOWGehlxBcz4+2aWOYDt7nxzDaHblC3AtebsduYUm+Q
 GyIA==
X-Gm-Message-State: ANoB5pnAf6uo8qLCb6l3B46UQZZq/rYgzht5KcoChj9oOkU8jLClKm0r
 FESL4arqKoGwxatd1w8h+gWJzw==
X-Google-Smtp-Source: AA0mqf4yo+C6vQ6IB/Xm+eHOtUfju9sZIuLMAWcbMYG6csrkq2hyHjfQEgJO9IU/Uqm3kCQP/Nld3g==
X-Received: by 2002:a05:600c:4f92:b0:3cf:e87a:8068 with SMTP id
 n18-20020a05600c4f9200b003cfe87a8068mr7100412wmq.3.1669048129551; 
 Mon, 21 Nov 2022 08:28:49 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a5d620a000000b002366dd0e030sm11719258wru.68.2022.11.21.08.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 08:28:49 -0800 (PST)
Message-ID: <981f9ebb-8859-0010-5399-66175cbdd380@linaro.org>
Date: Mon, 21 Nov 2022 17:28:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 25/29] tcg/i386: Mark Win64 call-saved vector regs
 as reserved
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118094754.242910-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 18/11/22 10:47, Richard Henderson wrote:
> While we do not include these in tcg_target_reg_alloc_order,
> and therefore they ought never be allocated, it seems safer
> to mark them reserved as well.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index e38f08bd12..e04818eef6 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -4224,6 +4224,19 @@ static void tcg_target_init(TCGContext *s)
>   
>       s->reserved_regs = 0;
>       tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
> +#ifdef _WIN64
> +    /* These are call saved, and not we don't save them, so don't use them. */

s/not//?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM6);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM7);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM8);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM9);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM10);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM11);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM12);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM13);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM14);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM15);
> +#endif
>   }
>   
>   typedef struct {



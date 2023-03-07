Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE926AFA0A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:04:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZgKQ-0000yY-Om; Tue, 07 Mar 2023 18:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZgKK-0000xv-Et
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:02:37 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZgKH-0001oq-Hz
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:02:35 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so130288wms.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678230151;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R9r2fsvFmIpGDVIOxfIVBMufx7j05ZvZz9u9HlTNiDs=;
 b=nGbL93uUmv7Oh0PAwKkKsgmEDjnsfceudb+xB1zns8gqHFODjLfp3mI/maYtlLeP7J
 TCzTCbymiN+YIUaqao4Kff6DeUGwQbgqe5pjcWv5l0RBTbQJpiVmMU5ylV0ILM3HBpYx
 rHhuH7+K++Pxm89Vf90wBVOpW66yXpORPEGIQF6UZvi+JTpxsD+THEOwAmol758HICa3
 XF+WVnnn11YGU8qNme6DYsO2Z0UZgyowfYNg+rqyQ4Wts0VJRapgIEPL3o9GPpoiA+3+
 MnzIS9jxq1V+flRp7iGkUOl/RxejgEDTtpmboJ9rnJu84zBZALxTEUg0VkI2DfPngwVj
 LiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678230151;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R9r2fsvFmIpGDVIOxfIVBMufx7j05ZvZz9u9HlTNiDs=;
 b=vDFAaBg1Q+J3ywvM4Qw4tYmS46H2ZVQZIxM5GEN09GXIEOcwn3vRxEKyHWtep/mGKB
 4RpGD/4gVgAK4dT83sGJ1UtdKGJU3GV3fuSTrDKV0+TkDZJe+Dv1OJtNBBEJB4i3o5GT
 n19fx9mgcS+OZFSgVKEAOY67hxskbqbrToE/J0SGiLp3Uht7mSeNvY+0h3k+TX1kcVae
 6dJogleNigIpRGpZf1w1E6DQ0Gsivvr4qw2zuwhTLox4DAadowCBGbVLkx62De6ew8MY
 9iU7AEriHfOAuSvxCSwStcE0pGk5y/82Yvo7yA2Io+wAq5Q0eb1BqJsS9PZbhZwh9++S
 Iqbw==
X-Gm-Message-State: AO0yUKXH8kXlSxWWQ46ehHu5iL+azYpbM2/N6tfaiJzhRXuffgBHLKop
 4wNSiOZuMxlq/o4dOV+yfMnQcw==
X-Google-Smtp-Source: AK7set89G6mZdrprxS+AK52ZY4F7N8MErqkhp5u1CLX2yyMoC8Es7pALcUkgH+khsgV3T++lc429gw==
X-Received: by 2002:a05:600c:4f4e:b0:3eb:19e7:b291 with SMTP id
 m14-20020a05600c4f4e00b003eb19e7b291mr14263640wmq.11.1678230151017; 
 Tue, 07 Mar 2023 15:02:31 -0800 (PST)
Received: from [192.168.1.115] (52.red-88-28-28.dynamicip.rima-tde.net.
 [88.28.28.52]) by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c458800b003df5be8987esm18942781wmo.20.2023.03.07.15.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 15:02:30 -0800 (PST)
Message-ID: <c2ce74dd-7a7e-f4c6-b5d5-a7d69fcbe225@linaro.org>
Date: Wed, 8 Mar 2023 00:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 09/25] target/arm: Avoid tcg_const_ptr in
 disas_simd_zip_trn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/3/23 19:34, Richard Henderson wrote:
> It is easy enough to use mov instead of or-with-zero
> and relying on the optimizer to fold away the or.
> Use an array for the output, rather than separate
> tcg_res{l,h} variables.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-arm@nongnu.org
> ---
>   target/arm/tcg/translate-a64.c | 41 +++++++++++++++++-----------------
>   1 file changed, 21 insertions(+), 20 deletions(-)


> +    for (i = 0; i <= is_q; ++i) {

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        write_vec_element(s, tcg_res[i], rd, i, MO_64);
>       }
>       clear_vec_high(s, is_q, rd);
>   }



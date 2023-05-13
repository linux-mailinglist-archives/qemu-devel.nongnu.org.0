Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BA27014E4
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 09:14:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxjQu-0003lu-RD; Sat, 13 May 2023 03:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjQs-0003lS-Kj
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:12:46 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjQq-0002rI-Va
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:12:46 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9d1so79949355e9.1
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 00:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683961963; x=1686553963;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xY3LuMzgJn8hRRnGX90DqbNAadAx1G1L3Sd+GeVqc2I=;
 b=vP9RWs++McFV8Enh3dKunshuXatGE9eCINJTtuvf2dXAQRcJVlIaKQjxfEwIXejQHz
 c80ATP9VuNEnfU81iOWU43IoFe/zcBiDCIqtU+V9Wrfli4SXjbFPZefJRrgFBtxn6dCi
 u5qymdX2BQ4cgLTCdRwKZWMh6eMp3SzLQoKg9gPD74aO+WNWV0zJMRYsqDawt+RtW+Fj
 7vnKK1gI/wJx71m7W7Z+K3IsQztaRwK42rp+2Hg1vTc8QUWAQhq0sruUpK9xDCrCqnQv
 KAOrXroYHjvacahNGIlsA6TWNZijmt+al7C65TcA96pdUEXI7heZxhAf7xjIIqduDFCp
 JiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683961963; x=1686553963;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xY3LuMzgJn8hRRnGX90DqbNAadAx1G1L3Sd+GeVqc2I=;
 b=L4RZ8dmUp6QEoyVHPrVB55pMAC0peDJTsUhnKWxStp9YToReCTKOumwd1cGwMYt4ot
 QNh7CXMeIwsbSyt+yzQpCEpfbkfakAlpfOJEQHd2srLMSrDAz4tHSJftU4JpG/I9ZhiS
 IPeSstPJeCMZMapHVgtB5+sfXoKZBm3kHbMCccSICi5lve5RfGEdPIDQkrWT2v2oKfK/
 GzVN1SbrCCRyCLMdJs0KX8IsXI3oBP3H0ITcsLr1MZuwrRVUwVWpYd0EB1KWILYnn1Hb
 Nw95GkBlUs2YQDGWwflsglZqUetDAmdyeqKGsly3lGDST02+K/TcCgZ5+OMPEIjB3rpo
 Lbeg==
X-Gm-Message-State: AC+VfDylaaC9yIvS/z+XrFH295Hes7MgVFYL01dsEdAV4cFapF+pNT8f
 YfeCCUu2UxYQF8T+kE2vV2Z8mA==
X-Google-Smtp-Source: ACHHUZ7Q4yNRUeTZm5YbVULALIgfK4WhT3eK66rdgSEJNGrrs3T6KZISNBfNGKNiRgODM1xJy6zZgg==
X-Received: by 2002:a05:600c:22d6:b0:3f4:f0c2:127 with SMTP id
 22-20020a05600c22d600b003f4f0c20127mr5206857wmg.22.1683961963272; 
 Sat, 13 May 2023 00:12:43 -0700 (PDT)
Received: from [192.168.190.227] ([83.98.42.3])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a7bc7d6000000b003f42813b315sm15395072wmk.32.2023.05.13.00.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 00:12:42 -0700 (PDT)
Message-ID: <6c78cc26-ac0b-ea29-0f8c-f2f6538be749@linaro.org>
Date: Sat, 13 May 2023 08:12:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 02/20] target/arm: Create decodetree skeleton for A64
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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

On 5/12/23 15:40, Peter Maydell wrote:
> The A64 translator uses a hand-written decoder for everything except
> SVE or SME.  It's fairly well structured, but it's becoming obvious
> that it's still more painful to add instructions to than the A32
> translator, because putting a new instruction into the right place in
> a hand-written decoder is much harder than adding new instruction
> patterns to a decodetree file.
> 
> As the first step in conversion to decodetree, create the skeleton of
> the decodetree decoder; where it does not handle instructions we will
> fall back to the legacy decoder (which will be for everything at the
> moment, since there are no patterns in a64.decode).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      | 20 ++++++++++++++++++++
>   target/arm/tcg/translate-a64.c | 18 +++++++++++-------
>   target/arm/tcg/meson.build     |  1 +
>   3 files changed, 32 insertions(+), 7 deletions(-)
>   create mode 100644 target/arm/tcg/a64.decode

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


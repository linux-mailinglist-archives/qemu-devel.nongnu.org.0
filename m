Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBFB68E43D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:12:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPX83-00042f-VB; Tue, 07 Feb 2023 18:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX82-00042L-FD
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:11:58 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX80-00074a-Uz
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:11:58 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 o16-20020a17090ad25000b00230759a8c06so385399pjw.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 15:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jOOZzh5Ci9Ei4n4xLpnlthYOFYDuHNJ+ZZ5LYvGAIxQ=;
 b=EPaA/DOCMEdxNpboaxaaTKVpoPCbhuD68YvExdQj75r7UAIvx9azdisJkfj0uRhwGk
 w0VDkxXd0mhFIV981h92+o0xNN1xOuefdJt6YognVEyXgTzQLRK5a4XyttAh6GITiQeR
 9ZKg9CR1X/zYI8wS6flTvKnZjNBa+qhhGLxlIiTx8fngcVP7lvekOaEOEwJKO3apMuFa
 pHpQ86PWETpUllWC5DDsPcIAluIM4EEd7854gzh+7ugR1OYElx/0hWLEeXV4CKrROqab
 m7vcBW72K71IdHX2zQK4x0Ru/ets3DoHauzzZI448UoQvwyUsE+f4ifgh475wJmdzR3l
 VzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jOOZzh5Ci9Ei4n4xLpnlthYOFYDuHNJ+ZZ5LYvGAIxQ=;
 b=R69ZKPxIaNDriDP+bAbSP7oLlpJE4w/g1VK5x74ibW6lLIYXY1HvyTWveYkNcuddo4
 q53PqI22oJz44cNn9c8uXMYlOw/qI3w1ZHdnSWdyHUkXAyu+C4luRmFjOFYoB+miptJE
 0DrEx2N9SaNpIBrPFV8VMYusjM4zIdgDNbKT/lSnJB5OgCAtWcNhIJsZDdx8Fq9hn5iq
 334iML7a8YYVTXRCmXA3SXJRXsoRdBj3pBRZXJBtdfZamrMwHwTzoJArs8HUth2gyMAo
 GeymD2Jupe6xt7xw+MbQZr0VloQ4X0q8TRNlJn2pjOmPoWZi5b6y+waW01M5//7GCDdP
 TVUw==
X-Gm-Message-State: AO0yUKX/ze/N/8TghXDe9ARBdR5re3ZadgO6cQnPN2oJTkqauDUWvxNV
 adchomzNUHXO8qwlefk6KZBFCA==
X-Google-Smtp-Source: AK7set+viXzFrR1FZM+5P0JS9FzlwFc52a5gc1jW44DprvaEB4kKXkvGyzaomfQvJpp0oHl7JYNzYQ==
X-Received: by 2002:a17:90b:3b4e:b0:230:a39f:4992 with SMTP id
 ot14-20020a17090b3b4e00b00230a39f4992mr6021357pjb.11.1675811515617; 
 Tue, 07 Feb 2023 15:11:55 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 hg8-20020a17090b300800b0022335f1dae2sm78473pjb.22.2023.02.07.15.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 15:11:55 -0800 (PST)
Message-ID: <b3d8a0c6-5c39-2c85-3bc1-b56309587822@linaro.org>
Date: Tue, 7 Feb 2023 13:11:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 10/11] target/arm: Store CPUARMState::nvic as NVICState*
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
 <20230206223502.25122-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206223502.25122-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/6/23 12:35, Philippe Mathieu-Daudé wrote:
> There is no point in using a void pointer to access the NVIC.
> Use the real type to avoid casting it while debugging.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/intc/armv7m_nvic.c | 38 ++++++++++++-----------------------
>   target/arm/cpu.c      |  1 +
>   target/arm/cpu.h      | 46 ++++++++++++++++++++++---------------------
>   target/arm/m_helper.c |  2 +-
>   4 files changed, 39 insertions(+), 48 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


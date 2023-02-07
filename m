Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE1068E434
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:08:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPX3k-0000VX-3J; Tue, 07 Feb 2023 18:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX3g-0000U4-GG
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:07:29 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX3e-0005zc-9x
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:07:28 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 o16-20020a17090ad25000b00230759a8c06so374609pjw.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 15:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bhPqfErekPB3c4DakukzGYqWK9QgFk/hQmgTk727dp8=;
 b=DY/uwrGEXFqcMwcHPgXjd3y/h1pj/+Rx/rbaNuP1nXWnoxkhI6UADPBL6rLs38zfdR
 Mf9LIkhq7fiDgWteaIP8EY+UteQSJWMajHaKm0AyfNi1JJdWBwqBgpnrWCyGfL+KnW4d
 tZgPEwty17fgbnDYsZjf/4sRe68Vwrp6hUGnbJ4UMyoQa9h8y4RnA9NrMx9RE2ALxN2m
 lRag/67bJ0QELOnGDOXzB1K8PuFnnV8v52rL3AUnKAJBP0QtLrXKUm1iSIDU/d4aYO7G
 CZeUvhFpBKOeFaCWZFUISbXZDM4ZV6daA/+3IbqHFdvoVMNO9Id8yV9yUIalO3erUjqh
 nspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bhPqfErekPB3c4DakukzGYqWK9QgFk/hQmgTk727dp8=;
 b=iIoAKqdEFvo9xRU91m+0F22Qj0nwbHmaj62HZk7q5Nr4zGr3qreyopY7KPXtHAav3O
 kVwNbZEw80ckXE4Bd7AlFaqeIc1xbLYDmTUgXTBWAT8veMFtGO+2o901f2y/SMTDcxvA
 WuFIOsT5K6Rupc1EOloZv19JFzgm27Hhg9BRYtS6HxquRGgxFJTDwvVwUjQsPVW5+AVK
 HuEz2fjeAWvqKQzgxHHHPVpbgInPxAE2oBhI8Eu0FtMxGqy997jWJQ1oYS/QCpneu6bR
 L3pWSGAvweFuolTooJu2jcFpToUl6ynGR/OoX2O2dfh+FsCVaIn3l17Y8qmfS2AdeXME
 6uvQ==
X-Gm-Message-State: AO0yUKXt7l7FZJ2wk+BG+UyoxsHE3gMfi3T3XlZyH/Lo8Gxx6UCXDJwR
 wTUCkCtafm2AqNh8IJgoeD9UCA==
X-Google-Smtp-Source: AK7set+rf1DPDzNMCHcDSnubKk804uscbvrVTjLmo82tMRQQgNwkw68bR+7FyCN7jlHTNvsrnautww==
X-Received: by 2002:a17:903:41c7:b0:196:704e:2c97 with SMTP id
 u7-20020a17090341c700b00196704e2c97mr5189168ple.25.1675811244326; 
 Tue, 07 Feb 2023 15:07:24 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 g6-20020a170902868600b00192fe452e17sm9473153plo.162.2023.02.07.15.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 15:07:23 -0800 (PST)
Message-ID: <941b9ea6-ad1f-cdaa-c0e2-5c64dbedd744@linaro.org>
Date: Tue, 7 Feb 2023 13:07:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 02/11] target/arm: Simplify
 arm_v7m_mmu_idx_for_secstate() for user emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
 <20230206223502.25122-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206223502.25122-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

On 2/6/23 12:34, Philippe Mathieu-Daudé wrote:
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/m_helper.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


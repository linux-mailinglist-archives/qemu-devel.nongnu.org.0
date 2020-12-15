Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408FC2DB022
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:34:30 +0100 (CET)
Received: from localhost ([::1]:46584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCLM-0001vk-00
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpC91-0008Nl-7Z
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:43 -0500
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43]:38011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpC8p-0002QK-IU
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:42 -0500
Received: by mail-oo1-xc43.google.com with SMTP id i18so4908640ooh.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0xcK1IuujEA5K5lA0Cirzk0N7PvQDsnCaphLTkmgOQk=;
 b=Lw3aZWWkp/sbsTODzl+46DR2QKQkB81nwmf6UX7FbLu/X9qowkHDhozjqospnp7cD2
 aPfpU7RpRSQQWuKWyMw9V2WmFM9eErgCw6uxNOuEiCPmdHJEwDAFO4C36q3L83ymzvQu
 5q3juSF1ThJwKXUiT484NvbX243CCtKtZSxBSBz8DGzbnJAZfgOtykWTUEOMSXk3SlNK
 EldAeNj4t1NYXc97d21scaAij9BhvydIJPaOaaRJhxrZv38HgDhM6RNiHG0MXnPp10kM
 O6qvP20Kp6m/fuJ9xVQYBIK/XFhfrzlmAi65qkbnuqMB8YTsc8jNPmW5nFWZN7SsTwXy
 5wAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0xcK1IuujEA5K5lA0Cirzk0N7PvQDsnCaphLTkmgOQk=;
 b=jh1SGsPwjLwo7igUErVtZ28Lp2k6GqGD5RL2Dc3PPSutxS3DCnF8Tv9ZB5v5OebrsT
 DZ3g1T8PtIQd79DSbBUWmgGmEaU8wdo2cjxxU1eXKwTLRnK5+yWvoGrlOtRcEYJqj05o
 +RlHlSxe9KtpRZcPYPUjDkO7GveV3ldB1ro5Ps7YUhj9TjrhjhT7JHJdXoxhCy1c6Dm5
 G+mqbtW8hdFPBP0WV0TTqzEqZPVvWC/UD7Mk63D5Pp1q9h4STEe9cwyv9YxPASWQfIxk
 KHU0cxUbKCVHzsj3F7t6ZKPtW7uaUA1t4svwFLhXbc0dF2/5vLdtoV8YX80ebMeYMk0Z
 QCYA==
X-Gm-Message-State: AOAM531l844gnMZjTouBMXECT2+VvJ7SicfvGyH2ljfg70QvSL20Jdsx
 iVTSLpizBmw2zw27XSv6ZvsxsQ==
X-Google-Smtp-Source: ABdhPJyfV0VIizHdvcsu09DRckK9liSvgakzw7i50/YU9tPwtY9TGjIPUCRbDVLExtHwpjo5Dqxw/g==
X-Received: by 2002:a4a:9722:: with SMTP id u31mr8864ooi.28.1608045690040;
 Tue, 15 Dec 2020 07:21:30 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k3sm4466839oof.31.2020.12.15.07.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 07:21:29 -0800 (PST)
Subject: Re: [PATCH v2 1/4] clock: Introduce clock_ticks_to_ns()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201215150929.30311-1-peter.maydell@linaro.org>
 <20201215150929.30311-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3256465f-76d6-9d05-6ee9-eb912561602a@linaro.org>
Date: Tue, 15 Dec 2020 09:21:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215150929.30311-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c43;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc43.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luc Michel <luc.michel@greensocs.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 9:09 AM, Peter Maydell wrote:
> The clock_get_ns() API claims to return the period of a clock in
> nanoseconds. Unfortunately since it returns an integer and a
> clock's period is represented in units of 2^-32 nanoseconds,
> the result is often an approximation, and calculating a clock
> expiry deadline by multiplying clock_get_ns() by a number-of-ticks
> is unacceptably inaccurate.
> 
> Introduce a new API clock_ticks_to_ns() which returns the number
> of nanoseconds it takes the clock to make a given number of ticks.
> This function can do the complete calculation internally and
> will thus give a more accurate result.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The 64x64->128 multiply is a bit painful for 32-bit and I
> guess in theory since we know we only want bits [95:32]
> of the result we could special-case it, but TBH I don't
> think 32-bit hosts merit much optimization effort these days.
> 
> Changes in v2: saturate the result to INT64_MAX.
> ---
>  docs/devel/clocks.rst | 29 +++++++++++++++++++++++++++++
>  include/hw/clock.h    | 41 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 70 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



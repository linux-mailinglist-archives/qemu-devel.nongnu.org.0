Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C54D5EE378
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:50:28 +0200 (CEST)
Received: from localhost ([::1]:60814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odbCV-0006nH-6p
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaTw-0006A9-TI
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 13:04:24 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaTu-0004bd-01
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 13:04:24 -0400
Received: by mail-pf1-x42d.google.com with SMTP id d82so13041112pfd.10
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 10:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=h9s1x3zsPX7bVFOgqG0LesvY8nj/+4qwmNSABEm1Tu8=;
 b=gEhIn3qQtr1s1CZXaQ/cvtb6ZU+n8MyasvqrYFOHGVDr5VezuuoWzCNAHaZ5V9KEQ9
 Uz5eeNoyjfam1sjGiI8mYaNBVXZuksw9SRyWEInD7kDPo+8iFaLq0vBXBtEr6PkVJILx
 Q2DMjvGlZwuH+S5sU5+wTBnnEhHNYA+r2e9qUazHHcrToGXClO8tWTXgfT/Eb0WzMQTq
 u+JDsu/FxwuUsN0vWCsZlRclY/4w7YkSIcdebYbTfUzy6ZC3bs8VeroEpgS3fd41k00m
 rJXZbzY5k720p9R75OopElDP5HmErJxU88x03Ij6NcUDTnsotvk6/kewIKFbny+LRixh
 5mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=h9s1x3zsPX7bVFOgqG0LesvY8nj/+4qwmNSABEm1Tu8=;
 b=SI7RhwDJ4vu6alJ0CL3lSG8rpIIXrhtBkWj9z9nIKS/OsooWjJZB8e6Eo+i/hkUf77
 sQw63eRh0ZqWyHnU80U7Kk68wN4fRG+0nZVEz9Ozl9NpOopCOjayWusmYvNbokP3opjY
 SxO2XUY0APX1oKWwmkh83fgPUiz++3+UcbwR4phZZeBaeRuGPmYErYcQpZx+O+uOiW/m
 mZTQvla2jXGvLCNL7NsfJKUsZaatd4riYYu5USXL5lCI64/gzJwkAuex/bA9TX5DBM9w
 vW1WCayxmCvHTfxshyykNUgQGbmQ+zvi50pBOFvKLMntjiGo5pCaRll29sxntrroo98b
 ycCQ==
X-Gm-Message-State: ACrzQf2KxJuDOdkx6G2xlL6mhGFLh4/vRHW+w/nMP5hOcLASquDjOQXK
 HfelzEvMf8jVwEaU/mtjkZ1t8w==
X-Google-Smtp-Source: AMsMyM7vk1bjKEimCo7Xw39PKRcyPCm7fNdOPWv9hrZwcRzL6B9QGRS0nOXr+MLOWfJpkYfpsGY/Qg==
X-Received: by 2002:a65:6cce:0:b0:439:49b5:48b8 with SMTP id
 g14-20020a656cce000000b0043949b548b8mr30186838pgw.514.1664384660380; 
 Wed, 28 Sep 2022 10:04:20 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a17090a4f8500b001fbb0f0b00fsm1800172pjh.35.2022.09.28.10.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 10:04:19 -0700 (PDT)
Message-ID: <80f331a5-77ae-6e96-5861-77327ad0662c@linaro.org>
Date: Wed, 28 Sep 2022 10:04:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 09/15] hw/timer: convert mptimer access to attrs to
 derive cpu index
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/22 07:14, Alex Bennée wrote:
> This removes the hacks to deal with empty current_cpu.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - update for new fields
>    - bool asserts
> ---
>   hw/timer/arm_mptimer.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
> index cdfca3000b..34693a2534 100644
> --- a/hw/timer/arm_mptimer.c
> +++ b/hw/timer/arm_mptimer.c
> @@ -41,9 +41,10 @@
>    * which is used in both the ARM11MPCore and Cortex-A9MP.
>    */
>   
> -static inline int get_current_cpu(ARMMPTimerState *s)
> +static inline int get_current_cpu(ARMMPTimerState *s, MemTxAttrs attrs)
>   {
> -    int cpu_id = current_cpu ? current_cpu->cpu_index : 0;
> +    int cpu_id = attrs.requester_id;
> +    g_assert(attrs.requester_type == MTRT_CPU);

I would guess this needs the same non-assert treatment as the gic.


r~


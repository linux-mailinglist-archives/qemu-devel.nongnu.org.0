Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0BD49BE35
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 23:09:14 +0100 (CET)
Received: from localhost ([::1]:43092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCU01-0004G5-EY
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 17:09:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCTwI-0001Jm-09
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 17:05:23 -0500
Received: from [2607:f8b0:4864:20::635] (port=33296
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCTwF-0003WO-8s
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 17:05:21 -0500
Received: by mail-pl1-x635.google.com with SMTP id k17so3140241plk.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 14:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w8GUNRFxpYd/bcIzyufLqhzRsGPF8WCxeSif/KX8xcg=;
 b=gvcmdkzp33piKiLwPy7gbcx9aDqMz0d7a6Tnwp6tAHkOELBAMmuVOHMQaewMsPTM93
 Ou6oVmaHflJ89Pz4tv0+Z3ZOwviI544WJWrMfI9dsAgzVt1+HZZL771XT7ccgpBG05Hl
 YlMbsXsOhEnnnY+ddYsUhcHImK47J3JxeEuBOuk9X4HwLV+sVmoVtwmHY3QmNd364cEx
 7UMEO6IKXl2xYvG0FGCCXH9aRTc0Wny4Oi994zrOaVpOx+GOxxG+MN1w/sM4p2al/RJ9
 cZazWdSA40jm0x6WSSEpwM3WudE5ABUtiCjXoWpFhKGjHplCj5cKvYc/9qezS5WIdYv5
 zlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w8GUNRFxpYd/bcIzyufLqhzRsGPF8WCxeSif/KX8xcg=;
 b=VeGY9qChNqYDxw0nZ1+BaS18bo8TmjtHdcnTQistxDdiCUlV4CZXnoH5XzgopVWMaf
 PZsbzKu/nIUeqMxq4V9bLX7osI2RWzbyZiFQCXGoTEJ+az5vGhFV8TlXeA3TNfmIp+yX
 BGbIse2+L+SCr0qf1upBAwpI1zoAXA7sDvPd4OyQcQk156snvuWJx+/owRrmSnv2N7Oc
 3sCzFHjNo0g27zKRgq31ZdR4bMHuJdQzMgMcEq5HZtKmzSAVHTxxCOTXdDCgO2s0HUV5
 C2lfkUaU3Iz6yc9SfTYuVvg01uyKWAeChPpdLqCQP2zOCMj6wHy1b/boZY8DEyuB+q5x
 llFQ==
X-Gm-Message-State: AOAM531JFM0euP2cymF2c3yCHtyeBeO7ntg85dm5pWs8FxGM9BrwM4bF
 o8Yr+VQiIg7vqjMuj6ocdPyykQ==
X-Google-Smtp-Source: ABdhPJywJjnjYibWNe1MhqQjpq1WoaCsKWFdZZTrgjrpba4xz7W435PJY4weB6c456b1TPtPlhfSnw==
X-Received: by 2002:a17:90b:4f87:: with SMTP id
 qe7mr5603469pjb.154.1643148316377; 
 Tue, 25 Jan 2022 14:05:16 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id nk11sm1240093pjb.55.2022.01.25.14.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 14:05:16 -0800 (PST)
Subject: Re: [PATCH 2/2] target/arm: Bail out early on 0-length tlb range
 invalidate
To: Idan Horowitz <idan.horowitz@gmail.com>, qemu-arm@nongnu.org
References: <20220110164754.1066025-1-idan.horowitz@gmail.com>
 <20220110164754.1066025-2-idan.horowitz@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f211c09-4b4d-2c82-cff6-64711563c6d8@linaro.org>
Date: Wed, 26 Jan 2022 09:05:11 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220110164754.1066025-2-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/22 3:47 AM, Idan Horowitz wrote:
> If the given range specifies no addresses to be flushed there's no reason
> to schedule a function on all CPUs that does nothing.
> 
> Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
> ---
>   target/arm/helper.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index cfca0f5ba6..1e819835c2 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4564,6 +4564,10 @@ static void do_rvae_write(CPUARMState *env, uint64_t value,
>       length = tlbi_aa64_range_get_length(env, value);
>       bits = tlbbits_for_regime(env, one_idx, baseaddr);
>   
> +    if (length == 0) {
> +        return;
> +    }
> +
>       if (synced) {
>           tlb_flush_range_by_mmuidx_all_cpus_synced(env_cpu(env),
>                                                     baseaddr,
> 

Looks good.  I guess we could sort the extractions above so that we do

     length = ...;
     if (length == 0) {
         return;
     }

     addr = ...
     bits = ...

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065C864F56B
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 00:59:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6KbT-0006cX-0p; Fri, 16 Dec 2022 18:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KbR-0006cC-DA
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 18:58:57 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KbP-0004XL-PS
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 18:58:57 -0500
Received: by mail-pf1-x42e.google.com with SMTP id t18so2773609pfq.13
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 15:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Ir445oMHw0+EjepAUMZVBmzYdTk4enhP+VVsYKWKmI=;
 b=ZinEAolc17hXU1HLlRz2A+9kuTXne/6kghXrDhhiXbhEVQXGoho7asvq51uMRUvg2b
 1Js3FwV5dznkbtWz7FOpTtRsn0jKXdTCZXYjp5j0SCnaKacG0Z8CZhHrFoG91RwWSz5P
 j6Yrzm0YxdvNwFotswFfI/SASKjA1SobNTL4m4KGlli4eaTfNgvmz8d3vf8fy6BgCLbP
 w9AeKo0q8ehX3Nz7M1sJ0UO9wqiqYrfca1Otz4xBTJtDh+1BBIt886YB4aS+lPRyAt37
 t4us5ImmMaqr/Jhu8oplGNJ9Gv9G2XEEVldBSpQwDGd7pJvTki0D2mcSNpIN8vWLb7GD
 wSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Ir445oMHw0+EjepAUMZVBmzYdTk4enhP+VVsYKWKmI=;
 b=Jv+w+e/QWujM9hVgf6MY65494+hU128ho0c5u8LXnvzJy79R0wWRXZZRq+0IhpAkIe
 lEy6Q6oBZ9nNjv1fcPO5suKdbH0Gt8pDtymIBWZjvv0c3Hon+11tIvEuusC32md8qnwq
 j8WHVcLE0rn9TUmmtC4h3iMJ9gZIamVoHi6cYMfcx20nNIteVP6k0cN1mPavMHcRcq3w
 jJUrAXALcLow841dVZ2pL9+LsZk+IFMgaJlVwdHNWIe3kr3jgyp6KqPtJgaskGcTjBix
 xFyMQif52HdLgJZfz8neGoMxQf/hkzcxH0Fp2lzI7+9K8RBTSad30rmm7sps+fp7Dh+/
 GnqQ==
X-Gm-Message-State: ANoB5pn6u2jQUAnFoc9prekZt3TtdFLe/TdR3kpEfl8t8LTGndDPTYHm
 PTuFbSAbwlrRnWucLy6Jy6o12w==
X-Google-Smtp-Source: AA0mqf5U2WePvDckQ7rTNx8HA2xIEiqMlVcdvKecEKUr5WszeEHXrfvlLRwX8SudY/liy9jNa50K6w==
X-Received: by 2002:aa7:8250:0:b0:572:75f0:8010 with SMTP id
 e16-20020aa78250000000b0057275f08010mr31482903pfn.14.1671235134163; 
 Fri, 16 Dec 2022 15:58:54 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 w185-20020a627bc2000000b00575d1ba0ecfsm2014638pfc.133.2022.12.16.15.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 15:58:53 -0800 (PST)
Message-ID: <039803d2-24aa-e22f-a154-7ca07e781852@linaro.org>
Date: Fri, 16 Dec 2022 15:58:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/5] dump: Include missing "cpu.h" header for
 tswap32/tswap64() declarations
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221216215519.5522-1-philmd@linaro.org>
 <20221216215519.5522-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216215519.5522-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 12/16/22 13:55, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   dump/dump.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 279b07f09b..c62dc94213 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -29,6 +29,7 @@
>   #include "qemu/main-loop.h"
>   #include "hw/misc/vmcoreinfo.h"
>   #include "migration/blocker.h"
> +#include "cpu.h"

Does it work to include "exec/cpu-all.h" instead?


r~


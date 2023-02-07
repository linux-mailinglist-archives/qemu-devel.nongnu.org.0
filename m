Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D49568E410
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:01:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPWw1-0007GC-5u; Tue, 07 Feb 2023 17:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPWvs-0007Dz-Iq
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:59:25 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPWvq-00049d-4v
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:59:23 -0500
Received: by mail-pl1-x62b.google.com with SMTP id e19so9382134plc.9
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 14:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iEeW3DoEK3Lc8rA9gJUYXTwtZDjS/pFE4Wh2Y06imIA=;
 b=znR4twCxDhylk+Co7F5rLi50GXYsniUbI645+m7DEFCK3md2Ve4F3xVLq4QA5tPlU6
 HWmL0OXcsNGg0pODz3nHIVBn8nhiWfOBXj9l4QdtpVNDt8XadSSlNZwhuZ+SN14j7Tpl
 vA3dEdIAw0J+7VKgdkKulyT1MNbu+jpfU2ngPAwA9+s+kwVTgg+ze/OVXisM8fgzCFvo
 iwJtHx1X1kuFq3j+eH/9KWO0xCOP//3WJBzKMZLjU5LwuLEHpv28W/WEor9siPNeI0Uv
 bf0iT8r4p/J5qpj2dSJNYemJ4Z67jrMkpY6WV+8skzn+TiENKVn76hJuiQnGnlPrfaaC
 H9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iEeW3DoEK3Lc8rA9gJUYXTwtZDjS/pFE4Wh2Y06imIA=;
 b=hYZAUPLIbgLUKmKWSnaqyWtiBsEUdTRREkoNQovzg+CrHh/KVcBOz9bCm6j84qs6Mp
 U3RHUhcvVH+oCN/bvPzVKhcRJxSdHZixVNfaTXmfzRKGS385M8Sd2O+96gaHnoePLrhd
 xOwKwfs9o0Esbc9ti5IMPfYzvZucg/2O4mbJnN8AwEyiYJGSQ0cwGQMvDTsVABM3V6UT
 RIaUlEX4enWIRG+Fp7wvAiZYTpeegqEQMgUhUUN9UMB0D90KsEcICuVTUtI0Pm3qLdgU
 uhlPwnDGcl7cPtFt9vsaTzurKqfNREZWHxhs5iqr3DxkNEqMOu+EVXtY4vF7tJ+z799q
 dzYg==
X-Gm-Message-State: AO0yUKX8xl6uYk+HGgVaF/96RAV/DziMzBrhzBVu2J8EnBaAZkATnlaZ
 M8+PsvdCQgMoE38JN6kG+8TRNQ==
X-Google-Smtp-Source: AK7set/Dv43qCtdCVUQaYDacIFsuun4/ztBLuktLsVxFrClfquezT1uwJkJd6mYNRVvTo9ibgiZ0uQ==
X-Received: by 2002:a05:6a20:3ca6:b0:bf:9f83:2374 with SMTP id
 b38-20020a056a203ca600b000bf9f832374mr6164895pzj.52.1675810760538; 
 Tue, 07 Feb 2023 14:59:20 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 q25-20020a639819000000b004dadeb4decasm8402765pgd.53.2023.02.07.14.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 14:59:19 -0800 (PST)
Message-ID: <0dfe9a93-e593-82bf-0a00-59223c943fef@linaro.org>
Date: Tue, 7 Feb 2023 12:59:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 01/11] hw/intc/armv7m_nvic: Use
 OBJECT_DECLARE_SIMPLE_TYPE() macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
 <20230206223502.25122-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206223502.25122-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/6/23 12:34, Philippe Mathieu-Daudé wrote:
> Manually convert to OBJECT_DECLARE_SIMPLE_TYPE() macro,
> similarly to automatic conversion from commit 8063396bf3
> ("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/intc/armv7m_nvic.h | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
> index 0180c7b0ca..07f9c21a5f 100644
> --- a/include/hw/intc/armv7m_nvic.h
> +++ b/include/hw/intc/armv7m_nvic.h
> @@ -16,10 +16,7 @@
>   #include "qom/object.h"
>   
>   #define TYPE_NVIC "armv7m_nvic"
> -
> -typedef struct NVICState NVICState;
> -DECLARE_INSTANCE_CHECKER(NVICState, NVIC,
> -                         TYPE_NVIC)
> +OBJECT_DECLARE_SIMPLE_TYPE(NVICState, NVIC)
>   
>   /* Highest permitted number of exceptions (architectural limit) */
>   #define NVIC_MAX_VECTORS 512



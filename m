Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321976A16CE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 07:58:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVS1u-0003sv-1u; Fri, 24 Feb 2023 01:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVS1n-0003sJ-H8
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 01:58:00 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVS1l-00012g-Ut
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 01:57:59 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so1390773wmb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 22:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hn9IbVt/EGec3dOOvd5l8uRNmtFghrtwK53CIkB6hT8=;
 b=DJWPbstL7pxxIAwnPL6iPUeJnHl2cSKxMXwQgHZJxBCT8lDLQp8ZNPkoyzyispVRZ8
 UZhLMg1Rf4rVcUJdnlK2JqvWG3z/BE/2lNyzANjmRmxyy8OnJ/y4rQ/FaRJqbgQj6Z9H
 CsbOWZV0CNagUAWR7hCEixv0wimgUqY7y7D096OVvmQwN/Z7VmSn6XffslISR9vCBTvz
 +ozhEtsnt11mtGI7Ss2BIzC8TJi5RivRr+7JA8QjA/iltT0BvjpbPpnZwSYJk0tQmxSB
 eM5JIm0U7VLJkGBg8C+aQjR2ifUQtneGFv56dumN6YY1TaPnY5JOPM08H8jDJrITv3+A
 3kCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hn9IbVt/EGec3dOOvd5l8uRNmtFghrtwK53CIkB6hT8=;
 b=Gifhh6bdfuLIZGYW0PEB6s5t4Xk8h4LSv2Bq9Qn6VMV7Xg2N1EIA3Vuqy0AZtslMVP
 wodY4pW5tHk1zkX20fPYgfmZCRamGz36hhHpd43Dk6DZXzISYeLgnV2Xu4TYoLJG1eNk
 QerrcU4F5hNKKPBmldXcYMeA6iHPL+yXDO94ManHWyVmxEvzaqgLHjPVoaohRjG8jRBx
 TV9ADy8lRjYQmDleMhHAhDoLRqpvMTqKUesERQY9UeeRqvmQHFmhenG0Hk92U00OCXPX
 SwrZuJOFIXL+6O/OJVHyT7GaJo/lb0Midvou9rTD0D1exfQNa1YCYAj5PzIRJN0NaoYP
 uI5Q==
X-Gm-Message-State: AO0yUKXRZFQT0DN0iaYhZHSGlsehJpmpSvEk05LOwGpdl7t69lRIhbvZ
 InzHSd6b/PL8AxZu4F+uzISITA==
X-Google-Smtp-Source: AK7set/xWNWWsb4vf3+pNfutr/H4sxwC0O2qVRT4nmJIx3bHqYoq70k4DsMZWn5k9DRWvHj/MQ998g==
X-Received: by 2002:a05:600c:5126:b0:3e9:f4c2:b604 with SMTP id
 o38-20020a05600c512600b003e9f4c2b604mr4879138wms.24.1677221875718; 
 Thu, 23 Feb 2023 22:57:55 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j8-20020a5d6048000000b002c553e061fdsm14677805wrt.112.2023.02.23.22.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 22:57:55 -0800 (PST)
Message-ID: <6517a169-07b0-6ee2-1492-95d6d5c82ecc@linaro.org>
Date: Fri, 24 Feb 2023 07:57:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] accel/tcg: Add 'size' param to probe_access_full
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
References: <20230224004558.1313614-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224004558.1313614-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 24/2/23 01:45, Richard Henderson wrote:
> Change to match the recent change to probe_access_flags.
> All existing callers updated to supply 0, so no change in behaviour.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/exec-all.h              | 2 +-
>   accel/tcg/cputlb.c                   | 4 ++--
>   target/arm/mte_helper.c              | 4 ++--
>   target/arm/ptw.c                     | 2 +-
>   target/arm/sve_helper.c              | 2 +-
>   target/arm/translate-a64.c           | 2 +-
>   target/i386/tcg/sysemu/excp_helper.c | 4 ++--
>   7 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 165b050872..b631832e17 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -475,7 +475,7 @@ int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
>    * and must be consumed or copied immediately, before any further
>    * access or changes to TLB @mmu_idx.
>    */
> -int probe_access_full(CPUArchState *env, target_ulong addr,
> +int probe_access_full(CPUArchState *env, target_ulong addr, int size,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool nonfault, void **phost,
>                         CPUTLBEntryFull **pfull, uintptr_t retaddr);

Why is 'size' signed? (similar in probe_access_flags).

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



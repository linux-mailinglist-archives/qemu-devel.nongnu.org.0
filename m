Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8411068C653
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 20:00:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6i7-0001E5-PP; Mon, 06 Feb 2023 13:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6i6-0001Dl-2E
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:59:26 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6i0-0006cB-GH
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:59:21 -0500
Received: by mail-pf1-x42c.google.com with SMTP id 203so9107019pfx.6
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 10:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f3OtrwXSwfJpC87TsYuhJYLn56aWcRnxzuKLBspPg10=;
 b=us1R5tjsXexYo2le3Gbc5jUGB/XKVYFGZcT8+Fn6OZUMJObnlkvEs5fRl2RusAeUDC
 o9um8XSBS239cBIP9jgNDSLNcv0IspJlxNx5RTISEQhkBS5zK/6yCpAInr8qtlWo0VlL
 vJgkfWsL21WlZyMVdrRkc6CT6gj8RYpyYluwjAmK0WifvcOOaYLfDvzfKXC4GvsIv2J0
 JiHUFAYFQKtyo0fzSSwy/scljEwWsrGjcoDE1fKKU8/M2qZyUxC4hTCozOZACboMmUfR
 1bsUyoEc9TlvOWKPxzw9WT5f0Lla3tn4W95b0oRfnEhcc/py3xrstRhMwGDvIlboYaEH
 S8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f3OtrwXSwfJpC87TsYuhJYLn56aWcRnxzuKLBspPg10=;
 b=g+nBV8lpYuQ5y6QdTPBXcIyfJ/eG4NqCZ0xHl31g/HfsyNv4mpSRhTQ+1ICibjquRG
 W5Z95JSm8x5vkRNp9Xtb7fQMtT6zLTCtq0XlE2fPxsCKZFjVuMxA7oaB/XyGKvqvfqEA
 RjXeRM+bfG17EdY0x9aOP7c+cZArbRaTHwBBAqx7CJdWCxFPl7NjP48eZ9EB9RRPr/ov
 U6ULW7zYM9yWhLEnbJWMNbmmOjhzhf1M/USt5000iNc3flBBAmBbhf1ctzq3oT3Ju7/o
 Fiu8oiOYG6Nc4j28xu4SMm2TNHG7NYqEXbIHcMQnIR9jW4zVzhJtbuSgT9SOMtMA2Itx
 /MQQ==
X-Gm-Message-State: AO0yUKVTe3MNc87teNfMzKBkgHxKxdjSgvqt1kOjp4d3hnLcdg+33Kle
 QHpHw+FohRaO3Y2OR67hPn+t4Q==
X-Google-Smtp-Source: AK7set86HXAC0YL54Xb2BcesanmMgk+ZY+lt9I8Js7ohL2PiO/XfsYfdqvcgjPcohW8uCBo+jTMybw==
X-Received: by 2002:a62:1605:0:b0:58d:be61:8bc8 with SMTP id
 5-20020a621605000000b0058dbe618bc8mr491197pfw.8.1675709958155; 
 Mon, 06 Feb 2023 10:59:18 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 187-20020a6217c4000000b005825b8e0540sm7476882pfx.204.2023.02.06.10.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:59:17 -0800 (PST)
Message-ID: <1f778126-e60c-261f-b40b-7f6dd8476c6f@linaro.org>
Date: Mon, 6 Feb 2023 08:59:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 7/9] target/arm: Declare CPU <-> NVIC helpers in
 'hw/intc/armv7m_nvic.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206121714.85084-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

On 2/6/23 02:17, Philippe Mathieu-Daudé wrote:
> While dozens of files include "cpu.h", only 3 files require
> these NVIC helper declarations.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/intc/armv7m_nvic.h | 123 ++++++++++++++++++++++++++++++++++
>   target/arm/cpu.c              |   4 +-
>   target/arm/cpu.h              | 123 ----------------------------------
>   target/arm/cpu_tcg.c          |   3 +
>   target/arm/m_helper.c         |   3 +
>   5 files changed, 132 insertions(+), 124 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


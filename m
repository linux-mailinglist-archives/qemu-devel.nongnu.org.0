Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F30768698C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 16:06:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEfC-0007aD-SO; Wed, 01 Feb 2023 10:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNEfB-0007Zs-3T
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:04:41 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNEf9-0001vj-Hj
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:04:40 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bk16so17581836wrb.11
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 07:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7QtHxRicUbozv9CXDAKIX/czt/lnXsH0WngePoTHdkc=;
 b=qmp9Bro6ge/rbM96kZVMi8mYiIFyCKcAb559LqomrjZ7yur2nHNXkX26LW4JJ30yvd
 Fz5vdvAqt0aq746orLOTomDo6SXfMlF0NqmakI4YwNxa9SOwfLM//sbgB+C0LTAtLrr9
 0nhlcLich+GIOPGZbCPZjG6IlbKxIzHB/BxhA4gQ3Acq8Kh/QxVO8R7H8PXmwbrlmFWl
 SHzOjMk7YXURJ2D157ZN3QUizx1gZwdVnb2UaVhgS4YHsVsuUfCXKL3iwGbvdkwHF1nc
 D2tae2lCyHuVWpdPSR9eJSYP6bioAEGCr9tDuVA3vbBdFioTYh0rLKM6Q/gL66K8HZn9
 BuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7QtHxRicUbozv9CXDAKIX/czt/lnXsH0WngePoTHdkc=;
 b=dGXKAMjQ14qRszhShf1JKNS9qCPf/RFVHR/HHvd2zN360OmhVU/UiovqFId2piwSta
 pGQp6SvsZhiIEu2qIzCAt7bfDWYz5U1YMClI1oPEJs+TtRS2sXVO0MSDsRFpXDpjz/34
 aYelU0gXpCXA6FCfwJ1WQLzpYWbYYhwYXjl/DUTvmHSr4UopUZdHxRos2eRSH19E/rvj
 hjv0VFu3f3klOkjqZ/9JmZjEDxXt12UttsL+WzurRjHhYGn/0EqYZPQD9RpmsNREGax5
 1K5g3hpXTz4wqRUrwQR5V1rtfKH8IXTPdz0NX4GFzoR18EWUsBbmyV802utsyTzwwdBo
 s+jg==
X-Gm-Message-State: AO0yUKXmE2fVNXswRdwS5QflrH1gluNwctmR7xQnkNby/vOvtjCP94nk
 OZ6b/SywXJi6HqMrngoFCmoNXw==
X-Google-Smtp-Source: AK7set+9A0oK0dJSHstv6v0xKrO03vyHhm2pJJ3iof4t3BbHoJNmhJOY/KayrkBtTTZZSOn2uw9N1Q==
X-Received: by 2002:a05:6000:1a45:b0:29a:375d:4c41 with SMTP id
 t5-20020a0560001a4500b0029a375d4c41mr2757379wry.14.1675263877626; 
 Wed, 01 Feb 2023 07:04:37 -0800 (PST)
Received: from [192.168.43.175] (107.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.107]) by smtp.gmail.com with ESMTPSA id
 n9-20020a5d67c9000000b00294176c2c01sm17465266wrw.86.2023.02.01.07.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 07:04:37 -0800 (PST)
Message-ID: <779b5187-2fb1-3b8e-bf92-8ee7322c5531@linaro.org>
Date: Wed, 1 Feb 2023 16:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 19/36] target/arm: Use tcg_gen_atomic_cmpxchg_i128 for
 CASP
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130214844.1158612-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 30/1/23 22:48, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Message-Id: <20221112042555.2622152-3-richard.henderson@linaro.org>
> ---
>   target/arm/helper-a64.h    |  2 --
>   target/arm/helper-a64.c    | 43 ---------------------------
>   target/arm/translate-a64.c | 61 +++++++++++---------------------------
>   3 files changed, 18 insertions(+), 88 deletions(-)

Is it worth extract this pattern:

> +        if (s->be_data == MO_LE) {
> +            tcg_gen_concat_i64_i128(val, t1, t2);

> +        } else {
> +            tcg_gen_concat_i64_i128(val, t2, t1);

> +        }
as a helper for readability ?


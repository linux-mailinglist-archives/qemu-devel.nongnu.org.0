Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B664B5F1457
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:07:59 +0200 (CEST)
Received: from localhost ([::1]:44222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNEk-0002x2-A3
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNCa-0000As-RR
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:05:44 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:41782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNCY-0002Y6-U9
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:05:44 -0400
Received: by mail-qk1-x72f.google.com with SMTP id k12so3583182qkj.8
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Ma/3IZV55ITWCAsEYmnB8yobfRjkY3sbClx4bh8/RA8=;
 b=wLQ+5U0raGgLWdNBsiLMoGXzNWmhaO3XiTOz58U6EJ1HEPJlyZVtwLuyppPzOtNCCu
 BDoGZXk0PaHbKJz8miDYnIS830IFcHJq0xqa+qcdPN0VMyHDemfew7UpGqmj0zJFJee7
 z2YqXnIJXX4suGT9DInGn5voaILXSTSVp6zko1heyXtHChCaFby4/XSsIQfudCLlv20x
 523zB6UyPXk+PXSOZjqdFsi8cQcI+Ha1sM3uXEq/IYn6J2OPzEiRzurkStBRVrlYsB57
 c7A3t5ltiZAY/reToBeatIq5f+k2U5ykOkmgYozJQFTeyeX7miGv97nnpHODxRgEtF1V
 KGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ma/3IZV55ITWCAsEYmnB8yobfRjkY3sbClx4bh8/RA8=;
 b=jGVrvLrCsY/jlVaa385NZLXBQjkQ69PQVRBSmdnqiAlm9Pv0YyQ+kzguG24ZGTRszu
 KnBgTqRuNI0n2fxk2VQsYq+szR25hjtVhg3I+32vpJw72zF768m7EA6gtSFxgCE1BBxD
 BJKGFVUgHQ/zJTXjdDPJw39wbRI7xMjLtkVRgBSCztIqK6EQBAWd2YcN81Do96ESqUxT
 17EuGqb2TNspUvMp3U41nRUiyxM+NZo8X+JNkv+lbTUxoJTdgDrvgpcTSl/AGrGScTCR
 Oy6FvvmjBCPZ9oaKKI6oz2Cqrkk+fQ+G0sVeu8Yfato8vdvZ1sWkXwFX7y0m3VD1r7Kv
 2/Bg==
X-Gm-Message-State: ACrzQf041ROE3dKezNeJmS4jm8uDu0ngIRh28ggGqHCyeuPc/X7r27VP
 /jgxwWhu5glZvvr9dxJSm6GNRUdw6Hq7Ng==
X-Google-Smtp-Source: AMsMyM5Mrq++4Br/SyPnNyoDsMLGZ88Tq4C8O3zsx8BSzlsBr0ijgcMQZB8Ka2AbAMKGQhLkSJ37jg==
X-Received: by 2002:a05:620a:4306:b0:6d4:1a11:38ad with SMTP id
 u6-20020a05620a430600b006d41a1138admr104647qko.422.1664571941647; 
 Fri, 30 Sep 2022 14:05:41 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80a1:5a60:d0d7:468b:5667:114b?
 ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a05620a080600b006ce9d6e51f4sm3223174qks.67.2022.09.30.14.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 14:05:41 -0700 (PDT)
Message-ID: <3ebee616-2a99-10b5-0902-d41eccbec1f2@linaro.org>
Date: Fri, 30 Sep 2022 13:14:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] target/arm: Don't allow guest to use unimplemented
 granule sizes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220930174853.2233633-1-peter.maydell@linaro.org>
 <20220930174853.2233633-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220930174853.2233633-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
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

On 9/30/22 10:48, Peter Maydell wrote:
> @@ -10289,20 +10289,113 @@ static int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx)
>       }
>   }
>   
> +typedef enum GranuleSize {
> +    /* Same order as TG0 encoding */
> +    Gran4K,
> +    Gran64K,
> +    Gran16K,
> +    GranInvalid,
> +} GranuleSize;

It might be worth using this in ARMVAParameters. Even if you don't do that now, it would 
be worth putting this typedef in internals.h.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35013A1D82
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 21:12:41 +0200 (CEST)
Received: from localhost ([::1]:35696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr3d2-0008PB-3h
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 15:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3bz-0006zg-0b
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:11:35 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:42872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3bw-0000PH-Nv
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:11:34 -0400
Received: by mail-pg1-x535.google.com with SMTP id i34so13966319pgl.9
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 12:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=B0w2h9rZ9tl7dSL9uHNLhqOokh/6SIDQ9lK0h0k0dco=;
 b=EYfZ8tcTDBbrlnde1BYc6uf5+LqottSydnpvF/ryGWThTBoqComCs6ZWvD1uYuuq+H
 jXfVJsvxZ5Jf2Z07aUYIFwys65gQUy3zATTmBtjzX3VJSRNPf2m7ohe6NrlsJSxa4keb
 qc9ZLWtQ+NQCE0JWj3jyrJsVnECy5SgKwxB5eBfjmRvaIfS/9c090FnhLZ0l25Z41Yqs
 j2zHo5WzAmmWQvVvlUhHy6fi8POScA3NtZYALviJngszMWX42dKsdp0zZ+YC3ryV5J7C
 JEMyaV/8yFckdF1fRuKZxR0uivoHjzpCk5njpMXk8mcTxRZIg3E/y5PyYmK8JGZZA04i
 ATTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B0w2h9rZ9tl7dSL9uHNLhqOokh/6SIDQ9lK0h0k0dco=;
 b=qXCcA2CtcQClp6gEi6PKhXoa21Z95bu5xFxl6Fk/VE2ALsN6PppD1Ap0dPZltkh+03
 reuNQh79KP9UFEaA3aA5TEnAMoCjnWvFxf/kHBlUidW7VuFPunIPGNhy/wM1j9se134/
 0PJP7MWj48iqslcwglSQTSNgYbaBJJfLxO/RZZiNpLj+9fEY3EmJ2G0NSPI6CnxrqcHi
 PKUdLBrcPc6dEfbNgNXFZPMd8y2lSFaPxEr8pfK2VLWI43TtmNZh7qKKOctkElIR/xwz
 y8MSyWUecQO/7goo6UggkUh+3wcz0dQf8vqztnBpu2KYpcTnWmW4i3woaPLUAnVlR8BL
 NUqA==
X-Gm-Message-State: AOAM530rwRjy9xlSMu63Qou1ULKUSzlBZxIqU48in8NytD4qf2PXIyGf
 o1+AG72JxUkWCm7168gQzjHiJOfZXlNYvw==
X-Google-Smtp-Source: ABdhPJxU2RHlV8VOYNvspazcEJ/+4RKdFdfS5n0V5TXPnHsxQcKIEnB0sTmeKy2L8fgtco70JBcx4g==
X-Received: by 2002:a62:3242:0:b029:2d5:5913:7fd with SMTP id
 y63-20020a6232420000b02902d5591307fdmr1302126pfy.30.1623265891029; 
 Wed, 09 Jun 2021 12:11:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 d92sm388731pjk.38.2021.06.09.12.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 12:11:30 -0700 (PDT)
Subject: Re: [PATCH 40/55] target/arm: Implement MVE VQDMULL scalar
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-41-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bef2848a-53d9-d66a-4911-e9b77a4c4d0c@linaro.org>
Date: Wed, 9 Jun 2021 12:11:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-41-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MVE VQDMULL scalar insn. This multiplies the top or
> bottom half of each element by the scalar, doubles and saturates
> to a double-width result.
> 
> Note that this encoding overlaps with VQADD and VQSUB; it uses
> what in VQADD and VQSUB would be the 'size=0b11' encoding.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  5 +++
>   target/arm/mve.decode      | 23 +++++++++++---
>   target/arm/mve_helper.c    | 65 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 30 ++++++++++++++++++
>   4 files changed, 119 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


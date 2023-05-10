Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B506FE23A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:16:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmUQ-0005P3-2K; Wed, 10 May 2023 12:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwmUM-0005MC-5h
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:16:28 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwmUK-0001Oz-KB
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:16:25 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3063891d61aso7095008f8f.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683735382; x=1686327382;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VV2LlSTIePrM9T1rLXUyHlRwTx6iL3gqL+UXUshyu58=;
 b=Wxng4XNEtBixXslk6Dx/V9uKx8ldQLIJskHaK+NxyA+NciBp5PUOZJiv3eH2fz6xRf
 s6M8GOOWs6neNIqe8m2qXufLixh++8aQBgttPhMiroClgSW+ZlPBKTM0xllDIUUdvEH1
 AuhNiXq014pq7CmEM/bt117JHNtcNbZrAHYyJFVuJ5KoY77SWRRE2qp0Rg6XERSXuM+K
 wpesll4unqfhzO8gsk98su4LZV+a15V02v74vF9oyLn+M1OgBOuyWkLydPABJZLwANKy
 T1FXxeTwlO3q9ZKqk5+IzLtgGE8R/TG7e7kmkQsJsjaNI5dfWbxdiP4mXQboa92uZ3y0
 bMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683735382; x=1686327382;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VV2LlSTIePrM9T1rLXUyHlRwTx6iL3gqL+UXUshyu58=;
 b=buptI+BPdjXuAtk5BNcG3cut7dWV2S5wDZb4IaILrEg8/ETd2zKYM+sC+jVZUTf4qM
 Byq9PEqrAZW6oVko8W9qgginIVbiikFEpO+TzHKZd/ViMTbNeE6oWHaBrURfBgQCIuAH
 kY4smNzlEF2Bq+wMrK29KgVcgXtjkfciBr2AOKMvJJVbV6WDrSjW7igZDClMsTJvBYeu
 bGln8PTptXqsUyyi+vqsx7ItAgAuBt8RKFV6c0DgHrnzjEikhW3n2aicYXgXAhyUCUCM
 W1UZCTnYXsqQhrEQgQSgSb8CXZhX7GBHAh8fLl2VFI4q1SHCYeOYkrtp2j7fozkbJKt9
 YWDQ==
X-Gm-Message-State: AC+VfDyU8sl7SqTE5qPfch/+SJPNbX3vehInSfCkqbq7kitCex8V5Hai
 jDgOOClhZ8+a+i+aPZjZjIAbwg==
X-Google-Smtp-Source: ACHHUZ5aJ7s+WqMmQ3/vsxw7MIlPjDvb/ChIq5O+8QjJiARdyC2W6fXeHbtc9STYIwYlG4cEDMCSeg==
X-Received: by 2002:a05:6000:548:b0:306:4162:ebbe with SMTP id
 b8-20020a056000054800b003064162ebbemr12976944wrf.49.1683735382284; 
 Wed, 10 May 2023 09:16:22 -0700 (PDT)
Received: from [192.168.1.177] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a5d4ec2000000b003063a92bbf5sm17904907wrv.70.2023.05.10.09.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 09:16:22 -0700 (PDT)
Message-ID: <390d7ef2-1240-55a3-4b13-ab8796921b7a@linaro.org>
Date: Wed, 10 May 2023 17:16:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 3/3] target/openrisc: Setup FPU for detecting tininess
 before rounding
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>
References: <20230510153228.264954-1-shorne@gmail.com>
 <20230510153228.264954-4-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230510153228.264954-4-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/10/23 16:32, Stafford Horne wrote:
> OpenRISC defines tininess to be detected before rounding.  Setup qemu to
> obey this.
> 
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> Since v1:
>   - Remove setting default NaN behavior.  I discussed with the FPU developers and
>     they mentioned the OpenRISC hardware should be IEEE compliant when handling
>     and forwarding NaN payloads, and they don't want try change this.

There is no such thing as IEEE compliant for NaN payloads.
All of that is implementation defined.
All OpenRISC needs to do is document its intentions (and then double-check that 
fpu/softfloat-specialize.c.inc does what is documented).


Anyway, back to this patch,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

:-)


r~


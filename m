Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED592F233C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 01:07:43 +0100 (CET)
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz7Dq-0005ux-MD
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 19:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7As-00046B-7t
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:04:38 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Ap-0004AC-KT
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:04:38 -0500
Received: by mail-pj1-x102a.google.com with SMTP id p12so500391pju.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 16:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LJNA0ymU8hi3RERfT9NjYqnA2IoQ4wFCQxB8JLyAW/Q=;
 b=M1q6X9dSodIo6VLP26CmHfkuNU2smANxSU/9Z9xJNiKUhnaWDjT0LllzRfsm89/Q/w
 9AQXQzTyyoB1JQ0gXebFAvTeEdBZc/mwrBkW1SJN72h3HU8eksdvhXaoVT2nHVpeH14v
 9vEYBD1rqSBUjOttPVNtg6ZY+xrjjWYSCGuWRUFTCWVDVtixEX/yEI7vGiHbakp9QPUl
 twzK5TipXTlfq16q9TUDPTYnYXB+dIi04qan37y0Nm+4TRiwsTdj9J5L2aDKiMlRXy6q
 EcVnA1U6/Q/flG4helwSHvSzm2qXdsK09mG5t55IRcnr0RSHHIYPQpJzbjtjG4wjy2CX
 Rr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LJNA0ymU8hi3RERfT9NjYqnA2IoQ4wFCQxB8JLyAW/Q=;
 b=V6QJFs7Wu6eeQi8yJwOTskJSNWmYYHug3UusgpZDZWdYhBSQOylOM/GOdrehuNzsHO
 4Cf49HEAKOk3udf3wfycLUZOWmf05TVCEuiTTXpCmQGbEvll9A+Yjr5Hwxu/+OIKIuzd
 b5HT7Vjvzw8uEB6bRAyBzTAXNnZZhXB2kWucHEBZLmG3qoY5c91LhbGqJR+zF05djufD
 oC+YxJERZiverpgcbEMlP/ajAIRt7mGk10CxY3hYFfN2408zEGa4v1bcWJ3nY7IYu95s
 gQ1iQWH7QAa7TCWcHkpkuAhqb2ho6c8G/GYv3kjb8fD/VOm75nHtf7+LxRfB7sfXG2ge
 JtvA==
X-Gm-Message-State: AOAM530q6xPxOev4TyUnetXD9XosOk8eoxxOj6nS+xUDMPbE9b8oUJlW
 LDASvgUznuV8Rv4FdyQkjkxRlI5wMy+Jxw==
X-Google-Smtp-Source: ABdhPJwou5BEYWSd/xUxT2GeNB16rp4kcBoAqcHUIvEKaNQ2yShNSPgWx+KoP9xDhXk68ZK2YTAcEg==
X-Received: by 2002:a17:90a:414d:: with SMTP id
 m13mr1398726pjg.229.1610409874174; 
 Mon, 11 Jan 2021 16:04:34 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i10sm924251pgt.85.2021.01.11.16.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:04:33 -0800 (PST)
Subject: Re: [PATCH 07/18] target/arm: add 64-bit S-EL2 to EL exception table
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-7-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e1eec7e-35de-4276-68ec-7e12cb73a699@linaro.org>
Date: Mon, 11 Jan 2021 14:04:30 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-7-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> With the ARMv8.4-SEL2 extension, EL2 is a legal exception level in
> secure mode, though it can only be AArch64.
> 
> This patch adds the target EL for exceptions from 64-bit S-EL2.
> 
> It also fixes the target EL to EL2 when HCR.{A,F,I}MO are set in secure
> mode. Those values were never used in practice as the effective value of
> HCR was always 0 in secure mode.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c    | 10 +++++-----
>  target/arm/op_helper.c |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)

At some point I think it would be worthwhile to convert that target_el_table
back to code.  It is really hard to follow with 6 indicies.  Not your fault.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


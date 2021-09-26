Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C2A418D06
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 01:14:10 +0200 (CEST)
Received: from localhost ([::1]:36638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUdLV-00068B-SK
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 19:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUdEB-00054p-V8
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 19:06:35 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:35506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUdE9-0002Sd-TB
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 19:06:35 -0400
Received: by mail-qt1-x82d.google.com with SMTP id c20so15101381qtb.2
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 16:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kk3uSxqOC1NdtihgCqiEpcHeZd/wblUq0BD/Lot9F4Q=;
 b=e/5ybHcj9V0DUBOUVYeTGCa0wnH3ElqCaGbN2nxbR1G5GG7zKgczScXLi7ZAd37XmW
 /TWtNiRz6qY2RTAFdjCjsnjd/ufCDH0dWjwVaJlZafoQ9tiqDyHpjJdG2RKAxY7EZrlK
 DyAtXY+DYHV4Qd7Ww+koYQwMTub7JG8EslcNsdUcliKmciGpaSdbByf37VhVu2Usv+zl
 VyfUgJ5JN4iIvlnTr05MNL+fAvOxl/k9sRVsW3Uxok5xvjKiJJgqmyAnPQcCRQ3/NUON
 9yIIZont4NrTBfQjB/Ds0ndb4d1N0d1YHBafN1JtnQFwtKa4IVm0Vw3OONbA+cZ7Tz6V
 SqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kk3uSxqOC1NdtihgCqiEpcHeZd/wblUq0BD/Lot9F4Q=;
 b=JgXzSLKO/fvbIyYc9NRucV8yEpFwJj6yxwjnWh2jHWoeBZMZdSuMDw7ZkKJdorg4Jm
 hYe3OBA60ZtUJFghW4sXd9vWXpDHqq2qp7/y1Emge3+glTFnp+jF5qBQHumF3EGtkUFX
 hL1QGdl25GtNqPAwxCkRnBP6cceSN0IdCtDEA9oZhAJ0TpxaFFNkDgFxMzw0zSlhevOd
 Bz677/agcd6wFvJBGm1yP1Fem8vrUju8DDvxOjfueIvmlqo67XfUxngYOPbsUJQZygeb
 hLMNo5+gFvuRG7XYbA1M8urmnQwtsdfPQcMh22n9/+ivdSr/Ur1Q5ZPNdJiGjCbAhZ7n
 oIcg==
X-Gm-Message-State: AOAM533BMRSRMPx+BhH2bn8CHiRzoEKpmvSs1lFZf++OE3d1iEtO8KaR
 kCbfaTxtywQ4GAStyLpDp4oayw==
X-Google-Smtp-Source: ABdhPJwvB1TfG/WEB9lnMDKIYbqRRhA3vkkZxMa67xxabTEqHH+yqnquIhZinnYkaspepC77XolOHw==
X-Received: by 2002:ac8:5c87:: with SMTP id r7mr15853128qta.114.1632697592139; 
 Sun, 26 Sep 2021 16:06:32 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id i67sm11161030qkd.90.2021.09.26.16.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 16:06:31 -0700 (PDT)
Subject: Re: [PATCH] tcg/riscv: Fix potential bug in clobbered call register
 set
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210926213902.1713506-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fa4c2f52-d924-4b58-16c6-273ce7dba392@linaro.org>
Date: Sun, 26 Sep 2021 19:06:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210926213902.1713506-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Joelle van Dyne <j@getutm.app>,
 qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/21 5:39 PM, Philippe Mathieu-Daudé wrote:
> The tcg_target_call_clobber_regs variable is of type TCGRegSet,
> which is unsigned and might be 64-bit wide. By initializing it
> as unsigned type, only 32-bit are set. Currently the RISCV TCG
> backend only uses 32 registers, so this is not a problem.
> However if more register were to be implemented (such vectors)
> then it would become problematic. Since we are better safe than
> sorry, properly initialize the value as 64-bit.
> 
> Fixes: 7a5549f2aea ("tcg/riscv: Add the target init code")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tcg/riscv/tcg-target.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index dc8d8f1de23..5bd95633b0d 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1734,7 +1734,7 @@ static void tcg_target_init(TCGContext *s)
>           tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffff;
>       }
>   
> -    tcg_target_call_clobber_regs = -1u;
> +    tcg_target_call_clobber_regs = -1ull;

There are not 64 registers, so this is incorrect.
I don't think your logic is correct.


r~


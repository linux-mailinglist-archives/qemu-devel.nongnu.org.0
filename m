Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728715A410F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 04:23:39 +0200 (CEST)
Received: from localhost ([::1]:34894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSUR8-0004I1-J6
	for lists+qemu-devel@lfdr.de; Sun, 28 Aug 2022 22:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUK6-0004kI-F1
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:16:22 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUK4-0002bH-OQ
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:16:22 -0400
Received: by mail-pl1-x633.google.com with SMTP id j5so2737613plj.5
 for <qemu-devel@nongnu.org>; Sun, 28 Aug 2022 19:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=H0A8AW5Uk5SLA+c7yxDiqKnBd7Sf/J6CX7qYgRLiowY=;
 b=YNTb8xLzuQYC/5dNQNsF3R+CVwqgHMsGCg0lFqGNDnDS4V9IZnhbadAh09G1JcfEOD
 Ohqz3oF6uIL2+C49lsV1lE0nJS7euQGBljs7AkTHfZ3WwxcrSXJGqkacy5tWkTWs67QU
 F5tFt+CJpLSUOHDil8+WfbIM9SGzkQsX9x3wPqcrwyiE6P3FBHiJRyG14HBzWoSFkhcV
 a+Sddd14xajf84oqFnRwtcMKo60eoKQQwicKatG8bCmfNfn1LnHYESQ7lPpCF4vwGpsI
 WEbeKCdAvCYy8+rdM2YMAXsrWnh8fsg+MAAtgmu0QmmWW8f+i58rNLJXpkwcpEn8Jf5n
 FUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=H0A8AW5Uk5SLA+c7yxDiqKnBd7Sf/J6CX7qYgRLiowY=;
 b=oGzvPU1QbDynViDMKo//ju9/3jiXPJpqfRzfKOqCaKTijkJnI6E7c+hlmNDrozj2YY
 2Q1yRZPNqokOJOfIXvgvKlUmTqFGdI+ZKXSPYwC2WMAotOT49HZze6H/qMM4DVawiyFz
 lWHNUozfZrgM6TXj2xPAcsO5YClEjvd86DCtOy6iebXs6m6Tx0a9Ivldbyhllb1Zcgs7
 0T6WAe+nOnAKobH2yfmMytSwdnxfRf0oaOqr6p/M5XEhxdjBEvVIIkEkPOO2epGinUan
 4xkHhKeVrydJTkKnbSLIz6Km4cmRHjDqrKL5C8r1dXFuQBnPdX2eLsOmbE4BTFYEDEjn
 lIlA==
X-Gm-Message-State: ACgBeo36cd7IkdjnkkCmYJZhPtpnSIIv9vfuWN/BI5lvp+DvmVHuJJDF
 WdvnZCwks6ftv9hW+PcKB3dAK9F7JlYp/g==
X-Google-Smtp-Source: AA6agR7mZ3YlPuF+e2h5EdK6zzuOicavSeWUfA0NW17ahmu2U0bDLLWuPfHcvJjuOlEYcCykdhSgyw==
X-Received: by 2002:a17:90b:1c83:b0:1fb:9d43:866d with SMTP id
 oo3-20020a17090b1c8300b001fb9d43866dmr15835768pjb.246.1661739379232; 
 Sun, 28 Aug 2022 19:16:19 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35?
 ([2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a170902654700b0016cdbb22c28sm6110611pln.0.2022.08.28.19.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Aug 2022 19:16:18 -0700 (PDT)
Message-ID: <21a694b6-e0fc-f20a-9a8c-a8ea993504c6@linaro.org>
Date: Sun, 28 Aug 2022 19:16:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/sh4: Fix TB_FLAG_UNALIGN
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ysato@users.sourceforge.jp, alex.bennee@linaro.org, qemu-stable@nongnu.org
References: <20220829021325.154978-1-richard.henderson@linaro.org>
In-Reply-To: <20220829021325.154978-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/28/22 19:13, Richard Henderson wrote:
> The value previously chosen overlaps GUSA_MASK.

... which meant that we didn't translate the gusa sequence
into an atomic operation, which meant the multi-threaded tests fail.

> 
> Cc: qemu-stable@nongnu.org
> Fixes: 4da06fb3062 ("target/sh4: Implement prctl_unalign_sigbus")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/856
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sh4/cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index 9f15ef913c..e79cbc59e2 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -84,7 +84,7 @@
>   #define DELAY_SLOT_RTE         (1 << 2)
>   
>   #define TB_FLAG_PENDING_MOVCA  (1 << 3)
> -#define TB_FLAG_UNALIGN        (1 << 4)
> +#define TB_FLAG_UNALIGN        (1 << 13)
>   
>   #define GUSA_SHIFT             4
>   #ifdef CONFIG_USER_ONLY



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFB468C641
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:57:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6dR-0007II-7O; Mon, 06 Feb 2023 13:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6cv-0006uX-Ko
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:54:07 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6cr-0005bs-VL
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:54:05 -0500
Received: by mail-pl1-x62c.google.com with SMTP id b5so13174430plz.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 10:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5gOo9T7+qMaBpYe6dFazxmfDPYGJfnU1EgxVf9qKFSc=;
 b=oD/T86EA76cwnHTZCo66GkKrcpSLLUeSAm5H4UgvufdTND3zhyDGxm7I5vS5FDoF+w
 AlY0L138S0W1xGtQ1TuX5WInoMroUBV+gmQFLsEW0MX5eL5d1MsyVEsL9F9elO5jS+9z
 TYa1C9l4VlgjLbmxbkBhbvakFseEtAsDC3q1OfvhfSUeJkL7nSqmqod40nxLOE4EhuHs
 pPdbnF8m87uh4eZKQSqCtJWih/rSS/Z7oTA/NAa9o2WWcd42jkSs/PYkgg2Z0n/Ew5uV
 oxl0nHU9hikbf+KfGcdFkEVscid5BxZ9Dkns4dfCxzEjEXdlmCfUHq7vo1WNr+YnBrzZ
 kF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5gOo9T7+qMaBpYe6dFazxmfDPYGJfnU1EgxVf9qKFSc=;
 b=WpIUt9135l7iCTmvMUT7+QLKsisHhwxn+GZj28juYzrucoVE8qMj02yX5Hh5bP8ZKa
 /9Gp0ie0K+ATSLIoJvFIeFPSq1KWBWT34S88zLgUV226Lfy1aP9J3wTxp+S3hFLgRFhh
 8VI0WRRRYyQMQc8VTfCW9VDbXNzqUtbglDZVYmyIA7SoQ/TfhrPrqG/9KnrFnHuoa9gr
 Bin96gJGE3ung87olOsMHbmedziNTw14kg26nK4zK4UZn7uF4EN2eW9zwKrFdRkvFVFm
 /6eQwTyUH8CJIfboc+T4UEvb1Q2qOWjT2FYDN5cN8rcmGkUHiaZ0tFkm1nJ/tvDpC3jk
 KZmw==
X-Gm-Message-State: AO0yUKVDlgUTMdZ0Kg7vwV+ji5OKUHRd8uTUN2/W4DRIdx2Dk8MDdS7X
 f/2HLU0wza4z1bZC0iHeKVnJGQ==
X-Google-Smtp-Source: AK7set/oIDwABf974kTxMzidujVQpNdNCqzWB7vIzNV0qUqvIXAQUwfoB4AN+kScknu/OTKTDCsA0Q==
X-Received: by 2002:a17:903:32c3:b0:196:a07d:7a9c with SMTP id
 i3-20020a17090332c300b00196a07d7a9cmr26143948plr.28.1675709640088; 
 Mon, 06 Feb 2023 10:54:00 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 i5-20020a170902eb4500b00199204c94c9sm1714373pli.57.2023.02.06.10.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:53:59 -0800 (PST)
Message-ID: <1770bd20-a612-d884-2d7e-7046f2d1982b@linaro.org>
Date: Mon, 6 Feb 2023 08:53:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/9] target/arm: Restrict CPUARMState::gicv3state to sysemu
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206121714.85084-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 01d478e9ce..61681101a5 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -772,10 +772,10 @@ typedef struct CPUArchState {
>       int eabi;
>   #else
>       const struct arm_boot_info *boot_info;
> -#endif
> -    void *nvic;
>       /* Store GICv3CPUState to access from this struct */
>       void *gicv3state;
> +#endif
> +    void *nvic;
>   
>   #ifdef TARGET_TAGGED_ADDRESSES
>       /* Linux syscall tagged address support */

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


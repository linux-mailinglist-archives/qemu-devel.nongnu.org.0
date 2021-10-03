Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA164203C4
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 21:33:19 +0200 (CEST)
Received: from localhost ([::1]:47022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX7Ec-0003ML-OM
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 15:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX7CH-000239-Ce
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:30:53 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:34430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX7CF-0006Yv-Ue
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:30:53 -0400
Received: by mail-qt1-x836.google.com with SMTP id m26so14112302qtn.1
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 12:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/lXaW0GH1qPPHTl3d97F7oIcDJ2wQnADO69Tpait7lc=;
 b=WdMHWK3SA3/biGYYpm2ypbmma/iQxZ4SYobQhQlTrbqvyiDcqtrsBRmwER53kuPhw+
 R8VLHPMQBZgU6/he3chfp63hSL9ZPXXwYKSQo29vXUkZZ0hoDGnjxDXY3DewUr7eYsPg
 9JDBXZbeSvAgpBNhAUhv980JAJvgoFyWAFvEu0NBwEHrKaTCnK0yu9m/TFsQU0AlDd35
 x6b2VoqhbKAGsx1vQRUi6TSibNa0lMNkAZ59ZF3AQKzbJOY1EdigYtjMXgfvkCCeCYOD
 UkVsK/6eThHR05xDV+dfi4ujsurTnbxF+kuD95aLcCuaKfmlwNr4/8wuZ9HxeTzmajMp
 3deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/lXaW0GH1qPPHTl3d97F7oIcDJ2wQnADO69Tpait7lc=;
 b=oMQ4BGKvnnZvTym4DDXQ4GGjDmqTDb/GQVEuU8OYejqiEC9Z2sXRibZDbQe6jY0frp
 okw5FxhXyojueSJSM7Xaz984bDOGfPITo+vRgVs/bYTHyt+vYzQNtmj+JiUjoOgtUxYS
 NET7GM9ohiPkqE63FCeWAMikTRfNFutEi//2YUY7uxC1b9lfQMzZJa59qXy6o3fkw+lm
 DQBUKUFpu+PfR2MBeNnodfYsTm4KNIzjLG09u6ito/tmVnSMyUnagrLsDfSQd5osrjkC
 b6Oc8dG2VrtEgXPt2aUDxH5L3TKVCPPdkwD9xFkLyD75p39DOxgzaGRxxlGB9wFUDz7b
 fESg==
X-Gm-Message-State: AOAM531IsDFdZcGnPxXP+i2nGx/WdiOezaSk92KBIqc3t0GifBo8vf9e
 JOOoUeVLRYDo+YavdzxFxI2K+A==
X-Google-Smtp-Source: ABdhPJxSFpfHXysyJeASjkU7/DlNFiUAPcnYJVJ7yIM2QqQw+zRfDuJIyK63tEDr+grOj8N9TLBG4w==
X-Received: by 2002:ac8:7d4b:: with SMTP id h11mr9906166qtb.333.1633289450571; 
 Sun, 03 Oct 2021 12:30:50 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id o13sm8150239qtk.37.2021.10.03.12.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 12:30:50 -0700 (PDT)
Subject: Re: [PATCH 5/8] target/mips: Use tcg_constant_i32() in gen_msa_3rf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003175743.3738710-1-f4bug@amsat.org>
 <20211003175743.3738710-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ffb23ad-2a66-c9e6-12a6-a35e5c669652@linaro.org>
Date: Sun, 3 Oct 2021 15:30:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003175743.3738710-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 1:57 PM, Philippe Mathieu-Daudé wrote:
>       /* adjust df value for floating-point instruction */
> -    tcg_gen_movi_i32(tdf, df + 2);
> +    switch (MASK_MSA_3RF(ctx->opcode)) {
> +    case OPC_MUL_Q_df:
> +    case OPC_MADD_Q_df:
> +    case OPC_MSUB_Q_df:
> +    case OPC_MULR_Q_df:
> +    case OPC_MADDR_Q_df:
> +    case OPC_MSUBR_Q_df:
> +        tdf = tcg_constant_i32(df + 1);
> +        break;
> +    default:
> +        tdf = tcg_constant_i32(df + 2);
> +        break;
> +    }

Is a second switch really worth it, maintenance wise?
It doesn't hurt to put an unused constant into the pool...

But it looks ok,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


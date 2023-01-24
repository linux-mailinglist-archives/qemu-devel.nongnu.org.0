Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D70567A34B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 20:46:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKPDe-0002gx-61; Tue, 24 Jan 2023 14:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKPDb-0002ga-Ny
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 14:44:31 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKPDa-0008Sd-6Y
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 14:44:31 -0500
Received: by mail-pl1-x629.google.com with SMTP id v23so15812211plo.1
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 11:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WC5DHNMvwRKszOI5lnTj6GZQynk0Zt2ZYYvVyitaFbg=;
 b=SFHYsRomuRPYaLT/OAF5vpyfDTq9w4dSyu9BizHI4CaaWeW2PJ4WodgC9svyC67zdA
 97F+v4DuDaZUzVfeby7Tafk5VxCoevuBG6P6HZJEBBO4nUcDH1JK5wESskU2GCmF3nsV
 csZX0SFf4vQOzmX7c7tsGGFNflArC8z+hWcEtpNb3A7BlCAMji/m2uY8x8UHT396KgCY
 LgPfJH5ntku/GtctRTV+SjrrAdOFfV0RXK8SIWUE887/DYoRy8nYVhpK//+G+Z5M9sQU
 I7UUcbtjJflCUiuI85346zcOv3QJhRcPUTWv76Dvi8dk2yE2RfhLJ7z4wEfyvHj+HON+
 HFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WC5DHNMvwRKszOI5lnTj6GZQynk0Zt2ZYYvVyitaFbg=;
 b=w488boOzm5UNKonShrLbgFgN3NXf+zMNVMHVRXe9k8ZVmGNIxqprJExBmEGm5kHI53
 iIfWSTZaRGN3Y8Ivu6QzCuW2zjAEjPnt5GjV2qP3CmmB+TNdUmTecVKDxyCke0AhjjSF
 kD2Ov+ACAayQ+ArEUq4zqn9nwEbvyWGV/91Sjr+3Jb1MVAHGbcC7roD6wepmEKX7jlOd
 +VfsvJGJLUoHUfR6Krp72OXqbnLcrn5DogwaMSIhPWxKAj45AW985OiGVuFUJKb8GsCK
 vV0anUQFG9+Isv17cvjuEbE6I0ASbxaUEbwvCjYiPYlz/BN3BkepRV+W3Q8dhLmPB4MI
 RbLA==
X-Gm-Message-State: AFqh2koqMgsyD+gt42hNCMMR/HYwVv3iRLXjqGly6BtJ+DbKPANmsmtV
 cypFu410cKZWDSY0/WwNhw26Ag==
X-Google-Smtp-Source: AMrXdXuYH0uWH0cHV1XOFgR9B1/QaRFxpi4OhRQsV+QmDmMfsHJ3s3qSE1Oexmklvd72cJvM3o/gXw==
X-Received: by 2002:a17:902:e78f:b0:194:d5ec:9be6 with SMTP id
 cp15-20020a170902e78f00b00194d5ec9be6mr19120801plb.23.1674589468619; 
 Tue, 24 Jan 2023 11:44:28 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0017854cee6ebsm2054910plb.72.2023.01.24.11.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 11:44:28 -0800 (PST)
Message-ID: <cea82e78-b53b-081b-796d-b220809bc5e6@linaro.org>
Date: Tue, 24 Jan 2023 09:44:23 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 33/35] tcg: exclude non-memory effecting helpers from
 instrumentation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-34-alex.bennee@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230124180127.1881110-34-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/24/23 08:01, Alex Bennée wrote:
> From: Emilio Cota<cota@braap.org>
> 
> There are actually a whole bunch of helpers that don't affect memory
> that we shouldn't instrument. They are helpfully identified by the
> TCG_CALL_NO_SIDE_EFFECTS flag which marks out lookup_tb_ptr as well as
> a lot of the maths helpers. To avoid the string compare we introduce a
> new flag for plugin internals so we skip that too.
> 
> Related: #1381
> Signed-off-by: Emilio Cota<cota@braap.org>
> Message-Id:<20230108164731.61469-4-cota@braap.org>
> [AJB: updated to skip all no SE plugins, add flag for plugin helper]
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v2
>    - use TCG_CALL_NO_SIDE_EFFECTS as suggested by rth
>    - add flag for plugin specific helpers
> ---
>   accel/tcg/plugin-helpers.h | 4 ++--
>   include/tcg/tcg.h          | 2 ++
>   tcg/tcg.c                  | 6 ++++--
>   3 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


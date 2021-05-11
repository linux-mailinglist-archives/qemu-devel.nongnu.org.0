Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D112337AB07
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:45:45 +0200 (CEST)
Received: from localhost ([::1]:52320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUZs-0007W4-VR
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgUVB-0001dO-M2
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:40:58 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:45643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgUV8-00033C-Jn
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:40:53 -0400
Received: by mail-oi1-x232.google.com with SMTP id n184so19368419oia.12
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GjmP8ROM6jP1J2MLXt3zFMStlYNvzSp5sjSiLAcEdf8=;
 b=lz+HGdih86UyWzw/z3KN/SU7q2jBJx8bhyY4ZSV2cxoeFzrRtUudK/gNC19++Ph6Qk
 T9ZWmVz8aFHk86YAdbPTJSvI7FVtkI/Fy/nJwGL4UOCbyQTLZ5+08/aW//RHG2bg5NP7
 24jUaZPIavkHkENgWmAEj653TL+8pw4y+HJGHC/0GgNuzKNgApBs2Vcfg7vsFz7Df5ye
 cTSFnCVtQm3iRYPdiiVEy0gWZkrqv0aackCf/wi8vqtf9PHXaFTup3mqzDFoUEU1sKkY
 9HtKrESfffOsjRhZ4UY9gqsl9GAjVdtezeTc7BxNu1vE3YrJZXw4Y4l8AkrPiQ2KE7Mf
 pGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GjmP8ROM6jP1J2MLXt3zFMStlYNvzSp5sjSiLAcEdf8=;
 b=To0EyhnhLWn/4KHhuE/0v9/CzgmkeZJ5a2Xf2sQCAQhIsYnjnL1txVpKHzFKXLYkQi
 H7sFPH3D6d9zlOKkvPaAokVxC9IGzFuTdyUnujNNVDJwHKUekiDhMfudXMm9O85ygjwB
 xSyKgzH0CJ6BdxA9/ymidzrYKxLLJ6/XLVqgyqrXpaJjFX+jDfW0vL8iA6ns/A+k6kOH
 rrRTREhEjk0u3S5xfZWe6OtGxV50rNkaN/QXCbXd3v/Lrb4pgdqE2yiPe1YmfJeYzL45
 mjDHV2NTiCemmwxEeqEqwypO8GIeDK/uPYeQ7Ry/j2RdGUaPuWl/ZxtpxeOgCwNzOWmC
 51wQ==
X-Gm-Message-State: AOAM532/SO4emRS+AWow16ej6gQhx8To6MGh6GnDXIxnbgWcIGm8tJ++
 +FD1h8X7MLaYnFg71/JYMbU+dA==
X-Google-Smtp-Source: ABdhPJxqxOODQ7OUHwsLJYl5u45LKYhS0P51sNeshjHniUDrmQrzsm13URgkqSCzI6T4n3f8Mh0jJA==
X-Received: by 2002:aca:ba09:: with SMTP id k9mr22249923oif.178.1620747648522; 
 Tue, 11 May 2021 08:40:48 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id n98sm3863445ota.24.2021.05.11.08.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 08:40:48 -0700 (PDT)
Subject: Re: [PATCH v6 06/82] target/arm: Implement SVE2 saturating/rounding
 bitwise shift left (predicated)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-7-richard.henderson@linaro.org>
 <CAFEAcA9Pv00takQH-2gJr27a58ivkcO8P+XowkziqDuf5BZKhQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bf5b06b9-6b56-f006-eb58-5d5a9f249e07@linaro.org>
Date: Tue, 11 May 2021 10:40:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Pv00takQH-2gJr27a58ivkcO8P+XowkziqDuf5BZKhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 3:43 AM, Peter Maydell wrote:
>> +#define do_sqshl_d(n, m) \
>> +   ({ uint32_t discard; do_sqrshl_d(n, m, false, &discard); })
> Why pass in &discard rather than just NULL ? (Similarly below.)

sat != NULL means enable saturation.

Discard the results because unlike NEON, there is no architectural SVE flag to 
indicate that saturation has occurred.


r~


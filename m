Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F8268E439
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:10:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPX5s-0002Ja-26; Tue, 07 Feb 2023 18:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX5p-0002JB-JF
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:09:41 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX5n-0006ER-C5
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:09:41 -0500
Received: by mail-pg1-x530.google.com with SMTP id 7so11533867pga.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 15:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AelK7qIf/aAJ//2rxhJg/Cs46G73Ry4bhJF44sgxCSE=;
 b=WOa7r2llOkkiSzoAgNppFzOX82bqU1jRXQxnMn/lqA/4wYH4vbAdbJPji/5ITJdrjt
 +fpb0KLHkbR4CXBHC+zdmHFwcqu7r/xOEl5J4vQFAXdC8KqXn5RhjAK/x8OZfv6Oj7mn
 a2ltAtCBe725Y8QWkvsjnUBU5uXYmBL/qWEAQHkvyNfp+gB7RYQLXsylO9sa2AcZPVlY
 Qq9J0oqzy5L43ANBbG57QSSO0HbS9foAO0ppHEs0xeRJWqgBUkCpu1M2pf2Ckx+248uv
 CwikEfKKNDWA3dpdoanNdpJ7uE+onDxU8ubX+Q2va/sWHdgKz4Wx92F1D6iwlZTJSbtB
 RdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AelK7qIf/aAJ//2rxhJg/Cs46G73Ry4bhJF44sgxCSE=;
 b=V7C+1G8mnqWqOhQDDO7NPIewDfuJr0/9cxZkA97i9xBDZ9mEkf1NJBpkc1Lws5vY/K
 +HzjvRhV12+xKvaVmBfEf3RuVw9Lf+9zujwraHpRDXo0FSd6eAA+381+ziSVHNev0ZFk
 FNQndkfQbBAz4PQ30WPI6aWc9fHFMi94qBW+rPbrSXu66MAckWbRaBREFrmB0TOMnRzv
 Q5tQtZOouNcroLr25a+BShGBx626gU00zc8JDNPxDMWiHHxFqHXWvuJoWCa3ltDgGgQp
 crRj8aOsPSoiB1sxaExKbxyGuESOjA/7XPt5pA0ccQP8mPeKotkAv7MceyT9dM8UmHVi
 RV8Q==
X-Gm-Message-State: AO0yUKXp1emmyzIi5HQeR5FTFgeRwaBizrMUFYnCQeFgIJpqGLt2kg90
 t/boPGJjzPn4/jfgxyzPA6LJkw==
X-Google-Smtp-Source: AK7set+PzcwkZF8UqujtPHZVHbxM0gHpnxf+i+c4NltnVLrsTHpvcdfgMXNRAdwAWEPm3hlI48V+MA==
X-Received: by 2002:a62:33c4:0:b0:58d:abd5:504a with SMTP id
 z187-20020a6233c4000000b0058dabd5504amr3929004pfz.31.1675811377933; 
 Tue, 07 Feb 2023 15:09:37 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 h1-20020a056a00170100b00593c1c5bd0esm9805210pfc.164.2023.02.07.15.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 15:09:37 -0800 (PST)
Message-ID: <775ff0ab-fe3e-d864-c205-a0f0da5b7118@linaro.org>
Date: Tue, 7 Feb 2023 13:09:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 05/11] target/arm: Convert CPUARMState::eabi to boolean
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
 <20230206223502.25122-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206223502.25122-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

On 2/6/23 12:34, Philippe Mathieu-Daudé wrote:
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   linux-user/arm/cpu_loop.c   | 4 ++--
>   linux-user/user-internals.h | 2 +-
>   target/arm/cpu.h            | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


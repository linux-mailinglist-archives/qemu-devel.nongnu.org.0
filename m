Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0783CBF23
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 00:16:55 +0200 (CEST)
Received: from localhost ([::1]:32832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4W8c-0000dP-Ag
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 18:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4W7O-00089m-OO
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:15:38 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:46733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4W7M-0005fv-Ui
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:15:38 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso7873400pjp.5
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 15:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/F5CXRKSk7tqgHt1BAeQibP8uc+zwU1CNx0qlvCnlPs=;
 b=nOUHo5cb9BG17PlMAM6URqrMLGVpaJ6fCmpiwQThmoHNCq60W5TNjZxVQew/QT85UP
 AT+K93OhXtn0U6QDK4Wja/LaVQ0cx/kOR80oHeJ2lUO6mcZdCeVQyCWH2ALLi6A8mEW+
 1YNvb1OEbr/YSyVrGgZ8grIzFxNcTJMGGvSp6PoUvdVrvvnJJxbViMpKryG/9SRbLTlG
 2R5lI4EysISDFs2uygbhDR6khgjnJplg5Y1LYEil0aN3giLj5tK9SjZSXfGDcP9RpHPJ
 3rvTY2O919JKFnSssC6rolfsiiNV57pjviriKzg1RwEH2HupZ+0mevrm6wVD95+Mfp0d
 BFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/F5CXRKSk7tqgHt1BAeQibP8uc+zwU1CNx0qlvCnlPs=;
 b=TzpeI+jHnaInzEixAXoB3rG74oONrK0BImuOl1kqpxBQNr7uMwgmxJfKM7CEAm1tP1
 AFg2JIId7fYzI33Xp912QJC1VcUAsFLabuVuqSQjTlZMNV0kuHrAz+KdvjfCMbi1CY9G
 Y8BVdF8k/Gm32nGYvM2SfYoC3zg44EYZf2gpH8JXzjcHrB6CxUEWJ7afLwn9sBtyR7Yk
 AaqevUsFpM+orJm/vxZyCm0PvohH676CJxnKqvJVwQSba12dIQL1i/4ctk8k04rfXZmi
 Jmn20oUcoP5gGlIVdIAQ09axiQoz/uUW+hlEYNrbymwz58tKh4jw+55zvLuKII3SfPmN
 uigw==
X-Gm-Message-State: AOAM532H4wrO9TIgjmB0dvu8aevYRuJCmwoVpJFVVAtDWmEbf/NnwT8W
 X4sPXFjJKhXQr3XwzgtklkejjRKBig8Rtg==
X-Google-Smtp-Source: ABdhPJyO/3hKELQh9rtjYNwRTz+CavNCEYg/gS5hgXMZBE8qFyUyICNLPEv0fV1SJO+nQpRmPJRNew==
X-Received: by 2002:a17:90a:6be1:: with SMTP id
 w88mr11891892pjj.121.1626473735365; 
 Fri, 16 Jul 2021 15:15:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d29sm11611024pfq.193.2021.07.16.15.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 15:15:34 -0700 (PDT)
Subject: Re: [PATCH for-6.2 18/34] target/arm: Implement MVE shift-by-scalar
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cec87fea-ca09-c681-4465-241d4e973098@linaro.org>
Date: Fri, 16 Jul 2021 15:15:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 7/13/21 6:37 AM, Peter Maydell wrote:
> Implement the MVE instructions which perform shifts by a scalar.
> These are VSHL T2, VRSHL T2, VQSHL T1 and VQRSHL T2.  They take the
> shift amount in a general purpose register and shift every element in
> the vector by that amount.
> 
> Mostly we can reuse the helper functions for shift-by-immediate; we
> do need two new helpers for VQRSHL.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 +++++++
>   target/arm/mve.decode      | 23 ++++++++++++++++---
>   target/arm/mve_helper.c    |  2 ++
>   target/arm/translate-mve.c | 46 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 76 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


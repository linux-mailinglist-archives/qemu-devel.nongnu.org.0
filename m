Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B617A59A6D8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 22:06:19 +0200 (CEST)
Received: from localhost ([::1]:54774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP8G0-00084M-WA
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 16:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oP8Dh-0006gc-P1
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 16:03:53 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:37386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oP8Df-0003F5-UL
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 16:03:53 -0400
Received: by mail-pg1-x52f.google.com with SMTP id bh13so4494534pgb.4
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 13:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=mmxlBsGYr6+uP9SSFRGD/3nsR4AlNgYtWFt+/SeBEp8=;
 b=KMfnFpM168gNxROMZYnnMWTGjjt0ZztgsLpCxYLSMj8wiman4dlTtlk3K1BYLJoLpW
 a0E4VKn3EQ7wLL9pC8GbeEYpNrOT/G3k11QOSdQbZpSjFgeWXW98v2oYfKytNY/L5ii0
 9gW47NBcVUtiICs4b+ZiUWlhGQGaxMEJ2pqr90LVSeCbZStS37mHJCvP0pMAWX7sCCnN
 ehIkhTesIB9gsgvtAWj3IoZHiN4oMp9tGhBJxca5DwzGWnhz6A7dTNR/wWCIYK98NHYu
 1/M3GgkCvnYw3Imomw0SIxRk91Uomg89IxL22T+6qay2LM7myT3Pfr0MAo+7xgv6ij84
 cN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=mmxlBsGYr6+uP9SSFRGD/3nsR4AlNgYtWFt+/SeBEp8=;
 b=uRN2SHFX8y9jOp7+MN2n+BOVdCMP2XksbaSrxOYjCxpdiiaHYUlr1UaqU7UV01gH5x
 wolOInLvcbwq6WLBhgOsoAZwschGwcr+DgJUGI9RD4kIq29ITj3vupdJsf7z74d6mN5U
 KfotW+dnaUkxf136fEiXQPpHiOcnnZo0QjUawQseWMkhk+XvVpyRbCcpiYsHaLADB/2M
 svR7sI0Sbfd2Dca4PUTKmM8mR8QdYgS+B5d4lHpKwYYRb8zeLQbYSp60UWzKS6+ZH9Sj
 5ePOK7Ae3NtybGGvmROXMNLvmIQE/m3oWh/d5EZgQnNrcZE2xh+OSa3m76BIYGtfsM6M
 kQcw==
X-Gm-Message-State: ACgBeo1AvIYQeXMfskEP/c2Wh6JhDolmcK0tDkyRR6Ld7rnXMiPKjov2
 oyzkWiX/iagvHaEqkmxfvxLDsg==
X-Google-Smtp-Source: AA6agR7NcA/6RQrEi3fCwIMeFfsa07x8g0YdGxx2Hv8K6AToheIDmexv5QIQoE7XaV077nU2Xg0tjA==
X-Received: by 2002:a63:90c9:0:b0:42a:306e:5e2b with SMTP id
 a192-20020a6390c9000000b0042a306e5e2bmr5258183pge.380.1660939430056; 
 Fri, 19 Aug 2022 13:03:50 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:f37:9eb9:ca02:d0cb?
 ([2602:47:d49d:ec01:f37:9eb9:ca02:d0cb])
 by smtp.gmail.com with ESMTPSA id
 jd22-20020a170903261600b0016d7b2352desm3524548plb.244.2022.08.19.13.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 13:03:49 -0700 (PDT)
Message-ID: <73461812-f4d2-8a1b-efd5-ac10dfc1071a@linaro.org>
Date: Fri, 19 Aug 2022 13:03:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] configure: improve error for ucontext coroutine backend
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220819170251.227526-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819170251.227526-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/22 10:02, Paolo Bonzini wrote:
> Instead of using feature_not_found(), which is not a good match because
> there is no "remedy" to fix the lack of makecontext(), just print a
> custom error.
> 
> This happens to remove the last use of feature_not_found(), so remove
> the definition and the documentation.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure                   | 11 +----------
>   docs/devel/build-system.rst |  5 -----
>   2 files changed, 1 insertion(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


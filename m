Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FD359EE2B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 23:24:08 +0200 (CEST)
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQbNX-0003f3-Da
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 17:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbMG-00026e-Ru
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:22:48 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:43601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbMF-00041I-3m
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:22:48 -0400
Received: by mail-pf1-x42c.google.com with SMTP id w138so12021670pfc.10
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 14:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=7pvRK/5jDaE+aoD4xguEj2hUlbOwi5nOf8Y1Ppj6smM=;
 b=xcHVLDer+9cMRGew1CR4VapEKyFO+7gcoSzZc6QY/UWgO35Bxm9bPKU4sS2fPiRzxd
 T3cHVFUkM38I9T6NwkI6a4f5KZbVwAJHjxRhBJxkIHuNKBkFqaxc/7SbpuJLJj50TLAd
 firWFhzSfrm/uSdQWe1kCrIYFeZ7yYoEDMNHbEbvSs9SLTCTUFyGbdkVXj54Cfqsel/T
 2XoOtKMFqt80gtCkPmNtdk6PDi8Gp6/MrJXnbA1K5+xcfFjPBJrfbmm1zVsEwMjPyez6
 z6ynFDcuAqVSmd98Ql5LrXmf7/zoS7B0JGO6Kf2O/mIfvXujDHsl3KMoBAQwVnJ3M+hu
 A2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7pvRK/5jDaE+aoD4xguEj2hUlbOwi5nOf8Y1Ppj6smM=;
 b=CtI1ms+gsWVcPIV79boUC86EJdmXgZ/QGnb9JSw68Qk7MnsSCgEiDTL98IMId3/bk1
 u51r93XSGKkW8ucDC47hyq6xqny32b/3qV9tMqQ03Hftuwr3oB1UFDH86FRSqGb3weFF
 Csjcg/UiWrVy+bj8jEkXaRZ3sd9Qh5oztG9WpW531yxD1l5D73rvpVQJcDHxBFG/toD+
 76CmxuDAn9MZEzY53ozoVsyXSMt6G9oRSh2eoXfVLN7jKMOFEODv+l8Zg/XIo/pGeec+
 KkQfd7JWDaTs7BUWX2UiE1uSPXfArzi3kCkW+rlmvlZa0ig3VBDI/YLNpU4O5+odrOR4
 M3VA==
X-Gm-Message-State: ACgBeo1JyDl8kcUspAnY2+UKB7QTVIgHbFB8LGUJv3ksNGf3zyn742G8
 B1O9llgpiVP2W0TFyrAwO9jQ6w==
X-Google-Smtp-Source: AA6agR59RuzW1k4qap1Z3l/oYPvfMLQ1idEKT8t5ZYcwm1xyjiYqBwOEW0NGshhOIyhJqqLhqN79/Q==
X-Received: by 2002:a05:6a00:198f:b0:536:c49f:898a with SMTP id
 d15-20020a056a00198f00b00536c49f898amr8726911pfl.47.1661289765420; 
 Tue, 23 Aug 2022 14:22:45 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 u64-20020a627943000000b005346d61402csm11291970pfc.50.2022.08.23.14.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 14:22:42 -0700 (PDT)
Message-ID: <c8692642-b030-6d66-5dc2-4225ff24ac0f@linaro.org>
Date: Tue, 23 Aug 2022 14:22:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] target/arm: Remove useless TARGET_BIG_ENDIAN check in
 armv7m_load_kernel()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shiny Saana <shinysaana@gmail.com>
References: <20220823160417.3858216-1-peter.maydell@linaro.org>
 <20220823160417.3858216-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220823160417.3858216-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

On 8/23/22 09:04, Peter Maydell wrote:
> Arm system emulation targets always have TARGET_BIG_ENDIAN clear, so
> there is no need to have handling in armv7m_load_kernel() for the
> case when it is defined.  Remove the unnecessary code.
> 
> Side notes:
>   * our M-profile implementation is always little-endian (that is, it
>     makes the IMPDEF choice that the read-only AIRCR.ENDIANNESS is 0)
>   * if we did want to handle big-endian ELF files here we should do it
>     the way that hw/arm/boot.c:arm_load_elf() does, by looking at the
>     ELF header to see what endianness the file itself is
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


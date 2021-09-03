Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2624000E8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 16:01:40 +0200 (CEST)
Received: from localhost ([::1]:57646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9lD-0003uZ-5H
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 10:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9ik-0002CL-BE
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:59:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9ii-0006E8-HY
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:59:06 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so3854459wmn.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2KilYY3J3jAgU+PmqXopJjh9EbNqIk+XQGS5d5EmP48=;
 b=Kw6tA/mY4JsJ5Oq9KdZj02XS6FLBhl3rJY8ToyCwDFIMvFmrKMZ0tNdFgQsp4diRLi
 VKww8r9dobdkOYAj+Vua2Vvuhj8OhRStTWcAARD/gtnNSNLqI1DGIGBC8fOMFLG6Oq+p
 avFV0f01f8xgpW/yYx5hj/pW+7HJrGJcGO/ZcRqeOn/6S0GwnWeX59EZYXgUVX6Sb9I9
 SdHWJJFInKWYGBYxJv7an0smFNNfsZn9nNIrWG8GA18Ov4Jh3NRTikd486RkwnlaLjB2
 UiSI1GjBdodJ9ahfZnWP4A85a52FuBnShak5fD5qkoGzRjpc07geSTabzzYOsYouojkt
 Ehyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2KilYY3J3jAgU+PmqXopJjh9EbNqIk+XQGS5d5EmP48=;
 b=sAn70gmesBVwr358YQ40AJimSjY6bKonKZrzjWeMr5DOcR7euNVOJFzbJfUnchT4ow
 A9ilFrX8kNzaBnzBQKzOYEFUFXOoNil+G4tshs/krJDdW84KoEDOpsLFeVp/wIRtgdhS
 JroKlAimEMw+oE//Hm5uyROobqdmaeiIvq7SP8kgZ4DsDKaA8qqrbUuJetMEVyX/Brk9
 7oTNcpaHmlwOgGvJ0CgNm7pQ93qgyLskvNJ0EM+mVYrpddiE7QPLaipOcq25oJBJ5SUn
 vJRtlD7crARlmLuvZJYDzvvWCBcz2u/HR+BHTDosxrZ60fST1e2akXlhhXQmAg+kLxsQ
 k8Tg==
X-Gm-Message-State: AOAM5308u98cJKxwL4c5YoRcsOucivrlI+M9P8FIHp/QVpmhZNezuBj+
 UELGmH3s5hH4sdMJDBm/uwLDY554BDqWexrTTjA=
X-Google-Smtp-Source: ABdhPJzpkfCOdWyHtqW5SvM5/REs7e1npjYrXzmsZXwwEW/RT5mUJi/kHHsQwssylm2I9exUwgrGFg==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr546033wmc.150.1630677543045; 
 Fri, 03 Sep 2021 06:59:03 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id v5sm4651064wrw.44.2021.09.03.06.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 06:59:02 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/arm: Optimize MVE logic ops
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5dfd50a0-6df7-6f0f-292f-de18395d7cc1@linaro.org>
Date: Fri, 3 Sep 2021 15:58:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902150910.15748-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:09 PM, Peter Maydell wrote:
> When not predicating, implement the MVE bitwise logical insns
> directly using TCG vector operations.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 41 ++++++++++++++++++++++++--------------
>   1 file changed, 26 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


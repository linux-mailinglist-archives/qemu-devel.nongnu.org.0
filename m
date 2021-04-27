Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68FF36CA21
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:12:14 +0200 (CEST)
Received: from localhost ([::1]:51120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRFt-0003s8-Ny
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRCg-00025y-8g
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:08:54 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRCd-0005dx-0q
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:08:54 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i190so2220008pfc.12
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 10:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=w/yIloBiOa5RGJ1keBrumBScQzIpOuFYI5RFV6gaNrM=;
 b=MPpVP2oBcW40y/si/UoVA3YCs43imOHapV81lwIYAmg6j7X30pnfN6jHIhAr49cuIn
 e+TU/mmUc3LbjIz+ANLdViipZRsIlVpli0dtl9QoukDvozYPfAWfIEy6Yh+QzpiBSDhe
 c/uN2sP8t5D9ItzwAck9Y+HGRc3y0EksnzDWbo2IITMvZSELDwnzrApr9yjaWJVuZHs2
 rB8ikMleSislZisN2X4h9dJc6Sm6x+di7ilcgj3x2Uov+mzHp6R/Olglye0hVsXb9bXl
 j2pWVJHC82w1G3Q5e0mW3swELr8ICFX9MdRZimGEMSDjCYvXPpW9RzyuqoyyLr6Zo5Mi
 em6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w/yIloBiOa5RGJ1keBrumBScQzIpOuFYI5RFV6gaNrM=;
 b=JxCggPXrAs+e/jhyFzsn8v0gUFBQ4DgjpvOJ1eYySrS+xMvHw/4920lrv2un4uaXDJ
 GKf1YvaCLsDPQPsNEx/MOnmLSlbGBAMCg27ERA0S+88K7MqqqY1s6IszuXopctX1+5/u
 uuP0XQtSMzW1uN2MJUS7J3SwB8P0TOdFNzw2B3RIu/OQjlRs07SpNOGXVmu5jHXtOw+C
 GfiM5h2h9vOi/cyB4QfS03t2QkGfjc4VsDZD0W8qPEI9MaCb7KyIpSjoWOCgMUhilBzp
 vX0AOEcCbPvjmLg6g/6iYw8/dc4HH6yyGKUoqBAuJlnzxd0edxKYNHXA90wn5Vc4s98z
 r36A==
X-Gm-Message-State: AOAM532zHt4T31288rH5a5iZ9rvy47Hg+uQurUN2KTPIWWhXSEtPtHDd
 N102q5JFH0EcjxjGAjL0EOlmL4A88KFUbQ==
X-Google-Smtp-Source: ABdhPJwEQX/Wn2IPoer53vrYADZDTYZhekRDV+796dR1tWh67tKK34qV61i5BblEdLZws6n+q1iUQg==
X-Received: by 2002:a63:330b:: with SMTP id z11mr22664102pgz.32.1619543329113; 
 Tue, 27 Apr 2021 10:08:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id r32sm303757pgm.49.2021.04.27.10.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:08:48 -0700 (PDT)
Subject: Re: [PATCH 13/13] target/arm: Make translate-neon.c.inc its own
 compilation unit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5978430f-9a3b-b254-d91f-dfc250395ac9@linaro.org>
Date: Tue, 27 Apr 2021 10:08:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 4/13/21 9:07 AM, Peter Maydell wrote:
> Switch translate-neon.c.inc from being #included into translate.c
> to being its own compilation unit.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h                           |  3 +++
>   .../arm/{translate-neon.c.inc => translate-neon.c}   | 12 +++++++-----
>   target/arm/translate.c                               |  3 ---
>   target/arm/meson.build                               |  7 ++++---
>   4 files changed, 14 insertions(+), 11 deletions(-)
>   rename target/arm/{translate-neon.c.inc => translate-neon.c} (99%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


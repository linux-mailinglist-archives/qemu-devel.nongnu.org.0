Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0A032764C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 04:06:03 +0100 (CET)
Received: from localhost ([::1]:41670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGYsk-0002Cw-DP
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 22:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYrG-0001dw-Gc
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 22:04:30 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:33645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYrE-00032M-GE
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 22:04:30 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 i4-20020a17090a7184b02900bfb60fbc6bso1682289pjk.0
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 19:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VW6+hyeABJJrREIt3wuokqgBVyt5mMwfc4EqOuS7hUg=;
 b=zYKyZ7t0LlVv8wmyNYqeyJdPllQRV76zu2QdWjr8TVeJWr+G0jMwagbJZIJcMSUK2Y
 uSzasLHAEmxV/PlzVn6mO1ejb5p20q++uRDqksLq8z8+/TgdF89NwmmQJD11XyZ5eVjX
 4TnVNzbDSXs2bznw8F3HjK/G2WAYNSG91cy3+52Kz7tnv5MkRvXFeWbfyX73yjFij1zT
 eifflW1UcAyTomEOQrsrjg889X8G2UjRnuSfa3Ou2Uj7mwSAk1aTfIeuHGx5NfvXB2GF
 hx0CXDeN5bDOWSsgjTbw95JuqFAl5mvdXVI1PmQl31utJyc7CJ0w57LMgMeayhdZGbFi
 iRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VW6+hyeABJJrREIt3wuokqgBVyt5mMwfc4EqOuS7hUg=;
 b=h6VU5RMEhHXksoDgsOq/JMtWDAn0pd0hLwRVdrlBPItszcESIe81mycPOGScgAIPlj
 yDYE78BtO88XtHAZIePOaSWfNsmf7MkRlxZe5dXtDyj9J4jvPawZCJoH1NGV1oK17Nb6
 9sxKCoeNQk+e7YaFw+HIaNIHbd4AV/bTIgrskjHLXj8VfusRWVtHO0w4yXhu2GQnNDlx
 gAicb4xZSXsikRxajmbDWByPQ1aIAdJsT0ilArVvMQzZO9PE4EodzX2MLbD5bNzq3oq6
 8LgVZEqTxgMrnKzFh5NiZyj75zeI9xTo6i68oVh0QitO3EI8c9TT57AK/JdT7ERAQgHh
 /7eA==
X-Gm-Message-State: AOAM532HMw+KKkK5zko0HsZW12cp/e7gqSrc+Vo6k/SWe3v1eYzI1aKC
 UKbXDFGDZ0Y52+QBc7YGLvQCRA==
X-Google-Smtp-Source: ABdhPJygLr8Ca2dHsr3IQzB20UsE3fAzlVbwi2IdZtR6ZA8As2VjxCfFTb7IXGFf0X8e99JgVWdBBg==
X-Received: by 2002:a17:90a:6b49:: with SMTP id
 x9mr15827849pjl.19.1614567867094; 
 Sun, 28 Feb 2021 19:04:27 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r13sm16250937pfg.37.2021.02.28.19.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 19:04:26 -0800 (PST)
Subject: Re: [PATCH v2 05/24] hw/misc/mps2-fpgaio: Make number of LEDs
 configurable by board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48011eb0-4418-3121-5d00-7ca3b324f24f@linaro.org>
Date: Sun, 28 Feb 2021 19:04:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The MPS2 board has 2 LEDs, but the MPS3 board has 10 LEDs.  The
> FPGAIO device is similar on both sets of boards, but the LED0
> register has correspondingly more bits that have an effect.  Add a
> device property for number of LEDs.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/misc/mps2-fpgaio.h |  5 ++++-
>   hw/misc/mps2-fpgaio.c         | 31 +++++++++++++++++++++++--------
>   2 files changed, 27 insertions(+), 9 deletions(-)

Similar comment with 'int i' / 'uint32_t num_leds'.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



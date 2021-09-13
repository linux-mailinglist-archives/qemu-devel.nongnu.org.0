Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABA14095A1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:43:59 +0200 (CEST)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnBe-0001qU-Js
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmeQ-00085p-Uo
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:09:40 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmeP-0005hq-F7
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:09:38 -0400
Received: by mail-pg1-x52c.google.com with SMTP id h3so9563561pgb.7
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=noyuBds/i5t81zP52xSqaXbT8x593ICB+qu0xzLRCBs=;
 b=HQE1x0+Y7hOt0j2gTgy18hpYm8gc74SgXRNEArsTHQiIjQl3XvnsQCYHItcm104BZv
 tAOaVsaRgyRCt+VKDmEJvuP3JPnB06k30Kmh0/ZeM5RfUEka0+U1pHDMLg4cFTqatkOx
 mgQwZvmlR1N79/0nYBJikj4OWcKo88J34qoouKLMSNPURlwrpF0UsxPwTHhaKpOYQDAS
 tC0hyptFCFWgSwKutYDoRIt7Foor0PRI1qKJZiAl6ZK3r9y0ejkr9h86uzUhrCi2k9en
 d2W5FQ6D+QX6nMsxCvSrvmzqCi8gX9CHf2WBo+SLcbkiVYSdyJ0Y8ir4+RUuwwBVP3Y8
 GrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=noyuBds/i5t81zP52xSqaXbT8x593ICB+qu0xzLRCBs=;
 b=2p+DJI+7TzcdRPCEGsgcwfsQW9pQWpvOQcVQNNumaDiInIolN5NlOtvs63Qc1XCnCx
 pCqH4jkYWBUqwoRboNdl9A1mAbZfCYbb+TdSA4IraZi5z5saPFRtYM1YI0Hpk+gxSl3D
 OxuUHJVlRnXuTQtHSkQDF6xlYrLfrRS7dHOATlvC3EVBkyAfTqZCcQc/jPbDM3r3ekQR
 aca5K790Js4JR8oulOYqc6K9iBk+YYqikv2ZB/idMmB+47fM4NMnFwan9sPEOzx8J9ia
 Pwuct2MBv0C+h5Em/bd4dHk8fiq/QPMVCtrjcaL0j26oLcSIZHH7i9IbSS3/b2EWqRQa
 ZAqw==
X-Gm-Message-State: AOAM533TP15s8oBqXWX7yeUpKJNfq1zzodxaH8Q1uo3qyaSZkBY1+Fot
 uYyC23d1xjRZMCeXzlP2Wtngsw==
X-Google-Smtp-Source: ABdhPJwzYERdl7q1Ur7pxySlFgM5xPxnVPQwgfM5wM4rsNksB/x5+Riiy0WnnK7NCeBvGEZgv0yOrA==
X-Received: by 2002:a65:414a:: with SMTP id x10mr11259805pgp.403.1631542175899; 
 Mon, 13 Sep 2021 07:09:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o9sm7822032pfh.217.2021.09.13.07.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 07:09:35 -0700 (PDT)
Subject: Re: [PATCH v2 12/12] target/arm: Optimize MVE 1op-immediate insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4abeebb4-f320-026e-3799-a20fde86779d@linaro.org>
Date: Mon, 13 Sep 2021 07:09:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913095440.13462-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 2:54 AM, Peter Maydell wrote:
> Optimize the MVE 1op-immediate insns (VORR, VBIC, VMOV) to
> use TCG vector ops when possible.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 26 +++++++++++++++++++++-----
>   1 file changed, 21 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


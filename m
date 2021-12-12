Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BE2471E48
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 23:38:55 +0100 (CET)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwXUc-0003PA-79
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 17:38:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwXTd-00021N-D4
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 17:37:53 -0500
Received: from [2607:f8b0:4864:20::635] (port=43816
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwXTc-0007AG-2o
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 17:37:53 -0500
Received: by mail-pl1-x635.google.com with SMTP id m24so9903426pls.10
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 14:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p15k33xlPH4prEcCoiFPOhhkf5Zj4JUYu+dQ8jkf8g0=;
 b=dEgLT2JsiYhDJuPoCchn33KO8Ga6u3T8TgBS+k+kEVvKCuJdjXj56le+Rd9NJl2wuS
 ZP5ePKjL35HZ/ICLu8goAzXX1S/s6gRgCtqCDwPApE8I4blYsusmo3SVcS9xEDwRl+FJ
 f1hjeoBu3p3FGYmXA3rLt34+/B8QEgpHPm2wqnxTn4KCcQaf5enjotnEYyr/pJEAqPCh
 j/bqJO4McFFw2DWCTr0lijCvHEuS269bJTBUh6vIQTiAVv8OQVuLD35fUcqoixx2bUtv
 JXPkG6BClbFV/8UsaevzKjmDhVzSttVpOgKCq4MwuD7+lm3aSc485miRKDQP+dtKiajy
 4S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p15k33xlPH4prEcCoiFPOhhkf5Zj4JUYu+dQ8jkf8g0=;
 b=gh6l4KY+yvjNWQBL2LduzmC0FcVg9u2DBpXGI5Lr4tDU8vgU7rsBvqZS9WK3EiFOqP
 NRh8S+PvdPra3Eqin7kkAKfVoVhGizR/Na1eCj8ayqmGSMDVVCXYPFYyLg+h9nzAwEUo
 Gl60MlFlF2FuQFwAniLf5Ws42hG6bdwV8ZVpO9vI6jsqzZzLG9XI6MK+YkilWchO0xv6
 bzPwZRPUZvuM6rtq5F5RZKuiMnpO3qW4G1JwOs2Oyia/SVL7dCXlfopGQLgTiT6wHWJU
 zhmjsrJaDdN0BhtqyyeekLT+mPgwTtLuKdPDCKFz24IiSj3V5SDi/wdPeYJRybQNroIv
 lDKg==
X-Gm-Message-State: AOAM5325fA3Y07/2epIvpmgsEQpmSD50BWsCPL+TxOQSoklSAlCUQ9E0
 cKAt1i43TiPdJNtCkroLMFrS4g==
X-Google-Smtp-Source: ABdhPJz2b2PNeDeqrAFhjyUTDN57MPexDFsGu62t0PU4lzciRTf0NXA3YZrf89azZJ1hH2g6c8kKBA==
X-Received: by 2002:a17:902:8e85:b0:142:7621:e3b3 with SMTP id
 bg5-20020a1709028e8500b001427621e3b3mr91160408plb.84.1639348670702; 
 Sun, 12 Dec 2021 14:37:50 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id mz7sm5035448pjb.7.2021.12.12.14.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 14:37:50 -0800 (PST)
Subject: Re: [PATCH 24/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapc()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ddbca15b-2557-3a50-3ff6-47248f4311a6@linaro.org>
Date: Sun, 12 Dec 2021 14:37:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> Fix process_mapc() to consistently return CMD_STALL for memory
> errors and CMD_CONTINUE for parameter errors, as we claim in the
> comments that we do.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


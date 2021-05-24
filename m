Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD46738E820
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:54:47 +0200 (CEST)
Received: from localhost ([::1]:41340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llB2c-0007es-Te
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llB13-0006G6-F5
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:53:09 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llB11-0005cQ-SD
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:53:09 -0400
Received: by mail-pg1-x533.google.com with SMTP id 27so18843866pgy.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HM4wTCL7q00TXjaJBC0MsbmXZBrhb1v/7tAxFT35qYw=;
 b=wVvFViydtQjLXH5a9tp5VtUm4b0BLOWkHho9UTAD+HXdAODi6EsfrLb9hgqwDB1+Cp
 9t5KHDyLfvVuy6MiRJzycARnZRDAbt6PVkoj38LriDKfF1cDlhoqvZ0NGEvdxHV8n8IU
 /RrVD82QNsZDGEVDhHfSM7yi2jGR70cfcAW0yEMmj7fZsSH+Ud90te6PDFMFD3zt50Bo
 N2kmsaUaJ21prqQhnH0wAeh3k2F+ego8U2885IAfZx9gMoC5b21eHKED0pTlUiK5Ei8H
 ZjoDPThUUnKX6Au/NnZ6sZcoYzRLBtc6DAy9wqq9vp4mzzyYz5p227rxFY4MFba0rYr8
 LHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HM4wTCL7q00TXjaJBC0MsbmXZBrhb1v/7tAxFT35qYw=;
 b=iwxEWZpNhjUc4JT5hCIL0zfNtYm2cHYnCKoO5zIwIdh24da4TwlKg/XieNd6nnNZx+
 VxjvNhNURj4lNWtZYTrQj+PNH4mdCfTvDogmtfVs8PQQzMGs7lmN1atlAhrA9Gh16oNm
 Zb8N8aNTzYeZ1B2zeFbV5VvM5794gLXjbVpHtnRvLQ7hgxdoSIUn9R97iSdm090hz7Gb
 EsetRWqcS09YfGqXTDEvM2ydu37ugeO2mwUmamNXSx7iE008jA9og2Rgi4RY+MXOn/IX
 yPTDHsDObDTcnq6Ita1AtwlT/ny6frRdYaFMczIofFvXoKfnpvMMPiOomvOw+6vDkmav
 8Dpw==
X-Gm-Message-State: AOAM5320ohyZ6jV9kzZcKxOVl3JNq64qs9dPy029Yux9pTJLNPK2AY2t
 FVOgPEJ6VcCCzgpTYP1fQypkYA==
X-Google-Smtp-Source: ABdhPJyBfgXjLX3khv7Vk/gho7+Iu4olaApils2hIBBwSKV/IsPtv5cDiuC0k2phSq9JvH7jBHPfig==
X-Received: by 2002:a05:6a00:170c:b029:2dc:dd8f:e083 with SMTP id
 h12-20020a056a00170cb02902dcdd8fe083mr24437720pfc.77.1621864386536; 
 Mon, 24 May 2021 06:53:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k15sm11493563pfi.0.2021.05.24.06.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 06:53:06 -0700 (PDT)
Subject: Re: [PATCH 3/6] hw/arm/armsse.c: Correct modelling of SSE-300
 internal SRAMs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210510190844.17799-1-peter.maydell@linaro.org>
 <20210510190844.17799-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ae2e092-24ea-9c93-82ba-cc8eec196224@linaro.org>
Date: Mon, 24 May 2021 06:53:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510190844.17799-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: Devaraj Ranganna <devaraj.ranganna@linaro.org>,
 Kumar Gala <kumar.gala@linaro.org>, Kevin Townsend <kevin.townsend@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/21 12:08 PM, Peter Maydell wrote:
> The SSE-300 was not correctly modelling its internal SRAMs:
>   * the SRAM address width default is 18
>   * the SRAM is mapped at 0x2100_0000, not 0x2000_0000 like
>     the SSE-200 and IoTKit
> 
> The default address width is no longer guest-visible since
> our only SSE-300 board sets it explicitly to a non-default
> value, but following the hardware's default will help for
> any future boards we need to model.
> 
> Reported-by: Devaraj Ranganna<devaraj.ranganna@linaro.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/armsse.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


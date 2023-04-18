Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AB76E5F3A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 12:58:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poj1n-0005kA-8t; Tue, 18 Apr 2023 06:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1poj1f-0005ih-CX
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 06:57:35 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1poj1d-0001gI-QC
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 06:57:31 -0400
Received: by mail-lj1-x235.google.com with SMTP id a10so13122777ljr.5
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 03:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681815448; x=1684407448;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7K3VNSdk3z/8ZaLIajeUfu9u36LUEVZPb6wx1oh29EU=;
 b=Ifj+7palNxJqPkPaP8nRgR45GU9wRPYAPRRVj3rDzCyJlQx6+XJQcZ+R9F2drf6O0Q
 8DGIlJecxWwzNaeshPL2ramI2NVnVt+1UUCOo+OzMDPE+M7xsiK0VhHSi8ucMzD8fnA3
 kusg6dSeZhU3ZIZ1rZFYxshohtfK3wuDfuziK23GMk2iZJqdhNrEDxXrv5oUKzquMA+V
 QSmGiP7dMp3qgO+Ffz4l5wnDG8F6B19nxfbrPt85lHniQFOdNLWC5ruJe9rBUE4ZgR+a
 fa/Yr8yUkRQ3ENRkDYXOzuRxeEKQA9oUc14a8qJEF606IWkx9w499JiMvf2t7D9kIpKZ
 FoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681815448; x=1684407448;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7K3VNSdk3z/8ZaLIajeUfu9u36LUEVZPb6wx1oh29EU=;
 b=cjcFebtgv2UtaXSIU8Y2u+6gLL45X6m0ivKFBl26kXzeiWutT4P5Ijr11gPpTSGNGc
 OPrf3yyzvagZ/fXJhcV2l5du9PiGLmd7GoeSGWtIv2fXZuNaaWKD2GwQNE0osyhS1Kfb
 XpIK9PA9KyhlDXMX0zB2j/qFCpy1O1e3Aogu4D5Pq0xQMXvJojY7C28Q/I+aaSdeOxhV
 uNfzJyUQaMr6h/ywONoSfDWfBp/cPA85MrO6zJPkRdThAJsedGw6XXF+cQCaVoLSvmQW
 AvafpGaN2jyI6uYuMr9SkiVQ0mvlAkvLRy7/xbOliBZ4djOY8p/hOfzVLQHBEiI3JS5T
 t/9A==
X-Gm-Message-State: AAQBX9fqXjcE5/whtGyh1gNCGP+UrB26NE5oA4oAoAOAzXQnBtbO2RfZ
 eYlKuWVZjkKk1JU8ZdH8bd3eBQ==
X-Google-Smtp-Source: AKy350ZpS2M1DvrlnoGROGU2VtLeI8z2vqzDBcFuOiKAZTrDajmxaRs8QURZPCDOmH5W9WXZV+bamQ==
X-Received: by 2002:a2e:9986:0:b0:2a7:a719:5936 with SMTP id
 w6-20020a2e9986000000b002a7a7195936mr632057lji.19.1681815447968; 
 Tue, 18 Apr 2023 03:57:27 -0700 (PDT)
Received: from [192.168.58.227] ([91.209.212.60])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a2e9608000000b002a8a5afb87csm2293163ljh.20.2023.04.18.03.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 03:57:27 -0700 (PDT)
Message-ID: <42916240-ca56-9028-da9b-1fe5c729fc12@linaro.org>
Date: Tue, 18 Apr 2023 12:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] target/arm: Don't allow stage 2 page table walks to
 downgrade to NS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230414160413.549801-1-peter.maydell@linaro.org>
 <20230414160413.549801-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230414160413.549801-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 4/14/23 18:04, Peter Maydell wrote:
> Bit 63 in a Table descriptor is only the NSTable bit for stage 1
> translations; in stage 2 it is RES0.  We were incorrectly looking at
> it all the time.
> 
> This causes problems if:
>   * the stage 2 table descriptor was incorrectly setting the RES0 bit
>   * we are doing a stage 2 translation in Secure address space for
>     a NonSecure stage 1 regime -- in this case we would incorrectly
>     do an immediate downgrade to NonSecure
> 
> A bug elsewhere in the code currently prevents us from getting
> to the second situation, but when we fix that it will be possible.
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


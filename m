Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58E549565B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 23:29:04 +0100 (CET)
Received: from localhost ([::1]:46866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAfvT-0000Gg-Bm
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 17:29:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1nAb4q-0005q6-0O; Thu, 20 Jan 2022 12:18:27 -0500
Received: from [2607:f8b0:4864:20::32c] (port=44909
 helo=mail-ot1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1nAb4n-0007Lf-Tm; Thu, 20 Jan 2022 12:18:23 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 a10-20020a9d260a000000b005991bd6ae3eso8389054otb.11; 
 Thu, 20 Jan 2022 09:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+waRMGV/oLKj/Il8NcsOSwfcLnF9csinsb50xMgkoFo=;
 b=mev9g1IukbqC5L/SrYJ4V0b77qCOa/lVDWmLv51IwOo5AZnkmL3qtDl6RtPdl/VdYB
 e9WxoLtv2Yx3k7d3RePYnaQnZiO0abuCiVcdwt3bDVk91vs+Bq+TWbaIsK3bMmnkCRGD
 plArROkKqpD3QCxbN4S0mPg74k7UBIL3YhNqw9bvahQqHMW5b6hnq2fAmZLaXX1z6qxV
 FLO9OayqrKy4TKqKh2a/Mnq2b39IFdgcp7S3/6a3rNNKVPjC014i4VLZVHziNAWkpD/8
 BBw8Cl1ZPI+RcO7OyF1PedF8+2nkPnd4DQjbZQIxC7OxRqvzkekNTTjeoAzZ0JdJvD6w
 mxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+waRMGV/oLKj/Il8NcsOSwfcLnF9csinsb50xMgkoFo=;
 b=ezYXRl30wVftjPITcIhd7SMazKxW14qaphwZq/dh1PmOzum3dLWdopTpPIjObMzhSH
 QBKtLAV6wiXaQXpmFQR2pLUaqGXAqqMGUVKpqp94v2fajU/0t/2f6LGlgk9Cm7S2rpiZ
 LpFk+k4LXoi62dPLJUhT3Dgg/6B3M6G/9ovp5saQebquhSFAw9ttA8SXl46KZZ//u8Y4
 rVpV7T6EyP1gjxL0lxVGTRuPYRmSkiHJPvAHG2y+80UlDq7ffF408qHFTxPm1ifn66J4
 Q1ED0Rh1AV3Fv0JyuhTwbKWtRZHmjTVLjBRN6Gge/AlTkeEQDd7p1RY5GbtWE6iLGvge
 4rjA==
X-Gm-Message-State: AOAM532JpyvfI665iG3CnmVTirAWmPIRMPf6FQjLcZe2HXE790dvA5LD
 c6/oPXtYJqd2j0gnHgO8bdp35LxN1cA=
X-Google-Smtp-Source: ABdhPJzTHQmRZA6879k+m04XNLLJfl8R5Ha+aLEdyoSPX7ErclQCBiT9JaTxsTdDQSpTVCm+ChB8yg==
X-Received: by 2002:a9d:2a82:: with SMTP id e2mr15087550otb.331.1642699099584; 
 Thu, 20 Jan 2022 09:18:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 bp4sm1978646oib.49.2022.01.20.09.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 09:18:18 -0800 (PST)
Subject: Re: [PATCH] hw/char/exynos4210_uart: Fix crash on trying to load VM
 state
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220120151648.433736-1-peter.maydell@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <a6a2cc91-6830-0453-062c-1e365428a8c6@roeck-us.net>
Date: Thu, 20 Jan 2022 09:18:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220120151648.433736-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/20/22 7:16 AM, Peter Maydell wrote:
> The exynos4210_uart_post_load() function assumes that it is passed
> the Exynos4210UartState, but it has been attached to the
> VMStateDescription for the Exynos4210UartFIFO type.  The result is a
> SIGSEGV when attempting to load VM state for any machine type
> including this device.
> 
> Fix the bug by attaching the post-load function to the VMSD for the
> Exynos4210UartState.  This is the logical place for it, because the
> actions it does relate to the entire UART state, not just the FIFO.
> 
> Thanks to the bug reporter @TrungNguyen1909 for the clear bug
> description and the suggested fix.
> 
> Fixes: c9d3396d80fe7ece9b
>     ("hw/char/exynos4210_uart: Implement post_load function")
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/638
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   hw/char/exynos4210_uart.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
> index 80d401a3795..addcd59b028 100644
> --- a/hw/char/exynos4210_uart.c
> +++ b/hw/char/exynos4210_uart.c
> @@ -628,7 +628,6 @@ static const VMStateDescription vmstate_exynos4210_uart_fifo = {
>       .name = "exynos4210.uart.fifo",
>       .version_id = 1,
>       .minimum_version_id = 1,
> -    .post_load = exynos4210_uart_post_load,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINT32(sp, Exynos4210UartFIFO),
>           VMSTATE_UINT32(rp, Exynos4210UartFIFO),
> @@ -641,6 +640,7 @@ static const VMStateDescription vmstate_exynos4210_uart = {
>       .name = "exynos4210.uart",
>       .version_id = 1,
>       .minimum_version_id = 1,
> +    .post_load = exynos4210_uart_post_load,
>       .fields = (VMStateField[]) {
>           VMSTATE_STRUCT(rx, Exynos4210UartState, 1,
>                          vmstate_exynos4210_uart_fifo, Exynos4210UartFIFO),
> 



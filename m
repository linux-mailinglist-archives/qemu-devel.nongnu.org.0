Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E4C3576C0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 23:23:54 +0200 (CEST)
Received: from localhost ([::1]:42966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUFeT-0006Ej-0i
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 17:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUFd8-0005cD-ID; Wed, 07 Apr 2021 17:22:30 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUFd7-0007Cl-2m; Wed, 07 Apr 2021 17:22:30 -0400
Received: by mail-ej1-x634.google.com with SMTP id qo10so19624376ejb.6;
 Wed, 07 Apr 2021 14:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bxSRo5Lz05Q2oAUlevfKffQ7CI3Qlu00OtRTpMt4uQk=;
 b=Y3OBmh1N0eU0CkwjVex+NKlE3szvHjV9qreKyWAgR7B7Cvz2bBIH5gUUy7C5Jgsuf2
 1pw9p/ZPSls6iiK3Rwz4j5YXAMiS00UfkiDClzzkeyZfBQt0nQUP2+x6kgtDY7E/uV/7
 j/1U00dy/NZqNUoE+QSv9akD0o7b96sDj0QNoxLJBf4OVIA6denXW2AvP9h/4LetMFyV
 6xwtlIO/XuMdTLkYB8aR5HQ+kMgwzOGYFGP3j65NGXMAvsCCnl3mX1zfxuQhWPLpZ0oX
 6TD7oPWO0MfWQEiudwD4nhReVPkuIn7PnoernnmSdvN9XEE3oLwrJCZvyFp3nypKAU8w
 1QQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bxSRo5Lz05Q2oAUlevfKffQ7CI3Qlu00OtRTpMt4uQk=;
 b=kDSbMOctFUVvlRb5NM8Go+4IJBhf4z/C8UrNcP3ytLJbD5wp+SmraeSEhKI2n8T/Ve
 FD++GmWNZRcU4SRfK+PvzV1vLBm57QqpW0yKdSgns9iI7HzLoUUtXbCC0gQDxVxsIdQn
 0HYAhmP2offZxkFLUH7bZHrICnvEJmrKpyyepqW44hzOOG+HNJZ8HPUU5iF6/yUnMX4N
 Tsm/J6g/ffpZm+JFeteu+zgqb6YWGjlNCy8SxmuG2iZjRtgWitHNUQBosp1yIy9OZCDt
 Hz9kFQ7wGKb2QdtWQaq0fGXirE/E3DPbqU+53PgSrpiHTrFLN/SDawYBRaxHjN2cYYg4
 i2Tw==
X-Gm-Message-State: AOAM533qK6rP5aRN0desscX+ghjOioBtK6e1wESfXV21vrvLd0UqLTb9
 GaJPzmOdZ/t67a5mP939rZUIP5Eu3GHsLw==
X-Google-Smtp-Source: ABdhPJwuHnEbjoI2AiAUOZgIVDYN6vYYfD8I+ipuVhFgB0lA+AUai1cWZbCBtJqUqR61+Uo7aYNY7A==
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr6258106ejc.250.1617830547328; 
 Wed, 07 Apr 2021 14:22:27 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v5sm8531043eds.69.2021.04.07.14.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 14:22:26 -0700 (PDT)
Subject: Re: [PATCH 03/24] aspeed/i2c: Fix DMA address mask
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aeee3229-19fc-1bbb-19b4-a72be1c454c6@amsat.org>
Date: Wed, 7 Apr 2021 23:22:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407171637.777743-4-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cédric,

On 4/7/21 7:16 PM, Cédric Le Goater wrote:
> The RAM memory region is now used for DMAs accesses instead of the
> memory address space region. Mask off the top bits of the DMA address
> to reflect this change.
> 
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/i2c/aspeed_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 518a3f5c6f9d..e7133528899f 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -601,7 +601,7 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
>              break;
>          }
>  
> -        bus->dma_addr = value & 0xfffffffc;
> +        bus->dma_addr = value & 0x3ffffffc;

This field is migrated (aspeed_i2c_bus_vmstate).

Does the first patch "aspeed/smc: Use the RAM memory region for DMAs"
break the migration?


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF172F0479
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 00:54:20 +0100 (CET)
Received: from localhost ([::1]:57926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyO3n-0004CR-UB
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 18:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyO2t-0003gT-QA; Sat, 09 Jan 2021 18:53:23 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyO2s-0001te-Ct; Sat, 09 Jan 2021 18:53:23 -0500
Received: by mail-wr1-x430.google.com with SMTP id d26so12500661wrb.12;
 Sat, 09 Jan 2021 15:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tvlx/ZmwUjNy/B8izp1OjAX4REEqpf323WM5Y2nSLXk=;
 b=KEsGZhqayegqmJaeF1k84v5ZadT1+Mxqsdx+D8149FpLWobtETZhoBlxC7jHKSkvZO
 Aabb2qidl0F4DF2UkPB/QNpVCS4GPIfmGc3rkXe/Nwjy8107k2Ga9LKJwae+5ZhN9qFm
 VJ2zRWkqTebvOCx+xJV9lHYxi+03gIJtEGiXRktf9Ixlr2YaqQgO5DyQksZUf1vasKCC
 ZStcrncUJaLTd1R59sF92vqd8P00zcCPnTcE8bJleLwQwTk+i4w5VwzqP6OshyWlMT+3
 Jlon/2yAWpOaeCWvQ4E5jww6AKbfm455b+t8xDA4ewyoDMIuq7YEGR8kBuvRiYaRhOd4
 odCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tvlx/ZmwUjNy/B8izp1OjAX4REEqpf323WM5Y2nSLXk=;
 b=DQO+iNWtYbkfGcOJI47/faE3IkpTFWv4PtPUq+Yf2fVhqhNWH5sAPd84EMuhid8Mfi
 4PvVOEJqi9XX37Jvy0FgiKIFvQD2vh36uGOU+ED54nvVEHCuQmrJTIBAJPq4dQuGHksU
 L7Wt62dnh7npxtAJZxeU1O3AbfkykIYqJTCBnI7U0djP/fCm/xYmreETZRtTpQzTof2R
 Lizohm8rffHGDfV6bwqRc0ImHmu0yOjRPKls+AtpNoHZSCA//t9RhTFlMNFdHB0pNpWk
 KgbyKjEUHRvl6U91g4QrfRgSV17ZZVGH1AFq1YK0YyqQSv11kLazv5Y4rNCM26LOr86d
 uU8A==
X-Gm-Message-State: AOAM531Ic08YabAJ6oIOgG831ckBMLP0l8gkSJYLFyX9e25/Ejpap3KG
 Gt+tx6UCrmafjDJU9wahtQ8=
X-Google-Smtp-Source: ABdhPJzb+uFtFjq8s7WkW8KssnlvPxSkMu20hB90mRiCqowVcoW1mBtuSJWP1YiMyBDtqeKN1u02Rg==
X-Received: by 2002:adf:f78e:: with SMTP id q14mr9869152wrp.320.1610236400822; 
 Sat, 09 Jan 2021 15:53:20 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id v20sm19929879wra.19.2021.01.09.15.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Jan 2021 15:53:19 -0800 (PST)
Subject: Re: [PATCH v3 3/6] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
 <20210109123545.12001-4-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ca66c21a-c3f8-8e96-033e-56548280b4b1@amsat.org>
Date: Sun, 10 Jan 2021 00:53:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210109123545.12001-4-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/21 1:35 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Usually the approach is that the device on the other end of the line
> is going to reset its state anyway, so there's no need to actively
> signal an irq line change during the reset hook.
> 
> Move imx_spi_update_irq() out of imx_spi_reset(), along with the
> disabling of chip selects, to a new function imx_spi_soft_reset()
> that is called when the controller is disabled.

Now I read this patch, forget my comment on previous patch.

> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v3:
> - new patch: remove imx_spi_update_irq() in imx_spi_reset()
> 
>  hw/ssi/imx_spi.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 8d429e703f..880939f595 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -241,9 +241,20 @@ static void imx_spi_reset(DeviceState *dev)
>      imx_spi_rxfifo_reset(s);
>      imx_spi_txfifo_reset(s);
>  
> +    s->burst_length = 0;
> +}
> +
> +static void imx_spi_soft_reset(IMXSPIState *s)
> +{
> +    int i;
> +
> +    imx_spi_reset(DEVICE(s));

Hmm usually hard reset include soft reset.

> +
>      imx_spi_update_irq(s);
>  
> -    s->burst_length = 0;
> +    for (i = 0; i < ECSPI_NUM_CS; i++) {
> +        qemu_set_irq(s->cs_lines[i], 1);

Isn't this part of the hard reset?

> +    }
>  }
>  
>  static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
> @@ -351,12 +362,8 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
>          s->regs[ECSPI_CONREG] = value;
>  
>          if (!imx_spi_is_enabled(s)) {
> -            /* device is disabled, so this is a reset */
> -            imx_spi_reset(DEVICE(s));
> -
> -            for (int i = 0; i < ECSPI_NUM_CS; i++) {
> -                qemu_set_irq(s->cs_lines[i], 1);
> -            }
> +            /* device is disabled, so this is a soft reset */
> +            imx_spi_soft_reset(s);

Maybe you can restructure patches 2/3, first introduce
imx_spi_soft_reset() - this patch - then fix ECSPI_CONREG
- the previous patch -.

>  
>              return;
>          }
> 


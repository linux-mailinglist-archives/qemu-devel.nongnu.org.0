Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094EC2F0476
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 00:49:24 +0100 (CET)
Received: from localhost ([::1]:54930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyNz1-0002gD-4P
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 18:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyNyG-00028o-AC; Sat, 09 Jan 2021 18:48:36 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyNyE-0000Bx-QM; Sat, 09 Jan 2021 18:48:36 -0500
Received: by mail-wr1-x432.google.com with SMTP id 91so12538945wrj.7;
 Sat, 09 Jan 2021 15:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AahDlJxVPatn9sJ1ZQtpyj7Ll4wMRUx+//C+VUoI0GQ=;
 b=pKLtd+aMhKGbgAthXHlv0BwAEGzQUy/xbLEgaJrMR2IjstpJOY/KCovQLLh99SwQYe
 FX0Cc2ogMYQD00GSz9fQ28ZtVlGVCiBWk/Dm3n/ofuC5wsbdIBAt3YUlLbppkUymGBI8
 X2sPBuXmLRCCYrcLXeYv48uO0vUW1WcfhYUc9yKcnXk6ejgGaOTAwxvkd1Qa+WJ5V29Z
 QsiGqIaT+eSKO9lMl13APPUq3iLPB5ouIxTnFAhMFptHYX5vfWZAJCWObNelNLtSnfOz
 DWc38hhcwNLNSM6ckbgkLWzYddVVOBAwe9izoBH/IdANl3CVNu/z8lMoSYJ9QqadaYA1
 mSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AahDlJxVPatn9sJ1ZQtpyj7Ll4wMRUx+//C+VUoI0GQ=;
 b=YreFpp9PCQMmMNDSuatd/zbZHfIMYyyCpuDdeUUaKzR/cM4+c0Rrkk0YnWbJ6dVkiH
 2qvWoHGhPtEUVJVvWZUOiuxKoXR80GmVkD6rvXOD56m0FUxcCtm4QHRbcBNaiORBc/bU
 lxSGhTHuibW0B4xEN2bEsoeHaRktZ8nep5vQeEVI8Sz1qutK4tULUqRTGQvo0dkGZpd0
 BQ82S83/cKMLKsk1kayD9dD30RLglKVBTsL/wYEdDSP6j/4K6702RxdZF2xJcDgTDDd6
 mlJeZkwik10WbfWvcdZwXhOk8hmzL1ChuAR+TNsAldCE2X3etK5EA/6EfimQw18kSeJM
 pgHQ==
X-Gm-Message-State: AOAM5319BoyShaKjX1IwODDv+JCGeX0ueNZsyeCvTHOyWtNMqzYAhWuT
 EeP5mNXa+XU/PVvxeM2ofPY=
X-Google-Smtp-Source: ABdhPJxnkuhJfAC9nlU6gfnMMGAL2wMUFepRXizOmSIQ05S/5Eeudlypshm5F/TpxPKE9id+dh6IVg==
X-Received: by 2002:adf:97d2:: with SMTP id t18mr9879421wrb.228.1610236112644; 
 Sat, 09 Jan 2021 15:48:32 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id w189sm17182044wmg.31.2021.01.09.15.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Jan 2021 15:48:31 -0800 (PST)
Subject: Re: [PATCH v3 2/6] hw/ssi: imx_spi: Disable chip selects when
 controller is disabled
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
 <20210109123545.12001-3-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <444f895d-7758-88f6-fd02-118ce67d431e@amsat.org>
Date: Sun, 10 Jan 2021 00:48:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210109123545.12001-3-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 1/9/21 1:35 PM, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> When a write to ECSPI_CONREG register to disable the SPI controller,
> imx_spi_reset() is called to reset the controller, but chip select
> lines should have been disabled, otherwise the state machine of any
> devices (e.g.: SPI flashes) connected to the SPI master is stuck to
> its last state and responds incorrectly to any follow-up commands.
> 
> Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v3:
> - Move the chip selects disable out of imx_spi_reset()
> 
> Changes in v2:
> - Fix the "Fixes" tag in the commit message
> 
>  hw/ssi/imx_spi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index e605049a21..8d429e703f 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -353,6 +353,11 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
>          if (!imx_spi_is_enabled(s)) {
>              /* device is disabled, so this is a reset */
>              imx_spi_reset(DEVICE(s));
> +
> +            for (int i = 0; i < ECSPI_NUM_CS; i++) {
> +                qemu_set_irq(s->cs_lines[i], 1);
> +            }

Shouldn't this be done in imx_spi_reset()?


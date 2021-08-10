Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0D13E7D91
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 18:36:45 +0200 (CEST)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDUk4-0002SK-Em
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 12:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDUiF-0001Af-0n; Tue, 10 Aug 2021 12:34:48 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDUi9-00072u-MB; Tue, 10 Aug 2021 12:34:43 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 o1-20020a05600c5101b02902e676fe1f04so2150069wms.1; 
 Tue, 10 Aug 2021 09:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EvEBLJLgxQmdogfkfpgOZJ1W2XzmWBOzsXrdlDlzJ0k=;
 b=MKYv39y1FTN4jqu00O5yWhRoYsHf6j/ESZ00iD0TkbQdmaoSC9Afn+m+h+9p9cp5Fc
 SgFV1ODP6bCEQOoNh8FMLCuuLjwIU+J/v0uTM4jb1IEuKhT+U/9IKU3OO9K5Bbvs9lq7
 rX5MT2JZfPVqYYC5VxgMkbMg/lg4unF+TGWxHBpZv4w3RpZJqybC0t2P5sqaSLGgnfbG
 WpFf/0wDAfiupcqsXplv0y4NGdGWYl2I1xJWO43tlCmsevQ1TN/aQcQL/O1fzN4SGzZU
 yYORTOSuy2BM4kM6/mbyiDXJ8UbRniny21zdtbm+/fmzipi3h9FTnQ0QtfKSw9yKH6dV
 eZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EvEBLJLgxQmdogfkfpgOZJ1W2XzmWBOzsXrdlDlzJ0k=;
 b=DYlPrJIlwnR9d54WYUX+enoBSIjYVYWK5S1o4XBB0053mEJczf8wv/4ZnbjqqIx7cC
 3LupJme4isC8jApqGfOzDH3nVsy/oUSC/v1wCNllO+1i1YJ7HUL7PUy37b01ceBfIQ7N
 DB7Wkp8AOzoSQ3tN9VzLhfmmEqcs8VZXyIR8VfraWb0YBICjG1xRWyX4qUKjc8APIpe0
 GcTeZvzxJQGedcoHeL2J2W7Zv1MpoiO2GladitafBSVL2sIBGbmIXkzpOvh1YZ/VSZbf
 s0r4Tf5l67IBhsVXVR8lswk7T0lerGXuEbdX6/UNn8BvHHHLJvRAJgZlJC+qKTm6wCFf
 Ra9w==
X-Gm-Message-State: AOAM533MnyAuYTSaTVl7hBXrOY29t6zgSbRjKoADV2PucfhUif4dk+D3
 tE7xONoAwqhvXScjGA72tNQ=
X-Google-Smtp-Source: ABdhPJyCP0QOEJ2LUQzZfRkSRz4MbkAR1dAqxnKaZzcYQn8gLDWbzxFY1Eg+ZZWCemwjSSM/HmCw1Q==
X-Received: by 2002:a1c:20c5:: with SMTP id g188mr3965031wmg.142.1628613279114; 
 Tue, 10 Aug 2021 09:34:39 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h9sm2670382wrv.84.2021.08.10.09.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 09:34:38 -0700 (PDT)
Subject: Re: [PATCH v2] fsl-imx6ul: Instantiate SAI1/2/3 and ASRC as
 unimplemented devices
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210810160318.87376-1-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6e8a0fb5-04e9-d6e6-989a-41de4eacf303@amsat.org>
Date: Tue, 10 Aug 2021 18:34:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810160318.87376-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/21 6:03 PM, Guenter Roeck wrote:
> Instantiate SAI1/2/3 and ASRC as unimplemented devices to avoid random
> Linux kernel crashes, such as
> 
> Unhandled fault: external abort on non-linefetch (0x808) at 0xd1580010^M
> pgd = (ptrval)^M
> [d1580010] *pgd=8231b811, *pte=02034653, *ppte=02034453^M
> Internal error: : 808 [#1] SMP ARM^M
> ...
> [<c095e974>] (regmap_mmio_write32le) from [<c095eb48>] (regmap_mmio_write+0x3c/0x54)^M
> [<c095eb48>] (regmap_mmio_write) from [<c09580f4>] (_regmap_write+0x4c/0x1f0)^M
> [<c09580f4>] (_regmap_write) from [<c095837c>] (_regmap_update_bits+0xe4/0xec)^M
> [<c095837c>] (_regmap_update_bits) from [<c09599b4>] (regmap_update_bits_base+0x50/0x74)^M
> [<c09599b4>] (regmap_update_bits_base) from [<c0d3e9e4>] (fsl_asrc_runtime_resume+0x1e4/0x21c)^M
> [<c0d3e9e4>] (fsl_asrc_runtime_resume) from [<c0942464>] (__rpm_callback+0x3c/0x108)^M
> [<c0942464>] (__rpm_callback) from [<c0942590>] (rpm_callback+0x60/0x64)^M
> [<c0942590>] (rpm_callback) from [<c0942b60>] (rpm_resume+0x5cc/0x808)^M
> [<c0942b60>] (rpm_resume) from [<c0942dfc>] (__pm_runtime_resume+0x60/0xa0)^M
> [<c0942dfc>] (__pm_runtime_resume) from [<c0d3ecc4>] (fsl_asrc_probe+0x2a8/0x708)^M
> [<c0d3ecc4>] (fsl_asrc_probe) from [<c0935b08>] (platform_probe+0x58/0xb8)^M
> [<c0935b08>] (platform_probe) from [<c0933264>] (really_probe.part.0+0x9c/0x334)^M
> [<c0933264>] (really_probe.part.0) from [<c093359c>] (__driver_probe_device+0xa0/0x138)^M
> [<c093359c>] (__driver_probe_device) from [<c0933664>] (driver_probe_device+0x30/0xc8)^M
> [<c0933664>] (driver_probe_device) from [<c0933c88>] (__driver_attach+0x90/0x130)^M
> [<c0933c88>] (__driver_attach) from [<c0931060>] (bus_for_each_dev+0x78/0xb8)^M
> [<c0931060>] (bus_for_each_dev) from [<c093254c>] (bus_add_driver+0xf0/0x1d8)^M
> [<c093254c>] (bus_add_driver) from [<c0934a30>] (driver_register+0x88/0x118)^M
> [<c0934a30>] (driver_register) from [<c01022c0>] (do_one_initcall+0x7c/0x3a4)^M
> [<c01022c0>] (do_one_initcall) from [<c1601204>] (kernel_init_freeable+0x198/0x22c)^M
> [<c1601204>] (kernel_init_freeable) from [<c0f5ff2c>] (kernel_init+0x10/0x128)^M
> [<c0f5ff2c>] (kernel_init) from [<c010013c>] (ret_from_fork+0x14/0x38)^M
> 
> or
> 
> Unhandled fault: external abort on non-linefetch (0x808) at 0xd19b0000^M
> pgd = (ptrval)^M
> [d19b0000] *pgd=82711811, *pte=308a0653, *ppte=308a0453^M
> Internal error: : 808 [#1] SMP ARM^M
> ...
> [<c095e974>] (regmap_mmio_write32le) from [<c095eb48>] (regmap_mmio_write+0x3c/0x54)^M
> [<c095eb48>] (regmap_mmio_write) from [<c09580f4>] (_regmap_write+0x4c/0x1f0)^M
> [<c09580f4>] (_regmap_write) from [<c0959b28>] (regmap_write+0x3c/0x60)^M
> [<c0959b28>] (regmap_write) from [<c0d41130>] (fsl_sai_runtime_resume+0x9c/0x1ec)^M
> [<c0d41130>] (fsl_sai_runtime_resume) from [<c0942464>] (__rpm_callback+0x3c/0x108)^M
> [<c0942464>] (__rpm_callback) from [<c0942590>] (rpm_callback+0x60/0x64)^M
> [<c0942590>] (rpm_callback) from [<c0942b60>] (rpm_resume+0x5cc/0x808)^M
> [<c0942b60>] (rpm_resume) from [<c0942dfc>] (__pm_runtime_resume+0x60/0xa0)^M
> [<c0942dfc>] (__pm_runtime_resume) from [<c0d4231c>] (fsl_sai_probe+0x2b8/0x65c)^M
> [<c0d4231c>] (fsl_sai_probe) from [<c0935b08>] (platform_probe+0x58/0xb8)^M
> [<c0935b08>] (platform_probe) from [<c0933264>] (really_probe.part.0+0x9c/0x334)^M
> [<c0933264>] (really_probe.part.0) from [<c093359c>] (__driver_probe_device+0xa0/0x138)^M
> [<c093359c>] (__driver_probe_device) from [<c0933664>] (driver_probe_device+0x30/0xc8)^M
> [<c0933664>] (driver_probe_device) from [<c0933c88>] (__driver_attach+0x90/0x130)^M
> [<c0933c88>] (__driver_attach) from [<c0931060>] (bus_for_each_dev+0x78/0xb8)^M
> [<c0931060>] (bus_for_each_dev) from [<c093254c>] (bus_add_driver+0xf0/0x1d8)^M
> [<c093254c>] (bus_add_driver) from [<c0934a30>] (driver_register+0x88/0x118)^M
> [<c0934a30>] (driver_register) from [<c01022c0>] (do_one_initcall+0x7c/0x3a4)^M
> [<c01022c0>] (do_one_initcall) from [<c1601204>] (kernel_init_freeable+0x198/0x22c)^M
> [<c1601204>] (kernel_init_freeable) from [<c0f5ff2c>] (kernel_init+0x10/0x128)^M
> [<c0f5ff2c>] (kernel_init) from [<c010013c>] (ret_from_fork+0x14/0x38)^M
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Updated description to include tracebacks and to use the term 'instantiate'
>     Added inline comments describing devices in more detail

Thank you!

Peter you might want to s/^M// when queueing ;)

>     Added Philippe's Reviewed-by: tag
> 
>  hw/arm/fsl-imx6ul.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> index e0128d7316..1d1a708dd9 100644
> --- a/hw/arm/fsl-imx6ul.c
> +++ b/hw/arm/fsl-imx6ul.c
> @@ -534,6 +534,13 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
>       */
>      create_unimplemented_device("sdma", FSL_IMX6UL_SDMA_ADDR, 0x4000);
>  
> +    /*
> +     * SAI (Audio SSI (Synchronous Serial Interface))
> +     */
> +    create_unimplemented_device("sai1", FSL_IMX6UL_SAI1_ADDR, 0x4000);
> +    create_unimplemented_device("sai2", FSL_IMX6UL_SAI2_ADDR, 0x4000);
> +    create_unimplemented_device("sai3", FSL_IMX6UL_SAI3_ADDR, 0x4000);
> +
>      /*
>       * PWM
>       */
> @@ -542,6 +549,11 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
>      create_unimplemented_device("pwm3", FSL_IMX6UL_PWM3_ADDR, 0x4000);
>      create_unimplemented_device("pwm4", FSL_IMX6UL_PWM4_ADDR, 0x4000);
>  
> +    /*
> +     * Audio ASRC (asynchronous sample rate converter)
> +     */
> +    create_unimplemented_device("asrc", FSL_IMX6UL_ASRC_ADDR, 0x4000);
> +
>      /*
>       * CAN
>       */
> 


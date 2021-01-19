Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F182FB643
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:14:34 +0100 (CET)
Received: from localhost ([::1]:60224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1qqA-0004xN-0m
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1qjn-0002Ja-Q0
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:08:00 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1qjk-0006nt-Ro
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:07:59 -0500
Received: by mail-ed1-x529.google.com with SMTP id g1so20762387edu.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5bXiHWkDHuGNqPxK6b0dfBoHjyPw7FWQ4FviaJl/KSw=;
 b=POmsJaS596r11EIb9KM3Bv7X38itEd52XRgTByy3L8I9G9io0QwT9L8azr356E8wOt
 lLIO+cWSWZOYnZGuX4jzpjb4ym3NcUa2UPTw7u/vHH7CE2QClzQpHtyHIK691JMA7VkW
 tNQZCX7mlKkXXz9dR5DQCf1xXZpP4pIN9z6sgfLS0VksV3GAZGKgXjYFWsrrmyjk8ibZ
 aQcsBt6yecwe8S8liWXcDPvVYMJLnLp4fkkbpcdmArWuGeBDkN9is7eMyvoMRcZR2572
 KNiF7cfv0kNYVuAdZQHr79Ybaqs4thbdxxXbnm7x3Ky29YLarRGJeZ1uWMuDDrRyqNpQ
 r69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5bXiHWkDHuGNqPxK6b0dfBoHjyPw7FWQ4FviaJl/KSw=;
 b=SymFzarJ4MGXiSoslnMKUpTzzchvuHRTf4xELal76j3RqsRFS81hZcTOYh7L18qjVj
 4PQ/f+WjmZlhlltk7HgUz5Xp19EWRo8M8GOKIdqfYGl+a+KlJ28kDLiQM0WI1ev7j7si
 uWfThCWUBfbq6AecFivF8/+iQiykvYkrj5TRvcTLf9l4gtrXNiNHfAVDlxB16wVTnz9h
 oK9TqfO4s5Azgr4782oaUbN2kl0y29PZ45QJ76tBP5gooxAUXoeyGGsxV/KL2apOgR4q
 438u73UMEuhgvNfagoS5rYFWLAlP5fk0YTcW5bGVPGLmvmuIeob4nPsDWszTmg5wGU2s
 dJQA==
X-Gm-Message-State: AOAM532/oDWUYWEX0owxtt6FazamzVGerCvXuTDGrO3mgC0AFY+b0pQW
 T2qVeXkb42IUY8IJvOK+uYNVtHXY2RKCcCBX/cbNAQ==
X-Google-Smtp-Source: ABdhPJxLuC02nEALG4gyQqDuIwYX5RyLQfDpoHs4Yx9QCZUn9PXitiMc5uvXSPri+o9YGErC4fq9jTsDhGxNC3tENEI=
X-Received: by 2002:a50:9ee3:: with SMTP id a90mr3338287edf.44.1611061675047; 
 Tue, 19 Jan 2021 05:07:55 -0800 (PST)
MIME-Version: 1.0
References: <20210115101126.4259-1-maxim.uvarov@linaro.org>
 <20210115101126.4259-4-maxim.uvarov@linaro.org>
In-Reply-To: <20210115101126.4259-4-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 13:07:43 +0000
Message-ID: <CAFEAcA-p-H6ZS_8gwVWmBEnzoa0GtqNwUAESx2bXp3wpoGs9aQ@mail.gmail.com>
Subject: Re: [PATCHv7 3/3] arm-virt: add secure pl061 for reset/power down
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 10:11, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Add secure pl061 for reset/power down machine from
> the secure world (Arm Trusted Firmware). Connect it
> with gpio-pwr driver.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  hw/arm/Kconfig        |  1 +
>  hw/arm/virt.c         | 50 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |  2 ++
>  3 files changed, 53 insertions(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 0a242e4c5d..13cc42dcc8 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -17,6 +17,7 @@ config ARM_VIRT
>      select PL011 # UART
>      select PL031 # RTC
>      select PL061 # GPIO
> +    select GPIO_PWR
>      select PLATFORM_BUS
>      select SMBIOS
>      select VIRTIO_MMIO
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 26bb66e8e1..436ae894c9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -153,6 +153,7 @@ static const MemMapEntry base_memmap[] = {
>      [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
>      [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
>      [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
> +    [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -841,6 +842,46 @@ static void create_gpio_keys(const VirtMachineState *vms,
>                             "gpios", phandle, 3, 0);
>  }
>
> +#define ATF_GPIO_POWEROFF 3
> +#define ATF_GPIO_REBOOT   4

These aren't ATF specific, so you could name them SECURE_GPIO_POWEROFF
and SECURE_GPIO_REBOOT.

Remind me why we start with GPIO line number 3 and not 0 ?

> +
> +static void create_gpio_pwr(const VirtMachineState *vms,
> +                            DeviceState *pl061_dev,
> +                            uint32_t phandle)
> +{
> +    DeviceState *gpio_pwr_dev;
> +
> +    /* gpio-pwr */
> +    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
> +
> +    /* connect secure pl061 to gpio-pwr */
> +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_POWEROFF,
> +                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
> +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_REBOOT,
> +                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));

You've connected the POWEROFF gpio line to 'reset' and the
REBOOT line to 'shutdown'. This looks like it's backwards.

> +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr");
> +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr", "compatible", "gpio-pwr");
> +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr", "#size-cells", 0);
> +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr", "#address-cells", 1);
> +
> +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr/poweroff");
> +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr/poweroff",
> +                            "label", "GPIO PWR Poweroff");
> +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr/poweroff", "code",
> +                          ATF_GPIO_POWEROFF);
> +    qemu_fdt_setprop_cells(vms->fdt, "/gpio-pwr/poweroff",
> +                           "gpios", phandle, 3, 0);
> +
> +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr/reboot");
> +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr/reboot",
> +                            "label", "GPIO PWR Reboot");
> +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr/reboot", "code",
> +                          ATF_GPIO_REBOOT);
> +    qemu_fdt_setprop_cells(vms->fdt, "/gpio-pwr/reboot",
> +                           "gpios", phandle, 3, 0);

There doesn't seem to be any documented 'gpio-pwr' devicetree
binding. Where does this come from ?

I think the bindings you want to be using are
https://www.kernel.org/doc/Documentation/devicetree/bindings/power/reset/gpio-restart.txt
https://www.kernel.org/doc/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt

thanks
-- PMM


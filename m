Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D57650959
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:34:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7CW9-0005ZN-NC; Mon, 19 Dec 2022 04:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p7CW7-0005Yt-EH; Mon, 19 Dec 2022 04:33:03 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p7CW5-0007Zn-Th; Mon, 19 Dec 2022 04:33:03 -0500
Received: by mail-vs1-xe35.google.com with SMTP id k185so8138245vsc.2;
 Mon, 19 Dec 2022 01:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OGTm0UQKdb3bLdGM6tKYU9OQdCBQgoEE6wTKpbhs2HA=;
 b=gLpx5AZM/kmM9yHkZF3FKPpxMiqVkFUFC0K5cV/vAyfXfStDmOJDxD2w36Y20ZI+R1
 oP75/62uSKpgIpkePW2gtXCqxd/23ulscP4ibadt1Zuryljj7B4ohqLgk4ZgJBzShY8W
 qqKpnbMHuE3ueSbCwxLUW78Vm2D0ha1NxEV0iHr6vkmYJDuiTlE9iVqFQHSq+BWOjhm9
 lDgFFkyxIvnijmKXPbemkIhsd+aE1YLdT1RG3AlSziDFE030rxlp09yLw9MdHdHUdlYQ
 i3kM1egWqILTunrEIPOx2VI0AtN966kVtZu+2QiPYRNbvuvalcgXskm7N5SWBGohbOJp
 o72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OGTm0UQKdb3bLdGM6tKYU9OQdCBQgoEE6wTKpbhs2HA=;
 b=EfA/svmQno+Te+y2hVnqIwwLc/i2K3FoIQrIPPYjz1zytVWI03n9GgEXvjkqaJtf3D
 iBUWTQJAsXe0pAmwhtGXMNkdNd0l3UTUrFCUU3Z3wi9BizUq2Ou3hXYDeAdo0yD8MAGI
 ZM0/TQIk8NTzWlTSupH1m4fi8Z20xAyGzNrEQF8lD8dy0Os7PU9YgWGvGIVgTgQWUYxk
 z9kCb4Wi9/a6n8+aGfFtgla7PxC//WGKdnmZQDULisjkK08TqYoSZYwm7Yw/BhDiSAiD
 x4vj9ZCRYNyPYEf1XSCf+ysCh+n4WyJhOSf8ziApnMqw1uCbDu6dRBXBfcrUeJCSFmHS
 O2VA==
X-Gm-Message-State: AFqh2kqli6+0BMBTbDEEmoi8PeYWVyaPfj9MPeB9dwxyBMIOS89TcBv0
 Gbb+46AxOtOIwagTtI58kmH02GJKKM6vK/A5eKg=
X-Google-Smtp-Source: AMrXdXs5ufpead0ZvV+izvUMk5ngtSCnYYjjIckpGDwviHRAeBffvv67xD1msIvcmP+mcyZO36OLJZFrWrOMEH7BuD8=
X-Received: by 2002:a05:6102:21cc:b0:3ba:8fa7:5f9e with SMTP id
 r12-20020a05610221cc00b003ba8fa75f9emr927794vsg.64.1671442380187; Mon, 19 Dec
 2022 01:33:00 -0800 (PST)
MIME-Version: 1.0
References: <20221218071229.484944-1-balbi@kernel.org>
 <20221218071229.484944-2-balbi@kernel.org>
In-Reply-To: <20221218071229.484944-2-balbi@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 19 Dec 2022 19:32:00 +1000
Message-ID: <CAKmqyKO2UVac7CtJ50JR=AqVBvr9mOnyUQqm6Xf81_px0kRt+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/stm32f405: correctly describe the memory layout
To: Felipe Balbi <balbi@kernel.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 19, 2022 at 1:24 AM Felipe Balbi <balbi@kernel.org> wrote:
>
> STM32F405 has 128K of SRAM and another 64K of CCM (Core-coupled
> Memory) at a different base address. Correctly describe the memory
> layout to give existing FW images have a chance to run unmodified.
>
> Signed-off-by: Felipe Balbi <balbi@kernel.org>

Reviewed-by: Alistair Francis <alistair@alistair23.me>

Alistair

> ---
>  hw/arm/stm32f405_soc.c         | 8 ++++++++
>  include/hw/arm/stm32f405_soc.h | 5 ++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
> index c07947d9f8b1..cef23d7ee41a 100644
> --- a/hw/arm/stm32f405_soc.c
> +++ b/hw/arm/stm32f405_soc.c
> @@ -139,6 +139,14 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
>      }
>      memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
>
> +    memory_region_init_ram(&s->ccm, NULL, "STM32F405.ccm", CCM_SIZE,
> +                           &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(system_memory, CCM_BASE_ADDRESS, &s->ccm);
> +
>      armv7m = DEVICE(&s->armv7m);
>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
>      qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
> diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
> index 5bb0c8d56979..249ab5434ec7 100644
> --- a/include/hw/arm/stm32f405_soc.h
> +++ b/include/hw/arm/stm32f405_soc.h
> @@ -46,7 +46,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(STM32F405State, STM32F405_SOC)
>  #define FLASH_BASE_ADDRESS 0x08000000
>  #define FLASH_SIZE (1024 * 1024)
>  #define SRAM_BASE_ADDRESS 0x20000000
> -#define SRAM_SIZE (192 * 1024)
> +#define SRAM_SIZE (128 * 1024)
> +#define CCM_BASE_ADDRESS 0x10000000
> +#define CCM_SIZE (64 * 1024)
>
>  struct STM32F405State {
>      /*< private >*/
> @@ -65,6 +67,7 @@ struct STM32F405State {
>      STM32F2XXADCState adc[STM_NUM_ADCS];
>      STM32F2XXSPIState spi[STM_NUM_SPIS];
>
> +    MemoryRegion ccm;
>      MemoryRegion sram;
>      MemoryRegion flash;
>      MemoryRegion flash_alias;
> --
> 2.38.1
>
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC26468CD93
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 04:44:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPEsz-0005TS-7w; Mon, 06 Feb 2023 22:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pPEsv-0005T2-Lh; Mon, 06 Feb 2023 22:43:10 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pPEsp-0006so-S6; Mon, 06 Feb 2023 22:43:09 -0500
Received: by mail-ej1-x634.google.com with SMTP id e22so10609921ejb.1;
 Mon, 06 Feb 2023 19:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w4dtwDSPc1b3/CIRYaTSaxyFeWuM9HcnDANTq8UZwCY=;
 b=B4ch1vE2gaqVPe090Elw+KCEaTVR+VeGP8oJRIItaB9Dii0EH4lXGHWJNocg1zC0Ng
 X5pVLZepKN68KF313nUIatU4e+DH21lucjoAShnDQxPT4DDcOvTZQ+faUgRGnYyLY28W
 ycfkkmaEIdBJrLEl5dVmZkitqzaC/hEY75uP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w4dtwDSPc1b3/CIRYaTSaxyFeWuM9HcnDANTq8UZwCY=;
 b=aQ29j8M7h2nA8ChAN36VHZdhI64bGMGNMZvB17a0IlJA9LVZHVE8UXjraGQ/Bon4Sm
 4Se/dHzAaH3h5ha4ARQQroOXKF1zW0dPc7a4RRMaL6vqzy/kewaq4xwZ+msH6AEGKYZJ
 BOBvds0lfijB39FILboXpir6Y+8rdQCsSxp/ImE6tnuEk07L/DFn8w3MwadLJYEqUsOc
 zQfOHJRvSHZERc6lcBUcv0RONbbURR3vMVu4ZEflRCWz370qFiJ1L4f2Rhnb1pGf3/E+
 gZ8bhE+E2i3MkzD4ceEYgxogfwKM1QkJU1m1ex8YbGLNm0e1fTkl/M5rNbMAsxxGmgHD
 vZUw==
X-Gm-Message-State: AO0yUKU/Zpe7BKdM5QFtF9jvLhGXPp17qMuPEV9OtGenNu0qZH5Rlgp1
 daaU5h90meoQChaJmYeFbai464iWq4R4QV791Ag=
X-Google-Smtp-Source: AK7set/OXEPl/NesK6+nitXHKCeNtoCN9te0wLf+1WZL/l7lop+o9ueUy2Cdn3jlINyvnk9S6CBIxnJSGeei+p3VKP8=
X-Received: by 2002:a17:906:3013:b0:885:2313:c8b5 with SMTP id
 19-20020a170906301300b008852313c8b5mr478629ejz.201.1675741380442; Mon, 06 Feb
 2023 19:43:00 -0800 (PST)
MIME-Version: 1.0
References: <20230206194936.168843-1-titusr@google.com>
 <20230206194936.168843-2-titusr@google.com>
In-Reply-To: <20230206194936.168843-2-titusr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Feb 2023 03:42:54 +0000
Message-ID: <CACPK8Xc=w9n-Q-K7iJQF8QSSzSW1e1S=dfuqrQvRp=SOCwQfHw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/gpio: add PCA6414 i2c GPIO expander
To: Titus Rwantare <titusr@google.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 6 Feb 2023 at 19:51, Titus Rwantare <titusr@google.com> wrote:
>
> This is a simple i2c device that allows i2c capable devices to have
> GPIOs.

Nice.

In Linux this is supported by a driver called pca953x.  Would it make
sense to name your model similarly (both the file and the prefixes you
use)?

If we do that then it looks like other devices from the same family
could be easily supported. (I'm not suggesting you do that work up
front)

>  hw/gpio/pca_i2c_gpio.c          | 362 ++++++++++++++++++++++++++++++++
>  hw/gpio/trace-events            |   5 +
>  hw/i2c/Kconfig                  |   4 +
>  include/hw/gpio/pca_i2c_gpio.h  |  72 +++++++
>  tests/qtest/meson.build         |   1 +
>  tests/qtest/pca_i2c_gpio-test.c | 169 +++++++++++++++
>  8 files changed, 615 insertions(+)
>  create mode 100644 hw/gpio/pca_i2c_gpio.c
>  create mode 100644 include/hw/gpio/pca_i2c_gpio.h
>  create mode 100644 tests/qtest/pca_i2c_gpio-test.c
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2d157de9b8..1b533ddd76 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -418,6 +418,7 @@ config NPCM7XX
>      select SSI
>      select UNIMP
>      select PCA954X
> +    select PCA_I2C_GPIO
>
>  config FSL_IMX25
>      bool
> diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
> index b726e6d27a..1e5b602002 100644
> --- a/hw/gpio/meson.build
> +++ b/hw/gpio/meson.build
> @@ -12,3 +12,4 @@ softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gpio.c'))
>  softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
>  softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c'))
> +softmmu_ss.add(when: 'CONFIG_PCA_I2C_GPIO', if_true: files('pca_i2c_gpio.c'))
> diff --git a/hw/gpio/pca_i2c_gpio.c b/hw/gpio/pca_i2c_gpio.c
> new file mode 100644
> index 0000000000..afae497a22
> --- /dev/null
> +++ b/hw/gpio/pca_i2c_gpio.c
> @@ -0,0 +1,362 @@
> +/*
> + * NXP PCA I2C GPIO Expanders
> + *
> + * Low-voltage translating 16-bit I2C/SMBus GPIO expander with interrupt output,
> + * reset, and configuration registers
> + *
> + * Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA6416A.pdf

+1

> + *
> + * Copyright 2023 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * These devices, by default, are configured to input only. The configuration is
> + * settable through qom/qmp, or i2c.To set some pins as inputs before boot, use
> + * the following in the board file of the machine:
> + *      object_property_set_uint(Object *obj, const char *name,
> + *                               uint64_t value, Error **errp);
> + * specifying name as "gpio_config" and the value as a bitfield of the inputs
> + * e.g. for the pca6416, a value of 0xFFF0, sets pins 0-3 as outputs and
> + * 4-15 as inputs.
> + * This value can also be set at runtime through qmp externally, or by
> + * writing to the config register using i2c.

Nice docs. I'm sure someone else will tell you if there's a better
spot, but I like that you've written this down.


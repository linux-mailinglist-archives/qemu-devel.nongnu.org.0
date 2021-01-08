Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4DF2EF3F5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 15:33:36 +0100 (CET)
Received: from localhost ([::1]:54264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxspb-0001VF-8t
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 09:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxso4-0000rp-Q4
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 09:32:00 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxso2-0005MM-2S
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 09:32:00 -0500
Received: by mail-ej1-x62b.google.com with SMTP id qw4so14678342ejb.12
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 06:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z2fET9aT5jYvH4mQ6JfrVdx+5XT3aGRhAsHcbfWCoRU=;
 b=c2NE2SnxwR/oBnwjpP7cI199pSHyqdvz9xe5r9t490W3su6eoYeNozjuEsWjj3Sfhc
 cD90yI71Lv4luMKf0RViHEfXp8iwAMqNs8qDhE9lonIc3lWsfFoSfXRT+8V4Uqb/Le6o
 gs9Pi3swK0UfSAlLrPN276V55UFKFrQWmrRmrjcNVbpmHzMaeGQ8WC0szso9ZdgfHYt+
 phguDuIjUj7tZegMkQhrunBCelOWxqKjjGEroXiPNzKtnIE34Zjh8NrAUaTo6V6H4gZ8
 gLi7vxMmH7627UgTCQuPOvKrUT2zLpY0M4aUPlQjpuyPUjAA6V/kzTOKKAgs7tRsw3Nm
 9UBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z2fET9aT5jYvH4mQ6JfrVdx+5XT3aGRhAsHcbfWCoRU=;
 b=d2mJc3FzWfLrZuDNGdZaIaE4dnJUh6RmM8Sf9wiSwiHba44uH7Ha/DYZGQQL6nTcCI
 pqZ88vyQMU+Scmv4JruwNgtc6JdbKRUZ/DakSf6+g3BB/TTpEf6waAYJNVG8XKvxcvyB
 8slJeRGw+uqkzxPrcrraepRQ8ekFJBw8vVxjClg+ixfBQ/iq851orQ4F9DRcwrqfx9yJ
 9orx/olkFMT5gSlCSYiWRuxQqcSnSjE4H4shK+h2/r4m/42mXbsoMRhZVoFCMwTQ/juC
 ke60Pfm0c4wiayT9+xKacXMUUxty0Hj8LFQ2HWi5AnNkZHhWfAQzXKs9+9HbqjIqPWF/
 5/ww==
X-Gm-Message-State: AOAM532gBWs2OLSSV4LuFPVyWN2JarAqTZ7mZJ2MrCW2lkfELhRVwvmr
 B3fclS2usnjt4fYf5WVSbZcnLN9UbuoUK9N/lj4PXg==
X-Google-Smtp-Source: ABdhPJyeEfL4ghWf0n/9cpXyuZqG6GBzpJxNV96yHUhTxjaF9ONiNfumMsnTzbc18N4d7lVkG77kPu2V8zZlqPt+cyE=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr2744082ejf.407.1610116315014; 
 Fri, 08 Jan 2021 06:31:55 -0800 (PST)
MIME-Version: 1.0
References: <20210106163426.9971-1-maxim.uvarov@linaro.org>
In-Reply-To: <20210106163426.9971-1-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 14:31:43 +0000
Message-ID: <CAFEAcA9cH+30iwuR++faaz3LmzkvqFHuMcPZ38HdX5q5nqJ_KA@mail.gmail.com>
Subject: Re: [PATCHv3] arm-virt: add secure pl061 for reset/power down
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Jose.Marinho@arm.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Jan 2021 at 16:34, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Add secure pl061 for reset/power down machine from
> the secure world (Arm Trusted Firmware).
> Use the same gpio 3 and gpio 4 which were used by
> non acpi variant of linux power control gpios.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  v3: added missed include qemu/log.h for qemu_log(..
>  v2: replace printf with qemu_log (Philippe Mathieu-Daud=C3=A9)
>
>  hw/arm/Kconfig        |  1 +
>  hw/arm/virt.c         | 24 ++++++++++++
>  hw/gpio/Kconfig       |  3 ++
>  hw/gpio/gpio_pwr.c    | 85 +++++++++++++++++++++++++++++++++++++++++++
>  hw/gpio/meson.build   |  1 +
>  include/hw/arm/virt.h |  1 +
>  6 files changed, 115 insertions(+)
>  create mode 100644 hw/gpio/gpio_pwr.c

Could you put "Implement new gpio_pwr device" and "wire up
gpio_pwr device in virt board" in separate patches please?
(That is, turn this into a two-patch patchset.)

> +static void create_gpio_secure(const VirtMachineState *vms)
> +{
> +    DeviceState *pl061_dev;
> +    static DeviceState *gpio_pwr_dev;
> +
> +    hwaddr base =3D vms->memmap[VIRT_SECURE_GPIO].base;
> +    int irq =3D vms->irqmap[VIRT_SECURE_GPIO];
> +
> +    pl061_dev =3D sysbus_create_simple("pl061", base,
> +                                     qdev_get_gpio_in(vms->gic, irq));

sysbus_create_simple() will map the device into the default
(NonSecure) address space. You need to pass secure_sysmem into
the create_ function and use that (compare create_uart()).

> +
> +    gpio_pwr_dev =3D sysbus_create_simple("gpio-pwr", -1,
> +                                        qdev_get_gpio_in(pl061_dev, 3));
> +
> +    qdev_connect_gpio_out(pl061_dev, 3, qdev_get_gpio_in(gpio_pwr_dev, 3=
));
> +    qdev_connect_gpio_out(pl061_dev, 4, qdev_get_gpio_in(gpio_pwr_dev, 4=
));
> +}
> +
>  static void create_virtio_devices(const VirtMachineState *vms)
>  {
>      int i;
> @@ -1993,6 +2013,10 @@ static void machvirt_init(MachineState *machine)
>          create_gpio(vms);
>      }
>
> +    if (vms->secure) {
> +        create_gpio_secure(vms);
> +    }

The 'virt' board has strict versioning -- this means that, for
instance, the 'virt-5.2' machine must always look exactly like
the version of 'virt' that shipped in QEMU's 5.2 release, with
no extra guest visible devices. So you need to add the flags
and code so that this new secure PL061 is only present from
virt-6.0 and onwards. This means a flag no_secure_gpio in the
VirtMachineClass and a flag secure_gpio in the VirtMachineState,
a line setting vmc->no_secure_gpio to true in virt_machine_5_2_options(),
code in virt_instance_init() to set vms->secure_gpio from
vmc->no_secure_gpio, and then only create the secure GPIO if
vms->secure_gpio is true. The 'no_its'/'its' flags are the
right pattern to use. (Yes, having no_foo in the class struct
and foo in the state struct is deliberate.)

> diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
> new file mode 100644
> index 0000000000..0d0680c9f7
> --- /dev/null
> +++ b/hw/gpio/gpio_pwr.c
> @@ -0,0 +1,85 @@
> +/*
> + * GPIO qemu power controller
> + *
> + * Copyright (c) 2020 Linaro Limited
> + *
> + * Author: Maxim Uvarov <maxim.uvarov@linaro.org>
> + *
> + * Virtual gpio driver which can be used on top of pl061
> + * to reboot and shutdown qemu virtual machine. One of use
> + * case is gpio driver for secure world application (ARM
> + * Trusted Firmware.).
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */

What is the interface of this device intended to be?
As written it has:
 * 8 input GPIO lines, of which all except 3 and 4 are
   ignored; asserting input line 3 triggers a shutdown,
   and asserting input line 4 triggers a reset
 * one output IRQ line, which is asserted whenever any
   input GPIO line is set to any level, and never cleared

This seems a very weird choice of interface. I was expecting
something much more simple:
 * no output IRQ or GPIO lines
 * two named input GPIO lines:
    'reset' : when asserted, trigger system reset
    'shutdown' : when asserted, trigger system shutdown

thanks
-- PMM


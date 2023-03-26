Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FEB6C9785
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 21:06:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgVfO-00036T-2i; Sun, 26 Mar 2023 15:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pgVfF-000369-7X; Sun, 26 Mar 2023 15:04:25 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pgVfA-0005MF-LY; Sun, 26 Mar 2023 15:04:24 -0400
Received: by mail-yb1-xb35.google.com with SMTP id p203so7887269ybb.13;
 Sun, 26 Mar 2023 12:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679857459;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yPGBJiqly/lpMSUKz0lxpKmdDTREEl8vlTKeQCuX1xc=;
 b=UnhVaLG6MMlLofiOIk4wvmOylyEvcWINNBNefwEsHetTzf/CSjfgqZ1u8pcRDke+O6
 uknmR8uWneOLkYhs3a+WEPF4+GIftTY26x+Y0ydwGrybV06R/88w/IuQfVuslIodfdLG
 gD0gYTW91zpnw2+KwspR9N0jKaKz9lVMRSeEAZAlbjV7nxLRyKFDijSNDGjH/37RjktQ
 Ybo0XHeFXvliaIS698LlEltKQup1Y8yoeeqE7JRtNjXYuB28AjC2E8TdtDJrEHgxz9J4
 U9jcGm2xI1uh8KF0J2eGYEj/dkskNwshc5Alns80rSsqj7CAayLQhTHU3gZ/yYTEqJUZ
 7S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679857459;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yPGBJiqly/lpMSUKz0lxpKmdDTREEl8vlTKeQCuX1xc=;
 b=WjdqLOTW6LcCstYYFmNDTBciSF+g33cqOf+SA+QWFgN+ccL7T3cxmiBgxqaDBRZ2uG
 XfW/rGq4wG8IBLCyvWulR7gJ9+gC/JnOSp03518JAsydySlTjaSp37rw2kR2H9v8W6i0
 X222DvK8El4Ei62keSBPkicmUSJ3uiFFr2UvJQhTR0wbssAHG6V+4IjCQP3iRnndX5sT
 VLPZ62ZP723ke+N4U1xxv3anSogAtL/Rl7MNG9E7lRID2EtAgLNsEa9ZaLI7pIWQ2KJY
 wu3hDnT7oXcj026vEKm+BCd8+8uacalcOBv28IYHKNGHTptF4YyiwJlniCZsWLqRLxam
 yVrA==
X-Gm-Message-State: AAQBX9d+VnK692Mje+xwg/38qePnNB5BdErbYHNRNdLggsCBjQnBb346
 v7KAqtM97cXYzHcWp7WMtF8WEriL9+UR6x0ROk4=
X-Google-Smtp-Source: AKy350Z+ADwmLfSQCgwuQa04Ah8geJi2Lj4wDTnuRzy1GIUMIjODjI7Lup/sCzHCE+R/xONlnzHsSyTK5OUDFpipOps=
X-Received: by 2002:a05:6902:1881:b0:b69:83b2:5124 with SMTP id
 cj1-20020a056902188100b00b6983b25124mr4107769ybb.0.1679857458716; Sun, 26 Mar
 2023 12:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230317001203.18425-1-strahinja.p.jankovic@gmail.com>
 <20230317001203.18425-2-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20230317001203.18425-2-strahinja.p.jankovic@gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 26 Mar 2023 21:04:07 +0200
Message-ID: <CAPan3WrQXP-6BkT8eEDHW32b5fT_dA16s=1iJat54+ETG-8TSQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] hw/watchdog: Allwinner WDT emulation for system
 reset
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000019a3d005f7d24b99"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000019a3d005f7d24b99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Strahinja,




On Fri, Mar 17, 2023 at 1:13=E2=80=AFAM Strahinja Jankovic <
strahinjapjankovic@gmail.com> wrote:

> This patch adds basic support for Allwinner WDT.
> Both sun4i and sun6i variants are supported.
> However, interrupt generation is not supported, so WDT can be used only t=
o
> trigger system reset.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>
> ---
>  hw/watchdog/Kconfig                 |   4 +
>  hw/watchdog/allwinner-wdt.c         | 416 ++++++++++++++++++++++++++++
>  hw/watchdog/meson.build             |   1 +
>  hw/watchdog/trace-events            |   7 +
>  include/hw/watchdog/allwinner-wdt.h | 123 ++++++++
>  5 files changed, 551 insertions(+)
>  create mode 100644 hw/watchdog/allwinner-wdt.c
>  create mode 100644 include/hw/watchdog/allwinner-wdt.h
>
> diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
> index 66e1d029e3..861fd00334 100644
> --- a/hw/watchdog/Kconfig
> +++ b/hw/watchdog/Kconfig
> @@ -20,3 +20,7 @@ config WDT_IMX2
>
>  config WDT_SBSA
>      bool
> +
> +config ALLWINNER_WDT
> +    bool
> +    select PTIMER
> diff --git a/hw/watchdog/allwinner-wdt.c b/hw/watchdog/allwinner-wdt.c
> new file mode 100644
> index 0000000000..45a4a36ba7
> --- /dev/null
> +++ b/hw/watchdog/allwinner-wdt.c
> @@ -0,0 +1,416 @@
> +/*
> + * Allwinner Watchdog emulation
> + *
> + * Copyright (C) 2023 Strahinja Jankovic <strahinja.p.jankovic@gmail.com=
>
> + *
> + *  This file is derived from Allwinner RTC,
> + *  by Niek Linnenbank.
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/units.h"
> +#include "qemu/module.h"
> +#include "trace.h"
> +#include "hw/sysbus.h"
> +#include "hw/registerfields.h"
> +#include "hw/watchdog/allwinner-wdt.h"
> +#include "sysemu/watchdog.h"
> +#include "migration/vmstate.h"
> +
> +/* WDT registers */
> +enum {
> +    REG_IRQ_EN =3D 0,     /* Watchdog interrupt enable */
> +    REG_IRQ_STA,        /* Watchdog interrupt status */
> +    REG_CTRL,           /* Watchdog control register */
> +    REG_CFG,            /* Watchdog configuration register */
> +    REG_MODE,           /* Watchdog mode register */
> +};
> +
> +/* Universal WDT register flags */
> +#define WDT_RESTART_MASK    (1 << 0)
> +#define WDT_EN_MASK         (1 << 0)
> +
> +/* sun4i specific WDT register flags */
> +#define RST_EN_SUN4I_MASK       (1 << 1)
> +#define INTV_VALUE_SUN4I_SHIFT  (3)
> +#define INTV_VALUE_SUN4I_MASK   (0xfu << INTV_VALUE_SUN4I_SHIFT)
> +
> +/* sun6i specific WDT register flags */
> +#define RST_EN_SUN6I_MASK       (1 << 0)
> +#define KEY_FIELD_SUN6I_SHIFT   (1)
> +#define KEY_FIELD_SUN6I_MASK    (0xfffu << KEY_FIELD_SUN6I_SHIFT)
> +#define KEY_FIELD_SUN6I         (0xA57u)
> +#define INTV_VALUE_SUN6I_SHIFT  (4)
> +#define INTV_VALUE_SUN6I_MASK   (0xfu << INTV_VALUE_SUN6I_SHIFT)
> +
> +/* Map of INTV_VALUE to 0.5s units. */
> +static const uint8_t allwinner_wdt_count_map[] =3D {
> +    1,
> +    2,
> +    4,
> +    6,
> +    8,
> +    10,
> +    12,
> +    16,
> +    20,
> +    24,
> +    28,
> +    32
> +};
> +
> +/* WDT sun4i register map (offset to name) */
> +const uint8_t allwinner_wdt_sun4i_regmap[] =3D {
> +    [0x0000] =3D REG_CTRL,
> +    [0x0004] =3D REG_MODE,
> +};
> +
> +/* WDT sun6i register map (offset to name) */
> +const uint8_t allwinner_wdt_sun6i_regmap[] =3D {
> +    [0x0000] =3D REG_IRQ_EN,
> +    [0x0004] =3D REG_IRQ_STA,
> +    [0x0010] =3D REG_CTRL,
> +    [0x0014] =3D REG_CFG,
> +    [0x0018] =3D REG_MODE,
> +};
> +
> +static bool allwinner_wdt_sun4i_read(AwWdtState *s, uint32_t offset)
> +{
> +    /* no sun4i specific registers currently implemented */
> +    return false;
> +}
> +
> +static bool allwinner_wdt_sun4i_write(AwWdtState *s, uint32_t offset,
> +                                      uint32_t data)
> +{
> +    /* no sun4i specific registers currently implemented */
> +    return false;
> +}
> +
> +static bool allwinner_wdt_sun4i_can_reset_system(AwWdtState *s)
> +{
> +    if (s->regs[REG_MODE] & RST_EN_SUN6I_MASK) {
>

Should this function use the RST_EN_SUN4I_MASK instead?


> +        return true;
> +    } else {
> +        return false;
> +    }
> +}
> +
> +static bool allwinner_wdt_sun4i_is_key_valid(AwWdtState *s, uint32_t val=
)
> +{
> +    /* sun4i has no key */
> +    return true;
> +}
> +
> +static uint8_t allwinner_wdt_sun4i_get_intv_value(AwWdtState *s)
> +{
> +    return ((s->regs[REG_MODE] & INTV_VALUE_SUN4I_MASK) >>
> +            INTV_VALUE_SUN4I_SHIFT);
> +}
> +
> +static bool allwinner_wdt_sun6i_read(AwWdtState *s, uint32_t offset)
> +{
> +    const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);
> +
> +    switch (c->regmap[offset]) {
> +    case REG_IRQ_EN:
> +    case REG_IRQ_STA:
> +    case REG_CFG:
> +        return true;
> +    default:
> +        break;
> +    }
> +    return false;
> +}
> +
> +static bool allwinner_wdt_sun6i_write(AwWdtState *s, uint32_t offset,
> +                                      uint32_t data)
> +{
> +    const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);
> +
> +    switch (c->regmap[offset]) {
> +    case REG_IRQ_EN:
> +    case REG_IRQ_STA:
> +    case REG_CFG:
> +        return true;
> +    default:
> +        break;
> +    }
> +    return false;
> +}
> +
> +static bool allwinner_wdt_sun6i_can_reset_system(AwWdtState *s)
> +{
> +    if (s->regs[REG_CFG] & RST_EN_SUN6I_MASK) {
> +        return true;
> +    } else {
> +        return false;
> +    }
> +}
> +
> +static bool allwinner_wdt_sun6i_is_key_valid(AwWdtState *s, uint32_t val=
)
> +{
> +    uint16_t key =3D (val & KEY_FIELD_SUN6I_MASK) >> KEY_FIELD_SUN6I_SHI=
FT;
> +    return (key =3D=3D KEY_FIELD_SUN6I);
> +}
> +
> +static uint8_t allwinner_wdt_sun6i_get_intv_value(AwWdtState *s)
> +{
> +    return ((s->regs[REG_MODE] & INTV_VALUE_SUN6I_MASK) >>
> +            INTV_VALUE_SUN6I_SHIFT);
> +}
> +
> +static void allwinner_wdt_update_timer(AwWdtState *s)
> +{
> +    const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);
> +    uint8_t count =3D c->get_intv_value(s);
> +
> +    ptimer_transaction_begin(s->timer);
> +    ptimer_stop(s->timer);
> +
> +    /* Use map to convert. */
> +    if (count < sizeof(allwinner_wdt_count_map)) {
> +        ptimer_set_count(s->timer, allwinner_wdt_count_map[count]);
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: incorrect INTV_VALUE
> 0x%02x\n",
> +                __func__, count);
> +    }
> +
> +    ptimer_run(s->timer, 1);
> +    ptimer_transaction_commit(s->timer);
> +
> +    trace_allwinner_wdt_update_timer(count);
> +}
> +
> +static uint64_t allwinner_wdt_read(void *opaque, hwaddr offset,
> +                                       unsigned size)
> +{
> +    AwWdtState *s =3D AW_WDT(opaque);
> +    const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);
> +    uint64_t r;
> +
> +    if (offset >=3D c->regmap_size) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset
> 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        return 0;
> +    }
> +
> +    switch (c->regmap[offset]) {
> +    case REG_CTRL:
> +    case REG_MODE:
> +        r =3D s->regs[c->regmap[offset]];
> +        break;
> +    default:
> +        if (!c->read(s, offset)) {
> +            qemu_log_mask(LOG_UNIMP, "%s: unimplemented register
> 0x%04x\n",
> +                            __func__, (uint32_t)offset);
> +            return 0;
> +        }
> +        r =3D s->regs[c->regmap[offset]];
> +        break;
> +    }
> +
> +    trace_allwinner_wdt_read(offset, r, size);
> +
> +    return r;
> +}
> +
> +static void allwinner_wdt_write(void *opaque, hwaddr offset,
> +                                   uint64_t val, unsigned size)
> +{
> +    AwWdtState *s =3D AW_WDT(opaque);
> +    const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);
> +    uint32_t old_val;
> +
> +    if (offset >=3D c->regmap_size) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset
> 0x%04x\n",
> +                      __func__, (uint32_t)offset);
> +        return;
> +    }
> +
> +   trace_allwinner_wdt_write(offset, val, size);
> +
> +    switch (c->regmap[offset]) {
> +    case REG_CTRL:
> +        if (c->is_key_valid(s, val)) {
> +            if (val & WDT_RESTART_MASK) {
> +                /* Kick timer */
> +                allwinner_wdt_update_timer(s);
> +            }
> +        }
> +        break;
> +    case REG_MODE:
> +        old_val =3D s->regs[REG_MODE];
> +        s->regs[REG_MODE] =3D (uint32_t)val;
> +
> +        /* Check for rising edge on WDOG_MODE_EN */
> +        if ((s->regs[REG_MODE] & ~old_val) & WDT_EN_MASK) {
> +            allwinner_wdt_update_timer(s);
> +        }
> +        break;
> +    default:
> +        if (!c->write(s, offset, val)) {
> +            qemu_log_mask(LOG_UNIMP, "%s: unimplemented register
> 0x%04x\n",
> +                          __func__, (uint32_t)offset);
> +        }
> +        s->regs[c->regmap[offset]] =3D (uint32_t)val;
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps allwinner_wdt_ops =3D {
> +    .read =3D allwinner_wdt_read,
> +    .write =3D allwinner_wdt_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +    },
> +    .impl.min_access_size =3D 4,
> +};
> +
> +static void allwinner_wdt_expired(void *opaque)
> +{
> +    AwWdtState *s =3D AW_WDT(opaque);
> +    const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);
> +
> +    bool enabled =3D s->regs[REG_MODE] & WDT_EN_MASK;
> +    bool reset_enabled =3D c->can_reset_system(s);
> +
> +    trace_allwinner_wdt_expired(enabled, reset_enabled);
> +
> +    /* Perform watchdog action if watchdog is enabled and can trigger
> reset */
> +    if (enabled && reset_enabled) {
> +        watchdog_perform_action();
> +    }
> +}
> +
> +static void allwinner_wdt_reset_enter(Object *obj, ResetType type)
> +{
> +    AwWdtState *s =3D AW_WDT(obj);
> +
> +    trace_allwinner_wdt_reset_enter();
> +
> +    /* Clear registers */
> +    memset(s->regs, 0, sizeof(s->regs));
> +}
> +
> +static const VMStateDescription allwinner_wdt_vmstate =3D {
> +    .name =3D "allwinner-wdt",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_PTIMER(timer, AwWdtState),
> +        VMSTATE_UINT32_ARRAY(regs, AwWdtState, AW_WDT_REGS_NUM),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void allwinner_wdt_init(Object *obj)
> +{
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> +    AwWdtState *s =3D AW_WDT(obj);
> +    const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);
> +
> +    /* Memory mapping */
> +    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_wdt_ops, s,
> +                          TYPE_AW_WDT, c->regmap_size * 4);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static void allwinner_wdt_realize(DeviceState *dev, Error **errp)
> +{
> +    AwWdtState *s =3D AW_WDT(dev);
> +
> +    s->timer =3D ptimer_init(allwinner_wdt_expired, s,
> +                           PTIMER_POLICY_NO_IMMEDIATE_TRIGGER |
> +                           PTIMER_POLICY_NO_IMMEDIATE_RELOAD |
> +                           PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
> +
> +    ptimer_transaction_begin(s->timer);
> +    /* Set to 2Hz (0.5s period); other periods are multiples of 0.5s. */
> +    ptimer_set_freq(s->timer, 2);
> +    ptimer_set_limit(s->timer, 0xff, 1);
> +    ptimer_transaction_commit(s->timer);
> +}
> +
> +static void allwinner_wdt_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> +
> +    rc->phases.enter =3D allwinner_wdt_reset_enter;
> +    dc->realize =3D allwinner_wdt_realize;
> +    dc->vmsd =3D &allwinner_wdt_vmstate;
> +}
> +
> +static void allwinner_wdt_sun4i_class_init(ObjectClass *klass, void *dat=
a)
> +{
> +    AwWdtClass *awc =3D AW_WDT_CLASS(klass);
> +
> +    awc->regmap =3D allwinner_wdt_sun4i_regmap;
> +    awc->regmap_size =3D sizeof(allwinner_wdt_sun4i_regmap);
> +    awc->read =3D allwinner_wdt_sun4i_read;
> +    awc->write =3D allwinner_wdt_sun4i_write;
> +    awc->can_reset_system =3D allwinner_wdt_sun4i_can_reset_system;
> +    awc->is_key_valid =3D allwinner_wdt_sun4i_is_key_valid;
> +    awc->get_intv_value =3D allwinner_wdt_sun4i_get_intv_value;
> +}
> +
> +static void allwinner_wdt_sun6i_class_init(ObjectClass *klass, void *dat=
a)
> +{
> +    AwWdtClass *awc =3D AW_WDT_CLASS(klass);
> +
> +    awc->regmap =3D allwinner_wdt_sun6i_regmap;
> +    awc->regmap_size =3D sizeof(allwinner_wdt_sun6i_regmap);
> +    awc->read =3D allwinner_wdt_sun6i_read;
> +    awc->write =3D allwinner_wdt_sun6i_write;
> +    awc->can_reset_system =3D allwinner_wdt_sun6i_can_reset_system;
> +    awc->is_key_valid =3D allwinner_wdt_sun6i_is_key_valid;
> +    awc->get_intv_value =3D allwinner_wdt_sun6i_get_intv_value;
> +}
> +
> +static const TypeInfo allwinner_wdt_info =3D {
> +    .name          =3D TYPE_AW_WDT,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_init =3D allwinner_wdt_init,
> +    .instance_size =3D sizeof(AwWdtState),
> +    .class_init    =3D allwinner_wdt_class_init,
> +    .class_size    =3D sizeof(AwWdtClass),
> +    .abstract      =3D true,
> +};
> +
> +static const TypeInfo allwinner_wdt_sun4i_info =3D {
> +    .name          =3D TYPE_AW_WDT_SUN4I,
> +    .parent        =3D TYPE_AW_WDT,
> +    .class_init    =3D allwinner_wdt_sun4i_class_init,
> +};
> +
> +static const TypeInfo allwinner_wdt_sun6i_info =3D {
> +    .name          =3D TYPE_AW_WDT_SUN6I,
> +    .parent        =3D TYPE_AW_WDT,
> +    .class_init    =3D allwinner_wdt_sun6i_class_init,
> +};
> +
> +static void allwinner_wdt_register(void)
> +{
> +    type_register_static(&allwinner_wdt_info);
> +    type_register_static(&allwinner_wdt_sun4i_info);
> +    type_register_static(&allwinner_wdt_sun6i_info);
> +}
> +
> +type_init(allwinner_wdt_register)
> diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
> index 8974b5cf4c..5dcd4fbe2f 100644
> --- a/hw/watchdog/meson.build
> +++ b/hw/watchdog/meson.build
> @@ -1,4 +1,5 @@
>  softmmu_ss.add(files('watchdog.c'))
> +softmmu_ss.add(when: 'CONFIG_ALLWINNER_WDT', if_true:
> files('allwinner-wdt.c'))
>  softmmu_ss.add(when: 'CONFIG_CMSDK_APB_WATCHDOG', if_true:
> files('cmsdk-apb-watchdog.c'))
>  softmmu_ss.add(when: 'CONFIG_WDT_IB6300ESB', if_true:
> files('wdt_i6300esb.c'))
>  softmmu_ss.add(when: 'CONFIG_WDT_IB700', if_true: files('wdt_ib700.c'))
> diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
> index 54371ae075..2739570652 100644
> --- a/hw/watchdog/trace-events
> +++ b/hw/watchdog/trace-events
> @@ -1,5 +1,12 @@
>  # See docs/devel/tracing.rst for syntax documentation.
>
> +# allwinner-wdt.c
> +allwinner_wdt_read(uint64_t offset, uint64_t data, unsigned size)
> "Allwinner watchdog read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u=
"
> +allwinner_wdt_write(uint64_t offset, uint64_t data, unsigned size)
> "Allwinner watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %=
u"
> +allwinner_wdt_reset_enter(void) "Allwinner watchdog: reset"
> +allwinner_wdt_update_timer(uint8_t count) "Allwinner watchdog: count %"
> PRIu8
> +allwinner_wdt_expired(bool enabled, bool reset_enabled) "Allwinner
> watchdog: enabled %u reset_enabled %u"
> +
>  # cmsdk-apb-watchdog.c
>  cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data, unsigned size)
> "CMSDK APB watchdog read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u=
"
>  cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, unsigned size)
> "CMSDK APB watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %=
u"
> diff --git a/include/hw/watchdog/allwinner-wdt.h
> b/include/hw/watchdog/allwinner-wdt.h
> new file mode 100644
> index 0000000000..7fe41e20f2
> --- /dev/null
> +++ b/include/hw/watchdog/allwinner-wdt.h
> @@ -0,0 +1,123 @@
> +/*
> + * Allwinner Watchdog emulation
> + *
> + * Copyright (C) 2023 Strahinja Jankovic <strahinja.p.jankovic@gmail.com=
>
> + *
> + *  This file is derived from Allwinner RTC,
> + *  by Niek Linnenbank.
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_WATCHDOG_ALLWINNER_WDT_H
> +#define HW_WATCHDOG_ALLWINNER_WDT_H
> +
> +#include "qom/object.h"
> +#include "hw/ptimer.h"
> +#include "hw/sysbus.h"
> +
> +/*
> + * This is a model of the Allwinner watchdog.
> + * Since watchdog registers belong to the timer module (and are shared
> with the
> + * RTC module), the interrupt line from watchdog is not handled right no=
w.
> + * In QEMU, we just wire up the watchdog reset to
> watchdog_perform_action(),
> + * at least for the moment.
> + */
> +
> +#define TYPE_AW_WDT    "allwinner-wdt"
> +
> +/** Allwinner WDT sun4i family (A10, A12), also sun7i (A20) */
> +#define TYPE_AW_WDT_SUN4I    TYPE_AW_WDT "-sun4i"
> +
> +/** Allwinner WDT sun6i family and newer (A31, H2+, H3, etc) */
> +#define TYPE_AW_WDT_SUN6I    TYPE_AW_WDT "-sun6i"
> +
> +/** Number of WDT registers */
> +#define AW_WDT_REGS_NUM      (5)
> +
> +OBJECT_DECLARE_TYPE(AwWdtState, AwWdtClass, AW_WDT)
> +
> +/**
> + * Allwinner WDT object instance state.
> + */
> +struct AwWdtState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +    struct ptimer_state *timer;
> +
> +    uint32_t regs[AW_WDT_REGS_NUM];
> +};
> +
> +/**
> + * Allwinner WDT class-level struct.
> + *
> + * This struct is filled by each sunxi device specific code
> + * such that the generic code can use this struct to support
> + * all devices.
> + */
> +struct AwWdtClass {
> +    /*< private >*/
> +    SysBusDeviceClass parent_class;
> +    /*< public >*/
> +
> +    /** Defines device specific register map */
> +    const uint8_t *regmap;
> +
> +    /** Size of the regmap in bytes */
> +    size_t regmap_size;
> +
> +    /**
> +     * Read device specific register
> +     *
> +     * @offset: register offset to read
> +     * @return true if register read successful, false otherwise
> +     */
> +    bool (*read)(AwWdtState *s, uint32_t offset);
> +
> +    /**
> +     * Write device specific register
> +     *
> +     * @offset: register offset to write
> +     * @data: value to set in register
> +     * @return true if register write successful, false otherwise
> +     */
> +    bool (*write)(AwWdtState *s, uint32_t offset, uint32_t data);
> +
> +    /**
> +     * Check if watchdog can generate system reset
> +     *
> +     * @return true if watchdog can generate system reset
> +     */
> +    bool (*can_reset_system)(AwWdtState *s);
> +
> +    /**
> +     * Check if provided key is valid
> +     *
> +     * @value: value written to register
> +     * @return true if key is valid, false otherwise
> +     */
> +    bool (*is_key_valid)(AwWdtState *s, uint32_t val);
> +
> +    /**
> +     * Get current INTV_VALUE setting
> +     *
> +     * @return current INTV_VALUE (0-15)
> +     */
> +    uint8_t (*get_intv_value)(AwWdtState *s);
> +};
> +
> +#endif /* HW_WATCHDOG_ALLWINNER_WDT_H */
> --
> 2.30.2
>
>
I've verified with U-boot manually that the watchdog also is able to reset
the core on the H3:

...
=3D> mw.l 0x01c20cb4 0x1 1
allwinner_wdt_write Allwinner watchdog write: offset 0x14 data 0x1 size 4
=3D> mw.l 0x01c20cb8 0x1 1
allwinner_wdt_write Allwinner watchdog write: offset 0x18 data 0x1 size 4
allwinner_wdt_update_timer Allwinner watchdog: count 0
=3D> allwinner_wdt_expired Allwinner watchdog: enabled 1 reset_enabled 1
allwinner_wdt_reset_enter Allwinner watchdog: reset

U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)
DRAM: 1024 MiB
...

So looks good to me!

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Regards,
Niek

--=20
Niek Linnenbank

--00000000000019a3d005f7d24b99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Strahinja,</div><div><br></div><div><br></div><div=
 dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Mar 17, 2023 at 1:13=E2=80=AFAM Strahinja Jankovic=
 &lt;<a href=3D"mailto:strahinjapjankovic@gmail.com">strahinjapjankovic@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">This patch adds basic support for Allwinner WDT.<br>
Both sun4i and sun6i variants are supported.<br>
However, interrupt generation is not supported, so WDT can be used only to =
trigger system reset.<br>
<br>
Signed-off-by: Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p.jankovi=
c@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&gt;<br>
<br>
---<br>
=C2=A0hw/watchdog/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0hw/watchdog/allwinner-wdt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 416 ++=
++++++++++++++++++++++++++<br>
=C2=A0hw/watchdog/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
=C2=A0hw/watchdog/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A07 +<br>
=C2=A0include/hw/watchdog/allwinner-wdt.h | 123 ++++++++<br>
=C2=A05 files changed, 551 insertions(+)<br>
=C2=A0create mode 100644 hw/watchdog/allwinner-wdt.c<br>
=C2=A0create mode 100644 include/hw/watchdog/allwinner-wdt.h<br>
<br>
diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig<br>
index 66e1d029e3..861fd00334 100644<br>
--- a/hw/watchdog/Kconfig<br>
+++ b/hw/watchdog/Kconfig<br>
@@ -20,3 +20,7 @@ config WDT_IMX2<br>
<br>
=C2=A0config WDT_SBSA<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
+<br>
+config ALLWINNER_WDT<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 select PTIMER<br>
diff --git a/hw/watchdog/allwinner-wdt.c b/hw/watchdog/allwinner-wdt.c<br>
new file mode 100644<br>
index 0000000000..45a4a36ba7<br>
--- /dev/null<br>
+++ b/hw/watchdog/allwinner-wdt.c<br>
@@ -0,0 +1,416 @@<br>
+/*<br>
+ * Allwinner Watchdog emulation<br>
+ *<br>
+ * Copyright (C) 2023 Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p=
.jankovic@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&g=
t;<br>
+ *<br>
+ *=C2=A0 This file is derived from Allwinner RTC,<br>
+ *=C2=A0 by Niek Linnenbank.<br>
+ *<br>
+ * This program is free software: you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation, either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License<br>
+ * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gn=
u.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/li=
censes/</a>&gt;.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;qemu/units.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;hw/registerfields.h&quot;<br>
+#include &quot;hw/watchdog/allwinner-wdt.h&quot;<br>
+#include &quot;sysemu/watchdog.h&quot;<br>
+#include &quot;migration/vmstate.h&quot;<br>
+<br>
+/* WDT registers */<br>
+enum {<br>
+=C2=A0 =C2=A0 REG_IRQ_EN =3D 0,=C2=A0 =C2=A0 =C2=A0/* Watchdog interrupt e=
nable */<br>
+=C2=A0 =C2=A0 REG_IRQ_STA,=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Watchdog interrup=
t status */<br>
+=C2=A0 =C2=A0 REG_CTRL,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Watchdo=
g control register */<br>
+=C2=A0 =C2=A0 REG_CFG,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Watchdo=
g configuration register */<br>
+=C2=A0 =C2=A0 REG_MODE,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Watchdo=
g mode register */<br>
+};<br>
+<br>
+/* Universal WDT register flags */<br>
+#define WDT_RESTART_MASK=C2=A0 =C2=A0 (1 &lt;&lt; 0)<br>
+#define WDT_EN_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
+<br>
+/* sun4i specific WDT register flags */<br>
+#define RST_EN_SUN4I_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 1)<br>
+#define INTV_VALUE_SUN4I_SHIFT=C2=A0 (3)<br>
+#define INTV_VALUE_SUN4I_MASK=C2=A0 =C2=A0(0xfu &lt;&lt; INTV_VALUE_SUN4I_=
SHIFT)<br>
+<br>
+/* sun6i specific WDT register flags */<br>
+#define RST_EN_SUN6I_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
+#define KEY_FIELD_SUN6I_SHIFT=C2=A0 =C2=A0(1)<br>
+#define KEY_FIELD_SUN6I_MASK=C2=A0 =C2=A0 (0xfffu &lt;&lt; KEY_FIELD_SUN6I=
_SHIFT)<br>
+#define KEY_FIELD_SUN6I=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0xA57u)<br>
+#define INTV_VALUE_SUN6I_SHIFT=C2=A0 (4)<br>
+#define INTV_VALUE_SUN6I_MASK=C2=A0 =C2=A0(0xfu &lt;&lt; INTV_VALUE_SUN6I_=
SHIFT)<br>
+<br>
+/* Map of INTV_VALUE to 0.5s units. */<br>
+static const uint8_t allwinner_wdt_count_map[] =3D {<br>
+=C2=A0 =C2=A0 1,<br>
+=C2=A0 =C2=A0 2,<br>
+=C2=A0 =C2=A0 4,<br>
+=C2=A0 =C2=A0 6,<br>
+=C2=A0 =C2=A0 8,<br>
+=C2=A0 =C2=A0 10,<br>
+=C2=A0 =C2=A0 12,<br>
+=C2=A0 =C2=A0 16,<br>
+=C2=A0 =C2=A0 20,<br>
+=C2=A0 =C2=A0 24,<br>
+=C2=A0 =C2=A0 28,<br>
+=C2=A0 =C2=A0 32<br>
+};<br>
+<br>
+/* WDT sun4i register map (offset to name) */<br>
+const uint8_t allwinner_wdt_sun4i_regmap[] =3D {<br>
+=C2=A0 =C2=A0 [0x0000] =3D REG_CTRL,<br>
+=C2=A0 =C2=A0 [0x0004] =3D REG_MODE,<br>
+};<br>
+<br>
+/* WDT sun6i register map (offset to name) */<br>
+const uint8_t allwinner_wdt_sun6i_regmap[] =3D {<br>
+=C2=A0 =C2=A0 [0x0000] =3D REG_IRQ_EN,<br>
+=C2=A0 =C2=A0 [0x0004] =3D REG_IRQ_STA,<br>
+=C2=A0 =C2=A0 [0x0010] =3D REG_CTRL,<br>
+=C2=A0 =C2=A0 [0x0014] =3D REG_CFG,<br>
+=C2=A0 =C2=A0 [0x0018] =3D REG_MODE,<br>
+};<br>
+<br>
+static bool allwinner_wdt_sun4i_read(AwWdtState *s, uint32_t offset)<br>
+{<br>
+=C2=A0 =C2=A0 /* no sun4i specific registers currently implemented */<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+static bool allwinner_wdt_sun4i_write(AwWdtState *s, uint32_t offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t data)<=
br>
+{<br>
+=C2=A0 =C2=A0 /* no sun4i specific registers currently implemented */<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+static bool allwinner_wdt_sun4i_can_reset_system(AwWdtState *s)<br>
+{<br>
+=C2=A0 =C2=A0 if (s-&gt;regs[REG_MODE] &amp; RST_EN_SUN6I_MASK) {<br></blo=
ckquote><div><br></div><div>Should this function use the RST_EN_SUN4I_MASK =
instead?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static bool allwinner_wdt_sun4i_is_key_valid(AwWdtState *s, uint32_t val)<=
br>
+{<br>
+=C2=A0 =C2=A0 /* sun4i has no key */<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+static uint8_t allwinner_wdt_sun4i_get_intv_value(AwWdtState *s)<br>
+{<br>
+=C2=A0 =C2=A0 return ((s-&gt;regs[REG_MODE] &amp; INTV_VALUE_SUN4I_MASK) &=
gt;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INTV_VALUE_SUN4I_SHIFT);<br>
+}<br>
+<br>
+static bool allwinner_wdt_sun6i_read(AwWdtState *s, uint32_t offset)<br>
+{<br>
+=C2=A0 =C2=A0 const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);<br>
+<br>
+=C2=A0 =C2=A0 switch (c-&gt;regmap[offset]) {<br>
+=C2=A0 =C2=A0 case REG_IRQ_EN:<br>
+=C2=A0 =C2=A0 case REG_IRQ_STA:<br>
+=C2=A0 =C2=A0 case REG_CFG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+static bool allwinner_wdt_sun6i_write(AwWdtState *s, uint32_t offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t data)<=
br>
+{<br>
+=C2=A0 =C2=A0 const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);<br>
+<br>
+=C2=A0 =C2=A0 switch (c-&gt;regmap[offset]) {<br>
+=C2=A0 =C2=A0 case REG_IRQ_EN:<br>
+=C2=A0 =C2=A0 case REG_IRQ_STA:<br>
+=C2=A0 =C2=A0 case REG_CFG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+static bool allwinner_wdt_sun6i_can_reset_system(AwWdtState *s)<br>
+{<br>
+=C2=A0 =C2=A0 if (s-&gt;regs[REG_CFG] &amp; RST_EN_SUN6I_MASK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static bool allwinner_wdt_sun6i_is_key_valid(AwWdtState *s, uint32_t val)<=
br>
+{<br>
+=C2=A0 =C2=A0 uint16_t key =3D (val &amp; KEY_FIELD_SUN6I_MASK) &gt;&gt; K=
EY_FIELD_SUN6I_SHIFT;<br>
+=C2=A0 =C2=A0 return (key =3D=3D KEY_FIELD_SUN6I);<br>
+}<br>
+<br>
+static uint8_t allwinner_wdt_sun6i_get_intv_value(AwWdtState *s)<br>
+{<br>
+=C2=A0 =C2=A0 return ((s-&gt;regs[REG_MODE] &amp; INTV_VALUE_SUN6I_MASK) &=
gt;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INTV_VALUE_SUN6I_SHIFT);<br>
+}<br>
+<br>
+static void allwinner_wdt_update_timer(AwWdtState *s)<br>
+{<br>
+=C2=A0 =C2=A0 const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);<br>
+=C2=A0 =C2=A0 uint8_t count =3D c-&gt;get_intv_value(s);<br>
+<br>
+=C2=A0 =C2=A0 ptimer_transaction_begin(s-&gt;timer);<br>
+=C2=A0 =C2=A0 ptimer_stop(s-&gt;timer);<br>
+<br>
+=C2=A0 =C2=A0 /* Use map to convert. */<br>
+=C2=A0 =C2=A0 if (count &lt; sizeof(allwinner_wdt_count_map)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptimer_set_count(s-&gt;timer, allwinner_wdt_co=
unt_map[count]);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: incor=
rect INTV_VALUE 0x%02x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, count);<=
br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ptimer_run(s-&gt;timer, 1);<br>
+=C2=A0 =C2=A0 ptimer_transaction_commit(s-&gt;timer);<br>
+<br>
+=C2=A0 =C2=A0 trace_allwinner_wdt_update_timer(count);<br>
+}<br>
+<br>
+static uint64_t allwinner_wdt_read(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
size)<br>
+{<br>
+=C2=A0 =C2=A0 AwWdtState *s =3D AW_WDT(opaque);<br>
+=C2=A0 =C2=A0 const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);<br>
+=C2=A0 =C2=A0 uint64_t r;<br>
+<br>
+=C2=A0 =C2=A0 if (offset &gt;=3D c-&gt;regmap_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: out-o=
f-bounds offset 0x%04x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, (uint32_t)offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 switch (c-&gt;regmap[offset]) {<br>
+=C2=A0 =C2=A0 case REG_CTRL:<br>
+=C2=A0 =C2=A0 case REG_MODE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D s-&gt;regs[c-&gt;regmap[offset]];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!c-&gt;read(s, offset)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%=
s: unimplemented register 0x%04x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 __func__, (uint32_t)offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D s-&gt;regs[c-&gt;regmap[offset]];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 trace_allwinner_wdt_read(offset, r, size);<br>
+<br>
+=C2=A0 =C2=A0 return r;<br>
+}<br>
+<br>
+static void allwinner_wdt_write(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t val, unsigned =
size)<br>
+{<br>
+=C2=A0 =C2=A0 AwWdtState *s =3D AW_WDT(opaque);<br>
+=C2=A0 =C2=A0 const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);<br>
+=C2=A0 =C2=A0 uint32_t old_val;<br>
+<br>
+=C2=A0 =C2=A0 if (offset &gt;=3D c-&gt;regmap_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: out-o=
f-bounds offset 0x%04x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, (uint32_t)offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0trace_allwinner_wdt_write(offset, val, size);<br>
+<br>
+=C2=A0 =C2=A0 switch (c-&gt;regmap[offset]) {<br>
+=C2=A0 =C2=A0 case REG_CTRL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (c-&gt;is_key_valid(s, val)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val &amp; WDT_RESTART_MASK) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Kick timer */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_wdt_upda=
te_timer(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case REG_MODE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 old_val =3D s-&gt;regs[REG_MODE];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[REG_MODE] =3D (uint32_t)val;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check for rising edge on WDOG_MODE_EN */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((s-&gt;regs[REG_MODE] &amp; ~old_val) &amp=
; WDT_EN_MASK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_wdt_update_timer(s);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!c-&gt;write(s, offset, val)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%=
s: unimplemented register 0x%04x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 __func__, (uint32_t)offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[c-&gt;regmap[offset]] =3D (uint32_t=
)val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static const MemoryRegionOps allwinner_wdt_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D allwinner_wdt_read,<br>
+=C2=A0 =C2=A0 .write =3D allwinner_wdt_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 .impl.min_access_size =3D 4,<br>
+};<br>
+<br>
+static void allwinner_wdt_expired(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 AwWdtState *s =3D AW_WDT(opaque);<br>
+=C2=A0 =C2=A0 const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);<br>
+<br>
+=C2=A0 =C2=A0 bool enabled =3D s-&gt;regs[REG_MODE] &amp; WDT_EN_MASK;<br>
+=C2=A0 =C2=A0 bool reset_enabled =3D c-&gt;can_reset_system(s);<br>
+<br>
+=C2=A0 =C2=A0 trace_allwinner_wdt_expired(enabled, reset_enabled);<br>
+<br>
+=C2=A0 =C2=A0 /* Perform watchdog action if watchdog is enabled and can tr=
igger reset */<br>
+=C2=A0 =C2=A0 if (enabled &amp;&amp; reset_enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 watchdog_perform_action();<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void allwinner_wdt_reset_enter(Object *obj, ResetType type)<br>
+{<br>
+=C2=A0 =C2=A0 AwWdtState *s =3D AW_WDT(obj);<br>
+<br>
+=C2=A0 =C2=A0 trace_allwinner_wdt_reset_enter();<br>
+<br>
+=C2=A0 =C2=A0 /* Clear registers */<br>
+=C2=A0 =C2=A0 memset(s-&gt;regs, 0, sizeof(s-&gt;regs));<br>
+}<br>
+<br>
+static const VMStateDescription allwinner_wdt_vmstate =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;allwinner-wdt&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_PTIMER(timer, AwWdtState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32_ARRAY(regs, AwWdtState, AW_WDT_=
REGS_NUM),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void allwinner_wdt_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);<br>
+=C2=A0 =C2=A0 AwWdtState *s =3D AW_WDT(obj);<br>
+=C2=A0 =C2=A0 const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);<br>
+<br>
+=C2=A0 =C2=A0 /* Memory mapping */<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iomem, OBJECT(s), &amp;allw=
inner_wdt_ops, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_AW_WDT, c-&gt;regmap_size * 4);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
+}<br>
+<br>
+static void allwinner_wdt_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 AwWdtState *s =3D AW_WDT(dev);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;timer =3D ptimer_init(allwinner_wdt_expired, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0PTIMER_POLICY_NO_IMMEDIATE_TRIGGER |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0PTIMER_POLICY_NO_IMMEDIATE_RELOAD |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);<br>
+<br>
+=C2=A0 =C2=A0 ptimer_transaction_begin(s-&gt;timer);<br>
+=C2=A0 =C2=A0 /* Set to 2Hz (0.5s period); other periods are multiples of =
0.5s. */<br>
+=C2=A0 =C2=A0 ptimer_set_freq(s-&gt;timer, 2);<br>
+=C2=A0 =C2=A0 ptimer_set_limit(s-&gt;timer, 0xff, 1);<br>
+=C2=A0 =C2=A0 ptimer_transaction_commit(s-&gt;timer);<br>
+}<br>
+<br>
+static void allwinner_wdt_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+=C2=A0 =C2=A0 ResettableClass *rc =3D RESETTABLE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 rc-&gt;phases.enter =3D allwinner_wdt_reset_enter;<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D allwinner_wdt_realize;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;allwinner_wdt_vmstate;<br>
+}<br>
+<br>
+static void allwinner_wdt_sun4i_class_init(ObjectClass *klass, void *data)=
<br>
+{<br>
+=C2=A0 =C2=A0 AwWdtClass *awc =3D AW_WDT_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 awc-&gt;regmap =3D allwinner_wdt_sun4i_regmap;<br>
+=C2=A0 =C2=A0 awc-&gt;regmap_size =3D sizeof(allwinner_wdt_sun4i_regmap);<=
br>
+=C2=A0 =C2=A0 awc-&gt;read =3D allwinner_wdt_sun4i_read;<br>
+=C2=A0 =C2=A0 awc-&gt;write =3D allwinner_wdt_sun4i_write;<br>
+=C2=A0 =C2=A0 awc-&gt;can_reset_system =3D allwinner_wdt_sun4i_can_reset_s=
ystem;<br>
+=C2=A0 =C2=A0 awc-&gt;is_key_valid =3D allwinner_wdt_sun4i_is_key_valid;<b=
r>
+=C2=A0 =C2=A0 awc-&gt;get_intv_value =3D allwinner_wdt_sun4i_get_intv_valu=
e;<br>
+}<br>
+<br>
+static void allwinner_wdt_sun6i_class_init(ObjectClass *klass, void *data)=
<br>
+{<br>
+=C2=A0 =C2=A0 AwWdtClass *awc =3D AW_WDT_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 awc-&gt;regmap =3D allwinner_wdt_sun6i_regmap;<br>
+=C2=A0 =C2=A0 awc-&gt;regmap_size =3D sizeof(allwinner_wdt_sun6i_regmap);<=
br>
+=C2=A0 =C2=A0 awc-&gt;read =3D allwinner_wdt_sun6i_read;<br>
+=C2=A0 =C2=A0 awc-&gt;write =3D allwinner_wdt_sun6i_write;<br>
+=C2=A0 =C2=A0 awc-&gt;can_reset_system =3D allwinner_wdt_sun6i_can_reset_s=
ystem;<br>
+=C2=A0 =C2=A0 awc-&gt;is_key_valid =3D allwinner_wdt_sun6i_is_key_valid;<b=
r>
+=C2=A0 =C2=A0 awc-&gt;get_intv_value =3D allwinner_wdt_sun6i_get_intv_valu=
e;<br>
+}<br>
+<br>
+static const TypeInfo allwinner_wdt_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_WDT,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_init =3D allwinner_wdt_init,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(AwWdtState),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D allwinner_wdt_class_init,<br>
+=C2=A0 =C2=A0 .class_size=C2=A0 =C2=A0 =3D sizeof(AwWdtClass),<br>
+=C2=A0 =C2=A0 .abstract=C2=A0 =C2=A0 =C2=A0 =3D true,<br>
+};<br>
+<br>
+static const TypeInfo allwinner_wdt_sun4i_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_WDT_SUN4=
I,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_WDT,<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D allwinner_wdt_sun4i_class_init,=
<br>
+};<br>
+<br>
+static const TypeInfo allwinner_wdt_sun6i_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_WDT_SUN6=
I,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_WDT,<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D allwinner_wdt_sun6i_class_init,=
<br>
+};<br>
+<br>
+static void allwinner_wdt_register(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;allwinner_wdt_info);<br>
+=C2=A0 =C2=A0 type_register_static(&amp;allwinner_wdt_sun4i_info);<br>
+=C2=A0 =C2=A0 type_register_static(&amp;allwinner_wdt_sun6i_info);<br>
+}<br>
+<br>
+type_init(allwinner_wdt_register)<br>
diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build<br>
index 8974b5cf4c..5dcd4fbe2f 100644<br>
--- a/hw/watchdog/meson.build<br>
+++ b/hw/watchdog/meson.build<br>
@@ -1,4 +1,5 @@<br>
=C2=A0softmmu_ss.add(files(&#39;watchdog.c&#39;))<br>
+softmmu_ss.add(when: &#39;CONFIG_ALLWINNER_WDT&#39;, if_true: files(&#39;a=
llwinner-wdt.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_CMSDK_APB_WATCHDOG&#39;, if_true: fi=
les(&#39;cmsdk-apb-watchdog.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_WDT_IB6300ESB&#39;, if_true: files(&=
#39;wdt_i6300esb.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_WDT_IB700&#39;, if_true: files(&#39;=
wdt_ib700.c&#39;))<br>
diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events<br>
index 54371ae075..2739570652 100644<br>
--- a/hw/watchdog/trace-events<br>
+++ b/hw/watchdog/trace-events<br>
@@ -1,5 +1,12 @@<br>
=C2=A0# See docs/devel/tracing.rst for syntax documentation.<br>
<br>
+# allwinner-wdt.c<br>
+allwinner_wdt_read(uint64_t offset, uint64_t data, unsigned size) &quot;Al=
lwinner watchdog read: offset 0x%&quot; PRIx64 &quot; data 0x%&quot; PRIx64=
 &quot; size %u&quot;<br>
+allwinner_wdt_write(uint64_t offset, uint64_t data, unsigned size) &quot;A=
llwinner watchdog write: offset 0x%&quot; PRIx64 &quot; data 0x%&quot; PRIx=
64 &quot; size %u&quot;<br>
+allwinner_wdt_reset_enter(void) &quot;Allwinner watchdog: reset&quot;<br>
+allwinner_wdt_update_timer(uint8_t count) &quot;Allwinner watchdog: count =
%&quot; PRIu8<br>
+allwinner_wdt_expired(bool enabled, bool reset_enabled) &quot;Allwinner wa=
tchdog: enabled %u reset_enabled %u&quot;<br>
+<br>
=C2=A0# cmsdk-apb-watchdog.c<br>
=C2=A0cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data, unsigned size=
) &quot;CMSDK APB watchdog read: offset 0x%&quot; PRIx64 &quot; data 0x%&qu=
ot; PRIx64 &quot; size %u&quot;<br>
=C2=A0cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, unsigned siz=
e) &quot;CMSDK APB watchdog write: offset 0x%&quot; PRIx64 &quot; data 0x%&=
quot; PRIx64 &quot; size %u&quot;<br>
diff --git a/include/hw/watchdog/allwinner-wdt.h b/include/hw/watchdog/allw=
inner-wdt.h<br>
new file mode 100644<br>
index 0000000000..7fe41e20f2<br>
--- /dev/null<br>
+++ b/include/hw/watchdog/allwinner-wdt.h<br>
@@ -0,0 +1,123 @@<br>
+/*<br>
+ * Allwinner Watchdog emulation<br>
+ *<br>
+ * Copyright (C) 2023 Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p=
.jankovic@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&g=
t;<br>
+ *<br>
+ *=C2=A0 This file is derived from Allwinner RTC,<br>
+ *=C2=A0 by Niek Linnenbank.<br>
+ *<br>
+ * This program is free software: you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation, either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License<br>
+ * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gn=
u.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/li=
censes/</a>&gt;.<br>
+ */<br>
+<br>
+#ifndef HW_WATCHDOG_ALLWINNER_WDT_H<br>
+#define HW_WATCHDOG_ALLWINNER_WDT_H<br>
+<br>
+#include &quot;qom/object.h&quot;<br>
+#include &quot;hw/ptimer.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+<br>
+/*<br>
+ * This is a model of the Allwinner watchdog.<br>
+ * Since watchdog registers belong to the timer module (and are shared wit=
h the<br>
+ * RTC module), the interrupt line from watchdog is not handled right now.=
<br>
+ * In QEMU, we just wire up the watchdog reset to watchdog_perform_action(=
),<br>
+ * at least for the moment.<br>
+ */<br>
+<br>
+#define TYPE_AW_WDT=C2=A0 =C2=A0 &quot;allwinner-wdt&quot;<br>
+<br>
+/** Allwinner WDT sun4i family (A10, A12), also sun7i (A20) */<br>
+#define TYPE_AW_WDT_SUN4I=C2=A0 =C2=A0 TYPE_AW_WDT &quot;-sun4i&quot;<br>
+<br>
+/** Allwinner WDT sun6i family and newer (A31, H2+, H3, etc) */<br>
+#define TYPE_AW_WDT_SUN6I=C2=A0 =C2=A0 TYPE_AW_WDT &quot;-sun6i&quot;<br>
+<br>
+/** Number of WDT registers */<br>
+#define AW_WDT_REGS_NUM=C2=A0 =C2=A0 =C2=A0 (5)<br>
+<br>
+OBJECT_DECLARE_TYPE(AwWdtState, AwWdtClass, AW_WDT)<br>
+<br>
+/**<br>
+ * Allwinner WDT object instance state.<br>
+ */<br>
+struct AwWdtState {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+=C2=A0 =C2=A0 MemoryRegion iomem;<br>
+=C2=A0 =C2=A0 struct ptimer_state *timer;<br>
+<br>
+=C2=A0 =C2=A0 uint32_t regs[AW_WDT_REGS_NUM];<br>
+};<br>
+<br>
+/**<br>
+ * Allwinner WDT class-level struct.<br>
+ *<br>
+ * This struct is filled by each sunxi device specific code<br>
+ * such that the generic code can use this struct to support<br>
+ * all devices.<br>
+ */<br>
+struct AwWdtClass {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDeviceClass parent_class;<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+<br>
+=C2=A0 =C2=A0 /** Defines device specific register map */<br>
+=C2=A0 =C2=A0 const uint8_t *regmap;<br>
+<br>
+=C2=A0 =C2=A0 /** Size of the regmap in bytes */<br>
+=C2=A0 =C2=A0 size_t regmap_size;<br>
+<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* Read device specific register<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* @offset: register offset to read<br>
+=C2=A0 =C2=A0 =C2=A0* @return true if register read successful, false othe=
rwise<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 bool (*read)(AwWdtState *s, uint32_t offset);<br>
+<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* Write device specific register<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* @offset: register offset to write<br>
+=C2=A0 =C2=A0 =C2=A0* @data: value to set in register<br>
+=C2=A0 =C2=A0 =C2=A0* @return true if register write successful, false oth=
erwise<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 bool (*write)(AwWdtState *s, uint32_t offset, uint32_t data)=
;<br>
+<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* Check if watchdog can generate system reset<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* @return true if watchdog can generate system reset<b=
r>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 bool (*can_reset_system)(AwWdtState *s);<br>
+<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* Check if provided key is valid<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* @value: value written to register<br>
+=C2=A0 =C2=A0 =C2=A0* @return true if key is valid, false otherwise<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 bool (*is_key_valid)(AwWdtState *s, uint32_t val);<br>
+<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* Get current INTV_VALUE setting<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* @return current INTV_VALUE (0-15)<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 uint8_t (*get_intv_value)(AwWdtState *s);<br>
+};<br>
+<br>
+#endif /* HW_WATCHDOG_ALLWINNER_WDT_H */<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><div><br></div><div>I&#39;ve verified with U-boot manual=
ly that the watchdog also is able to reset the core on the H3:</div><div><b=
r></div><div>...<br></div><div>=3D&gt; mw.l 0x01c20cb4 0x1 1<br>allwinner_w=
dt_write Allwinner watchdog write: offset 0x14 data 0x1 size 4<br>=3D&gt; m=
w.l 0x01c20cb8 0x1 1<br>allwinner_wdt_write Allwinner watchdog write: offse=
t 0x18 data 0x1 size 4<br>allwinner_wdt_update_timer Allwinner watchdog: co=
unt 0<br>=3D&gt; allwinner_wdt_expired Allwinner watchdog: enabled 1 reset_=
enabled 1<br>allwinner_wdt_reset_enter Allwinner watchdog: reset<br><br>U-B=
oot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)<br>DRAM: 1024 MiB</d=
iv><div>...</div><div><br></div><div>So looks good to me!</div><div><br></d=
iv><div>Reviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@g=
mail.com">nieklinnenbank@gmail.com</a>&gt;</div><div>Tested-by: Niek Linnen=
bank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">nieklinnenbank@gmail.c=
om</a>&gt;<br></div><div><br></div><div>Regards,</div><div>Niek<br></div><b=
r><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" cla=
ss=3D"gmail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div><=
/div></div></div>

--00000000000019a3d005f7d24b99--


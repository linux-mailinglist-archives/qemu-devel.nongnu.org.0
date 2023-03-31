Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4546D2201
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:01:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piFJ6-0001rz-BQ; Fri, 31 Mar 2023 10:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1piFIV-0001iZ-6k; Fri, 31 Mar 2023 10:00:07 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1piFIR-0007PO-6x; Fri, 31 Mar 2023 10:00:06 -0400
Received: by mail-yb1-xb34.google.com with SMTP id z83so27490081ybb.2;
 Fri, 31 Mar 2023 07:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680271201; x=1682863201;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A35LsKk33rCg2gBbdVQbvofYqSEYLzvxYH/mCZEhK2A=;
 b=CL5sHiQabdwgqr8KaQVE6Y4M4paCdSzHgwbm30VTJPoyYUn7RLWne2GZfGtlA8LPFz
 4ckBrlSzPBJ9yzIgd2P9m54RKJXjiky6bBM2TRc3hkPyJFUyA3Efnbbzr0faYHXBNhka
 /lYog96utWIBkzlToZf0EuFJOumgbMxI+JKjIyGsSZ1Td4YC1Qih+4MMolpPQXvuiT55
 87Vk97p+32Dl+s1fBY3dQbyD868S5UU415CdeXKa2STZVRNmawmUomoCHlpOT5o5SkVL
 XBA8SC8/epwf6nkV0T7CfTHi2bca2m4dor/X0QNPqvw2xXlAjfOvSL0odI0JdpGVe0N/
 bvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680271201; x=1682863201;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A35LsKk33rCg2gBbdVQbvofYqSEYLzvxYH/mCZEhK2A=;
 b=mUs1mK5s6Ac3YsKdmddnZwYkbtgtTWwd45ALEkZHi6b0sI8tT2WvJR+gVqknqBfpjC
 Cy+eN+9xLPeTLj5ylJdezkQI0V0Bnywl3GG/Ln3U3+b4JbemHkDgCktvuoG1G4EuAtMm
 JphpzN0KMeoyD1eAPRxHgB26xZxl0qWceOqIaVV6ub1v7sL7BJmIInj1cT2iQWOEZrwV
 FjhAzADhDUJY8i1qgAk1j+0FmtQkxbWzb2Rg50zQ3GNdTibc7QsAV7qRPJi9aQj3ZZ37
 TcaA4TZrQovydqivDw9ZH+2TP6j1trojv3z+81VGA4fDAocZCEJcyR3xnE9qC3Y8JZ2W
 0AgA==
X-Gm-Message-State: AAQBX9fDqXnRsZko+Oz5YUo3tqMaymCQ8H8lg6fyxvW1t6aj6h9jFUYJ
 3wXtqyLCbZhOKGS5rd9jbg==
X-Google-Smtp-Source: AKy350YvK8o0SPxZybg5j0kIWpM4n904biW4efGQC3lxcVY/7aOe3WfqKFtn4kO8P2n9DEkz4yY5wg==
X-Received: by 2002:a25:1502:0:b0:a6f:7ac8:e746 with SMTP id
 2-20020a251502000000b00a6f7ac8e746mr20540770ybv.45.1680271201285; 
 Fri, 31 Mar 2023 07:00:01 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.84])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a25cb15000000b00b7767ca746fsm587857ybg.12.2023.03.31.07.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 07:00:00 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:4b5:7e28:63da:3be])
 by serve.minyard.net (Postfix) with ESMTPSA id 0F0711800BB;
 Fri, 31 Mar 2023 14:00:00 +0000 (UTC)
Date: Fri, 31 Mar 2023 08:59:58 -0500
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 6/7] hw/sensor: add ADM1266 device model
Message-ID: <ZCbnXrYJ32NC4RnC@minyard.net>
References: <20230331000756.1712787-1-titusr@google.com>
 <20230331000756.1712787-7-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331000756.1712787-7-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=tcminyard@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 31, 2023 at 12:07:55AM +0000, Titus Rwantare wrote:
>   The ADM1266 is a cascadable super sequencer with margin control and
>   fault recording.

This sounds like serious marketing-speak :).  I looked up the chip and
yes, that's what they say about it.

>   This commit adds basic support for its PMBus commands and models
>   the identification registers that can be modified in a firmware
>   update.
> 
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>

Looks good. 

Acked-by: Corey Minyard <cminyard@mvista.com>

> ---
>  hw/arm/Kconfig        |   1 +
>  hw/sensor/Kconfig     |   5 +
>  hw/sensor/adm1266.c   | 255 ++++++++++++++++++++++++++++++++++++++++++
>  hw/sensor/meson.build |   1 +
>  4 files changed, 262 insertions(+)
>  create mode 100644 hw/sensor/adm1266.c
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index b5aed4aff5..4e44a7451d 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -407,6 +407,7 @@ config XLNX_VERSAL
>  config NPCM7XX
>      bool
>      select A9MPCORE
> +    select ADM1266
>      select ADM1272
>      select ARM_GIC
>      select SMBUS
> diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
> index e03bd09b50..bc6331b4ab 100644
> --- a/hw/sensor/Kconfig
> +++ b/hw/sensor/Kconfig
> @@ -22,6 +22,11 @@ config ADM1272
>      bool
>      depends on I2C
>  
> +config ADM1266
> +    bool
> +    depends on PMBUS
> +    default y if PMBUS
> +
>  config MAX34451
>      bool
>      depends on I2C
> diff --git a/hw/sensor/adm1266.c b/hw/sensor/adm1266.c
> new file mode 100644
> index 0000000000..0745b12b1d
> --- /dev/null
> +++ b/hw/sensor/adm1266.c
> @@ -0,0 +1,255 @@
> +/*
> + * Analog Devices ADM1266 Cascadable Super Sequencer with Margin Control and
> + * Fault Recording with PMBus
> + *
> + * https://www.analog.com/media/en/technical-documentation/data-sheets/adm1266.pdf
> + *
> + * Copyright 2023 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include <string.h>
> +#include "hw/i2c/pmbus_device.h"
> +#include "hw/irq.h"
> +#include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +
> +#define TYPE_ADM1266 "adm1266"
> +OBJECT_DECLARE_SIMPLE_TYPE(ADM1266State, ADM1266)
> +
> +#define ADM1266_BLACKBOX_CONFIG                 0xD3
> +#define ADM1266_PDIO_CONFIG                     0xD4
> +#define ADM1266_READ_STATE                      0xD9
> +#define ADM1266_READ_BLACKBOX                   0xDE
> +#define ADM1266_SET_RTC                         0xDF
> +#define ADM1266_GPIO_SYNC_CONFIGURATION         0xE1
> +#define ADM1266_BLACKBOX_INFORMATION            0xE6
> +#define ADM1266_PDIO_STATUS                     0xE9
> +#define ADM1266_GPIO_STATUS                     0xEA
> +
> +/* Defaults */
> +#define ADM1266_OPERATION_DEFAULT               0x80
> +#define ADM1266_CAPABILITY_DEFAULT              0xA0
> +#define ADM1266_CAPABILITY_NO_PEC               0x20
> +#define ADM1266_PMBUS_REVISION_DEFAULT          0x22
> +#define ADM1266_MFR_ID_DEFAULT                  "ADI"
> +#define ADM1266_MFR_ID_DEFAULT_LEN              32
> +#define ADM1266_MFR_MODEL_DEFAULT               "ADM1266-A1"
> +#define ADM1266_MFR_MODEL_DEFAULT_LEN           32
> +#define ADM1266_MFR_REVISION_DEFAULT            "25"
> +#define ADM1266_MFR_REVISION_DEFAULT_LEN        8
> +
> +#define ADM1266_NUM_PAGES               17
> +/**
> + * PAGE Index
> + * Page 0 VH1.
> + * Page 1 VH2.
> + * Page 2 VH3.
> + * Page 3 VH4.
> + * Page 4 VP1.
> + * Page 5 VP2.
> + * Page 6 VP3.
> + * Page 7 VP4.
> + * Page 8 VP5.
> + * Page 9 VP6.
> + * Page 10 VP7.
> + * Page 11 VP8.
> + * Page 12 VP9.
> + * Page 13 VP10.
> + * Page 14 VP11.
> + * Page 15 VP12.
> + * Page 16 VP13.
> + */
> +typedef struct ADM1266State {
> +    PMBusDevice parent;
> +
> +    char mfr_id[32];
> +    char mfr_model[32];
> +    char mfr_rev[8];
> +} ADM1266State;
> +
> +static const uint8_t adm1266_ic_device_id[] = {0x03, 0x41, 0x12, 0x66};
> +static const uint8_t adm1266_ic_device_rev[] = {0x08, 0x01, 0x08, 0x07, 0x0,
> +                                                0x0, 0x07, 0x41, 0x30};
> +
> +static void adm1266_exit_reset(Object *obj)
> +{
> +    ADM1266State *s = ADM1266(obj);
> +    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
> +
> +    pmdev->page = 0;
> +    pmdev->capability = ADM1266_CAPABILITY_NO_PEC;
> +
> +    for (int i = 0; i < ADM1266_NUM_PAGES; i++) {
> +        pmdev->pages[i].operation = ADM1266_OPERATION_DEFAULT;
> +        pmdev->pages[i].revision = ADM1266_PMBUS_REVISION_DEFAULT;
> +        pmdev->pages[i].vout_mode = 0;
> +        pmdev->pages[i].read_vout = pmbus_data2linear_mode(12, 0);
> +        pmdev->pages[i].vout_margin_high = pmbus_data2linear_mode(15, 0);
> +        pmdev->pages[i].vout_margin_low = pmbus_data2linear_mode(3, 0);
> +        pmdev->pages[i].vout_ov_fault_limit = pmbus_data2linear_mode(16, 0);
> +        pmdev->pages[i].revision = ADM1266_PMBUS_REVISION_DEFAULT;
> +    }
> +
> +    strncpy(s->mfr_id, ADM1266_MFR_ID_DEFAULT, 4);
> +    strncpy(s->mfr_model, ADM1266_MFR_MODEL_DEFAULT, 11);
> +    strncpy(s->mfr_rev, ADM1266_MFR_REVISION_DEFAULT, 3);
> +}
> +
> +static uint8_t adm1266_read_byte(PMBusDevice *pmdev)
> +{
> +    ADM1266State *s = ADM1266(pmdev);
> +
> +    switch (pmdev->code) {
> +    case PMBUS_MFR_ID:                    /* R/W block */
> +        pmbus_send_string(pmdev, s->mfr_id);
> +        break;
> +
> +    case PMBUS_MFR_MODEL:                 /* R/W block */
> +        pmbus_send_string(pmdev, s->mfr_model);
> +        break;
> +
> +    case PMBUS_MFR_REVISION:              /* R/W block */
> +        pmbus_send_string(pmdev, s->mfr_rev);
> +        break;
> +
> +    case PMBUS_IC_DEVICE_ID:
> +        pmbus_send(pmdev, adm1266_ic_device_id, sizeof(adm1266_ic_device_id));
> +        break;
> +
> +    case PMBUS_IC_DEVICE_REV:
> +        pmbus_send(pmdev, adm1266_ic_device_rev, sizeof(adm1266_ic_device_rev));
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: reading from unimplemented register: 0x%02x\n",
> +                      __func__, pmdev->code);
> +        return 0xFF;
> +    }
> +
> +    return 0;
> +}
> +
> +static int adm1266_write_data(PMBusDevice *pmdev, const uint8_t *buf,
> +                              uint8_t len)
> +{
> +    ADM1266State *s = ADM1266(pmdev);
> +
> +    switch (pmdev->code) {
> +    case PMBUS_MFR_ID:                    /* R/W block */
> +        pmbus_receive_block(pmdev, (uint8_t *)s->mfr_id, sizeof(s->mfr_id));
> +        break;
> +
> +    case PMBUS_MFR_MODEL:                 /* R/W block */
> +        pmbus_receive_block(pmdev, (uint8_t *)s->mfr_model,
> +                            sizeof(s->mfr_model));
> +        break;
> +
> +    case PMBUS_MFR_REVISION:               /* R/W block*/
> +        pmbus_receive_block(pmdev, (uint8_t *)s->mfr_rev, sizeof(s->mfr_rev));
> +        break;
> +
> +    case ADM1266_SET_RTC:   /* do nothing */
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: writing to unimplemented register: 0x%02x\n",
> +                      __func__, pmdev->code);
> +        break;
> +    }
> +    return 0;
> +}
> +
> +static void adm1266_get(Object *obj, Visitor *v, const char *name, void *opaque,
> +                        Error **errp)
> +{
> +    uint16_t value;
> +    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
> +    PMBusVoutMode *mode = (PMBusVoutMode *)&pmdev->pages[0].vout_mode;
> +
> +    if (strcmp(name, "vout") == 0) {
> +        value = pmbus_linear_mode2data(*(uint16_t *)opaque, mode->exp);
> +    } else {
> +        value = *(uint16_t *)opaque;
> +    }
> +
> +    visit_type_uint16(v, name, &value, errp);
> +}
> +
> +static void adm1266_set(Object *obj, Visitor *v, const char *name, void *opaque,
> +                        Error **errp)
> +{
> +    uint16_t *internal = opaque;
> +    uint16_t value;
> +    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
> +    PMBusVoutMode *mode = (PMBusVoutMode *)&pmdev->pages[0].vout_mode;
> +
> +    if (!visit_type_uint16(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    *internal = pmbus_data2linear_mode(value, mode->exp);
> +    pmbus_check_limits(pmdev);
> +}
> +
> +static const VMStateDescription vmstate_adm1266 = {
> +    .name = "ADM1266",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]){
> +        VMSTATE_PMBUS_DEVICE(parent, ADM1266State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void adm1266_init(Object *obj)
> +{
> +    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
> +    uint64_t flags = PB_HAS_VOUT_MODE | PB_HAS_VOUT | PB_HAS_VOUT_MARGIN |
> +                     PB_HAS_VOUT_RATING | PB_HAS_STATUS_MFR_SPECIFIC;
> +
> +    for (int i = 0; i < ADM1266_NUM_PAGES; i++) {
> +        pmbus_page_config(pmdev, i, flags);
> +
> +        object_property_add(obj, "vout[*]", "uint16",
> +                            adm1266_get,
> +                            adm1266_set, NULL, &pmdev->pages[i].read_vout);
> +    }
> +}
> +
> +static void adm1266_class_init(ObjectClass *klass, void *data)
> +{
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
> +
> +    dc->desc = "Analog Devices ADM1266 Hot Swap controller";
> +    dc->vmsd = &vmstate_adm1266;
> +    k->write_data = adm1266_write_data;
> +    k->receive_byte = adm1266_read_byte;
> +    k->device_num_pages = 17;
> +
> +    rc->phases.exit = adm1266_exit_reset;
> +}
> +
> +static const TypeInfo adm1266_info = {
> +    .name = TYPE_ADM1266,
> +    .parent = TYPE_PMBUS_DEVICE,
> +    .instance_size = sizeof(ADM1266State),
> +    .instance_init = adm1266_init,
> +    .class_init = adm1266_class_init,
> +};
> +
> +static void adm1266_register_types(void)
> +{
> +    type_register_static(&adm1266_info);
> +}
> +
> +type_init(adm1266_register_types)
> diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
> index 9e9be602c3..4528ee6215 100644
> --- a/hw/sensor/meson.build
> +++ b/hw/sensor/meson.build
> @@ -3,6 +3,7 @@ softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
>  softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
>  softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
>  softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
> +softmmu_ss.add(when: 'CONFIG_ADM1266', if_true: files('adm1266.c'))
>  softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
>  softmmu_ss.add(when: 'CONFIG_LSM303DLHC_MAG', if_true: files('lsm303dlhc_mag.c'))
>  softmmu_ss.add(when: 'CONFIG_ISL_PMBUS_VR', if_true: files('isl_pmbus_vr.c'))
> -- 
> 2.40.0.423.gd6c402a77b-goog
> 


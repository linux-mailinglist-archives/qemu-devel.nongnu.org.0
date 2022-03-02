Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A704C9A17
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 01:51:23 +0100 (CET)
Received: from localhost ([::1]:39924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPDD6-0002BG-QL
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 19:51:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nPD5k-0000BT-RG; Tue, 01 Mar 2022 19:43:47 -0500
Received: from [2607:f8b0:4864:20::f31] (port=34603
 helo=mail-qv1-xf31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nPD5h-0002UZ-Ef; Tue, 01 Mar 2022 19:43:44 -0500
Received: by mail-qv1-xf31.google.com with SMTP id b12so357006qvk.1;
 Tue, 01 Mar 2022 16:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=NHpDkD+KrkN4UZV+gubSWEXtL2W3w88pgz6asZ5J/kQ=;
 b=A/mtdCpqAuFtDEkTrlbLUdFbo5TkLGl0E6Mem2ZXbdUnm64IttrWgfmG8Dx7L9RqgE
 b4EU0vN1q0MRdk/2q/f13MLi3HjIwhsWyguVqmYUs1VkIe+ztu4Vw5qSc2j9Z2AAwhZT
 kS0jCD8ZHrljcPwpqJcZJBmvJTZatc8DcD3bUsXeBo3EMc3TO68aflLUUK9ZqlFSJrUA
 FOdOgmQ9aX+l5gmGJZwo3viUMbHWbtIaVZVzrW5xckAKmRroYbtSIGNnTDDkuOrIu4f9
 2WHJpcBJksT7LOD1CTow/e1fZnp3lY3dA+8hqEznecvrHrVD6b1Taa34otM1MAjgytVN
 DtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=NHpDkD+KrkN4UZV+gubSWEXtL2W3w88pgz6asZ5J/kQ=;
 b=Y/GkqVlp2fva1MY+ifLrNAXi+WEyHQ3cMsCEsW0zODuQEPmt3/voBEZgcB60Yk+ssA
 JAITuLW/c20EKMT5o3/o+SnrLlGstovz/4whcifBvk5ICi+k+Vh2sfixPIPZq3Xb72wi
 Yp5xt50QYIVexEMLcSElhTbbwUfUrwUnBAmhF+NOk9kCbjjrt2P37QVl0nHsBQtnRoza
 YQDWPfnzM3YNvxzHmrnACNL4Cc/Sds8WNo+5a2L1aDFnoQulCl/ir8q0BYQ7z0aHgtAn
 Ey0r5uKSN1u2KOm4p2iMZb5thNzsMEkdILmp3+tnRKUwpZNwFXfdFyfcEPnBn8URHZ9z
 AiXA==
X-Gm-Message-State: AOAM533WmgjsutxAD5EPRfImnFa/xGHfTD6efhQKBgdIPtgWkOYCLl5O
 A8fF66fe7xjgRx5UUsgGxg==
X-Google-Smtp-Source: ABdhPJwBqNNlJgpcScV14rw80ca3iKr+DYNdeZI1Z3fNBAfcc8Bn9QfDVn8W0xpq3l3i560nI5cetA==
X-Received: by 2002:a0c:bec8:0:b0:42c:2e00:78b3 with SMTP id
 f8-20020a0cbec8000000b0042c2e0078b3mr19211131qvj.32.1646181819787; 
 Tue, 01 Mar 2022 16:43:39 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 n8-20020ac85a08000000b002de658d6748sm10568216qta.55.2022.03.01.16.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 16:43:39 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:fd74:8a86:f056:f7b9])
 by serve.minyard.net (Postfix) with ESMTPSA id 730871800D7;
 Wed,  2 Mar 2022 00:43:38 +0000 (UTC)
Date: Tue, 1 Mar 2022 18:43:37 -0600
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Subject: Re: [PATCH v2 9/9] hw/sensor: rename isl_pmbus to isl_pmbus_vr
Message-ID: <20220302004337.GG3457@minyard.net>
References: <20220302002307.1895616-1-titusr@google.com>
 <20220302002307.1895616-10-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220302002307.1895616-10-titusr@google.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=tcminyard@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: wuhaotsh@google.com, venture@google.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 04:23:07PM -0800, Titus Rwantare wrote:
> Signed-off-by: Titus Rwantare <titusr@google.com>

Two things:

* Why do you want to rename this?

* This patch doesn't really add anything, it just renames things in a
  previous patch.  Can it be folded in to the patch that added these
  fields?

-corey

> ---
>  MAINTAINERS                                   |   6 +-
>  hw/arm/Kconfig                                |   2 +-
>  hw/sensor/Kconfig                             |   2 +-
>  hw/sensor/{isl_pmbus.c => isl_pmbus_vr.c}     |  77 ++---
>  hw/sensor/meson.build                         |   2 +-
>  .../hw/sensor/{isl_pmbus.h => isl_pmbus_vr.h} |   4 +-
>  .../{isl_pmbus-test.c => isl_pmbus_vr-test.c} | 263 +++++++++---------
>  tests/qtest/meson.build                       |   2 +-
>  8 files changed, 180 insertions(+), 178 deletions(-)
>  rename hw/sensor/{isl_pmbus.c => isl_pmbus_vr.c} (80%)
>  rename include/hw/sensor/{isl_pmbus.h => isl_pmbus_vr.h} (96%)
>  rename tests/qtest/{isl_pmbus-test.c => isl_pmbus_vr-test.c} (55%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3df8e938e0..364a844045 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3140,13 +3140,13 @@ M: Titus Rwantare <titusr@google.com>
>  S: Maintained
>  F: hw/i2c/pmbus_device.c
>  F: hw/sensor/adm1272.c
> -F: hw/sensor/isl_pmbus.c
> +F: hw/sensor/isl_pmbus_vr.c
>  F: hw/sensor/max34451.c
>  F: include/hw/i2c/pmbus_device.h
> -F: include/hw/sensor/isl_pmbus.h
> +F: include/hw/sensor/isl_pmbus_vr.h
>  F: tests/qtest/adm1272-test.c
>  F: tests/qtest/max34451-test.c
> -F: tests/qtest/isl_pmbus-test.c
> +F: tests/qtest/isl_pmbus_vr-test.c
>  
>  Firmware schema specifications
>  M: Philippe Mathieu-Daudé <f4bug@amsat.org>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 8047ad6378..97f3b38019 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -400,7 +400,7 @@ config NPCM7XX
>      select SMBUS
>      select AT24C  # EEPROM
>      select MAX34451
> -    select ISL_PMBUS
> +    select ISL_PMBUS_VR
>      select PL310  # cache controller
>      select PMBUS
>      select SERIAL
> diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
> index 70fb335789..a834d2f814 100644
> --- a/hw/sensor/Kconfig
> +++ b/hw/sensor/Kconfig
> @@ -31,7 +31,7 @@ config LSM303DLHC_MAG
>      depends on I2C
>      default y if I2C_DEVICES
>  
> -config ISL_PMBUS
> +config ISL_PMBUS_VR
>      bool
>      depends on I2C
>  
> diff --git a/hw/sensor/isl_pmbus.c b/hw/sensor/isl_pmbus_vr.c
> similarity index 80%
> rename from hw/sensor/isl_pmbus.c
> rename to hw/sensor/isl_pmbus_vr.c
> index e3b42b119e..df7c003ea6 100644
> --- a/hw/sensor/isl_pmbus.c
> +++ b/hw/sensor/isl_pmbus_vr.c
> @@ -7,13 +7,13 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "hw/sensor/isl_pmbus.h"
> +#include "hw/sensor/isl_pmbus_vr.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/visitor.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  
> -static uint8_t isl_pmbus_read_byte(PMBusDevice *pmdev)
> +static uint8_t isl_pmbus_vr_read_byte(PMBusDevice *pmdev)
>  {
>      qemu_log_mask(LOG_GUEST_ERROR,
>                    "%s: reading from unsupported register: 0x%02x\n",
> @@ -21,7 +21,7 @@ static uint8_t isl_pmbus_read_byte(PMBusDevice *pmdev)
>      return 0xFF;
>  }
>  
> -static int isl_pmbus_write_data(PMBusDevice *pmdev, const uint8_t *buf,
> +static int isl_pmbus_vr_write_data(PMBusDevice *pmdev, const uint8_t *buf,
>                                uint8_t len)
>  {
>      qemu_log_mask(LOG_GUEST_ERROR,
> @@ -31,13 +31,13 @@ static int isl_pmbus_write_data(PMBusDevice *pmdev, const uint8_t *buf,
>  }
>  
>  /* TODO: Implement coefficients support in pmbus_device.c for qmp */
> -static void isl_pmbus_get(Object *obj, Visitor *v, const char *name,
> +static void isl_pmbus_vr_get(Object *obj, Visitor *v, const char *name,
>                                       void *opaque, Error **errp)
>  {
>      visit_type_uint16(v, name, (uint16_t *)opaque, errp);
>  }
>  
> -static void isl_pmbus_set(Object *obj, Visitor *v, const char *name,
> +static void isl_pmbus_vr_set(Object *obj, Visitor *v, const char *name,
>                                   void *opaque, Error **errp)
>  {
>      PMBusDevice *pmdev = PMBUS_DEVICE(obj);
> @@ -51,7 +51,7 @@ static void isl_pmbus_set(Object *obj, Visitor *v, const char *name,
>      pmbus_check_limits(pmdev);
>  }
>  
> -static void isl_pmbus_exit_reset(Object *obj)
> +static void isl_pmbus_vr_exit_reset(Object *obj)
>  {
>      PMBusDevice *pmdev = PMBUS_DEVICE(obj);
>  
> @@ -92,7 +92,7 @@ static void isl_pmbus_exit_reset(Object *obj)
>  /* The raa228000 uses different direct mode coefficents from most isl devices */
>  static void raa228000_exit_reset(Object *obj)
>  {
> -    isl_pmbus_exit_reset(obj);
> +    isl_pmbus_vr_exit_reset(obj);
>  
>      PMBusDevice *pmdev = PMBUS_DEVICE(obj);
>  
> @@ -107,70 +107,70 @@ static void raa228000_exit_reset(Object *obj)
>      pmdev->pages[0].read_temperature_3 = 0;
>  }
>  
> -static void isl_pmbus_add_props(Object *obj, uint64_t *flags, uint8_t pages)
> +static void isl_pmbus_vr_add_props(Object *obj, uint64_t *flags, uint8_t pages)
>  {
>      PMBusDevice *pmdev = PMBUS_DEVICE(obj);
>      for (int i = 0; i < pages; i++) {
>          if (flags[i] & PB_HAS_VIN) {
>              object_property_add(obj, "vin[*]", "uint16",
> -                                isl_pmbus_get,
> -                                isl_pmbus_set,
> +                                isl_pmbus_vr_get,
> +                                isl_pmbus_vr_set,
>                                  NULL, &pmdev->pages[i].read_vin);
>          }
>  
>          if (flags[i] & PB_HAS_VOUT) {
>              object_property_add(obj, "vout[*]", "uint16",
> -                                isl_pmbus_get,
> -                                isl_pmbus_set,
> +                                isl_pmbus_vr_get,
> +                                isl_pmbus_vr_set,
>                                  NULL, &pmdev->pages[i].read_vout);
>          }
>  
>          if (flags[i] & PB_HAS_IIN) {
>              object_property_add(obj, "iin[*]", "uint16",
> -                                isl_pmbus_get,
> -                                isl_pmbus_set,
> +                                isl_pmbus_vr_get,
> +                                isl_pmbus_vr_set,
>                                  NULL, &pmdev->pages[i].read_iin);
>          }
>  
>          if (flags[i] & PB_HAS_IOUT) {
>              object_property_add(obj, "iout[*]", "uint16",
> -                                isl_pmbus_get,
> -                                isl_pmbus_set,
> +                                isl_pmbus_vr_get,
> +                                isl_pmbus_vr_set,
>                                  NULL, &pmdev->pages[i].read_iout);
>          }
>  
>          if (flags[i] & PB_HAS_PIN) {
>              object_property_add(obj, "pin[*]", "uint16",
> -                                isl_pmbus_get,
> -                                isl_pmbus_set,
> +                                isl_pmbus_vr_get,
> +                                isl_pmbus_vr_set,
>                                  NULL, &pmdev->pages[i].read_pin);
>          }
>  
>          if (flags[i] & PB_HAS_POUT) {
>              object_property_add(obj, "pout[*]", "uint16",
> -                                isl_pmbus_get,
> -                                isl_pmbus_set,
> +                                isl_pmbus_vr_get,
> +                                isl_pmbus_vr_set,
>                                  NULL, &pmdev->pages[i].read_pout);
>          }
>  
>          if (flags[i] & PB_HAS_TEMPERATURE) {
>              object_property_add(obj, "temp1[*]", "uint16",
> -                                isl_pmbus_get,
> -                                isl_pmbus_set,
> +                                isl_pmbus_vr_get,
> +                                isl_pmbus_vr_set,
>                                  NULL, &pmdev->pages[i].read_temperature_1);
>          }
>  
>          if (flags[i] & PB_HAS_TEMP2) {
>              object_property_add(obj, "temp2[*]", "uint16",
> -                                isl_pmbus_get,
> -                                isl_pmbus_set,
> +                                isl_pmbus_vr_get,
> +                                isl_pmbus_vr_set,
>                                  NULL, &pmdev->pages[i].read_temperature_2);
>          }
>  
>          if (flags[i] & PB_HAS_TEMP3) {
>              object_property_add(obj, "temp3[*]", "uint16",
> -                                isl_pmbus_get,
> -                                isl_pmbus_set,
> +                                isl_pmbus_vr_get,
> +                                isl_pmbus_vr_set,
>                                  NULL, &pmdev->pages[i].read_temperature_3);
>          }
>      }
> @@ -192,7 +192,7 @@ static void raa22xx_init(Object *obj)
>  
>      pmbus_page_config(pmdev, 0, flags[0]);
>      pmbus_page_config(pmdev, 1, flags[1]);
> -    isl_pmbus_add_props(obj, flags, 2);
> +    isl_pmbus_vr_add_props(obj, flags, 2);
>  }
>  
>  static void raa228000_init(Object *obj)
> @@ -206,14 +206,15 @@ static void raa228000_init(Object *obj)
>                 PB_HAS_TEMP2 | PB_HAS_TEMP3 | PB_HAS_STATUS_MFR_SPECIFIC;
>  
>      pmbus_page_config(pmdev, 0, flags[0]);
> -    isl_pmbus_add_props(obj, flags, 1);
> +    isl_pmbus_vr_add_props(obj, flags, 1);
>  }
>  
> -static void isl_pmbus_class_init(ObjectClass *klass, void *data, uint8_t pages)
> +static void isl_pmbus_vr_class_init(ObjectClass *klass, void *data,
> +                                    uint8_t pages)
>  {
>      PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
> -    k->write_data = isl_pmbus_write_data;
> -    k->receive_byte = isl_pmbus_read_byte;
> +    k->write_data = isl_pmbus_vr_write_data;
> +    k->receive_byte = isl_pmbus_vr_read_byte;
>      k->device_num_pages = pages;
>  }
>  
> @@ -222,8 +223,8 @@ static void isl69260_class_init(ObjectClass *klass, void *data)
>      ResettableClass *rc = RESETTABLE_CLASS(klass);
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      dc->desc = "Renesas ISL69260 Digital Multiphase Voltage Regulator";
> -    rc->phases.exit = isl_pmbus_exit_reset;
> -    isl_pmbus_class_init(klass, data, 2);
> +    rc->phases.exit = isl_pmbus_vr_exit_reset;
> +    isl_pmbus_vr_class_init(klass, data, 2);
>  }
>  
>  static void raa228000_class_init(ObjectClass *klass, void *data)
> @@ -232,7 +233,7 @@ static void raa228000_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      dc->desc = "Renesas 228000 Digital Multiphase Voltage Regulator";
>      rc->phases.exit = raa228000_exit_reset;
> -    isl_pmbus_class_init(klass, data, 1);
> +    isl_pmbus_vr_class_init(klass, data, 1);
>  }
>  
>  static void raa229004_class_init(ObjectClass *klass, void *data)
> @@ -240,8 +241,8 @@ static void raa229004_class_init(ObjectClass *klass, void *data)
>      ResettableClass *rc = RESETTABLE_CLASS(klass);
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      dc->desc = "Renesas 229004 Digital Multiphase Voltage Regulator";
> -    rc->phases.exit = isl_pmbus_exit_reset;
> -    isl_pmbus_class_init(klass, data, 2);
> +    rc->phases.exit = isl_pmbus_vr_exit_reset;
> +    isl_pmbus_vr_class_init(klass, data, 2);
>  }
>  
>  static const TypeInfo isl69260_info = {
> @@ -268,11 +269,11 @@ static const TypeInfo raa228000_info = {
>      .class_init = raa228000_class_init,
>  };
>  
> -static void isl_pmbus_register_types(void)
> +static void isl_pmbus_vr_register_types(void)
>  {
>      type_register_static(&isl69260_info);
>      type_register_static(&raa228000_info);
>      type_register_static(&raa229004_info);
>  }
>  
> -type_init(isl_pmbus_register_types)
> +type_init(isl_pmbus_vr_register_types)
> diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
> index 2e82991ff1..12b6992bc8 100644
> --- a/hw/sensor/meson.build
> +++ b/hw/sensor/meson.build
> @@ -5,4 +5,4 @@ softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
>  softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
>  softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
>  softmmu_ss.add(when: 'CONFIG_LSM303DLHC_MAG', if_true: files('lsm303dlhc_mag.c'))
> -softmmu_ss.add(when: 'CONFIG_ISL_PMBUS', if_true: files('isl_pmbus.c'))
> +softmmu_ss.add(when: 'CONFIG_ISL_PMBUS_VR', if_true: files('isl_pmbus_vr.c'))
> diff --git a/include/hw/sensor/isl_pmbus.h b/include/hw/sensor/isl_pmbus_vr.h
> similarity index 96%
> rename from include/hw/sensor/isl_pmbus.h
> rename to include/hw/sensor/isl_pmbus_vr.h
> index 7ead1dc4a2..3e47ff7e48 100644
> --- a/include/hw/sensor/isl_pmbus.h
> +++ b/include/hw/sensor/isl_pmbus_vr.h
> @@ -6,8 +6,8 @@
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
>  
> -#ifndef HW_MISC_ISL_PMBUS_H
> -#define HW_MISC_ISL_PMBUS_H
> +#ifndef HW_MISC_ISL_PMBUS_VR_H
> +#define HW_MISC_ISL_PMBUS_VR_H
>  
>  #include "hw/i2c/pmbus_device.h"
>  #include "qom/object.h"
> diff --git a/tests/qtest/isl_pmbus-test.c b/tests/qtest/isl_pmbus_vr-test.c
> similarity index 55%
> rename from tests/qtest/isl_pmbus-test.c
> rename to tests/qtest/isl_pmbus_vr-test.c
> index ea62cd4e07..5553ea410a 100644
> --- a/tests/qtest/isl_pmbus-test.c
> +++ b/tests/qtest/isl_pmbus_vr-test.c
> @@ -17,7 +17,7 @@
>  #include "qemu/osdep.h"
>  #include <math.h>
>  #include "hw/i2c/pmbus_device.h"
> -#include "hw/sensor/isl_pmbus.h"
> +#include "hw/sensor/isl_pmbus_vr.h"
>  #include "libqtest-single.h"
>  #include "libqos/qgraph.h"
>  #include "libqos/i2c.h"
> @@ -25,10 +25,10 @@
>  #include "qapi/qmp/qnum.h"
>  #include "qemu/bitops.h"
>  
> -#define TEST_ID "isl_pmbus-test"
> +#define TEST_ID "isl_pmbus_vr-test"
>  #define TEST_ADDR (0x43)
>  
> -static uint16_t qmp_isl_pmbus_get(const char *id, const char *property)
> +static uint16_t qmp_isl_pmbus_vr_get(const char *id, const char *property)
>  {
>      QDict *response;
>      uint64_t ret;
> @@ -41,7 +41,7 @@ static uint16_t qmp_isl_pmbus_get(const char *id, const char *property)
>      return ret;
>  }
>  
> -static void qmp_isl_pmbus_set(const char *id,
> +static void qmp_isl_pmbus_vr_set(const char *id,
>                              const char *property,
>                              uint16_t value)
>  {
> @@ -54,7 +54,7 @@ static void qmp_isl_pmbus_set(const char *id,
>  }
>  
>  /* PMBus commands are little endian vs i2c_set16 in i2c.h which is big endian */
> -static uint16_t isl_pmbus_i2c_get16(QI2CDevice *i2cdev, uint8_t reg)
> +static uint16_t isl_pmbus_vr_i2c_get16(QI2CDevice *i2cdev, uint8_t reg)
>  {
>      uint8_t resp[2];
>      i2c_read_block(i2cdev, reg, resp, sizeof(resp));
> @@ -62,7 +62,8 @@ static uint16_t isl_pmbus_i2c_get16(QI2CDevice *i2cdev, uint8_t reg)
>  }
>  
>  /* PMBus commands are little endian vs i2c_set16 in i2c.h which is big endian */
> -static void isl_pmbus_i2c_set16(QI2CDevice *i2cdev, uint8_t reg, uint16_t value)
> +static void isl_pmbus_vr_i2c_set16(QI2CDevice *i2cdev, uint8_t reg,
> +                                   uint16_t value)
>  {
>      uint8_t data[2];
>  
> @@ -76,28 +77,28 @@ static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
>      uint16_t value, i2c_value;
>      QI2CDevice *i2cdev = (QI2CDevice *)obj;
>  
> -    value = qmp_isl_pmbus_get(TEST_ID, "vout[0]");
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "vout[0]");
>      g_assert_cmpuint(value, ==, ISL_READ_VOUT_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_IOUT);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IOUT);
>      g_assert_cmpuint(i2c_value, ==, ISL_READ_IOUT_DEFAULT);
>  
> -    value = qmp_isl_pmbus_get(TEST_ID, "pout[0]");
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "pout[0]");
>      g_assert_cmpuint(value, ==, ISL_READ_POUT_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_VIN);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_VIN);
>      g_assert_cmpuint(i2c_value, ==, ISL_READ_VIN_DEFAULT);
>  
> -    value = qmp_isl_pmbus_get(TEST_ID, "iin[0]");
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "iin[0]");
>      g_assert_cmpuint(value, ==, ISL_READ_IIN_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_PIN);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_PIN);
>      g_assert_cmpuint(i2c_value, ==, ISL_READ_PIN_DEFAULT);
>  
> -    value = qmp_isl_pmbus_get(TEST_ID, "temp1[0]");
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "temp1[0]");
>      g_assert_cmpuint(value, ==, ISL_READ_TEMP_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_2);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_2);
>      g_assert_cmpuint(i2c_value, ==, ISL_READ_TEMP_DEFAULT);
>  
>      i2c_value = i2c_get8(i2cdev, PMBUS_CAPABILITY);
> @@ -112,37 +113,37 @@ static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
>      i2c_value = i2c_get8(i2cdev, PMBUS_VOUT_MODE);
>      g_assert_cmphex(i2c_value, ==, ISL_VOUT_MODE_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_COMMAND);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_COMMAND);
>      g_assert_cmphex(i2c_value, ==, ISL_VOUT_COMMAND_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MAX);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MAX);
>      g_assert_cmphex(i2c_value, ==, ISL_VOUT_MAX_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_HIGH);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_HIGH);
>      g_assert_cmphex(i2c_value, ==, ISL_VOUT_MARGIN_HIGH_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_LOW);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_LOW);
>      g_assert_cmphex(i2c_value, ==, ISL_VOUT_MARGIN_LOW_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_TRANSITION_RATE);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_TRANSITION_RATE);
>      g_assert_cmphex(i2c_value, ==, ISL_VOUT_TRANSITION_RATE_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT);
>      g_assert_cmphex(i2c_value, ==, ISL_VOUT_OV_FAULT_LIMIT_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
>      g_assert_cmphex(i2c_value, ==, ISL_OT_FAULT_LIMIT_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
>      g_assert_cmphex(i2c_value, ==, ISL_OT_WARN_LIMIT_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
>      g_assert_cmphex(i2c_value, ==, ISL_VIN_OV_WARN_LIMIT_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
>      g_assert_cmphex(i2c_value, ==, ISL_VIN_UV_WARN_LIMIT_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT);
>      g_assert_cmphex(i2c_value, ==, ISL_IIN_OC_FAULT_LIMIT_DEFAULT);
>  
>      i2c_value = i2c_get8(i2cdev, PMBUS_REVISION);
> @@ -155,13 +156,13 @@ static void raa228000_test_defaults(void *obj, void *data,
>      uint16_t value, i2c_value;
>      QI2CDevice *i2cdev = (QI2CDevice *)obj;
>  
> -    value = qmp_isl_pmbus_get(TEST_ID, "vout[0]");
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "vout[0]");
>      g_assert_cmpuint(value, ==, 0);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_IOUT);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IOUT);
>      g_assert_cmpuint(i2c_value, ==, 0);
>  
> -    value = qmp_isl_pmbus_get(TEST_ID, "pout[0]");
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "pout[0]");
>      g_assert_cmpuint(value, ==, 0);
>  
>      i2c_value = i2c_get8(i2cdev, PMBUS_CAPABILITY);
> @@ -176,37 +177,37 @@ static void raa228000_test_defaults(void *obj, void *data,
>      i2c_value = i2c_get8(i2cdev, PMBUS_VOUT_MODE);
>      g_assert_cmphex(i2c_value, ==, ISL_VOUT_MODE_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_COMMAND);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_COMMAND);
>      g_assert_cmphex(i2c_value, ==, ISL_VOUT_COMMAND_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MAX);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MAX);
>      g_assert_cmphex(i2c_value, ==, ISL_VOUT_MAX_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_HIGH);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_HIGH);
>      g_assert_cmphex(i2c_value, ==, ISL_VOUT_MARGIN_HIGH_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_LOW);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_LOW);
>      g_assert_cmphex(i2c_value, ==, ISL_VOUT_MARGIN_LOW_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_TRANSITION_RATE);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_TRANSITION_RATE);
>      g_assert_cmphex(i2c_value, ==, ISL_VOUT_TRANSITION_RATE_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT);
>      g_assert_cmphex(i2c_value, ==, ISL_VOUT_OV_FAULT_LIMIT_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
>      g_assert_cmphex(i2c_value, ==, ISL_OT_FAULT_LIMIT_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
>      g_assert_cmphex(i2c_value, ==, ISL_OT_WARN_LIMIT_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
>      g_assert_cmphex(i2c_value, ==, ISL_VIN_OV_WARN_LIMIT_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
>      g_assert_cmphex(i2c_value, ==, ISL_VIN_UV_WARN_LIMIT_DEFAULT);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT);
>      g_assert_cmphex(i2c_value, ==, ISL_IIN_OC_FAULT_LIMIT_DEFAULT);
>  
>      i2c_value = i2c_get8(i2cdev, PMBUS_REVISION);
> @@ -219,49 +220,49 @@ static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
>      uint16_t i2c_value, value;
>      QI2CDevice *i2cdev = (QI2CDevice *)obj;
>  
> -    qmp_isl_pmbus_set(TEST_ID, "vin[0]", 200);
> -    value = qmp_isl_pmbus_get(TEST_ID, "vin[0]");
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_VIN);
> +    qmp_isl_pmbus_vr_set(TEST_ID, "vin[0]", 200);
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "vin[0]");
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_VIN);
>      g_assert_cmpuint(value, ==, i2c_value);
>  
> -    qmp_isl_pmbus_set(TEST_ID, "vout[0]", 2500);
> -    value = qmp_isl_pmbus_get(TEST_ID, "vout[0]");
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_VOUT);
> +    qmp_isl_pmbus_vr_set(TEST_ID, "vout[0]", 2500);
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "vout[0]");
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_VOUT);
>      g_assert_cmpuint(value, ==, i2c_value);
>  
> -    qmp_isl_pmbus_set(TEST_ID, "iin[0]", 300);
> -    value = qmp_isl_pmbus_get(TEST_ID, "iin[0]");
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_IIN);
> +    qmp_isl_pmbus_vr_set(TEST_ID, "iin[0]", 300);
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "iin[0]");
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IIN);
>      g_assert_cmpuint(value, ==, i2c_value);
>  
> -    qmp_isl_pmbus_set(TEST_ID, "iout[0]", 310);
> -    value = qmp_isl_pmbus_get(TEST_ID, "iout[0]");
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_IOUT);
> +    qmp_isl_pmbus_vr_set(TEST_ID, "iout[0]", 310);
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "iout[0]");
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IOUT);
>      g_assert_cmpuint(value, ==, i2c_value);
>  
> -    qmp_isl_pmbus_set(TEST_ID, "pin[0]", 100);
> -    value = qmp_isl_pmbus_get(TEST_ID, "pin[0]");
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_PIN);
> +    qmp_isl_pmbus_vr_set(TEST_ID, "pin[0]", 100);
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "pin[0]");
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_PIN);
>      g_assert_cmpuint(value, ==, i2c_value);
>  
> -    qmp_isl_pmbus_set(TEST_ID, "pout[0]", 95);
> -    value = qmp_isl_pmbus_get(TEST_ID, "pout[0]");
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_POUT);
> +    qmp_isl_pmbus_vr_set(TEST_ID, "pout[0]", 95);
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "pout[0]");
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_POUT);
>      g_assert_cmpuint(value, ==, i2c_value);
>  
> -    qmp_isl_pmbus_set(TEST_ID, "temp1[0]", 26);
> -    value = qmp_isl_pmbus_get(TEST_ID, "temp1[0]");
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
> +    qmp_isl_pmbus_vr_set(TEST_ID, "temp1[0]", 26);
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "temp1[0]");
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
>      g_assert_cmpuint(value, ==, i2c_value);
>  
> -    qmp_isl_pmbus_set(TEST_ID, "temp2[0]", 27);
> -    value = qmp_isl_pmbus_get(TEST_ID, "temp2[0]");
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_2);
> +    qmp_isl_pmbus_vr_set(TEST_ID, "temp2[0]", 27);
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "temp2[0]");
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_2);
>      g_assert_cmpuint(value, ==, i2c_value);
>  
> -    qmp_isl_pmbus_set(TEST_ID, "temp3[0]", 28);
> -    value = qmp_isl_pmbus_get(TEST_ID, "temp3[0]");
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_3);
> +    qmp_isl_pmbus_vr_set(TEST_ID, "temp3[0]", 28);
> +    value = qmp_isl_pmbus_vr_get(TEST_ID, "temp3[0]");
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_3);
>      g_assert_cmpuint(value, ==, i2c_value);
>  
>  }
> @@ -272,64 +273,64 @@ static void test_rw_regs(void *obj, void *data, QGuestAllocator *alloc)
>      uint16_t i2c_value;
>      QI2CDevice *i2cdev = (QI2CDevice *)obj;
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_VOUT_COMMAND, 0x1234);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_COMMAND);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_COMMAND, 0x1234);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_COMMAND);
>      g_assert_cmphex(i2c_value, ==, 0x1234);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_VOUT_TRIM, 0x4567);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_TRIM);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_TRIM, 0x4567);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_TRIM);
>      g_assert_cmphex(i2c_value, ==, 0x4567);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_VOUT_MAX, 0x9876);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MAX);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_MAX, 0x9876);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MAX);
>      g_assert_cmphex(i2c_value, ==, 0x9876);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_VOUT_MARGIN_HIGH, 0xABCD);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_HIGH);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_MARGIN_HIGH, 0xABCD);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_HIGH);
>      g_assert_cmphex(i2c_value, ==, 0xABCD);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_VOUT_MARGIN_LOW, 0xA1B2);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_LOW);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_MARGIN_LOW, 0xA1B2);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_LOW);
>      g_assert_cmphex(i2c_value, ==, 0xA1B2);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_VOUT_TRANSITION_RATE, 0xDEF1);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_TRANSITION_RATE);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_TRANSITION_RATE, 0xDEF1);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_TRANSITION_RATE);
>      g_assert_cmphex(i2c_value, ==, 0xDEF1);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_VOUT_DROOP, 0x5678);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_DROOP);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_DROOP, 0x5678);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_DROOP);
>      g_assert_cmphex(i2c_value, ==, 0x5678);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_VOUT_MIN, 0x1234);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MIN);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_MIN, 0x1234);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MIN);
>      g_assert_cmphex(i2c_value, ==, 0x1234);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT, 0x2345);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT, 0x2345);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT);
>      g_assert_cmphex(i2c_value, ==, 0x2345);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_VOUT_UV_FAULT_LIMIT, 0xFA12);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_UV_FAULT_LIMIT);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_UV_FAULT_LIMIT, 0xFA12);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_UV_FAULT_LIMIT);
>      g_assert_cmphex(i2c_value, ==, 0xFA12);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_OT_FAULT_LIMIT, 0xF077);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_OT_FAULT_LIMIT, 0xF077);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
>      g_assert_cmphex(i2c_value, ==, 0xF077);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_OT_WARN_LIMIT, 0x7137);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_OT_WARN_LIMIT, 0x7137);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
>      g_assert_cmphex(i2c_value, ==, 0x7137);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_VIN_OV_FAULT_LIMIT, 0x3456);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VIN_OV_FAULT_LIMIT);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VIN_OV_FAULT_LIMIT, 0x3456);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VIN_OV_FAULT_LIMIT);
>      g_assert_cmphex(i2c_value, ==, 0x3456);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_VIN_UV_FAULT_LIMIT, 0xBADA);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VIN_UV_FAULT_LIMIT);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VIN_UV_FAULT_LIMIT, 0xBADA);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VIN_UV_FAULT_LIMIT);
>      g_assert_cmphex(i2c_value, ==, 0xBADA);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT, 0xB1B0);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT, 0xB1B0);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT);
>      g_assert_cmphex(i2c_value, ==, 0xB1B0);
>  
>      i2c_set8(i2cdev, PMBUS_OPERATION, 0xA);
> @@ -362,49 +363,49 @@ static void test_ro_regs(void *obj, void *data, QGuestAllocator *alloc)
>      uint16_t i2c_init_value, i2c_value;
>      QI2CDevice *i2cdev = (QI2CDevice *)obj;
>  
> -    i2c_init_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_VIN);
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_READ_VIN, 0xBEEF);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_VIN);
> +    i2c_init_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_VIN);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_VIN, 0xBEEF);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_VIN);
>      g_assert_cmphex(i2c_init_value, ==, i2c_value);
>  
> -    i2c_init_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_IIN);
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_READ_IIN, 0xB00F);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_IIN);
> +    i2c_init_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IIN);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_IIN, 0xB00F);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IIN);
>      g_assert_cmphex(i2c_init_value, ==, i2c_value);
>  
> -    i2c_init_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_VOUT);
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_READ_VOUT, 0x1234);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_VOUT);
> +    i2c_init_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_VOUT);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_VOUT, 0x1234);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_VOUT);
>      g_assert_cmphex(i2c_init_value, ==, i2c_value);
>  
> -    i2c_init_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_IOUT);
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_READ_IOUT, 0x6547);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_IOUT);
> +    i2c_init_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IOUT);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_IOUT, 0x6547);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IOUT);
>      g_assert_cmphex(i2c_init_value, ==, i2c_value);
>  
> -    i2c_init_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_READ_TEMPERATURE_1, 0x1597);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
> +    i2c_init_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_TEMPERATURE_1, 0x1597);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
>      g_assert_cmphex(i2c_init_value, ==, i2c_value);
>  
> -    i2c_init_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_2);
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_READ_TEMPERATURE_2, 0x1897);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_2);
> +    i2c_init_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_2);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_TEMPERATURE_2, 0x1897);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_2);
>      g_assert_cmphex(i2c_init_value, ==, i2c_value);
>  
> -    i2c_init_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_3);
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_READ_TEMPERATURE_3, 0x1007);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_3);
> +    i2c_init_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_3);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_TEMPERATURE_3, 0x1007);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_3);
>      g_assert_cmphex(i2c_init_value, ==, i2c_value);
>  
> -    i2c_init_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_PIN);
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_READ_PIN, 0xDEAD);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_PIN);
> +    i2c_init_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_PIN);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_PIN, 0xDEAD);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_PIN);
>      g_assert_cmphex(i2c_init_value, ==, i2c_value);
>  
> -    i2c_init_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_POUT);
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_READ_POUT, 0xD00D);
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_POUT);
> +    i2c_init_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_POUT);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_READ_POUT, 0xD00D);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_POUT);
>      g_assert_cmphex(i2c_init_value, ==, i2c_value);
>  }
>  
> @@ -415,29 +416,29 @@ static void test_voltage_faults(void *obj, void *data, QGuestAllocator *alloc)
>      uint8_t i2c_byte;
>      QI2CDevice *i2cdev = (QI2CDevice *)obj;
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT, 5000);
> -    qmp_isl_pmbus_set(TEST_ID, "vout[0]", 5100);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_OV_WARN_LIMIT, 5000);
> +    qmp_isl_pmbus_vr_set(TEST_ID, "vout[0]", 5100);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
>      i2c_byte = i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
>      g_assert_true((i2c_value & PB_STATUS_VOUT) != 0);
>      g_assert_true((i2c_byte & PB_STATUS_VOUT_OV_WARN) != 0);
>  
> -    qmp_isl_pmbus_set(TEST_ID, "vout[0]", 4500);
> +    qmp_isl_pmbus_vr_set(TEST_ID, "vout[0]", 4500);
>      i2c_set8(i2cdev, PMBUS_CLEAR_FAULTS, 0);
>      i2c_byte = i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
>      g_assert_true((i2c_byte & PB_STATUS_VOUT_OV_WARN) == 0);
>  
> -    isl_pmbus_i2c_set16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT, 4600);
> +    isl_pmbus_vr_i2c_set16(i2cdev, PMBUS_VOUT_UV_WARN_LIMIT, 4600);
>  
> -    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
> +    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_STATUS_WORD);
>      i2c_byte = i2c_get8(i2cdev, PMBUS_STATUS_VOUT);
>      g_assert_true((i2c_value & PB_STATUS_VOUT) != 0);
>      g_assert_true((i2c_byte & PB_STATUS_VOUT_UV_WARN) != 0);
>  
>  }
>  
> -static void isl_pmbus_register_nodes(void)
> +static void isl_pmbus_vr_register_nodes(void)
>  {
>      QOSGraphEdgeOptions opts = {
>          .extra_device_opts = "id=" TEST_ID ",address=0x43"
> @@ -470,4 +471,4 @@ static void isl_pmbus_register_nodes(void)
>      qos_add_test("test_rw_regs", "raa228000", test_rw_regs, NULL);
>      qos_add_test("test_ov_faults", "raa228000", test_voltage_faults, NULL);
>  }
> -libqos_init(isl_pmbus_register_nodes);
> +libqos_init(isl_pmbus_vr_register_nodes);
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 9a6cc93c16..98b5969a38 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -244,7 +244,7 @@ qos_test_ss.add(
>    'es1370-test.c',
>    'ipoctal232-test.c',
>    'lsm303dlhc-mag-test.c',
> -  'isl_pmbus-test.c',
> +  'isl_pmbus_vr-test.c',
>    'max34451-test.c',
>    'megasas-test.c',
>    'ne2000-test.c',
> -- 
> 2.35.1.616.g0bdcbb4464-goog
> 
> 


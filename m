Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202CB3EEAB7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 12:14:16 +0200 (CEST)
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFw6p-0005Vh-1w
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 06:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mFw3D-0004RM-NG; Tue, 17 Aug 2021 06:10:31 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:52270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mFw3B-00023Y-4y; Tue, 17 Aug 2021 06:10:31 -0400
Received: from [192.168.15.170] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id D29002089E;
 Tue, 17 Aug 2021 10:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1629195025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xD5r6k4rcJdIIpBFuqpV3DgInRnmNGSOlKVwtZbtWFs=;
 b=YU/QuZO5/81X/TuDROfHYAI+TOY0/DlzYB2he0jaBhJHQQPikXB5sinN4X7xmCe/r/Tda7
 nhcr49pFqFXbrMQXTa8MU1qDxwuhMqccsU3jGbbnRbWZC5kB6QEHxstcJYZ9xt+Bb+P2MZ
 26T37DuuCDKcOSuo3RQijvXRUmMOme4=
Subject: Re: [PATCH for-6.2 01/25] arm: Move M-profile RAS register block into
 its own device
To: Luc Michel <luc@lmichel.fr>, Peter Maydell <peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-2-peter.maydell@linaro.org>
 <20210817082512.4snnzp6vmhj26mjn@sekoia-pc.home.lmichel.fr>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <fb281c0d-e186-21b2-73be-1d3dd003a5f8@greensocs.com>
Date: Tue, 17 Aug 2021 12:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210817082512.4snnzp6vmhj26mjn@sekoia-pc.home.lmichel.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.71,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/17/21 10:25 AM, Luc Michel wrote:
> On 10:33 Thu 12 Aug     , Peter Maydell wrote:
>> Currently we implement the RAS register block within the NVIC device.
>> It isn't really very tightly coupled with the NVIC proper, so instead
>> move it out into a sysbus device of its own and have the top level
>> ARMv7M container create it and map it into memory at the right
>> address.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Reviewed-by: Luc Michel <luc@lmichel.fr>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> 
>> ---
>>  include/hw/arm/armv7m.h       |  2 +
>>  include/hw/intc/armv7m_nvic.h |  1 -
>>  include/hw/misc/armv7m_ras.h  | 37 ++++++++++++++
>>  hw/arm/armv7m.c               | 12 +++++
>>  hw/intc/armv7m_nvic.c         | 56 ---------------------
>>  hw/misc/armv7m_ras.c          | 93 +++++++++++++++++++++++++++++++++++
>>  MAINTAINERS                   |  2 +
>>  hw/misc/meson.build           |  2 +
>>  8 files changed, 148 insertions(+), 57 deletions(-)
>>  create mode 100644 include/hw/misc/armv7m_ras.h
>>  create mode 100644 hw/misc/armv7m_ras.c
>>
>> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
>> index bc6733c5184..4cae0d7eeaa 100644
>> --- a/include/hw/arm/armv7m.h
>> +++ b/include/hw/arm/armv7m.h
>> @@ -12,6 +12,7 @@
>>  
>>  #include "hw/sysbus.h"
>>  #include "hw/intc/armv7m_nvic.h"
>> +#include "hw/misc/armv7m_ras.h"
>>  #include "target/arm/idau.h"
>>  #include "qom/object.h"
>>  
>> @@ -58,6 +59,7 @@ struct ARMv7MState {
>>      NVICState nvic;
>>      BitBandState bitband[ARMV7M_NUM_BITBANDS];
>>      ARMCPU *cpu;
>> +    ARMv7MRAS ras;
>>  
>>      /* MemoryRegion we pass to the CPU, with our devices layered on
>>       * top of the ones the board provides in board_memory.
>> diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
>> index 39c71e15936..33b6d8810c7 100644
>> --- a/include/hw/intc/armv7m_nvic.h
>> +++ b/include/hw/intc/armv7m_nvic.h
>> @@ -83,7 +83,6 @@ struct NVICState {
>>      MemoryRegion sysreg_ns_mem;
>>      MemoryRegion systickmem;
>>      MemoryRegion systick_ns_mem;
>> -    MemoryRegion ras_mem;
>>      MemoryRegion container;
>>      MemoryRegion defaultmem;
>>  
>> diff --git a/include/hw/misc/armv7m_ras.h b/include/hw/misc/armv7m_ras.h
>> new file mode 100644
>> index 00000000000..f8773e65b14
>> --- /dev/null
>> +++ b/include/hw/misc/armv7m_ras.h
>> @@ -0,0 +1,37 @@
>> +/*
>> + * Arm M-profile RAS block
>> + *
>> + * Copyright (c) 2021 Linaro Limited
>> + *
>> + *  This program is free software; you can redistribute it and/or modify
>> + *  it under the terms of the GNU General Public License version 2 or
>> + *  (at your option) any later version.
>> + */
>> +
>> +/*
>> + * This is a model of the RAS register block of an M-profile CPU
>> + * (the registers starting at 0xE0005000 with ERRFRn).
>> + *
>> + * QEMU interface:
>> + *  + sysbus MMIO region 0: the register bank
>> + *
>> + * The QEMU implementation currently provides "minimal RAS" only.
>> + */
>> +
>> +#ifndef HW_MISC_ARMV7M_RAS_H
>> +#define HW_MISC_ARMV7M_RAS_H
>> +
>> +#include "hw/sysbus.h"
>> +
>> +#define TYPE_ARMV7M_RAS "armv7m-ras"
>> +OBJECT_DECLARE_SIMPLE_TYPE(ARMv7MRAS, ARMV7M_RAS)
>> +
>> +struct ARMv7MRAS {
>> +    /*< private >*/
>> +    SysBusDevice parent_obj;
>> +
>> +    /*< public >*/
>> +    MemoryRegion iomem;
>> +};
>> +
>> +#endif
>> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
>> index 9ce5c30cd5c..8964730d153 100644
>> --- a/hw/arm/armv7m.c
>> +++ b/hw/arm/armv7m.c
>> @@ -231,6 +231,18 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>>      memory_region_add_subregion(&s->container, 0xe0000000,
>>                                  sysbus_mmio_get_region(sbd, 0));
>>  
>> +    /* If the CPU has RAS support, create the RAS register block */
>> +    if (cpu_isar_feature(aa32_ras, s->cpu)) {
>> +        object_initialize_child(OBJECT(dev), "armv7m-ras",
>> +                                &s->ras, TYPE_ARMV7M_RAS);
>> +        sbd = SYS_BUS_DEVICE(&s->ras);
>> +        if (!sysbus_realize(sbd, errp)) {
>> +            return;
>> +        }
>> +        memory_region_add_subregion_overlap(&s->container, 0xe0005000,
>> +                                            sysbus_mmio_get_region(sbd, 0), 1);
>> +    }
>> +
>>      for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
>>          if (s->enable_bitband) {
>>              Object *obj = OBJECT(&s->bitband[i]);
>> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
>> index 1e7ddcb94cb..a5975592dfa 100644
>> --- a/hw/intc/armv7m_nvic.c
>> +++ b/hw/intc/armv7m_nvic.c
>> @@ -2549,56 +2549,6 @@ static const MemoryRegionOps nvic_systick_ops = {
>>      .endianness = DEVICE_NATIVE_ENDIAN,
>>  };
>>  
>> -
>> -static MemTxResult ras_read(void *opaque, hwaddr addr,
>> -                            uint64_t *data, unsigned size,
>> -                            MemTxAttrs attrs)
>> -{
>> -    if (attrs.user) {
>> -        return MEMTX_ERROR;
>> -    }
>> -
>> -    switch (addr) {
>> -    case 0xe10: /* ERRIIDR */
>> -        /* architect field = Arm; product/variant/revision 0 */
>> -        *data = 0x43b;
>> -        break;
>> -    case 0xfc8: /* ERRDEVID */
>> -        /* Minimal RAS: we implement 0 error record indexes */
>> -        *data = 0;
>> -        break;
>> -    default:
>> -        qemu_log_mask(LOG_UNIMP, "Read RAS register offset 0x%x\n",
>> -                      (uint32_t)addr);
>> -        *data = 0;
>> -        break;
>> -    }
>> -    return MEMTX_OK;
>> -}
>> -
>> -static MemTxResult ras_write(void *opaque, hwaddr addr,
>> -                             uint64_t value, unsigned size,
>> -                             MemTxAttrs attrs)
>> -{
>> -    if (attrs.user) {
>> -        return MEMTX_ERROR;
>> -    }
>> -
>> -    switch (addr) {
>> -    default:
>> -        qemu_log_mask(LOG_UNIMP, "Write to RAS register offset 0x%x\n",
>> -                      (uint32_t)addr);
>> -        break;
>> -    }
>> -    return MEMTX_OK;
>> -}
>> -
>> -static const MemoryRegionOps ras_ops = {
>> -    .read_with_attrs = ras_read,
>> -    .write_with_attrs = ras_write,
>> -    .endianness = DEVICE_NATIVE_ENDIAN,
>> -};
>> -
>>  /*
>>   * Unassigned portions of the PPB space are RAZ/WI for privileged
>>   * accesses, and fault for non-privileged accesses.
>> @@ -2946,12 +2896,6 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>>                                              &s->systick_ns_mem, 1);
>>      }
>>  
>> -    if (cpu_isar_feature(aa32_ras, s->cpu)) {
>> -        memory_region_init_io(&s->ras_mem, OBJECT(s),
>> -                              &ras_ops, s, "nvic_ras", 0x1000);
>> -        memory_region_add_subregion(&s->container, 0x5000, &s->ras_mem);
>> -    }
>> -
>>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
>>  }
>>  
>> diff --git a/hw/misc/armv7m_ras.c b/hw/misc/armv7m_ras.c
>> new file mode 100644
>> index 00000000000..a2b4f4b8dc8
>> --- /dev/null
>> +++ b/hw/misc/armv7m_ras.c
>> @@ -0,0 +1,93 @@
>> +/*
>> + * Arm M-profile RAS block
>> + *
>> + * Copyright (c) 2021 Linaro Limited
>> + *
>> + *  This program is free software; you can redistribute it and/or modify
>> + *  it under the terms of the GNU General Public License version 2 or
>> + *  (at your option) any later version.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/misc/armv7m_ras.h"
>> +#include "qemu/log.h"
>> +
>> +static MemTxResult ras_read(void *opaque, hwaddr addr,
>> +                            uint64_t *data, unsigned size,
>> +                            MemTxAttrs attrs)
>> +{
>> +    if (attrs.user) {
>> +        return MEMTX_ERROR;
>> +    }
>> +
>> +    switch (addr) {
>> +    case 0xe10: /* ERRIIDR */
>> +        /* architect field = Arm; product/variant/revision 0 */
>> +        *data = 0x43b;
>> +        break;
>> +    case 0xfc8: /* ERRDEVID */
>> +        /* Minimal RAS: we implement 0 error record indexes */
>> +        *data = 0;
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_UNIMP, "Read RAS register offset 0x%x\n",
>> +                      (uint32_t)addr);
>> +        *data = 0;
>> +        break;
>> +    }
>> +    return MEMTX_OK;
>> +}
>> +
>> +static MemTxResult ras_write(void *opaque, hwaddr addr,
>> +                             uint64_t value, unsigned size,
>> +                             MemTxAttrs attrs)
>> +{
>> +    if (attrs.user) {
>> +        return MEMTX_ERROR;
>> +    }
>> +
>> +    switch (addr) {
>> +    default:
>> +        qemu_log_mask(LOG_UNIMP, "Write to RAS register offset 0x%x\n",
>> +                      (uint32_t)addr);
>> +        break;
>> +    }
>> +    return MEMTX_OK;
>> +}
>> +
>> +static const MemoryRegionOps ras_ops = {
>> +    .read_with_attrs = ras_read,
>> +    .write_with_attrs = ras_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +
>> +static void armv7m_ras_init(Object *obj)
>> +{
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>> +    ARMv7MRAS *s = ARMV7M_RAS(obj);
>> +
>> +    memory_region_init_io(&s->iomem, obj, &ras_ops,
>> +                          s, "armv7m-ras", 0x1000);
>> +    sysbus_init_mmio(sbd, &s->iomem);
>> +}
>> +
>> +static void armv7m_ras_class_init(ObjectClass *klass, void *data)
>> +{
>> +    /* This device has no state: no need for vmstate or reset */
>> +}
>> +
>> +static const TypeInfo armv7m_ras_info = {
>> +    .name = TYPE_ARMV7M_RAS,
>> +    .parent = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(ARMv7MRAS),
>> +    .instance_init = armv7m_ras_init,
>> +    .class_init = armv7m_ras_class_init,
>> +};
>> +
>> +static void armv7m_ras_register_types(void)
>> +{
>> +    type_register_static(&armv7m_ras_info);
>> +}
>> +
>> +type_init(armv7m_ras_register_types);
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 37b1a8e4428..3cac393bb48 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -617,6 +617,7 @@ F: hw/intc/gic_internal.h
>>  F: hw/misc/a9scu.c
>>  F: hw/misc/arm11scu.c
>>  F: hw/misc/arm_l2x0.c
>> +F: hw/misc/armv7m_ras.c
>>  F: hw/timer/a9gtimer*
>>  F: hw/timer/arm*
>>  F: include/hw/arm/arm*.h
>> @@ -626,6 +627,7 @@ F: include/hw/misc/arm11scu.h
>>  F: include/hw/timer/a9gtimer.h
>>  F: include/hw/timer/arm_mptimer.h
>>  F: include/hw/timer/armv7m_systick.h
>> +F: include/hw/misc/armv7m_ras.h
>>  F: tests/qtest/test-arm-mptimer.c
>>  
>>  Exynos
>> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
>> index a53b849a5a0..3f41a3a5b27 100644
>> --- a/hw/misc/meson.build
>> +++ b/hw/misc/meson.build
>> @@ -17,6 +17,8 @@ softmmu_ss.add(when: 'CONFIG_INTEGRATOR_DEBUG', if_true: files('arm_integrator_d
>>  softmmu_ss.add(when: 'CONFIG_A9SCU', if_true: files('a9scu.c'))
>>  softmmu_ss.add(when: 'CONFIG_ARM11SCU', if_true: files('arm11scu.c'))
>>  
>> +softmmu_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_ras.c'))
>> +
>>  # Mac devices
>>  softmmu_ss.add(when: 'CONFIG_MOS6522', if_true: files('mos6522.c'))
>>  
>> -- 
>> 2.20.1
>>
> 


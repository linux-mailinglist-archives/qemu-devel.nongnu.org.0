Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A5C36CAC8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 20:01:54 +0200 (CEST)
Received: from localhost ([::1]:47690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbS1x-0005RA-AU
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 14:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbRbR-00047J-JX
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:34:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbRbO-0003GD-Td
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619544865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQkAeh6zjEMiC+3QlPlaygbUyOki2N5t0XGz3xepCJo=;
 b=GiHh4YEaUr8ryU995p/LKsDvbhKDNmVKW1qPkEyhzL9Ev35bPcGSzPqef3IelQvwuYGWR6
 apX5yaOz123uPQvMBRB6hmNsC2h06az0Kb1DX9OEudF2aX2chYD7yHkld8HgahXS/iTP4t
 pwZceRjVN0D4wMyj+rf0PEv27A7giT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-EXEVWlLnPlOs6wAOYVDRcw-1; Tue, 27 Apr 2021 13:34:22 -0400
X-MC-Unique: EXEVWlLnPlOs6wAOYVDRcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B618E80402F;
 Tue, 27 Apr 2021 17:34:20 +0000 (UTC)
Received: from [10.10.112.236] (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50C6B687FC;
 Tue, 27 Apr 2021 17:34:15 +0000 (UTC)
Subject: Re: [PATCH 4/4] hw/block/fdc: Extract SysBus floppy controllers to
 fdc-sysbus.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210415102321.3987935-1-philmd@redhat.com>
 <20210415102321.3987935-5-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <0812a48a-36c6-8152-e8f1-f97c755b9f55@redhat.com>
Date: Tue, 27 Apr 2021 13:34:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415102321.3987935-5-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 6:23 AM, Philippe Mathieu-Daudé wrote:
> Some machines use floppy controllers via the SysBus interface,
> and don't need to pull in all the SysBus code.
> Extract the SysBus specific code to a new unit: fdc-sysbus.c,
> and add a new Kconfig symbol: "FDC_SYSBUS".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

LGTM, but again you'll want someone to review the Kconfig changes. It 
looks reasonable to me at a glance, but I just don't know what I don't 
know there.

I'm trusting you somewhat that you've audited the proper dependencies 
for each subsystem and that these have been accurately described via 
Kconfig -- my knowledge of non-x86 platforms is a bit meager, so I am 
relying on CI to tell me if this breaks anything I care about.

Would love to get an ACK from Mark Cave-Ayland and Hervé Poussineau if 
possible, but if they're not available to take a quick peek, we'll try 
to get this in closer to the beginning of the dev window to maximize 
problem-finding time.

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>   hw/block/fdc-sysbus.c | 252 ++++++++++++++++++++++++++++++++++++++++++
>   hw/block/fdc.c        | 220 ------------------------------------
>   MAINTAINERS           |   1 +
>   hw/block/Kconfig      |   4 +
>   hw/block/meson.build  |   1 +
>   hw/block/trace-events |   2 +
>   hw/mips/Kconfig       |   2 +-
>   hw/sparc/Kconfig      |   2 +-
>   8 files changed, 262 insertions(+), 222 deletions(-)
>   create mode 100644 hw/block/fdc-sysbus.c
> 
> diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
> new file mode 100644
> index 00000000000..71755fd6ae4
> --- /dev/null
> +++ b/hw/block/fdc-sysbus.c
> @@ -0,0 +1,252 @@
> +/*
> + * QEMU Floppy disk emulator (Intel 82078)
> + *
> + * Copyright (c) 2003, 2007 Jocelyn Mayer
> + * Copyright (c) 2008 Hervé Poussineau
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qom/object.h"
> +#include "hw/sysbus.h"
> +#include "hw/block/fdc.h"
> +#include "migration/vmstate.h"
> +#include "fdc-internal.h"
> +#include "trace.h"
> +
> +#define TYPE_SYSBUS_FDC "base-sysbus-fdc"
> +typedef struct FDCtrlSysBusClass FDCtrlSysBusClass;
> +typedef struct FDCtrlSysBus FDCtrlSysBus;
> +DECLARE_OBJ_CHECKERS(FDCtrlSysBus, FDCtrlSysBusClass,
> +                     SYSBUS_FDC, TYPE_SYSBUS_FDC)
> +
> +struct FDCtrlSysBusClass {
> +    /*< private >*/
> +    SysBusDeviceClass parent_class;
> +    /*< public >*/
> +
> +    bool use_strict_io;
> +};
> +
> +struct FDCtrlSysBus {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +
> +    struct FDCtrl state;
> +};
> +
> +static uint64_t fdctrl_read_mem(void *opaque, hwaddr reg, unsigned ize)
> +{
> +    return fdctrl_read(opaque, (uint32_t)reg);
> +}
> +
> +static void fdctrl_write_mem(void *opaque, hwaddr reg,
> +                             uint64_t value, unsigned size)
> +{
> +    fdctrl_write(opaque, (uint32_t)reg, value);
> +}
> +
> +static const MemoryRegionOps fdctrl_mem_ops = {
> +    .read = fdctrl_read_mem,
> +    .write = fdctrl_write_mem,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static const MemoryRegionOps fdctrl_mem_strict_ops = {
> +    .read = fdctrl_read_mem,
> +    .write = fdctrl_write_mem,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 1,
> +    },
> +};
> +
> +static void fdctrl_external_reset_sysbus(DeviceState *d)
> +{
> +    FDCtrlSysBus *sys = SYSBUS_FDC(d);
> +    FDCtrl *s = &sys->state;
> +
> +    fdctrl_reset(s, 0);
> +}
> +
> +static void fdctrl_handle_tc(void *opaque, int irq, int level)
> +{
> +    trace_fdctrl_tc_pulse(level);
> +}
> +
> +void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
> +                        hwaddr mmio_base, DriveInfo **fds)
> +{
> +    FDCtrl *fdctrl;
> +    DeviceState *dev;
> +    SysBusDevice *sbd;
> +    FDCtrlSysBus *sys;
> +
> +    dev = qdev_new("sysbus-fdc");
> +    sys = SYSBUS_FDC(dev);
> +    fdctrl = &sys->state;
> +    fdctrl->dma_chann = dma_chann; /* FIXME */
> +    sbd = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(sbd, &error_fatal);
> +    sysbus_connect_irq(sbd, 0, irq);
> +    sysbus_mmio_map(sbd, 0, mmio_base);
> +
> +    fdctrl_init_drives(&sys->state.bus, fds);
> +}
> +
> +void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
> +                       DriveInfo **fds, qemu_irq *fdc_tc)
> +{
> +    DeviceState *dev;
> +    FDCtrlSysBus *sys;
> +
> +    dev = qdev_new("sun-fdtwo");
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sys = SYSBUS_FDC(dev);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(sys), 0, irq);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(sys), 0, io_base);
> +    *fdc_tc = qdev_get_gpio_in(dev, 0);
> +
> +    fdctrl_init_drives(&sys->state.bus, fds);
> +}
> +
> +static void sysbus_fdc_common_initfn(Object *obj)
> +{
> +    DeviceState *dev = DEVICE(obj);
> +    FDCtrlSysBusClass *sbdc = SYSBUS_FDC_GET_CLASS(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    FDCtrlSysBus *sys = SYSBUS_FDC(obj);
> +    FDCtrl *fdctrl = &sys->state;
> +
> +    fdctrl->dma_chann = -1;
> +
> +    qdev_set_legacy_instance_id(dev, 0 /* io */, 2); /* FIXME */
> +
> +    memory_region_init_io(&fdctrl->iomem, obj,
> +                          sbdc->use_strict_io ? &fdctrl_mem_strict_ops
> +                                              : &fdctrl_mem_ops,
> +                          fdctrl, "fdc", 0x08);
> +    sysbus_init_mmio(sbd, &fdctrl->iomem);
> +
> +    sysbus_init_irq(sbd, &fdctrl->irq);
> +    qdev_init_gpio_in(dev, fdctrl_handle_tc, 1);
> +}
> +
> +static void sysbus_fdc_common_realize(DeviceState *dev, Error **errp)
> +{
> +    FDCtrlSysBus *sys = SYSBUS_FDC(dev);
> +    FDCtrl *fdctrl = &sys->state;
> +
> +    fdctrl_realize_common(dev, fdctrl, errp);
> +}
> +
> +static const VMStateDescription vmstate_sysbus_fdc = {
> +    .name = "fdc",
> +    .version_id = 2,
> +    .minimum_version_id = 2,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_STRUCT(state, FDCtrlSysBus, 0, vmstate_fdc, FDCtrl),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static Property sysbus_fdc_properties[] = {
> +    DEFINE_PROP_SIGNED("fdtypeA", FDCtrlSysBus, state.qdev_for_drives[0].type,
> +                        FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
> +                        FloppyDriveType),
> +    DEFINE_PROP_SIGNED("fdtypeB", FDCtrlSysBus, state.qdev_for_drives[1].type,
> +                        FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
> +                        FloppyDriveType),
> +    DEFINE_PROP_SIGNED("fallback", FDCtrlSysBus, state.fallback,
> +                        FLOPPY_DRIVE_TYPE_144, qdev_prop_fdc_drive_type,
> +                        FloppyDriveType),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void sysbus_fdc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, sysbus_fdc_properties);
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> +}
> +
> +static const TypeInfo sysbus_fdc_info = {
> +    .name          = "sysbus-fdc",
> +    .parent        = TYPE_SYSBUS_FDC,
> +    .class_init    = sysbus_fdc_class_init,
> +};
> +
> +static void sysbus_fdc_common_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = sysbus_fdc_common_realize;
> +    dc->reset = fdctrl_external_reset_sysbus;
> +    dc->vmsd = &vmstate_sysbus_fdc;
> +}
> +
> +static const TypeInfo sysbus_fdc_type_info = {
> +    .name          = TYPE_SYSBUS_FDC,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(FDCtrlSysBus),
> +    .instance_init = sysbus_fdc_common_initfn,
> +    .abstract      = true,
> +    .class_init    = sysbus_fdc_common_class_init,
> +    .class_size    = sizeof(FDCtrlSysBusClass),
> +};
> +
> +static Property sun4m_fdc_properties[] = {
> +    DEFINE_PROP_SIGNED("fdtype", FDCtrlSysBus, state.qdev_for_drives[0].type,
> +                        FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
> +                        FloppyDriveType),
> +    DEFINE_PROP_SIGNED("fallback", FDCtrlSysBus, state.fallback,
> +                        FLOPPY_DRIVE_TYPE_144, qdev_prop_fdc_drive_type,
> +                        FloppyDriveType),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void sun4m_fdc_class_init(ObjectClass *klass, void *data)
> +{
> +    FDCtrlSysBusClass *sbdc = SYSBUS_FDC_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    sbdc->use_strict_io = true;
> +    device_class_set_props(dc, sun4m_fdc_properties);
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> +}
> +
> +static const TypeInfo sun4m_fdc_info = {
> +    .name          = "sun-fdtwo",
> +    .parent        = TYPE_SYSBUS_FDC,
> +    .class_init    = sun4m_fdc_class_init,
> +};
> +
> +static void sysbus_fdc_register_types(void)
> +{
> +    type_register_static(&sun4m_fdc_info);
> +    type_register_static(&sysbus_fdc_type_info);
> +    type_register_static(&sysbus_fdc_info);
> +}
> +
> +type_init(sysbus_fdc_register_types)
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index 50567d972ff..64af4d194ce 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -36,7 +36,6 @@
>   #include "hw/isa/isa.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/qdev-properties-system.h"
> -#include "hw/sysbus.h"
>   #include "migration/vmstate.h"
>   #include "hw/block/block.h"
>   #include "sysemu/block-backend.h"
> @@ -775,17 +774,6 @@ static FloppyDriveType get_fallback_drive_type(FDrive *drv)
>       return drv->fdctrl->fallback;
>   }
>   
> -#define TYPE_SYSBUS_FDC "base-sysbus-fdc"
> -OBJECT_DECLARE_SIMPLE_TYPE(FDCtrlSysBus, SYSBUS_FDC)
> -
> -struct FDCtrlSysBus {
> -    /*< private >*/
> -    SysBusDevice parent_obj;
> -    /*< public >*/
> -
> -    struct FDCtrl state;
> -};
> -
>   uint32_t fdctrl_read(void *opaque, uint32_t reg)
>   {
>       FDCtrl *fdctrl = opaque;
> @@ -850,34 +838,6 @@ void fdctrl_write(void *opaque, uint32_t reg, uint32_t value)
>       }
>   }
>   
> -static uint64_t fdctrl_read_mem (void *opaque, hwaddr reg,
> -                                 unsigned ize)
> -{
> -    return fdctrl_read(opaque, (uint32_t)reg);
> -}
> -
> -static void fdctrl_write_mem (void *opaque, hwaddr reg,
> -                              uint64_t value, unsigned size)
> -{
> -    fdctrl_write(opaque, (uint32_t)reg, value);
> -}
> -
> -static const MemoryRegionOps fdctrl_mem_ops = {
> -    .read = fdctrl_read_mem,
> -    .write = fdctrl_write_mem,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> -};
> -
> -static const MemoryRegionOps fdctrl_mem_strict_ops = {
> -    .read = fdctrl_read_mem,
> -    .write = fdctrl_write_mem,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> -    .valid = {
> -        .min_access_size = 1,
> -        .max_access_size = 1,
> -    },
> -};
> -
>   static bool fdrive_media_changed_needed(void *opaque)
>   {
>       FDrive *drive = opaque;
> @@ -1101,19 +1061,6 @@ const VMStateDescription vmstate_fdc = {
>       }
>   };
>   
> -static void fdctrl_external_reset_sysbus(DeviceState *d)
> -{
> -    FDCtrlSysBus *sys = SYSBUS_FDC(d);
> -    FDCtrl *s = &sys->state;
> -
> -    fdctrl_reset(s, 0);
> -}
> -
> -static void fdctrl_handle_tc(void *opaque, int irq, int level)
> -{
> -    trace_fdctrl_tc_pulse(level);
> -}
> -
>   /* Change IRQ state */
>   static void fdctrl_reset_irq(FDCtrl *fdctrl)
>   {
> @@ -2370,42 +2317,6 @@ void fdctrl_init_drives(FloppyBus *bus, DriveInfo **fds)
>       }
>   }
>   
> -void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
> -                        hwaddr mmio_base, DriveInfo **fds)
> -{
> -    FDCtrl *fdctrl;
> -    DeviceState *dev;
> -    SysBusDevice *sbd;
> -    FDCtrlSysBus *sys;
> -
> -    dev = qdev_new("sysbus-fdc");
> -    sys = SYSBUS_FDC(dev);
> -    fdctrl = &sys->state;
> -    fdctrl->dma_chann = dma_chann; /* FIXME */
> -    sbd = SYS_BUS_DEVICE(dev);
> -    sysbus_realize_and_unref(sbd, &error_fatal);
> -    sysbus_connect_irq(sbd, 0, irq);
> -    sysbus_mmio_map(sbd, 0, mmio_base);
> -
> -    fdctrl_init_drives(&sys->state.bus, fds);
> -}
> -
> -void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
> -                       DriveInfo **fds, qemu_irq *fdc_tc)
> -{
> -    DeviceState *dev;
> -    FDCtrlSysBus *sys;
> -
> -    dev = qdev_new("sun-fdtwo");
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -    sys = SYSBUS_FDC(dev);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(sys), 0, irq);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(sys), 0, io_base);
> -    *fdc_tc = qdev_get_gpio_in(dev, 0);
> -
> -    fdctrl_init_drives(&sys->state.bus, fds);
> -}
> -
>   void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl, Error **errp)
>   {
>       int i, j;
> @@ -2458,139 +2369,8 @@ void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl, Error **errp)
>       }
>   }
>   
> -static void sysbus_fdc_initfn(Object *obj)
> -{
> -    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> -    FDCtrlSysBus *sys = SYSBUS_FDC(obj);
> -    FDCtrl *fdctrl = &sys->state;
> -
> -    fdctrl->dma_chann = -1;
> -
> -    memory_region_init_io(&fdctrl->iomem, obj, &fdctrl_mem_ops, fdctrl,
> -                          "fdc", 0x08);
> -    sysbus_init_mmio(sbd, &fdctrl->iomem);
> -}
> -
> -static void sun4m_fdc_initfn(Object *obj)
> -{
> -    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> -    FDCtrlSysBus *sys = SYSBUS_FDC(obj);
> -    FDCtrl *fdctrl = &sys->state;
> -
> -    fdctrl->dma_chann = -1;
> -
> -    memory_region_init_io(&fdctrl->iomem, obj, &fdctrl_mem_strict_ops,
> -                          fdctrl, "fdctrl", 0x08);
> -    sysbus_init_mmio(sbd, &fdctrl->iomem);
> -}
> -
> -static void sysbus_fdc_common_initfn(Object *obj)
> -{
> -    DeviceState *dev = DEVICE(obj);
> -    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> -    FDCtrlSysBus *sys = SYSBUS_FDC(obj);
> -    FDCtrl *fdctrl = &sys->state;
> -
> -    qdev_set_legacy_instance_id(dev, 0 /* io */, 2); /* FIXME */
> -
> -    sysbus_init_irq(sbd, &fdctrl->irq);
> -    qdev_init_gpio_in(dev, fdctrl_handle_tc, 1);
> -}
> -
> -static void sysbus_fdc_common_realize(DeviceState *dev, Error **errp)
> -{
> -    FDCtrlSysBus *sys = SYSBUS_FDC(dev);
> -    FDCtrl *fdctrl = &sys->state;
> -
> -    fdctrl_realize_common(dev, fdctrl, errp);
> -}
> -
> -static const VMStateDescription vmstate_sysbus_fdc ={
> -    .name = "fdc",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> -    .fields = (VMStateField[]) {
> -        VMSTATE_STRUCT(state, FDCtrlSysBus, 0, vmstate_fdc, FDCtrl),
> -        VMSTATE_END_OF_LIST()
> -    }
> -};
> -
> -static Property sysbus_fdc_properties[] = {
> -    DEFINE_PROP_SIGNED("fdtypeA", FDCtrlSysBus, state.qdev_for_drives[0].type,
> -                        FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
> -                        FloppyDriveType),
> -    DEFINE_PROP_SIGNED("fdtypeB", FDCtrlSysBus, state.qdev_for_drives[1].type,
> -                        FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
> -                        FloppyDriveType),
> -    DEFINE_PROP_SIGNED("fallback", FDCtrlSysBus, state.fallback,
> -                        FLOPPY_DRIVE_TYPE_144, qdev_prop_fdc_drive_type,
> -                        FloppyDriveType),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
> -static void sysbus_fdc_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -
> -    device_class_set_props(dc, sysbus_fdc_properties);
> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> -}
> -
> -static const TypeInfo sysbus_fdc_info = {
> -    .name          = "sysbus-fdc",
> -    .parent        = TYPE_SYSBUS_FDC,
> -    .instance_init = sysbus_fdc_initfn,
> -    .class_init    = sysbus_fdc_class_init,
> -};
> -
> -static Property sun4m_fdc_properties[] = {
> -    DEFINE_PROP_SIGNED("fdtype", FDCtrlSysBus, state.qdev_for_drives[0].type,
> -                        FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
> -                        FloppyDriveType),
> -    DEFINE_PROP_SIGNED("fallback", FDCtrlSysBus, state.fallback,
> -                        FLOPPY_DRIVE_TYPE_144, qdev_prop_fdc_drive_type,
> -                        FloppyDriveType),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
> -static void sun4m_fdc_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -
> -    device_class_set_props(dc, sun4m_fdc_properties);
> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> -}
> -
> -static const TypeInfo sun4m_fdc_info = {
> -    .name          = "sun-fdtwo",
> -    .parent        = TYPE_SYSBUS_FDC,
> -    .instance_init = sun4m_fdc_initfn,
> -    .class_init    = sun4m_fdc_class_init,
> -};
> -
> -static void sysbus_fdc_common_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -
> -    dc->realize = sysbus_fdc_common_realize;
> -    dc->reset = fdctrl_external_reset_sysbus;
> -    dc->vmsd = &vmstate_sysbus_fdc;
> -}
> -
> -static const TypeInfo sysbus_fdc_type_info = {
> -    .name          = TYPE_SYSBUS_FDC,
> -    .parent        = TYPE_SYS_BUS_DEVICE,
> -    .instance_size = sizeof(FDCtrlSysBus),
> -    .instance_init = sysbus_fdc_common_initfn,
> -    .abstract      = true,
> -    .class_init    = sysbus_fdc_common_class_init,
> -};
> -
>   static void fdc_register_types(void)
>   {
> -    type_register_static(&sysbus_fdc_type_info);
> -    type_register_static(&sysbus_fdc_info);
> -    type_register_static(&sun4m_fdc_info);
>       type_register_static(&floppy_bus_info);
>       type_register_static(&floppy_drive_info);
>   }
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e7ed334f586..0a908c22103 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1678,6 +1678,7 @@ S: Supported
>   F: hw/block/fdc.c
>   F: hw/block/fdc-internal.h
>   F: hw/block/fdc-isa.c
> +F: hw/block/fdc-sysbus.c
>   F: include/hw/block/fdc.h
>   F: tests/qtest/fdc-test.c
>   T: git https://gitlab.com/jsnow/qemu.git ide
> diff --git a/hw/block/Kconfig b/hw/block/Kconfig
> index 0a2c046fa6c..d50be837666 100644
> --- a/hw/block/Kconfig
> +++ b/hw/block/Kconfig
> @@ -8,6 +8,10 @@ config FDC_ISA
>       # select ISA_BUS here instead of polluting each board that requires one
>       select ISA_BUS
>   
> +config FDC_SYSBUS
> +    bool
> +    select FDC
> +
>   config SSI_M25P80
>       bool
>   
> diff --git a/hw/block/meson.build b/hw/block/meson.build
> index f33a665c945..c3935350485 100644
> --- a/hw/block/meson.build
> +++ b/hw/block/meson.build
> @@ -6,6 +6,7 @@
>   softmmu_ss.add(when: 'CONFIG_ECC', if_true: files('ecc.c'))
>   softmmu_ss.add(when: 'CONFIG_FDC', if_true: files('fdc.c'))
>   softmmu_ss.add(when: 'CONFIG_FDC_ISA', if_true: files('fdc-isa.c'))
> +softmmu_ss.add(when: 'CONFIG_FDC_SYSBUS', if_true: files('fdc-sysbus.c'))
>   softmmu_ss.add(when: 'CONFIG_NAND', if_true: files('nand.c'))
>   softmmu_ss.add(when: 'CONFIG_ONENAND', if_true: files('onenand.c'))
>   softmmu_ss.add(when: 'CONFIG_PFLASH_CFI01', if_true: files('pflash_cfi01.c'))
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index 306989c193c..266b34393a3 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -3,6 +3,8 @@
>   # fdc.c
>   fdc_ioport_read(uint8_t reg, uint8_t value) "read reg 0x%02x val 0x%02x"
>   fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
> +
> +# fdc-sysbus.c
>   fdctrl_tc_pulse(int level) "TC pulse: %u"
>   
>   # pflash_cfi01.c
> diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
> index aadd436bf4e..c245e881a2b 100644
> --- a/hw/mips/Kconfig
> +++ b/hw/mips/Kconfig
> @@ -20,7 +20,7 @@ config JAZZ
>       select G364FB
>       select DP8393X
>       select ESP
> -    select FDC
> +    select FDC_SYSBUS
>       select MC146818RTC
>       select PCKBD
>       select SERIAL
> diff --git a/hw/sparc/Kconfig b/hw/sparc/Kconfig
> index 8dcb10086fd..79d58beb7a6 100644
> --- a/hw/sparc/Kconfig
> +++ b/hw/sparc/Kconfig
> @@ -8,7 +8,7 @@ config SUN4M
>       select UNIMP
>       select ESCC
>       select ESP
> -    select FDC
> +    select FDC_SYSBUS
>       select SLAVIO
>       select LANCE
>       select M48T59
> 



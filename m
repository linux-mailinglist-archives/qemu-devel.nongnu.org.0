Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BC04C28B5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:58:58 +0100 (CET)
Received: from localhost ([::1]:41638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNAtl-00006s-4k
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:58:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNAqn-0006gL-90
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:55:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNAqM-0004Jr-1d
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:55:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645696525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7FlmMqlDyNKAyWsOUWutCQGqfGIH7SxZ/MVYcMGWmY=;
 b=fL5YzukpaDtgyEJT1XMBL+3vBiDOOcKviiLFQjb8bl+BG75BR9oe9JXinWVo+8lwEcoAtM
 +w8ii/pRAR8r3aJcu9N/0ljGaeFg+9xknD5Rts86iMoalIJeJF/H+HBgfEW+HZ1HDIo6Ea
 UPWOq6NRG/5bA9a1NZSqHPTD8bWUNAA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-9pa0nyi6MGaPufNGfkv7Ng-1; Thu, 24 Feb 2022 04:55:24 -0500
X-MC-Unique: 9pa0nyi6MGaPufNGfkv7Ng-1
Received: by mail-wm1-f72.google.com with SMTP id
 v125-20020a1cac83000000b0037e3d70e7e1so2470422wme.1
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 01:55:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b7FlmMqlDyNKAyWsOUWutCQGqfGIH7SxZ/MVYcMGWmY=;
 b=CAjGuSveesSVOKKj61+i4UTWuEdKckcbDAQ/amW9m8xDUVdO24ttItIc9TtRqOLu0r
 7fzY1y7fRIKCw2oDg9wV5u5hQHb9Dr0RCVNRgTjCIN9deKKv8xJH552NlqjhQ1hEuh50
 7jS23riaOZk1ZlYYHHl9xDUhP6geaO3sTWdeHGh7w1dZnaPBfTvuKNWHynle31FZrg0v
 6NVRXd5nIsx2GMcMRkhQ7r8WVZy/b1xO3kEsej9rNWhs6JkWhQ0IxJBR6Ka75GZxzxO5
 ybjKqZpz/xSEYoWMweaIK2rxo3g4yc+2fgmCTJlCKxjWJaJJ5SzWIfQazkhA5PTf9ndI
 NqUg==
X-Gm-Message-State: AOAM530oCLNpetXpWuHwDtyZwQHp2hVgALIhuJX5KcSRIST2eQWhtl3z
 bMbf0wmFZQeToJuIbtyl4KnmIDriVNkbs2xPUPUXt1pzDaWolkgSRr+GRiLtYvv17TJJiD+Rgbw
 ml3ARTK5Owh7eSug=
X-Received: by 2002:a5d:64c6:0:b0:1e8:ee04:e8fb with SMTP id
 f6-20020a5d64c6000000b001e8ee04e8fbmr1564231wri.518.1645696522835; 
 Thu, 24 Feb 2022 01:55:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2S/l3c5lxpDRnCA1V90nzWPDw1+b+wCG9rAB8NIzXY1mfsGQT4tBT0/voSzpgiCfxsvN07A==
X-Received: by 2002:a5d:64c6:0:b0:1e8:ee04:e8fb with SMTP id
 f6-20020a5d64c6000000b001e8ee04e8fbmr1564210wri.518.1645696522491; 
 Thu, 24 Feb 2022 01:55:22 -0800 (PST)
Received: from localhost (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id b14sm191087wrj.101.2022.02.24.01.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 01:55:22 -0800 (PST)
Date: Thu, 24 Feb 2022 10:55:21 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v4 13/14] hw/mem/system-memory: add a memory sysbus device
Message-ID: <20220224105521.1b760212@redhat.com>
In-Reply-To: <9d0cfe90-01bc-6008-664f-74bdaa9c145c@greensocs.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-14-damien.hedde@greensocs.com>
 <20220223104450.196e9624@redhat.com>
 <9d0cfe90-01bc-6008-664f-74bdaa9c145c@greensocs.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, edgari@xilinx.com, mark.burton@greensocs.com,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Feb 2022 11:19:49 +0100
Damien Hedde <damien.hedde@greensocs.com> wrote:

> On 2/23/22 10:44, Igor Mammedov wrote:
> > On Wed, 23 Feb 2022 10:07:05 +0100
> > Damien Hedde <damien.hedde@greensocs.com> wrote:
> >   
> >> This device can be used to create a memory wrapped into a
> >> sysbus device.
> >> This device has one property 'readonly' which allows
> >> to choose between a ram or a rom.
> >>  
> >   
> >> The purpose for this device is to be used with qapi command
> >> device_add.  
> > that's the way to add a device to QEMU but a don't actual
> > purpose described here, i.e. how board will use this
> > device/actual usecase and how it will be wired to board
> > and why it does have to be a sysbus device.
> >   
> Sorry, this was unclear.
> 
> It is a sysbus device in order to use it like any other sysbus device. 
> The memory region it contains is exposed as a sysbus mmio.

aside of that sysbus is legacy fictional bus (albeit widely used),
it doesn't scale to non sysbus devices (me thinking about buss-less
pc-dimm & co) since eventually we would like to create mainstream
machine types via QMP as well.

> I can replace the commit message by the following paragraph:
> 
> Boards instantiate memories by creating memory region objects which is 
> not possible using QAPI commands.

That's not entirely true, you can use object-add with hostmem backends
which do provide a means to allocate memory_region.
(there is no rom hostmem backend probably (i.e. one that return rom memory region)
but that could be added).
Another benefit of approach is that one can replace backing
memory any other backend (file/memfd/pmem...) without affecting
device model.

> To create a memory, the user can instantiate and map this device by 
> issuing the following commands:
> device_add driver=sysbus-memory size=0x1000 id=someram
> sysbus-mmio-map device=someram addr=0

I'd imagine more generic approach would look like:

object-add memory-backend-ram,id=mem1,size=0x1000,other_backend_twiks
device_add memdevice_frontend,memdev=mem1,addr=0x0

where [pre]plug hooks in machine can map device to
an appropriate address space/place at device realize time.
(see memory_device_[pre_]plug() for starters).


> >> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> >> ---
> >>   include/hw/mem/sysbus-memory.h | 28 ++++++++++++
> >>   hw/mem/sysbus-memory.c         | 80 ++++++++++++++++++++++++++++++++++
> >>   hw/mem/meson.build             |  2 +
> >>   3 files changed, 110 insertions(+)
> >>   create mode 100644 include/hw/mem/sysbus-memory.h
> >>   create mode 100644 hw/mem/sysbus-memory.c
> >>
> >> diff --git a/include/hw/mem/sysbus-memory.h b/include/hw/mem/sysbus-memory.h
> >> new file mode 100644
> >> index 0000000000..5c596f8b4f
> >> --- /dev/null
> >> +++ b/include/hw/mem/sysbus-memory.h
> >> @@ -0,0 +1,28 @@
> >> +/*
> >> + * SPDX-License-Identifier: GPL-2.0-or-later
> >> + *
> >> + * SysBusDevice Memory
> >> + *
> >> + * Copyright (c) 2021 Greensocs
> >> + */
> >> +
> >> +#ifndef HW_SYSBUS_MEMORY_H
> >> +#define HW_SYSBUS_MEMORY_H
> >> +
> >> +#include "hw/sysbus.h"
> >> +#include "qom/object.h"
> >> +
> >> +#define TYPE_SYSBUS_MEMORY "sysbus-memory"
> >> +OBJECT_DECLARE_SIMPLE_TYPE(SysBusMemoryState, SYSBUS_MEMORY)
> >> +
> >> +struct SysBusMemoryState {
> >> +    /* <private> */
> >> +    SysBusDevice parent_obj;
> >> +    uint64_t size;
> >> +    bool readonly;
> >> +
> >> +    /* <public> */
> >> +    MemoryRegion mem;
> >> +};
> >> +
> >> +#endif /* HW_SYSBUS_MEMORY_H */
> >> diff --git a/hw/mem/sysbus-memory.c b/hw/mem/sysbus-memory.c
> >> new file mode 100644
> >> index 0000000000..f1ad7ba7ec
> >> --- /dev/null
> >> +++ b/hw/mem/sysbus-memory.c
> >> @@ -0,0 +1,80 @@
> >> +/*
> >> + * SPDX-License-Identifier: GPL-2.0-or-later
> >> + *
> >> + * SysBusDevice Memory
> >> + *
> >> + * Copyright (c) 2021 Greensocs
> >> + */
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include "hw/mem/sysbus-memory.h"
> >> +#include "hw/qdev-properties.h"
> >> +#include "qemu/log.h"
> >> +#include "qemu/module.h"
> >> +#include "qapi/error.h"
> >> +
> >> +static Property sysbus_memory_properties[] = {
> >> +    DEFINE_PROP_UINT64("size", SysBusMemoryState, size, 0),
> >> +    DEFINE_PROP_BOOL("readonly", SysBusMemoryState, readonly, false),
> >> +    DEFINE_PROP_END_OF_LIST(),
> >> +};
> >> +
> >> +static void sysbus_memory_realize(DeviceState *dev, Error **errp)
> >> +{
> >> +    SysBusMemoryState *s = SYSBUS_MEMORY(dev);
> >> +    gchar *name;
> >> +
> >> +    if (!s->size) {
> >> +        error_setg(errp, "'size' must be non-zero.");
> >> +        return;
> >> +    }
> >> +
> >> +    /*
> >> +     * We impose having an id (which is unique) because we need to generate
> >> +     * a unique name for the memory region.
> >> +     * memory_region_init_ram/rom() will abort() (in qemu_ram_set_idstr()
> >> +     * function if 2 system-memory devices are created with the same name
> >> +     * for the memory region).
> >> +     */
> >> +    if (!dev->id) {
> >> +        error_setg(errp, "system-memory device must have an id.");
> >> +        return;
> >> +    }
> >> +    name = g_strdup_printf("%s.region", dev->id);
> >> +
> >> +    if (s->readonly) {
> >> +        memory_region_init_rom(&s->mem, OBJECT(dev), name, s->size, errp);
> >> +    } else {
> >> +        memory_region_init_ram(&s->mem, OBJECT(dev), name, s->size, errp);
> >> +    }
> >> +
> >> +    g_free(name);
> >> +    if (*errp) {
> >> +        return;
> >> +    }
> >> +
> >> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mem);
> >> +}
> >> +
> >> +static void sysbus_memory_class_init(ObjectClass *klass, void *data)
> >> +{
> >> +    DeviceClass *dc = DEVICE_CLASS(klass);
> >> +
> >> +    dc->user_creatable = true;
> >> +    dc->realize = sysbus_memory_realize;
> >> +    device_class_set_props(dc, sysbus_memory_properties);
> >> +}
> >> +
> >> +static const TypeInfo sysbus_memory_info = {
> >> +    .name          = TYPE_SYSBUS_MEMORY,
> >> +    .parent        = TYPE_SYS_BUS_DEVICE,
> >> +    .instance_size = sizeof(SysBusMemoryState),
> >> +    .class_init    = sysbus_memory_class_init,
> >> +};
> >> +
> >> +static void sysbus_memory_register_types(void)
> >> +{
> >> +    type_register_static(&sysbus_memory_info);
> >> +}
> >> +
> >> +type_init(sysbus_memory_register_types)
> >> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> >> index 82f86d117e..04c74e12f2 100644
> >> --- a/hw/mem/meson.build
> >> +++ b/hw/mem/meson.build
> >> @@ -7,3 +7,5 @@ mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
> >>   softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
> >>   
> >>   softmmu_ss.add(when: 'CONFIG_SPARSE_MEM', if_true: files('sparse-mem.c'))
> >> +
> >> +softmmu_ss.add(files('sysbus-memory.c'))  
> >   
> 



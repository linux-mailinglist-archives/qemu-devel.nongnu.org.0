Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70814C1038
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:24:07 +0100 (CET)
Received: from localhost ([::1]:60676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMooY-00084f-Np
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:24:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nMoCr-0006uo-OX
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:45:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nMoCo-0007q7-Le
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645609494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CZEsVQTjGVcWgO2yzRpOockBtzT8lD8g3H6BKZURs+I=;
 b=h9pdlxjLh2cLC81BU1HYiPsLSwNfK0OhSUMZhaPZJnJNeqvVaWsBQOZaGlOucs64ZFogDZ
 +n8c5zT5CDYUNyDx1Vao9U0/9XwUGuqVrIIxOUY3lDn5aIMYdH+JLmrsCrWLdqiTr7uzS8
 SBAG9eecLCLB4iMfpvah+6oVFoJYmm4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-vtmmVQBuNw2XPe1I5vyMsQ-1; Wed, 23 Feb 2022 04:44:53 -0500
X-MC-Unique: vtmmVQBuNw2XPe1I5vyMsQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 i20-20020a17090671d400b006d0ed9c68c1so3604338ejk.14
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CZEsVQTjGVcWgO2yzRpOockBtzT8lD8g3H6BKZURs+I=;
 b=kRwGrQEHzZ2IV+7vZdI5hf8eYhX+FlA7/wAeZwLXx3v5IiK0vHtqQ0Jilpi0wYPxAn
 HUTPwDDh83JSuJ7jOr8krRnXmkwWmbkA3JFZ6E+JiM8BzwCmkSpFyC+AP9IimDyCic46
 zhFV1qXfWGMqBG43/c69mSJrJ+wdJPScCbDV1vRyYqvOsXD9Xcf2/VvLlWwl6ZCHLoDO
 5XuTZ9TRexN6/WksltEm276Y6w8jkwlXLUrwoQEYHTcx7TBzQbz6d51ypYkZ0HKfBJHP
 xsrCRDG8tPBEUbywAPzMC7MBq9xrgy0jPhddHrKaXeHTeYl9awTf/K6JUVm4DXo+Nxj6
 ln7Q==
X-Gm-Message-State: AOAM5334QwqETqgZNDMoIemUU+um3F/EtX2qXSvv/qJZH8YYEAkXDWP5
 8PYFiVmJ2awthQ+bgC2eyGhsfPq6ZG9LU1q7TsTqaYIpBJGhAAlsmenUpjpkSBL18Ibox19c/Eg
 r4Zt0eh8IkifhkVY=
X-Received: by 2002:a05:6402:38e:b0:410:c1a9:60aa with SMTP id
 o14-20020a056402038e00b00410c1a960aamr30917101edv.336.1645609492184; 
 Wed, 23 Feb 2022 01:44:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIF44xu8NLhAlGrJDMKeY/uH0PLxJpRBUG2lOHDmLNOZJzzbdtAOWk4UtUJni8AmkcyHzTRw==
X-Received: by 2002:a05:6402:38e:b0:410:c1a9:60aa with SMTP id
 o14-20020a056402038e00b00410c1a960aamr30917091edv.336.1645609491989; 
 Wed, 23 Feb 2022 01:44:51 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id ay16sm4607287ejb.61.2022.02.23.01.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 01:44:51 -0800 (PST)
Date: Wed, 23 Feb 2022 10:44:50 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v4 13/14] hw/mem/system-memory: add a memory sysbus device
Message-ID: <20220223104450.196e9624@redhat.com>
In-Reply-To: <20220223090706.4888-14-damien.hedde@greensocs.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-14-damien.hedde@greensocs.com>
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

On Wed, 23 Feb 2022 10:07:05 +0100
Damien Hedde <damien.hedde@greensocs.com> wrote:

> This device can be used to create a memory wrapped into a
> sysbus device.
> This device has one property 'readonly' which allows
> to choose between a ram or a rom.
> 

> The purpose for this device is to be used with qapi command
> device_add.
that's the way to add a device to QEMU but a don't actual
purpose described here, i.e. how board will use this
device/actual usecase and how it will be wired to board
and why it does have to be a sysbus device.

> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  include/hw/mem/sysbus-memory.h | 28 ++++++++++++
>  hw/mem/sysbus-memory.c         | 80 ++++++++++++++++++++++++++++++++++
>  hw/mem/meson.build             |  2 +
>  3 files changed, 110 insertions(+)
>  create mode 100644 include/hw/mem/sysbus-memory.h
>  create mode 100644 hw/mem/sysbus-memory.c
> 
> diff --git a/include/hw/mem/sysbus-memory.h b/include/hw/mem/sysbus-memory.h
> new file mode 100644
> index 0000000000..5c596f8b4f
> --- /dev/null
> +++ b/include/hw/mem/sysbus-memory.h
> @@ -0,0 +1,28 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * SysBusDevice Memory
> + *
> + * Copyright (c) 2021 Greensocs
> + */
> +
> +#ifndef HW_SYSBUS_MEMORY_H
> +#define HW_SYSBUS_MEMORY_H
> +
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +
> +#define TYPE_SYSBUS_MEMORY "sysbus-memory"
> +OBJECT_DECLARE_SIMPLE_TYPE(SysBusMemoryState, SYSBUS_MEMORY)
> +
> +struct SysBusMemoryState {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +    uint64_t size;
> +    bool readonly;
> +
> +    /* <public> */
> +    MemoryRegion mem;
> +};
> +
> +#endif /* HW_SYSBUS_MEMORY_H */
> diff --git a/hw/mem/sysbus-memory.c b/hw/mem/sysbus-memory.c
> new file mode 100644
> index 0000000000..f1ad7ba7ec
> --- /dev/null
> +++ b/hw/mem/sysbus-memory.c
> @@ -0,0 +1,80 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * SysBusDevice Memory
> + *
> + * Copyright (c) 2021 Greensocs
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/mem/sysbus-memory.h"
> +#include "hw/qdev-properties.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qapi/error.h"
> +
> +static Property sysbus_memory_properties[] = {
> +    DEFINE_PROP_UINT64("size", SysBusMemoryState, size, 0),
> +    DEFINE_PROP_BOOL("readonly", SysBusMemoryState, readonly, false),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void sysbus_memory_realize(DeviceState *dev, Error **errp)
> +{
> +    SysBusMemoryState *s = SYSBUS_MEMORY(dev);
> +    gchar *name;
> +
> +    if (!s->size) {
> +        error_setg(errp, "'size' must be non-zero.");
> +        return;
> +    }
> +
> +    /*
> +     * We impose having an id (which is unique) because we need to generate
> +     * a unique name for the memory region.
> +     * memory_region_init_ram/rom() will abort() (in qemu_ram_set_idstr()
> +     * function if 2 system-memory devices are created with the same name
> +     * for the memory region).
> +     */
> +    if (!dev->id) {
> +        error_setg(errp, "system-memory device must have an id.");
> +        return;
> +    }
> +    name = g_strdup_printf("%s.region", dev->id);
> +
> +    if (s->readonly) {
> +        memory_region_init_rom(&s->mem, OBJECT(dev), name, s->size, errp);
> +    } else {
> +        memory_region_init_ram(&s->mem, OBJECT(dev), name, s->size, errp);
> +    }
> +
> +    g_free(name);
> +    if (*errp) {
> +        return;
> +    }
> +
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mem);
> +}
> +
> +static void sysbus_memory_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->user_creatable = true;
> +    dc->realize = sysbus_memory_realize;
> +    device_class_set_props(dc, sysbus_memory_properties);
> +}
> +
> +static const TypeInfo sysbus_memory_info = {
> +    .name          = TYPE_SYSBUS_MEMORY,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(SysBusMemoryState),
> +    .class_init    = sysbus_memory_class_init,
> +};
> +
> +static void sysbus_memory_register_types(void)
> +{
> +    type_register_static(&sysbus_memory_info);
> +}
> +
> +type_init(sysbus_memory_register_types)
> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> index 82f86d117e..04c74e12f2 100644
> --- a/hw/mem/meson.build
> +++ b/hw/mem/meson.build
> @@ -7,3 +7,5 @@ mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
>  softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
>  
>  softmmu_ss.add(when: 'CONFIG_SPARSE_MEM', if_true: files('sparse-mem.c'))
> +
> +softmmu_ss.add(files('sysbus-memory.c'))



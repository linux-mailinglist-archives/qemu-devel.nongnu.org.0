Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2335A4576B7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:50:58 +0100 (CET)
Received: from localhost ([::1]:55776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8yN-0000vb-SA
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:50:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mo8oG-0001pu-MG
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:40:28 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:54410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mo8oD-0004ag-Ow
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:40:28 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5EB07746353;
 Fri, 19 Nov 2021 19:40:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2FD64746333; Fri, 19 Nov 2021 19:40:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2DD507462D3;
 Fri, 19 Nov 2021 19:40:23 +0100 (CET)
Date: Fri, 19 Nov 2021 19:40:23 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-7.0 3/5] hw/display/vga-mmio: QOM'ify vga_mmio_init()
 as TYPE_VGA_MMIO
In-Reply-To: <20211119171202.458919-4-f4bug@amsat.org>
Message-ID: <b1e9c418-e119-409e-10c1-c5eb56f812ec@eik.bme.hu>
References: <20211119171202.458919-1-f4bug@amsat.org>
 <20211119171202.458919-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-112189302-1637347223=:35384"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-112189302-1637347223=:35384
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 19 Nov 2021, Philippe Mathieu-Daudé wrote:
> Introduce TYPE_VGA_MMIO, a sysbus device.
>
> While there is no change in the vga_mmio_init()
> interface, this is a migration compatibility break
> of the MIPS Acer Pica 61 Jazz machine (pica61).
>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/display/vga-mmio.c | 134 +++++++++++++++++++++++++++++-------------
> 1 file changed, 94 insertions(+), 40 deletions(-)
>
> diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
> index 0aefbcf53a0..d1c5f31c134 100644
> --- a/hw/display/vga-mmio.c
> +++ b/hw/display/vga-mmio.c
> @@ -2,6 +2,7 @@
>  * QEMU MMIO VGA Emulator.
>  *
>  * Copyright (c) 2003 Fabrice Bellard
> + * Copyright (c) 2021 Philippe Mathieu-Daudé

I think it's OK to add copyright line to record who's to blame if you 
change or rewrite significant parts of a file. In this case just 
QOM-ifying it may not be large enough change for me to add my copyright if 
I were doing this. I don't mind, just thought git blame in this case might 
be enough unless of course you want to also take maintainership of the 
file. :-)

>  *
>  * Permission is hereby granted, free of charge, to any person obtaining a copy
>  * of this software and associated documentation files (the "Software"), to deal
> @@ -23,21 +24,34 @@
>  */
>
> #include "qemu/osdep.h"
> -#include "qemu/bitops.h"
> -#include "qemu/units.h"
> -#include "migration/vmstate.h"
> +#include "qapi/error.h"
> #include "hw/display/vga.h"
> +#include "hw/sysbus.h"
> +#include "hw/qdev-properties.h"
> #include "vga_int.h"
> -#include "ui/pixel_ops.h"
>
> -#define VGA_RAM_SIZE (8 * MiB)
> +/*
> + * QEMU interface:
> + *  + sysbus MMIO region 0: VGA I/O registers
> + *  + sysbus MMIO region 1: VGA MMIO registers
> + *  + sysbus MMIO region 2: VGA memory
> + */
>
> -typedef struct VGAMmioState {
> +#define TYPE_VGA_MMIO "vga-mmio"
> +OBJECT_DECLARE_SIMPLE_TYPE(VGAMmioState, VGA_MMIO)
> +
> +struct VGAMmioState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
>     VGACommonState vga;
> -    int it_shift;
> -} VGAMmioState;
> +    MemoryRegion iomem;
> +    MemoryRegion lowmem;
> +
> +    uint8_t it_shift;
> +};
>
> -/* Memory mapped interface */
> static uint64_t vga_mm_read(void *opaque, hwaddr addr, unsigned size)
> {
>     VGAMmioState *s = opaque;
> @@ -65,43 +79,83 @@ static const MemoryRegionOps vga_mm_ctrl_ops = {
>     .endianness = DEVICE_NATIVE_ENDIAN,
> };
>
> +static void vga_mmio_reset(DeviceState *dev)
> +{
> +    VGAMmioState *d = VGA_MMIO(dev);
> +    VGACommonState *s = &d->vga;
> +
> +    vga_common_reset(s);

Maybe there's no need for separate variable s here as it's only used once, 
you could just as well write vga_common_reset(&d->vga).

> +}
> +
> int vga_mmio_init(hwaddr vram_base,
>                     hwaddr ctrl_base, int it_shift,
>                     MemoryRegion *address_space)
> {
> -    VGAMmioState *s;
> -    MemoryRegion *s_ioport_ctrl, *vga_io_memory;
> +    DeviceState *dev;
> +    SysBusDevice *s;
>
> -    s = g_malloc0(sizeof(*s));
> +    dev = qdev_new(TYPE_VGA_MMIO);
> +    qdev_prop_set_uint8(dev, "it_shift", it_shift);
> +    s = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(s, &error_fatal);
>
> -    s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
> -    s->vga.global_vmstate = true;
> -    vga_common_init(&s->vga, NULL);
> -
> -    s->it_shift = it_shift;
> -    s_ioport_ctrl = g_malloc(sizeof(*s_ioport_ctrl));
> -    memory_region_init_io(s_ioport_ctrl, NULL, &vga_mm_ctrl_ops, s,
> -                          "vga-mm-ctrl", 0x100000);
> -    memory_region_set_flush_coalesced(s_ioport_ctrl);
> -
> -    vga_io_memory = g_malloc(sizeof(*vga_io_memory));
> -    /* XXX: endianness? */
> -    memory_region_init_io(vga_io_memory, NULL, &vga_mem_ops, &s->vga,
> -                          "vga-mem", 0x20000);
> -
> -    vmstate_register(NULL, 0, &vmstate_vga_common, s);
> -
> -    memory_region_add_subregion(address_space, ctrl_base, s_ioport_ctrl);
> -    s->vga.bank_offset = 0;
> -    memory_region_add_subregion(address_space,
> -                                vram_base + 0x000a0000, vga_io_memory);
> -    memory_region_set_coalescing(vga_io_memory);
> -
> -    s->vga.con = graphic_console_init(NULL, 0, s->vga.hw_ops, s);
> -
> -    memory_region_add_subregion(address_space,
> -                                VBE_DISPI_LFB_PHYSICAL_ADDRESS,
> -                                &s->vga.vram);
> +    sysbus_mmio_map(s, 0, ctrl_base);
> +    sysbus_mmio_map(s, 1, vram_base + 0x000a0000);
> +    sysbus_mmio_map(s, 2, VBE_DISPI_LFB_PHYSICAL_ADDRESS);
>
>     return 0;
> }
> +
> +static void vga_mmio_realizefn(DeviceState *dev, Error **errp)
> +{
> +    VGAMmioState *s = VGA_MMIO(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(dev), &vga_mm_ctrl_ops, s,

But maybe you can store OBJECT(dev) in a local as it's needed more than 
once here. Otherwise

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> +                          "vga-mmio", 0x100000);
> +    memory_region_set_flush_coalesced(&s->iomem);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +
> +    /* XXX: endianness? */
> +    memory_region_init_io(&s->lowmem, OBJECT(dev), &vga_mem_ops, &s->vga,
> +                          "vga-lowmem", 0x20000);
> +    memory_region_set_coalescing(&s->lowmem);
> +    sysbus_init_mmio(sbd, &s->lowmem);
> +
> +    s->vga.bank_offset = 0;
> +    s->vga.global_vmstate = true;
> +    vga_common_init(&s->vga, OBJECT(dev));
> +    sysbus_init_mmio(sbd, &s->vga.vram);
> +    s->vga.con = graphic_console_init(dev, 0, s->vga.hw_ops, &s->vga);
> +}
> +
> +static Property vga_mmio_properties[] = {
> +    DEFINE_PROP_UINT8("it_shift", VGAMmioState, it_shift, 0),
> +    DEFINE_PROP_UINT32("vgamem_mb", VGAMmioState, vga.vram_size_mb, 8),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vga_mmio_class_initfn(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = vga_mmio_realizefn;
> +    dc->reset = vga_mmio_reset;
> +    dc->vmsd = &vmstate_vga_common;
> +    device_class_set_props(dc, vga_mmio_properties);
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
> +}
> +
> +static const TypeInfo vga_mmio_info = {
> +    .name          = TYPE_VGA_MMIO,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(VGAMmioState),
> +    .class_init    = vga_mmio_class_initfn,
> +};
> +
> +static void vga_mmio_register_types(void)
> +{
> +    type_register_static(&vga_mmio_info);
> +}
> +
> +type_init(vga_mmio_register_types)
>
--3866299591-112189302-1637347223=:35384--


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECBA48E4D7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:24:07 +0100 (CET)
Received: from localhost ([::1]:41490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8GwQ-0007tC-CE
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:24:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUw-0007fr-1J
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUo-0007WU-CL
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWST/Z4jMlyZNDSWU3ya+WSaZHFvrGVlCDNsgtnFfrE=;
 b=S5mFT7/m+auCgx2DzxJJl2ropP2gmdOmM7FGjtd8/NDuDiz9SC9/78BuYmkQgoUbujZSGA
 uiDLnb9/DQeFZ53cmUZ9ixiosBp4NZAu3SsTAq79J/rMod9MYJJgvCJU8Cn3zRU5LyrZeV
 3OPNHrptIese5AC3UlXs8kyFcaHBymw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-RqCgsB-tPQC_gWsfYeEN3w-1; Fri, 14 Jan 2022 01:55:22 -0500
X-MC-Unique: RqCgsB-tPQC_gWsfYeEN3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5FEF189DF41;
 Fri, 14 Jan 2022 06:55:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7CEC4699B;
 Fri, 14 Jan 2022 06:55:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 180F71800843; Fri, 14 Jan 2022 07:53:27 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/20] hw/display/vga-mmio: QOM'ify vga_mmio_init() as
 TYPE_VGA_MMIO
Date: Fri, 14 Jan 2022 07:53:18 +0100
Message-Id: <20220114065326.782420-13-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Introduce TYPE_VGA_MMIO, a sysbus device.

While there is no change in the vga_mmio_init()
interface, this is a migration compatibility break
of the MIPS Acer Pica 61 Jazz machine (pica61).

Suggested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211206224528.563588-4-f4bug@amsat.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/display/vga.h |   2 +
 hw/display/vga-mmio.c    | 120 ++++++++++++++++++++++++++++-----------
 2 files changed, 88 insertions(+), 34 deletions(-)

diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
index c16a5c26dae9..98b2e560f9b3 100644
--- a/include/hw/display/vga.h
+++ b/include/hw/display/vga.h
@@ -24,6 +24,8 @@ enum vga_retrace_method {
 
 extern enum vga_retrace_method vga_retrace_method;
 
+#define TYPE_VGA_MMIO "vga-mmio"
+
 int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
                   int it_shift, MemoryRegion *address_space);
 
diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
index 5671fdb920f7..10bde32af5ca 100644
--- a/hw/display/vga-mmio.c
+++ b/hw/display/vga-mmio.c
@@ -23,21 +23,34 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/bitops.h"
-#include "qemu/units.h"
-#include "migration/vmstate.h"
+#include "qapi/error.h"
 #include "hw/display/vga.h"
+#include "hw/sysbus.h"
+#include "hw/display/vga.h"
+#include "hw/qdev-properties.h"
 #include "vga_int.h"
-#include "ui/pixel_ops.h"
 
-#define VGA_RAM_SIZE (8 * MiB)
+/*
+ * QEMU interface:
+ *  + sysbus MMIO region 0: VGA I/O registers
+ *  + sysbus MMIO region 1: VGA MMIO registers
+ *  + sysbus MMIO region 2: VGA memory
+ */
 
-typedef struct VGAMmioState {
+OBJECT_DECLARE_SIMPLE_TYPE(VGAMmioState, VGA_MMIO)
+
+struct VGAMmioState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
     VGACommonState vga;
-    int it_shift;
-} VGAMmioState;
+    MemoryRegion iomem;
+    MemoryRegion lowmem;
+
+    uint8_t it_shift;
+};
 
-/* Memory mapped interface */
 static uint64_t vga_mm_read(void *opaque, hwaddr addr, unsigned size)
 {
     VGAMmioState *s = opaque;
@@ -65,42 +78,81 @@ static const MemoryRegionOps vga_mm_ctrl_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void vga_mmio_reset(DeviceState *dev)
+{
+    VGAMmioState *s = VGA_MMIO(dev);
+
+    vga_common_reset(&s->vga);
+}
+
 int vga_mmio_init(hwaddr vram_base, hwaddr ctrl_base,
                   int it_shift, MemoryRegion *address_space)
 {
-    VGAMmioState *s;
-    MemoryRegion *s_ioport_ctrl, *vga_io_memory;
+    DeviceState *dev;
+    SysBusDevice *s;
 
-    s = g_malloc0(sizeof(*s));
+    dev = qdev_new(TYPE_VGA_MMIO);
+    qdev_prop_set_uint8(dev, "it_shift", it_shift);
+    s = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(s, &error_fatal);
 
-    s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
-    s->vga.global_vmstate = true;
-    vga_common_init(&s->vga, NULL);
+    sysbus_mmio_map(s, 0, ctrl_base);
+    sysbus_mmio_map(s, 1, vram_base + 0x000a0000);
+    sysbus_mmio_map(s, 2, VBE_DISPI_LFB_PHYSICAL_ADDRESS);
 
-    s->it_shift = it_shift;
-    s_ioport_ctrl = g_malloc(sizeof(*s_ioport_ctrl));
-    memory_region_init_io(s_ioport_ctrl, NULL, &vga_mm_ctrl_ops, s,
-                          "vga-mm-ctrl", 0x100000);
-    memory_region_set_flush_coalesced(s_ioport_ctrl);
+    return 0;
+}
+
+static void vga_mmio_realizefn(DeviceState *dev, Error **errp)
+{
+    VGAMmioState *s = VGA_MMIO(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(dev), &vga_mm_ctrl_ops, s,
+                          "vga-mmio", 0x100000);
+    memory_region_set_flush_coalesced(&s->iomem);
+    sysbus_init_mmio(sbd, &s->iomem);
 
-    vga_io_memory = g_malloc(sizeof(*vga_io_memory));
     /* XXX: endianness? */
-    memory_region_init_io(vga_io_memory, NULL, &vga_mem_ops, &s->vga,
-                          "vga-mem", 0x20000);
+    memory_region_init_io(&s->lowmem, OBJECT(dev), &vga_mem_ops, &s->vga,
+                          "vga-lowmem", 0x20000);
+    memory_region_set_coalescing(&s->lowmem);
+    sysbus_init_mmio(sbd, &s->lowmem);
 
-    vmstate_register(NULL, 0, &vmstate_vga_common, s);
-
-    memory_region_add_subregion(address_space, ctrl_base, s_ioport_ctrl);
     s->vga.bank_offset = 0;
-    memory_region_add_subregion(address_space,
-                                vram_base + 0x000a0000, vga_io_memory);
-    memory_region_set_coalescing(vga_io_memory);
+    s->vga.global_vmstate = true;
+    vga_common_init(&s->vga, OBJECT(dev));
+    sysbus_init_mmio(sbd, &s->vga.vram);
+    s->vga.con = graphic_console_init(dev, 0, s->vga.hw_ops, &s->vga);
+}
 
-    s->vga.con = graphic_console_init(NULL, 0, s->vga.hw_ops, s);
+static Property vga_mmio_properties[] = {
+    DEFINE_PROP_UINT8("it_shift", VGAMmioState, it_shift, 0),
+    DEFINE_PROP_UINT32("vgamem_mb", VGAMmioState, vga.vram_size_mb, 8),
+    DEFINE_PROP_END_OF_LIST(),
+};
 
-    memory_region_add_subregion(address_space,
-                                VBE_DISPI_LFB_PHYSICAL_ADDRESS,
-                                &s->vga.vram);
+static void vga_mmio_class_initfn(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
-    return 0;
+    dc->realize = vga_mmio_realizefn;
+    dc->reset = vga_mmio_reset;
+    dc->vmsd = &vmstate_vga_common;
+    device_class_set_props(dc, vga_mmio_properties);
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
 }
+
+static const TypeInfo vga_mmio_info = {
+    .name          = TYPE_VGA_MMIO,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(VGAMmioState),
+    .class_init    = vga_mmio_class_initfn,
+};
+
+static void vga_mmio_register_types(void)
+{
+    type_register_static(&vga_mmio_info);
+}
+
+type_init(vga_mmio_register_types)
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD5325B041
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 17:54:38 +0200 (CEST)
Received: from localhost ([::1]:34182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDV5p-0005rh-B4
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 11:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDV1I-0000w5-KK
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 11:49:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41055
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDV1G-0005Si-DE
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 11:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599061793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=EgvoQ9NQnM9s6iXksNI0/R63KZhXs73+28RhQRIHDUw=;
 b=c2pz/ejVgKEc3auzX7/UX5/1x6nyamH1j60o9HbPXp5cdsYRVImcjIS3dCLzdOskvt4NC2
 Yle4ZXISMOg16N6YFYlO0VCvgVIKwQhAP2BZAahDXS+gKDPSFeL0jhAVylJ+P6HkTbka8R
 BdQeMy8Qz8IyhKS1+rMA/DZT79QsWrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-Z0KI6Br5PUmheCyhRJ_oow-1; Wed, 02 Sep 2020 11:49:51 -0400
X-MC-Unique: Z0KI6Br5PUmheCyhRJ_oow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E13310ABDB1;
 Wed,  2 Sep 2020 15:49:50 +0000 (UTC)
Received: from thuth.com (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF8845D9CC;
 Wed,  2 Sep 2020 15:49:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 08/15] hw/m68k: QOMify the mcf5206 system integration module
Date: Wed,  2 Sep 2020 17:49:25 +0200
Message-Id: <20200902154932.390595-9-thuth@redhat.com>
In-Reply-To: <20200902154932.390595-1-thuth@redhat.com>
References: <20200902154932.390595-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:26:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <huth@tuxfamily.org>

The mcf5206 system integration module should be a proper device.
Let's finally QOMify it.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Message-Id: <20200819065201.4045-1-huth@tuxfamily.org>
---
 hw/m68k/an5206.c      | 14 ++++++++++++--
 hw/m68k/mcf5206.c     | 44 ++++++++++++++++++++++++++++++++++---------
 include/hw/m68k/mcf.h |  3 +--
 3 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/hw/m68k/an5206.c b/hw/m68k/an5206.c
index 846f4e40c6..673898b0ea 100644
--- a/hw/m68k/an5206.c
+++ b/hw/m68k/an5206.c
@@ -21,7 +21,17 @@
 #define AN5206_MBAR_ADDR 0x10000000
 #define AN5206_RAMBAR_ADDR 0x20000000
 
-/* Board init.  */
+static void mcf5206_init(MemoryRegion *sysmem, uint32_t base)
+{
+    DeviceState *dev;
+    SysBusDevice *s;
+
+    dev = qdev_new(TYPE_MCF5206_MBAR);
+    s = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(s, &error_fatal);
+
+    memory_region_add_subregion(sysmem, base, sysbus_mmio_get_region(s, 0));
+}
 
 static void an5206_init(MachineState *machine)
 {
@@ -51,7 +61,7 @@ static void an5206_init(MachineState *machine)
     memory_region_init_ram(sram, NULL, "an5206.sram", 512, &error_fatal);
     memory_region_add_subregion(address_space_mem, AN5206_RAMBAR_ADDR, sram);
 
-    mcf5206_init(address_space_mem, AN5206_MBAR_ADDR, cpu);
+    mcf5206_init(address_space_mem, AN5206_MBAR_ADDR);
 
     /* Load kernel.  */
     if (!kernel_filename) {
diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index 94a37a1a46..51d2e0da1c 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -15,6 +15,7 @@
 #include "qemu/timer.h"
 #include "hw/ptimer.h"
 #include "sysemu/sysemu.h"
+#include "hw/sysbus.h"
 
 /* General purpose timer module.  */
 typedef struct {
@@ -159,6 +160,8 @@ static m5206_timer_state *m5206_timer_init(qemu_irq irq)
 /* System Integration Module.  */
 
 typedef struct {
+    SysBusDevice parent_obj;
+
     M68kCPU *cpu;
     MemoryRegion iomem;
     m5206_timer_state *timer[2];
@@ -174,6 +177,8 @@ typedef struct {
     uint8_t uivr[2];
 } m5206_mbar_state;
 
+#define MCF5206_MBAR(obj) OBJECT_CHECK(m5206_mbar_state, (obj), TYPE_MCF5206_MBAR)
+
 /* Interrupt controller.  */
 
 static int m5206_find_pending_irq(m5206_mbar_state *s)
@@ -257,8 +262,10 @@ static void m5206_mbar_set_irq(void *opaque, int irq, int level)
 
 /* System Integration Module.  */
 
-static void m5206_mbar_reset(m5206_mbar_state *s)
+static void m5206_mbar_reset(DeviceState *dev)
 {
+    m5206_mbar_state *s = MCF5206_MBAR(dev);
+
     s->scr = 0xc0;
     s->icr[1] = 0x04;
     s->icr[2] = 0x08;
@@ -578,24 +585,43 @@ static const MemoryRegionOps m5206_mbar_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-qemu_irq *mcf5206_init(MemoryRegion *sysmem, uint32_t base, M68kCPU *cpu)
+static void mcf5206_mbar_realize(DeviceState *dev, Error **errp)
 {
-    m5206_mbar_state *s;
+    m5206_mbar_state *s = MCF5206_MBAR(dev);
     qemu_irq *pic;
 
-    s = g_new0(m5206_mbar_state, 1);
-
     memory_region_init_io(&s->iomem, NULL, &m5206_mbar_ops, s,
                           "mbar", 0x00001000);
-    memory_region_add_subregion(sysmem, base, &s->iomem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
 
     pic = qemu_allocate_irqs(m5206_mbar_set_irq, s, 14);
     s->timer[0] = m5206_timer_init(pic[9]);
     s->timer[1] = m5206_timer_init(pic[10]);
     s->uart[0] = mcf_uart_init(pic[12], serial_hd(0));
     s->uart[1] = mcf_uart_init(pic[13], serial_hd(1));
-    s->cpu = cpu;
+    s->cpu = M68K_CPU(qemu_get_cpu(0));
+}
+
+static void mcf5206_mbar_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
 
-    m5206_mbar_reset(s);
-    return pic;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->desc = "MCF5206 system integration module";
+    dc->realize = mcf5206_mbar_realize;
+    dc->reset = m5206_mbar_reset;
 }
+
+static const TypeInfo mcf5206_mbar_info = {
+    .name          = TYPE_MCF5206_MBAR,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(m5206_mbar_state),
+    .class_init    = mcf5206_mbar_class_init,
+};
+
+static void mcf5206_mbar_register_types(void)
+{
+    type_register_static(&mcf5206_mbar_info);
+}
+
+type_init(mcf5206_mbar_register_types)
diff --git a/include/hw/m68k/mcf.h b/include/hw/m68k/mcf.h
index 0db49c5e60..decf17ce42 100644
--- a/include/hw/m68k/mcf.h
+++ b/include/hw/m68k/mcf.h
@@ -18,7 +18,6 @@ qemu_irq *mcf_intc_init(struct MemoryRegion *sysmem,
                         M68kCPU *cpu);
 
 /* mcf5206.c */
-qemu_irq *mcf5206_init(struct MemoryRegion *sysmem,
-                       uint32_t base, M68kCPU *cpu);
+#define TYPE_MCF5206_MBAR "mcf5206-mbar"
 
 #endif
-- 
2.18.2



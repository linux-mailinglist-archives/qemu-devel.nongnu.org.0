Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304C2351C06
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 20:27:50 +0200 (CEST)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS22n-00033F-6O
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 14:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lS1qo-0003NF-AY; Thu, 01 Apr 2021 14:15:28 -0400
Received: from sender-of-o51.zoho.in ([103.117.158.51]:2305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lS1qZ-0003aK-HY; Thu, 01 Apr 2021 14:15:24 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617300903; cv=none; d=zohomail.in; s=zohoarc; 
 b=BhC+VhceINLzgK9ZQ4OijUfYppFUgxvhCD/+wrNrt+Y5esdsMkFU1MElcQMmNuIYwrtSyMxNNEd7ahuehMgUho8RyVUzLz4DQMymIUKxQntNkdgEO8YvdnzjaIZgCj6CMmgB58FiswQnLjvfeIKq0iUFfw7/R41oonnxnikSpMM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1617300903;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=xFo9r9JEtBqpLxIEtXqPr/jj7ZNiZVgywVbyzxMJVCU=; 
 b=UXolp+R+JF+CRgE+dxX+OewCa1L9ErTbz6AobQqYWf26tV8zpjFfLjdxR2moOPuaUssBJalKZbICcMbvzluKOuYg5jN0i62+dGUqm6X7Icg/3sk1/JZmNwSvph7x820Mp5tj3KOPV36HnEWhuWEpUbDm6jd/cpbT0s6RSNhJ87Y=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617300903; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=xFo9r9JEtBqpLxIEtXqPr/jj7ZNiZVgywVbyzxMJVCU=;
 b=OsSQGxDIoCkKUXkBsLywOQ+w3G/QYyHlbOQnovlkbbQnGGWGAhJuwRaEfdjP4t2u
 whHqlTPLNm6DpUyVZhI03OnzAzFmPniiR7UVROLUd+JPt2ZC+zcyrk+HZkXZa/AcOdr
 ZnbHxow/Ke4npOfNi+UldmRjmZpvwvrMZZ1Ij2k8=
Received: from localhost.localdomain (49.207.218.164 [49.207.218.164]) by
 mx.zoho.in with SMTPS id 1617300901432556.8555773449766;
 Thu, 1 Apr 2021 23:45:01 +0530 (IST)
From: Vijai Kumar K <vijai@behindbytes.com>
To: qemu-riscv@nongnu.org,
	alistair23@gmail.com
Message-ID: <20210401181457.73039-4-vijai@behindbytes.com>
Subject: [PATCH v3 3/4] hw/char: Add Shakti UART emulation
Date: Thu,  1 Apr 2021 23:44:56 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401181457.73039-1-vijai@behindbytes.com>
References: <20210401181457.73039-1-vijai@behindbytes.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Received-SPF: pass client-ip=103.117.158.51;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o51.zoho.in
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the initial implementation of Shakti UART.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
---
 MAINTAINERS                   |   2 +
 hw/char/meson.build           |   1 +
 hw/char/shakti_uart.c         | 185 ++++++++++++++++++++++++++++++++++
 hw/char/trace-events          |   4 +
 include/hw/char/shakti_uart.h |  74 ++++++++++++++
 5 files changed, 266 insertions(+)
 create mode 100644 hw/char/shakti_uart.c
 create mode 100644 include/hw/char/shakti_uart.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9f71c4cc3f..be084865db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1385,7 +1385,9 @@ M: Vijai Kumar K <vijai@behindbytes.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: hw/riscv/shakti_c.c
+F: hw/char/shakti_uart.c
 F: include/hw/riscv/shakti_c.h
+F: include/hw/char/shakti_uart.h
=20
 SiFive Machines
 M: Alistair Francis <Alistair.Francis@wdc.com>
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 7ba38dbd96..61c43d4b51 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -19,6 +19,7 @@ softmmu_ss.add(when: 'CONFIG_SERIAL', if_true: files('ser=
ial.c'))
 softmmu_ss.add(when: 'CONFIG_SERIAL_ISA', if_true: files('serial-isa.c'))
 softmmu_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c'))
 softmmu_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-pci=
-multi.c'))
+softmmu_ss.add(when: 'CONFIG_SHAKTI', if_true: files('shakti_uart.c'))
 softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-consol=
e.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_console.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'))
diff --git a/hw/char/shakti_uart.c b/hw/char/shakti_uart.c
new file mode 100644
index 0000000000..6870821325
--- /dev/null
+++ b/hw/char/shakti_uart.c
@@ -0,0 +1,185 @@
+/*
+ * SHAKTI UART
+ *
+ * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy
+ * of this software and associated documentation files (the "Software"), t=
o deal
+ * in the Software without restriction, including without limitation the r=
ights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/char/shakti_uart.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "qemu/log.h"
+
+static uint64_t shakti_uart_read(void *opaque, hwaddr addr, unsigned size)
+{
+    ShaktiUartState *s =3D opaque;
+
+    switch (addr) {
+    case SHAKTI_UART_BAUD:
+        return s->uart_baud;
+    case SHAKTI_UART_RX:
+        qemu_chr_fe_accept_input(&s->chr);
+        s->uart_status &=3D ~SHAKTI_UART_STATUS_RX_NOT_EMPTY;
+        return s->uart_rx;
+    case SHAKTI_UART_STATUS:
+        return s->uart_status;
+    case SHAKTI_UART_DELAY:
+        return s->uart_delay;
+    case SHAKTI_UART_CONTROL:
+        return s->uart_control;
+    case SHAKTI_UART_INT_EN:
+        return s->uart_interrupt;
+    case SHAKTI_UART_IQ_CYCLES:
+        return s->uart_iq_cycles;
+    case SHAKTI_UART_RX_THRES:
+        return s->uart_rx_threshold;
+    default:
+        /* Also handles TX REG which is write only */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr)=
;
+    }
+
+    return 0;
+}
+
+static void shakti_uart_write(void *opaque, hwaddr addr,
+                              uint64_t data, unsigned size)
+{
+    ShaktiUartState *s =3D opaque;
+    uint32_t value =3D data;
+    uint8_t ch;
+
+    switch (addr) {
+    case SHAKTI_UART_BAUD:
+        s->uart_baud =3D value;
+        break;
+    case SHAKTI_UART_TX:
+        ch =3D value;
+        qemu_chr_fe_write_all(&s->chr, &ch, 1);
+        s->uart_status &=3D ~SHAKTI_UART_STATUS_TX_FULL;
+        break;
+    case SHAKTI_UART_STATUS:
+        s->uart_status =3D value;
+        break;
+    case SHAKTI_UART_DELAY:
+        s->uart_delay =3D value;
+        break;
+    case SHAKTI_UART_CONTROL:
+        s->uart_control =3D value;
+        break;
+    case SHAKTI_UART_INT_EN:
+        s->uart_interrupt =3D value;
+        break;
+    case SHAKTI_UART_IQ_CYCLES:
+        s->uart_iq_cycles =3D value;
+        break;
+    case SHAKTI_UART_RX_THRES:
+        s->uart_rx_threshold =3D value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr)=
;
+    }
+}
+
+static const MemoryRegionOps shakti_uart_ops =3D {
+    .read =3D shakti_uart_read,
+    .write =3D shakti_uart_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .impl =3D {.min_access_size =3D 1, .max_access_size =3D 4},
+    .valid =3D {.min_access_size =3D 1, .max_access_size =3D 4},
+};
+
+static void shakti_uart_reset(DeviceState *dev)
+{
+    ShaktiUartState *s =3D SHAKTI_UART(dev);
+
+    s->uart_baud =3D SHAKTI_UART_BAUD_DEFAULT;
+    s->uart_tx =3D 0x0;
+    s->uart_rx =3D 0x0;
+    s->uart_status =3D 0x0000;
+    s->uart_delay =3D 0x0000;
+    s->uart_control =3D SHAKTI_UART_CONTROL_DEFAULT;
+    s->uart_interrupt =3D 0x0000;
+    s->uart_iq_cycles =3D 0x00;
+    s->uart_rx_threshold =3D 0x00;
+}
+
+static int shakti_uart_can_receive(void *opaque)
+{
+    ShaktiUartState *s =3D opaque;
+
+    return !(s->uart_status & SHAKTI_UART_STATUS_RX_NOT_EMPTY);
+}
+
+static void shakti_uart_receive(void *opaque, const uint8_t *buf, int size=
)
+{
+    ShaktiUartState *s =3D opaque;
+
+    s->uart_rx =3D *buf;
+    s->uart_status |=3D SHAKTI_UART_STATUS_RX_NOT_EMPTY;
+}
+
+static void shakti_uart_realize(DeviceState *dev, Error **errp)
+{
+    ShaktiUartState *sus =3D SHAKTI_UART(dev);
+    qemu_chr_fe_set_handlers(&sus->chr, shakti_uart_can_receive,
+                             shakti_uart_receive, NULL, NULL, sus, NULL, t=
rue);
+}
+
+static void shakti_uart_instance_init(Object *obj)
+{
+    ShaktiUartState *sus =3D SHAKTI_UART(obj);
+    memory_region_init_io(&sus->mmio,
+                          obj,
+                          &shakti_uart_ops,
+                          sus,
+                          TYPE_SHAKTI_UART,
+                          0x1000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &sus->mmio);
+}
+
+static Property shakti_uart_properties[] =3D {
+    DEFINE_PROP_CHR("chardev", ShaktiUartState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void shakti_uart_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    dc->reset =3D shakti_uart_reset;
+    dc->realize =3D shakti_uart_realize;
+    device_class_set_props(dc, shakti_uart_properties);
+}
+
+static const TypeInfo shakti_uart_info =3D {
+    .name =3D TYPE_SHAKTI_UART,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(ShaktiUartState),
+    .class_init =3D shakti_uart_class_init,
+    .instance_init =3D shakti_uart_instance_init,
+};
+
+static void shakti_uart_register_types(void)
+{
+    type_register_static(&shakti_uart_info);
+}
+type_init(shakti_uart_register_types)
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 81026f6612..54aeeb899c 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -80,6 +80,10 @@ cmsdk_apb_uart_set_params(int speed) "CMSDK APB UART: pa=
rams set to %d 8N1"
 nrf51_uart_read(uint64_t addr, uint64_t r, unsigned int size) "addr 0x%" P=
RIx64 " value 0x%" PRIx64 " size %u"
 nrf51_uart_write(uint64_t addr, uint64_t value, unsigned int size) "addr 0=
x%" PRIx64 " value 0x%" PRIx64 " size %u"
=20
+# shakti_uart.c
+shakti_uart_read(uint64_t addr, uint16_t r, unsigned int size) "addr 0x%" =
PRIx64 " value 0x%" PRIx16 " size %u"
+shakti_uart_write(uint64_t addr, uint64_t value, unsigned int size) "addr =
0x%" PRIx64 " value 0x%" PRIx64 " size %u"
+
 # exynos4210_uart.c
 exynos_uart_dmabusy(uint32_t channel) "UART%d: DMA busy (Rx buffer empty)"
 exynos_uart_dmaready(uint32_t channel) "UART%d: DMA ready"
diff --git a/include/hw/char/shakti_uart.h b/include/hw/char/shakti_uart.h
new file mode 100644
index 0000000000..526c408233
--- /dev/null
+++ b/include/hw/char/shakti_uart.h
@@ -0,0 +1,74 @@
+/*
+ * SHAKTI UART
+ *
+ * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy
+ * of this software and associated documentation files (the "Software"), t=
o deal
+ * in the Software without restriction, including without limitation the r=
ights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_SHAKTI_UART_H
+#define HW_SHAKTI_UART_H
+
+#include "hw/sysbus.h"
+#include "chardev/char-fe.h"
+
+#define SHAKTI_UART_BAUD        0x00
+#define SHAKTI_UART_TX          0x04
+#define SHAKTI_UART_RX          0x08
+#define SHAKTI_UART_STATUS      0x0C
+#define SHAKTI_UART_DELAY       0x10
+#define SHAKTI_UART_CONTROL     0x14
+#define SHAKTI_UART_INT_EN      0x18
+#define SHAKTI_UART_IQ_CYCLES   0x1C
+#define SHAKTI_UART_RX_THRES    0x20
+
+#define SHAKTI_UART_STATUS_TX_EMPTY     (1 << 0)
+#define SHAKTI_UART_STATUS_TX_FULL      (1 << 1)
+#define SHAKTI_UART_STATUS_RX_NOT_EMPTY (1 << 2)
+#define SHAKTI_UART_STATUS_RX_FULL      (1 << 3)
+/* 9600 8N1 is the default setting */
+/* Reg value =3D (50000000 Hz)/(16 * 9600)*/
+#define SHAKTI_UART_BAUD_DEFAULT    0x0145
+#define SHAKTI_UART_CONTROL_DEFAULT 0x0100
+
+#define TYPE_SHAKTI_UART "shakti-uart"
+#define SHAKTI_UART(obj) \
+    OBJECT_CHECK(ShaktiUartState, (obj), TYPE_SHAKTI_UART)
+
+typedef struct {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion mmio;
+
+    uint32_t uart_baud;
+    uint32_t uart_tx;
+    uint32_t uart_rx;
+    uint32_t uart_status;
+    uint32_t uart_delay;
+    uint32_t uart_control;
+    uint32_t uart_interrupt;
+    uint32_t uart_iq_cycles;
+    uint32_t uart_rx_threshold;
+
+    CharBackend chr;
+} ShaktiUartState;
+
+#endif /* HW_SHAKTI_UART_H */
--=20
2.25.1




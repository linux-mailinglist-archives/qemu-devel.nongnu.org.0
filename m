Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4C51B821
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 16:21:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQBpE-0003Ku-NF
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 10:21:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yo-satoh@sios.com>) id 1hQ3Sw-0000dt-C4
	for qemu-devel@nongnu.org; Mon, 13 May 2019 01:25:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yo-satoh@sios.com>) id 1hQ3St-0006Ko-Hv
	for qemu-devel@nongnu.org; Mon, 13 May 2019 01:25:34 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:35623)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yo-satoh@sios.com>) id 1hQ3St-0006Ii-8T
	for qemu-devel@nongnu.org; Mon, 13 May 2019 01:25:31 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.vps.ablenet.jp
	[61.195.96.97]) (Authenticated sender: PQ4Y-STU)
	by mail02.asahi-net.or.jp (Postfix) with ESMTPA id EED5F3DF34;
	Mon, 13 May 2019 14:25:29 +0900 (JST)
Received: from ysato.dip.jp (ZM005235.ppp.dion.ne.jp [222.8.5.235])
	by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id A19D8240085; 
	Mon, 13 May 2019 14:25:29 +0900 (JST)
From: Yoshinori Sato <yo-satoh@sios.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 14:25:13 +0900
Message-Id: <20190513052518.6274-8-yo-satoh@sios.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190513052518.6274-1-yo-satoh@sios.com>
References: <20190513052518.6274-1-yo-satoh@sios.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 202.224.55.14
X-Mailman-Approved-At: Mon, 13 May 2019 10:11:53 -0400
Subject: [Qemu-devel] [PATCH v11 07/12] hw/char: RX62N serial communication
 interface (SCI)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	Yoshinori Sato <yo-satoh@sios.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yoshinori Sato <ysato@users.sourceforge.jp>

This module supported only non FIFO type.
Hardware manual.
https://www.renesas.com/us/en/doc/products/mpumcu/doc/rx_family/r01uh0033ej0140_rx62n.pdf

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Yoshinori Sato <yo-satoh@sios.com>
---
 hw/char/Kconfig               |   3 +
 hw/char/Makefile.objs         |   1 +
 hw/char/renesas_sci.c         | 340 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/char/renesas_sci.h |  45 ++++++
 4 files changed, 389 insertions(+)
 create mode 100644 hw/char/renesas_sci.c
 create mode 100644 include/hw/char/renesas_sci.h

diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 6360c9fffa..10c24ca87f 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -40,3 +40,6 @@ config SCLPCONSOLE
 
 config TERMINAL3270
     bool
+
+config RENESAS_SCI
+    bool
diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
index cf086e7114..f1b9bf0ecb 100644
--- a/hw/char/Makefile.objs
+++ b/hw/char/Makefile.objs
@@ -20,6 +20,7 @@ obj-$(CONFIG_PSERIES) += spapr_vty.o
 obj-$(CONFIG_DIGIC) += digic-uart.o
 obj-$(CONFIG_STM32F2XX_USART) += stm32f2xx_usart.o
 obj-$(CONFIG_RASPI) += bcm2835_aux.o
+obj-$(CONFIG_RENESAS_SCI) += renesas_sci.o
 
 common-obj-$(CONFIG_CMSDK_APB_UART) += cmsdk-apb-uart.o
 common-obj-$(CONFIG_ETRAXFS) += etraxfs_ser.o
diff --git a/hw/char/renesas_sci.c b/hw/char/renesas_sci.c
new file mode 100644
index 0000000000..6298cbf43a
--- /dev/null
+++ b/hw/char/renesas_sci.c
@@ -0,0 +1,340 @@
+/*
+ * Renesas Serial Communication Interface
+ *
+ * Datasheet: RX62N Group, RX621 Group User's Manual: Hardware
+ * (Rev.1.40 R01UH0033EJ0140)
+ *
+ * Copyright (c) 2019 Yoshinori Sato
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "hw/hw.h"
+#include "hw/sysbus.h"
+#include "hw/registerfields.h"
+#include "hw/char/renesas_sci.h"
+#include "qemu/error-report.h"
+
+/* SCI register map */
+REG8(SMR, 0)
+  FIELD(SMR, CKS,  0, 2)
+  FIELD(SMR, MP,   2, 1)
+  FIELD(SMR, STOP, 3, 1)
+  FIELD(SMR, PM,   4, 1)
+  FIELD(SMR, PE,   5, 1)
+  FIELD(SMR, CHR,  6, 1)
+  FIELD(SMR, CM,   7, 1)
+REG8(BRR, 1)
+REG8(SCR, 2)
+  FIELD(SCR, CKE, 0, 2)
+  FIELD(SCR, TEIE, 2, 1)
+  FIELD(SCR, MPIE, 3, 1)
+  FIELD(SCR, RE,   4, 1)
+  FIELD(SCR, TE,   5, 1)
+  FIELD(SCR, RIE,  6, 1)
+  FIELD(SCR, TIE,  7, 1)
+REG8(TDR, 3)
+REG8(SSR, 4)
+  FIELD(SSR, MPBT, 0, 1)
+  FIELD(SSR, MPB,  1, 1)
+  FIELD(SSR, TEND, 2, 1)
+  FIELD(SSR, ERR, 3, 3)
+    FIELD(SSR, PER,  3, 1)
+    FIELD(SSR, FER,  4, 1)
+    FIELD(SSR, ORER, 5, 1)
+  FIELD(SSR, RDRF, 6, 1)
+  FIELD(SSR, TDRE, 7, 1)
+REG8(RDR, 5)
+REG8(SCMR, 6)
+  FIELD(SCMR, SMIF, 0, 1)
+  FIELD(SCMR, SINV, 2, 1)
+  FIELD(SCMR, SDIR, 3, 1)
+  FIELD(SCMR, BCP2, 7, 1)
+REG8(SEMR, 7)
+  FIELD(SEMR, ACS0, 0, 1)
+  FIELD(SEMR, ABCS, 4, 1)
+
+static int can_receive(void *opaque)
+{
+    RSCIState *sci = RSCI(opaque);
+    if (sci->rx_next > qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
+        return 0;
+    } else {
+        return FIELD_EX8(sci->scr, SCR, RE);
+    }
+}
+
+static void receive(void *opaque, const uint8_t *buf, int size)
+{
+    RSCIState *sci = RSCI(opaque);
+    sci->rx_next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + sci->trtime;
+    if (FIELD_EX8(sci->ssr, SSR, RDRF) || size > 1) {
+        sci->ssr = FIELD_DP8(sci->ssr, SSR, ORER, 1);
+        if (FIELD_EX8(sci->scr, SCR, RIE)) {
+            qemu_set_irq(sci->irq[ERI], 1);
+        }
+    } else {
+        sci->rdr = buf[0];
+        sci->ssr = FIELD_DP8(sci->ssr, SSR, RDRF, 1);
+        if (FIELD_EX8(sci->scr, SCR, RIE)) {
+            qemu_irq_pulse(sci->irq[RXI]);
+        }
+    }
+}
+
+static void send_byte(RSCIState *sci)
+{
+    if (qemu_chr_fe_backend_connected(&sci->chr)) {
+        qemu_chr_fe_write_all(&sci->chr, &sci->tdr, 1);
+    }
+    timer_mod(sci->timer,
+              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + sci->trtime);
+    sci->ssr = FIELD_DP8(sci->ssr, SSR, TEND, 0);
+    sci->ssr = FIELD_DP8(sci->ssr, SSR, TDRE, 1);
+    qemu_set_irq(sci->irq[TEI], 0);
+    if (FIELD_EX8(sci->scr, SCR, TIE)) {
+        qemu_irq_pulse(sci->irq[TXI]);
+    }
+}
+
+static void txend(void *opaque)
+{
+    RSCIState *sci = RSCI(opaque);
+    if (!FIELD_EX8(sci->ssr, SSR, TDRE)) {
+        send_byte(sci);
+    } else {
+        sci->ssr = FIELD_DP8(sci->ssr, SSR, TEND, 1);
+        if (FIELD_EX8(sci->scr, SCR, TEIE)) {
+            qemu_set_irq(sci->irq[TEI], 1);
+        }
+    }
+}
+
+static void update_trtime(RSCIState *sci)
+{
+    /* char per bits */
+    sci->trtime = 8 - FIELD_EX8(sci->smr, SMR, CHR);
+    sci->trtime += FIELD_EX8(sci->smr, SMR, PE);
+    sci->trtime += FIELD_EX8(sci->smr, SMR, STOP) + 1;
+    /* x bit transmit time (32 * divrate * brr) / base freq */
+    sci->trtime *= 32 * sci->brr;
+    sci->trtime *= 1 << (2 * FIELD_EX8(sci->smr, SMR, CKS));
+    sci->trtime *= NANOSECONDS_PER_SECOND;
+    sci->trtime /= sci->input_freq;
+}
+
+#define IS_TR_ENABLED(scr) \
+    (FIELD_EX8(scr, SCR, TE) || FIELD_EX8(scr, SCR, RE))
+
+static void sci_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+{
+    hwaddr offset = addr & 0x07;
+    RSCIState *sci = RSCI(opaque);
+
+    switch (offset) {
+    case A_SMR:
+        if (!IS_TR_ENABLED(sci->scr)) {
+            sci->smr = val;
+            update_trtime(sci);
+        }
+        break;
+    case A_BRR:
+        if (!IS_TR_ENABLED(sci->scr)) {
+            sci->brr = val;
+            update_trtime(sci);
+        }
+        break;
+    case A_SCR:
+        sci->scr = val;
+        if (FIELD_EX8(sci->scr, SCR, TE)) {
+            sci->ssr = FIELD_DP8(sci->ssr, SSR, TDRE, 1);
+            sci->ssr = FIELD_DP8(sci->ssr, SSR, TEND, 1);
+            if (FIELD_EX8(sci->scr, SCR, TIE)) {
+                qemu_irq_pulse(sci->irq[TXI]);
+            }
+        }
+        if (!FIELD_EX8(sci->scr, SCR, TEIE)) {
+            qemu_set_irq(sci->irq[TEI], 0);
+        }
+        if (!FIELD_EX8(sci->scr, SCR, RIE)) {
+            qemu_set_irq(sci->irq[ERI], 0);
+        }
+        break;
+    case A_TDR:
+        sci->tdr = val;
+        if (FIELD_EX8(sci->ssr, SSR, TEND)) {
+            send_byte(sci);
+        } else {
+            sci->ssr = FIELD_DP8(sci->ssr, SSR, TDRE, 0);
+        }
+        break;
+    case A_SSR:
+        sci->ssr = FIELD_DP8(sci->ssr, SSR, MPBT,
+                             FIELD_EX8(val, SSR, MPBT));
+        sci->ssr = FIELD_DP8(sci->ssr, SSR, ERR,
+                             FIELD_EX8(val, SSR, ERR) & 0x07);
+        if (FIELD_EX8(sci->read_ssr, SSR, ERR) &&
+            FIELD_EX8(sci->ssr, SSR, ERR) == 0) {
+            qemu_set_irq(sci->irq[ERI], 0);
+        }
+        break;
+    case A_RDR:
+        qemu_log_mask(LOG_GUEST_ERROR, "reneas_sci: RDR is read only.\n");
+        break;
+    case A_SCMR:
+        sci->scmr = val; break;
+    case A_SEMR: /* SEMR */
+        sci->semr = val; break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "renesas_sci: Register 0x%" HWADDR_PRIX
+                      " not implemented\n", offset);
+    }
+}
+
+static uint64_t sci_read(void *opaque, hwaddr addr, unsigned size)
+{
+    hwaddr offset = addr & 0x07;
+    RSCIState *sci = RSCI(opaque);
+
+    switch (offset) {
+    case A_SMR:
+        return sci->smr;
+    case A_BRR:
+        return sci->brr;
+    case A_SCR:
+        return sci->scr;
+    case A_TDR:
+        return sci->tdr;
+    case A_SSR:
+        sci->read_ssr = sci->ssr;
+        return sci->ssr;
+    case A_RDR:
+        sci->ssr = FIELD_DP8(sci->ssr, SSR, RDRF, 0);
+        return sci->rdr;
+    case A_SCMR:
+        return sci->scmr;
+    case A_SEMR:
+        return sci->semr;
+    default:
+        qemu_log_mask(LOG_UNIMP, "renesas_sci: Register 0x%" HWADDR_PRIX
+                      " not implemented.\n", offset);
+    }
+    return UINT64_MAX;
+}
+
+static const MemoryRegionOps sci_ops = {
+    .write = sci_write,
+    .read  = sci_read,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .max_access_size = 1,
+    },
+};
+
+static void rsci_reset(DeviceState *dev)
+{
+    RSCIState *sci = RSCI(dev);
+    sci->smr = sci->scr = 0x00;
+    sci->brr = 0xff;
+    sci->tdr = 0xff;
+    sci->rdr = 0x00;
+    sci->ssr = 0x84;
+    sci->scmr = 0x00;
+    sci->semr = 0x00;
+    sci->rx_next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+}
+
+static void sci_event(void *opaque, int event)
+{
+    RSCIState *sci = RSCI(opaque);
+    if (event == CHR_EVENT_BREAK) {
+        sci->ssr = FIELD_DP8(sci->ssr, SSR, FER, 1);
+        if (FIELD_EX8(sci->scr, SCR, RIE)) {
+            qemu_set_irq(sci->irq[ERI], 1);
+        }
+    }
+}
+
+static void rsci_realize(DeviceState *dev, Error **errp)
+{
+    RSCIState *sci = RSCI(dev);
+
+    if (sci->input_freq == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "renesas_sci: input-freq property must be set.");
+        return;
+    }
+    qemu_chr_fe_set_handlers(&sci->chr, can_receive, receive,
+                             sci_event, NULL, sci, NULL, true);
+}
+
+static void rsci_init(Object *obj)
+{
+    SysBusDevice *d = SYS_BUS_DEVICE(obj);
+    RSCIState *sci = RSCI(obj);
+    int i;
+
+    memory_region_init_io(&sci->memory, OBJECT(sci), &sci_ops,
+                          sci, "renesas-sci", 0x8);
+    sysbus_init_mmio(d, &sci->memory);
+
+    for (i = 0; i < SCI_NR_IRQ; i++) {
+        sysbus_init_irq(d, &sci->irq[i]);
+    }
+    sci->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, txend, sci);
+}
+
+static const VMStateDescription vmstate_rcmt = {
+    .name = "renesas-sci",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property rsci_properties[] = {
+    DEFINE_PROP_UINT64("input-freq", RSCIState, input_freq, 0),
+    DEFINE_PROP_CHR("chardev", RSCIState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void rsci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = rsci_realize;
+    dc->props = rsci_properties;
+    dc->vmsd = &vmstate_rcmt;
+    dc->reset = rsci_reset;
+}
+
+static const TypeInfo rsci_info = {
+    .name       = TYPE_RENESAS_SCI,
+    .parent     = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(RSCIState),
+    .instance_init = rsci_init,
+    .class_init = rsci_class_init,
+};
+
+static void rsci_register_types(void)
+{
+    type_register_static(&rsci_info);
+}
+
+type_init(rsci_register_types)
diff --git a/include/hw/char/renesas_sci.h b/include/hw/char/renesas_sci.h
new file mode 100644
index 0000000000..50d1336944
--- /dev/null
+++ b/include/hw/char/renesas_sci.h
@@ -0,0 +1,45 @@
+/*
+ * Renesas Serial Communication Interface
+ *
+ * Copyright (c) 2018 Yoshinori Sato
+ *
+ * This code is licensed under the GPL version 2 or later.
+ *
+ */
+
+#include "chardev/char-fe.h"
+#include "qemu/timer.h"
+#include "hw/sysbus.h"
+
+#define TYPE_RENESAS_SCI "renesas-sci"
+#define RSCI(obj) OBJECT_CHECK(RSCIState, (obj), TYPE_RENESAS_SCI)
+
+enum {
+    ERI = 0,
+    RXI = 1,
+    TXI = 2,
+    TEI = 3,
+    SCI_NR_IRQ = 4,
+};
+
+typedef struct {
+    SysBusDevice parent_obj;
+    MemoryRegion memory;
+
+    uint8_t smr;
+    uint8_t brr;
+    uint8_t scr;
+    uint8_t tdr;
+    uint8_t ssr;
+    uint8_t rdr;
+    uint8_t scmr;
+    uint8_t semr;
+
+    uint8_t read_ssr;
+    int64_t trtime;
+    int64_t rx_next;
+    QEMUTimer *timer;
+    CharBackend chr;
+    uint64_t input_freq;
+    qemu_irq irq[SCI_NR_IRQ];
+} RSCIState;
-- 
2.11.0



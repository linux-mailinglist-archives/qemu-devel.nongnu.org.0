Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE07649ECED
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:00:19 +0100 (CET)
Received: from localhost ([::1]:36040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDBsR-0002tt-0W
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:00:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmp-0007i6-V7
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:31 -0500
Received: from [2001:41c9:1:41f::167] (port=36820
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmn-0004vn-IS
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:31 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmM-000BHM-Eg; Thu, 27 Jan 2022 20:54:02 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Thu, 27 Jan 2022 20:53:58 +0000
Message-Id: <20220127205405.23499-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 04/11] mos6522: switch over to use qdev gpios for IRQs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For historical reasons each mos6522 instance implements its own setting and
update of the IFR flag bits using methods exposed by MOS6522DeviceClass. As
of today this is no longer required, and it is now possible to implement
the mos6522 IRQs as standard qdev gpios.

Switch over to use qdev gpios for the mos6522 device and update all instances
accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mac_via.c         | 56 +++++++--------------------------------
 hw/misc/macio/cuda.c      |  5 ++--
 hw/misc/macio/pmu.c       |  4 +--
 hw/misc/mos6522.c         | 15 +++++++++++
 include/hw/misc/mac_via.h |  6 +----
 include/hw/misc/mos6522.h |  2 ++
 6 files changed, 32 insertions(+), 56 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index b378e6b305..0756374f1b 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -325,10 +325,9 @@ static void via1_sixty_hz(void *opaque)
 {
     MOS6522Q800VIA1State *v1s = opaque;
     MOS6522State *s = MOS6522(v1s);
-    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
+    qemu_irq irq = qdev_get_gpio_in(DEVICE(s), VIA1_IRQ_60HZ_BIT);
 
-    s->ifr |= VIA1_IRQ_60HZ;
-    mdc->update_irq(s);
+    qemu_set_irq(irq, 1);
 
     via1_sixty_hz_update(v1s);
 }
@@ -337,44 +336,13 @@ static void via1_one_second(void *opaque)
 {
     MOS6522Q800VIA1State *v1s = opaque;
     MOS6522State *s = MOS6522(v1s);
-    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
+    qemu_irq irq = qdev_get_gpio_in(DEVICE(s), VIA1_IRQ_ONE_SECOND_BIT);
 
-    s->ifr |= VIA1_IRQ_ONE_SECOND;
-    mdc->update_irq(s);
+    qemu_set_irq(irq, 1);
 
     via1_one_second_update(v1s);
 }
 
-static void via1_irq_request(void *opaque, int irq, int level)
-{
-    MOS6522Q800VIA1State *v1s = opaque;
-    MOS6522State *s = MOS6522(v1s);
-    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
-
-    if (level) {
-        s->ifr |= 1 << irq;
-    } else {
-        s->ifr &= ~(1 << irq);
-    }
-
-    mdc->update_irq(s);
-}
-
-static void via2_irq_request(void *opaque, int irq, int level)
-{
-    MOS6522Q800VIA2State *v2s = opaque;
-    MOS6522State *s = MOS6522(v2s);
-    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
-
-    if (level) {
-        s->ifr |= 1 << irq;
-    } else {
-        s->ifr &= ~(1 << irq);
-    }
-
-    mdc->update_irq(s);
-}
-
 
 static void pram_update(MOS6522Q800VIA1State *v1s)
 {
@@ -1061,8 +1029,6 @@ static void mos6522_q800_via1_init(Object *obj)
     qbus_init((BusState *)&v1s->adb_bus, sizeof(v1s->adb_bus),
               TYPE_ADB_BUS, DEVICE(v1s), "adb.0");
 
-    qdev_init_gpio_in(DEVICE(obj), via1_irq_request, VIA1_IRQ_NB);
-
     /* A/UX mode */
     qdev_init_gpio_out(DEVICE(obj), &v1s->auxmode_irq, 1);
 }
@@ -1150,22 +1116,20 @@ static void mos6522_q800_via2_reset(DeviceState *dev)
     ms->a = 0x7f;
 }
 
-static void via2_nubus_irq_request(void *opaque, int irq, int level)
+static void via2_nubus_irq_request(void *opaque, int n, int level)
 {
     MOS6522Q800VIA2State *v2s = opaque;
     MOS6522State *s = MOS6522(v2s);
-    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
+    qemu_irq irq = qdev_get_gpio_in(DEVICE(s), VIA2_IRQ_NUBUS_BIT);
 
     if (level) {
         /* Port A nubus IRQ inputs are active LOW */
-        s->a &= ~(1 << irq);
-        s->ifr |= 1 << VIA2_IRQ_NUBUS_BIT;
+        s->a &= ~(1 << n);
     } else {
-        s->a |= (1 << irq);
-        s->ifr &= ~(1 << VIA2_IRQ_NUBUS_BIT);
+        s->a |= (1 << n);
     }
 
-    mdc->update_irq(s);
+    qemu_set_irq(irq, level);
 }
 
 static void mos6522_q800_via2_init(Object *obj)
@@ -1177,8 +1141,6 @@ static void mos6522_q800_via2_init(Object *obj)
                           "via2", VIA_SIZE);
     sysbus_init_mmio(sbd, &v2s->via_mem);
 
-    qdev_init_gpio_in(DEVICE(obj), via2_irq_request, VIA2_IRQ_NB);
-
     qdev_init_gpio_in_named(DEVICE(obj), via2_nubus_irq_request, "nubus-irq",
                             VIA2_NUBUS_IRQ_NB);
 }
diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index e917a6a095..f76d9227d3 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -25,6 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "hw/irq.h"
 #include "hw/ppc/mac.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
@@ -96,9 +97,9 @@ static void cuda_set_sr_int(void *opaque)
     CUDAState *s = opaque;
     MOS6522CUDAState *mcs = &s->mos6522_cuda;
     MOS6522State *ms = MOS6522(mcs);
-    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(ms);
+    qemu_irq irq = qdev_get_gpio_in(DEVICE(ms), SR_INT_BIT);
 
-    mdc->set_sr_int(ms);
+    qemu_set_irq(irq, 1);
 }
 
 static void cuda_delay_set_sr_int(CUDAState *s)
diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
index eb39c64694..6e80fe1cfa 100644
--- a/hw/misc/macio/pmu.c
+++ b/hw/misc/macio/pmu.c
@@ -75,9 +75,9 @@ static void via_set_sr_int(void *opaque)
     PMUState *s = opaque;
     MOS6522PMUState *mps = MOS6522_PMU(&s->mos6522_pmu);
     MOS6522State *ms = MOS6522(mps);
-    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(ms);
+    qemu_irq irq = qdev_get_gpio_in(DEVICE(ms), SR_INT_BIT);
 
-    mdc->set_sr_int(ms);
+    qemu_set_irq(irq, 1);
 }
 
 static void pmu_update_extirq(PMUState *s)
diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 1c57332b40..6be6853dc2 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -52,6 +52,19 @@ static void mos6522_update_irq(MOS6522State *s)
     }
 }
 
+static void mos6522_set_irq(void *opaque, int n, int level)
+{
+    MOS6522State *s = MOS6522(opaque);
+
+    if (level) {
+        s->ifr |= 1 << n;
+    } else {
+        s->ifr &= ~(1 << n);
+    }
+
+    mos6522_update_irq(s);
+}
+
 static uint64_t get_counter_value(MOS6522State *s, MOS6522Timer *ti)
 {
     MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
@@ -488,6 +501,8 @@ static void mos6522_init(Object *obj)
 
     s->timers[0].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer1, s);
     s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer2, s);
+
+    qdev_init_gpio_in(DEVICE(obj), mos6522_set_irq, VIA_NUM_INTS);
 }
 
 static void mos6522_finalize(Object *obj)
diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index 2df1ab01b6..bffeba38ee 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -24,8 +24,6 @@
 #define VIA1_IRQ_ADB_DATA_BIT   CB2_INT_BIT
 #define VIA1_IRQ_ADB_CLOCK_BIT  CB1_INT_BIT
 
-#define VIA1_IRQ_NB             8
-
 #define VIA1_IRQ_ONE_SECOND     (1 << VIA1_IRQ_ONE_SECOND_BIT)
 #define VIA1_IRQ_60HZ           (1 << VIA1_IRQ_60HZ_BIT)
 #define VIA1_IRQ_ADB_READY      (1 << VIA1_IRQ_ADB_READY_BIT)
@@ -42,7 +40,7 @@ struct MOS6522Q800VIA1State {
 
     MemoryRegion via_mem;
 
-    qemu_irq irqs[VIA1_IRQ_NB];
+    qemu_irq irqs[VIA_NUM_INTS];
     qemu_irq auxmode_irq;
     uint8_t last_b;
 
@@ -85,8 +83,6 @@ struct MOS6522Q800VIA1State {
 #define VIA2_IRQ_SCSI_BIT       CB2_INT_BIT
 #define VIA2_IRQ_ASC_BIT        CB1_INT_BIT
 
-#define VIA2_IRQ_NB             8
-
 #define VIA2_IRQ_SCSI_DATA      (1 << VIA2_IRQ_SCSI_DATA_BIT)
 #define VIA2_IRQ_NUBUS          (1 << VIA2_IRQ_NUBUS_BIT)
 #define VIA2_IRQ_UNUSED         (1 << VIA2_IRQ_SCSI_BIT)
diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index 12abd8b8d2..ced8a670bf 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -57,6 +57,8 @@
 #define T2_INT             (1 << T2_INT_BIT)
 #define T1_INT             (1 << T1_INT_BIT)
 
+#define VIA_NUM_INTS       5
+
 /* Bits in ACR */
 #define T1MODE             0xc0    /* Timer 1 mode */
 #define T1MODE_CONT        0x40    /*  continuous interrupts */
-- 
2.20.1



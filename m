Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9619B38186D
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:39:41 +0200 (CEST)
Received: from localhost ([::1]:58548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhsdw-0001En-Kr
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lhsXq-0004Oi-2g
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:33:22 -0400
Received: from mailout05.t-online.de ([194.25.134.82]:50344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lhsXi-0003Mb-BP
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:33:21 -0400
Received: from fwd04.aul.t-online.de (fwd04.aul.t-online.de [172.20.26.149])
 by mailout05.t-online.de (Postfix) with SMTP id CC1DB641C3;
 Sat, 15 May 2021 13:33:12 +0200 (CEST)
Received: from linpower.localnet
 (TQSeoTZvYhHZBhvR+0vmvbvZUGK7jSh3D9XHH2XSQEXvK5U8QOqFxuUuSZIbayKQni@[79.208.18.63])
 by fwd04.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lhsXc-1Uz0LI0; Sat, 15 May 2021 13:33:08 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id ACEF6200628; Sat, 15 May 2021 13:32:54 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 06/11] pckbd: PS/2 keyboard throttle
Date: Sat, 15 May 2021 13:32:49 +0200
Message-Id: <20210515113254.6245-6-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
References: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: TQSeoTZvYhHZBhvR+0vmvbvZUGK7jSh3D9XHH2XSQEXvK5U8QOqFxuUuSZIbayKQni
X-TOI-EXPURGATEID: 150726::1621078388-00007E51-623C4B1D/0/0 CLEAN NORMAL
X-TOI-MSGID: de8a78cb-69ef-4f19-9202-a433f242cbe8
Received-SPF: none client-ip=194.25.134.82;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout05.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Limit the keyboard data rate to the serial link speed. Some old
DOS software relies on being able to read an incoming scan-code
more than once. After reading keyboard data from the i8042
controller, the guest software has 1ms to read the same data
again.

Use -global i8042.kbd-throttle=on to enable this feature.

To see how this patch works, start a FreeDOS 1.2 guest with the
qemu option -global i8042.kbd-throttle=on and open a text file
with the vim 7.3 32 bit for DOS executable. Then use the cursor
keys (not the cursor keys on the numeric keypad) to move through
the text. Without the kbd-throttle option enabled each keystroke
will move the cursor two positions.

Buglink: https://bugs.launchpad.net/bugs/1895363
Buglink: https://bugs.launchpad.net/bugs/1897568
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/pckbd.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 8336f4e4b3..ebf08c7cb8 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -24,12 +24,14 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/timer.h"
 #include "hw/isa/isa.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/input/ps2.h"
 #include "hw/irq.h"
 #include "hw/input/i8042.h"
+#include "hw/qdev-properties.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 
@@ -131,17 +133,21 @@
 #define KBD_PENDING_KBD         1
 #define KBD_PENDING_AUX         2
 
+#define KBD_MIGR_TIMER_PENDING  0x1
+
 typedef struct KBDState {
     uint8_t write_cmd; /* if non zero, write data to port 60 is expected */
     uint8_t status;
     uint8_t mode;
     uint8_t outport;
+    uint32_t migration_flags;
     bool outport_present;
     /* Bitmask of devices with data available.  */
     uint8_t pending;
     uint8_t obdata;
     void *kbd;
     void *mouse;
+    QEMUTimer *throttle_timer;
 
     qemu_irq irq_kbd;
     qemu_irq irq_mouse;
@@ -206,6 +212,10 @@ static void kbd_safe_update_irq(KBDState *s)
     if (s->status & KBD_STAT_OBF) {
         return;
     }
+    /* the throttle timer is pending and will call kbd_update_irq() */
+    if (s->throttle_timer && timer_pending(s->throttle_timer)) {
+        return;
+    }
     if (s->pending) {
         kbd_update_irq(s);
     }
@@ -235,6 +245,15 @@ static void kbd_update_aux_irq(void *opaque, int level)
     kbd_safe_update_irq(s);
 }
 
+static void kbd_throttle_timeout(void *opaque)
+{
+    KBDState *s = opaque;
+
+    if (s->pending) {
+        kbd_update_irq(s);
+    }
+}
+
 static uint64_t kbd_read_status(void *opaque, hwaddr addr,
                                 unsigned size)
 {
@@ -356,6 +375,10 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
         if (status & KBD_STAT_MOUSE_OBF) {
             s->obdata = ps2_read_data(s->mouse);
         } else {
+            if (s->throttle_timer) {
+                timer_mod(s->throttle_timer,
+                          qemu_clock_get_us(QEMU_CLOCK_VIRTUAL) + 1000);
+            }
             s->obdata = ps2_read_data(s->kbd);
         }
     }
@@ -417,6 +440,9 @@ static void kbd_reset(void *opaque)
     s->outport_present = false;
     s->pending = 0;
     kbd_deassert_irq(s);
+    if (s->throttle_timer) {
+        timer_del(s->throttle_timer);
+    }
 }
 
 static uint8_t kbd_outport_default(KBDState *s)
@@ -451,6 +477,18 @@ static const VMStateDescription vmstate_kbd_outport = {
     }
 };
 
+static int kbd_pre_save(void *opaque)
+{
+    KBDState *s = opaque;
+
+    s->migration_flags = 0;
+    if (s->throttle_timer && timer_pending(s->throttle_timer)) {
+        s->migration_flags |= KBD_MIGR_TIMER_PENDING;
+    }
+
+    return 0;
+}
+
 static int kbd_post_load(void *opaque, int version_id)
 {
     KBDState *s = opaque;
@@ -458,6 +496,9 @@ static int kbd_post_load(void *opaque, int version_id)
         s->outport = kbd_outport_default(s);
     }
     s->outport_present = false;
+    if (s->migration_flags & KBD_MIGR_TIMER_PENDING) {
+        kbd_throttle_timeout(s);
+    }
     return 0;
 }
 
@@ -465,12 +506,14 @@ static const VMStateDescription vmstate_kbd = {
     .name = "pckbd",
     .version_id = 4,
     .minimum_version_id = 3,
+    .pre_save = kbd_pre_save,
     .post_load = kbd_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(write_cmd, KBDState),
         VMSTATE_UINT8(status, KBDState),
         VMSTATE_UINT8(mode, KBDState),
         VMSTATE_UINT8(pending, KBDState),
+        VMSTATE_UINT32_V(migration_flags, KBDState, 4),
         VMSTATE_UINT8_V(obdata, KBDState, 4),
         VMSTATE_END_OF_LIST()
     },
@@ -534,6 +577,7 @@ struct ISAKBDState {
     ISADevice parent_obj;
 
     KBDState kbd;
+    bool kbd_throttle;
     MemoryRegion io[2];
 };
 
@@ -614,6 +658,10 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
 
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
+    if (isa_s->kbd_throttle) {
+        s->throttle_timer = timer_new_us(QEMU_CLOCK_VIRTUAL,
+                                         kbd_throttle_timeout, s);
+    }
     qemu_register_reset(kbd_reset, s);
 }
 
@@ -645,11 +693,17 @@ static void i8042_build_aml(ISADevice *isadev, Aml *scope)
     aml_append(scope, mou);
 }
 
+static Property i8042_properties[] = {
+    DEFINE_PROP_BOOL("kbd-throttle", ISAKBDState, kbd_throttle, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void i8042_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
 
+    device_class_set_props(dc, i8042_properties);
     dc->realize = i8042_realizefn;
     dc->vmsd = &vmstate_kbd_isa;
     isa->build_aml = i8042_build_aml;
-- 
2.26.2



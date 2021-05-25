Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7487E3908E9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 20:25:28 +0200 (CEST)
Received: from localhost ([::1]:44852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbk7-0006uU-HD
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 14:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llbaS-0002kd-Au
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:30 -0400
Received: from mailout01.t-online.de ([194.25.134.80]:60910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llbaJ-0003nN-D6
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:28 -0400
Received: from fwd03.aul.t-online.de (fwd03.aul.t-online.de [172.20.27.148])
 by mailout01.t-online.de (Postfix) with SMTP id 94C995C02D;
 Tue, 25 May 2021 20:14:56 +0200 (CEST)
Received: from linpower.localnet
 (TD4aw+ZG8h1X4ZuLDoF1MKe1s1JyWP7DX-YV5YyANqZocMAH+hvdWaIbNwM+knuguH@[93.236.158.49])
 by fwd03.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1llbZv-41OX6u0; Tue, 25 May 2021 20:14:55 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 9099E200546; Tue, 25 May 2021 20:14:41 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 06/12] pckbd: PS/2 keyboard throttle
Date: Tue, 25 May 2021 20:14:35 +0200
Message-Id: <20210525181441.27768-6-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
References: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: TD4aw+ZG8h1X4ZuLDoF1MKe1s1JyWP7DX-YV5YyANqZocMAH+hvdWaIbNwM+knuguH
X-TOI-EXPURGATEID: 150726::1621966495-00010F52-6B4D8D12/0/0 CLEAN NORMAL
X-TOI-MSGID: 11e92234-1e70-4e41-85e4-52a21fbe1ec0
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 hw/input/pckbd.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 6695516c23..516ed5a397 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -23,13 +23,16 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
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
 
@@ -131,11 +134,14 @@
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
     bool extended_state;
     /* Bitmask of devices with data available.  */
@@ -143,6 +149,7 @@ typedef struct KBDState {
     uint8_t obdata;
     void *kbd;
     void *mouse;
+    QEMUTimer *throttle_timer;
 
     qemu_irq irq_kbd;
     qemu_irq irq_mouse;
@@ -207,6 +214,10 @@ static void kbd_safe_update_irq(KBDState *s)
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
@@ -236,6 +247,15 @@ static void kbd_update_aux_irq(void *opaque, int level)
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
@@ -357,6 +377,10 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
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
@@ -418,6 +442,9 @@ static void kbd_reset(void *opaque)
     s->outport_present = false;
     s->pending = 0;
     kbd_deassert_irq(s);
+    if (s->throttle_timer) {
+        timer_del(s->throttle_timer);
+    }
 }
 
 static uint8_t kbd_outport_default(KBDState *s)
@@ -452,6 +479,29 @@ static const VMStateDescription vmstate_kbd_outport = {
     }
 };
 
+static int kbd_extended_state_pre_save(void *opaque)
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
+static int kbd_extended_state_post_load(void *opaque, int version_id)
+{
+    KBDState *s = opaque;
+
+    if (s->migration_flags & KBD_MIGR_TIMER_PENDING) {
+        kbd_throttle_timeout(s);
+    }
+
+    return 0;
+}
+
 static bool kbd_extended_state_needed(void *opaque)
 {
     KBDState *s = opaque;
@@ -461,8 +511,11 @@ static bool kbd_extended_state_needed(void *opaque)
 
 static const VMStateDescription vmstate_kbd_extended_state = {
     .name = "pckbd/extended_state",
+    .post_load = kbd_extended_state_post_load,
+    .pre_save = kbd_extended_state_pre_save,
     .needed = kbd_extended_state_needed,
     .fields = (VMStateField[]) {
+        VMSTATE_UINT32(migration_flags, KBDState),
         VMSTATE_UINT8(obdata, KBDState),
         VMSTATE_END_OF_LIST()
     }
@@ -553,6 +606,7 @@ struct ISAKBDState {
     ISADevice parent_obj;
 
     KBDState kbd;
+    bool kbd_throttle;
     MemoryRegion io[2];
 };
 
@@ -625,6 +679,13 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
 
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
+    if (isa_s->kbd_throttle && !isa_s->kbd.extended_state) {
+        warn_report(TYPE_I8042 ": can't enable kbd-throttle without"
+                    " extended-state, disabling kbd-throttle");
+    } else if (isa_s->kbd_throttle) {
+        s->throttle_timer = timer_new_us(QEMU_CLOCK_VIRTUAL,
+                                         kbd_throttle_timeout, s);
+    }
     qemu_register_reset(kbd_reset, s);
 }
 
@@ -658,6 +719,7 @@ static void i8042_build_aml(ISADevice *isadev, Aml *scope)
 
 static Property i8042_properties[] = {
     DEFINE_PROP_BOOL("extended-state", ISAKBDState, kbd.extended_state, true),
+    DEFINE_PROP_BOOL("kbd-throttle", ISAKBDState, kbd_throttle, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.26.2



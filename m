Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEA0376A13
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 20:35:04 +0200 (CEST)
Received: from localhost ([::1]:51878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf5JX-0005Dy-EB
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 14:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lf51B-0000b2-Ed
 for qemu-devel@nongnu.org; Fri, 07 May 2021 14:16:05 -0400
Received: from mailout12.t-online.de ([194.25.134.22]:53506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lf4vT-0001YP-SP
 for qemu-devel@nongnu.org; Fri, 07 May 2021 14:10:25 -0400
Received: from fwd01.aul.t-online.de (fwd01.aul.t-online.de [172.20.27.147])
 by mailout12.t-online.de (Postfix) with SMTP id 75EAC484F1;
 Fri,  7 May 2021 20:10:09 +0200 (CEST)
Received: from linpower.localnet
 (VT2FCZZvZhHilWwjTFIpKUxq4ft7s5nCgc06t6cP9Cj5eO2QnObgQyiSHNixlKmgqo@[46.86.52.8])
 by fwd01.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lf4vM-0G55Ky0; Fri, 7 May 2021 20:10:04 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 65AC72006EB; Fri,  7 May 2021 20:09:53 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 05/11] pckbd: don't update OBF flags if KBD_STAT_OBF is set
Date: Fri,  7 May 2021 20:09:47 +0200
Message-Id: <20210507180953.8530-5-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <a898b0d5-7086-9699-ae8b-9524ad319b01@t-online.de>
References: <a898b0d5-7086-9699-ae8b-9524ad319b01@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: VT2FCZZvZhHilWwjTFIpKUxq4ft7s5nCgc06t6cP9Cj5eO2QnObgQyiSHNixlKmgqo
X-TOI-EXPURGATEID: 150726::1620411004-0000B607-EEE96906/0/0 CLEAN NORMAL
X-TOI-MSGID: 0796e5a0-2886-46d6-97d2-9b990960546c
Received-SPF: none client-ip=194.25.134.22;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout12.t-online.de
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

Don't update the OBF flags in the status register and the cor-
responding IRQ lines if KBD_STAT_OBF is set. Otherwise this
may change the PS/2 event type. If the guest ISR was already
scheduled, the changed event type will be rather surprising for
the guest.

This fixes a mouse event stream corruption. To reproduce the
problem start a FreeDOS 1.2 guest with -machine pc,accel=kvm
and -display gtk. The KVM in-kernel irqchip has to be enabled.
Now open a text file with edit.exe in the guest and hold down
the cursor right key and at the same time move the mouse around.
You will quickly notice erratic mouse movements and unexpected
mouse clicks.

A trace file shows the mouse event stream corruption. Guest
rip 0xce93 (f000:ce93) is the in al,0x60 instruction in the
seabios mouse ISR, guest rip 0xceca (f000:ceca) is the
in al,0x60 instruction in the seabios keyboard ISR.

qemu-system-x86-5659  [007] ....   280.971116:
 tracing_mark_write: pckbd_kbd_update_irq kbd=0 aux=1
 # gtk queues a mouse event

qemu-system-x86-5665  [000] ....   280.971121:
 kvm_exit: reason EXTERNAL_INTERRUPT rip 0x22da info 0 800000fd
qemu-system-x86-5665  [000] d..1   280.971122:
 kvm_entry: vcpu 0, rip 0x22da
qemu-system-x86-5665  [000] ....   280.971123:
 kvm_exit: reason EXTERNAL_INTERRUPT rip 0x22da info 0 800000fd
qemu-system-x86-5665  [000] d..1   280.971124:
 kvm_entry: vcpu 0, rip 0x22da
qemu-system-x86-5665  [000] ....   280.971126:
 kvm_exit: reason IO_INSTRUCTION rip 0x110c8c info 640008 0
qemu-system-x86-5665  [000] ....   280.971176:
 tracing_mark_write: pckbd_kbd_read_status 0x3d
 # KBD_STAT_OBF and KBD_STAT_MOUSE_OBF set, the mouse ISR will
 # read data from the PS/2 controller.

qemu-system-x86-5665  [000] d..1   280.971180:
 kvm_entry: vcpu 0, rip 0x110c8d
qemu-system-x86-5665  [000] ....   280.971191:
 kvm_exit: reason EXTERNAL_INTERRUPT rip 0x110c8d info 0 800000f6
qemu-system-x86-5665  [000] d..1   280.971191:
 kvm_entry: vcpu 0, rip 0x110c8d
qemu-system-x86-5665  [000] ....   280.971193:
 kvm_exit: reason IO_INSTRUCTION rip 0xce93 info 600048 0
 # the mouse ISR wants to read data from the PS/2 controller

qemu-system-x86-5659  [007] ....   280.971231:
 tracing_mark_write: pckbd_kbd_update_irq kbd=1 aux=0
qemu-system-x86-5659  [007] ....   280.971238:
 tracing_mark_write: pckbd_kbd_update_irq kbd=1 aux=0
 # gtk queues a keyboard event 0xe0 0x4d (key right)

qemu-system-x86-5665  [000] ....   280.971257:
 tracing_mark_write: pckbd_kbd_update_irq kbd=0 aux=1
qemu-system-x86-5665  [000] ....   280.971262:
 tracing_mark_write: pckbd_kbd_update_irq kbd=1 aux=0
 # ps2_read_data() deasserts and reasserts the keyboard IRQ

qemu-system-x86-5665  [000] ....   280.971266:
 tracing_mark_write: pckbd_kbd_read_data 0xe0 kbd
 # -> the mouse ISR receives keyboard data

qemu-system-x86-5665  [000] d..1   280.971268:
 kvm_entry: vcpu 0, rip 0xce95
qemu-system-x86-5665  [000] ....   280.971269:
 kvm_exit: reason IO_INSTRUCTION rip 0xe828 info a00040 0
qemu-system-x86-5665  [000] ....   280.971270:
 kvm_ack_irq: irqchip PIC slave pin 12
qemu-system-x86-5665  [000] d..1   280.971270:
 kvm_entry: vcpu 0, rip 0xe82a
qemu-system-x86-5665  [000] ....   280.971271:
 kvm_exit: reason IO_INSTRUCTION rip 0xe82a info 200040 0
qemu-system-x86-5665  [000] ....   280.971271:
 kvm_ack_irq: irqchip PIC master pin 2
qemu-system-x86-5665  [000] d..1   280.971271:
 kvm_entry: vcpu 0, rip 0xe82c
qemu-system-x86-5665  [000] ....   280.971272:
 kvm_exit: reason PENDING_INTERRUPT rip 0x22da info 0 0
qemu-system-x86-5665  [000] d..1   280.971273:
 kvm_entry: vcpu 0, rip 0x22da
qemu-system-x86-5665  [000] ....   280.971274:
 kvm_exit: reason IO_INSTRUCTION rip 0x110c8c info 640008 0
qemu-system-x86-5665  [000] ....   280.971275:
 tracing_mark_write: pckbd_kbd_read_status 0x1d
qemu-system-x86-5665  [000] d..1   280.971276:
 kvm_entry: vcpu 0, rip 0x110c8d
qemu-system-x86-5665  [000] ....   280.971277:
 kvm_exit: reason IO_INSTRUCTION rip 0xceca info 600048 0
 # the keyboard ISR wants to read data from the PS/2 controller

qemu-system-x86-5665  [000] ....   280.971279:
 tracing_mark_write: pckbd_kbd_update_irq kbd=0 aux=1
qemu-system-x86-5665  [000] ....   280.971282:
 tracing_mark_write: pckbd_kbd_read_data 0x4d kbd
 # the keyboard ISR receives the second byte of the keyboard event

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/pckbd.c | 91 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 68 insertions(+), 23 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 90b33954a8..8336f4e4b3 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -139,6 +139,7 @@ typedef struct KBDState {
     bool outport_present;
     /* Bitmask of devices with data available.  */
     uint8_t pending;
+    uint8_t obdata;
     void *kbd;
     void *mouse;
 
@@ -173,6 +174,13 @@ static void kbd_update_irq_lines(KBDState *s)
     qemu_set_irq(s->irq_mouse, irq_mouse_level);
 }
 
+static void kbd_deassert_irq(KBDState *s)
+{
+    s->status &= ~(KBD_STAT_OBF | KBD_STAT_MOUSE_OBF);
+    s->outport &= ~(KBD_OUT_OBF | KBD_OUT_MOUSE_OBF);
+    kbd_update_irq_lines(s);
+}
+
 /* update irq and KBD_STAT_[MOUSE_]OBF */
 static void kbd_update_irq(KBDState *s)
 {
@@ -181,7 +189,6 @@ static void kbd_update_irq(KBDState *s)
     if (s->pending) {
         s->status |= KBD_STAT_OBF;
         s->outport |= KBD_OUT_OBF;
-        /* kbd data takes priority over aux data.  */
         if (s->pending == KBD_PENDING_AUX) {
             s->status |= KBD_STAT_MOUSE_OBF;
             s->outport |= KBD_OUT_MOUSE_OBF;
@@ -190,26 +197,42 @@ static void kbd_update_irq(KBDState *s)
     kbd_update_irq_lines(s);
 }
 
+static void kbd_safe_update_irq(KBDState *s)
+{
+    /*
+     * with KBD_STAT_OBF set, a call to kbd_read_data() will eventually call
+     * kbd_update_irq()
+     */
+    if (s->status & KBD_STAT_OBF) {
+        return;
+    }
+    if (s->pending) {
+        kbd_update_irq(s);
+    }
+}
+
 static void kbd_update_kbd_irq(void *opaque, int level)
 {
-    KBDState *s = (KBDState *)opaque;
+    KBDState *s = opaque;
 
-    if (level)
+    if (level) {
         s->pending |= KBD_PENDING_KBD;
-    else
+    } else {
         s->pending &= ~KBD_PENDING_KBD;
-    kbd_update_irq(s);
+    }
+    kbd_safe_update_irq(s);
 }
 
 static void kbd_update_aux_irq(void *opaque, int level)
 {
-    KBDState *s = (KBDState *)opaque;
+    KBDState *s = opaque;
 
-    if (level)
+    if (level) {
         s->pending |= KBD_PENDING_AUX;
-    else
+    } else {
         s->pending &= ~KBD_PENDING_AUX;
-    kbd_update_irq(s);
+    }
+    kbd_safe_update_irq(s);
 }
 
 static uint64_t kbd_read_status(void *opaque, hwaddr addr,
@@ -290,11 +313,10 @@ static void kbd_write_command(void *opaque, hwaddr addr,
         break;
     case KBD_CCMD_KBD_DISABLE:
         s->mode |= KBD_MODE_DISABLE_KBD;
-        kbd_update_irq(s);
         break;
     case KBD_CCMD_KBD_ENABLE:
         s->mode &= ~KBD_MODE_DISABLE_KBD;
-        kbd_update_irq(s);
+        kbd_safe_update_irq(s);
         break;
     case KBD_CCMD_READ_INPORT:
         kbd_queue(s, 0x80, 0);
@@ -327,15 +349,19 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
                               unsigned size)
 {
     KBDState *s = opaque;
-    uint32_t val;
+    uint8_t status = s->status;
 
-    if (s->pending == KBD_PENDING_AUX)
-        val = ps2_read_data(s->mouse);
-    else
-        val = ps2_read_data(s->kbd);
+    if (status & KBD_STAT_OBF) {
+        kbd_deassert_irq(s);
+        if (status & KBD_STAT_MOUSE_OBF) {
+            s->obdata = ps2_read_data(s->mouse);
+        } else {
+            s->obdata = ps2_read_data(s->kbd);
+        }
+    }
 
-    trace_pckbd_kbd_read_data(val);
-    return val;
+    trace_pckbd_kbd_read_data(s->obdata);
+    return s->obdata;
 }
 
 static void kbd_write_data(void *opaque, hwaddr addr,
@@ -352,8 +378,16 @@ static void kbd_write_data(void *opaque, hwaddr addr,
     case KBD_CCMD_WRITE_MODE:
         s->mode = val;
         ps2_keyboard_set_translation(s->kbd, (s->mode & KBD_MODE_KCC) != 0);
-        /* ??? */
-        kbd_update_irq(s);
+        /*
+         * a write to the mode byte interrupt enable flags directly updates
+         * the irq lines
+         */
+        kbd_update_irq_lines(s);
+        /*
+         * a write to the mode byte disable interface flags may raise
+         * an irq if there is pending data in the PS/2 queues.
+         */
+        kbd_safe_update_irq(s);
         break;
     case KBD_CCMD_WRITE_OBUF:
         kbd_queue(s, val, 0);
@@ -381,6 +415,8 @@ static void kbd_reset(void *opaque)
     s->status = KBD_STAT_CMD | KBD_STAT_UNLOCKED;
     s->outport = KBD_OUT_RESET | KBD_OUT_A20 | KBD_OUT_ONES;
     s->outport_present = false;
+    s->pending = 0;
+    kbd_deassert_irq(s);
 }
 
 static uint8_t kbd_outport_default(KBDState *s)
@@ -427,7 +463,7 @@ static int kbd_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_kbd = {
     .name = "pckbd",
-    .version_id = 3,
+    .version_id = 4,
     .minimum_version_id = 3,
     .post_load = kbd_post_load,
     .fields = (VMStateField[]) {
@@ -435,6 +471,7 @@ static const VMStateDescription vmstate_kbd = {
         VMSTATE_UINT8(status, KBDState),
         VMSTATE_UINT8(mode, KBDState),
         VMSTATE_UINT8(pending, KBDState),
+        VMSTATE_UINT8_V(obdata, KBDState, 4),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription*[]) {
@@ -512,12 +549,20 @@ void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out)
     qdev_connect_gpio_out_named(DEVICE(dev), I8042_A20_LINE, 0, a20_out);
 }
 
+static bool vmstate_version_id_3(void *opaque, int version_id)
+{
+    return version_id == 3;
+}
+
 static const VMStateDescription vmstate_kbd_isa = {
     .name = "pckbd",
-    .version_id = 3,
+    .version_id = 4,
     .minimum_version_id = 3,
     .fields = (VMStateField[]) {
-        VMSTATE_STRUCT(kbd, ISAKBDState, 0, vmstate_kbd, KBDState),
+        VMSTATE_VSTRUCT_TEST(kbd, ISAKBDState, vmstate_version_id_3,
+                             3, vmstate_kbd, KBDState, 3),
+        VMSTATE_VSTRUCT_TEST(kbd, ISAKBDState, NULL,
+                             4, vmstate_kbd, KBDState, 4),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.26.2



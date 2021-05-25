Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A153908CA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 20:19:22 +0200 (CEST)
Received: from localhost ([::1]:59572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbeD-0005xR-Oh
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 14:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llba3-0002a8-Nx
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:05 -0400
Received: from mailout07.t-online.de ([194.25.134.83]:45348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llbZw-0003cg-SD
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:03 -0400
Received: from fwd04.aul.t-online.de (fwd04.aul.t-online.de [172.20.26.149])
 by mailout07.t-online.de (Postfix) with SMTP id F2EF254DFB;
 Tue, 25 May 2021 20:14:54 +0200 (CEST)
Received: from linpower.localnet
 (bKYWRrZSYhlzl5O9HNRJKFHozKJ8hgxJT3NCrJFBcRAPzoGs5ITU3faVXqnuKWegr2@[93.236.158.49])
 by fwd04.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1llbZs-3pnjGa0; Tue, 25 May 2021 20:14:52 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 8D52F2000C0; Tue, 25 May 2021 20:14:41 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 05/12] pckbd: don't update OBF flags if KBD_STAT_OBF is set
Date: Tue, 25 May 2021 20:14:34 +0200
Message-Id: <20210525181441.27768-5-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
References: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: bKYWRrZSYhlzl5O9HNRJKFHozKJ8hgxJT3NCrJFBcRAPzoGs5ITU3faVXqnuKWegr2
X-TOI-EXPURGATEID: 150726::1621966492-00007E51-49E91A69/0/0 CLEAN NORMAL
X-TOI-MSGID: 4c319365-d74c-4e44-82d6-5ba4dd1609f7
Received-SPF: none client-ip=194.25.134.83;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout07.t-online.de
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
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
 hw/core/machine.c |   1 +
 hw/input/pckbd.c  | 102 +++++++++++++++++++++++++++++++++++++---------
 2 files changed, 83 insertions(+), 20 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1bf0e687b9..55b9bc7817 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -38,6 +38,7 @@
 
 GlobalProperty hw_compat_6_0[] = {
     { "gpex-pcihost", "allow-unmapped-accesses", "false" },
+    { "i8042", "extended-state", "false"},
 };
 const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
 
diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 90b33954a8..6695516c23 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -137,8 +137,10 @@ typedef struct KBDState {
     uint8_t mode;
     uint8_t outport;
     bool outport_present;
+    bool extended_state;
     /* Bitmask of devices with data available.  */
     uint8_t pending;
+    uint8_t obdata;
     void *kbd;
     void *mouse;
 
@@ -173,6 +175,13 @@ static void kbd_update_irq_lines(KBDState *s)
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
@@ -181,7 +190,6 @@ static void kbd_update_irq(KBDState *s)
     if (s->pending) {
         s->status |= KBD_STAT_OBF;
         s->outport |= KBD_OUT_OBF;
-        /* kbd data takes priority over aux data.  */
         if (s->pending == KBD_PENDING_AUX) {
             s->status |= KBD_STAT_MOUSE_OBF;
             s->outport |= KBD_OUT_MOUSE_OBF;
@@ -190,26 +198,42 @@ static void kbd_update_irq(KBDState *s)
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
@@ -290,11 +314,10 @@ static void kbd_write_command(void *opaque, hwaddr addr,
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
@@ -327,15 +350,19 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
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
@@ -352,8 +379,16 @@ static void kbd_write_data(void *opaque, hwaddr addr,
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
@@ -381,6 +416,8 @@ static void kbd_reset(void *opaque)
     s->status = KBD_STAT_CMD | KBD_STAT_UNLOCKED;
     s->outport = KBD_OUT_RESET | KBD_OUT_A20 | KBD_OUT_ONES;
     s->outport_present = false;
+    s->pending = 0;
+    kbd_deassert_irq(s);
 }
 
 static uint8_t kbd_outport_default(KBDState *s)
@@ -415,6 +452,22 @@ static const VMStateDescription vmstate_kbd_outport = {
     }
 };
 
+static bool kbd_extended_state_needed(void *opaque)
+{
+    KBDState *s = opaque;
+
+    return s->extended_state;
+}
+
+static const VMStateDescription vmstate_kbd_extended_state = {
+    .name = "pckbd/extended_state",
+    .needed = kbd_extended_state_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(obdata, KBDState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static int kbd_post_load(void *opaque, int version_id)
 {
     KBDState *s = opaque;
@@ -439,6 +492,7 @@ static const VMStateDescription vmstate_kbd = {
     },
     .subsections = (const VMStateDescription*[]) {
         &vmstate_kbd_outport,
+        &vmstate_kbd_extended_state,
         NULL
     }
 };
@@ -484,6 +538,8 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     s->irq_mouse = mouse_irq;
     s->mask = mask;
 
+    s->extended_state = true;
+
     vmstate_register(NULL, 0, &vmstate_kbd, s);
 
     memory_region_init_io(region, NULL, &i8042_mmio_ops, s, "i8042", size);
@@ -600,11 +656,17 @@ static void i8042_build_aml(ISADevice *isadev, Aml *scope)
     aml_append(scope, mou);
 }
 
+static Property i8042_properties[] = {
+    DEFINE_PROP_BOOL("extended-state", ISAKBDState, kbd.extended_state, true),
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



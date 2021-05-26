Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329323919A3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:14:12 +0200 (CEST)
Received: from localhost ([::1]:57412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluIV-0000QF-9I
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBb-0003TW-T1
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBX-000430-D4
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622038017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WXz815r8Lbg5bqcS1ElYYh79dCj4U9AEf5bagVD8VK0=;
 b=RJqGhXvmp1UJvZnvdmRuZ7iV2jwGbqDu2aRKHtVEFEAl08wSnNXzN+HqN8EwAdTT3VsjN+
 uJMA9pQBZYT2cK2/d/MDPVI7cdtZE9L3kgDYC6Smtavp4rcQaKp/WCLdTjtetBPAarg+Nm
 nc+tLMkbTbS3S6Scol98hMIW/3ezgRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-8uWVpRbROiaNBh8Gbgbfew-1; Wed, 26 May 2021 10:06:55 -0400
X-MC-Unique: 8uWVpRbROiaNBh8Gbgbfew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F82C1034B37;
 Wed, 26 May 2021 14:06:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC07290BE;
 Wed, 26 May 2021 14:06:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ADA971800874; Wed, 26 May 2021 16:06:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/14] pckbd: don't update OBF flags if KBD_STAT_OBF is set
Date: Wed, 26 May 2021 16:06:19 +0200
Message-Id: <20210526140627.381857-7-kraxel@redhat.com>
In-Reply-To: <20210526140627.381857-1-kraxel@redhat.com>
References: <20210526140627.381857-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

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
Message-Id: <20210525181441.27768-5-vr_qemu@t-online.de>

[ kraxel: add missing include ]

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/core/machine.c |   1 +
 hw/input/pckbd.c  | 103 +++++++++++++++++++++++++++++++++++++---------
 2 files changed, 84 insertions(+), 20 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1bf0e687b94a..55b9bc7817d8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -38,6 +38,7 @@
 
 GlobalProperty hw_compat_6_0[] = {
     { "gpex-pcihost", "allow-unmapped-accesses", "false" },
+    { "i8042", "extended-state", "false"},
 };
 const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
 
diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 90b33954a8e9..fbd57bf0f572 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -30,6 +30,7 @@
 #include "hw/input/ps2.h"
 #include "hw/irq.h"
 #include "hw/input/i8042.h"
+#include "hw/qdev-properties.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 
@@ -137,8 +138,10 @@ typedef struct KBDState {
     uint8_t mode;
     uint8_t outport;
     bool outport_present;
+    bool extended_state;
     /* Bitmask of devices with data available.  */
     uint8_t pending;
+    uint8_t obdata;
     void *kbd;
     void *mouse;
 
@@ -173,6 +176,13 @@ static void kbd_update_irq_lines(KBDState *s)
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
@@ -181,7 +191,6 @@ static void kbd_update_irq(KBDState *s)
     if (s->pending) {
         s->status |= KBD_STAT_OBF;
         s->outport |= KBD_OUT_OBF;
-        /* kbd data takes priority over aux data.  */
         if (s->pending == KBD_PENDING_AUX) {
             s->status |= KBD_STAT_MOUSE_OBF;
             s->outport |= KBD_OUT_MOUSE_OBF;
@@ -190,26 +199,42 @@ static void kbd_update_irq(KBDState *s)
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
@@ -290,11 +315,10 @@ static void kbd_write_command(void *opaque, hwaddr addr,
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
@@ -327,15 +351,19 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
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
@@ -352,8 +380,16 @@ static void kbd_write_data(void *opaque, hwaddr addr,
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
@@ -381,6 +417,8 @@ static void kbd_reset(void *opaque)
     s->status = KBD_STAT_CMD | KBD_STAT_UNLOCKED;
     s->outport = KBD_OUT_RESET | KBD_OUT_A20 | KBD_OUT_ONES;
     s->outport_present = false;
+    s->pending = 0;
+    kbd_deassert_irq(s);
 }
 
 static uint8_t kbd_outport_default(KBDState *s)
@@ -415,6 +453,22 @@ static const VMStateDescription vmstate_kbd_outport = {
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
@@ -439,6 +493,7 @@ static const VMStateDescription vmstate_kbd = {
     },
     .subsections = (const VMStateDescription*[]) {
         &vmstate_kbd_outport,
+        &vmstate_kbd_extended_state,
         NULL
     }
 };
@@ -484,6 +539,8 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     s->irq_mouse = mouse_irq;
     s->mask = mask;
 
+    s->extended_state = true;
+
     vmstate_register(NULL, 0, &vmstate_kbd, s);
 
     memory_region_init_io(region, NULL, &i8042_mmio_ops, s, "i8042", size);
@@ -600,11 +657,17 @@ static void i8042_build_aml(ISADevice *isadev, Aml *scope)
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
2.31.1



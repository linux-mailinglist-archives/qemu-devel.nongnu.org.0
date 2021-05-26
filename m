Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3706739198F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:09:23 +0200 (CEST)
Received: from localhost ([::1]:41098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lluDq-0006Hi-6P
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBg-0003VS-9B
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lluBd-00045z-Ki
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:07:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622038023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hdu8ay89cibhhwgLBEbFgoAkk0h2Aqwyp7m2Ec4zUFk=;
 b=DyUB25xUNdZIssxbo1lvnlawaZtImoqOerDRfbwQ03peO7Rs7WZSJk7Vi3TWac2jkxCxVo
 Y5HFGMEnLaG9oH+J4O5hJ/Nq3FJtkgPY2ovd4z8tFhzZ7TH0zCZUs0xNQZNPE3PF3re7vk
 e/ECP2mdh+RuirJ2thDy5NZpZ3QBAQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-Dmy9qcqOOoyDGhCbiCEEhA-1; Wed, 26 May 2021 10:06:59 -0400
X-MC-Unique: Dmy9qcqOOoyDGhCbiCEEhA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 639EF107ACCD;
 Wed, 26 May 2021 14:06:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E07A53A47;
 Wed, 26 May 2021 14:06:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BA0FE1800905; Wed, 26 May 2021 16:06:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/14] pckbd: PS/2 keyboard throttle
Date: Wed, 26 May 2021 16:06:20 +0200
Message-Id: <20210526140627.381857-8-kraxel@redhat.com>
In-Reply-To: <20210526140627.381857-1-kraxel@redhat.com>
References: <20210526140627.381857-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Message-Id: <20210525181441.27768-6-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/pckbd.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index fbd57bf0f572..516ed5a397cd 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -23,7 +23,9 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu/log.h"
+#include "qemu/timer.h"
 #include "hw/isa/isa.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/aml-build.h"
@@ -132,11 +134,14 @@
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
@@ -144,6 +149,7 @@ typedef struct KBDState {
     uint8_t obdata;
     void *kbd;
     void *mouse;
+    QEMUTimer *throttle_timer;
 
     qemu_irq irq_kbd;
     qemu_irq irq_mouse;
@@ -208,6 +214,10 @@ static void kbd_safe_update_irq(KBDState *s)
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
@@ -237,6 +247,15 @@ static void kbd_update_aux_irq(void *opaque, int level)
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
@@ -358,6 +377,10 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
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
@@ -419,6 +442,9 @@ static void kbd_reset(void *opaque)
     s->outport_present = false;
     s->pending = 0;
     kbd_deassert_irq(s);
+    if (s->throttle_timer) {
+        timer_del(s->throttle_timer);
+    }
 }
 
 static uint8_t kbd_outport_default(KBDState *s)
@@ -453,6 +479,29 @@ static const VMStateDescription vmstate_kbd_outport = {
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
@@ -462,8 +511,11 @@ static bool kbd_extended_state_needed(void *opaque)
 
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
@@ -554,6 +606,7 @@ struct ISAKBDState {
     ISADevice parent_obj;
 
     KBDState kbd;
+    bool kbd_throttle;
     MemoryRegion io[2];
 };
 
@@ -626,6 +679,13 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
 
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
 
@@ -659,6 +719,7 @@ static void i8042_build_aml(ISADevice *isadev, Aml *scope)
 
 static Property i8042_properties[] = {
     DEFINE_PROP_BOOL("extended-state", ISAKBDState, kbd.extended_state, true),
+    DEFINE_PROP_BOOL("kbd-throttle", ISAKBDState, kbd_throttle, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.31.1



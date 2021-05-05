Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C77E3748B3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 21:27:54 +0200 (CEST)
Received: from localhost ([::1]:60834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leNBZ-00064t-B3
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 15:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1leN7B-0002I7-5e
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:23:22 -0400
Received: from mailout12.t-online.de ([194.25.134.22]:40160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1leN73-0007qL-E1
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:23:20 -0400
Received: from fwd25.aul.t-online.de (fwd25.aul.t-online.de [172.20.26.130])
 by mailout12.t-online.de (Postfix) with SMTP id C91E93271A;
 Wed,  5 May 2021 21:21:56 +0200 (CEST)
Received: from linpower.localnet
 (rxQ-+eZZYhNhulTIqb9Jsa+h9ZzrWH-9NNk9Ca0JIaBfwbF0fGysFWF1wPojG4xZn0@[46.86.52.8])
 by fwd25.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1leN5n-4Vz5QO0; Wed, 5 May 2021 21:21:55 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 04A692006FA; Wed,  5 May 2021 21:21:34 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 09/10] pckbd: correctly disable PS/2 communication
Date: Wed,  5 May 2021 21:21:32 +0200
Message-Id: <20210505192133.7480-9-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <aed90d92-4e34-6f33-005f-10cf176e5483@t-online.de>
References: <aed90d92-4e34-6f33-005f-10cf176e5483@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: rxQ-+eZZYhNhulTIqb9Jsa+h9ZzrWH-9NNk9Ca0JIaBfwbF0fGysFWF1wPojG4xZn0
X-TOI-EXPURGATEID: 150726::1620242515-0000AC82-35366259/0/0 CLEAN NORMAL
X-TOI-MSGID: 61edd1f0-1a67-4a5e-8336-8471f9009bf8
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

Currently the PS/2 controller command KBD_CCMD_MOUSE_DISABLE
doesn't disable the PS/2 mouse communication at all, and the
PS/2 controller commands KBD_CCMD_KBD_DISABLE and
KBD_CCMD_KBD_ENABLE disable and enable the keyboard interrupt,
which is very different from what a real PS/2 controller does.
A guest may notice the difference.

Mask out pending data on disabled queues to correctly disable
the PS/2 controller communication.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/pckbd.c | 48 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 3c41c11841..7c476f7a3e 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -130,10 +130,12 @@
 #define MOUSE_STATUS_ENABLED    0x20
 #define MOUSE_STATUS_SCALE21    0x10
 
-#define KBD_PENDING_KBD         1
-#define KBD_PENDING_AUX         2
+#define KBD_PENDING_KBD_V3      0x01
+#define KBD_PENDING_AUX_V3      0x02
 #define KBD_PENDING_CTRL_KBD    0x04
 #define KBD_PENDING_CTRL_AUX    0x08
+#define KBD_PENDING_KBD         KBD_MODE_DISABLE_KBD    /* 0x10 */
+#define KBD_PENDING_AUX         KBD_MODE_DISABLE_MOUSE  /* 0x20 */
 
 #define KBD_MIGR_TIMER_PENDING  0x1
 
@@ -163,8 +165,6 @@ typedef struct KBDState {
     hwaddr mask;
 } KBDState;
 
-/* XXX: not generating the irqs if KBD_MODE_DISABLE_KBD is set may be
-   incorrect, but it avoids having to simulate exact delays */
 static void kbd_update_irq_lines(KBDState *s)
 {
     int irq_kbd_level, irq_mouse_level;
@@ -178,8 +178,7 @@ static void kbd_update_irq_lines(KBDState *s)
                 irq_mouse_level = 1;
             }
         } else {
-            if ((s->mode & KBD_MODE_KBD_INT) &&
-                !(s->mode & KBD_MODE_DISABLE_KBD)) {
+            if (s->mode & KBD_MODE_KBD_INT) {
                 irq_kbd_level = 1;
             }
         }
@@ -195,21 +194,28 @@ static void kbd_deassert_irq(KBDState *s)
     kbd_update_irq_lines(s);
 }
 
+static uint8_t kbd_pending(KBDState *s)
+{
+    return s->pending & (~s->mode | ~(KBD_PENDING_KBD | KBD_PENDING_AUX));
+}
+
 /* update irq and KBD_STAT_[MOUSE_]OBF */
 static void kbd_update_irq(KBDState *s)
 {
+    uint8_t pending = kbd_pending(s);
+
     s->status &= ~(KBD_STAT_OBF | KBD_STAT_MOUSE_OBF);
     s->outport &= ~(KBD_OUT_OBF | KBD_OUT_MOUSE_OBF);
-    if (s->pending) {
+    if (pending) {
         s->status |= KBD_STAT_OBF;
         s->outport |= KBD_OUT_OBF;
-        if (s->pending & KBD_PENDING_CTRL_KBD) {
+        if (pending & KBD_PENDING_CTRL_KBD) {
             s->obsrc = KBD_OBSRC_CTRL;
-        } else if (s->pending & KBD_PENDING_CTRL_AUX) {
+        } else if (pending & KBD_PENDING_CTRL_AUX) {
             s->status |= KBD_STAT_MOUSE_OBF;
             s->outport |= KBD_OUT_MOUSE_OBF;
             s->obsrc = KBD_OBSRC_CTRL;
-        } else if (s->pending & KBD_PENDING_KBD) {
+        } else if (pending & KBD_PENDING_KBD) {
             s->obsrc = KBD_OBSRC_KBD;
         } else {
             s->status |= KBD_STAT_MOUSE_OBF;
@@ -233,7 +239,7 @@ static void kbd_safe_update_irq(KBDState *s)
     if (s->throttle_timer && timer_pending(s->throttle_timer)) {
         return;
     }
-    if (s->pending) {
+    if (kbd_pending(s)) {
         kbd_update_irq(s);
     }
 }
@@ -269,7 +275,7 @@ static void kbd_throttle_timeout(void *opaque)
     if (s->status & KBD_STAT_OBF) {
         return;
     }
-    if (s->pending) {
+    if (kbd_pending(s)) {
         kbd_update_irq(s);
     }
 }
@@ -297,7 +303,7 @@ static uint8_t kbd_dequeue(KBDState *s)
     uint8_t b = s->cbdata;
 
     s->pending &= ~KBD_PENDING_CTRL_KBD & ~KBD_PENDING_CTRL_AUX;
-    if (s->pending) {
+    if (kbd_pending(s)) {
         kbd_update_irq(s);
     }
     return b;
@@ -350,6 +356,7 @@ static void kbd_write_command(void *opaque, hwaddr addr,
         break;
     case KBD_CCMD_MOUSE_ENABLE:
         s->mode &= ~KBD_MODE_DISABLE_MOUSE;
+        kbd_safe_update_irq(s);
         break;
     case KBD_CCMD_TEST_MOUSE:
         kbd_queue(s, 0x00, 0);
@@ -429,6 +436,9 @@ static void kbd_write_data(void *opaque, hwaddr addr,
     switch(s->write_cmd) {
     case 0:
         ps2_write_keyboard(s->kbd, val);
+        /* sending data to the keyboard reenables PS/2 communication */
+        s->mode &= ~KBD_MODE_DISABLE_KBD;
+        kbd_safe_update_irq(s);
         break;
     case KBD_CCMD_WRITE_MODE:
         s->mode = val;
@@ -455,6 +465,9 @@ static void kbd_write_data(void *opaque, hwaddr addr,
         break;
     case KBD_CCMD_WRITE_MOUSE:
         ps2_write_mouse(s->mouse, val);
+        /* sending data to the mouse reenables PS/2 communication */
+        s->mode &= ~KBD_MODE_DISABLE_MOUSE;
+        kbd_safe_update_irq(s);
         break;
     default:
         break;
@@ -532,7 +545,16 @@ static int kbd_post_load(void *opaque, int version_id)
         s->obsrc = s->status & KBD_STAT_OBF ?
             (s->status & KBD_STAT_MOUSE_OBF ? KBD_OBSRC_MOUSE : KBD_OBSRC_KBD) :
             0;
+        if (s->pending & KBD_PENDING_KBD_V3) {
+            s->pending |= KBD_PENDING_KBD;
+        }
+        if (s->pending & KBD_PENDING_AUX_V3) {
+            s->pending |= KBD_PENDING_AUX;
+        }
     }
+    /* clear all unused flags */
+    s->pending &= KBD_PENDING_CTRL_KBD | KBD_PENDING_CTRL_AUX |
+                  KBD_PENDING_KBD | KBD_PENDING_AUX;
     if (s->migration_flags & KBD_MIGR_TIMER_PENDING) {
         kbd_throttle_timeout(s);
     }
-- 
2.26.2



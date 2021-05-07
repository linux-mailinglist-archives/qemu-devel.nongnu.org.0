Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A293769F5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 20:25:03 +0200 (CEST)
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf59q-0000iA-B7
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 14:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lf51A-0000b2-JW
 for qemu-devel@nongnu.org; Fri, 07 May 2021 14:16:04 -0400
Received: from mailout09.t-online.de ([194.25.134.84]:40914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lf4vm-0001bl-TR
 for qemu-devel@nongnu.org; Fri, 07 May 2021 14:10:36 -0400
Received: from fwd27.aul.t-online.de (fwd27.aul.t-online.de [172.20.26.132])
 by mailout09.t-online.de (Postfix) with SMTP id 806775A70D;
 Fri,  7 May 2021 20:10:24 +0200 (CEST)
Received: from linpower.localnet
 (SrgmIvZaohpbcsB5MBcdcFV7-au+YJR2eCs-raEEwxPVgAvXtzD-OBg2hbw14Z-gE0@[46.86.52.8])
 by fwd27.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lf4vZ-0fF3my0; Fri, 7 May 2021 20:10:17 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 7095A2006FE; Fri,  7 May 2021 20:09:53 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 10/11] pckbd: correctly disable PS/2 communication
Date: Fri,  7 May 2021 20:09:52 +0200
Message-Id: <20210507180953.8530-10-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <a898b0d5-7086-9699-ae8b-9524ad319b01@t-online.de>
References: <a898b0d5-7086-9699-ae8b-9524ad319b01@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: SrgmIvZaohpbcsB5MBcdcFV7-au+YJR2eCs-raEEwxPVgAvXtzD-OBg2hbw14Z-gE0
X-TOI-EXPURGATEID: 150726::1620411017-000107BB-2671AA0E/0/0 CLEAN NORMAL
X-TOI-MSGID: c1d42b8b-43bf-458f-88ef-828046e0e5c7
Received-SPF: none client-ip=194.25.134.84;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout09.t-online.de
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
 hw/input/pckbd.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 3ecc9c74ab..7c476f7a3e 100644
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
@@ -197,7 +196,7 @@ static void kbd_deassert_irq(KBDState *s)
 
 static uint8_t kbd_pending(KBDState *s)
 {
-    return s->pending;
+    return s->pending & (~s->mode | ~(KBD_PENDING_KBD | KBD_PENDING_AUX));
 }
 
 /* update irq and KBD_STAT_[MOUSE_]OBF */
@@ -357,6 +356,7 @@ static void kbd_write_command(void *opaque, hwaddr addr,
         break;
     case KBD_CCMD_MOUSE_ENABLE:
         s->mode &= ~KBD_MODE_DISABLE_MOUSE;
+        kbd_safe_update_irq(s);
         break;
     case KBD_CCMD_TEST_MOUSE:
         kbd_queue(s, 0x00, 0);
@@ -436,6 +436,9 @@ static void kbd_write_data(void *opaque, hwaddr addr,
     switch(s->write_cmd) {
     case 0:
         ps2_write_keyboard(s->kbd, val);
+        /* sending data to the keyboard reenables PS/2 communication */
+        s->mode &= ~KBD_MODE_DISABLE_KBD;
+        kbd_safe_update_irq(s);
         break;
     case KBD_CCMD_WRITE_MODE:
         s->mode = val;
@@ -462,6 +465,9 @@ static void kbd_write_data(void *opaque, hwaddr addr,
         break;
     case KBD_CCMD_WRITE_MOUSE:
         ps2_write_mouse(s->mouse, val);
+        /* sending data to the mouse reenables PS/2 communication */
+        s->mode &= ~KBD_MODE_DISABLE_MOUSE;
+        kbd_safe_update_irq(s);
         break;
     default:
         break;
@@ -539,7 +545,16 @@ static int kbd_post_load(void *opaque, int version_id)
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



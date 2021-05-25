Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48533908FC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 20:31:00 +0200 (CEST)
Received: from localhost ([::1]:55964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbpT-0006I9-JY
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 14:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llbaY-0002oa-U4
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:35 -0400
Received: from mailout01.t-online.de ([194.25.134.80]:32780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llbaN-0003qa-Ay
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:34 -0400
Received: from fwd18.aul.t-online.de (fwd18.aul.t-online.de [172.20.26.244])
 by mailout01.t-online.de (Postfix) with SMTP id 7AC6F3C940;
 Tue, 25 May 2021 20:15:06 +0200 (CEST)
Received: from linpower.localnet
 (bKYWRcZbohc+9P7c5Pf6dXsIWh3BgYjz+Nf+mnYxCRzR0Jb7PGg0eDvfh9yFtUMw+Y@[93.236.158.49])
 by fwd18.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1llba6-43PvPc0; Tue, 25 May 2021 20:15:06 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 9B47820061B; Tue, 25 May 2021 20:14:41 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 10/12] pckbd: correctly disable PS/2 communication
Date: Tue, 25 May 2021 20:14:39 +0200
Message-Id: <20210525181441.27768-10-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
References: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: bKYWRcZbohc+9P7c5Pf6dXsIWh3BgYjz+Nf+mnYxCRzR0Jb7PGg0eDvfh9yFtUMw+Y
X-TOI-EXPURGATEID: 150726::1621966506-00004685-E6932F0D/0/0 CLEAN NORMAL
X-TOI-MSGID: e0373abf-c4c2-4cdf-8898-896ed8389e90
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
KBD_CCMD_KBD_ENABLE only disable and enable the keyboard
interrupt, which is very different from what a real PS/2
controller does. A guest may notice the difference.

Mask out pending data on disabled queues to correctly disable
the PS/2 controller communication.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/pckbd.c | 51 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index e9905e1c6b..e73bc8181c 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -131,10 +131,12 @@
 #define MOUSE_STATUS_ENABLED    0x20
 #define MOUSE_STATUS_SCALE21    0x10
 
-#define KBD_PENDING_KBD         1
-#define KBD_PENDING_AUX         2
+#define KBD_PENDING_KBD_COMPAT  0x01
+#define KBD_PENDING_AUX_COMPAT  0x02
 #define KBD_PENDING_CTRL_KBD    0x04
 #define KBD_PENDING_CTRL_AUX    0x08
+#define KBD_PENDING_KBD         KBD_MODE_DISABLE_KBD    /* 0x10 */
+#define KBD_PENDING_AUX         KBD_MODE_DISABLE_MOUSE  /* 0x20 */
 
 #define KBD_MIGR_TIMER_PENDING  0x1
 
@@ -156,6 +158,7 @@ typedef struct KBDState {
     uint8_t pending;
     uint8_t obdata;
     uint8_t cbdata;
+    uint8_t pending_tmp;
     void *kbd;
     void *mouse;
     QEMUTimer *throttle_timer;
@@ -200,7 +203,11 @@ static void kbd_deassert_irq(KBDState *s)
 
 static uint8_t kbd_pending(KBDState *s)
 {
-    return s->pending;
+    if (s->extended_state) {
+        return s->pending & (~s->mode | ~(KBD_PENDING_KBD | KBD_PENDING_AUX));
+    } else {
+        return s->pending;
+    }
 }
 
 /* update irq and KBD_STAT_[MOUSE_]OBF */
@@ -361,6 +368,7 @@ static void kbd_write_command(void *opaque, hwaddr addr,
         break;
     case KBD_CCMD_MOUSE_ENABLE:
         s->mode &= ~KBD_MODE_DISABLE_MOUSE;
+        kbd_safe_update_irq(s);
         break;
     case KBD_CCMD_TEST_MOUSE:
         kbd_queue(s, 0x00, 0);
@@ -440,6 +448,9 @@ static void kbd_write_data(void *opaque, hwaddr addr,
     switch(s->write_cmd) {
     case 0:
         ps2_write_keyboard(s->kbd, val);
+        /* sending data to the keyboard reenables PS/2 communication */
+        s->mode &= ~KBD_MODE_DISABLE_KBD;
+        kbd_safe_update_irq(s);
         break;
     case KBD_CCMD_WRITE_MODE:
         s->mode = val;
@@ -466,6 +477,9 @@ static void kbd_write_data(void *opaque, hwaddr addr,
         break;
     case KBD_CCMD_WRITE_MOUSE:
         ps2_write_mouse(s->mouse, val);
+        /* sending data to the mouse reenables PS/2 communication */
+        s->mode &= ~KBD_MODE_DISABLE_MOUSE;
+        kbd_safe_update_irq(s);
         break;
     default:
         break;
@@ -565,6 +579,24 @@ static const VMStateDescription vmstate_kbd_extended_state = {
     }
 };
 
+static int kbd_pre_save(void *opaque)
+{
+    KBDState *s = opaque;
+
+    if (s->extended_state) {
+        s->pending_tmp = s->pending;
+    } else {
+        s->pending_tmp = 0;
+        if (s->pending & KBD_PENDING_KBD) {
+            s->pending_tmp |= KBD_PENDING_KBD_COMPAT;
+        }
+        if (s->pending & KBD_PENDING_AUX) {
+            s->pending_tmp |= KBD_PENDING_AUX_COMPAT;
+        }
+    }
+    return 0;
+}
+
 static int kbd_pre_load(void *opaque)
 {
     KBDState *s = opaque;
@@ -580,11 +612,21 @@ static int kbd_post_load(void *opaque, int version_id)
         s->outport = kbd_outport_default(s);
     }
     s->outport_present = false;
+    s->pending = s->pending_tmp;
     if (!s->extended_state_loaded) {
         s->obsrc = s->status & KBD_STAT_OBF ?
             (s->status & KBD_STAT_MOUSE_OBF ? KBD_OBSRC_MOUSE : KBD_OBSRC_KBD) :
             0;
+        if (s->pending & KBD_PENDING_KBD_COMPAT) {
+            s->pending |= KBD_PENDING_KBD;
+        }
+        if (s->pending & KBD_PENDING_AUX_COMPAT) {
+            s->pending |= KBD_PENDING_AUX;
+        }
     }
+    /* clear all unused flags */
+    s->pending &= KBD_PENDING_CTRL_KBD | KBD_PENDING_CTRL_AUX |
+                  KBD_PENDING_KBD | KBD_PENDING_AUX;
     return 0;
 }
 
@@ -594,11 +636,12 @@ static const VMStateDescription vmstate_kbd = {
     .minimum_version_id = 3,
     .pre_load = kbd_pre_load,
     .post_load = kbd_post_load,
+    .pre_save = kbd_pre_save,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(write_cmd, KBDState),
         VMSTATE_UINT8(status, KBDState),
         VMSTATE_UINT8(mode, KBDState),
-        VMSTATE_UINT8(pending, KBDState),
+        VMSTATE_UINT8(pending_tmp, KBDState),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription*[]) {
-- 
2.26.2



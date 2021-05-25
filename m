Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D83D3908DB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 20:22:32 +0200 (CEST)
Received: from localhost ([::1]:38162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbhH-0002O5-5G
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 14:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llba9-0002dv-Nh
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:09 -0400
Received: from mailout06.t-online.de ([194.25.134.19]:47262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llba5-0003gW-K7
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:09 -0400
Received: from fwd02.aul.t-online.de (fwd02.aul.t-online.de [172.20.26.148])
 by mailout06.t-online.de (Postfix) with SMTP id 6ACAD8E479;
 Tue, 25 May 2021 20:15:04 +0200 (CEST)
Received: from linpower.localnet
 (Xdzyr+ZfQhIrTi9PZo2D+gr4D0Oej94VrA033D5vRIHwCLjFoVDp3zNNIGrV2riQpc@[93.236.158.49])
 by fwd02.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1llba0-0TXvou0; Tue, 25 May 2021 20:15:00 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 94FE9200618; Tue, 25 May 2021 20:14:41 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 08/12] pckbd: add controller response queue
Date: Tue, 25 May 2021 20:14:37 +0200
Message-Id: <20210525181441.27768-8-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
References: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: Xdzyr+ZfQhIrTi9PZo2D+gr4D0Oej94VrA033D5vRIHwCLjFoVDp3zNNIGrV2riQpc
X-TOI-EXPURGATEID: 150726::1621966501-0000AFC8-F54DB51B/0/0 CLEAN NORMAL
X-TOI-MSGID: 20172e04-0cd1-4f76-b697-b581f5db0e5a
Received-SPF: none client-ip=194.25.134.19;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout06.t-online.de
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

Add a separate queue for PS/2 controller responses. The
responses no longer get queued in the keyboard or mouse queues.
The advantage of this can be seen after the next two patches,
where the guest can disable the PS/2 communication with keyboard
and mouse and still talk to the PS/2 controller.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/pckbd.c | 42 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 62a3b29074..294b315901 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -133,11 +133,14 @@
 
 #define KBD_PENDING_KBD         1
 #define KBD_PENDING_AUX         2
+#define KBD_PENDING_CTRL_KBD    0x04
+#define KBD_PENDING_CTRL_AUX    0x08
 
 #define KBD_MIGR_TIMER_PENDING  0x1
 
 #define KBD_OBSRC_KBD           0x01
 #define KBD_OBSRC_MOUSE         0x02
+#define KBD_OBSRC_CTRL          0x04
 
 typedef struct KBDState {
     uint8_t write_cmd; /* if non zero, write data to port 60 is expected */
@@ -152,6 +155,7 @@ typedef struct KBDState {
     /* Bitmask of devices with data available.  */
     uint8_t pending;
     uint8_t obdata;
+    uint8_t cbdata;
     void *kbd;
     void *mouse;
     QEMUTimer *throttle_timer;
@@ -202,12 +206,18 @@ static void kbd_update_irq(KBDState *s)
     if (s->pending) {
         s->status |= KBD_STAT_OBF;
         s->outport |= KBD_OUT_OBF;
-        if (s->pending == KBD_PENDING_AUX) {
+        if (s->pending & KBD_PENDING_CTRL_KBD) {
+            s->obsrc = KBD_OBSRC_CTRL;
+        } else if (s->pending & KBD_PENDING_CTRL_AUX) {
             s->status |= KBD_STAT_MOUSE_OBF;
             s->outport |= KBD_OUT_MOUSE_OBF;
-            s->obsrc = KBD_OBSRC_MOUSE;
-        } else {
+            s->obsrc = KBD_OBSRC_CTRL;
+        } else if (s->pending & KBD_PENDING_KBD) {
             s->obsrc = KBD_OBSRC_KBD;
+        } else {
+            s->status |= KBD_STAT_MOUSE_OBF;
+            s->outport |= KBD_OUT_MOUSE_OBF;
+            s->obsrc = KBD_OBSRC_MOUSE;
         }
     }
     kbd_update_irq_lines(s);
@@ -276,10 +286,25 @@ static uint64_t kbd_read_status(void *opaque, hwaddr addr,
 
 static void kbd_queue(KBDState *s, int b, int aux)
 {
-    if (aux)
-        ps2_queue(s->mouse, b);
-    else
-        ps2_queue(s->kbd, b);
+    if (s->extended_state) {
+        s->cbdata = b;
+        s->pending &= ~KBD_PENDING_CTRL_KBD & ~KBD_PENDING_CTRL_AUX;
+        s->pending |= aux ? KBD_PENDING_CTRL_AUX : KBD_PENDING_CTRL_KBD;
+        kbd_safe_update_irq(s);
+    } else {
+        ps2_queue(aux ? s->mouse : s->kbd, b);
+    }
+}
+
+static uint8_t kbd_dequeue(KBDState *s)
+{
+    uint8_t b = s->cbdata;
+
+    s->pending &= ~KBD_PENDING_CTRL_KBD & ~KBD_PENDING_CTRL_AUX;
+    if (s->pending) {
+        kbd_update_irq(s);
+    }
+    return b;
 }
 
 static void outport_write(KBDState *s, uint32_t val)
@@ -389,6 +414,8 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
             s->obdata = ps2_read_data(s->kbd);
         } else if (s->obsrc & KBD_OBSRC_MOUSE) {
             s->obdata = ps2_read_data(s->mouse);
+        } else if (s->obsrc & KBD_OBSRC_CTRL) {
+            s->obdata = kbd_dequeue(s);
         }
     }
 
@@ -526,6 +553,7 @@ static const VMStateDescription vmstate_kbd_extended_state = {
         VMSTATE_UINT32(migration_flags, KBDState),
         VMSTATE_UINT32(obsrc, KBDState),
         VMSTATE_UINT8(obdata, KBDState),
+        VMSTATE_UINT8(cbdata, KBDState),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.26.2



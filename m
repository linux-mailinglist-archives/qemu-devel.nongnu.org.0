Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FBB381861
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:37:04 +0200 (CEST)
Received: from localhost ([::1]:51556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhsbP-00051p-9A
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lhsXm-0004FA-Cr
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:33:18 -0400
Received: from mailout07.t-online.de ([194.25.134.83]:48950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lhsXj-0003NK-Ju
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:33:18 -0400
Received: from fwd22.aul.t-online.de (fwd22.aul.t-online.de [172.20.26.127])
 by mailout07.t-online.de (Postfix) with SMTP id E32DD5300B;
 Sat, 15 May 2021 13:33:13 +0200 (CEST)
Received: from linpower.localnet
 (bpPRBoZYghVm7V+56Y9dPksAMHLdeQP+CKUipxVHiwbkERSTNnBrdIxieKcXg3KQBg@[79.208.18.63])
 by fwd22.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lhsXh-01TqKm0; Sat, 15 May 2021 13:33:13 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id B145E20062C; Sat, 15 May 2021 13:32:54 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 08/11] pckbd: add controller response queue
Date: Sat, 15 May 2021 13:32:51 +0200
Message-Id: <20210515113254.6245-8-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
References: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: bpPRBoZYghVm7V+56Y9dPksAMHLdeQP+CKUipxVHiwbkERSTNnBrdIxieKcXg3KQBg
X-TOI-EXPURGATEID: 150726::1621078393-0000454D-E6746B18/0/0 CLEAN NORMAL
X-TOI-MSGID: c29e00a8-b4b2-46cd-8929-dcb0cc00d6c5
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
 hw/input/pckbd.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index adce525b88..e9523e164f 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -132,11 +132,14 @@
 
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
@@ -149,6 +152,7 @@ typedef struct KBDState {
     /* Bitmask of devices with data available.  */
     uint8_t pending;
     uint8_t obdata;
+    uint8_t cbdata;
     void *kbd;
     void *mouse;
     QEMUTimer *throttle_timer;
@@ -199,12 +203,18 @@ static void kbd_update_irq(KBDState *s)
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
@@ -273,10 +283,21 @@ static uint64_t kbd_read_status(void *opaque, hwaddr addr,
 
 static void kbd_queue(KBDState *s, int b, int aux)
 {
-    if (aux)
-        ps2_queue(s->mouse, b);
-    else
-        ps2_queue(s->kbd, b);
+    s->cbdata = b;
+    s->pending &= ~KBD_PENDING_CTRL_KBD & ~KBD_PENDING_CTRL_AUX;
+    s->pending |= aux ? KBD_PENDING_CTRL_AUX : KBD_PENDING_CTRL_KBD;
+    kbd_safe_update_irq(s);
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
@@ -386,6 +407,8 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
             s->obdata = ps2_read_data(s->kbd);
         } else if (s->obsrc & KBD_OBSRC_MOUSE) {
             s->obdata = ps2_read_data(s->mouse);
+        } else if (s->obsrc & KBD_OBSRC_CTRL) {
+            s->obdata = kbd_dequeue(s);
         }
     }
 
@@ -527,6 +550,7 @@ static const VMStateDescription vmstate_kbd = {
         VMSTATE_UINT32_V(migration_flags, KBDState, 4),
         VMSTATE_UINT32_V(obsrc, KBDState, 4),
         VMSTATE_UINT8_V(obdata, KBDState, 4),
+        VMSTATE_UINT8_V(cbdata, KBDState, 4),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription*[]) {
-- 
2.26.2



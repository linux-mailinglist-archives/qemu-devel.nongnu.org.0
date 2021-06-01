Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2053908C9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 20:19:19 +0200 (CEST)
Received: from localhost ([::1]:58962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbe7-0005XX-Mr
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 14:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llba1-0002YI-Sy
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:02 -0400
Received: from mailout03.t-online.de ([194.25.134.81]:50684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llbZt-0003cU-K1
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:01 -0400
Received: from fwd06.aul.t-online.de (fwd06.aul.t-online.de [172.20.26.150])
 by mailout03.t-online.de (Postfix) with SMTP id 0921B64118;
 Tue, 25 May 2021 20:14:52 +0200 (CEST)
Received: from linpower.localnet
 (STiHNBZ6rhG0ldIXV2nemOxuPx4hkvGGfQ6YdypzPfjhmo+rE+i7Zp6lsU1XnaEwvy@[93.236.158.49])
 by fwd06.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1llbZq-1c8HBI0; Tue, 25 May 2021 20:14:50 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 8A0552000A9; Tue, 25 May 2021 20:14:41 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 04/12] pckbd: split out interrupt line changing code
Date: Tue, 25 May 2021 20:14:33 +0200
Message-Id: <20210525181441.27768-4-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
References: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: STiHNBZ6rhG0ldIXV2nemOxuPx4hkvGGfQ6YdypzPfjhmo+rE+i7Zp6lsU1XnaEwvy
X-TOI-EXPURGATEID: 150726::1621966490-00012213-539F16A5/0/0 CLEAN NORMAL
X-TOI-MSGID: ea5302c7-41a2-40b8-a70a-a58401c6155d
Received-SPF: none client-ip=194.25.134.81;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout03.t-online.de
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

Split out the interrupt line changing code from kbd_update_irq().
This is a preparation for the next patch. There is no functional
change.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/pckbd.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index dde85ba6c6..90b33954a8 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -148,15 +148,34 @@ typedef struct KBDState {
     hwaddr mask;
 } KBDState;
 
-/* update irq and KBD_STAT_[MOUSE_]OBF */
 /* XXX: not generating the irqs if KBD_MODE_DISABLE_KBD is set may be
    incorrect, but it avoids having to simulate exact delays */
-static void kbd_update_irq(KBDState *s)
+static void kbd_update_irq_lines(KBDState *s)
 {
     int irq_kbd_level, irq_mouse_level;
 
     irq_kbd_level = 0;
     irq_mouse_level = 0;
+
+    if (s->status & KBD_STAT_OBF) {
+        if (s->status & KBD_STAT_MOUSE_OBF) {
+            if (s->mode & KBD_MODE_MOUSE_INT) {
+                irq_mouse_level = 1;
+            }
+        } else {
+            if ((s->mode & KBD_MODE_KBD_INT) &&
+                !(s->mode & KBD_MODE_DISABLE_KBD)) {
+                irq_kbd_level = 1;
+            }
+        }
+    }
+    qemu_set_irq(s->irq_kbd, irq_kbd_level);
+    qemu_set_irq(s->irq_mouse, irq_mouse_level);
+}
+
+/* update irq and KBD_STAT_[MOUSE_]OBF */
+static void kbd_update_irq(KBDState *s)
+{
     s->status &= ~(KBD_STAT_OBF | KBD_STAT_MOUSE_OBF);
     s->outport &= ~(KBD_OUT_OBF | KBD_OUT_MOUSE_OBF);
     if (s->pending) {
@@ -166,16 +185,9 @@ static void kbd_update_irq(KBDState *s)
         if (s->pending == KBD_PENDING_AUX) {
             s->status |= KBD_STAT_MOUSE_OBF;
             s->outport |= KBD_OUT_MOUSE_OBF;
-            if (s->mode & KBD_MODE_MOUSE_INT)
-                irq_mouse_level = 1;
-        } else {
-            if ((s->mode & KBD_MODE_KBD_INT) &&
-                !(s->mode & KBD_MODE_DISABLE_KBD))
-                irq_kbd_level = 1;
         }
     }
-    qemu_set_irq(s->irq_kbd, irq_kbd_level);
-    qemu_set_irq(s->irq_mouse, irq_mouse_level);
+    kbd_update_irq_lines(s);
 }
 
 static void kbd_update_kbd_irq(void *opaque, int level)
-- 
2.26.2



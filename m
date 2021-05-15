Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201D138185E
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:36:19 +0200 (CEST)
Received: from localhost ([::1]:48302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhsaf-0002mu-Sv
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lhsXa-0003Px-PA
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:33:06 -0400
Received: from mailout12.t-online.de ([194.25.134.22]:47776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lhsXY-0003HP-Ud
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:33:06 -0400
Received: from fwd06.aul.t-online.de (fwd06.aul.t-online.de [172.20.26.150])
 by mailout12.t-online.de (Postfix) with SMTP id BFD765D22F;
 Sat, 15 May 2021 13:33:03 +0200 (CEST)
Received: from linpower.localnet
 (VOwgnaZFYhaIB0NzJ3pFubeKSn5S8ACziBGpdw+L1-kSFqAOXoWLV9w6Z6P2TmGgmo@[79.208.18.63])
 by fwd06.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lhsXX-1yWf7A0; Sat, 15 May 2021 13:33:03 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id A86A3200622; Sat, 15 May 2021 13:32:54 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 04/11] pckbd: split out interrupt line changing code
Date: Sat, 15 May 2021 13:32:47 +0200
Message-Id: <20210515113254.6245-4-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
References: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: VOwgnaZFYhaIB0NzJ3pFubeKSn5S8ACziBGpdw+L1-kSFqAOXoWLV9w6Z6P2TmGgmo
X-TOI-EXPURGATEID: 150726::1621078383-00012213-8658D00B/0/0 CLEAN NORMAL
X-TOI-MSGID: 45fba57b-cb49-4802-b3df-8bf494f37719
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



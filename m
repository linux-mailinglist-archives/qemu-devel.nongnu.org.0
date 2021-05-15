Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB19C381875
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:43:12 +0200 (CEST)
Received: from localhost ([::1]:39560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhshL-0007Td-FL
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lhsXp-0004NS-MH
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:33:21 -0400
Received: from mailout07.t-online.de ([194.25.134.83]:48984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lhsXn-0003Q3-U0
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:33:21 -0400
Received: from fwd32.aul.t-online.de (fwd32.aul.t-online.de [172.20.26.144])
 by mailout07.t-online.de (Postfix) with SMTP id 298CF53012;
 Sat, 15 May 2021 13:33:18 +0200 (CEST)
Received: from linpower.localnet
 (Th580TZXYhR79L+i1JirdryNUc2umaTSwZ3aScfbdZf4G2Ux+HBWEAfjZLwoWF5w+z@[79.208.18.63])
 by fwd32.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lhsXf-1ofNOS0; Sat, 15 May 2021 13:33:11 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id AF1F420062B; Sat, 15 May 2021 13:32:54 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 07/11] pckbd: add state variable for interrupt source
Date: Sat, 15 May 2021 13:32:50 +0200
Message-Id: <20210515113254.6245-7-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
References: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: Th580TZXYhR79L+i1JirdryNUc2umaTSwZ3aScfbdZf4G2Ux+HBWEAfjZLwoWF5w+z
X-TOI-EXPURGATEID: 150726::1621078391-00006026-635FB1D1/0/0 CLEAN NORMAL
X-TOI-MSGID: d08354da-1334-4d15-904e-bdcc205e241d
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

Currently there is only one flag to distinguish between two
interrupt sources and there are no available flags for more
sources. Add an internal state variable to store the interrupt
source. The next patch will introduce an additional interrupt
source. There is no functional change.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/pckbd.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index ebf08c7cb8..adce525b88 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -135,12 +135,16 @@
 
 #define KBD_MIGR_TIMER_PENDING  0x1
 
+#define KBD_OBSRC_KBD           0x01
+#define KBD_OBSRC_MOUSE         0x02
+
 typedef struct KBDState {
     uint8_t write_cmd; /* if non zero, write data to port 60 is expected */
     uint8_t status;
     uint8_t mode;
     uint8_t outport;
     uint32_t migration_flags;
+    uint32_t obsrc;
     bool outport_present;
     /* Bitmask of devices with data available.  */
     uint8_t pending;
@@ -198,6 +202,9 @@ static void kbd_update_irq(KBDState *s)
         if (s->pending == KBD_PENDING_AUX) {
             s->status |= KBD_STAT_MOUSE_OBF;
             s->outport |= KBD_OUT_MOUSE_OBF;
+            s->obsrc = KBD_OBSRC_MOUSE;
+        } else {
+            s->obsrc = KBD_OBSRC_KBD;
         }
     }
     kbd_update_irq_lines(s);
@@ -368,18 +375,17 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
                               unsigned size)
 {
     KBDState *s = opaque;
-    uint8_t status = s->status;
 
-    if (status & KBD_STAT_OBF) {
+    if (s->status & KBD_STAT_OBF) {
         kbd_deassert_irq(s);
-        if (status & KBD_STAT_MOUSE_OBF) {
-            s->obdata = ps2_read_data(s->mouse);
-        } else {
+        if (s->obsrc & KBD_OBSRC_KBD) {
             if (s->throttle_timer) {
                 timer_mod(s->throttle_timer,
                           qemu_clock_get_us(QEMU_CLOCK_VIRTUAL) + 1000);
             }
             s->obdata = ps2_read_data(s->kbd);
+        } else if (s->obsrc & KBD_OBSRC_MOUSE) {
+            s->obdata = ps2_read_data(s->mouse);
         }
     }
 
@@ -496,6 +502,11 @@ static int kbd_post_load(void *opaque, int version_id)
         s->outport = kbd_outport_default(s);
     }
     s->outport_present = false;
+    if (version_id < 4) {
+        s->obsrc = s->status & KBD_STAT_OBF ?
+            (s->status & KBD_STAT_MOUSE_OBF ? KBD_OBSRC_MOUSE : KBD_OBSRC_KBD) :
+            0;
+    }
     if (s->migration_flags & KBD_MIGR_TIMER_PENDING) {
         kbd_throttle_timeout(s);
     }
@@ -514,6 +525,7 @@ static const VMStateDescription vmstate_kbd = {
         VMSTATE_UINT8(mode, KBDState),
         VMSTATE_UINT8(pending, KBDState),
         VMSTATE_UINT32_V(migration_flags, KBDState, 4),
+        VMSTATE_UINT32_V(obsrc, KBDState, 4),
         VMSTATE_UINT8_V(obdata, KBDState, 4),
         VMSTATE_END_OF_LIST()
     },
-- 
2.26.2



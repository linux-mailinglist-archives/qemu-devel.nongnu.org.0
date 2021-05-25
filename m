Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860653908DC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 20:22:55 +0200 (CEST)
Received: from localhost ([::1]:38622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbhe-0002i6-Iw
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 14:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llba5-0002aw-NA
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:07 -0400
Received: from mailout06.t-online.de ([194.25.134.19]:47200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llba1-0003dd-CJ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:05 -0400
Received: from fwd16.aul.t-online.de (fwd16.aul.t-online.de [172.20.26.243])
 by mailout06.t-online.de (Postfix) with SMTP id 293EF8E472;
 Tue, 25 May 2021 20:14:59 +0200 (CEST)
Received: from linpower.localnet
 (VyhFZ-ZZ8hebu+5xIyhS53ZLLrbBLMYcl1AZOCMs8t2MwzB5J0eJMB6sVKjAE1wgwG@[93.236.158.49])
 by fwd16.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1llbZy-2Pq0Ho0; Tue, 25 May 2021 20:14:58 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 92D2420055B; Tue, 25 May 2021 20:14:41 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 07/12] pckbd: add state variable for interrupt source
Date: Tue, 25 May 2021 20:14:36 +0200
Message-Id: <20210525181441.27768-7-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
References: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: VyhFZ-ZZ8hebu+5xIyhS53ZLLrbBLMYcl1AZOCMs8t2MwzB5J0eJMB6sVKjAE1wgwG
X-TOI-EXPURGATEID: 150726::1621966498-000147F3-E5A19F1B/0/0 CLEAN NORMAL
X-TOI-MSGID: 823207bf-ba13-4e05-818e-54b0fe9fbfcc
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

Currently there is only one flag to distinguish between two
interrupt sources and there are no available flags for more
sources. Add an internal state variable to store the interrupt
source. The next patch will introduce an additional interrupt
source. There is no functional change.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/pckbd.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 516ed5a397..62a3b29074 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -136,14 +136,19 @@
 
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
     bool extended_state;
+    bool extended_state_loaded;
     /* Bitmask of devices with data available.  */
     uint8_t pending;
     uint8_t obdata;
@@ -200,6 +205,9 @@ static void kbd_update_irq(KBDState *s)
         if (s->pending == KBD_PENDING_AUX) {
             s->status |= KBD_STAT_MOUSE_OBF;
             s->outport |= KBD_OUT_MOUSE_OBF;
+            s->obsrc = KBD_OBSRC_MOUSE;
+        } else {
+            s->obsrc = KBD_OBSRC_KBD;
         }
     }
     kbd_update_irq_lines(s);
@@ -370,18 +378,17 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
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
 
@@ -498,6 +505,7 @@ static int kbd_extended_state_post_load(void *opaque, int version_id)
     if (s->migration_flags & KBD_MIGR_TIMER_PENDING) {
         kbd_throttle_timeout(s);
     }
+    s->extended_state_loaded = true;
 
     return 0;
 }
@@ -516,11 +524,20 @@ static const VMStateDescription vmstate_kbd_extended_state = {
     .needed = kbd_extended_state_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(migration_flags, KBDState),
+        VMSTATE_UINT32(obsrc, KBDState),
         VMSTATE_UINT8(obdata, KBDState),
         VMSTATE_END_OF_LIST()
     }
 };
 
+static int kbd_pre_load(void *opaque)
+{
+    KBDState *s = opaque;
+
+    s->extended_state_loaded = false;
+    return 0;
+}
+
 static int kbd_post_load(void *opaque, int version_id)
 {
     KBDState *s = opaque;
@@ -528,6 +545,11 @@ static int kbd_post_load(void *opaque, int version_id)
         s->outport = kbd_outport_default(s);
     }
     s->outport_present = false;
+    if (!s->extended_state_loaded) {
+        s->obsrc = s->status & KBD_STAT_OBF ?
+            (s->status & KBD_STAT_MOUSE_OBF ? KBD_OBSRC_MOUSE : KBD_OBSRC_KBD) :
+            0;
+    }
     return 0;
 }
 
@@ -535,6 +557,7 @@ static const VMStateDescription vmstate_kbd = {
     .name = "pckbd",
     .version_id = 3,
     .minimum_version_id = 3,
+    .pre_load = kbd_pre_load,
     .post_load = kbd_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(write_cmd, KBDState),
-- 
2.26.2



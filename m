Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DBF336FA3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:13:27 +0100 (CET)
Received: from localhost ([::1]:35500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIJq-0005Uk-A3
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKICH-0005iK-38
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:05:37 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52298
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKICF-0004ax-31
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:05:36 -0500
Received: from host86-140-100-136.range86-140.btcentralplus.com
 ([86.140.100.136] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKICB-0001He-Po; Thu, 11 Mar 2021 10:05:36 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu, 11 Mar 2021 10:05:02 +0000
Message-Id: <20210311100505.22596-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210311100505.22596-1-mark.cave-ayland@ilande.co.uk>
References: <20210311100505.22596-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.100.136
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 4/7] mac_via: don't re-inject ADB response when switching
 to IDLE state
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current workaround for the Linux ADB state machine in kernels < 5.6 switching
the VIA back to IDLE state between send and receive modes is to re-inject the
first byte of the response in the IDLE state, and then force the state machine
into generating an autopoll reply.

In fact what is happening is much simpler: analysis of traces from a real Quadra
suggest that the existing data is returned as the first autopoll response rather
than generating an immediate response starting whilst still in IDLE state.

Update the ADB receive code to work in the same way, which allows the re-injection
code to be completely removed from adb_via_receive() and for adb_via_poll() to
be simplified accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mac_via.c | 78 ++++++++++++++++-------------------------------
 1 file changed, 27 insertions(+), 51 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index f38d6e2f6e..76f31b8cae 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -609,7 +609,6 @@ static void adb_via_poll(void *opaque)
     uint8_t obuf[9];
     uint8_t *data = &s->sr;
     int olen;
-    uint16_t pending;
 
     /*
      * Setting vADBInt below indicates that an autopoll reply has been
@@ -618,36 +617,36 @@ static void adb_via_poll(void *opaque)
      */
     adb_autopoll_block(adb_bus);
 
-    m->adb_data_in_index = 0;
-    m->adb_data_out_index = 0;
-    olen = adb_poll(adb_bus, obuf, adb_bus->autopoll_mask);
-
-    if (olen > 0) {
-        /* Autopoll response */
-        *data = obuf[0];
-        olen--;
-        memcpy(m->adb_data_in, &obuf[1], olen);
-        m->adb_data_in_size = olen;
+    if (m->adb_data_in_size > 0 && m->adb_data_in_index == 0) {
+        /*
+         * For older Linux kernels that switch to IDLE mode after sending the
+         * ADB command, detect if there is an existing response and return that
+         * as a a "fake" autopoll reply or bus timeout accordingly
+         */
+        *data = m->adb_data_out[0];
+        olen = m->adb_data_in_size;
 
         s->b &= ~VIA1B_vADBInt;
         qemu_irq_raise(m->adb_data_ready);
-    } else if (olen < 0) {
-        /* Bus timeout (device does not exist) */
-        *data = 0xff;
-        s->b |= VIA1B_vADBInt;
-        adb_autopoll_unblock(adb_bus);
     } else {
-        pending = adb_bus->pending & ~(1 << (m->adb_autopoll_cmd >> 4));
+        /*
+         * Otherwise poll as normal
+         */
+        m->adb_data_in_index = 0;
+        m->adb_data_out_index = 0;
+        olen = adb_poll(adb_bus, obuf, adb_bus->autopoll_mask);
+
+        if (olen > 0) {
+            /* Autopoll response */
+            *data = obuf[0];
+            olen--;
+            memcpy(m->adb_data_in, &obuf[1], olen);
+            m->adb_data_in_size = olen;
 
-        if (pending) {
-            /*
-             * Bus timeout (device exists but another device has data). Block
-             * autopoll so the OS can read out the first EVEN and first ODD
-             * byte to determine bus timeout and SRQ status
-             */
-            *data = m->adb_autopoll_cmd;
             s->b &= ~VIA1B_vADBInt;
-
+            qemu_irq_raise(m->adb_data_ready);
+        } else {
+            *data = m->adb_autopoll_cmd;
             obuf[0] = 0xff;
             obuf[1] = 0xff;
             olen = 2;
@@ -655,12 +654,8 @@ static void adb_via_poll(void *opaque)
             memcpy(m->adb_data_in, obuf, olen);
             m->adb_data_in_size = olen;
 
+            s->b &= ~VIA1B_vADBInt;
             qemu_irq_raise(m->adb_data_ready);
-        } else {
-            /* Bus timeout (device exists but no other device has data) */
-            *data = 0;
-            s->b |= VIA1B_vADBInt;
-            adb_autopoll_unblock(adb_bus);
         }
     }
 
@@ -783,27 +778,8 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
         return;
 
     case ADB_STATE_IDLE:
-        /*
-         * Since adb_request() will have already consumed the data from the
-         * device, we must detect this extra state change and re-inject the
-         * reponse as either a "fake" autopoll reply or bus timeout
-         * accordingly
-         */
-        if (s->adb_data_in_index == 0) {
-            if (adb_bus->status & ADB_STATUS_BUSTIMEOUT) {
-                *data = 0xff;
-                ms->b |= VIA1B_vADBInt;
-                qemu_irq_raise(s->adb_data_ready);
-            } else if (s->adb_data_in_size > 0) {
-                adb_bus->status = ADB_STATUS_POLLREPLY;
-                *data = s->adb_autopoll_cmd;
-                ms->b &= ~VIA1B_vADBInt;
-                qemu_irq_raise(s->adb_data_ready);
-            }
-        } else {
-            ms->b |= VIA1B_vADBInt;
-            adb_autopoll_unblock(adb_bus);
-        }
+        ms->b |= VIA1B_vADBInt;
+        adb_autopoll_unblock(adb_bus);
 
         trace_via1_adb_receive("IDLE", *data,
                         (ms->b & VIA1B_vADBInt) ? "+" : "-", adb_bus->status,
-- 
2.20.1



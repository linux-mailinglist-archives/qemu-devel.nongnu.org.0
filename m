Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C6433E092
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:33:13 +0100 (CET)
Received: from localhost ([::1]:59452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHJQ-0001pb-Tx
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3V-0006iL-43
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:45 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:42199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3S-0003yK-MJ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:44 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N4R4i-1loV8b2kwo-011QnV; Tue, 16 Mar 2021 22:16:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] mac_via: don't re-inject ADB response when switching to
 IDLE state
Date: Tue, 16 Mar 2021 22:16:28 +0100
Message-Id: <20210316211631.107417-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210316211631.107417-1-laurent@vivier.eu>
References: <20210316211631.107417-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/lkjfQERd3Eyr1mqs0sqKbMkf8eK5GxYgZCy3NR6VopDqkyA1nM
 tdAd0yphShqz/EmNYm9RuTfWMI7sdTM1XoIEZ3cp85Dv80lZ4NtcuXRDfXaur8rcf23N7Wj
 JVtgImRCiZRgBKuvCtj4rk8jY9VNXJerEwZjGvBbH/mp+XTeNSpft+1l1FBPB1E2jqeI6AZ
 qNM0kT5FnS3UQaBKZ1g8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5andyBZZ80A=:InoVrh9lZ148KSh5ZtBopt
 oDxpxcMGY/5NMW+ZHBVKPo3015vHXYKVNjEKZ5tP6JLl/Il4W2fH3WykqiTHadIyeBc99VvTN
 +c5MdcsfWZOl1aG2q0PvU8OXs7xYKtoCufRBQNDvTD01J06Y5LkPQIUh/gV54b5og6+C4fjxm
 3tl4I1Ou41pSfG8OmcIEOrEm+SDbSmvc88YG5qQXZhgEoXsr1J3NsvykZ91zi0jy0Lx9Ipcw1
 mdbFW47aDXHxdntoRXkffTwUZTYlRzpSC1nhEvzIkmUNy4lI36SXAeidU0g8Rs8hqec3VGOZX
 tFbgiWtAUxOvtpDcoLafFA/PHncKJH8pRVi7qFXpPAPBZDQniN1w9YUHQdd+wtu2HLsG6dPf2
 qWwBNdJOhJz9PDW8Tp6gIfc+pnq7Qgtq3qn3SYgpARlkvHFIS0a0NemWXVb/23mdrQvC98Scu
 IR05g2IzPA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

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
Message-Id: <20210311100505.22596-5-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 78 ++++++++++++++++-------------------------------
 1 file changed, 27 insertions(+), 51 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 8810eb97ccb7..4914cb809860 100644
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
2.30.2



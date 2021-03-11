Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0934F336F97
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:07:57 +0100 (CET)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIEW-0007Dw-2g
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKIC7-0005Nh-BN
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:05:27 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52284
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKIC4-0004Oi-7F
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:05:27 -0500
Received: from host86-140-100-136.range86-140.btcentralplus.com
 ([86.140.100.136] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKIC0-0001He-O3; Thu, 11 Mar 2021 10:05:25 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu, 11 Mar 2021 10:05:00 +0000
Message-Id: <20210311100505.22596-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210311100505.22596-1-mark.cave-ayland@ilande.co.uk>
References: <20210311100505.22596-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.100.136
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 2/7] mac_via: fix up adb_via_receive() trace events
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

The use of the post-increment operator on adb_data_in_index meant that the
trace-event was accidentally displaying the next byte in the incoming ADB
data buffer rather than the current byte.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 488d086a17..0f6586e102 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -816,33 +816,37 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
         switch (s->adb_data_in_index) {
         case 0:
             /* First EVEN byte: vADBInt indicates bus timeout */
-            trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
-                                   *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
-                                   adb_bus->status, s->adb_data_in_index,
-                                   s->adb_data_in_size);
-
-            *data = s->adb_data_in[s->adb_data_in_index++];
+            *data = s->adb_data_in[s->adb_data_in_index];
             if (adb_bus->status & ADB_STATUS_BUSTIMEOUT) {
                 ms->b &= ~VIA1B_vADBInt;
             } else {
                 ms->b |= VIA1B_vADBInt;
             }
-            break;
 
-        case 1:
-            /* First ODD byte: vADBInt indicates SRQ */
             trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
                                    *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
                                    adb_bus->status, s->adb_data_in_index,
                                    s->adb_data_in_size);
 
-            *data = s->adb_data_in[s->adb_data_in_index++];
+            s->adb_data_in_index++;
+            break;
+
+        case 1:
+            /* First ODD byte: vADBInt indicates SRQ */
+            *data = s->adb_data_in[s->adb_data_in_index];
             pending = adb_bus->pending & ~(1 << (s->adb_autopoll_cmd >> 4));
             if (pending) {
                 ms->b &= ~VIA1B_vADBInt;
             } else {
                 ms->b |= VIA1B_vADBInt;
             }
+
+            trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
+                                   *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
+                                   adb_bus->status, s->adb_data_in_index,
+                                   s->adb_data_in_size);
+
+            s->adb_data_in_index++;
             break;
 
         default:
@@ -852,14 +856,9 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
              * end of the poll reply, so provide these extra bytes below to
              * keep it happy
              */
-            trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
-                                   *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
-                                   adb_bus->status, s->adb_data_in_index,
-                                   s->adb_data_in_size);
-
             if (s->adb_data_in_index < s->adb_data_in_size) {
                 /* Next data byte */
-                *data = s->adb_data_in[s->adb_data_in_index++];
+                *data = s->adb_data_in[s->adb_data_in_index];
                 ms->b |= VIA1B_vADBInt;
             } else if (s->adb_data_in_index == s->adb_data_in_size) {
                 if (adb_bus->status & ADB_STATUS_BUSTIMEOUT) {
@@ -869,7 +868,6 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
                     /* Return 0x0 after reply */
                     *data = 0;
                 }
-                s->adb_data_in_index++;
                 ms->b &= ~VIA1B_vADBInt;
             } else {
                 /* Bus timeout (no more data) */
@@ -878,6 +876,15 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
                 adb_bus->status = 0;
                 adb_autopoll_unblock(adb_bus);
             }
+
+            trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
+                                   *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
+                                   adb_bus->status, s->adb_data_in_index,
+                                   s->adb_data_in_size);
+
+            if (s->adb_data_in_index <= s->adb_data_in_size) {
+                s->adb_data_in_index++;
+            }
             break;
         }
 
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101801F8954
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jun 2020 16:39:29 +0200 (CEST)
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkTnE-0004z2-50
	for lists+qemu-devel@lfdr.de; Sun, 14 Jun 2020 10:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTeV-0008BJ-9A; Sun, 14 Jun 2020 10:30:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38446
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTeT-0005PO-K2; Sun, 14 Jun 2020 10:30:26 -0400
Received: from host217-39-64-113.range217-39.btcentralplus.com
 ([217.39.64.113] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTeM-0006Hv-Po; Sun, 14 Jun 2020 15:30:23 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, laurent@vivier.eu,
 fthain@telegraphics.com.au
Date: Sun, 14 Jun 2020 15:28:33 +0100
Message-Id: <20200614142840.10245-16-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
References: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.64.113
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 15/22] adb: add autopoll_blocked variable to block autopoll
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Whilst autopoll is enabled it is necessary to prevent the ADB buffer contents
from being overwritten until the host has read back the response in its
entirety.

Add adb_autopoll_block() and adb_autopoll_unblock() functions in preparation
for ensuring that the ADB buffer contents are protected for explicit ADB
requests.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/adb.c         | 21 +++++++++++++++++++++
 include/hw/input/adb.h |  4 ++++
 2 files changed, 25 insertions(+)

diff --git a/hw/input/adb.c b/hw/input/adb.c
index b3ad7c5fca..70aa1f4570 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -157,6 +157,26 @@ void adb_set_autopoll_mask(ADBBusState *s, uint16_t mask)
     }
 }
 
+void adb_autopoll_block(ADBBusState *s)
+{
+    s->autopoll_blocked = true;
+
+    if (s->autopoll_enabled) {
+        timer_del(s->autopoll_timer);
+    }
+}
+
+void adb_autopoll_unblock(ADBBusState *s)
+{
+    s->autopoll_blocked = false;
+
+    if (s->autopoll_enabled) {
+        timer_mod(s->autopoll_timer,
+                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+                  s->autopoll_rate_ms);
+    }
+}
+
 static void adb_autopoll(void *opaque)
 {
     ADBBusState *s = opaque;
@@ -184,6 +204,7 @@ static const VMStateDescription vmstate_adb_bus = {
         VMSTATE_BOOL(autopoll_enabled, ADBBusState),
         VMSTATE_UINT8(autopoll_rate_ms, ADBBusState),
         VMSTATE_UINT16(autopoll_mask, ADBBusState),
+        VMSTATE_BOOL(autopoll_blocked, ADBBusState),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/input/adb.h b/include/hw/input/adb.h
index cff264739c..bb75a7b1e3 100644
--- a/include/hw/input/adb.h
+++ b/include/hw/input/adb.h
@@ -86,6 +86,7 @@ struct ADBBusState {
 
     QEMUTimer *autopoll_timer;
     bool autopoll_enabled;
+    bool autopoll_blocked;
     uint8_t autopoll_rate_ms;
     uint16_t autopoll_mask;
     void (*autopoll_cb)(void *opaque);
@@ -96,6 +97,9 @@ int adb_request(ADBBusState *s, uint8_t *buf_out,
                 const uint8_t *buf, int len);
 int adb_poll(ADBBusState *s, uint8_t *buf_out, uint16_t poll_mask);
 
+void adb_autopoll_block(ADBBusState *s);
+void adb_autopoll_unblock(ADBBusState *s);
+
 void adb_set_autopoll_enabled(ADBBusState *s, bool enabled);
 void adb_set_autopoll_rate_ms(ADBBusState *s, int rate_ms);
 void adb_set_autopoll_mask(ADBBusState *s, uint16_t mask);
-- 
2.20.1



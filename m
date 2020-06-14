Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5811F8967
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jun 2020 16:46:35 +0200 (CEST)
Received: from localhost ([::1]:48872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkTu6-0004n6-NI
	for lists+qemu-devel@lfdr.de; Sun, 14 Jun 2020 10:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTfG-0000dg-1b; Sun, 14 Jun 2020 10:31:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38510
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTfE-0005bD-7S; Sun, 14 Jun 2020 10:31:13 -0400
Received: from host217-39-64-113.range217-39.btcentralplus.com
 ([217.39.64.113] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTf5-0006Hv-6t; Sun, 14 Jun 2020 15:31:09 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, laurent@vivier.eu,
 fthain@telegraphics.com.au
Date: Sun, 14 Jun 2020 15:28:40 +0100
Message-Id: <20200614142840.10245-23-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
References: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.64.113
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 22/22] adb: add ADB bus trace events
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/adb.c        | 23 ++++++++++++++++++++++-
 hw/input/trace-events |  7 +++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/hw/input/adb.c b/hw/input/adb.c
index fe0f6c7ef3..4976f52c36 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -29,10 +29,18 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "adb-internal.h"
+#include "trace.h"
 
 /* error codes */
 #define ADB_RET_NOTPRESENT (-2)
 
+static const char *adb_commands[] = {
+    "RESET", "FLUSH", "(Reserved 0x2)", "(Reserved 0x3)",
+    "Reserved (0x4)", "(Reserved 0x5)", "(Reserved 0x6)", "(Reserved 0x7)",
+    "LISTEN r0", "LISTEN r1", "LISTEN r2", "LISTEN r3",
+    "TALK r0", "TALK r1", "TALK r2", "TALK r3",
+};
+
 static void adb_device_reset(ADBDevice *d)
 {
     qdev_reset_all(DEVICE(d));
@@ -86,9 +94,16 @@ static int do_adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf,
 
 int adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf, int len)
 {
+    int ret;
+
+    trace_adb_bus_request(buf[0] >> 4, adb_commands[buf[0] & 0xf], len);
+
     assert(s->autopoll_blocked);
 
-    return do_adb_request(s, obuf, buf, len);
+    ret = do_adb_request(s, obuf, buf, len);
+
+    trace_adb_bus_request_done(buf[0] >> 4, adb_commands[buf[0] & 0xf], ret);
+    return ret;
 }
 
 int adb_poll(ADBBusState *s, uint8_t *obuf, uint16_t poll_mask)
@@ -160,6 +175,8 @@ void adb_set_autopoll_mask(ADBBusState *s, uint16_t mask)
 
 void adb_autopoll_block(ADBBusState *s)
 {
+    trace_adb_bus_autopoll_block("autopoll BLOCKED");
+
     s->autopoll_blocked = true;
 
     if (s->autopoll_enabled) {
@@ -169,6 +186,8 @@ void adb_autopoll_block(ADBBusState *s)
 
 void adb_autopoll_unblock(ADBBusState *s)
 {
+    trace_adb_bus_autopoll_block("autopoll UNBLOCKED");
+
     s->autopoll_blocked = false;
 
     if (s->autopoll_enabled) {
@@ -183,7 +202,9 @@ static void adb_autopoll(void *opaque)
     ADBBusState *s = opaque;
 
     if (!s->autopoll_blocked) {
+        trace_adb_bus_autopoll_cb(s->autopoll_mask);
         s->autopoll_cb(s->autopoll_cb_opaque);
+        trace_adb_bus_autopoll_cb_done(s->autopoll_mask);
     }
 
     timer_mod(s->autopoll_timer,
diff --git a/hw/input/trace-events b/hw/input/trace-events
index 6f0d78241c..119d1ce2bd 100644
--- a/hw/input/trace-events
+++ b/hw/input/trace-events
@@ -14,6 +14,13 @@ adb_device_mouse_readreg(int reg, uint8_t val0, uint8_t val1) "reg %d obuf[0] 0x
 adb_device_mouse_request_change_addr(int devaddr) "change addr to 0x%x"
 adb_device_mouse_request_change_addr_and_handler(int devaddr, int handler) "change addr and handler to 0x%x, 0x%x"
 
+# adb.c
+adb_bus_request(uint8_t addr, const char *cmd, int size) "device 0x%x %s cmdsize=%d"
+adb_bus_request_done(uint8_t addr, const char *cmd, int size) "device 0x%x %s replysize=%d"
+adb_bus_autopoll_block(const char *s) "%s"
+adb_bus_autopoll_cb(uint16_t mask) "executing autopoll_cb with autopoll mask 0x%x"
+adb_bus_autopoll_cb_done(uint16_t mask) "done executing autopoll_cb with autopoll mask 0x%x"
+
 # pckbd.c
 pckbd_kbd_read_data(uint32_t val) "0x%02x"
 pckbd_kbd_read_status(int status) "0x%02x"
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5821F8960
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jun 2020 16:45:14 +0200 (CEST)
Received: from localhost ([::1]:46236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkTsn-0003XU-RK
	for lists+qemu-devel@lfdr.de; Sun, 14 Jun 2020 10:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTf0-0000T6-QS; Sun, 14 Jun 2020 10:30:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38494
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTey-0005Ym-20; Sun, 14 Jun 2020 10:30:58 -0400
Received: from host217-39-64-113.range217-39.btcentralplus.com
 ([217.39.64.113] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTes-0006Hv-NQ; Sun, 14 Jun 2020 15:30:53 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, laurent@vivier.eu,
 fthain@telegraphics.com.au
Date: Sun, 14 Jun 2020 15:28:38 +0100
Message-Id: <20200614142840.10245-21-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
References: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.64.113
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 20/22] adb: only call autopoll callbacks when autopoll is not
 blocked
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

Handle this at the ADB bus level so that individual implementations do not need
to handle this themselves.

Finally add an assert() into adb_request() to prevent developers from accidentally
making an explicit ADB request without blocking autopoll.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/adb.c    | 7 +++++--
 hw/misc/mac_via.c | 6 +-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/input/adb.c b/hw/input/adb.c
index 70aa1f4570..fe0f6c7ef3 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -86,10 +86,11 @@ static int do_adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf,
 
 int adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf, int len)
 {
+    assert(s->autopoll_blocked);
+
     return do_adb_request(s, obuf, buf, len);
 }
 
-/* XXX: move that to cuda ? */
 int adb_poll(ADBBusState *s, uint8_t *obuf, uint16_t poll_mask)
 {
     ADBDevice *d;
@@ -181,7 +182,9 @@ static void adb_autopoll(void *opaque)
 {
     ADBBusState *s = opaque;
 
-    s->autopoll_cb(s->autopoll_cb_opaque);
+    if (!s->autopoll_blocked) {
+        s->autopoll_cb(s->autopoll_cb_opaque);
+    }
 
     timer_mod(s->autopoll_timer,
               qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 7676545474..efe96138d0 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -615,11 +615,7 @@ static void adb_via_poll(void *opaque)
      * received, however we must block autopoll until the point where
      * the entire reply has been read back to the host
      */
-    if (adb_bus->autopoll_blocked) {
-        return;
-    } else {
-        adb_autopoll_block(adb_bus);
-    }
+    adb_autopoll_block(adb_bus);
 
     m->adb_data_in_index = 0;
     m->adb_data_out_index = 0;
-- 
2.20.1



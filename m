Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D431F8941
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jun 2020 16:34:36 +0200 (CEST)
Received: from localhost ([::1]:41294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkTiV-0005U3-GW
	for lists+qemu-devel@lfdr.de; Sun, 14 Jun 2020 10:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTeQ-0007zg-Ab; Sun, 14 Jun 2020 10:30:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38436
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTeO-0005O8-NA; Sun, 14 Jun 2020 10:30:21 -0400
Received: from host217-39-64-113.range217-39.btcentralplus.com
 ([217.39.64.113] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTeE-0006Hv-Rp; Sun, 14 Jun 2020 15:30:18 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, laurent@vivier.eu,
 fthain@telegraphics.com.au
Date: Sun, 14 Jun 2020 15:28:32 +0100
Message-Id: <20200614142840.10245-15-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
References: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.64.113
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 14/22] adb: use adb_request() only for explicit requests
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

Currently adb_request() is called both for explicit ADB requests and internal
autopoll requests via adb_poll().

Move the current functionality into do_adb_request() to be used internally and
add a simple adb_request() wrapper for explicit requests.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/adb.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/input/adb.c b/hw/input/adb.c
index a7a482fdfa..b3ad7c5fca 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -38,7 +38,8 @@ static void adb_device_reset(ADBDevice *d)
     qdev_reset_all(DEVICE(d));
 }
 
-int adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf, int len)
+static int do_adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf,
+                          int len)
 {
     ADBDevice *d;
     ADBDeviceClass *adc;
@@ -83,6 +84,11 @@ int adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf, int len)
     return ADB_RET_NOTPRESENT;
 }
 
+int adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf, int len)
+{
+    return do_adb_request(s, obuf, buf, len);
+}
+
 /* XXX: move that to cuda ? */
 int adb_poll(ADBBusState *s, uint8_t *obuf, uint16_t poll_mask)
 {
@@ -98,7 +104,7 @@ int adb_poll(ADBBusState *s, uint8_t *obuf, uint16_t poll_mask)
         d = s->devices[s->poll_index];
         if ((1 << d->devaddr) & poll_mask) {
             buf[0] = ADB_READREG | (d->devaddr << 4);
-            olen = adb_request(s, obuf + 1, buf, 1);
+            olen = do_adb_request(s, obuf + 1, buf, 1);
             /* if there is data, we poll again the same device */
             if (olen > 0) {
                 s->status |= ADB_STATUS_POLLREPLY;
-- 
2.20.1



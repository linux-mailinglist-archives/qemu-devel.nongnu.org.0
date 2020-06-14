Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E571F8944
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jun 2020 16:36:00 +0200 (CEST)
Received: from localhost ([::1]:47668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkTjr-00085e-Pv
	for lists+qemu-devel@lfdr.de; Sun, 14 Jun 2020 10:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTeE-0007e5-UT; Sun, 14 Jun 2020 10:30:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38422
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTeD-0005Im-9P; Sun, 14 Jun 2020 10:30:10 -0400
Received: from host217-39-64-113.range217-39.btcentralplus.com
 ([217.39.64.113] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jkTe4-0006Hv-GH; Sun, 14 Jun 2020 15:30:06 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, laurent@vivier.eu,
 fthain@telegraphics.com.au
Date: Sun, 14 Jun 2020 15:28:30 +0100
Message-Id: <20200614142840.10245-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
References: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.64.113
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 12/22] adb: keep track of devices with pending data
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

Add a new pending variable to ADBBusState which is a bitmask indicating which
ADB devices have data to send. Update the bitmask every time that an ADB
request is executed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/adb.c         | 16 +++++++++++++++-
 include/hw/input/adb.h |  1 +
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/input/adb.c b/hw/input/adb.c
index bb36ce6fad..c1adb21e6b 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -41,6 +41,7 @@ static void adb_device_reset(ADBDevice *d)
 int adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf, int len)
 {
     ADBDevice *d;
+    ADBDeviceClass *adc;
     int devaddr, cmd, i;
 
     cmd = buf[0] & 0xf;
@@ -51,14 +52,27 @@ int adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf, int len)
         }
         return 0;
     }
+
+    s->pending = 0;
+    for (i = 0; i < s->nb_devices; i++) {
+        d = s->devices[i];
+        adc = ADB_DEVICE_GET_CLASS(d);
+
+        if (adc->devhasdata(d)) {
+            s->pending |= (1 << d->devaddr);
+        }
+    }
+
     devaddr = buf[0] >> 4;
     for (i = 0; i < s->nb_devices; i++) {
         d = s->devices[i];
+        adc = ADB_DEVICE_GET_CLASS(d);
+
         if (d->devaddr == devaddr) {
-            ADBDeviceClass *adc = ADB_DEVICE_GET_CLASS(d);
             return adc->devreq(d, obuf, buf, len);
         }
     }
+
     return ADB_RET_NOTPRESENT;
 }
 
diff --git a/include/hw/input/adb.h b/include/hw/input/adb.h
index 9b80204e43..f1bc358d8e 100644
--- a/include/hw/input/adb.h
+++ b/include/hw/input/adb.h
@@ -76,6 +76,7 @@ struct ADBBusState {
     /*< public >*/
 
     ADBDevice *devices[MAX_ADB_DEVICES];
+    uint16_t pending;
     int nb_devices;
     int poll_index;
 
-- 
2.20.1



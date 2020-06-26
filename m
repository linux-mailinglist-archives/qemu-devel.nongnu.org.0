Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B705120AEFA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 11:29:15 +0200 (CEST)
Received: from localhost ([::1]:60838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jokfa-000528-O0
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 05:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jokbA-0005KM-J8; Fri, 26 Jun 2020 05:24:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:34310
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jokb8-00051Q-QK; Fri, 26 Jun 2020 05:24:40 -0400
Received: from host86-158-109-79.range86-158.btcentralplus.com
 ([86.158.109.79] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jokb6-0007bz-NQ; Fri, 26 Jun 2020 10:24:41 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org, laurent@vivier.eu, david@gibson.dropbear.id.au,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Date: Fri, 26 Jun 2020 10:23:08 +0100
Message-Id: <20200626092317.3875-14-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626092317.3875-1-mark.cave-ayland@ilande.co.uk>
References: <20200626092317.3875-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.158.109.79
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 13/22] adb: add status field for holding information about the
 last ADB request
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

Currently only 2 bits are defined: one to indicate if the request timed out (no
reply) and another to indicate whether the request was the result of an autopoll
operation.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@telegraphics.com.au>
Acked-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200623204936.24064-14-mark.cave-ayland@ilande.co.uk>
---
 hw/input/adb.c         | 14 +++++++++++---
 include/hw/input/adb.h |  4 ++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/input/adb.c b/hw/input/adb.c
index c1adb21e6b..a7a482fdfa 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -42,7 +42,7 @@ int adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf, int len)
 {
     ADBDevice *d;
     ADBDeviceClass *adc;
-    int devaddr, cmd, i;
+    int devaddr, cmd, olen, i;
 
     cmd = buf[0] & 0xf;
     if (cmd == ADB_BUSRESET) {
@@ -50,6 +50,7 @@ int adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf, int len)
             d = s->devices[i];
             adb_device_reset(d);
         }
+        s->status = 0;
         return 0;
     }
 
@@ -63,16 +64,22 @@ int adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf, int len)
         }
     }
 
+    s->status = 0;
     devaddr = buf[0] >> 4;
     for (i = 0; i < s->nb_devices; i++) {
         d = s->devices[i];
         adc = ADB_DEVICE_GET_CLASS(d);
 
         if (d->devaddr == devaddr) {
-            return adc->devreq(d, obuf, buf, len);
+            olen = adc->devreq(d, obuf, buf, len);
+            if (!olen) {
+                s->status |= ADB_STATUS_BUSTIMEOUT;
+            }
+            return olen;
         }
     }
 
+    s->status |= ADB_STATUS_BUSTIMEOUT;
     return ADB_RET_NOTPRESENT;
 }
 
@@ -94,9 +101,10 @@ int adb_poll(ADBBusState *s, uint8_t *obuf, uint16_t poll_mask)
             olen = adb_request(s, obuf + 1, buf, 1);
             /* if there is data, we poll again the same device */
             if (olen > 0) {
+                s->status |= ADB_STATUS_POLLREPLY;
                 obuf[0] = buf[0];
                 olen++;
-                break;
+                return olen;
             }
         }
         s->poll_index++;
diff --git a/include/hw/input/adb.h b/include/hw/input/adb.h
index f1bc358d8e..cff264739c 100644
--- a/include/hw/input/adb.h
+++ b/include/hw/input/adb.h
@@ -70,6 +70,9 @@ typedef struct ADBDeviceClass {
 #define TYPE_ADB_BUS "apple-desktop-bus"
 #define ADB_BUS(obj) OBJECT_CHECK(ADBBusState, (obj), TYPE_ADB_BUS)
 
+#define ADB_STATUS_BUSTIMEOUT  0x1
+#define ADB_STATUS_POLLREPLY   0x2
+
 struct ADBBusState {
     /*< private >*/
     BusState parent_obj;
@@ -79,6 +82,7 @@ struct ADBBusState {
     uint16_t pending;
     int nb_devices;
     int poll_index;
+    uint8_t status;
 
     QEMUTimer *autopoll_timer;
     bool autopoll_enabled;
-- 
2.20.1



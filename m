Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317E82E7AC3
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:54:26 +0100 (CET)
Received: from localhost ([::1]:50862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudnt-0000T7-8c
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYS-0000Hb-8K
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:29 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50766
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYQ-000209-QC
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:28 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYP-00070L-62; Wed, 30 Dec 2020 15:38:29 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:26 +0000
Message-Id: <20201230153745.30241-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 06/25] esp: introduce esp_get_tc() and esp_set_tc()
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

This simplifies reading and writing the TC register value without having to
manually shift each individual 8-bit value.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 7169294437..42cbc1da9b 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -98,6 +98,24 @@ void esp_request_cancelled(SCSIRequest *req)
     }
 }
 
+static uint32_t esp_get_tc(ESPState *s)
+{
+    uint32_t dmalen;
+
+    dmalen = s->rregs[ESP_TCLO];
+    dmalen |= s->rregs[ESP_TCMID] << 8;
+    dmalen |= s->rregs[ESP_TCHI] << 16;
+
+    return dmalen;
+}
+
+static void esp_set_tc(ESPState *s, uint32_t dmalen)
+{
+    s->rregs[ESP_TCLO] = dmalen & 0xff;
+    s->rregs[ESP_TCMID] = dmalen >> 8;
+    s->rregs[ESP_TCHI] = dmalen >> 16;
+}
+
 static void set_pdma(ESPState *s, enum pdma_origin_id origin,
                      uint32_t index, uint32_t len)
 {
@@ -157,9 +175,7 @@ static uint32_t get_cmd(ESPState *s, uint8_t *buf, uint8_t buflen)
 
     target = s->wregs[ESP_WBUSID] & BUSID_DID;
     if (s->dma) {
-        dmalen = s->rregs[ESP_TCLO];
-        dmalen |= s->rregs[ESP_TCMID] << 8;
-        dmalen |= s->rregs[ESP_TCHI] << 16;
+        dmalen = esp_get_tc(s);
         if (dmalen > buflen) {
             return 0;
         }
@@ -536,9 +552,7 @@ static void handle_ti(ESPState *s)
         return;
     }
 
-    dmalen = s->rregs[ESP_TCLO];
-    dmalen |= s->rregs[ESP_TCMID] << 8;
-    dmalen |= s->rregs[ESP_TCHI] << 16;
+    dmalen = esp_get_tc(s);
     if (dmalen == 0) {
         dmalen = 0x10000;
     }
@@ -869,9 +883,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
 
     trace_esp_pdma_write(size);
 
-    dmalen = s->rregs[ESP_TCLO];
-    dmalen |= s->rregs[ESP_TCMID] << 8;
-    dmalen |= s->rregs[ESP_TCHI] << 16;
+    dmalen = esp_get_tc(s);
     if (dmalen == 0 || s->pdma_len == 0) {
         return;
     }
@@ -888,9 +900,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
         dmalen -= 2;
         break;
     }
-    s->rregs[ESP_TCLO] = dmalen & 0xff;
-    s->rregs[ESP_TCMID] = dmalen >> 8;
-    s->rregs[ESP_TCHI] = dmalen >> 16;
+    esp_set_tc(s, dmalen);
     if (s->pdma_len == 0 && s->pdma_cb) {
         esp_lower_drq(s);
         s->pdma_cb(s);
-- 
2.20.1



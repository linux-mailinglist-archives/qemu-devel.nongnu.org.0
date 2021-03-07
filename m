Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27D23300C2
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 13:18:32 +0100 (CET)
Received: from localhost ([::1]:56000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIsMh-0000ag-KV
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 07:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsEP-0000iL-Mt
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:09:57 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43602
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsEN-0007cx-Vy
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:09:57 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsEI-0002V5-U2; Sun, 07 Mar 2021 12:09:55 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Sun,  7 Mar 2021 12:08:17 +0000
Message-Id: <20210307120850.10418-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
References: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 09/42] esp: introduce esp_get_tc() and esp_set_tc()
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

These functions simplify reading and writing the TC register value without having to
manually shift each individual 8-bit value.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210304221103.6369-10-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 5365523f6b..dd94f7b47b 100644
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
+    s->rregs[ESP_TCLO] = dmalen;
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
@@ -348,9 +364,7 @@ static void esp_dma_done(ESPState *s)
     s->rregs[ESP_RINTR] = INTR_BS;
     s->rregs[ESP_RSEQ] = 0;
     s->rregs[ESP_RFLAGS] = 0;
-    s->rregs[ESP_TCLO] = 0;
-    s->rregs[ESP_TCMID] = 0;
-    s->rregs[ESP_TCHI] = 0;
+    esp_set_tc(s, 0);
     esp_raise_irq(s);
 }
 
@@ -535,9 +549,7 @@ static void handle_ti(ESPState *s)
         return;
     }
 
-    dmalen = s->rregs[ESP_TCLO];
-    dmalen |= s->rregs[ESP_TCMID] << 8;
-    dmalen |= s->rregs[ESP_TCHI] << 16;
+    dmalen = esp_get_tc(s);
     if (dmalen == 0) {
         dmalen = 0x10000;
     }
@@ -888,9 +900,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
 
     trace_esp_pdma_write(size);
 
-    dmalen = s->rregs[ESP_TCLO];
-    dmalen |= s->rregs[ESP_TCMID] << 8;
-    dmalen |= s->rregs[ESP_TCHI] << 16;
+    dmalen = esp_get_tc(s);
     if (dmalen == 0 || s->pdma_len == 0) {
         return;
     }
@@ -907,9 +917,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
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



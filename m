Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD472E7A8A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:43:53 +0100 (CET)
Received: from localhost ([::1]:52666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuddg-000666-HU
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYz-0000pe-Rk
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:01 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50830
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYu-00028e-R3
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:01 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYt-00070L-Ii; Wed, 30 Dec 2020 15:39:00 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:32 +0000
Message-Id: <20201230153745.30241-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 12/25] esp: introduce esp_pdma_read() and esp_pdma_write()
 functions
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 39c5eeb57c..80f7f73002 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -151,6 +151,20 @@ static uint8_t *get_pdma_buf(ESPState *s)
     return NULL;
 }
 
+static uint8_t esp_pdma_read(ESPState *s)
+{
+    uint8_t *buf = get_pdma_buf(s);
+
+    return buf[s->pdma_cur++];
+}
+
+static void esp_pdma_write(ESPState *s, uint8_t val)
+{
+    uint8_t *buf = get_pdma_buf(s);
+
+    buf[s->pdma_cur++] = val;
+}
+
 static int get_cmd_cb(ESPState *s)
 {
     int target;
@@ -879,7 +893,6 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
     SysBusESPState *sysbus = opaque;
     ESPState *s = &sysbus->esp;
     uint32_t dmalen = esp_get_tc(s);
-    uint8_t *buf = get_pdma_buf(s);
 
     trace_esp_pdma_write(size);
 
@@ -888,13 +901,13 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
     }
     switch (size) {
     case 1:
-        buf[s->pdma_cur++] = val;
+        esp_pdma_write(s, val);
         s->pdma_len--;
         dmalen--;
         break;
     case 2:
-        buf[s->pdma_cur++] = val >> 8;
-        buf[s->pdma_cur++] = val;
+        esp_pdma_write(s, val >> 8);
+        esp_pdma_write(s, val);
         s->pdma_len -= 2;
         dmalen -= 2;
         break;
@@ -913,7 +926,6 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
     SysBusESPState *sysbus = opaque;
     ESPState *s = &sysbus->esp;
     uint32_t dmalen = esp_get_tc(s);
-    uint8_t *buf = get_pdma_buf(s);
     uint64_t val = 0;
 
     trace_esp_pdma_read(size);
@@ -923,13 +935,13 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
     }
     switch (size) {
     case 1:
-        val = buf[s->pdma_cur++];
+        val = esp_pdma_read(s);
         s->pdma_len--;
         dmalen--;
         break;
     case 2:
-        val = buf[s->pdma_cur++];
-        val = (val << 8) | buf[s->pdma_cur++];
+        val = esp_pdma_read(s);
+        val = (val << 8) | esp_pdma_read(s);
         s->pdma_len -= 2;
         dmalen -= 2;
         break;
-- 
2.20.1



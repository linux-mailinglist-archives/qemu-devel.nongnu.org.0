Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16EC2E7ACF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:58:09 +0100 (CET)
Received: from localhost ([::1]:34692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudrU-0005fL-SQ
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZ1-0000v7-Ch
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:03 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50840
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYv-00029R-Cl
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:03 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYy-00070L-Oj; Wed, 30 Dec 2020 15:39:01 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:34 +0000
Message-Id: <20201230153745.30241-15-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 14/25] esp: move pdma_len and TC logic into
 esp_pdma_read()/esp_pdma_write()
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
 hw/scsi/esp.c | 50 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 6a3a4cbc80..2b307341ad 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -153,22 +153,45 @@ static uint8_t *get_pdma_buf(ESPState *s)
 
 static uint8_t esp_pdma_read(ESPState *s)
 {
+    uint32_t dmalen = esp_get_tc(s);
+    uint8_t val;
+
+    if (dmalen == 0 || s->pdma_len == 0) {
+        return 0;
+    }
+
     switch (s->pdma_origin) {
     case PDMA:
-        return s->pdma_buf[s->pdma_cur++];
+        val = s->pdma_buf[s->pdma_cur++];
+        break;
     case TI:
-        return s->ti_buf[s->pdma_cur++];
+        val = s->ti_buf[s->pdma_cur++];
+        break;
     case CMD:
-        return s->cmdbuf[s->pdma_cur++];
+        val = s->cmdbuf[s->pdma_cur++];
+        break;
     case ASYNC:
-        return s->async_buf[s->pdma_cur++];
+        val = s->async_buf[s->pdma_cur++];
+        break;
     default:
         g_assert_not_reached();
     }
+
+    s->pdma_len--;
+    dmalen--;
+    esp_set_tc(s, dmalen);
+
+    return val;
 }
 
 static void esp_pdma_write(ESPState *s, uint8_t val)
 {
+    uint32_t dmalen = esp_get_tc(s);
+
+    if (dmalen == 0 || s->pdma_len == 0) {
+        return;
+    }
+
     switch (s->pdma_origin) {
     case PDMA:
         s->pdma_buf[s->pdma_cur++] = val;
@@ -185,6 +208,10 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
     default:
         g_assert_not_reached();
     }
+
+    s->pdma_len--;
+    dmalen--;
+    esp_set_tc(s, dmalen);
 }
 
 static int get_cmd_cb(ESPState *s)
@@ -914,27 +941,18 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
 {
     SysBusESPState *sysbus = opaque;
     ESPState *s = &sysbus->esp;
-    uint32_t dmalen = esp_get_tc(s);
 
     trace_esp_pdma_write(size);
 
-    if (dmalen == 0 || s->pdma_len == 0) {
-        return;
-    }
     switch (size) {
     case 1:
         esp_pdma_write(s, val);
-        s->pdma_len--;
-        dmalen--;
         break;
     case 2:
         esp_pdma_write(s, val >> 8);
         esp_pdma_write(s, val);
-        s->pdma_len -= 2;
-        dmalen -= 2;
         break;
     }
-    esp_set_tc(s, dmalen);
     if (s->pdma_len == 0 && s->pdma_cb) {
         esp_lower_drq(s);
         s->pdma_cb(s);
@@ -958,17 +976,13 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
     switch (size) {
     case 1:
         val = esp_pdma_read(s);
-        s->pdma_len--;
-        dmalen--;
         break;
     case 2:
         val = esp_pdma_read(s);
         val = (val << 8) | esp_pdma_read(s);
-        s->pdma_len -= 2;
-        dmalen -= 2;
         break;
     }
-    esp_set_tc(s, dmalen);
+    dmalen = esp_get_tc(s);
     if (dmalen == 0 || (s->pdma_len == 0 && s->pdma_cb)) {
         esp_lower_drq(s);
         s->pdma_cb(s);
-- 
2.20.1



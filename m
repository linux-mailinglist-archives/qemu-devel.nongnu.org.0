Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8084931572E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:51:56 +0100 (CET)
Received: from localhost ([::1]:45704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Z3C-0002Ip-VM
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yjk-00052J-1N
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:31:49 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56880
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yjf-0002To-8M
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:31:47 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yjz-0007pt-Ho; Tue, 09 Feb 2021 19:32:06 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:29:51 +0000
Message-Id: <20210209193018.31339-16-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 15/42] esp: introduce esp_pdma_read() and esp_pdma_write()
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
index e7cf36f4b8..b0cba889a9 100644
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
@@ -910,7 +924,6 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
     SysBusESPState *sysbus = opaque;
     ESPState *s = ESP(&sysbus->esp);
     uint32_t dmalen = esp_get_tc(s);
-    uint8_t *buf = get_pdma_buf(s);
 
     trace_esp_pdma_write(size);
 
@@ -919,13 +932,13 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
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
@@ -944,7 +957,6 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
     SysBusESPState *sysbus = opaque;
     ESPState *s = ESP(&sysbus->esp);
     uint32_t dmalen = esp_get_tc(s);
-    uint8_t *buf = get_pdma_buf(s);
     uint64_t val = 0;
 
     trace_esp_pdma_read(size);
@@ -954,13 +966,13 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
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



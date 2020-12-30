Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DFB2E7AAD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:50:34 +0100 (CET)
Received: from localhost ([::1]:39694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudk9-00047H-DW
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZ2-0000xh-BA
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:04 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50834
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYu-00028g-Re
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:04 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYy-00070L-E4; Wed, 30 Dec 2020 15:39:00 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:33 +0000
Message-Id: <20201230153745.30241-14-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 13/25] esp: use pdma_origin directly in
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

This is the first step in removing get_pdma_buf() from esp.c.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 80f7f73002..6a3a4cbc80 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -153,16 +153,38 @@ static uint8_t *get_pdma_buf(ESPState *s)
 
 static uint8_t esp_pdma_read(ESPState *s)
 {
-    uint8_t *buf = get_pdma_buf(s);
-
-    return buf[s->pdma_cur++];
+    switch (s->pdma_origin) {
+    case PDMA:
+        return s->pdma_buf[s->pdma_cur++];
+    case TI:
+        return s->ti_buf[s->pdma_cur++];
+    case CMD:
+        return s->cmdbuf[s->pdma_cur++];
+    case ASYNC:
+        return s->async_buf[s->pdma_cur++];
+    default:
+        g_assert_not_reached();
+    }
 }
 
 static void esp_pdma_write(ESPState *s, uint8_t val)
 {
-    uint8_t *buf = get_pdma_buf(s);
-
-    buf[s->pdma_cur++] = val;
+    switch (s->pdma_origin) {
+    case PDMA:
+        s->pdma_buf[s->pdma_cur++] = val;
+        break;
+    case TI:
+        s->ti_buf[s->pdma_cur++] = val;
+        break;
+    case CMD:
+        s->cmdbuf[s->pdma_cur++] = val;
+        break;
+    case ASYNC:
+        s->async_buf[s->pdma_cur++] = val;
+        break;
+    default:
+        g_assert_not_reached();
+    }
 }
 
 static int get_cmd_cb(ESPState *s)
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA984CB164
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:35:47 +0100 (CET)
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWdO-0001ad-8k
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:35:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWWY-0002Az-83
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 16:28:42 -0500
Received: from [2001:41c9:1:41f::167] (port=54792
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWWW-0002Gc-TK
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 16:28:41 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWVp-000C4G-D9; Wed, 02 Mar 2022 21:28:01 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, pbonzini@redhat.com, fam@euphon.net,
 qemu-devel@nongnu.org
Date: Wed,  2 Mar 2022 21:27:49 +0000
Message-Id: <20220302212752.6922-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 07/10] esp: introduce esp_pdma_cb() function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

This function is to be used to execute the current PDMA callback rather than
dereferencing the ESPState pdma_cb function pointer directly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/scsi/esp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index d1640218c4..035fb0d1f6 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -200,6 +200,11 @@ static void esp_set_pdma_cb(ESPState *s, void (*cb)(ESPState *))
     s->pdma_cb = cb;
 }
 
+static void esp_pdma_cb(ESPState *s)
+{
+    s->pdma_cb(s);
+}
+
 static int esp_select(ESPState *s)
 {
     int target;
@@ -1268,7 +1273,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
         esp_pdma_write(s, val);
         break;
     }
-    s->pdma_cb(s);
+    esp_pdma_cb(s);
 }
 
 static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
@@ -1290,7 +1295,7 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
         break;
     }
     if (fifo8_num_used(&s->fifo) < 2) {
-        s->pdma_cb(s);
+        esp_pdma_cb(s);
     }
     return val;
 }
-- 
2.20.1



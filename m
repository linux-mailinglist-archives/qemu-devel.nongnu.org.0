Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4A31574E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:01:19 +0100 (CET)
Received: from localhost ([::1]:42676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZCH-0004dX-84
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YkS-0005hy-Hw
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:32:32 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56950
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YkL-0002jE-OJ
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:32:32 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YkU-0007pt-GN; Tue, 09 Feb 2021 19:32:38 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:29:58 +0000
Message-Id: <20210209193018.31339-23-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 22/42] esp: move PDMA length adjustments into
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

Here the updates to async_len and ti_size are moved into the corresponding
esp_pdma_read()/esp_pdma_write() function to eliminate the reference to
pdma_cur in do_dma_pdma_cb().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 91f65a5d9b..691a2f4bdc 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -153,12 +153,18 @@ static uint8_t esp_pdma_read(ESPState *s)
         s->pdma_cur++;
         break;
     case ASYNC:
-        val = s->async_buf[s->pdma_cur++];
+        val = s->async_buf[0];
+        if (s->async_len > 0) {
+            s->async_len--;
+            s->async_buf++;
+        }
+        s->pdma_cur++;
         break;
     default:
         g_assert_not_reached();
     }
 
+    s->ti_size--;
     s->pdma_len--;
     dmalen--;
     esp_set_tc(s, dmalen);
@@ -183,12 +189,18 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
         s->pdma_cur++;
         break;
     case ASYNC:
-        s->async_buf[s->pdma_cur++] = val;
+        s->async_buf[0] = val;
+        if (s->async_len > 0) {
+            s->async_len--;
+            s->async_buf++;
+        }
+        s->pdma_cur++;
         break;
     default:
         g_assert_not_reached();
     }
 
+    s->ti_size++;
     s->pdma_len--;
     dmalen--;
     esp_set_tc(s, dmalen);
@@ -427,7 +439,6 @@ static void esp_dma_done(ESPState *s)
 static void do_dma_pdma_cb(ESPState *s)
 {
     int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
-    int len = s->pdma_cur;
 
     if (s->do_cmd) {
         s->ti_size = 0;
@@ -436,13 +447,6 @@ static void do_dma_pdma_cb(ESPState *s)
         do_cmd(s);
         return;
     }
-    s->async_buf += len;
-    s->async_len -= len;
-    if (to_device) {
-        s->ti_size += len;
-    } else {
-        s->ti_size -= len;
-    }
     if (s->async_len == 0) {
         scsi_req_continue(s->current_req);
         /*
-- 
2.20.1



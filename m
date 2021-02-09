Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4B3315729
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:51:30 +0100 (CET)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Z2n-0001jw-PX
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:51:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YkL-0005ZA-Cy
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:32:25 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56932
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YkB-0002e7-Tj
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:32:23 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9YkJ-0007pt-Es; Tue, 09 Feb 2021 19:32:29 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:29:56 +0000
Message-Id: <20210209193018.31339-21-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 20/42] esp: remove the buf and buflen parameters from
 get_cmd()
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

Now that all SCSI commands are accumulated in cmdbuf, remove the buf and buflen
parameters from get_cmd() since these always reference cmdbuf and ESP_CMDBUF_SZ
respectively.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index bb467fbcdf..7055520a26 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -236,15 +236,16 @@ static int get_cmd_cb(ESPState *s)
     return 0;
 }
 
-static uint32_t get_cmd(ESPState *s, uint8_t *buf, uint8_t buflen)
+static uint32_t get_cmd(ESPState *s)
 {
+    uint8_t *buf = s->cmdbuf;
     uint32_t dmalen;
     int target;
 
     target = s->wregs[ESP_WBUSID] & BUSID_DID;
     if (s->dma) {
         dmalen = esp_get_tc(s);
-        if (dmalen > buflen) {
+        if (dmalen > ESP_CMDBUF_SZ) {
             return 0;
         }
         if (s->dma_memory_read) {
@@ -323,7 +324,7 @@ static void handle_satn(ESPState *s)
         return;
     }
     s->pdma_cb = satn_pdma_cb;
-    s->cmdlen = get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
+    s->cmdlen = get_cmd(s);
     if (s->cmdlen) {
         do_cmd(s);
     } else {
@@ -349,7 +350,7 @@ static void handle_s_without_atn(ESPState *s)
         return;
     }
     s->pdma_cb = s_without_satn_pdma_cb;
-    s->cmdlen = get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
+    s->cmdlen = get_cmd(s);
     if (s->cmdlen) {
         do_busid_cmd(s, s->cmdbuf, 0);
     } else {
@@ -380,7 +381,7 @@ static void handle_satn_stop(ESPState *s)
         return;
     }
     s->pdma_cb = satn_stop_pdma_cb;
-    s->cmdlen = get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
+    s->cmdlen = get_cmd(s);
     if (s->cmdlen) {
         trace_esp_handle_satn_stop(s->cmdlen);
         s->do_cmd = 1;
-- 
2.20.1



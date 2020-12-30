Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6DE2E7AD2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:59:58 +0100 (CET)
Received: from localhost ([::1]:36770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudtF-0006ay-DB
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:59:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZ9-0001Cg-4Z
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:11 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50866
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZ7-0002DC-Bc
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:10 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZ4-00070L-7y; Wed, 30 Dec 2020 15:39:11 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:36 +0000
Message-Id: <20201230153745.30241-17-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 16/25] esp: remove redundant pdma_start from ESPState
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

Now that PDMA SCSI commands are accumulated in cmdbuf in the same way as normal
commands, the existing logic for locating the start of the SCSI command in
cmdbuf via cmdlen can be used. This enables the PDMA-specific pdma_start and
also get_pdma_buf() to be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 3bebd832aa..ca1472962d 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -131,24 +131,10 @@ static void set_pdma(ESPState *s, enum pdma_origin_id origin,
                      uint32_t index, uint32_t len)
 {
     s->pdma_origin = origin;
-    s->pdma_start = index;
     s->pdma_cur = index;
     s->pdma_len = len;
 }
 
-static uint8_t *get_pdma_buf(ESPState *s)
-{
-    switch (s->pdma_origin) {
-    case TI:
-        return s->ti_buf;
-    case CMD:
-        return s->cmdbuf;
-    case ASYNC:
-        return s->async_buf;
-    }
-    return NULL;
-}
-
 static uint8_t esp_pdma_read(ESPState *s)
 {
     uint32_t dmalen = esp_get_tc(s);
@@ -337,7 +323,7 @@ static void s_without_satn_pdma_cb(ESPState *s)
     }
     s->do_cmd = 0;
     if (s->cmdlen) {
-        do_busid_cmd(s, get_pdma_buf(s) + s->pdma_start, 0);
+        do_busid_cmd(s, s->cmdbuf, 0);
     }
 }
 
@@ -441,7 +427,7 @@ static void esp_dma_done(ESPState *s)
 static void do_dma_pdma_cb(ESPState *s)
 {
     int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
-    int len = s->pdma_cur - s->pdma_start;
+    int len = s->pdma_cur;
 
     if (s->do_cmd) {
         s->ti_size = 0;
@@ -869,7 +855,6 @@ static const VMStateDescription vmstate_esp_pdma = {
     .fields = (VMStateField[]) {
         VMSTATE_INT32(pdma_origin, ESPState),
         VMSTATE_UINT32(pdma_len, ESPState),
-        VMSTATE_UINT32(pdma_start, ESPState),
         VMSTATE_UINT32(pdma_cur, ESPState),
         VMSTATE_END_OF_LIST()
     }
-- 
2.20.1



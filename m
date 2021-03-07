Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8D23300CC
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 13:25:22 +0100 (CET)
Received: from localhost ([::1]:41348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIsTJ-0006LL-6B
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 07:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsFN-0001sX-Ss
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:10:57 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43664
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsFK-0007sU-Ow
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:10:56 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsF0-0002V5-2L; Sun, 07 Mar 2021 12:10:39 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Sun,  7 Mar 2021 12:08:27 +0000
Message-Id: <20210307120850.10418-20-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
References: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 19/42] esp: remove buf parameter from do_cmd()
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

Now that all SCSI commands are accumulated in cmdbuf, remove the buf parameter
from do_cmd() since this always points to cmdbuf.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210304221103.6369-20-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 66caa95815..8ebf5e8d4b 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -297,8 +297,9 @@ static void do_busid_cmd(ESPState *s, uint8_t *buf, uint8_t busid)
     esp_raise_irq(s);
 }
 
-static void do_cmd(ESPState *s, uint8_t *buf)
+static void do_cmd(ESPState *s)
 {
+    uint8_t *buf = s->cmdbuf;
     uint8_t busid = buf[0];
 
     do_busid_cmd(s, &buf[1], busid);
@@ -311,7 +312,7 @@ static void satn_pdma_cb(ESPState *s)
     }
     s->do_cmd = 0;
     if (s->cmdlen) {
-        do_cmd(s, s->cmdbuf);
+        do_cmd(s);
     }
 }
 
@@ -324,7 +325,7 @@ static void handle_satn(ESPState *s)
     s->pdma_cb = satn_pdma_cb;
     s->cmdlen = get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
     if (s->cmdlen) {
-        do_cmd(s, s->cmdbuf);
+        do_cmd(s);
     } else {
         s->do_cmd = 1;
     }
@@ -445,7 +446,7 @@ static void do_dma_pdma_cb(ESPState *s)
         s->ti_size = 0;
         s->cmdlen = 0;
         s->do_cmd = 0;
-        do_cmd(s, s->cmdbuf);
+        do_cmd(s);
         return;
     }
     s->async_buf += len;
@@ -497,7 +498,7 @@ static void esp_do_dma(ESPState *s)
         s->ti_size = 0;
         s->cmdlen = 0;
         s->do_cmd = 0;
-        do_cmd(s, s->cmdbuf);
+        do_cmd(s);
         return;
     }
     if (s->async_len == 0) {
@@ -627,7 +628,7 @@ static void handle_ti(ESPState *s)
         s->ti_size = 0;
         s->cmdlen = 0;
         s->do_cmd = 0;
-        do_cmd(s, s->cmdbuf);
+        do_cmd(s);
     }
 }
 
-- 
2.20.1



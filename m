Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6023300B8
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 13:15:11 +0100 (CET)
Received: from localhost ([::1]:47638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIsJS-0005GS-8V
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 07:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsEU-0000pI-K2
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:10:06 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43608
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsES-0007ev-Qs
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:10:02 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsEN-0002V5-On; Sun, 07 Mar 2021 12:10:00 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Sun,  7 Mar 2021 12:08:18 +0000
Message-Id: <20210307120850.10418-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
References: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 10/42] esp: introduce esp_get_stc()
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

This function simplifies reading the STC register value without having to manually
shift each individual 8-bit value.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210304221103.6369-11-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index dd94f7b47b..125bdea32a 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -116,6 +116,17 @@ static void esp_set_tc(ESPState *s, uint32_t dmalen)
     s->rregs[ESP_TCHI] = dmalen >> 16;
 }
 
+static uint32_t esp_get_stc(ESPState *s)
+{
+    uint32_t dmalen;
+
+    dmalen = s->wregs[ESP_TCLO];
+    dmalen |= s->wregs[ESP_TCMID] << 8;
+    dmalen |= s->wregs[ESP_TCHI] << 16;
+
+    return dmalen;
+}
+
 static void set_pdma(ESPState *s, enum pdma_origin_id origin,
                      uint32_t index, uint32_t len)
 {
@@ -687,9 +698,7 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
         if (val & CMD_DMA) {
             s->dma = 1;
             /* Reload DMA counter.  */
-            s->rregs[ESP_TCLO] = s->wregs[ESP_TCLO];
-            s->rregs[ESP_TCMID] = s->wregs[ESP_TCMID];
-            s->rregs[ESP_TCHI] = s->wregs[ESP_TCHI];
+            esp_set_tc(s, esp_get_stc(s));
         } else {
             s->dma = 0;
         }
-- 
2.20.1



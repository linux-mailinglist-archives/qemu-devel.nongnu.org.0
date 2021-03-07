Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E732C33010A
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 13:51:38 +0100 (CET)
Received: from localhost ([::1]:38058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIssh-0003hI-Uj
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 07:51:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsGe-0003NO-VA
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:12:17 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43758
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsGa-0008Hx-2Y
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:12:15 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsGJ-0002V5-OA; Sun, 07 Mar 2021 12:12:00 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Sun,  7 Mar 2021 12:08:43 +0000
Message-Id: <20210307120850.10418-36-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
References: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 35/42] esp: raise interrupt after every non-DMA byte
 transferred to the FIFO
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

This matches the description in the datasheet and is required as support for
non-DMA transfers is added.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210304221103.6369-36-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index eb6681ca66..4ac299651f 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -760,6 +760,12 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
             s->ti_size++;
             s->ti_buf[s->ti_wptr++] = val & 0xff;
         }
+
+        /* Non-DMA transfers raise an interrupt after every byte */
+        if (s->rregs[ESP_CMD] == CMD_TI) {
+            s->rregs[ESP_RINTR] |= INTR_FC | INTR_BS;
+            esp_raise_irq(s);
+        }
         break;
     case ESP_CMD:
         s->rregs[saddr] = val;
-- 
2.20.1



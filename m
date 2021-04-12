Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED8935D347
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 00:42:28 +0200 (CEST)
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW5GF-0007ym-Gh
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 18:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4wJ-00037e-Fi
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 18:21:54 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44094
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4wG-00032H-Kd
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 18:21:51 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4wP-0004Dc-9S; Mon, 12 Apr 2021 23:22:03 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 12 Apr 2021 23:20:44 +0100
Message-Id: <20210412222048.22818-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412222048.22818-1-mark.cave-ayland@ilande.co.uk>
References: <20210412222048.22818-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 09/13] esp: don't overflow cmdfifo in get_cmd()
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

If the guest tries to read a CDB using DMA and cmdfifo is not empty then it is
possible to overflow cmdfifo.

Since this can only occur by issuing deliberately incorrect instruction
sequences, ensure that the maximum length of the CDB transferred to cmdfifo is
limited to the available free space within cmdfifo.

Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20210407195801.685-9-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index d3b105b703..9d3fdb4398 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -243,6 +243,7 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
         }
         if (s->dma_memory_read) {
             s->dma_memory_read(s->dma_opaque, buf, dmalen);
+            dmalen = MIN(fifo8_num_free(&s->cmdfifo), dmalen);
             fifo8_push_all(&s->cmdfifo, buf, dmalen);
         } else {
             if (esp_select(s) < 0) {
@@ -262,6 +263,7 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
         if (n >= 3) {
             buf[0] = buf[2] >> 5;
         }
+        n = MIN(fifo8_num_free(&s->cmdfifo), n);
         fifo8_push_all(&s->cmdfifo, buf, n);
     }
     trace_esp_get_cmd(dmalen, target);
-- 
2.20.1



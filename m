Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED070357568
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 22:06:09 +0200 (CEST)
Received: from localhost ([::1]:54504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUERE-0004Bk-VK
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 16:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lUEKQ-0007e0-Me
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 15:59:06 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37800
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lUEKL-0007XA-EL
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 15:59:06 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lUEKU-00073W-Rw; Wed, 07 Apr 2021 20:59:15 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, alxndr@bu.edu, laurent@vivier.eu,
 pbonzini@redhat.com
Date: Wed,  7 Apr 2021 20:57:58 +0100
Message-Id: <20210407195801.685-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407195801.685-1-mark.cave-ayland@ilande.co.uk>
References: <20210407195801.685-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v4 for-6.0 09/12] esp: don't overflow cmdfifo if TC is larger
 than the cmdfifo size
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

If a guest transfers the message out/command phase data using DMA with a TC
that is larger than the cmdfifo size then the cmdfifo overflows triggering
an assert. Limit the size of the transfer to the free space available in
cmdfifo.

Buglink: https://bugs.launchpad.net/qemu/+bug/1919036
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/scsi/esp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 53cc569e8a..782c6ee357 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -578,6 +578,7 @@ static void esp_do_dma(ESPState *s)
         cmdlen = fifo8_num_used(&s->cmdfifo);
         trace_esp_do_dma(cmdlen, len);
         if (s->dma_memory_read) {
+            len = MIN(len, fifo8_num_free(&s->cmdfifo));
             s->dma_memory_read(s->dma_opaque, buf, len);
             fifo8_push_all(&s->cmdfifo, buf, len);
         } else {
-- 
2.20.1



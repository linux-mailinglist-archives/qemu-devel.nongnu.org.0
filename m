Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BF34558A6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 11:08:19 +0100 (CET)
Received: from localhost ([::1]:50906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mneL4-00032g-56
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 05:08:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mneGj-0006qr-Ly
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:03:49 -0500
Received: from [2001:41c9:1:41f::167] (port=44590
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mneGi-0000tE-1w
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:03:49 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mneGT-000CXb-0W; Thu, 18 Nov 2021 10:03:37 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, fam@euphon.net, thuth@redhat.com, lvivier@redhat.com,
 qemu-devel@nongnu.org
Date: Thu, 18 Nov 2021 10:03:26 +0000
Message-Id: <20211118100327.29061-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211118100327.29061-1-mark.cave-ayland@ilande.co.uk>
References: <20211118100327.29061-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH for-6.2 1/2] esp: ensure that async_len is reset to 0 during
 esp_hard_reset()
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

If a reset command is sent after data has been transferred into the SCSI buffer
ensure that async_len is reset to 0. Otherwise a subsequent TI command assumes
the SCSI buffer contains data to be transferred to the device causing it to
dereference the stale async_buf pointer.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/724
---
 hw/scsi/esp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 84f935b549..58d0edbd56 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -894,6 +894,7 @@ void esp_hard_reset(ESPState *s)
     memset(s->wregs, 0, ESP_REGS);
     s->tchi_written = 0;
     s->ti_size = 0;
+    s->async_len = 0;
     fifo8_reset(&s->fifo);
     fifo8_reset(&s->cmdfifo);
     s->dma = 0;
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703E32E7AA0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:48:19 +0100 (CET)
Received: from localhost ([::1]:34196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudhy-0001nT-Di
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:48:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYO-0000Fj-6V
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:25 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50748
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYI-0001zQ-DX
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:23 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYH-00070L-0E; Wed, 30 Dec 2020 15:38:21 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:24 +0000
Message-Id: <20201230153745.30241-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 04/25] esp: add PDMA trace events
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

This will become more useful later when trying to debug mixed FIFO and PDMA
requests.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c        | 6 ++++++
 hw/scsi/trace-events | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index df15e3e7cf..619c3e9e28 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -63,11 +63,13 @@ static void esp_lower_irq(ESPState *s)
 static void esp_raise_drq(ESPState *s)
 {
     qemu_irq_raise(s->irq_data);
+    trace_esp_raise_drq();
 }
 
 static void esp_lower_drq(ESPState *s)
 {
     qemu_irq_lower(s->irq_data);
+    trace_esp_lower_drq();
 }
 
 void esp_dma_enable(ESPState *s, int irq, int level)
@@ -866,6 +868,8 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
     uint32_t dmalen;
     uint8_t *buf = get_pdma_buf(s);
 
+    trace_esp_pdma_write(size);
+
     dmalen = s->rregs[ESP_TCLO];
     dmalen |= s->rregs[ESP_TCMID] << 8;
     dmalen |= s->rregs[ESP_TCHI] << 16;
@@ -903,6 +907,8 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
     uint8_t *buf = get_pdma_buf(s);
     uint64_t val = 0;
 
+    trace_esp_pdma_read(size);
+
     if (s->pdma_len == 0) {
         return 0;
     }
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 261eecf0cf..ed387dc7fd 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -159,8 +159,12 @@ esp_error_unhandled_command(uint32_t val) "unhandled command (0x%2.2x)"
 esp_error_invalid_write(uint32_t val, uint32_t addr) "invalid write of 0x%02x at [0x%x]"
 esp_raise_irq(void) "Raise IRQ"
 esp_lower_irq(void) "Lower IRQ"
+esp_raise_drq(void) "Raise DREQ"
+esp_lower_drq(void) "Lower DREQ"
 esp_dma_enable(void) "Raise enable"
 esp_dma_disable(void) "Lower enable"
+esp_pdma_read(int size) "pDMA read %u bytes"
+esp_pdma_write(int size) "pDMA write %u bytes"
 esp_get_cmd(uint32_t dmalen, int target) "len %d target %d"
 esp_do_busid_cmd(uint8_t busid) "busid 0x%x"
 esp_handle_satn_stop(uint32_t cmdlen) "cmdlen %d"
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E353300B7
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 13:14:55 +0100 (CET)
Received: from localhost ([::1]:47468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIsJC-0005CL-50
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 07:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsEL-0000dW-6N
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:09:54 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43592
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsED-0007bQ-TQ
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:09:52 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsE8-0002V5-P4; Sun, 07 Mar 2021 12:09:45 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Sun,  7 Mar 2021 12:08:15 +0000
Message-Id: <20210307120850.10418-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
References: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 07/42] esp: add PDMA trace events
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210304221103.6369-8-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c        | 6 ++++++
 hw/scsi/trace-events | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 16c1853577..e0676ae790 100644
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
@@ -885,6 +887,8 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
     uint32_t dmalen;
     uint8_t *buf = get_pdma_buf(s);
 
+    trace_esp_pdma_write(size);
+
     dmalen = s->rregs[ESP_TCLO];
     dmalen |= s->rregs[ESP_TCMID] << 8;
     dmalen |= s->rregs[ESP_TCHI] << 16;
@@ -922,6 +926,8 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
     uint8_t *buf = get_pdma_buf(s);
     uint64_t val = 0;
 
+    trace_esp_pdma_read(size);
+
     if (s->pdma_len == 0) {
         return 0;
     }
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 6269547266..1c331fb189 100644
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



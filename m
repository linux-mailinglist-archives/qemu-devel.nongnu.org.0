Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4332E7A7A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:41:25 +0100 (CET)
Received: from localhost ([::1]:42358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudbI-0001o6-T0
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYD-00008c-Gq
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:13 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50720
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudYB-0001wg-4W
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:38:13 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudY5-00070L-QO; Wed, 30 Dec 2020 15:38:09 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:22 +0000
Message-Id: <20201230153745.30241-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 02/25] esp: add trace event when receiving a TI command
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

This enables us to determine whether the command being issued is for a DMA or a
non-DMA transfer.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c        | 1 +
 hw/scsi/trace-events | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 7073166ad1..5f2c352029 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -698,6 +698,7 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
             }
             break;
         case CMD_TI:
+            trace_esp_mem_writeb_cmd_ti(val);
             handle_ti(s);
             break;
         case CMD_ICCS:
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 9a4a60ca63..261eecf0cf 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -189,6 +189,7 @@ esp_mem_writeb_cmd_selatn(uint32_t val) "Select with ATN (0x%2.2x)"
 esp_mem_writeb_cmd_selatns(uint32_t val) "Select with ATN & stop (0x%2.2x)"
 esp_mem_writeb_cmd_ensel(uint32_t val) "Enable selection (0x%2.2x)"
 esp_mem_writeb_cmd_dissel(uint32_t val) "Disable selection (0x%2.2x)"
+esp_mem_writeb_cmd_ti(uint32_t val) "Transfer Information (0x%2.2x)"
 
 # esp-pci.c
 esp_pci_error_invalid_dma_direction(void) "invalid DMA transfer direction"
-- 
2.20.1



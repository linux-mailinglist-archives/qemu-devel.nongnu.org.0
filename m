Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91114D2DD3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:19:11 +0100 (CET)
Received: from localhost ([::1]:50584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRuLW-0004Yn-OV
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:19:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRuD1-0007Vf-9R
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:10:23 -0500
Received: from [2001:41c9:1:41f::167] (port=35822
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRuCz-0005VI-O6
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:10:22 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRuC8-000CWr-7d; Wed, 09 Mar 2022 11:09:32 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Wed,  9 Mar 2022 11:08:31 +0000
Message-Id: <20220309110831.18443-23-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220309110831.18443-1-mark.cave-ayland@ilande.co.uk>
References: <20220309110831.18443-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 22/22] esp: recreate ESPState current_req after migration
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Since PDMA reads/writes are driven by the guest, it is possible that migration
can occur whilst a SCSIRequest is still active. Fortunately active SCSIRequests
are already included in the migration stream and restarted post migration but
this still leaves the reference in ESPState uninitialised.

Implement the SCSIBusInfo .load_request callback to obtain a reference to the
currently active SCSIRequest and use it to recreate ESPState current_req
after migration.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220305155530.9265-11-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 3f7cf30fa7..2d3c649567 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -1349,6 +1349,15 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
     return val;
 }
 
+static void *esp_load_request(QEMUFile *f, SCSIRequest *req)
+{
+    ESPState *s = container_of(req->bus, ESPState, bus);
+
+    scsi_req_ref(req);
+    s->current_req = req;
+    return s;
+}
+
 static const MemoryRegionOps sysbus_esp_pdma_ops = {
     .read = sysbus_esp_pdma_read,
     .write = sysbus_esp_pdma_write,
@@ -1364,6 +1373,7 @@ static const struct SCSIBusInfo esp_scsi_info = {
     .max_target = ESP_MAX_DEVS,
     .max_lun = 7,
 
+    .load_request = esp_load_request,
     .transfer_data = esp_transfer_data,
     .complete = esp_command_complete,
     .cancel = esp_request_cancelled
-- 
2.20.1



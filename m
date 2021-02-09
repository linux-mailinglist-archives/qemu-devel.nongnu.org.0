Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F72C3156E9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:38:43 +0100 (CET)
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YqQ-0002Fk-D5
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yit-0003oZ-LE
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:30:55 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56766
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yio-00022j-FA
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:30:53 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l9Yj6-0007pt-Sm; Tue, 09 Feb 2021 19:31:11 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Tue,  9 Feb 2021 19:29:40 +0000
Message-Id: <20210209193018.31339-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 04/42] esp: add vmstate_esp version to embedded ESPState
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

The QOM object representing ESPState is currently embedded within both the
SYSBUS_ESP and PCI_ESP devices with migration state handled by embedding
vmstate_esp within each device using VMSTATE_STRUCT.

Since the vmstate_esp fields are embedded directly within the migration
stream, the incoming vmstate_esp version_id is lost. The only version information
available is that from vmstate_sysbus_esp_scsi and vmstate_esp_pci_scsi, but
those versions represent their respective devices and not that of the underlying
ESPState.

Resolve this by adding a new version-dependent field in vmstate_sysbus_esp_scsi
and vmstate_esp_pci_scsi which stores the vmstate_esp version_id field within
ESPState to be used to allow migration from older QEMU versions.

Finally bump the vmstate_esp version to 5 to cover the upcoming ESPState changes
within this patch series.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp-pci.c     |  3 ++-
 hw/scsi/esp.c         | 23 +++++++++++++++++++++--
 include/hw/scsi/esp.h |  2 ++
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index ccf73bb901..8a82404853 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -330,11 +330,12 @@ static void esp_pci_hard_reset(DeviceState *dev)
 
 static const VMStateDescription vmstate_esp_pci_scsi = {
     .name = "pciespscsi",
-    .version_id = 1,
+    .version_id = 2,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(parent_obj, PCIESPState),
         VMSTATE_BUFFER_UNSAFE(dma_regs, PCIESPState, 0, 8 * sizeof(uint32_t)),
+        VMSTATE_UINT8_V(esp.mig_version_id, PCIESPState, 2),
         VMSTATE_STRUCT(esp, PCIESPState, 0, vmstate_esp, ESPState),
         VMSTATE_END_OF_LIST()
     }
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 1635f86622..9427c55d1d 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -796,10 +796,28 @@ static const VMStateDescription vmstate_esp_pdma = {
     }
 };
 
+static int esp_pre_save(void *opaque)
+{
+    ESPState *s = ESP(opaque);
+
+    s->mig_version_id = vmstate_esp.version_id;
+    return 0;
+}
+
+static int esp_post_load(void *opaque, int version_id)
+{
+    ESPState *s = ESP(opaque);
+
+    s->mig_version_id = vmstate_esp.version_id;
+    return 0;
+}
+
 const VMStateDescription vmstate_esp = {
     .name = "esp",
-    .version_id = 4,
+    .version_id = 5,
     .minimum_version_id = 3,
+    .pre_save = esp_pre_save,
+    .post_load = esp_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_BUFFER(rregs, ESPState),
         VMSTATE_BUFFER(wregs, ESPState),
@@ -996,9 +1014,10 @@ static void sysbus_esp_init(Object *obj)
 
 static const VMStateDescription vmstate_sysbus_esp_scsi = {
     .name = "sysbusespscsi",
-    .version_id = 1,
+    .version_id = 2,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
+        VMSTATE_UINT8_V(esp.mig_version_id, SysBusESPState, 2),
         VMSTATE_STRUCT(esp, SysBusESPState, 0, vmstate_esp, ESPState),
         VMSTATE_END_OF_LIST()
     }
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 11c799d91e..7d92471c5b 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -68,6 +68,8 @@ struct ESPState {
     uint32_t pdma_start;
     uint32_t pdma_cur;
     void (*pdma_cb)(ESPState *s);
+
+    uint8_t mig_version_id;
 };
 
 #define TYPE_SYSBUS_ESP "sysbus-esp"
-- 
2.20.1



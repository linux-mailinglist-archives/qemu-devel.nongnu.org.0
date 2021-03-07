Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116643300B4
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 13:12:29 +0100 (CET)
Received: from localhost ([::1]:40870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIsGq-0002F0-1v
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 07:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsE1-0000QQ-0y
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:09:34 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43572
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsDx-0007Xn-Pv
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:09:31 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsDt-0002V5-Ds; Sun, 07 Mar 2021 12:09:29 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Sun,  7 Mar 2021 12:08:12 +0000
Message-Id: <20210307120850.10418-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
References: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 04/42] esp: add vmstate_esp version to embedded ESPState
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210304221103.6369-5-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp-pci.c     |  3 ++-
 hw/scsi/esp.c         | 23 +++++++++++++++++++++--
 include/hw/scsi/esp.h |  2 ++
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 27a0d36e0b..c3d3dab05e 100644
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
index 6f8a1d1224..f65c675872 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -795,10 +795,28 @@ static const VMStateDescription vmstate_esp_pdma = {
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
@@ -997,9 +1015,10 @@ static void sysbus_esp_init(Object *obj)
 
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
index af23f813cb..9d149cbc9f 100644
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA0335D308
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 00:26:00 +0200 (CEST)
Received: from localhost ([::1]:45880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW50J-0004jc-Cz
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 18:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4vp-0002yK-IS
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 18:21:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44046
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4ve-0002fW-Km
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 18:21:21 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4vi-0004Dc-Jk; Mon, 12 Apr 2021 23:21:19 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 12 Apr 2021 23:20:36 +0100
Message-Id: <20210412222048.22818-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412222048.22818-1-mark.cave-ayland@ilande.co.uk>
References: <20210412222048.22818-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 01/13] esp: fix setting of ESPState mig_version_id when
 launching QEMU with -S option
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

If QEMU is launched with the -S option then the ESPState mig_version_id property
is left unset due to the ordering of the VMState fields in the VMStateDescription
for sysbusespscsi and pciespscsi. If the VM is migrated and restored in this
stopped state, the version tests in the vmstate_esp VMStateDescription and
esp_post_load() become confused causing the migration to fail.

Fix the ordering problem by moving the setting of mig_version_id to a common
esp_pre_save() function which is invoked first by both sysbusespscsi and
pciespscsi rather than at the point where ESPState is itself serialised into the
migration stream.

Buglink: https://bugs.launchpad.net/qemu/+bug/1922611
Fixes: 0bd005be78 ("esp: add vmstate_esp version to embedded ESPState")
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210407124842.32695-1-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp-pci.c     | 1 +
 hw/scsi/esp.c         | 7 ++++---
 include/hw/scsi/esp.h | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index c3d3dab05e..9db10b1a48 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -332,6 +332,7 @@ static const VMStateDescription vmstate_esp_pci_scsi = {
     .name = "pciespscsi",
     .version_id = 2,
     .minimum_version_id = 1,
+    .pre_save = esp_pre_save,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(parent_obj, PCIESPState),
         VMSTATE_BUFFER_UNSAFE(dma_regs, PCIESPState, 0, 8 * sizeof(uint32_t)),
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 507ab363bc..d87e1a63db 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -1076,9 +1076,10 @@ static bool esp_is_version_5(void *opaque, int version_id)
     return version_id == 5;
 }
 
-static int esp_pre_save(void *opaque)
+int esp_pre_save(void *opaque)
 {
-    ESPState *s = ESP(opaque);
+    ESPState *s = ESP(object_resolve_path_component(
+                      OBJECT(opaque), "esp"));
 
     s->mig_version_id = vmstate_esp.version_id;
     return 0;
@@ -1114,7 +1115,6 @@ const VMStateDescription vmstate_esp = {
     .name = "esp",
     .version_id = 5,
     .minimum_version_id = 3,
-    .pre_save = esp_pre_save,
     .post_load = esp_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_BUFFER(rregs, ESPState),
@@ -1304,6 +1304,7 @@ static const VMStateDescription vmstate_sysbus_esp_scsi = {
     .name = "sysbusespscsi",
     .version_id = 2,
     .minimum_version_id = 1,
+    .pre_save = esp_pre_save,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8_V(esp.mig_version_id, SysBusESPState, 2),
         VMSTATE_STRUCT(esp, SysBusESPState, 0, vmstate_esp, ESPState),
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 95088490aa..aada3680b7 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -157,5 +157,6 @@ void esp_hard_reset(ESPState *s);
 uint64_t esp_reg_read(ESPState *s, uint32_t saddr);
 void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val);
 extern const VMStateDescription vmstate_esp;
+int esp_pre_save(void *opaque);
 
 #endif
-- 
2.20.1



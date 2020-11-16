Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9602B5061
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:59:20 +0100 (CET)
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejih-0001q7-31
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejQt-0003tp-Ui
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:40:57 -0500
Received: from mx2.suse.de ([195.135.220.15]:45328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejQo-0000lE-O1
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:40:55 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42CA9B00D;
 Mon, 16 Nov 2020 18:40:49 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/7] scsi: drop 'result' argument from command_complete
 callback
Date: Mon, 16 Nov 2020 19:40:36 +0100
Message-Id: <20201116184041.60465-3-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201116184041.60465-1-hare@suse.de>
References: <20201116184041.60465-1-hare@suse.de>
Received-SPF: pass client-ip=195.135.220.15; envelope-from=hare@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 12:53:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The command complete callback has a SCSIRequest as the first argument,
and the status field of that structure is identical to the 'status'
argument. So drop the argument from the callback.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 hw/scsi/esp-pci.c      |  5 ++---
 hw/scsi/esp.c          |  7 +++----
 hw/scsi/lsi53c895a.c   |  6 +++---
 hw/scsi/megasas.c      |  6 ++----
 hw/scsi/mptsas.c       |  5 +++--
 hw/scsi/scsi-bus.c     |  2 +-
 hw/scsi/spapr_vscsi.c  | 10 +++++-----
 hw/scsi/virtio-scsi.c  |  5 ++---
 hw/scsi/vmw_pvscsi.c   |  4 ++--
 hw/usb/dev-storage.c   |  6 +++---
 hw/usb/dev-uas.c       |  7 +++----
 include/hw/scsi/esp.h  |  2 +-
 include/hw/scsi/scsi.h |  2 +-
 13 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 2ce96dc56e..4d7c2cab56 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -329,13 +329,12 @@ static const VMStateDescription vmstate_esp_pci_scsi = {
     }
 };
 
-static void esp_pci_command_complete(SCSIRequest *req, uint32_t status,
-                                     size_t resid)
+static void esp_pci_command_complete(SCSIRequest *req, size_t resid)
 {
     ESPState *s = req->hba_private;
     PCIESPState *pci = container_of(s, PCIESPState, esp);
 
-    esp_command_complete(req, status, resid);
+    esp_command_complete(req, resid);
     pci->dma_regs[DMA_WBC] = 0;
     pci->dma_regs[DMA_STAT] |= DMA_STAT_DONE;
 }
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index b84e0fe33e..93d9c9c7b9 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -485,8 +485,7 @@ static void esp_report_command_complete(ESPState *s, uint32_t status)
     }
 }
 
-void esp_command_complete(SCSIRequest *req, uint32_t status,
-                          size_t resid)
+void esp_command_complete(SCSIRequest *req, size_t resid)
 {
     ESPState *s = req->hba_private;
 
@@ -495,11 +494,11 @@ void esp_command_complete(SCSIRequest *req, uint32_t status,
          * interrupt has been handled.
          */
         trace_esp_command_complete_deferred();
-        s->deferred_status = status;
+        s->deferred_status = req->status;
         s->deferred_complete = true;
         return;
     }
-    esp_report_command_complete(s, status);
+    esp_report_command_complete(s, req->status);
 }
 
 void esp_transfer_data(SCSIRequest *req, uint32_t len)
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 7d13c7dc1c..a4e58580e4 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -787,14 +787,14 @@ static int lsi_queue_req(LSIState *s, SCSIRequest *req, uint32_t len)
 }
 
  /* Callback to indicate that the SCSI layer has completed a command.  */
-static void lsi_command_complete(SCSIRequest *req, uint32_t status, size_t resid)
+static void lsi_command_complete(SCSIRequest *req, size_t resid)
 {
     LSIState *s = LSI53C895A(req->bus->qbus.parent);
     int out;
 
     out = (s->sstat1 & PHASE_MASK) == PHASE_DO;
-    trace_lsi_command_complete(status);
-    s->status = status;
+    trace_lsi_command_complete(req->status);
+    s->status = req->status;
     s->command_complete = 2;
     if (s->waiting && s->dbc != 0) {
         /* Raise phase mismatch for short transfers.  */
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index e24c12d7ee..35867dbd40 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1852,13 +1852,12 @@ static void megasas_xfer_complete(SCSIRequest *req, uint32_t len)
     }
 }
 
-static void megasas_command_complete(SCSIRequest *req, uint32_t status,
-                                     size_t resid)
+static void megasas_command_complete(SCSIRequest *req, size_t resid)
 {
     MegasasCmd *cmd = req->hba_private;
     uint8_t cmd_status = MFI_STAT_OK;
 
-    trace_megasas_command_complete(cmd->index, status, resid);
+    trace_megasas_command_complete(cmd->index, req->status, resid);
 
     if (req->io_canceled) {
         return;
@@ -1873,7 +1872,6 @@ static void megasas_command_complete(SCSIRequest *req, uint32_t status,
             return;
         }
     } else {
-        req->status = status;
         trace_megasas_scsi_complete(cmd->index, req->status,
                                     cmd->iov_size, req->cmd.xfer);
         if (req->status != GOOD) {
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index 135e7d96e4..d4fbfb2da7 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -1133,7 +1133,7 @@ static QEMUSGList *mptsas_get_sg_list(SCSIRequest *sreq)
 }
 
 static void mptsas_command_complete(SCSIRequest *sreq,
-        uint32_t status, size_t resid)
+        size_t resid)
 {
     MPTSASRequest *req = sreq->hba_private;
     MPTSASState *s = req->dev;
@@ -1143,7 +1143,8 @@ static void mptsas_command_complete(SCSIRequest *sreq,
     hwaddr sense_buffer_addr = req->dev->sense_buffer_high_addr |
             req->scsi_io.SenseBufferLowAddr;
 
-    trace_mptsas_command_complete(s, req->scsi_io.MsgContext, status, resid);
+    trace_mptsas_command_complete(s, req->scsi_io.MsgContext,
+                                  sreq->status, resid);
 
     sense_len = scsi_req_get_sense(sreq, sense_buf, SCSI_SENSE_BUF_SIZE);
     if (sense_len > 0) {
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 3284a5d1fb..17ce3238d7 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1415,7 +1415,7 @@ void scsi_req_complete(SCSIRequest *req, int status)
 
     scsi_req_ref(req);
     scsi_req_dequeue(req);
-    req->bus->info->complete(req, req->status, req->resid);
+    req->bus->info->complete(req, req->resid);
 
     /* Cancelled requests might end up being completed instead of cancelled */
     notifier_list_notify(&req->cancel_notifiers, req);
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index 4aa0224c47..d653b5a6ad 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -551,19 +551,19 @@ static void vscsi_transfer_data(SCSIRequest *sreq, uint32_t len)
 }
 
 /* Callback to indicate that the SCSI layer has completed a transfer.  */
-static void vscsi_command_complete(SCSIRequest *sreq, uint32_t status, size_t resid)
+static void vscsi_command_complete(SCSIRequest *sreq, size_t resid)
 {
     VSCSIState *s = VIO_SPAPR_VSCSI_DEVICE(sreq->bus->qbus.parent);
     vscsi_req *req = sreq->hba_private;
     int32_t res_in = 0, res_out = 0;
 
-    trace_spapr_vscsi_command_complete(sreq->tag, status, req);
+    trace_spapr_vscsi_command_complete(sreq->tag, sreq->status, req);
     if (req == NULL) {
         fprintf(stderr, "VSCSI: Can't find request for tag 0x%x\n", sreq->tag);
         return;
     }
 
-    if (status == CHECK_CONDITION) {
+    if (sreq->status == CHECK_CONDITION) {
         req->senselen = scsi_req_get_sense(req->sreq, req->sense,
                                            sizeof(req->sense));
         trace_spapr_vscsi_command_complete_sense_data1(req->senselen,
@@ -574,8 +574,8 @@ static void vscsi_command_complete(SCSIRequest *sreq, uint32_t status, size_t re
                 req->sense[12], req->sense[13], req->sense[14], req->sense[15]);
     }
 
-    trace_spapr_vscsi_command_complete_status(status);
-    if (status == 0) {
+    trace_spapr_vscsi_command_complete_status(sreq->status);
+    if (sreq->status == 0) {
         /* We handle overflows, not underflows for normal commands,
          * but hopefully nobody cares
          */
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index c9873d5af7..64cd852d82 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -493,8 +493,7 @@ static void virtio_scsi_complete_cmd_req(VirtIOSCSIReq *req)
     virtio_scsi_complete_req(req);
 }
 
-static void virtio_scsi_command_complete(SCSIRequest *r, uint32_t status,
-                                         size_t resid)
+static void virtio_scsi_command_complete(SCSIRequest *r, size_t resid)
 {
     VirtIOSCSIReq *req = r->hba_private;
     uint8_t sense[SCSI_SENSE_BUF_SIZE];
@@ -506,7 +505,7 @@ static void virtio_scsi_command_complete(SCSIRequest *r, uint32_t status,
     }
 
     req->resp.cmd.response = VIRTIO_SCSI_S_OK;
-    req->resp.cmd.status = status;
+    req->resp.cmd.status = r->status;
     if (req->resp.cmd.status == GOOD) {
         req->resp.cmd.resid = virtio_tswap32(vdev, resid);
     } else {
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index a63d25de48..0da378ed50 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -511,7 +511,7 @@ pvscsi_write_sense(PVSCSIRequest *r, uint8_t *sense, int len)
 }
 
 static void
-pvscsi_command_complete(SCSIRequest *req, uint32_t status, size_t resid)
+pvscsi_command_complete(SCSIRequest *req, size_t resid)
 {
     PVSCSIRequest *pvscsi_req = req->hba_private;
     PVSCSIState *s;
@@ -528,7 +528,7 @@ pvscsi_command_complete(SCSIRequest *req, uint32_t status, size_t resid)
         pvscsi_req->cmp.hostStatus = BTSTAT_DATARUN;
     }
 
-    pvscsi_req->cmp.scsiStatus = status;
+    pvscsi_req->cmp.scsiStatus = req->status;
     if (pvscsi_req->cmp.scsiStatus == CHECK_CONDITION) {
         uint8_t sense[SCSI_SENSE_BUF_SIZE];
         int sense_len =
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 648340323f..d1aeebe2ce 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -284,17 +284,17 @@ static void usb_msd_transfer_data(SCSIRequest *req, uint32_t len)
     }
 }
 
-static void usb_msd_command_complete(SCSIRequest *req, uint32_t status, size_t resid)
+static void usb_msd_command_complete(SCSIRequest *req, size_t resid)
 {
     MSDState *s = DO_UPCAST(MSDState, dev.qdev, req->bus->qbus.parent);
     USBPacket *p = s->packet;
 
-    DPRINTF("Command complete %d tag 0x%x\n", status, req->tag);
+    DPRINTF("Command complete %d tag 0x%x\n", req->status, req->tag);
 
     s->csw.sig = cpu_to_le32(0x53425355);
     s->csw.tag = cpu_to_le32(req->tag);
     s->csw.residue = cpu_to_le32(s->data_len);
-    s->csw.status = status != 0;
+    s->csw.status = req->status != 0;
 
     if (s->packet) {
         if (s->data_len == 0 && s->mode == USB_MSDM_DATAOUT) {
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index cec071d96c..202e9cc4b7 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -597,17 +597,16 @@ static void usb_uas_scsi_transfer_data(SCSIRequest *r, uint32_t len)
     }
 }
 
-static void usb_uas_scsi_command_complete(SCSIRequest *r,
-                                          uint32_t status, size_t resid)
+static void usb_uas_scsi_command_complete(SCSIRequest *r, size_t resid)
 {
     UASRequest *req = r->hba_private;
 
-    trace_usb_uas_scsi_complete(req->uas->dev.addr, req->tag, status, resid);
+    trace_usb_uas_scsi_complete(req->uas->dev.addr, req->tag, r->status, resid);
     req->complete = true;
     if (req->data) {
         usb_uas_complete_data_packet(req);
     }
-    usb_uas_queue_sense(req, status);
+    usb_uas_queue_sense(req, r->status);
     scsi_req_unref(req->req);
 }
 
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index 60cc3047a5..d8a6263c13 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -151,7 +151,7 @@ struct SysBusESPState {
 
 void esp_dma_enable(ESPState *s, int irq, int level);
 void esp_request_cancelled(SCSIRequest *req);
-void esp_command_complete(SCSIRequest *req, uint32_t status, size_t resid);
+void esp_command_complete(SCSIRequest *req, size_t resid);
 void esp_transfer_data(SCSIRequest *req, uint32_t len);
 void esp_hard_reset(ESPState *s);
 uint64_t esp_reg_read(ESPState *s, uint32_t saddr);
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 21a6249743..23a9b23e50 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -123,7 +123,7 @@ struct SCSIBusInfo {
     int (*parse_cdb)(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
                      void *hba_private);
     void (*transfer_data)(SCSIRequest *req, uint32_t arg);
-    void (*complete)(SCSIRequest *req, uint32_t arg, size_t resid);
+    void (*complete)(SCSIRequest *req, size_t resid);
     void (*cancel)(SCSIRequest *req);
     void (*change)(SCSIBus *bus, SCSIDevice *dev, SCSISense sense);
     QEMUSGList *(*get_sg_list)(SCSIRequest *req);
-- 
2.16.4



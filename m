Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D979325EAB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:12:41 +0100 (CET)
Received: from localhost ([::1]:41992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYEq-0007Tl-F5
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY85-0001nU-9l
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:43 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY81-000486-K0
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:39 -0500
Received: by mail-wr1-x42f.google.com with SMTP id f12so3868261wrx.8
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6h5XOzhQAP4RyCZCnuUJCoageZdlc+jKm+5o9IKH9aI=;
 b=Qr/+/nF+BF+hqjjSwez3o5fzRkYE8W9cUNb7oZMR/M0DCJfvWB3AvOjEY8gwLPwoh4
 W5ib+WI2yZbNdR1T8+ahXMPFiljmcA7yv5I4/rXMpjtjG2AfoxntMSYV4C5uRMknkHkq
 6Y9NESa7TwSeaF2vXsqyq90CjD/rXT8a+mGWmDAj8yMmaCO3AgNWJxG8Ti2m1hIxfsYO
 5U1R8fNpEs3SWLhcI5LjrL2fpJVbfNpMiorEqhZa7tRjZOB1QcjK0rYYeiwgjHchAdva
 NEpWZ/OJTP1LMGXXOx0isJL9MOUVJ60RppEgBaFP3GNnSvtK9OIl6Q3pcf3WgjCoNlt8
 lbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6h5XOzhQAP4RyCZCnuUJCoageZdlc+jKm+5o9IKH9aI=;
 b=RbzL85vkodFn8jjtUZr7TIGIxhG3uXb+w2E8uBhSQlT58W9UXVJXAqUXlfEshicb/a
 2Gg0UeVm0SQaE1H73anST8a7FN77sspG1HgB+vjAGATbyyUKjnLalqqrbbn6SVK/0jZt
 pY/P7OV6UfqSCmVLj5t+cbm1AMeYwmwLfunKqTrT7rwlo8PyEPk2NzPenVwy1mHz6n6Y
 Uvhgq6y/FYYimc/qrrZkVaodp97Aoa1RyGJDRmGDmFbw+NvM5FaSVtzmMLYFECS9ZP99
 CklIprETFiEUyuDcyUXJGtRmksM8tMSSl9mpcpyplPuRtrsZtt74iLeKothfOwbWvAHy
 s5kA==
X-Gm-Message-State: AOAM532K4Eav02btApcy2feR5d4kBJTx7NQ4mJMmG8wTJkJZ9/LEe0yu
 DF5pjHbPdXJb6Xr1Rcwylj150yYIt1Q=
X-Google-Smtp-Source: ABdhPJyCRvAQpOrkQ2m0MjIu3yfh/Si/6mmAtDN0dQQv+3kPmqYrgFKfG7czVbanMmjikJGE0Wsy8Q==
X-Received: by 2002:a5d:6205:: with SMTP id y5mr1845632wru.238.1614326736354; 
 Fri, 26 Feb 2021 00:05:36 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/29] scsi: drop 'result' argument from command_complete
 callback
Date: Fri, 26 Feb 2021 09:05:10 +0100
Message-Id: <20210226080526.651705-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hannes Reinecke <hare@suse.de>

The command complete callback has a SCSIRequest as the first argument,
and the status field of that structure is identical to the 'status'
argument. So drop the argument from the callback.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Message-Id: <20201116184041.60465-3-hare@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp-pci.c      |  5 ++---
 hw/scsi/esp.c          |  7 +++----
 hw/scsi/lsi53c895a.c   |  6 +++---
 hw/scsi/megasas.c      |  6 ++----
 hw/scsi/mptsas.c       |  5 +++--
 hw/scsi/scsi-bus.c     |  2 +-
 hw/scsi/spapr_vscsi.c  | 12 ++++++------
 hw/scsi/virtio-scsi.c  |  5 ++---
 hw/scsi/vmw_pvscsi.c   |  4 ++--
 hw/usb/dev-storage.c   |  6 +++---
 hw/usb/dev-uas.c       |  7 +++----
 include/hw/scsi/esp.h  |  2 +-
 include/hw/scsi/scsi.h |  2 +-
 13 files changed, 32 insertions(+), 37 deletions(-)

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
index 5bfc92fca1..8f2389d2c6 100644
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
index f86616544b..7416e78706 100644
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
index c349fb7f2d..dc4141ec8d 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1483,7 +1483,7 @@ void scsi_req_complete(SCSIRequest *req, int status)
 
     scsi_req_ref(req);
     scsi_req_dequeue(req);
-    req->bus->info->complete(req, req->status, req->resid);
+    req->bus->info->complete(req, req->resid);
 
     /* Cancelled requests might end up being completed instead of cancelled */
     notifier_list_notify(&req->cancel_notifiers, req);
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index 4aa0224c47..ca5c13c4a8 100644
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
@@ -585,7 +585,7 @@ static void vscsi_command_complete(SCSIRequest *sreq, uint32_t status, size_t re
             res_in = req->data_len;
         }
     }
-    vscsi_send_rsp(s, req, status, res_in, res_out);
+    vscsi_send_rsp(s, req, sreq->status, res_in, res_out);
     vscsi_put_req(req);
 }
 
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 99ff261cea..358c0e70b0 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -500,8 +500,7 @@ static void virtio_scsi_complete_cmd_req(VirtIOSCSIReq *req)
     virtio_scsi_complete_req(req);
 }
 
-static void virtio_scsi_command_complete(SCSIRequest *r, uint32_t status,
-                                         size_t resid)
+static void virtio_scsi_command_complete(SCSIRequest *r, size_t resid)
 {
     VirtIOSCSIReq *req = r->hba_private;
     uint8_t sense[SCSI_SENSE_BUF_SIZE];
@@ -513,7 +512,7 @@ static void virtio_scsi_command_complete(SCSIRequest *r, uint32_t status,
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
index c49e8b819e..a5f76fc001 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -277,17 +277,17 @@ static void usb_msd_transfer_data(SCSIRequest *req, uint32_t len)
     }
 }
 
-static void usb_msd_command_complete(SCSIRequest *req, uint32_t status, size_t resid)
+static void usb_msd_command_complete(SCSIRequest *req, size_t resid)
 {
     MSDState *s = DO_UPCAST(MSDState, dev.qdev, req->bus->qbus.parent);
     USBPacket *p = s->packet;
 
-    trace_usb_msd_cmd_complete(status, req->tag);
+    trace_usb_msd_cmd_complete(req->status, req->tag);
 
     s->csw.sig = cpu_to_le32(0x53425355);
     s->csw.tag = cpu_to_le32(req->tag);
     s->csw.residue = cpu_to_le32(s->data_len);
-    s->csw.status = status != 0;
+    s->csw.status = req->status != 0;
 
     if (s->packet) {
         if (s->data_len == 0 && s->mode == USB_MSDM_DATAOUT) {
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index a51402bc0b..d2bd85d3f6 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -598,17 +598,16 @@ static void usb_uas_scsi_transfer_data(SCSIRequest *r, uint32_t len)
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
index a8ef59c0f4..5d992e6e1d 100644
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
2.29.2




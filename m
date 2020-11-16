Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C182B5076
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:02:04 +0100 (CET)
Received: from localhost ([::1]:45664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejlL-0004fJ-Qt
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejR3-000426-Ur
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:41:05 -0500
Received: from mx2.suse.de ([195.135.220.15]:45376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejQu-0000qc-V5
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:41:05 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6BA07B019;
 Mon, 16 Nov 2020 18:40:49 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 7/7] scsi: move host_status handling into SCSI drivers
Date: Mon, 16 Nov 2020 19:40:41 +0100
Message-Id: <20201116184041.60465-8-hare@suse.de>
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

Some SCSI drivers like virtio have an internal mapping for the
host_status. This patch moves the host_status translation into
the SCSI drivers to allow those drivers to set up the correct
values.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 hw/scsi/esp.c          | 10 ++++++++++
 hw/scsi/lsi53c895a.c   | 11 +++++++++++
 hw/scsi/megasas.c      |  9 +++++++++
 hw/scsi/mptsas.c       |  9 +++++++++
 hw/scsi/scsi-disk.c    | 10 ++++------
 hw/scsi/scsi-generic.c |  8 +++-----
 hw/scsi/spapr_vscsi.c  | 12 +++++++++++-
 hw/scsi/virtio-scsi.c  | 41 +++++++++++++++++++++++++++++++++++++++--
 hw/scsi/vmw_pvscsi.c   | 25 +++++++++++++++++++++++++
 include/hw/scsi/scsi.h |  3 ++-
 10 files changed, 123 insertions(+), 15 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 93d9c9c7b9..fc88cfac23 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -28,6 +28,8 @@
 #include "migration/vmstate.h"
 #include "hw/irq.h"
 #include "hw/scsi/esp.h"
+#include "scsi/utils.h"
+#include "scsi/constants.h"
 #include "trace.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
@@ -489,6 +491,14 @@ void esp_command_complete(SCSIRequest *req, size_t resid)
 {
     ESPState *s = req->hba_private;
 
+    if (req->host_status != SCSI_HOST_OK) {
+        SCSISense sense;
+
+        req->status = scsi_sense_from_host_status(req->host_status, &sense);
+        if (req->status == CHECK_CONDITION) {
+            scsi_req_build_sense(req, sense);
+        }
+    }
     if (s->rregs[ESP_RSTAT] & STAT_INT) {
         /* Defer handling command complete until the previous
          * interrupt has been handled.
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index a4e58580e4..b6aa98c95a 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -18,6 +18,8 @@
 #include "hw/irq.h"
 #include "hw/pci/pci.h"
 #include "hw/scsi/scsi.h"
+#include "scsi/utils.h"
+#include "scsi/constants.h"
 #include "migration/vmstate.h"
 #include "sysemu/dma.h"
 #include "qemu/log.h"
@@ -792,6 +794,15 @@ static void lsi_command_complete(SCSIRequest *req, size_t resid)
     LSIState *s = LSI53C895A(req->bus->qbus.parent);
     int out;
 
+    if (req->host_status != SCSI_HOST_OK) {
+        SCSISense sense;
+
+        req->status = scsi_sense_from_host_status(req->host_status, &sense);
+        if (req->status == CHECK_CONDITION) {
+            scsi_req_build_sense(req, sense);
+        }
+    }
+
     out = (s->sstat1 & PHASE_MASK) == PHASE_DO;
     trace_lsi_command_complete(req->status);
     s->status = req->status;
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 35867dbd40..1f7d806ffa 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1857,6 +1857,15 @@ static void megasas_command_complete(SCSIRequest *req, size_t resid)
     MegasasCmd *cmd = req->hba_private;
     uint8_t cmd_status = MFI_STAT_OK;
 
+    if (req->host_status != SCSI_HOST_OK) {
+        SCSISense sense;
+
+        req->status = scsi_sense_from_host_status(req->host_status, &sense);
+        if (req->status == CHECK_CONDITION) {
+            scsi_req_build_sense(req, sense);
+        }
+    }
+
     trace_megasas_command_complete(cmd->index, req->status, resid);
 
     if (req->io_canceled) {
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index d4fbfb2da7..be3875ce94 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -1143,6 +1143,15 @@ static void mptsas_command_complete(SCSIRequest *sreq,
     hwaddr sense_buffer_addr = req->dev->sense_buffer_high_addr |
             req->scsi_io.SenseBufferLowAddr;
 
+    if (sreq->host_status == SCSI_HOST_OK) {
+        SCSISense sense;
+
+        sreq->status = scsi_sense_from_host_status(sreq->host_status, &sense);
+        if (sreq->status == CHECK_CONDITION) {
+            scsi_req_build_sense(sreq, sense);
+        }
+    }
+
     trace_mptsas_command_complete(s, req->scsi_io.MsgContext,
                                   sreq->status, resid);
 
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 6eb0aa3d27..c0cb63707d 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1840,7 +1840,7 @@ static void scsi_disk_emulate_write_data(SCSIRequest *req)
     case VERIFY_10:
     case VERIFY_12:
     case VERIFY_16:
-        if (r->req.status == -1) {
+        if (r->req.status == GOOD) {
             scsi_check_condition(r, SENSE_CODE(INVALID_FIELD));
         }
         break;
@@ -2122,7 +2122,7 @@ static int32_t scsi_disk_emulate_command(SCSIRequest *req, uint8_t *buf)
     }
 
 illegal_request:
-    if (r->req.status == -1) {
+    if (r->req.status == GOOD) {
         scsi_check_condition(r, SENSE_CODE(INVALID_FIELD));
     }
     return 0;
@@ -2697,10 +2697,8 @@ static void scsi_block_sgio_complete(void *opaque, int ret)
         scsi_req_build_sense(&r->req, sense);
     } else if (status == GOOD &&
                io_hdr.host_status != SCSI_HOST_OK) {
-        status = scsi_sense_from_host_status(io_hdr.host_status, &sense);
-        if (status == CHECK_CONDITION) {
-            scsi_req_build_sense(&r->req, sense);
-        }
+        status = INTERMEDIATE_GOOD;
+        r->req.host_status = io_hdr.host_status;
     } else if (io_hdr.status == CHECK_CONDITION ||
                io_hdr.driver_status & SG_ERR_DRIVER_SENSE) {
         status = CHECK_CONDITION;
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index a2b85678b5..eac108fc6e 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -86,11 +86,9 @@ static void scsi_command_complete_noio(SCSIGenericReq *r, int ret)
     if (status == CHECK_CONDITION) {
         scsi_req_build_sense(&r->req, sense);
     } else if (status == GOOD &&
-        io_hdr.host_status != SCSI_HOST_OK) {
-        status = scsi_sense_from_host_status(io_hdr.host_status, &sense);
-        if (status == CHECK_CONDITION) {
-            scsi_req_build_sense(&r->req, sense);
-        }
+               io_hdr.host_status != SCSI_HOST_OK) {
+        status = INTERMEDIATE_GOOD;
+        r->req.host_status = io_hdr.host_status;
     } else if (io_hdr.status == CHECK_CONDITION ||
                io_hdr.driver_status & SG_ERR_DRIVER_SENSE) {
         status = CHECK_CONDITION;
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index d653b5a6ad..9327a493c3 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -556,6 +556,16 @@ static void vscsi_command_complete(SCSIRequest *sreq, size_t resid)
     VSCSIState *s = VIO_SPAPR_VSCSI_DEVICE(sreq->bus->qbus.parent);
     vscsi_req *req = sreq->hba_private;
     int32_t res_in = 0, res_out = 0;
+    uint8_t status = sreq->status;
+
+    if (sreq->host_status != SCSI_HOST_OK) {
+        SCSISense sense;
+
+        sreq->status = scsi_sense_from_host_status(sreq->host_status, &sense);
+        if (sreq->status == CHECK_CONDITION) {
+            scsi_req_build_sense(sreq, sense);
+        }
+    }
 
     trace_spapr_vscsi_command_complete(sreq->tag, sreq->status, req);
     if (req == NULL) {
@@ -575,7 +585,7 @@ static void vscsi_command_complete(SCSIRequest *sreq, size_t resid)
     }
 
     trace_spapr_vscsi_command_complete_status(sreq->status);
-    if (sreq->status == 0) {
+    if (sreq->status == GOOD) {
         /* We handle overflows, not underflows for normal commands,
          * but hopefully nobody cares
          */
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 64cd852d82..62c56713d8 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -504,8 +504,45 @@ static void virtio_scsi_command_complete(SCSIRequest *r, size_t resid)
         return;
     }
 
-    req->resp.cmd.response = VIRTIO_SCSI_S_OK;
-    req->resp.cmd.status = r->status;
+    if (r->host_status != SCSI_HOST_OK) {
+        req->resp.cmd.status = GOOD;
+        switch (r->host_status) {
+        case SCSI_HOST_NO_LUN:
+            req->resp.cmd.response = VIRTIO_SCSI_S_INCORRECT_LUN;
+            break;
+        case SCSI_HOST_BUSY:
+            req->resp.cmd.response = VIRTIO_SCSI_S_BUSY;
+            break;
+        case SCSI_HOST_TIME_OUT:
+        case SCSI_HOST_ABORTED:
+            req->resp.cmd.response = VIRTIO_SCSI_S_ABORTED;
+            break;
+        case SCSI_HOST_BAD_RESPONSE:
+            req->resp.cmd.response = VIRTIO_SCSI_S_BAD_TARGET;
+            break;
+        case SCSI_HOST_RESET:
+            req->resp.cmd.response = VIRTIO_SCSI_S_RESET;
+            break;
+        case SCSI_HOST_TRANSPORT_DISRUPTED:
+            req->resp.cmd.response = VIRTIO_SCSI_S_TRANSPORT_FAILURE;
+            break;
+        case SCSI_HOST_TARGET_FAILURE:
+            req->resp.cmd.response = VIRTIO_SCSI_S_TARGET_FAILURE;
+            break;
+        case SCSI_HOST_RESERVATION_ERROR:
+            req->resp.cmd.response = VIRTIO_SCSI_S_NEXUS_FAILURE;
+            break;
+        case SCSI_HOST_ALLOCATION_FAILURE:
+        case SCSI_HOST_MEDIUM_ERROR:
+        case SCSI_HOST_ERROR:
+        default:
+            req->resp.cmd.response = VIRTIO_SCSI_S_FAILURE;
+            break;
+        }
+    } else {
+        req->resp.cmd.response = VIRTIO_SCSI_S_OK;
+        req->resp.cmd.status = r->status;
+    }
     if (req->resp.cmd.status == GOOD) {
         req->resp.cmd.resid = virtio_tswap32(vdev, resid);
     } else {
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 0da378ed50..2583105dfd 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -522,6 +522,31 @@ pvscsi_command_complete(SCSIRequest *req, size_t resid)
     }
     s = pvscsi_req->dev;
 
+    if (req->host_status != SCSI_HOST_OK) {
+        switch (req->host_status) {
+        case SCSI_HOST_NO_LUN:
+            pvscsi_req->cmp.hostStatus = BTSTAT_LUNMISMATCH;
+            break;
+        case SCSI_HOST_BUSY:
+            pvscsi_req->cmp.hostStatus = BTSTAT_ABORTQUEUE;
+            break;
+        case SCSI_HOST_TIME_OUT:
+        case SCSI_HOST_ABORTED:
+            pvscsi_req->cmp.hostStatus = BTSTAT_SENTRST;
+            break;
+        case SCSI_HOST_BAD_RESPONSE:
+            pvscsi_req->cmp.hostStatus = BTSTAT_SELTIMEO;
+            break;
+        case SCSI_HOST_RESET:
+            pvscsi_req->cmp.hostStatus = BTSTAT_BUSRESET;
+            break;
+        default:
+            pvscsi_req->cmp.hostStatus = BTSTAT_HASOFTWARE;
+            break;
+        }
+        req->status = GOOD;
+    }
+
     if (resid) {
         /* Short transfer.  */
         trace_pvscsi_command_complete_data_run();
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 23a9b23e50..a097fecb2a 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -27,7 +27,8 @@ struct SCSIRequest {
     uint32_t          refcount;
     uint32_t          tag;
     uint32_t          lun;
-    uint32_t          status;
+    uint8_t           status;
+    uint8_t           host_status;
     void              *hba_private;
     size_t            resid;
     SCSICommand       cmd;
-- 
2.16.4



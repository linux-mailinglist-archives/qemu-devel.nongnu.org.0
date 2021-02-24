Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FAC3243D3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:35:22 +0100 (CET)
Received: from localhost ([::1]:33798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEz0K-0003ZZ-LH
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:35:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqO-0002Mb-VU
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:25:05 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqM-0004pi-SR
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:25:04 -0500
Received: by mail-ej1-x62f.google.com with SMTP id k13so4622868ejs.10
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XxRqz7mVV0toeHXJ6WSZFhW0mvu4brRctc9XFrbC9FQ=;
 b=bKz1vhhs9QxUzbW7a/VuaQrSwwc/WuMnS0LSAcCNsvEDtT8z/nsy/J3VBtzkUoBImz
 87dpez4rUUS977ubCs+QilaLWOy/jnJCPgO+2I+XgID5INZTHjLC3mUgjh7MwisUkv4v
 nfGJL/SPh4k4YNFrrA0+SVeVD/seJSga73r5NDalQKUrun2O5vX7U6j1Bqi9qH4TWKs6
 sLa2GHMAJinY4Jhdg7n3IUo+9H1bBH5caIPATkJNlEdf6JvThL7r7FzYhbluJ78+nt41
 j0my2GBRoS5uM8jyhlBq0O63Yja8QljgowTHda84jsbTbjxqGzhC3G1yAmuzZxR0EPts
 jRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XxRqz7mVV0toeHXJ6WSZFhW0mvu4brRctc9XFrbC9FQ=;
 b=FIi1DZcQDph8UtExZcvk5bxGCHGcpCNMtlKrRoEnZJCDOdDX+CbZXuCLrM8/UjBLE9
 HauKcgGaq12IQ6ROi0DNs83hYbL83WYfL/aD2pg2naF4J2ZwQ8PfGFTHzZ0i3ngGMNsp
 /zuNcXXsrH/8+EPCGsFIJg/zA4pBMFFlE4P7Bj8eRFKf8UsXEaTwZabxSzcJ4QMdBNIZ
 LoC3xUugdt8ltKpJ+FRIkPU18fhqNKWr7DwXUkM7xjY88VV2ou9N1JddXZNRoQgPkj+N
 UPmK2K5mJLuGd6LKMV0YY0Q+bGBXmCdIlCGGq4W3YfOzwBRor0eMXWctNwJDuArnDp6H
 J1+g==
X-Gm-Message-State: AOAM533MF5JJwhpDI7iFJDjUtoKzsDDUJdwtpXSxKM7Tynx3Bf71kjfi
 CyUjL16S2tgS54zKiDXXKN0QYXpCglg=
X-Google-Smtp-Source: ABdhPJwK1b6yu3wWJ3hJDL8uj6MHbO1BO0N17dykNiZbI4+ZhHLZw25YRNAAcbZ0pdwNDLWyHjrM4g==
X-Received: by 2002:a17:906:a090:: with SMTP id
 q16mr31901695ejy.236.1614191101544; 
 Wed, 24 Feb 2021 10:25:01 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bw22sm1791172ejb.78.2021.02.24.10.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:25:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/10] scsi: move host_status handling into SCSI drivers
Date: Wed, 24 Feb 2021 19:24:53 +0100
Message-Id: <20210224182453.587731-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224182453.587731-1-pbonzini@redhat.com>
References: <20210224182453.587731-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: hare@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hannes Reinecke <hare@suse.de>

Some SCSI drivers like virtio have an internal mapping for the
host_status. This patch moves the host_status translation into
the SCSI drivers to allow those drivers to set up the correct
values.

Signed-off-by: Hannes Reinecke <hare@suse.de>.
[Added default handling to avoid touching all drivers. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-bus.c       | 23 +++++++++++++++++++-
 hw/scsi/scsi-disk.c      |  7 ++----
 hw/scsi/scsi-generic.c   |  6 ++----
 hw/scsi/virtio-scsi.c    | 46 ++++++++++++++++++++++++++++++++++++++++
 hw/scsi/vmw_pvscsi.c     | 39 ++++++++++++++++++++++++++++++++++
 include/hw/scsi/scsi.h   |  4 +++-
 include/scsi/constants.h |  3 +++
 7 files changed, 117 insertions(+), 11 deletions(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index dc4141ec8d..6088601925 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -692,6 +692,7 @@ SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops, SCSIDevice *d,
     req->lun = lun;
     req->hba_private = hba_private;
     req->status = -1;
+    req->host_status = -1;
     req->ops = reqops;
     object_ref(OBJECT(d));
     object_ref(OBJECT(qbus->parent));
@@ -1455,6 +1456,17 @@ void scsi_req_print(SCSIRequest *req)
     }
 }
 
+static void scsi_req_complete_failed(SCSIRequest *req)
+{
+     SCSISense sense;
+
+     req->status = scsi_sense_from_host_status(req->host_status, &sense);
+     if (req->status == CHECK_CONDITION) {
+         scsi_req_build_sense(req, sense);
+     }
+     req->bus->info->complete(req, 0);
+}
+
 void scsi_req_complete(SCSIRequest *req, int status)
 {
     assert(req->status == -1);
@@ -1483,7 +1495,16 @@ void scsi_req_complete(SCSIRequest *req, int status)
 
     scsi_req_ref(req);
     scsi_req_dequeue(req);
-    req->bus->info->complete(req, req->resid);
+    if (status == CHECK_HOST_STATUS) {
+        if (req->bus->info->fail) {
+            req->bus->info->fail(req);
+        } else {
+            scsi_req_complete_failed(req);
+        }
+    } else {
+        req->host_status = SCSI_HOST_OK;
+        req->bus->info->complete(req, req->resid);
+    }
 
     /* Cancelled requests might end up being completed instead of cancelled */
     notifier_list_notify(&req->cancel_notifiers, req);
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index ceaf78b423..b7e53b1b6f 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2704,14 +2704,11 @@ static void scsi_block_sgio_complete(void *opaque, int ret)
     SCSIDiskReq *r = &req->req;
     SCSIDevice *s = r->req.dev;
     sg_io_hdr_t *io_hdr = &req->io_header;
-    SCSISense sense;
 
     if (ret == 0) {
         if (io_hdr->host_status != SCSI_HOST_OK) {
-            ret = scsi_sense_from_host_status(io_hdr->host_status, &sense);
-            if (ret == CHECK_CONDITION) {
-                scsi_req_build_sense(&r->req, sense);
-            }
+            ret = CHECK_HOST_STATUS;
+            r->req.host_status = io_hdr->host_status;
         } else if (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT) {
             ret = BUSY;
         } else {
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 716caf0d22..8e26fccf74 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -89,10 +89,8 @@ static void scsi_command_complete_noio(SCSIGenericReq *r, int ret)
             scsi_req_build_sense(&r->req, sense);
         }
     } else if (io_hdr->host_status != SCSI_HOST_OK) {
-        status = scsi_sense_from_host_status(io_hdr->host_status, &sense);
-        if (status == CHECK_CONDITION) {
-            scsi_req_build_sense(&r->req, sense);
-        }
+        r->req.host_status = io_hdr->host_status;
+        status = CHECK_HOST_STATUS;
     } else if (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT) {
         status = BUSY;
     } else {
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 358c0e70b0..6d80730287 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -500,6 +500,51 @@ static void virtio_scsi_complete_cmd_req(VirtIOSCSIReq *req)
     virtio_scsi_complete_req(req);
 }
 
+static void virtio_scsi_command_failed(SCSIRequest *r)
+{
+    VirtIOSCSIReq *req = r->hba_private;
+
+    if (r->io_canceled) {
+        return;
+    }
+
+    req->resp.cmd.status = GOOD;
+    switch (r->host_status) {
+    case SCSI_HOST_NO_LUN:
+        req->resp.cmd.response = VIRTIO_SCSI_S_INCORRECT_LUN;
+        break;
+    case SCSI_HOST_BUSY:
+        req->resp.cmd.response = VIRTIO_SCSI_S_BUSY;
+        break;
+    case SCSI_HOST_TIME_OUT:
+    case SCSI_HOST_ABORTED:
+        req->resp.cmd.response = VIRTIO_SCSI_S_ABORTED;
+        break;
+    case SCSI_HOST_BAD_RESPONSE:
+        req->resp.cmd.response = VIRTIO_SCSI_S_BAD_TARGET;
+        break;
+    case SCSI_HOST_RESET:
+        req->resp.cmd.response = VIRTIO_SCSI_S_RESET;
+        break;
+    case SCSI_HOST_TRANSPORT_DISRUPTED:
+        req->resp.cmd.response = VIRTIO_SCSI_S_TRANSPORT_FAILURE;
+        break;
+    case SCSI_HOST_TARGET_FAILURE:
+        req->resp.cmd.response = VIRTIO_SCSI_S_TARGET_FAILURE;
+        break;
+    case SCSI_HOST_RESERVATION_ERROR:
+        req->resp.cmd.response = VIRTIO_SCSI_S_NEXUS_FAILURE;
+        break;
+    case SCSI_HOST_ALLOCATION_FAILURE:
+    case SCSI_HOST_MEDIUM_ERROR:
+    case SCSI_HOST_ERROR:
+    default:
+        req->resp.cmd.response = VIRTIO_SCSI_S_FAILURE;
+        break;
+    }
+    virtio_scsi_complete_cmd_req(req);
+}
+
 static void virtio_scsi_command_complete(SCSIRequest *r, size_t resid)
 {
     VirtIOSCSIReq *req = r->hba_private;
@@ -908,6 +953,7 @@ static struct SCSIBusInfo virtio_scsi_scsi_info = {
     .max_lun = VIRTIO_SCSI_MAX_LUN,
 
     .complete = virtio_scsi_command_complete,
+    .fail = virtio_scsi_command_failed,
     .cancel = virtio_scsi_request_cancelled,
     .change = virtio_scsi_change,
     .parse_cdb = virtio_scsi_parse_cdb,
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 0da378ed50..1f30cb020a 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -510,6 +510,44 @@ pvscsi_write_sense(PVSCSIRequest *r, uint8_t *sense, int len)
     cpu_physical_memory_write(r->req.senseAddr, sense, r->cmp.senseLen);
 }
 
+static void
+pvscsi_command_failed(SCSIRequest *req)
+{
+    PVSCSIRequest *pvscsi_req = req->hba_private;
+    PVSCSIState *s;
+
+    if (!pvscsi_req) {
+        trace_pvscsi_command_complete_not_found(req->tag);
+        return;
+    }
+    s = pvscsi_req->dev;
+
+    switch (req->host_status) {
+    case SCSI_HOST_NO_LUN:
+        pvscsi_req->cmp.hostStatus = BTSTAT_LUNMISMATCH;
+        break;
+    case SCSI_HOST_BUSY:
+        pvscsi_req->cmp.hostStatus = BTSTAT_ABORTQUEUE;
+        break;
+    case SCSI_HOST_TIME_OUT:
+    case SCSI_HOST_ABORTED:
+        pvscsi_req->cmp.hostStatus = BTSTAT_SENTRST;
+        break;
+    case SCSI_HOST_BAD_RESPONSE:
+        pvscsi_req->cmp.hostStatus = BTSTAT_SELTIMEO;
+        break;
+    case SCSI_HOST_RESET:
+        pvscsi_req->cmp.hostStatus = BTSTAT_BUSRESET;
+        break;
+    default:
+        pvscsi_req->cmp.hostStatus = BTSTAT_HASOFTWARE;
+        break;
+    }
+    pvscsi_req->cmp.scsiStatus = GOOD;
+    qemu_sglist_destroy(&pvscsi_req->sgl);
+    pvscsi_complete_request(s, pvscsi_req);
+}
+
 static void
 pvscsi_command_complete(SCSIRequest *req, size_t resid)
 {
@@ -1103,6 +1141,7 @@ static const struct SCSIBusInfo pvscsi_scsi_info = {
         .get_sg_list = pvscsi_get_sg_list,
         .complete = pvscsi_command_complete,
         .cancel = pvscsi_request_cancelled,
+        .fail = pvscsi_command_failed,
 };
 
 static void
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 5d992e6e1d..ee7876674c 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -27,7 +27,8 @@ struct SCSIRequest {
     uint32_t          refcount;
     uint32_t          tag;
     uint32_t          lun;
-    uint32_t          status;
+    int16_t           status;
+    int16_t           host_status;
     void              *hba_private;
     size_t            resid;
     SCSICommand       cmd;
@@ -123,6 +124,7 @@ struct SCSIBusInfo {
     int (*parse_cdb)(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
                      void *hba_private);
     void (*transfer_data)(SCSIRequest *req, uint32_t arg);
+    void (*fail)(SCSIRequest *req);
     void (*complete)(SCSIRequest *req, size_t resid);
     void (*cancel)(SCSIRequest *req);
     void (*change)(SCSIBus *bus, SCSIDevice *dev, SCSISense sense);
diff --git a/include/scsi/constants.h b/include/scsi/constants.h
index 2a32c08b5e..0ee29bfd7d 100644
--- a/include/scsi/constants.h
+++ b/include/scsi/constants.h
@@ -181,6 +181,9 @@
 
 #define STATUS_MASK          0x3e
 
+/* QEMU only.  */
+#define CHECK_HOST_STATUS    0xff
+
 /*
  *  SENSE KEYS
  */
-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208C932F98B
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:01:43 +0100 (CET)
Received: from localhost ([::1]:57110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUgo-0006lT-0r
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZz-00061S-TU
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:41 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZx-0008CX-QV
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:39 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l12so5216309wry.2
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UIYd14lz7UHJRjF1bu94Jg7Tf5lE7IMtqw4bi8iqiNI=;
 b=q5qc8qGtvCjDi/k6cyipubQxnNK9PiPMuz6xhsCrpEsCFdPrYp5e3ct666yFEEKW0A
 cM9FgNNq7Q8Ut8wWJJEjXY2cQUrCL7zYkOGHlZt0bJq1otIiEDv7IP6JA5oVOh8F3tJi
 E1Jzb6rKQtwhSCtZgdnKGIBZoNlatWO0IIhN8leIIyCCeC3aga1HfUnis5dTPR2eO1Sw
 reXkk5paTQfDAyzXk/zHQ3510UFkKEGXly2/gcTBUvwIPshggiKujfDH/0pPtQhUQJH3
 5pGbOjQ+94nhqWWV7LEc28RbxSK9Sv6oxEk5XinlQcmYBI+I8TKdBL2KWUn/J5MtA7UZ
 OD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UIYd14lz7UHJRjF1bu94Jg7Tf5lE7IMtqw4bi8iqiNI=;
 b=hZa8E9aZQTS+mw7h7EQKrI04MQIzPW0V0GqRupM6Ukw55Xz+OQFYZO5OYOZ0OfR+sg
 Ah1Dq540PsunNZImk+xC2ZEwUUk/i2PGoyTPF1K9dX4dcEXlu+QVPNVDODdGSse8DxH/
 HTXJGwAxnZBHTon4I+8sL1Y3bZK+XKMWuwqNDgnMjhKhLkmKKqWD7OfF89OfaKpz7XbO
 mXhkegsSxjeo7zoQCBO90eX52eeIqsSV1ewmchNRZvAcQxtOJMtvWbR5fOrwnS2QWk2w
 1wXcHmS1JKV4dMKvppl4DqTR2sxxSaP6Vrl1/64YlbHBiKX8BS0hqbiKE4eHZLotlu6H
 IjvQ==
X-Gm-Message-State: AOAM533JxXl6V77ZUge1xzF8H3gfDuQo8zgiXvHXyUBl5qZndbxfrCnC
 WJJmv+6g/pYMdgAQc+kOo3aNdsPcLJ0=
X-Google-Smtp-Source: ABdhPJzCEvBbZQwtlXpuHyG8uwbKlgPcSjjH03Yx2hjLnk56MavAWLFAOZeaaLKsZ+rx8C5pIONihw==
X-Received: by 2002:adf:f144:: with SMTP id y4mr13746336wro.408.1615028075503; 
 Sat, 06 Mar 2021 02:54:35 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/23] scsi: move host_status handling into SCSI drivers
Date: Sat,  6 Mar 2021 11:54:13 +0100
Message-Id: <20210306105419.110503-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

Some SCSI drivers like virtio have an internal mapping for the
host_status. This patch moves the host_status translation into
the SCSI drivers to allow those drivers to set up the correct
values.

Signed-off-by: Hannes Reinecke <hare@suse.de>.
[Added default handling to avoid touching all drivers. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-bus.c     | 33 ++++++++++++++++++++++++++++--
 hw/scsi/scsi-disk.c    | 12 +++++------
 hw/scsi/scsi-generic.c |  6 ++----
 hw/scsi/virtio-scsi.c  | 46 ++++++++++++++++++++++++++++++++++++++++++
 hw/scsi/vmw_pvscsi.c   | 39 +++++++++++++++++++++++++++++++++++
 include/hw/scsi/scsi.h |  5 ++++-
 6 files changed, 128 insertions(+), 13 deletions(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index dc4141ec8d..2d674f94d7 100644
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
@@ -1455,10 +1456,38 @@ void scsi_req_print(SCSIRequest *req)
     }
 }
 
+void scsi_req_complete_failed(SCSIRequest *req, int host_status)
+{
+    SCSISense sense;
+    int status;
+
+    assert(req->status == -1 && req->host_status == -1);
+    assert(req->ops != &reqops_unit_attention);
+
+    if (!req->bus->info->fail) {
+        status = scsi_sense_from_host_status(req->host_status, &sense);
+        if (status == CHECK_CONDITION) {
+            scsi_req_build_sense(req, sense);
+        }
+        scsi_req_complete(req, status);
+        return;
+    }
+
+    req->host_status = host_status;
+    scsi_req_ref(req);
+    scsi_req_dequeue(req);
+    req->bus->info->fail(req);
+
+    /* Cancelled requests might end up being completed instead of cancelled */
+    notifier_list_notify(&req->cancel_notifiers, req);
+    scsi_req_unref(req);
+}
+
 void scsi_req_complete(SCSIRequest *req, int status)
 {
-    assert(req->status == -1);
+    assert(req->status == -1 && req->host_status == -1);
     req->status = status;
+    req->host_status = SCSI_HOST_OK;
 
     assert(req->sense_len <= sizeof(req->sense));
     if (status == GOOD) {
@@ -1646,7 +1675,7 @@ static int put_scsi_requests(QEMUFile *f, void *pv, size_t size,
 
     QTAILQ_FOREACH(req, &s->requests, next) {
         assert(!req->io_canceled);
-        assert(req->status == -1);
+        assert(req->status == -1 && req->host_status == -1);
         assert(req->enqueued);
 
         qemu_put_sbyte(f, req->retry ? 1 : 2);
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index ceaf78b423..bd7103cd0e 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2704,15 +2704,15 @@ static void scsi_block_sgio_complete(void *opaque, int ret)
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
-        } else if (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT) {
+            scsi_req_complete_failed(&r->req, io_hdr->host_status);
+            scsi_req_unref(&r->req);
+            return;
+        }
+
+        if (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT) {
             ret = BUSY;
         } else {
             ret = io_hdr->status;
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 02b87819e5..98c30c5d5c 100644
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
+        scsi_req_complete_failed(&r->req, io_hdr->host_status);
+        goto done;
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
index 5d992e6e1d..0b726bc78c 100644
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
@@ -177,6 +179,7 @@ void scsi_req_print(SCSIRequest *req);
 void scsi_req_continue(SCSIRequest *req);
 void scsi_req_data(SCSIRequest *req, int len);
 void scsi_req_complete(SCSIRequest *req, int status);
+void scsi_req_complete_failed(SCSIRequest *req, int host_status);
 uint8_t *scsi_req_get_buf(SCSIRequest *req);
 int scsi_req_get_sense(SCSIRequest *req, uint8_t *buf, int len);
 void scsi_req_cancel_complete(SCSIRequest *req);
-- 
2.29.2




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8668F59AAA5
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 04:17:07 +0200 (CEST)
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPE2s-0001uP-11
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 22:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oPE1J-0000Xr-RJ
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 22:15:30 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oPE1H-0004mO-4x
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 22:15:29 -0400
Received: by mail-pg1-x531.google.com with SMTP id l64so5021475pge.0
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 19:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=john-millikin.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=/psDLsLHG7F74LBVuypu70ATAK30S2FmaIfKeaBAhQg=;
 b=LVTLRif/NJ2/JtnmJj8dE/KFLcqJ/qN+Di/G4T9H7fiiuUSE/H8WXJ3Qm8Y6OEtsu7
 Ae2gJk2+8Eeieix2c7jqBSBcvKArTrFKiyGZ1DYmQeUobeGHFPPJ64WSdMiVO7XefYWl
 ZZGq7yxtbtczWcOFls3B/YzH/CkOnodGbj6dQEYUAu4h29kZoHuEVugJ0fj/yo29vymR
 CwOU35FSMb8iIubgtE/okVrSDJxAoq66I0sTS+F+M///4IVAspfjmFx0HlAwFe4Y7THk
 4JbHZEOmqDsOr6d7R2lSw11wResh/VbBsSUvc8uUyAXkDTn1tdgPATW8qTDeCobe+Co2
 kD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=/psDLsLHG7F74LBVuypu70ATAK30S2FmaIfKeaBAhQg=;
 b=6RXjIaP1rLYpBz167BRiqDBNZog863wOYZoSOY+b4Kva821XsIg+EQ6gQr0N5dv4Ej
 S5sPsixscD+hvXeb/mfT6uwbFrhTsE4m55/HNU1xwzPgYuOr72vOuNi1m2r3IDYZu0JV
 79EBPqVBpzSu049BdmmtLNiSHKiQyZn0EQUTSm4UwDejLZAGp4QdJzlAvMeo9h/Y9gZ2
 k492wWixsRciDNC/bU0oGXXW74GhvrIAB3TNg95xIVR4r5z1i9LeRgshJvSGml4mBX9u
 qutPaEzYQbquiO5Ev5Mhev3s7wONleqLsqKa3NRQ2aDNgfxqC3yhmxb8G1W+wAHeqHWg
 cU5Q==
X-Gm-Message-State: ACgBeo0X+sv9spcDdJp/RIGzdfE/8DWpmjS4fIWgq0iZQbL2zEsIuNqV
 JVqC1/IYO6bJAAMiyF1EYmLSjXkTRiG8cTNE
X-Google-Smtp-Source: AA6agR6qkW5E/IMXSwJvPAskK2xkiCa6a3RlF23CmwwXdxZH2RRBIECAxaLjd3CgaVZx6JD+u7N8Hw==
X-Received: by 2002:a05:6a00:1513:b0:52f:8070:ee23 with SMTP id
 q19-20020a056a00151300b0052f8070ee23mr10600856pfu.44.1660961724955; 
 Fri, 19 Aug 2022 19:15:24 -0700 (PDT)
Received: from localhost.localdomain
 ([2405:6580:98c0:1200:e418:76b4:96e0:cf28])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a170902e80f00b0016d95380e8esm3819729plg.140.2022.08.19.19.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 19:15:24 -0700 (PDT)
From: John Millikin <john@john-millikin.com>
To: qemu-devel@nongnu.org
Cc: John Millikin <john@john-millikin.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Bill Paul <noisetube@gmail.com>
Subject: [PATCH v2 1/2] scsi: Add buf_len parameter to scsi_req_new()
Date: Sat, 20 Aug 2022 10:56:48 +0900
Message-Id: <20220820015648.902562-1-john@john-millikin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=john@john-millikin.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When a SCSI command is received from the guest, the CDB length implied
by the first byte might exceed the number of bytes the guest sent. In
this case scsi_req_new() will read uninitialized data, causing
unpredictable behavior.

Adds the buf_len parameter to scsi_req_new() and plumbs it through the
call stack.

Signed-off-by: John Millikin <john@john-millikin.com>
Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1127
---
 hw/scsi/esp.c          |  2 +-
 hw/scsi/lsi53c895a.c   |  2 +-
 hw/scsi/megasas.c      | 12 +++++++-----
 hw/scsi/mptsas.c       |  3 ++-
 hw/scsi/scsi-bus.c     | 21 +++++++++++++--------
 hw/scsi/scsi-disk.c    |  7 ++++---
 hw/scsi/scsi-generic.c |  5 +++--
 hw/scsi/spapr_vscsi.c  |  3 ++-
 hw/scsi/virtio-scsi.c  |  5 +++--
 hw/scsi/vmw_pvscsi.c   |  3 ++-
 hw/usb/dev-storage.c   |  3 ++-
 hw/usb/dev-uas.c       |  5 +++--
 include/hw/scsi/scsi.h | 11 ++++++-----
 13 files changed, 49 insertions(+), 33 deletions(-)

Changes from v1:
* Applied Paolo's suggestions for proper CDB sizes instead of a TODO.
  https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02928.html

v1: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02509.html

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 2d3c649567..19fafad2a3 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -292,7 +292,7 @@ static void do_command_phase(ESPState *s)
     esp_fifo_pop_buf(&s->cmdfifo, buf, cmdlen);
 
     current_lun = scsi_device_find(&s->bus, 0, s->current_dev->id, s->lun);
-    s->current_req = scsi_req_new(current_lun, 0, s->lun, buf, s);
+    s->current_req = scsi_req_new(current_lun, 0, s->lun, buf, cmdlen, s);
     datalen = scsi_req_enqueue(s->current_req);
     s->ti_size = datalen;
     fifo8_reset(&s->cmdfifo);
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index ad5f5e5f39..05a43ec807 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -864,7 +864,7 @@ static void lsi_do_command(LSIState *s)
     s->current = g_new0(lsi_request, 1);
     s->current->tag = s->select_tag;
     s->current->req = scsi_req_new(dev, s->current->tag, s->current_lun, buf,
-                                   s->current);
+                                   s->dbc, s->current);
 
     n = scsi_req_enqueue(s->current->req);
     if (n) {
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index d5dfb412ba..04d48b9cb8 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1062,7 +1062,8 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
         info->inquiry_data[0] = 0x7f; /* Force PQual 0x3, PType 0x1f */
         info->vpd_page83[0] = 0x7f;
         megasas_setup_inquiry(cmdbuf, 0, sizeof(info->inquiry_data));
-        cmd->req = scsi_req_new(sdev, cmd->index, lun, cmdbuf, cmd);
+        cmd->req = scsi_req_new(sdev, cmd->index, lun, cmdbuf,
+                                sizeof(cmdbuf), cmd);
         if (!cmd->req) {
             trace_megasas_dcmd_req_alloc_failed(cmd->index,
                                                 "PD get info std inquiry");
@@ -1080,7 +1081,8 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
         return MFI_STAT_INVALID_STATUS;
     } else if (info->inquiry_data[0] != 0x7f && info->vpd_page83[0] == 0x7f) {
         megasas_setup_inquiry(cmdbuf, 0x83, sizeof(info->vpd_page83));
-        cmd->req = scsi_req_new(sdev, cmd->index, lun, cmdbuf, cmd);
+        cmd->req = scsi_req_new(sdev, cmd->index, lun, cmdbuf,
+                                sizeof(cmdbuf), cmd);
         if (!cmd->req) {
             trace_megasas_dcmd_req_alloc_failed(cmd->index,
                                                 "PD get info vpd inquiry");
@@ -1268,7 +1270,7 @@ static int megasas_ld_get_info_submit(SCSIDevice *sdev, int lun,
         cmd->iov_buf = g_malloc0(dcmd_size);
         info = cmd->iov_buf;
         megasas_setup_inquiry(cdb, 0x83, sizeof(info->vpd_page83));
-        cmd->req = scsi_req_new(sdev, cmd->index, lun, cdb, cmd);
+        cmd->req = scsi_req_new(sdev, cmd->index, lun, cdb, sizeof(cdb), cmd);
         if (!cmd->req) {
             trace_megasas_dcmd_req_alloc_failed(cmd->index,
                                                 "LD get info vpd inquiry");
@@ -1748,7 +1750,7 @@ static int megasas_handle_scsi(MegasasState *s, MegasasCmd *cmd,
         return MFI_STAT_SCSI_DONE_WITH_ERROR;
     }
 
-    cmd->req = scsi_req_new(sdev, cmd->index, lun_id, cdb, cmd);
+    cmd->req = scsi_req_new(sdev, cmd->index, lun_id, cdb, cdb_len, cmd);
     if (!cmd->req) {
         trace_megasas_scsi_req_alloc_failed(
                 mfi_frame_desc(frame_cmd), target_id, lun_id);
@@ -1823,7 +1825,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
 
     megasas_encode_lba(cdb, lba_start, lba_count, is_write);
     cmd->req = scsi_req_new(sdev, cmd->index,
-                            lun_id, cdb, cmd);
+                            lun_id, cdb, cdb_len, cmd);
     if (!cmd->req) {
         trace_megasas_scsi_req_alloc_failed(
             mfi_frame_desc(frame_cmd), target_id, lun_id);
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index 706cf0df3a..c4eedb6e0f 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -324,7 +324,8 @@ static int mptsas_process_scsi_io_request(MPTSASState *s,
     }
 
     req->sreq = scsi_req_new(sdev, scsi_io->MsgContext,
-                            scsi_io->LUN[1], scsi_io->CDB, req);
+                            scsi_io->LUN[1], scsi_io->CDB,
+                            scsi_io->CDBLength, req);
 
     if (req->sreq->cmd.xfer > scsi_io->DataLength) {
         goto overrun;
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index b2e2bc3c96..b35fde0a30 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -102,15 +102,15 @@ static void scsi_device_unrealize(SCSIDevice *s)
 }
 
 int scsi_bus_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
-                       void *hba_private)
+                       size_t buf_len, void *hba_private)
 {
     SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, dev->qdev.parent_bus);
     int rc;
 
     assert(cmd->len == 0);
-    rc = scsi_req_parse_cdb(dev, cmd, buf);
+    rc = scsi_req_parse_cdb(dev, cmd, buf, buf_len);
     if (bus->info->parse_cdb) {
-        rc = bus->info->parse_cdb(dev, cmd, buf, hba_private);
+        rc = bus->info->parse_cdb(dev, cmd, buf, buf_len, hba_private);
     }
     return rc;
 }
@@ -703,7 +703,7 @@ SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops, SCSIDevice *d,
 }
 
 SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
-                          uint8_t *buf, void *hba_private)
+                          uint8_t *buf, size_t buf_len, void *hba_private)
 {
     SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, d->qdev.parent_bus);
     const SCSIReqOps *ops;
@@ -734,9 +734,9 @@ SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
     }
 
     if (ops != NULL || !sc->parse_cdb) {
-        ret = scsi_req_parse_cdb(d, &cmd, buf);
+        ret = scsi_req_parse_cdb(d, &cmd, buf, buf_len);
     } else {
-        ret = sc->parse_cdb(d, &cmd, buf, hba_private);
+        ret = sc->parse_cdb(d, &cmd, buf, buf_len, hba_private);
     }
 
     if (ret != 0) {
@@ -1308,7 +1308,8 @@ static void scsi_cmd_xfer_mode(SCSICommand *cmd)
     }
 }
 
-int scsi_req_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf)
+int scsi_req_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
+                       size_t buf_len)
 {
     int rc;
     int len;
@@ -1713,7 +1714,11 @@ static int get_scsi_requests(QEMUFile *f, void *pv, size_t size,
         qemu_get_buffer(f, buf, sizeof(buf));
         qemu_get_be32s(f, &tag);
         qemu_get_be32s(f, &lun);
-        req = scsi_req_new(s, tag, lun, buf, NULL);
+        /*
+         * A too-short CDB would have been rejected by scsi_req_new, so just use
+         * SCSI_CMD_BUF_SIZE as the CDB length.
+         */
+        req = scsi_req_new(s, tag, lun, buf, SCSI_CMD_BUF_SIZE, NULL);
         req->retry = (sbyte == 1);
         if (bus->info->load_request) {
             req->hba_private = bus->info->load_request(f, req);
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index efee6739f9..399e1787ea 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -3030,14 +3030,15 @@ static SCSIRequest *scsi_block_new_request(SCSIDevice *d, uint32_t tag,
 }
 
 static int scsi_block_parse_cdb(SCSIDevice *d, SCSICommand *cmd,
-                                  uint8_t *buf, void *hba_private)
+                                  uint8_t *buf, size_t buf_len,
+                                  void *hba_private)
 {
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, d);
 
     if (scsi_block_is_passthrough(s, buf)) {
-        return scsi_bus_parse_cdb(&s->qdev, cmd, buf, hba_private);
+        return scsi_bus_parse_cdb(&s->qdev, cmd, buf, buf_len, hba_private);
     } else {
-        return scsi_req_parse_cdb(&s->qdev, cmd, buf);
+        return scsi_req_parse_cdb(&s->qdev, cmd, buf, buf_len);
     }
 }
 
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index ada24d7486..55db1684de 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -784,9 +784,10 @@ static Property scsi_generic_properties[] = {
 };
 
 static int scsi_generic_parse_cdb(SCSIDevice *dev, SCSICommand *cmd,
-                                  uint8_t *buf, void *hba_private)
+                                  uint8_t *buf, size_t buf_len,
+                                  void *hba_private)
 {
-    return scsi_bus_parse_cdb(dev, cmd, buf, hba_private);
+    return scsi_bus_parse_cdb(dev, cmd, buf, buf_len, hba_private);
 }
 
 static void scsi_generic_class_initfn(ObjectClass *klass, void *data)
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index e320ccaa23..0a8cbf5a4b 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -783,6 +783,7 @@ static int vscsi_queue_cmd(VSCSIState *s, vscsi_req *req)
     union srp_iu *srp = &req_iu(req)->srp;
     SCSIDevice *sdev;
     int n, lun;
+    size_t cdb_len = sizeof (srp->cmd.cdb) + (srp->cmd.add_cdb_len & ~3);
 
     if ((srp->cmd.lun == 0 || be64_to_cpu(srp->cmd.lun) == SRP_REPORT_LUNS_WLUN)
       && srp->cmd.cdb[0] == REPORT_LUNS) {
@@ -801,7 +802,7 @@ static int vscsi_queue_cmd(VSCSIState *s, vscsi_req *req)
         } return 1;
     }
 
-    req->sreq = scsi_req_new(sdev, req->qtag, lun, srp->cmd.cdb, req);
+    req->sreq = scsi_req_new(sdev, req->qtag, lun, srp->cmd.cdb, cdb_len, req);
     n = scsi_req_enqueue(req->sreq);
 
     trace_spapr_vscsi_queue_cmd(req->qtag, srp->cmd.cdb[0],
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 4141dddd51..41f2a56301 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -622,7 +622,8 @@ static void virtio_scsi_command_complete(SCSIRequest *r, size_t resid)
 }
 
 static int virtio_scsi_parse_cdb(SCSIDevice *dev, SCSICommand *cmd,
-                                 uint8_t *buf, void *hba_private)
+                                 uint8_t *buf, size_t buf_len,
+                                 void *hba_private)
 {
     VirtIOSCSIReq *req = hba_private;
 
@@ -696,7 +697,7 @@ static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
     virtio_scsi_ctx_check(s, d);
     req->sreq = scsi_req_new(d, req->req.cmd.tag,
                              virtio_scsi_get_lun(req->req.cmd.lun),
-                             req->req.cmd.cdb, req);
+                             req->req.cmd.cdb, vs->cdb_size, req);
 
     if (req->sreq->cmd.mode != SCSI_XFER_NONE
         && (req->sreq->cmd.mode != req->mode ||
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 4d9969f3b1..670279b66d 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -730,7 +730,8 @@ pvscsi_process_request_descriptor(PVSCSIState *s,
         r->sg.elemAddr = descr->dataAddr;
     }
 
-    r->sreq = scsi_req_new(d, descr->context, r->lun, descr->cdb, r);
+    r->sreq = scsi_req_new(d, descr->context, r->lun, descr->cdb,
+                           descr->cdbLen, r);
     if (r->sreq->cmd.mode == SCSI_XFER_FROM_DEV &&
         (descr->flags & PVSCSI_FLAG_CMD_DIR_TODEVICE)) {
         r->cmp.hostStatus = BTSTAT_BADMSG;
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index dca62d544f..8a28fd199d 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -415,7 +415,8 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
                                      cbw.cmd_len, s->data_len);
             assert(le32_to_cpu(s->csw.residue) == 0);
             s->scsi_len = 0;
-            s->req = scsi_req_new(scsi_dev, tag, cbw.lun, cbw.cmd, NULL);
+            s->req = scsi_req_new(scsi_dev, tag, cbw.lun, cbw.cmd,
+                                  cbw.cmd_len, NULL);
             if (s->commandlog) {
                 scsi_req_print(s->req);
             }
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index c9f295e7e4..5192b062d6 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -71,7 +71,7 @@ typedef struct {
     uint8_t    reserved_2;
     uint64_t   lun;
     uint8_t    cdb[16];
-    uint8_t    add_cdb[1];      /* not supported by QEMU */
+    uint8_t    add_cdb[1];
 } QEMU_PACKED  uas_iu_command;
 
 typedef struct {
@@ -699,6 +699,7 @@ static void usb_uas_command(UASDevice *uas, uas_iu *iu)
     UASRequest *req;
     uint32_t len;
     uint16_t tag = be16_to_cpu(iu->hdr.tag);
+    size_t cdb_len = sizeof(iu->command.cdb) + iu->command.add_cdb_length;
 
     if (iu->command.add_cdb_length > 0) {
         qemu_log_mask(LOG_UNIMP, "additional adb length not yet supported\n");
@@ -729,7 +730,7 @@ static void usb_uas_command(UASDevice *uas, uas_iu *iu)
 
     req->req = scsi_req_new(req->dev, req->tag,
                             usb_uas_get_lun(req->lun),
-                            iu->command.cdb, req);
+                            iu->command.cdb, cdb_len, req);
     if (uas->requestlog) {
         scsi_req_print(req->req);
     }
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index e284e3a4ec..001103488c 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -59,7 +59,7 @@ struct SCSIDeviceClass {
     void (*realize)(SCSIDevice *dev, Error **errp);
     void (*unrealize)(SCSIDevice *dev);
     int (*parse_cdb)(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
-                     void *hba_private);
+                     size_t buf_len, void *hba_private);
     SCSIRequest *(*alloc_req)(SCSIDevice *s, uint32_t tag, uint32_t lun,
                               uint8_t *buf, void *hba_private);
     void (*unit_attention_reported)(SCSIDevice *s);
@@ -122,7 +122,7 @@ struct SCSIBusInfo {
     int tcq;
     int max_channel, max_target, max_lun;
     int (*parse_cdb)(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
-                     void *hba_private);
+                     size_t buf_len, void *hba_private);
     void (*transfer_data)(SCSIRequest *req, uint32_t arg);
     void (*fail)(SCSIRequest *req);
     void (*complete)(SCSIRequest *req, size_t residual);
@@ -192,14 +192,15 @@ void scsi_legacy_handle_cmdline(void);
 SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops, SCSIDevice *d,
                             uint32_t tag, uint32_t lun, void *hba_private);
 SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
-                          uint8_t *buf, void *hba_private);
+                          uint8_t *buf, size_t buf_len, void *hba_private);
 int32_t scsi_req_enqueue(SCSIRequest *req);
 SCSIRequest *scsi_req_ref(SCSIRequest *req);
 void scsi_req_unref(SCSIRequest *req);
 
 int scsi_bus_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
-                       void *hba_private);
-int scsi_req_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf);
+                       size_t buf_len, void *hba_private);
+int scsi_req_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
+                       size_t buf_len);
 void scsi_req_build_sense(SCSIRequest *req, SCSISense sense);
 void scsi_req_print(SCSIRequest *req);
 void scsi_req_continue(SCSIRequest *req);
-- 
2.25.1



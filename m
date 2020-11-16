Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A422B50E4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:19:21 +0100 (CET)
Received: from localhost ([::1]:47290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kek24-00012L-A3
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejQt-0003sX-Ce
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:40:55 -0500
Received: from mx2.suse.de ([195.135.220.15]:45334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejQo-0000lH-Oj
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:40:55 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41A94AE1C;
 Mon, 16 Nov 2020 18:40:49 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/7] scsi-disk: Add sg_io callback to evaluate status
Date: Mon, 16 Nov 2020 19:40:35 +0100
Message-Id: <20201116184041.60465-2-hare@suse.de>
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

Add a separate sg_io callback to allow us to evaluate the various
states returned by the SG_IO ioctl.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 hw/scsi/scsi-disk.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index dd23a38d6a..5d6c892f29 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -76,7 +76,6 @@ typedef struct SCSIDiskReq {
     struct iovec iov;
     QEMUIOVector qiov;
     BlockAcctCookie acct;
-    unsigned char *status;
 } SCSIDiskReq;
 
 #define SCSI_DISK_F_REMOVABLE             0
@@ -188,7 +187,7 @@ static bool scsi_disk_req_check_error(SCSIDiskReq *r, int ret, bool acct_failed)
         return true;
     }
 
-    if (ret < 0 || (r->status && *r->status)) {
+    if (ret < 0 || r->req.status) {
         return scsi_handle_rw_error(r, -ret, acct_failed);
     }
 
@@ -452,11 +451,11 @@ static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
              * whether the error has to be handled by the guest or should rather
              * pause the host.
              */
-            assert(r->status && *r->status);
+            assert(r->req.status);
             if (scsi_sense_buf_is_guest_recoverable(r->req.sense, sizeof(r->req.sense))) {
                 /* These errors are handled by guest. */
                 sdc->update_sense(&r->req);
-                scsi_req_complete(&r->req, *r->status);
+                scsi_req_complete(&r->req, r->req.status);
                 return true;
             }
             error = scsi_sense_buf_to_errno(r->req.sense, sizeof(r->req.sense));
@@ -2688,8 +2687,24 @@ typedef struct SCSIBlockReq {
 
     /* CDB passed to SG_IO.  */
     uint8_t cdb[16];
+    BlockCompletionFunc *cb;
+    void *cb_opaque;
 } SCSIBlockReq;
 
+static void scsi_block_sgio_complete(void *opaque, int ret)
+{
+    SCSIBlockReq *req = (SCSIBlockReq *)opaque;
+    SCSIDiskReq *r = &req->req;
+    SCSISense sense;
+
+    r->req.status = sg_io_sense_from_errno(-ret, &req->io_header, &sense);
+    if (r->req.status == CHECK_CONDITION &&
+        req->io_header.status != CHECK_CONDITION)
+        scsi_req_build_sense(&r->req, sense);
+
+    req->cb(req->cb_opaque, ret);
+}
+
 static BlockAIOCB *scsi_block_do_sgio(SCSIBlockReq *req,
                                       int64_t offset, QEMUIOVector *iov,
                                       int direction,
@@ -2768,9 +2783,11 @@ static BlockAIOCB *scsi_block_do_sgio(SCSIBlockReq *req,
     io_header->timeout = s->qdev.io_timeout * 1000;
     io_header->usr_ptr = r;
     io_header->flags |= SG_FLAG_DIRECT_IO;
+    req->cb = cb;
+    req->cb_opaque = opaque;
     trace_scsi_disk_aio_sgio_command(r->req.tag, req->cdb[0], lba,
                                      nb_logical_blocks, io_header->timeout);
-    aiocb = blk_aio_ioctl(s->qdev.conf.blk, SG_IO, io_header, cb, opaque);
+    aiocb = blk_aio_ioctl(s->qdev.conf.blk, SG_IO, io_header, scsi_block_sgio_complete, req);
     assert(aiocb != NULL);
     return aiocb;
 }
@@ -2884,7 +2901,6 @@ static int32_t scsi_block_dma_command(SCSIRequest *req, uint8_t *buf)
         return 0;
     }
 
-    r->req.status = &r->io_header.status;
     return scsi_disk_dma_command(req, buf);
 }
 
-- 
2.16.4



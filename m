Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7359C2B5060
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:58:29 +0100 (CET)
Received: from localhost ([::1]:37152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejhs-000133-D7
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejR3-00040r-Fq
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:41:05 -0500
Received: from mx2.suse.de ([195.135.220.15]:45374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejQt-0000oa-1y
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:41:05 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6487FB018;
 Mon, 16 Nov 2020 18:40:49 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 6/7] scsi: split sg_io_sense_from_errno() in two functions
Date: Mon, 16 Nov 2020 19:40:40 +0100
Message-Id: <20201116184041.60465-7-hare@suse.de>
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

Currently sg_io_sense_from_errno() converts the two input parameters
'errno' and 'io_hdr' into sense code and SCSI status. This patch
splits this off into two functions scsi_sense_from_errno() and
scsi_sense_from_host_status(), both of which are available generically.
This allows us to use the function scsi_sense_from_errno() in
scsi-disk.c instead of the switch statement, allowing us to consolidate
the errno handling.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 hw/scsi/scsi-disk.c    |  72 +++++++++++--------------
 hw/scsi/scsi-generic.c |  19 +++++--
 include/scsi/utils.h   |   6 +--
 scsi/qemu-pr-helper.c  |  14 +++--
 scsi/utils.c           | 139 ++++++++++++++++++++++++++-----------------------
 5 files changed, 134 insertions(+), 116 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 797779afd6..6eb0aa3d27 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -445,8 +445,7 @@ static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
         if (acct_failed) {
             block_acct_failed(blk_get_stats(s->qdev.conf.blk), &r->acct);
         }
-        switch (error) {
-        case 0:
+        if (error == 0) {
             /* A passthrough command has run and has produced sense data; check
              * whether the error has to be handled by the guest or should rather
              * pause the host.
@@ -459,41 +458,16 @@ static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
                 return true;
             }
             error = scsi_sense_buf_to_errno(r->req.sense, sizeof(r->req.sense));
-            break;
-#ifdef CONFIG_LINUX
-            /* These errno mapping are specific to Linux.  For more information:
-             * - scsi_decide_disposition in drivers/scsi/scsi_error.c
-             * - scsi_result_to_blk_status in drivers/scsi/scsi_lib.c
-             * - blk_errors[] in block/blk-core.c
-             */
-        case EBADE:
-            /* DID_NEXUS_FAILURE -> BLK_STS_NEXUS.  */
-            scsi_req_complete(&r->req, RESERVATION_CONFLICT);
-            break;
-        case ENODATA:
-            /* DID_MEDIUM_ERROR -> BLK_STS_MEDIUM.  */
-            scsi_check_condition(r, SENSE_CODE(READ_ERROR));
-            break;
-        case EREMOTEIO:
-            /* DID_TARGET_FAILURE -> BLK_STS_TARGET.  */
-            scsi_req_complete(&r->req, HARDWARE_ERROR);
-            break;
-#endif
-        case ENOMEDIUM:
-            scsi_check_condition(r, SENSE_CODE(NO_MEDIUM));
-            break;
-        case ENOMEM:
-            scsi_check_condition(r, SENSE_CODE(TARGET_FAILURE));
-            break;
-        case EINVAL:
-            scsi_check_condition(r, SENSE_CODE(INVALID_FIELD));
-            break;
-        case ENOSPC:
-            scsi_check_condition(r, SENSE_CODE(SPACE_ALLOC_FAILED));
-            break;
-        default:
-            scsi_check_condition(r, SENSE_CODE(IO_ERROR));
-            break;
+        } else {
+            SCSISense sense;
+            int status;
+
+            status = scsi_sense_from_errno(error, &sense);
+            if (status == CHECK_CONDITION)
+                scsi_build_sense(r->req.sense, sense);
+            sdc->update_sense(&r->req);
+            scsi_req_complete(&r->req, status);
+            return true;
         }
     }
 
@@ -2714,13 +2688,29 @@ static void scsi_block_sgio_complete(void *opaque, int ret)
 {
     SCSIBlockReq *req = (SCSIBlockReq *)opaque;
     SCSIDiskReq *r = &req->req;
+    sg_io_hdr_t io_hdr = req->io_header;
     SCSISense sense;
+    int status;
 
-    r->req.status = sg_io_sense_from_errno(-ret, &req->io_header, &sense);
-    if (r->req.status == CHECK_CONDITION &&
-        req->io_header.status != CHECK_CONDITION)
+    status = scsi_sense_from_errno(-ret, &sense);
+    if (status == CHECK_CONDITION) {
         scsi_req_build_sense(&r->req, sense);
-
+    } else if (status == GOOD &&
+               io_hdr.host_status != SCSI_HOST_OK) {
+        status = scsi_sense_from_host_status(io_hdr.host_status, &sense);
+        if (status == CHECK_CONDITION) {
+            scsi_req_build_sense(&r->req, sense);
+        }
+    } else if (io_hdr.status == CHECK_CONDITION ||
+               io_hdr.driver_status & SG_ERR_DRIVER_SENSE) {
+        status = CHECK_CONDITION;
+        r->req.sense_len = io_hdr.sb_len_wr;
+    } else if (io_hdr.driver_status & SG_ERR_DRIVER_TIMEOUT) {
+        status = BUSY;
+    } else if (io_hdr.status) {
+        status = io_hdr.status;
+    }
+    r->req.status = status;
     req->cb(req->cb_opaque, ret);
 }
 
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 8687336438..a2b85678b5 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -74,6 +74,7 @@ static void scsi_command_complete_noio(SCSIGenericReq *r, int ret)
 {
     int status;
     SCSISense sense;
+    sg_io_hdr_t io_hdr = r->io_header;
 
     assert(r->req.aiocb == NULL);
 
@@ -81,13 +82,23 @@ static void scsi_command_complete_noio(SCSIGenericReq *r, int ret)
         scsi_req_cancel_complete(&r->req);
         goto done;
     }
-    status = sg_io_sense_from_errno(-ret, &r->io_header, &sense);
+    status = scsi_sense_from_errno(-ret, &sense);
     if (status == CHECK_CONDITION) {
-        if (r->io_header.driver_status & SG_ERR_DRIVER_SENSE) {
-            r->req.sense_len = r->io_header.sb_len_wr;
-        } else {
+        scsi_req_build_sense(&r->req, sense);
+    } else if (status == GOOD &&
+        io_hdr.host_status != SCSI_HOST_OK) {
+        status = scsi_sense_from_host_status(io_hdr.host_status, &sense);
+        if (status == CHECK_CONDITION) {
             scsi_req_build_sense(&r->req, sense);
         }
+    } else if (io_hdr.status == CHECK_CONDITION ||
+               io_hdr.driver_status & SG_ERR_DRIVER_SENSE) {
+        status = CHECK_CONDITION;
+        r->req.sense_len = io_hdr.sb_len_wr;
+    } else if (io_hdr.driver_status & SG_ERR_DRIVER_TIMEOUT) {
+        status = BUSY;
+    } else if (io_hdr.status != GOOD) {
+        status = io_hdr.status;
     }
 
     trace_scsi_generic_command_complete_noio(r, r->req.tag, status);
diff --git a/include/scsi/utils.h b/include/scsi/utils.h
index a55ba2c1ea..581caf15e0 100644
--- a/include/scsi/utils.h
+++ b/include/scsi/utils.h
@@ -137,9 +137,9 @@ int scsi_cdb_length(uint8_t *buf);
 #ifdef CONFIG_LINUX
 #define SG_ERR_DRIVER_TIMEOUT  0x06
 #define SG_ERR_DRIVER_SENSE    0x08
-
-int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
-                           SCSISense *sense);
 #endif
 
+int scsi_sense_from_errno(int errno_value, SCSISense *sense);
+int scsi_sense_from_host_status(uint8_t host_status, SCSISense *sense);
+
 #endif
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index d26faaf91e..e6e217a61b 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -134,7 +134,7 @@ static int do_sgio_worker(void *opaque)
     PRHelperSGIOData *data = opaque;
     struct sg_io_hdr io_hdr;
     int ret;
-    int status;
+    int status = GOOD;
     SCSISense sense_code;
 
     memset(data->sense, 0, PR_HELPER_SENSE_SIZE);
@@ -149,8 +149,16 @@ static int do_sgio_worker(void *opaque)
     io_hdr.dxferp = (char *)data->buf;
     io_hdr.dxfer_len = data->sz;
     ret = ioctl(data->fd, SG_IO, &io_hdr);
-    status = sg_io_sense_from_errno(ret < 0 ? errno : 0, &io_hdr,
-                                    &sense_code);
+
+    if (ret < 0) {
+        status = scsi_sense_from_errno(errno, &sense_code);
+    }
+    if (status == GOOD && io_hdr.host_status != SCSI_HOST_OK) {
+        status = scsi_sense_from_host_status(io_hdr.host_status, &sense_code);
+    }
+    if (status == GOOD && io_hdr.driver_status & SG_ERR_DRIVER_SENSE) {
+        status = CHECK_CONDITION;
+    }
     if (status == GOOD) {
         data->sz -= io_hdr.resid;
     } else {
diff --git a/scsi/utils.c b/scsi/utils.c
index ae68881184..6cb75154e8 100644
--- a/scsi/utils.c
+++ b/scsi/utils.c
@@ -575,72 +575,81 @@ const char *scsi_command_name(uint8_t cmd)
     return names[cmd];
 }
 
+int scsi_sense_from_errno(int errno_value, SCSISense *sense)
+{
+    switch (errno_value) {
+    case 0:
+        return GOOD;
+    case EDOM:
+        return TASK_SET_FULL;
 #ifdef CONFIG_LINUX
-int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
-                           SCSISense *sense)
+        /* These errno mapping are specific to Linux.  For more information:
+         * - scsi_decide_disposition in drivers/scsi/scsi_error.c
+         * - scsi_result_to_blk_status in drivers/scsi/scsi_lib.c
+         * - blk_errors[] in block/blk-core.c
+         */
+    case EBADE:
+        return RESERVATION_CONFLICT;
+    case ENODATA:
+        *sense = SENSE_CODE(READ_ERROR);
+        return CHECK_CONDITION;
+    case EREMOTEIO:
+        *sense = SENSE_CODE(LUN_COMM_FAILURE);
+        return CHECK_CONDITION;
+#endif
+    case ENOMEDIUM:
+        *sense = SENSE_CODE(NO_MEDIUM);
+        return CHECK_CONDITION;
+    case ENOMEM:
+        *sense = SENSE_CODE(TARGET_FAILURE);
+        return CHECK_CONDITION;
+    case EINVAL:
+        *sense = SENSE_CODE(INVALID_FIELD);
+        return CHECK_CONDITION;
+    case ENOSPC:
+        *sense = SENSE_CODE(SPACE_ALLOC_FAILED);
+        return CHECK_CONDITION;
+    default:
+        *sense = SENSE_CODE(IO_ERROR);
+        return CHECK_CONDITION;
+    }
+}
+
+int scsi_sense_from_host_status(uint8_t host_status,
+                                SCSISense *sense)
 {
-    if (errno_value != 0) {
-        switch (errno_value) {
-        case EDOM:
-            return TASK_SET_FULL;
-        case EBADE:
-            return RESERVATION_CONFLICT;
-        case ENODATA:
-            *sense = SENSE_CODE(READ_ERROR);
-            return CHECK_CONDITION;
-        case EREMOTEIO:
-            *sense = SENSE_CODE(LUN_COMM_FAILURE);
-            return CHECK_CONDITION;
-        case ENOMEM:
-            *sense = SENSE_CODE(TARGET_FAILURE);
-            return CHECK_CONDITION;
-        default:
-            *sense = SENSE_CODE(IO_ERROR);
-            return CHECK_CONDITION;
-        }
-    } else {
-        switch (io_hdr->host_status) {
-        case SCSI_HOST_NO_LUN:
-            *sense = SENSE_CODE(LUN_NOT_RESPONDING);
-            return CHECK_CONDITION;
-        case SCSI_HOST_BUSY:
-            return BUSY;
-        case SCSI_HOST_TIME_OUT:
-            *sense = SENSE_CODE(COMMAND_TIMEOUT);
-            return CHECK_CONDITION;
-        case SCSI_HOST_BAD_RESPONSE:
-            *sense = SENSE_CODE(LUN_COMM_FAILURE);
-            return CHECK_CONDITION;
-        case SCSI_HOST_ABORTED:
-            *sense = SENSE_CODE(COMMAND_ABORTED);
-            return CHECK_CONDITION;
-        case SCSI_HOST_RESET:
-            *sense = SENSE_CODE(RESET);
-            return CHECK_CONDITION;
-        case SCSI_HOST_TRANSPORT_DISRUPTED:
-            *sense = SENSE_CODE(I_T_NEXUS_LOSS);
-            return CHECK_CONDITION;
-        case SCSI_HOST_TARGET_FAILURE:
-            *sense = SENSE_CODE(TARGET_FAILURE);
-            return CHECK_CONDITION;
-        case SCSI_HOST_RESERVATION_ERROR:
-            return RESERVATION_CONFLICT;
-        case SCSI_HOST_ALLOCATION_FAILURE:
-            *sense = SENSE_CODE(SPACE_ALLOC_FAILED);
-            return CHECK_CONDITION;
-        case SCSI_HOST_MEDIUM_ERROR:
-            *sense = SENSE_CODE(READ_ERROR);
-            return CHECK_CONDITION;
-        }
-        if (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT) {
-            return BUSY;
-        } else if (io_hdr->status) {
-            return io_hdr->status;
-        } else if (io_hdr->driver_status & SG_ERR_DRIVER_SENSE) {
-            return CHECK_CONDITION;
-        } else {
-            return GOOD;
-        }
+    switch (host_status) {
+    case SCSI_HOST_NO_LUN:
+        *sense = SENSE_CODE(LUN_NOT_RESPONDING);
+        return CHECK_CONDITION;
+    case SCSI_HOST_BUSY:
+        return BUSY;
+    case SCSI_HOST_TIME_OUT:
+        *sense = SENSE_CODE(COMMAND_TIMEOUT);
+        return CHECK_CONDITION;
+    case SCSI_HOST_BAD_RESPONSE:
+        *sense = SENSE_CODE(LUN_COMM_FAILURE);
+        return CHECK_CONDITION;
+    case SCSI_HOST_ABORTED:
+        *sense = SENSE_CODE(COMMAND_ABORTED);
+        return CHECK_CONDITION;
+    case SCSI_HOST_RESET:
+        *sense = SENSE_CODE(RESET);
+        return CHECK_CONDITION;
+    case SCSI_HOST_TRANSPORT_DISRUPTED:
+        *sense = SENSE_CODE(I_T_NEXUS_LOSS);
+        return CHECK_CONDITION;
+    case SCSI_HOST_TARGET_FAILURE:
+        *sense = SENSE_CODE(TARGET_FAILURE);
+        return CHECK_CONDITION;
+    case SCSI_HOST_RESERVATION_ERROR:
+        return RESERVATION_CONFLICT;
+    case SCSI_HOST_ALLOCATION_FAILURE:
+        *sense = SENSE_CODE(SPACE_ALLOC_FAILED);
+        return CHECK_CONDITION;
+    case SCSI_HOST_MEDIUM_ERROR:
+        *sense = SENSE_CODE(READ_ERROR);
+        return CHECK_CONDITION;
     }
+    return GOOD;
 }
-#endif
-- 
2.16.4



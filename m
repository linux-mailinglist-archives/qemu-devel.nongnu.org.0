Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4614A3243D2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:35:03 +0100 (CET)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEyzy-0003TV-H7
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqO-0002MZ-Hz
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:25:04 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqM-0004os-Cl
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:25:04 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hs11so4659649ejc.1
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wt9pMPT0lL6EDRJ3SAekZXeRCQPtgI8juZkbMJm8DfQ=;
 b=vARZBQ95dfJ0EVwKct9IQVCiCKUQf8VkzVPtBHG/sboU3fToD/wgBIKId1pxVNAtnH
 HDnBM/tqT04nIvW0rYQYe/Y1xUelkHefVZI9tBGCakEGVxOltX0Aook2dW/ZuPbSiJ8m
 +N9OKLIviDjy5ForSKP1gmtOh+RftgyNEjRUX9bAHeO/IuBDD0FeaEgOXDIc1k8Qkw+c
 FXZEyu+6faZ5hY686PQJbguJoXRscZzLgdK7nKkh9Ifei6P8zmeJuDj9NTM2MqAl4bLq
 WFB4abfDyMXe8Tqmpfy/4uvDNdjKwNihMhI2ITAOKQ72vLUqfUQXvnSvx/w0wYXgNR0c
 wNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wt9pMPT0lL6EDRJ3SAekZXeRCQPtgI8juZkbMJm8DfQ=;
 b=PdVSPF5hdc8emhelezdE7y8QPKYJfdYdLj16KRcBxJ4IG4QdIzqFyVbR0iE3W/gWIf
 czkd8lE3MnXs+NLifZNSI8oqyh7mpR5hqg6R4gnj3zLoeVYEoL7n0efj3k1mhe89tQFX
 M0dK82j8QKZayCHnOqv+Gpo9L8tG6cxzpi1Z7vO7tCi4c0KwbI5lWOZ1Gl/+9t0MC7+o
 Io2L16ETGunWP+Hjc0cGDwJWWj55rJclkzP7n3uvxJ0/Tt1r8BRO9P9iOQwrKcx/wbQs
 Rvf1qcNJvOsw+plaHgph0s3XWEx1dG1xTmTZacnvTqmaa188toB+7UgvjufazS/fwy4v
 X+xA==
X-Gm-Message-State: AOAM531O4OyYuRZWqQw7pvRmjf82Rsmr8bLNyPMq329yCdC+NISsV1dY
 dB73yLUI7zNNk+VrjLr8BTkbrH3R0JQ=
X-Google-Smtp-Source: ABdhPJwJizYXoUC3BFF0gZ+mejC93L8DQHtWrZ1IwCjBjMp8tQ7VPaDpBhoYUZ94RwI9r94UiZM+pA==
X-Received: by 2002:a17:906:3e42:: with SMTP id
 t2mr29490133eji.554.1614191100885; 
 Wed, 24 Feb 2021 10:25:00 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bw22sm1791172ejb.78.2021.02.24.10.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:25:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/10] scsi: inline sg_io_sense_from_errno() into the callers.
Date: Wed, 24 Feb 2021 19:24:52 +0100
Message-Id: <20210224182453.587731-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224182453.587731-1-pbonzini@redhat.com>
References: <20210224182453.587731-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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

Currently sg_io_sense_from_errno() converts the two input parameters
'errno' and 'io_hdr' into sense code and SCSI status. Having
split the function off into scsi_sense_from_errno() and
scsi_sense_from_host_status(), both of which are available generically,
we now inline the logic in the callers so that scsi-disk and
scsi-generic will be able to pass host_status to the HBA.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Message-Id: <20201116184041.60465-7-hare@suse.de>
[Put together from "scsi-disk: Add sg_io callback to evaluate status"
 and what remains of "scsi: split sg_io_sense_from_errno() in two functions",
 with many other fixes. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c    | 47 +++++++++++++++++++++++++++++++++++++-----
 hw/scsi/scsi-generic.c | 22 ++++++++++++++------
 include/scsi/utils.h   |  3 ---
 scsi/qemu-pr-helper.c  | 24 ++++++++++++++-------
 scsi/utils.c           | 23 ---------------------
 5 files changed, 75 insertions(+), 44 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index a5a58d7db3..ceaf78b423 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -77,7 +77,6 @@ typedef struct SCSIDiskReq {
     struct iovec iov;
     QEMUIOVector qiov;
     BlockAcctCookie acct;
-    unsigned char *status;
 } SCSIDiskReq;
 
 #define SCSI_DISK_F_REMOVABLE             0
@@ -261,8 +260,6 @@ static bool scsi_disk_req_check_error(SCSIDiskReq *r, int ret, bool acct_failed)
 
     if (ret < 0) {
         return scsi_handle_rw_error(r, ret, acct_failed);
-    } else if (r->status && *r->status) {
-        return scsi_handle_rw_error(r, *r->status, acct_failed);
     }
 
     return false;
@@ -2697,8 +2694,47 @@ typedef struct SCSIBlockReq {
 
     /* CDB passed to SG_IO.  */
     uint8_t cdb[16];
+    BlockCompletionFunc *cb;
+    void *cb_opaque;
 } SCSIBlockReq;
 
+static void scsi_block_sgio_complete(void *opaque, int ret)
+{
+    SCSIBlockReq *req = (SCSIBlockReq *)opaque;
+    SCSIDiskReq *r = &req->req;
+    SCSIDevice *s = r->req.dev;
+    sg_io_hdr_t *io_hdr = &req->io_header;
+    SCSISense sense;
+
+    if (ret == 0) {
+        if (io_hdr->host_status != SCSI_HOST_OK) {
+            ret = scsi_sense_from_host_status(io_hdr->host_status, &sense);
+            if (ret == CHECK_CONDITION) {
+                scsi_req_build_sense(&r->req, sense);
+            }
+        } else if (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT) {
+            ret = BUSY;
+        } else {
+            ret = io_hdr->status;
+        }
+
+        if (ret > 0) {
+            aio_context_acquire(blk_get_aio_context(s->conf.blk));
+            if (scsi_handle_rw_error(r, ret, true)) {
+                aio_context_release(blk_get_aio_context(s->conf.blk));
+                scsi_req_unref(&r->req);
+                return;
+            }
+            aio_context_release(blk_get_aio_context(s->conf.blk));
+
+            /* Ignore error.  */
+            ret = 0;
+        }
+    }
+
+    req->cb(req->cb_opaque, ret);
+}
+
 static BlockAIOCB *scsi_block_do_sgio(SCSIBlockReq *req,
                                       int64_t offset, QEMUIOVector *iov,
                                       int direction,
@@ -2777,9 +2813,11 @@ static BlockAIOCB *scsi_block_do_sgio(SCSIBlockReq *req,
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
@@ -2893,7 +2931,6 @@ static int32_t scsi_block_dma_command(SCSIRequest *req, uint8_t *buf)
         return 0;
     }
 
-    r->req.status = &r->io_header.status;
     return scsi_disk_dma_command(req, buf);
 }
 
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index cf7e11cf44..716caf0d22 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -75,6 +75,7 @@ static void scsi_command_complete_noio(SCSIGenericReq *r, int ret)
 {
     int status;
     SCSISense sense;
+    sg_io_hdr_t *io_hdr = &r->io_header;
 
     assert(r->req.aiocb == NULL);
 
@@ -82,15 +83,24 @@ static void scsi_command_complete_noio(SCSIGenericReq *r, int ret)
         scsi_req_cancel_complete(&r->req);
         goto done;
     }
-    status = sg_io_sense_from_errno(-ret, &r->io_header, &sense);
-    if (status == CHECK_CONDITION) {
-        if (r->io_header.driver_status & SG_ERR_DRIVER_SENSE) {
-            r->req.sense_len = r->io_header.sb_len_wr;
-        } else {
+    if (ret < 0) {
+        status = scsi_sense_from_errno(-ret, &sense);
+        if (status == CHECK_CONDITION) {
+            scsi_req_build_sense(&r->req, sense);
+        }
+    } else if (io_hdr->host_status != SCSI_HOST_OK) {
+        status = scsi_sense_from_host_status(io_hdr->host_status, &sense);
+        if (status == CHECK_CONDITION) {
             scsi_req_build_sense(&r->req, sense);
         }
+    } else if (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT) {
+        status = BUSY;
+    } else {
+        status = io_hdr->status;
+        if (io_hdr->driver_status & SG_ERR_DRIVER_SENSE) {
+            r->req.sense_len = io_hdr->sb_len_wr;
+        }
     }
-
     trace_scsi_generic_command_complete_noio(r, r->req.tag, status);
 
     scsi_req_complete(&r->req, status);
diff --git a/include/scsi/utils.h b/include/scsi/utils.h
index 9080d65e27..d5c8efa16e 100644
--- a/include/scsi/utils.h
+++ b/include/scsi/utils.h
@@ -139,9 +139,6 @@ int scsi_cdb_length(uint8_t *buf);
 #ifdef CONFIG_LINUX
 #define SG_ERR_DRIVER_TIMEOUT  0x06
 #define SG_ERR_DRIVER_SENSE    0x08
-
-int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
-                           SCSISense *sense);
 #endif
 
 int scsi_sense_from_errno(int errno_value, SCSISense *sense);
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 2733d92f2d..0cb2bddd61 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -149,19 +149,29 @@ static int do_sgio_worker(void *opaque)
     io_hdr.dxferp = (char *)data->buf;
     io_hdr.dxfer_len = data->sz;
     ret = ioctl(data->fd, SG_IO, &io_hdr);
-    status = sg_io_sense_from_errno(ret < 0 ? errno : 0, &io_hdr,
-                                    &sense_code);
+
+    if (ret < 0) {
+        status = scsi_sense_from_errno(errno, &sense_code);
+        if (status == CHECK_CONDITION) {
+            scsi_build_sense(data->sense, sense_code);
+        }
+    } else if (io_hdr.host_status != SCSI_HOST_OK) {
+        status = scsi_sense_from_host_status(io_hdr.host_status, &sense_code);
+        if (status == CHECK_CONDITION) {
+            scsi_build_sense(data->sense, sense_code);
+        }
+    } else if (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT) {
+        status = BUSY;
+    } else {
+        status = io_hdr.status;
+    }
+
     if (status == GOOD) {
         data->sz -= io_hdr.resid;
     } else {
         data->sz = 0;
     }
 
-    if (status == CHECK_CONDITION &&
-        !(io_hdr.driver_status & SG_ERR_DRIVER_SENSE)) {
-        scsi_build_sense(data->sense, sense_code);
-    }
-
     return status;
 }
 
diff --git a/scsi/utils.c b/scsi/utils.c
index 28eb32746e..873e05aeaf 100644
--- a/scsi/utils.c
+++ b/scsi/utils.c
@@ -658,26 +658,3 @@ int scsi_sense_from_host_status(uint8_t host_status,
     }
     return GOOD;
 }
-
-#ifdef CONFIG_LINUX
-int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
-                           SCSISense *sense)
-{
-    if (errno_value != 0) {
-        return scsi_sense_from_errno(errno_value, sense);
-    } else {
-        int status = scsi_sense_from_host_status(io_hdr->host_status, sense);
-        if (status) {
-            return status;
-        } else if (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT) {
-            return BUSY;
-        } else if (io_hdr->status) {
-            return io_hdr->status;
-        } else if (io_hdr->driver_status & SG_ERR_DRIVER_SENSE) {
-            return CHECK_CONDITION;
-        } else {
-            return GOOD;
-        }
-    }
-}
-#endif
-- 
2.29.2




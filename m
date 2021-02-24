Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 143433243C3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:30:45 +0100 (CET)
Received: from localhost ([::1]:51858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEyvr-0007gU-M0
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqI-0002JD-CG
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:24:59 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:45076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqG-0004lb-IP
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:24:58 -0500
Received: by mail-ed1-x532.google.com with SMTP id p2so3722815edm.12
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dmPfvXeQvEn+5queRrC9faXjWtuXEijScy1bn7bFvN8=;
 b=kWVkKb3jK+gAQZQbVvNdHa5kairmMN7BDMXLUjlC+eH+Imz/QUmoGBwzkj3BA5qaBw
 IiV7DHdKed4oK2tJUns96pFUhy5mHf6PZFyg/e/+g6AovIqQCWmhwoMhBcS1DVOie72p
 r2THzhLXLMomslACDyq13UxnrbdqwTCCMAl7D7kcNRF1nKDeKP8AqNjIIMVbve0x6ff8
 fcxZMGj6TKA4C3WX28fOmgpfTAg02UUU7ckcNoi3HC2Z/KB5LPnFDIGRJsbeQJZkYpSI
 ifcj/4e4x63Unzw3qz4H2IvTMd5Jda4ShercDAwB4A4T2nwtDmsSAfjnCoIMGV+0rSF7
 FttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dmPfvXeQvEn+5queRrC9faXjWtuXEijScy1bn7bFvN8=;
 b=J3gBXYcTVJfyuqnxj5JfuqfHw4CmkdW5YT8SqrKHp30RrcwzbcSG5HGjUbCHKM+HQd
 Cqxc+54kClQFtmguLm3IzBqKXQePLKFjnfsR1q6SbpeqL2HBprjlsrhhzChZhDbvJdHC
 hrua6NlVsD63lOgbGTegtHFq2JrO3Mp5y/YsaJFITnRAGFThXWjIPNvn8HK4W9LNcRkW
 l3LtZtvzX5w8iDWDXsj3pDAtLDnsG1QnDTMcECSPA2hR/mNFD7YMIm/I8kwoH8uVdDrV
 +/qDHDZJcgG+WhLxZetD4lUpSfackKHo1IXf32naqf8kZVvaiJLjfi+rRYx390W2zGFk
 r8Ug==
X-Gm-Message-State: AOAM5325+eOTREKQEYkh3cW/gjiOp8HMXPZfglmIuB2/k39pArRoLNLb
 CgoFwgf5mBYTjSEM2jDSS8Vwtb9z6I0=
X-Google-Smtp-Source: ABdhPJwtpUw1btNbOdbmhJp35YLcGFcykAV3y0WnYhRV/gfjTthDs3moY8HLN8KrCW5pUfPmzJ3ztw==
X-Received: by 2002:aa7:c314:: with SMTP id l20mr22735390edq.148.1614191095200; 
 Wed, 24 Feb 2021 10:24:55 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bw22sm1791172ejb.78.2021.02.24.10.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:24:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/10] scsi-disk: move scsi_handle_rw_error earlier
Date: Wed, 24 Feb 2021 19:24:44 +0100
Message-Id: <20210224182453.587731-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224182453.587731-1-pbonzini@redhat.com>
References: <20210224182453.587731-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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

Remove the forward declaration.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c | 168 ++++++++++++++++++++++----------------------
 1 file changed, 83 insertions(+), 85 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index a2716b26b4..18ab777017 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -111,8 +111,6 @@ struct SCSIDiskState {
     uint16_t rotation_rate;
 };
 
-static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed);
-
 static void scsi_free_request(SCSIRequest *req)
 {
     SCSIDiskReq *r = DO_UPCAST(SCSIDiskReq, req, req);
@@ -182,6 +180,89 @@ static void scsi_disk_load_request(QEMUFile *f, SCSIRequest *req)
     qemu_iovec_init_external(&r->qiov, &r->iov, 1);
 }
 
+/*
+ * scsi_handle_rw_error has two return values.  False means that the error
+ * must be ignored, true means that the error has been processed and the
+ * caller should not do anything else for this request.  Note that
+ * scsi_handle_rw_error always manages its reference counts, independent
+ * of the return value.
+ */
+static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
+{
+    bool is_read = (r->req.cmd.mode == SCSI_XFER_FROM_DEV);
+    SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
+    SCSIDiskClass *sdc = (SCSIDiskClass *) object_get_class(OBJECT(s));
+    BlockErrorAction action = blk_get_error_action(s->qdev.conf.blk,
+                                                   is_read, error);
+
+    if (action == BLOCK_ERROR_ACTION_REPORT) {
+        if (acct_failed) {
+            block_acct_failed(blk_get_stats(s->qdev.conf.blk), &r->acct);
+        }
+        switch (error) {
+        case 0:
+            /* A passthrough command has run and has produced sense data; check
+             * whether the error has to be handled by the guest or should rather
+             * pause the host.
+             */
+            assert(r->status && *r->status);
+            if (scsi_sense_buf_is_guest_recoverable(r->req.sense, sizeof(r->req.sense))) {
+                /* These errors are handled by guest. */
+                sdc->update_sense(&r->req);
+                scsi_req_complete(&r->req, *r->status);
+                return true;
+            }
+            error = scsi_sense_buf_to_errno(r->req.sense, sizeof(r->req.sense));
+            break;
+#ifdef CONFIG_LINUX
+            /* These errno mapping are specific to Linux.  For more information:
+             * - scsi_decide_disposition in drivers/scsi/scsi_error.c
+             * - scsi_result_to_blk_status in drivers/scsi/scsi_lib.c
+             * - blk_errors[] in block/blk-core.c
+             */
+        case EBADE:
+            /* DID_NEXUS_FAILURE -> BLK_STS_NEXUS.  */
+            scsi_req_complete(&r->req, RESERVATION_CONFLICT);
+            break;
+        case ENODATA:
+            /* DID_MEDIUM_ERROR -> BLK_STS_MEDIUM.  */
+            scsi_check_condition(r, SENSE_CODE(READ_ERROR));
+            break;
+        case EREMOTEIO:
+            /* DID_TARGET_FAILURE -> BLK_STS_TARGET.  */
+            scsi_req_complete(&r->req, HARDWARE_ERROR);
+            break;
+#endif
+        case ENOMEDIUM:
+            scsi_check_condition(r, SENSE_CODE(NO_MEDIUM));
+            break;
+        case ENOMEM:
+            scsi_check_condition(r, SENSE_CODE(TARGET_FAILURE));
+            break;
+        case EINVAL:
+            scsi_check_condition(r, SENSE_CODE(INVALID_FIELD));
+            break;
+        case ENOSPC:
+            scsi_check_condition(r, SENSE_CODE(SPACE_ALLOC_FAILED));
+            break;
+        default:
+            scsi_check_condition(r, SENSE_CODE(IO_ERROR));
+            break;
+        }
+    }
+
+    blk_error_action(s->qdev.conf.blk, action, is_read, error);
+    if (action == BLOCK_ERROR_ACTION_IGNORE) {
+        scsi_req_complete(&r->req, 0);
+        return true;
+    }
+
+    if (action == BLOCK_ERROR_ACTION_STOP) {
+        scsi_req_retry(&r->req);
+    }
+    return true;
+}
+
 static bool scsi_disk_req_check_error(SCSIDiskReq *r, int ret, bool acct_failed)
 {
     if (r->req.io_canceled) {
@@ -428,89 +509,6 @@ static void scsi_read_data(SCSIRequest *req)
     }
 }
 
-/*
- * scsi_handle_rw_error has two return values.  False means that the error
- * must be ignored, true means that the error has been processed and the
- * caller should not do anything else for this request.  Note that
- * scsi_handle_rw_error always manages its reference counts, independent
- * of the return value.
- */
-static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
-{
-    bool is_read = (r->req.cmd.mode == SCSI_XFER_FROM_DEV);
-    SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
-    SCSIDiskClass *sdc = (SCSIDiskClass *) object_get_class(OBJECT(s));
-    BlockErrorAction action = blk_get_error_action(s->qdev.conf.blk,
-                                                   is_read, error);
-
-    if (action == BLOCK_ERROR_ACTION_REPORT) {
-        if (acct_failed) {
-            block_acct_failed(blk_get_stats(s->qdev.conf.blk), &r->acct);
-        }
-        switch (error) {
-        case 0:
-            /* A passthrough command has run and has produced sense data; check
-             * whether the error has to be handled by the guest or should rather
-             * pause the host.
-             */
-            assert(r->status && *r->status);
-            if (scsi_sense_buf_is_guest_recoverable(r->req.sense, sizeof(r->req.sense))) {
-                /* These errors are handled by guest. */
-                sdc->update_sense(&r->req);
-                scsi_req_complete(&r->req, *r->status);
-                return true;
-            }
-            error = scsi_sense_buf_to_errno(r->req.sense, sizeof(r->req.sense));
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
-        }
-    }
-
-    blk_error_action(s->qdev.conf.blk, action, is_read, error);
-    if (action == BLOCK_ERROR_ACTION_IGNORE) {
-        scsi_req_complete(&r->req, 0);
-        return true;
-    }
-
-    if (action == BLOCK_ERROR_ACTION_STOP) {
-        scsi_req_retry(&r->req);
-    }
-    return true;
-}
-
 static void scsi_write_complete_noio(SCSIDiskReq *r, int ret)
 {
     uint32_t n;
-- 
2.29.2




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9221325EB5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:15:09 +0100 (CET)
Received: from localhost ([::1]:50618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYHE-0002Wb-Lc
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY80-0001js-FQ
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:37 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7y-00046J-Gh
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:36 -0500
Received: by mail-wm1-x333.google.com with SMTP id i9so6355361wml.0
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dmPfvXeQvEn+5queRrC9faXjWtuXEijScy1bn7bFvN8=;
 b=Doe0ThXHC4JBU5JJX0hBmD6jrqjqpv6noG46HODqxYm1xgqzms/ke4UUdDdVG1GG2y
 Tl84TanQghkjwobSHi1ER4JwQ9WArsORH39i94VEVwP7uD+eCiYsLZ3sJNc+Wf0yAWk+
 ATq9arhsqQDdhjApiaDnHhLhqC+jkaGuST2ICSMcJaL41Qn5Wi5/ADwblG/l/GIR3X56
 mh3KfewMeLmmelWRgphFKpaT3EcT51TO5zHX7xhwu7ifJl83ZudQzjAyCReomhncNWVS
 Lz7a79nnosok/cUrz9a0tt7oB/rkRsiWWoaq99fyWFxo3VnBUb+SwmFUG9Oixp7u9693
 J6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dmPfvXeQvEn+5queRrC9faXjWtuXEijScy1bn7bFvN8=;
 b=W6ZT5JeEhKMIqR9QlarfLUIMcixqVXmZ4IaFqfJDZ6hEn4cr2jA9Dsoau4JUtzBsTu
 cBYAbWHZ532PRO41UA23tyBmymPMnJyC4OCLPTHfNpROYZQ/91yTkC5NXa0UMhYtOeCX
 igvu840EX+AmUnNJcmMYNvPiVobghp06Re32dp8NgBWsDVf/aK5G0EfFVJkpkH8Y6uMe
 9sECLc4ccQzA5X/EY8VCgn1nFa59Rw08Wt6QyrBg7hTS4GJYvbE9GbF/RH07Qw6CSLsO
 1z0kUMyf0c2jXmRxOIBrR3aMMMZPsn6XrG6ChBuSo+BsLrwWb3fenhSifzWZxdSeBNq0
 swfg==
X-Gm-Message-State: AOAM530WGXs6Nfxzpb5GsqFnYpCflKttRCPV+RCo2pK8uAE+wb8/u4NK
 VkvAOFOf7G92XUs+vtiVdsZkIOf6Meo=
X-Google-Smtp-Source: ABdhPJwUtBFY3qr5Yz7esyRFig/42b+OEXVUNVvzkW+jHrfulKIUugpahwAk02p5fnq0X6Q6gz0PzQ==
X-Received: by 2002:a7b:c922:: with SMTP id h2mr1552945wml.44.1614326733059;
 Fri, 26 Feb 2021 00:05:33 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/29] scsi-disk: move scsi_handle_rw_error earlier
Date: Fri, 26 Feb 2021 09:05:05 +0100
Message-Id: <20210226080526.651705-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
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




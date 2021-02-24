Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB093243BC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:27:12 +0100 (CET)
Received: from localhost ([::1]:43490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEysR-00044T-Ka
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqJ-0002JM-Qh
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:24:59 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqI-0004lv-0J
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:24:59 -0500
Received: by mail-ed1-x52f.google.com with SMTP id h25so3773672eds.4
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uBJ4xrj+hJEP+gaoUps5rPIqMrLdZuVboWYAHOTV5sw=;
 b=SHRwgRx40iraAte4pdKs6p5FYZf+NUi2qPBAG+FhKbumGVjnOE8/0Wsbuh93azCCAu
 etF9qqaCh+uDXRwB+0qJeaEAa1kA0BYvLyxc7+kDna41AAwbUKsds04aHYCNp00oUmik
 nIP9TLeENEDzP3YfambOekA3bzKruUOtwqhYn8R/Xgjl5dG+TbEmkRa1DfNdrWtAaQ1X
 fELafFZAsu/VZTHGImfogZPtj34ebMPwYFhiTV1VFlc31F7V7t9Pf8kwydKmONL3zYdZ
 e9vQNprdEBCp7kJcnlmEzadlTX2L0YUtLQoTO7AAFCUjD1Em7iyUl2ZROKGrZ06CEw9n
 IQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uBJ4xrj+hJEP+gaoUps5rPIqMrLdZuVboWYAHOTV5sw=;
 b=ZerxInMPYBfBllk2hk4/6eS5V9qLh2SCxFw1fdd4Vmh0jctijtiBp2/ysKb8jzbYl6
 5zgw+Ol/ciEjhDH6i3INqV18lMnpqNVXPQBWoZakb+9/I+wlJIdHB+2dX788L9zSWPQg
 eeXfM0U5dXLLbNqI0ybtjF7psasvtCDHf/+odEcflmTVqOKnoJasY4+E5p+vYgbDw3Yx
 DLJtUAMZvgVvsLeagt3Fiuetth/QftjHDy9N/9f0ri/sGZtIf8RVNjTRo99glhKbVHfY
 oWWQSn2Hv86tIVvCQERcTKM8lQStEsfhDSXdjpwwYIapkiG1dTLepJx2EUh+aTrWJX9X
 MvjQ==
X-Gm-Message-State: AOAM533ol5IAjKyKgtvvcecKDNTyLlaiwoobz5N+W4xH9NUxPZjleKTq
 2x2XxzYCcg/q1cXcGTpFGXCSEFnOuA4=
X-Google-Smtp-Source: ABdhPJxuZONZ1WEjJhrwjQDVrAEnqbLHjOO4JFxmKCDIp2s5cRQD7VV3cTIfCm6fDufPl9N00XYc5A==
X-Received: by 2002:aa7:d64f:: with SMTP id v15mr18553871edr.358.1614191096685; 
 Wed, 24 Feb 2021 10:24:56 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bw22sm1791172ejb.78.2021.02.24.10.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:24:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/10] scsi: introduce scsi_sense_from_errno()
Date: Wed, 24 Feb 2021 19:24:46 +0100
Message-Id: <20210224182453.587731-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224182453.587731-1-pbonzini@redhat.com>
References: <20210224182453.587731-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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

The new function is an extension of the switch statement in scsi-disk.c
which also includes the errno cases only found in sg_io_sense_from_errno.
This allows us to consolidate the errno handling.

Extracted from a patch by Hannes Reinecke <hare@suse.de>.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c  | 45 +++++++-------------------------------
 include/scsi/utils.h |  2 ++
 scsi/utils.c         | 51 +++++++++++++++++++++++++++++++++++---------
 3 files changed, 51 insertions(+), 47 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 36aa872445..9c6099ffc4 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -194,13 +194,13 @@ static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
     SCSIDiskClass *sdc = (SCSIDiskClass *) object_get_class(OBJECT(s));
     BlockErrorAction action = blk_get_error_action(s->qdev.conf.blk,
                                                    is_read, error);
+    SCSISense sense;
 
     if (action == BLOCK_ERROR_ACTION_REPORT) {
         if (acct_failed) {
             block_acct_failed(blk_get_stats(s->qdev.conf.blk), &r->acct);
         }
-        switch (error) {
-        case 0:
+        if (error == 0) {
             /* A passthrough command has run and has produced sense data; check
              * whether the error has to be handled by the guest or should rather
              * pause the host.
@@ -213,41 +213,12 @@ static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
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
+            int status = scsi_sense_from_errno(error, &sense);
+            if (status == CHECK_CONDITION) {
+                scsi_req_build_sense(&r->req, sense);
+            }
+            scsi_req_complete(&r->req, status);
         }
     }
 
diff --git a/include/scsi/utils.h b/include/scsi/utils.h
index 096489c6cd..ff7c7091b6 100644
--- a/include/scsi/utils.h
+++ b/include/scsi/utils.h
@@ -135,4 +135,6 @@ int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
                            SCSISense *sense);
 #endif
 
+int scsi_sense_from_errno(int errno_value, SCSISense *sense);
+
 #endif
diff --git a/scsi/utils.c b/scsi/utils.c
index 793c3a6b9c..6b56e01002 100644
--- a/scsi/utils.c
+++ b/scsi/utils.c
@@ -565,21 +565,52 @@ const char *scsi_command_name(uint8_t cmd)
     return names[cmd];
 }
 
+int scsi_sense_from_errno(int errno_value, SCSISense *sense)
+{
+    switch (errno_value) {
+    case 0:
+        return GOOD;
+    case EDOM:
+        return TASK_SET_FULL;
+#ifdef CONFIG_LINUX
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
 #ifdef CONFIG_LINUX
 int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
                            SCSISense *sense)
 {
     if (errno_value != 0) {
-        switch (errno_value) {
-        case EDOM:
-            return TASK_SET_FULL;
-        case ENOMEM:
-            *sense = SENSE_CODE(TARGET_FAILURE);
-            return CHECK_CONDITION;
-        default:
-            *sense = SENSE_CODE(IO_ERROR);
-            return CHECK_CONDITION;
-        }
+        return scsi_sense_from_errno(errno_value, sense);
     } else {
         if (io_hdr->host_status == SG_ERR_DID_NO_CONNECT ||
             io_hdr->host_status == SG_ERR_DID_BUS_BUSY ||
-- 
2.29.2




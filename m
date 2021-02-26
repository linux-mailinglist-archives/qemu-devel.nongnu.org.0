Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6C6325ED6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:23:48 +0100 (CET)
Received: from localhost ([::1]:42100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYPc-0002ZH-00
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY82-0001kl-33
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:39 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY80-00046h-7P
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:37 -0500
Received: by mail-wr1-x431.google.com with SMTP id e10so7439256wro.12
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uBJ4xrj+hJEP+gaoUps5rPIqMrLdZuVboWYAHOTV5sw=;
 b=j0IytxnOK1Utkoxhzidy9e3opkT+0djxBcPsE8dDk289h9NzzxmG4lfIioh/pP5uhl
 n3AYRc1eZAbU+lniyLmyDStg1ZzZw/wf7CPILmu0W3hJDOVSs1tN84CIzoWmoZ9dGJvt
 FTgrQ9IlkfytGszsbLGFy9DyilJcQip75aI2QgJ1UDFD3mHxtn5usC1a0wCRA2DP9mvN
 i5+hhxfc3f0HOVSkCzmCAzBa91QQ6e7yq7XzlNxXQpKd3uF7gEwzwm1XbONmk3RaRbp1
 vGlljKJpRQTybbQP5igDEyHBYtynf5blvfb+mEjfnK92VJ49MOfB7IH+rzvm52Z+KV1j
 t/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uBJ4xrj+hJEP+gaoUps5rPIqMrLdZuVboWYAHOTV5sw=;
 b=rxxZGdXJOIJxb80WBFfAOjFhaU9zrQq5UGIY5eoalSqWihcGSIU1s7eFSDI2/dshQa
 4g0hdYTzjx0hSgpmwUpCO9IbprsHRA7qu7I2RjHIN0W70LGb/wQsrKRYXdkx9/gJTmqe
 CCo4mVCu5DklGxa85nF9FT3fCxndvdcvU+VkJnQ1rWsanSsPI8SZ09J8zLmUG6RnRKm3
 9TVoFSKDJtqebPxTWwqkccK/sZ8T49f7zBCa3i3sZGcekE2JwNG3eTCQjHiUcxZVsR3D
 AhicDJhet+r1aQTRgqlJtmlkyOjJm3q2eQBLc6p+Z3pw4Ft9NjbwwbKVa2y+v9vPR0PY
 hLRw==
X-Gm-Message-State: AOAM533M3beyWDsMLhe3CaVOpQYkEpCQ7czx4YkHC1c3oDrE/Q8HFUrh
 WN5XZK8VnZAMFecrYMD0dQIHEm45IQo=
X-Google-Smtp-Source: ABdhPJwwGfswJPmKYDgOZStzGE0aGcbqpKVF7vlIhWKatEwCpqIJwpAmxabq+dcZEEz2HlqB6PBmNw==
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr1835269wri.373.1614326734366; 
 Fri, 26 Feb 2021 00:05:34 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/29] scsi: introduce scsi_sense_from_errno()
Date: Fri, 26 Feb 2021 09:05:07 +0100
Message-Id: <20210226080526.651705-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
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




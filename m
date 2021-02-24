Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F73243C4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:30:46 +0100 (CET)
Received: from localhost ([::1]:51934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEyvt-0007iU-AB
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:30:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqK-0002Jv-Rb
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:25:01 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqJ-0004mO-84
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:25:00 -0500
Received: by mail-ej1-x62d.google.com with SMTP id n20so4652956ejb.5
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=osmTk+V+aeU1VByo64kXupbvRKx+EAC0OdfK2HOG+ik=;
 b=qJttzzqFEluTgyv/dn0yBp6jSLpDd6q9aGzb6ljO3h7gQs0qqIggSRkzJ9/X9jHBSB
 rkAygw8Q6iYTaUpezaZ+iOClcmHS82mxiYUtTbTy10ZUD5pM+AXI7Iz7hjBQs4jHgHS4
 HCVxRrZ/iy7/xdwWBgihsDiHCJ6g4s4/Js7q+7MEOJ0a1jC7lCV3T8w4bA8O8WmrUGOB
 pxS/fXdnZZ9ybITPOLRiAiQeINqbWn2Qk4P+EDEgxqFz4PZyQZ3JEtOq18xhIp1od2+j
 aD4+DW+19hPD9beCpsQtdkdJWwhgaleEc7yw04c/59iOnABFYf3RYloDz4fN7XQkmMwk
 Jh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=osmTk+V+aeU1VByo64kXupbvRKx+EAC0OdfK2HOG+ik=;
 b=mOckMgqMR+8g4QJSwci9Yb4WQJnGyeKaCXkNBaCxcd7D9fQTGXm8w4iG6j3G8oHEUM
 CHWCyEhFHixvfack/zC8jo1VAEcucorR1xatF+oKfDt9cOfrPUA8VLpNKD3FFDrYC2q0
 /yeVCSBh6yAO16413G1XBJ1+KJlCOXBe6PZupl8cTlsJPVGfbRZbhWWZJU7CZDbNoumD
 Ib8aSwyE6U7/cVeuyvb/1CSsUT8YELb+UDB2J+4i4MaC/wSZeRdbKcAgmccKlq9KjUQA
 XpCryTuHcKZDbbbcTXlUgvU6/Lu35mU1sBQoO8VkF8OZceCkGAex/8Tj9+dq3MEZPjc5
 1nCg==
X-Gm-Message-State: AOAM533vJ9IxpKix8ZqDqpWmC8t8730+qTcfkT4AQ3PZMdtg35hrVdw1
 ZUNloNe3rtuvxIPHK2udq2hBHaJyunw=
X-Google-Smtp-Source: ABdhPJxQFarWTVJuU4flp5VNSfzwi0ZEmR9Kp7EGyTjAqbv0h0slc7F7KhaXQtDol7ZhNXI89vxLig==
X-Received: by 2002:a17:906:3f96:: with SMTP id
 b22mr31923202ejj.478.1614191097340; 
 Wed, 24 Feb 2021 10:24:57 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bw22sm1791172ejb.78.2021.02.24.10.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:24:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/10] scsi-disk: pass SCSI status to scsi_handle_rw_error
Date: Wed, 24 Feb 2021 19:24:47 +0100
Message-Id: <20210224182453.587731-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224182453.587731-1-pbonzini@redhat.com>
References: <20210224182453.587731-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
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

Instead of fishing it from *r->status, just pass the SCSI status
as a positive value of the second parameter and an errno as a
negative value.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 9c6099ffc4..548a5297fa 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -187,34 +187,48 @@ static void scsi_disk_load_request(QEMUFile *f, SCSIRequest *req)
  * scsi_handle_rw_error always manages its reference counts, independent
  * of the return value.
  */
-static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
+static bool scsi_handle_rw_error(SCSIDiskReq *r, int ret, bool acct_failed)
 {
     bool is_read = (r->req.cmd.mode == SCSI_XFER_FROM_DEV);
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
     SCSIDiskClass *sdc = (SCSIDiskClass *) object_get_class(OBJECT(s));
-    BlockErrorAction action = blk_get_error_action(s->qdev.conf.blk,
-                                                   is_read, error);
-    SCSISense sense;
+    SCSISense sense = SENSE_CODE(NO_SENSE);
+    int error = 0;
+    bool req_has_sense = false;
+    BlockErrorAction action;
+    int status;
 
+    if (ret < 0) {
+        status = scsi_sense_from_errno(-ret, &sense);
+        error = -ret;
+    } else {
+        /* A passthrough command has completed with nonzero status.  */
+        status = ret;
+        if (status == CHECK_CONDITION) {
+            req_has_sense = true;
+            error = scsi_sense_buf_to_errno(r->req.sense, sizeof(r->req.sense));
+        } else {
+            error = EINVAL;
+        }
+    }
+
+    action = blk_get_error_action(s->qdev.conf.blk, is_read, error);
     if (action == BLOCK_ERROR_ACTION_REPORT) {
         if (acct_failed) {
             block_acct_failed(blk_get_stats(s->qdev.conf.blk), &r->acct);
         }
-        if (error == 0) {
+        if (req_has_sense) {
             /* A passthrough command has run and has produced sense data; check
              * whether the error has to be handled by the guest or should rather
              * pause the host.
              */
-            assert(r->status && *r->status);
             if (scsi_sense_buf_is_guest_recoverable(r->req.sense, sizeof(r->req.sense))) {
                 /* These errors are handled by guest. */
                 sdc->update_sense(&r->req);
-                scsi_req_complete(&r->req, *r->status);
+                scsi_req_complete(&r->req, status);
                 return true;
             }
-            error = scsi_sense_buf_to_errno(r->req.sense, sizeof(r->req.sense));
         } else {
-            int status = scsi_sense_from_errno(error, &sense);
             if (status == CHECK_CONDITION) {
                 scsi_req_build_sense(&r->req, sense);
             }
@@ -240,8 +254,10 @@ static bool scsi_disk_req_check_error(SCSIDiskReq *r, int ret, bool acct_failed)
         return true;
     }
 
-    if (ret < 0 || (r->status && *r->status)) {
-        return scsi_handle_rw_error(r, -ret, acct_failed);
+    if (ret < 0) {
+        return scsi_handle_rw_error(r, ret, acct_failed);
+    } else if (r->status && *r->status) {
+        return scsi_handle_rw_error(r, *r->status, acct_failed);
     }
 
     return false;
-- 
2.29.2




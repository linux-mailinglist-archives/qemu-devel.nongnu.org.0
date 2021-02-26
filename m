Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051E2325EC2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:17:04 +0100 (CET)
Received: from localhost ([::1]:53628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYJ4-0003mX-V7
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY82-0001km-F4
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:39 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY80-00046r-D6
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:38 -0500
Received: by mail-wm1-x32b.google.com with SMTP id m1so6963726wml.2
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=osmTk+V+aeU1VByo64kXupbvRKx+EAC0OdfK2HOG+ik=;
 b=Be0HZ6fAKzIzPFyEL8F9PLE+gWInqR5l3FG9mtlz32zoIYCSNspELF3YayRkO6GS7k
 dmcJZba4/Gy7v7CbNSnxYvg/9LSPWoEjqaPcW2HCQFIhQWi5QH1XeYM5XFimfVlWC9yI
 Ifai2LY+toXZzFWwmIMw5AU1nysWGv8N1kx1K2XyEbylzGGrrXcbou2/9cWFDsHJ+VdC
 vPvJKVxtgBYiKzHaALZCqAA/WWSxYBmdZzOkzXzyEz6u+p3Fv1AfQX7HysAN6TW+MRDw
 SCksFHRae3hP7mGSLU0Jnb/wYqVZk5RhufSWuckjk4EnMmLyJ8Nre3Ut/MaVjdhgLcDG
 7Ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=osmTk+V+aeU1VByo64kXupbvRKx+EAC0OdfK2HOG+ik=;
 b=hZAUsj3KZTZcntYuBR0mZkefAhO8rruqsrmsnKF9QPiUbfPbJ1sdp+/XKLL+VbSDlE
 q8aRyszT/myufZXKGbnn8Pv/gehDWtzGf58we/QogdWoGcKiRNwUH53ta7kPtRlPL2vw
 ZN/DX3PmGGo4ExW6ZWxv9UConW2kNErmYJP1PwCfr0QxyrhZHF5oHYIrNW/73qls4BXn
 QLG76QY6BBdfO/RjM//gLODYQUmP+nxdZFMy0be9GRny7sVRHlmKEptko+8M2rg9LvNl
 hdrOjiFlG/ITSmH4ovHWtbzlcpv2nP2kzjl6Um0P9Gq4FAMY6O710y58hNFNzce96xFP
 fhZQ==
X-Gm-Message-State: AOAM53132yoCrBKsB2yqQGrQ/OFa+JVeaF3alTXcunLznYPuY+ZR94mu
 AwSi1aLhyUWZyTnsLOKjiW3PwmEblYc=
X-Google-Smtp-Source: ABdhPJzv94AJpuz7ZBOmEn2gAj+YR3i1V8H2b2qKZp0T3Y9ckEsWczSVZLfIXouaz9hG0XLIHxy9PQ==
X-Received: by 2002:a7b:c5d0:: with SMTP id n16mr1520437wmk.27.1614326735023; 
 Fri, 26 Feb 2021 00:05:35 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/29] scsi-disk: pass SCSI status to scsi_handle_rw_error
Date: Fri, 26 Feb 2021 09:05:08 +0100
Message-Id: <20210226080526.651705-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
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




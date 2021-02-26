Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF5A325EB4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:15:07 +0100 (CET)
Received: from localhost ([::1]:50460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYHC-0002Sk-FU
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY85-0001nT-9W
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:43 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY81-00047W-1T
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:39 -0500
Received: by mail-wm1-x331.google.com with SMTP id u187so4748368wmg.4
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ycz7tMt4XNpb7H0VgGp30K9fstHZJN03neY0qoiIQu0=;
 b=EpzvkFknQfEv4DPn+lmkVVsuscXs0RhCx0aLXB+w9UP5J7YyrdAjEwT1aWghYXYPGe
 grlOxXmKBKhKs1NkoSt9j3b11epk0T8unzb4ns+80KDEB5Wn8fWrTpteQ3dlGgCqIFts
 kWlSQI1PM3ygMQDXtKXjFgZUhmbZU/kEWRtGNGZP9Qetzv9bACqJ9OvilkIhkp1H/Ki5
 BIh5CKq0qq+dLR9nNpRbXrH+xtIrXBjVFtUqVSAViBK3kIR7+Kti79MkJlHWUPaSrdV8
 jF3FiSLgpG9zDxEsnGKMYtQvPz3JVUwHofm/f29TCC0LDFl5H1eo/gD1/62wwMOn+0Pq
 3oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ycz7tMt4XNpb7H0VgGp30K9fstHZJN03neY0qoiIQu0=;
 b=V8OMDsN6dumdWqbb/MSBLEk2vgXi1ZPZQJFbyuyDlLcx9HP5gfvHB5Bylt+gyIS51F
 IgFulzLQxm+tnXtm1NwjbRf2oRoMgS/nqcHJA6f+uOPN39F5dSQ04nbgQwBxg2pVBVPn
 2E/qhrpvlTOJUz6gV0jaSpAHdJW/f30kDV47JUIzHKi7AgIJKKf3pBU0YDCz2U4k2zXr
 Ei3XpFby6AcYCII6OqPVei2M53GM81RGRANEgAd/kRIBOodHvFyx8MU837TKBVkSYZWh
 xaHubPW1749FbvGUJ5v5iLka4IT05LGBoo2dGafWVgtCU+cf/35hiZFuSDSrLvwgtUE5
 QNHQ==
X-Gm-Message-State: AOAM533VrR/GOB6ofNJxHJYPFJ/TTT5FW8xyInZSO00cPeNA+DAr6I3y
 FbDVV5Z1riICSWL/hHQ5NBZVTsSK6TA=
X-Google-Smtp-Source: ABdhPJzKQaFJD/90C9sL+u9QbRQ/BJBop87yx0fBYvmRa6k88XQZwA2QxPXgnTmW4T6HvimAaK4Fkg==
X-Received: by 2002:a1c:7fd8:: with SMTP id a207mr1523374wmd.40.1614326735610; 
 Fri, 26 Feb 2021 00:05:35 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/29] scsi-disk: pass guest recoverable errors through even
 for rerror=stop
Date: Fri, 26 Feb 2021 09:05:09 +0100
Message-Id: <20210226080526.651705-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
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

Right now, recoverable sense values are only passed directly to the
guest only for rerror=report.  However, when rerror/werror are 'stop'
we still don't want the host to be involved on every UNIT ATTENTION
(especially considered that the QMP event will not have enough information
to act on the report).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c | 51 +++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 548a5297fa..a5a58d7db3 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -212,39 +212,44 @@ static bool scsi_handle_rw_error(SCSIDiskReq *r, int ret, bool acct_failed)
         }
     }
 
-    action = blk_get_error_action(s->qdev.conf.blk, is_read, error);
-    if (action == BLOCK_ERROR_ACTION_REPORT) {
+    /*
+     * Check whether the error has to be handled by the guest or should
+     * rather follow the rerror=/werror= settings.  Guest-handled errors
+     * are usually retried immediately, so do not post them to QMP and
+     * do not account them as failed I/O.
+     */
+    if (req_has_sense &&
+        scsi_sense_buf_is_guest_recoverable(r->req.sense, sizeof(r->req.sense))) {
+        action = BLOCK_ERROR_ACTION_REPORT;
+        acct_failed = false;
+    } else {
+        action = blk_get_error_action(s->qdev.conf.blk, is_read, error);
+        blk_error_action(s->qdev.conf.blk, action, is_read, error);
+    }
+
+    switch (action) {
+    case BLOCK_ERROR_ACTION_REPORT:
         if (acct_failed) {
             block_acct_failed(blk_get_stats(s->qdev.conf.blk), &r->acct);
         }
         if (req_has_sense) {
-            /* A passthrough command has run and has produced sense data; check
-             * whether the error has to be handled by the guest or should rather
-             * pause the host.
-             */
-            if (scsi_sense_buf_is_guest_recoverable(r->req.sense, sizeof(r->req.sense))) {
-                /* These errors are handled by guest. */
-                sdc->update_sense(&r->req);
-                scsi_req_complete(&r->req, status);
-                return true;
-            }
-        } else {
-            if (status == CHECK_CONDITION) {
-                scsi_req_build_sense(&r->req, sense);
-            }
-            scsi_req_complete(&r->req, status);
+            sdc->update_sense(&r->req);
+        } else if (status == CHECK_CONDITION) {
+            scsi_req_build_sense(&r->req, sense);
         }
-    }
+        scsi_req_complete(&r->req, status);
+        return true;
 
-    blk_error_action(s->qdev.conf.blk, action, is_read, error);
-    if (action == BLOCK_ERROR_ACTION_IGNORE) {
+    case BLOCK_ERROR_ACTION_IGNORE:
         return false;
-    }
 
-    if (action == BLOCK_ERROR_ACTION_STOP) {
+    case BLOCK_ERROR_ACTION_STOP:
         scsi_req_retry(&r->req);
+        return true;
+
+    default:
+        g_assert_not_reached();
     }
-    return true;
 }
 
 static bool scsi_disk_req_check_error(SCSIDiskReq *r, int ret, bool acct_failed)
-- 
2.29.2




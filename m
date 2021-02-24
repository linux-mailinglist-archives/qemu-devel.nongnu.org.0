Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BED3243B9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:27:08 +0100 (CET)
Received: from localhost ([::1]:43474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEysM-00044G-QU
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:27:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqK-0002Jw-TF
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:25:01 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqJ-0004nC-Eq
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:25:00 -0500
Received: by mail-ej1-x631.google.com with SMTP id n20so4653010ejb.5
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ycz7tMt4XNpb7H0VgGp30K9fstHZJN03neY0qoiIQu0=;
 b=crukes+yM1ufCdPtlzg9crJRQa3WJh6bUxjcglPCiQXqOpAujXGTvyOucfkyDX3+2z
 HYHOpAFSgtYxFhqhTxIZSRkI4X0+MCOHEy7aVa3dVISj79kDiFyJUAexh+QV4/Buvpsu
 rS+b1DYX455p1Do6rAKWKlkzsSfaTL4T4mWwWZ87pTY0Tf4RR1s+l/oaXSOslVyOm/Nz
 269RC6xzWJM2gntpDVnO8MEqKMYNH9mFBN/0jpyFn1YnfUi5mB7R8VnWEs4K0nW61eWt
 egEHtgWZ0ViRpdSGaCJ7+Uzg6bd+s3y8Mp2QlglrrCAmbRGchLEJq2QrAyKXDhJguaJN
 L+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ycz7tMt4XNpb7H0VgGp30K9fstHZJN03neY0qoiIQu0=;
 b=Cc3wVo/hQDpajVr4SNFMED4vRZrQvLDLOy4Ds/tQCv7U8U1Jny/EqKDjBzgjc2I4qk
 2cCD48VmXuCWIwQ9ZXdCSBZCcO5ilDj1jJjrBCOxsn020NGY34gG78Ty7JGQg6k7o5KV
 9WOXWNfCOdGJoXrZ8CEWs2unHrQYdUXcpXvRh4BuWFPKbPqYyRocorRfgCXtD9aUDHrl
 4DPQE6mznvXJ3jXvaGAPh4fOrSwTZ9A/M6qWN1RxtgrAm1FtJFaOqj53XzWBTTB2RPr6
 MaG0WEnm8h33URwEZopfGrA5VzLzaZ/fWP6usU4EGw4/R4t5wmyn8iB81Erp5/SG8FSM
 5sHA==
X-Gm-Message-State: AOAM531hYtPbCmEYxynx70re6xZW9TLYzs4Hwe8uWTPo9iut3EizA4RK
 MbGL+EE0jszReqMu/+moB3OSg+n2iHI=
X-Google-Smtp-Source: ABdhPJxrp+nlp19W3TA//UrYOzwCdUUXLilUYbu0fLS7lrTaDE3BwwSHiR+zzWK9YvMbVfexCZypYw==
X-Received: by 2002:a17:907:3d8d:: with SMTP id
 he13mr30651501ejc.448.1614191098106; 
 Wed, 24 Feb 2021 10:24:58 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bw22sm1791172ejb.78.2021.02.24.10.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:24:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/10] scsi-disk: pass guest recoverable errors through even
 for rerror=stop
Date: Wed, 24 Feb 2021 19:24:48 +0100
Message-Id: <20210224182453.587731-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224182453.587731-1-pbonzini@redhat.com>
References: <20210224182453.587731-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
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




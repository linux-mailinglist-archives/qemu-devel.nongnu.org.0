Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AD330FB0A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:18:07 +0100 (CET)
Received: from localhost ([::1]:49450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jCg-00034z-HM
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:18:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIj-00084k-0k
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIW-0005iI-9x
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9FGDJT8xxA3Typ1TVt/j5JdWTpbcLQ/bYcuvLz+xDw=;
 b=VGPSw0c9vaVyVAU1U3ppEvUEomHdIAWViJF3MUQxwMYpWD1XYINAXdK9EcOTIa86anKBSA
 /worukt4osfCleRXKJKcDTS9wvva1s56waXUd+dgqatCagOglVCF66t1mMpCkNvd2qSpgO
 yUS01rUxNY38zzDUiRtuwGo4fl0bn7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-2H_ekr6EMs-m08GHw5aeHw-1; Thu, 04 Feb 2021 12:20:01 -0500
X-MC-Unique: 2H_ekr6EMs-m08GHw5aeHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 361F6100C663;
 Thu,  4 Feb 2021 17:20:00 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 048F360CCF;
 Thu,  4 Feb 2021 17:19:58 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/33] migration: push Error **errp into
 qemu_savevm_state_complete_precopy()
Date: Thu,  4 Feb 2021 17:19:01 +0000
Message-Id: <20210204171907.901471-28-berrange@redhat.com>
In-Reply-To: <20210204171907.901471-1-berrange@redhat.com>
References: <20210204171907.901471-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an incremental step in converting vmstate loading code to report
via Error objects instead of printing directly to the console/monitor.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/migration.c | 14 +++++++++++---
 migration/savevm.c    | 18 +++++++++++-------
 migration/savevm.h    |  3 ++-
 3 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index e814d47796..2ccb1b66b5 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2845,7 +2845,11 @@ static int postcopy_start(MigrationState *ms)
      * Cause any non-postcopiable, but iterative devices to
      * send out their final data.
      */
-    qemu_savevm_state_complete_precopy(ms->to_dst_file, true, false);
+    if (qemu_savevm_state_complete_precopy(ms->to_dst_file, true, false,
+                                           &local_err) < 0) {
+        error_report_err(local_err);
+        goto fail;
+    }
 
     /*
      * in Finish migrate and with the io-lock held everything should
@@ -2898,7 +2902,10 @@ static int postcopy_start(MigrationState *ms)
      */
     qemu_savevm_send_postcopy_listen(fb);
 
-    qemu_savevm_state_complete_precopy(fb, false, false);
+    if (qemu_savevm_state_complete_precopy(fb, false, false, &local_err) < 0) {
+        error_report_err(local_err);
+        goto fail_closefb;
+    }
     if (migrate_postcopy_ram()) {
         qemu_savevm_send_ping(fb, 3);
     }
@@ -3049,7 +3056,8 @@ static void migration_completion(MigrationState *s)
             if (ret >= 0) {
                 qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
                 ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
-                                                         inactivate);
+                                                         inactivate,
+                                                         &local_err);
             }
             if (inactivate && ret >= 0) {
                 s->block_inactive = true;
diff --git a/migration/savevm.c b/migration/savevm.c
index 95e228a646..d6c36e6b6b 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1441,7 +1441,8 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
 }
 
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
-                                       bool inactivate_disks)
+                                       bool inactivate_disks,
+                                       Error **errp)
 {
     Error *local_err = NULL;
     bool in_postcopy = migration_in_postcopy();
@@ -1456,8 +1457,7 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
 
     if (!in_postcopy || iterable_only) {
         if (qemu_savevm_state_complete_precopy_iterable(f, in_postcopy,
-                                                        &local_err) < 0) {
-            error_report_err(local_err);
+                                                        errp) < 0) {
             return -1;
         }
     }
@@ -1468,8 +1468,7 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
 
     if (qemu_savevm_state_complete_precopy_non_iterable(f, in_postcopy,
                                                         inactivate_disks,
-                                                        &local_err) < 0) {
-        error_report_err(local_err);
+                                                        errp) < 0) {
         return -1;
     }
 
@@ -1568,7 +1567,9 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
         }
     }
 
-    qemu_savevm_state_complete_precopy(f, false, false);
+    if (qemu_savevm_state_complete_precopy(f, false, false, errp) < 0) {
+        goto fail;
+    }
     ret = qemu_file_get_error(f);
     if (ret != 0) {
         error_setg_errno(errp, -ret, "Error while writing VM state");
@@ -1594,8 +1595,11 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
 
 void qemu_savevm_live_state(QEMUFile *f)
 {
+    Error *local_err = NULL;
     /* save QEMU_VM_SECTION_END section */
-    qemu_savevm_state_complete_precopy(f, true, false);
+    if (qemu_savevm_state_complete_precopy(f, true, false, &local_err) < 0) {
+        error_report_err(local_err);
+    }
     qemu_put_byte(f, QEMU_VM_EOF);
 }
 
diff --git a/migration/savevm.h b/migration/savevm.h
index b7133655f2..e3120a4fb0 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -38,7 +38,8 @@ int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy, Error **errp);
 void qemu_savevm_state_cleanup(void);
 void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
-                                       bool inactivate_disks);
+                                       bool inactivate_disks,
+                                       Error **errp);
 void qemu_savevm_state_pending(QEMUFile *f, uint64_t max_size,
                                uint64_t *res_precopy_only,
                                uint64_t *res_compatible,
-- 
2.29.2



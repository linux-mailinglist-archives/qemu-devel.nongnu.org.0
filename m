Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C2D30FB4A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:26:51 +0100 (CET)
Received: from localhost ([::1]:51706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jL8-0001B7-04
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIj-00084q-1n
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIf-0005kc-5A
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+++6PTcE5kGIUZdCuVpIW6sYzr/KHV4BF+Goa0QGgk=;
 b=PfBuj1oeg7Yvx3CwJwHtEuAijkRPJpXLcQVrKOBkhknEN8BS8/DoClx3JYf264kpAfxTd6
 fQ+J0K6iHzOWoHIbwejd1+XufEScoTvQNYYmFSCL8EQCC5hV9uv3Eho8fUTgchaPYXQmKU
 Ht/FJuyn1wr7FGYG37a2zdFbzdxMe/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-8ZyeGWu_N56wA-Ze7ZhvsA-1; Thu, 04 Feb 2021 12:20:09 -0500
X-MC-Unique: 8ZyeGWu_N56wA-Ze7ZhvsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2CA7107ACF4;
 Thu,  4 Feb 2021 17:20:08 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEF3360C05;
 Thu,  4 Feb 2021 17:20:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/33] migration: push Error **errp into
 qemu_savevm_state_resume_prepare()
Date: Thu,  4 Feb 2021 17:19:05 +0000
Message-Id: <20210204171907.901471-32-berrange@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 migration/migration.c | 9 ++++-----
 migration/savevm.c    | 5 +++--
 migration/savevm.h    | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 984276d066..3f0586842d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3165,16 +3165,15 @@ static int postcopy_resume_handshake(MigrationState *s)
 static int postcopy_do_resume(MigrationState *s)
 {
     int ret;
+    Error *local_err = NULL;
 
     /*
      * Call all the resume_prepare() hooks, so that modules can be
      * ready for the migration resume.
      */
-    ret = qemu_savevm_state_resume_prepare(s);
-    if (ret) {
-        error_report("%s: resume_prepare() failure detected: %d",
-                     __func__, ret);
-        return ret;
+    if (qemu_savevm_state_resume_prepare(s, &local_err) < 0) {
+        error_report_err(local_err);
+        return -1;
     }
 
     /*
diff --git a/migration/savevm.c b/migration/savevm.c
index 994a7c7dab..1d9790aa5b 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1194,7 +1194,7 @@ int qemu_savevm_state_setup(QEMUFile *f, Error **errp)
     return 0;
 }
 
-int qemu_savevm_state_resume_prepare(MigrationState *s)
+int qemu_savevm_state_resume_prepare(MigrationState *s, Error **errp)
 {
     SaveStateEntry *se;
     int ret;
@@ -1212,7 +1212,8 @@ int qemu_savevm_state_resume_prepare(MigrationState *s)
         }
         ret = se->ops->resume_prepare(s, se->opaque);
         if (ret < 0) {
-            return ret;
+            error_setg_errno(errp, -ret, "failed state resume prepare");
+            return -1;
         }
     }
 
diff --git a/migration/savevm.h b/migration/savevm.h
index a91e097b51..b0c40e38a7 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -32,7 +32,7 @@
 bool qemu_savevm_state_blocked(Error **errp);
 int qemu_savevm_state_setup(QEMUFile *f, Error **errp);
 bool qemu_savevm_state_guest_unplug_pending(void);
-int qemu_savevm_state_resume_prepare(MigrationState *s);
+int qemu_savevm_state_resume_prepare(MigrationState *s, Error **errp);
 void qemu_savevm_state_header(QEMUFile *f);
 int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy, Error **errp);
 void qemu_savevm_state_cleanup(void);
-- 
2.29.2



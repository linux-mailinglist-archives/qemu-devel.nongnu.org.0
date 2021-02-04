Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6560230FA8E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:04:58 +0100 (CET)
Received: from localhost ([::1]:43634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7izx-0004Hv-EN
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIM-0007xI-V5
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIG-0005Y1-MD
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVnyVp/vXRoX3fMFu47nHwcn1eIO/EtcAZZzD8t+gEU=;
 b=LZf1VV7s330SQclaAnKFWmyMi9xKDvJlRYUKOUJYinPhNm0eGuGgzr9Jdhrf23LXnvivbt
 EmrnBBNtBOd1fA0e2qUZyfZR+qm0Zf7JagAtHt1R6RVn0uXuaobl1+PbhXrX9CQtO4j87R
 QP7z9usDrXYgpHvYSWO8V4uBeQBAX4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-R2JjpCv_NYOTFKFQ8BNXcQ-1; Thu, 04 Feb 2021 12:19:46 -0500
X-MC-Unique: R2JjpCv_NYOTFKFQ8BNXcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F64B1936B60;
 Thu,  4 Feb 2021 17:19:45 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A2D460937;
 Thu,  4 Feb 2021 17:19:44 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/33] migration: push Error **errp into
 loadvm_process_enable_colo()
Date: Thu,  4 Feb 2021 17:18:51 +0000
Message-Id: <20210204171907.901471-18-berrange@redhat.com>
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
 include/migration/colo.h |  2 +-
 migration/migration.c    |  6 +++---
 migration/savevm.c       | 25 +++++++++++--------------
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/include/migration/colo.h b/include/migration/colo.h
index 768e1f04c3..1d38191360 100644
--- a/include/migration/colo.h
+++ b/include/migration/colo.h
@@ -25,7 +25,7 @@ void migrate_start_colo_process(MigrationState *s);
 bool migration_in_colo_state(void);
 
 /* loadvm */
-int migration_incoming_enable_colo(void);
+int migration_incoming_enable_colo(Error **errp);
 void migration_incoming_disable_colo(void);
 bool migration_incoming_colo_enabled(void);
 void *colo_process_incoming_thread(void *opaque);
diff --git a/migration/migration.c b/migration/migration.c
index 287a18d269..b9cf56e61f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -397,11 +397,11 @@ void migration_incoming_disable_colo(void)
     migration_colo_enabled = false;
 }
 
-int migration_incoming_enable_colo(void)
+int migration_incoming_enable_colo(Error **errp)
 {
     if (ram_block_discard_disable(true)) {
-        error_report("COLO: cannot disable RAM discard");
-        return -EBUSY;
+        error_setg(errp, "COLO: cannot disable RAM discard");
+        return -1;
     }
     migration_colo_enabled = true;
     return 0;
diff --git a/migration/savevm.c b/migration/savevm.c
index b41c812188..c59e76b478 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2212,15 +2212,18 @@ static int loadvm_handle_recv_bitmap(MigrationIncomingState *mis,
     return 0;
 }
 
-static int loadvm_process_enable_colo(MigrationIncomingState *mis)
+static int loadvm_process_enable_colo(MigrationIncomingState *mis,
+                                      Error **errp)
 {
-    int ret = migration_incoming_enable_colo();
+    int ret;
+    if (migration_incoming_enable_colo(errp) < 0) {
+        return -1;
+    }
 
-    if (!ret) {
-        ret = colo_init_ram_cache();
-        if (ret) {
-            migration_incoming_disable_colo();
-        }
+    ret = colo_init_ram_cache();
+    if (ret < 0) {
+        error_setg(errp, "failed to init colo RAM cache: %d", ret);
+        migration_incoming_disable_colo();
     }
     return ret;
 }
@@ -2237,7 +2240,6 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
     uint16_t cmd;
     uint16_t len;
     uint32_t tmp32;
-    int ret;
 
     cmd = qemu_get_be16(f);
     len = qemu_get_be16(f);
@@ -2310,12 +2312,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return loadvm_handle_recv_bitmap(mis, len, errp);
 
     case MIG_CMD_ENABLE_COLO:
-        ret = loadvm_process_enable_colo(mis);
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-            return -1;
-        }
-        return ret;
+        return loadvm_process_enable_colo(mis, errp);
     }
 
     return 0;
-- 
2.29.2



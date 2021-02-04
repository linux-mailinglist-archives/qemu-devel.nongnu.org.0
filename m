Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2EB30FB05
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:17:33 +0100 (CET)
Received: from localhost ([::1]:47366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jC8-0001kx-A8
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIO-0007xf-S3
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iII-0005YV-Qa
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M29iw9EwaSJdHA7JeLk49yI25blrZMRw6chRaT4FUkI=;
 b=EEZT9xIu5gIIhG5PYM/LeDz8kQkFEVH6j6Xs6NRhFKJbe9syk032ySySMZps/CR9MhQHEt
 eJBAVKV6Od4m4V3pLmxeZ+KwwBkbIiomwKfie5mOfUo+VcJ2WzkMvuxvB1YwvCwPfcgG7n
 1tLKJlz6ItdHbNkA+MHdpMKveLBU6Dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-DLBzBDtzMMSEH49cohLM_A-1; Thu, 04 Feb 2021 12:19:47 -0500
X-MC-Unique: DLBzBDtzMMSEH49cohLM_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D25AA107ACC7;
 Thu,  4 Feb 2021 17:19:46 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAA9A60937;
 Thu,  4 Feb 2021 17:19:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/33] migration: push Error **errp into colo_init_ram_cache()
Date: Thu,  4 Feb 2021 17:18:52 +0000
Message-Id: <20210204171907.901471-19-berrange@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 migration/ram.c    | 11 ++++++-----
 migration/ram.h    |  2 +-
 migration/savevm.c |  8 +++-----
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index f6180e8f4f..0b8c5f3c86 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3028,7 +3028,7 @@ static void colo_init_ram_state(void)
  * memory of the secondary VM, it is need to hold the global lock
  * to call this helper.
  */
-int colo_init_ram_cache(void)
+int colo_init_ram_cache(Error **errp)
 {
     RAMBlock *block;
 
@@ -3038,16 +3038,17 @@ int colo_init_ram_cache(void)
                                                     NULL,
                                                     false);
             if (!block->colo_cache) {
-                error_report("%s: Can't alloc memory for COLO cache of block %s,"
-                             "size 0x" RAM_ADDR_FMT, __func__, block->idstr,
-                             block->used_length);
+                error_setg_errno(errp, errno,
+                                 "%s: Can't alloc memory for COLO cache of block %s,"
+                                 "size 0x" RAM_ADDR_FMT, __func__, block->idstr,
+                                 block->used_length);
                 RAMBLOCK_FOREACH_NOT_IGNORED(block) {
                     if (block->colo_cache) {
                         qemu_anon_ram_free(block->colo_cache, block->used_length);
                         block->colo_cache = NULL;
                     }
                 }
-                return -errno;
+                return -1;
             }
         }
     }
diff --git a/migration/ram.h b/migration/ram.h
index 1cea36ba51..88b0b6636b 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -74,7 +74,7 @@ int64_t ramblock_recv_bitmap_send(QEMUFile *file,
 int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *rb);
 
 /* ram cache */
-int colo_init_ram_cache(void);
+int colo_init_ram_cache(Error **errp);
 void colo_flush_ram_cache(void);
 void colo_release_ram_cache(void);
 void colo_incoming_start_dirty_log(void);
diff --git a/migration/savevm.c b/migration/savevm.c
index c59e76b478..ace76e32f7 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2215,17 +2215,15 @@ static int loadvm_handle_recv_bitmap(MigrationIncomingState *mis,
 static int loadvm_process_enable_colo(MigrationIncomingState *mis,
                                       Error **errp)
 {
-    int ret;
     if (migration_incoming_enable_colo(errp) < 0) {
         return -1;
     }
 
-    ret = colo_init_ram_cache();
-    if (ret < 0) {
-        error_setg(errp, "failed to init colo RAM cache: %d", ret);
+    if (colo_init_ram_cache(errp) < 0) {
         migration_incoming_disable_colo();
+        return -1;
     }
-    return ret;
+    return 0;
 }
 
 /*
-- 
2.29.2



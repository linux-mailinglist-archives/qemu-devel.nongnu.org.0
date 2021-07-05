Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E057F3BBAC7
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:05:22 +0200 (CEST)
Received: from localhost ([::1]:35208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LTd-0003Wa-UT
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LRu-0000hR-Qb
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:03:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LRl-00012w-2p
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625479403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C6Mj+rinVIX7Eq3M97XvTePIm+MUp2suc069axeUI8M=;
 b=Zm4BXtCeyyGo50yx3RwR0HYrcmgI2TD/I7uH+nQhIW9wM5NsccznpNWLNSD6CmBcgi7FAF
 pmvnlRxoQq0pSpCldKPF9U0/1pvdRCuJbZmFhZ05EXpnb6AXOp/tPZY4rRjFYkVK7CFfA1
 rjge7YrkROOOKn1FC9kTFmPK/0fHMeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-kvul9w8AOISQ-ASJ1H_ZWw-1; Mon, 05 Jul 2021 06:03:22 -0400
X-MC-Unique: kvul9w8AOISQ-ASJ1H_ZWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AAE280430C;
 Mon,  5 Jul 2021 10:03:21 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-11.ams2.redhat.com
 [10.36.114.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBF7060C0F;
 Mon,  5 Jul 2021 10:03:18 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 05/19] migration: move wait-unplug loop to its own function
Date: Mon,  5 Jul 2021 11:02:21 +0100
Message-Id: <20210705100235.157093-6-dgilbert@redhat.com>
In-Reply-To: <20210705100235.157093-1-dgilbert@redhat.com>
References: <20210705100235.157093-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: leobras@redhat.com, stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

The loop is used in migration_thread() and bg_migration_thread(),
so we can move it to its own function and call it from these both places.

Moreover, in migration_thread() we have a wrong state transition from
SETUP to ACTIVE while state could be WAIT_UNPLUG. This is correctly
managed in bg_migration_thread() so use this code instead.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20210629155007.629086-2-lvivier@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 54 +++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index fcca289ef7..dbc484c802 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3676,6 +3676,28 @@ bool migration_rate_limit(void)
     return urgent;
 }
 
+/*
+ * if failover devices are present, wait they are completely
+ * unplugged
+ */
+
+static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
+                                    int new_state)
+{
+    if (qemu_savevm_state_guest_unplug_pending()) {
+        migrate_set_state(&s->state, old_state, MIGRATION_STATUS_WAIT_UNPLUG);
+
+        while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
+               qemu_savevm_state_guest_unplug_pending()) {
+            qemu_sem_timedwait(&s->wait_unplug_sem, 250);
+        }
+
+        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG, new_state);
+    } else {
+        migrate_set_state(&s->state, old_state, new_state);
+    }
+}
+
 /*
  * Master migration thread on the source VM.
  * It drives the migration and pumps the data down the outgoing channel.
@@ -3722,22 +3744,10 @@ static void *migration_thread(void *opaque)
 
     qemu_savevm_state_setup(s->to_dst_file);
 
-    if (qemu_savevm_state_guest_unplug_pending()) {
-        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
-                          MIGRATION_STATUS_WAIT_UNPLUG);
-
-        while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
-               qemu_savevm_state_guest_unplug_pending()) {
-            qemu_sem_timedwait(&s->wait_unplug_sem, 250);
-        }
-
-        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG,
-                MIGRATION_STATUS_ACTIVE);
-    }
+    qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
+                               MIGRATION_STATUS_ACTIVE);
 
     s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
-    migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
-                      MIGRATION_STATUS_ACTIVE);
 
     trace_migration_thread_setup_complete();
 
@@ -3845,21 +3855,9 @@ static void *bg_migration_thread(void *opaque)
     qemu_savevm_state_header(s->to_dst_file);
     qemu_savevm_state_setup(s->to_dst_file);
 
-    if (qemu_savevm_state_guest_unplug_pending()) {
-        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
-                          MIGRATION_STATUS_WAIT_UNPLUG);
-
-        while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
-               qemu_savevm_state_guest_unplug_pending()) {
-            qemu_sem_timedwait(&s->wait_unplug_sem, 250);
-        }
+    qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
+                               MIGRATION_STATUS_ACTIVE);
 
-        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG,
-                          MIGRATION_STATUS_ACTIVE);
-    } else {
-        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
-                MIGRATION_STATUS_ACTIVE);
-    }
     s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
 
     trace_migration_thread_setup_complete();
-- 
2.31.1



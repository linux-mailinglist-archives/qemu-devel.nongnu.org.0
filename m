Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C8A3B75EB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:54:46 +0200 (CEST)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyG4S-0002tZ-BU
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lyG0G-0007Jz-Ji
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lyG0E-0003J6-Uq
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624981822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67BVItjkRky02dYvHDGDRBHVMg3pEEnoQHXoR5F7lXg=;
 b=MxFicU/VEONS4xxd8IBZViwhiE5C+e7aGE4i+wOL3P28EM91UNsTkXUcxecQdXvOSd7Aon
 OnrwNR+g1Z4y5LqCJiniA4ra8rvuRm7Y+MqVReFuYzoFMWYHbEaFv5oST5kq3gFfeLnFKG
 FGNbPyP8eeZg8BPnh7c1NyrPrLw/n98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-RQcziAdiNEiFy4egQCpyAA-1; Tue, 29 Jun 2021 11:50:18 -0400
X-MC-Unique: RQcziAdiNEiFy4egQCpyAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBE6C801B30
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 15:50:17 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-114-217.ams2.redhat.com
 [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56CBF60854;
 Tue, 29 Jun 2021 15:50:16 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] migration: move wait-unplug loop to its own function
Date: Tue, 29 Jun 2021 17:50:06 +0200
Message-Id: <20210629155007.629086-2-lvivier@redhat.com>
In-Reply-To: <20210629155007.629086-1-lvivier@redhat.com>
References: <20210629155007.629086-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Jens Freimann <jfreimann@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The loop is used in migration_thread() and bg_migration_thread(),
so we can move it to its own function and call it from these both places.

Moreover, in migration_thread() we have a wrong state transition from
SETUP to ACTIVE while state could be WAIT_UNPLUG. This is correctly
managed in bg_migration_thread() so use this code instead.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 migration/migration.c | 54 +++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 4228635d1880..3e92c405a2b6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3664,6 +3664,28 @@ bool migration_rate_limit(void)
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
@@ -3710,22 +3732,10 @@ static void *migration_thread(void *opaque)
 
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
 
@@ -3833,21 +3843,9 @@ static void *bg_migration_thread(void *opaque)
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



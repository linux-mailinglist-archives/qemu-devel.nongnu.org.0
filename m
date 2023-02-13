Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0268969409A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:16:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRUwP-0000TL-1Z; Mon, 13 Feb 2023 04:16:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRUwM-0000T4-Mu
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:16:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRUwJ-0001EO-Ev
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676279758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9biWkcJ8ni5cexIWnW8T5++bGq3zkW5jWZHX1F+Gu7I=;
 b=YxWxzt7WpX1PbMmz06vyam2SQO9P+C0+nSl4E1S+zunzSqtxZ+QRBk5tzZh8V3kUslXhfG
 zyBlgxYnqd3mqBuHhDKLQvDtbF8fexqfE85GlTj35DhqFBh705XWFD55hmZQrd/p6U5Vt7
 uOFiYMJ3h8BIjVh3DbicTE4lWTuN910=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-OzZFiekwN7ab8x3q_6JxMA-1; Mon, 13 Feb 2023 04:15:55 -0500
X-MC-Unique: OzZFiekwN7ab8x3q_6JxMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0558129A9CA2;
 Mon, 13 Feb 2023 09:15:55 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23E0C140EBF4;
 Mon, 13 Feb 2023 09:15:53 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v5 1/3] multifd: Create property
 multifd-sync-after-each-section
Date: Mon, 13 Feb 2023 10:15:46 +0100
Message-Id: <20230213091548.76444-2-quintela@redhat.com>
In-Reply-To: <20230213091548.76444-1-quintela@redhat.com>
References: <20230213091548.76444-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We used to synchronize all channels at the end of each RAM section
sent.  That is not needed, so preparing to only synchronize once every
full round in latests patches.

Notice that we initialize the property as true.  We will change the
default when we introduce the new mechanism.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>

---

Rename each-iteration to after-each-section

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 qapi/migration.json   | 10 +++++++++-
 migration/migration.h |  1 +
 hw/core/machine.c     |  1 +
 migration/migration.c | 15 +++++++++++++--
 4 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index c84fa10e86..2907241b9c 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -478,6 +478,13 @@
 #                    should not affect the correctness of postcopy migration.
 #                    (since 7.1)
 #
+# @multifd-sync-after-each-section: Synchronize channels after each
+#                                   section is sent.  We used to do
+#                                   that in the past, but it is
+#                                   suboptimal.
+#                                   Default value is true until all code is in.
+#                                   (since 8.0)
+#
 # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
 #
@@ -492,7 +499,8 @@
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
            'validate-uuid', 'background-snapshot',
-           'zero-copy-send', 'postcopy-preempt'] }
+           'zero-copy-send', 'postcopy-preempt',
+           'multifd-sync-after-each-section'] }
 
 ##
 # @MigrationCapabilityStatus:
diff --git a/migration/migration.h b/migration/migration.h
index 2da2f8a164..cf84520196 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -424,6 +424,7 @@ int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
+bool migrate_multifd_sync_after_each_section(void);
 
 #ifdef CONFIG_LINUX
 bool migrate_use_zero_copy_send(void);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index f73fc4c45c..dc86849402 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -54,6 +54,7 @@ const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
 GlobalProperty hw_compat_7_0[] = {
     { "arm-gicv3-common", "force-8-bit-prio", "on" },
     { "nvme-ns", "eui64-default", "on"},
+    { "migration", "multifd-sync-after-each-section", "on"},
 };
 const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
 
diff --git a/migration/migration.c b/migration/migration.c
index 90fca70cb7..406c27bc82 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -167,7 +167,8 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
     MIGRATION_CAPABILITY_XBZRLE,
     MIGRATION_CAPABILITY_X_COLO,
     MIGRATION_CAPABILITY_VALIDATE_UUID,
-    MIGRATION_CAPABILITY_ZERO_COPY_SEND);
+    MIGRATION_CAPABILITY_ZERO_COPY_SEND,
+    MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION);
 
 /* When we add fault tolerance, we could have several
    migrations at once.  For now we don't need to add
@@ -2701,6 +2702,15 @@ bool migrate_use_multifd(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
 }
 
+bool migrate_multifd_sync_after_each_section(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return true;
+    // We will change this when code gets in.
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION];
+}
+
 bool migrate_pause_before_switchover(void)
 {
     MigrationState *s;
@@ -4535,7 +4545,8 @@ static Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-zero-copy-send",
             MIGRATION_CAPABILITY_ZERO_COPY_SEND),
 #endif
-
+    DEFINE_PROP_MIG_CAP("multifd-sync-after-each-section",
+                        MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.39.1



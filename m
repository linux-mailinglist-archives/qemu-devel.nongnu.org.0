Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3092F63A5BB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:09:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozb0U-000316-J1; Mon, 28 Nov 2022 05:04:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozb0S-00030S-7O
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:04:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozb0Q-0002qB-GU
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669629892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZeFyVCpeWub6zRoIl6lvXvRSN8/uL+lMxCBiT+FPpaA=;
 b=OM/duDgBpwC4P26pVX26KSChv8Nmk3xE8JrNMOz6Y76VNWEvw2NoxpQeW6CWLfjiaw99Lh
 LzzcI2zolVC2p08rKmAVqbVAdNwRIz2zQUVC2jAkCaIrgoKtUxS1+30hTkBwc6zQZHR4Qq
 y7O4WPDurg0bq0vJ/oAdaw0VsjsHR14=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-nB5isCuZNaqW_AYoGTY8kw-1; Mon, 28 Nov 2022 05:04:41 -0500
X-MC-Unique: nB5isCuZNaqW_AYoGTY8kw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13B2C29AB40C;
 Mon, 28 Nov 2022 10:04:41 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F3962028CE4;
 Mon, 28 Nov 2022 10:04:39 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/11] multifd: Add capability to enable/disable zero_page
Date: Mon, 28 Nov 2022 11:04:19 +0100
Message-Id: <20221128100422.13522-9-quintela@redhat.com>
In-Reply-To: <20221128100422.13522-1-quintela@redhat.com>
References: <20221128100422.13522-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

We have to enable it by default until we introduce the new code.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

Change it to a capability.  As capabilities are off by default, have
to change MULTIFD_ZERO_PAGE to MAIN_ZERO_PAGE, so it is false for
default, and true for older versions.
---
 qapi/migration.json   |  8 +++++++-
 migration/migration.h |  1 +
 hw/core/machine.c     |  1 +
 migration/migration.c | 13 ++++++++++++-
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 88ecf86ac8..ac5bc071a9 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -472,12 +472,18 @@
 #                  Requires that QEMU be permitted to use locked memory
 #                  for guest RAM pages.
 #                  (since 7.1)
+#
 # @postcopy-preempt: If enabled, the migration process will allow postcopy
 #                    requests to preempt precopy stream, so postcopy requests
 #                    will be handled faster.  This is a performance feature and
 #                    should not affect the correctness of postcopy migration.
 #                    (since 7.1)
 #
+# @main-zero-page: If enabled, the detection of zero pages will be
+#                  done on the main thread.  Otherwise it is done on
+#                  the multifd threads.
+#                  (since 8.0)
+#
 # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
 #
@@ -492,7 +498,7 @@
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
            'validate-uuid', 'background-snapshot',
-           'zero-copy-send', 'postcopy-preempt'] }
+           'zero-copy-send', 'postcopy-preempt', 'main-zero-page'] }
 
 ##
 # @MigrationCapabilityStatus:
diff --git a/migration/migration.h b/migration/migration.h
index ae4ffd3454..c38a0baf10 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -408,6 +408,7 @@ int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
+bool migrate_use_main_zero_page(void);
 
 #ifdef CONFIG_LINUX
 bool migrate_use_zero_copy_send(void);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 8d34caa31d..cdc9c1e2a3 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -48,6 +48,7 @@ const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
 GlobalProperty hw_compat_7_0[] = {
     { "arm-gicv3-common", "force-8-bit-prio", "on" },
     { "nvme-ns", "eui64-default", "on"},
+    { "migration", "main-zero-page", "true" },
 };
 const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
 
diff --git a/migration/migration.c b/migration/migration.c
index d5733b7c03..2a828764ed 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -164,7 +164,8 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
     MIGRATION_CAPABILITY_XBZRLE,
     MIGRATION_CAPABILITY_X_COLO,
     MIGRATION_CAPABILITY_VALIDATE_UUID,
-    MIGRATION_CAPABILITY_ZERO_COPY_SEND);
+    MIGRATION_CAPABILITY_ZERO_COPY_SEND,
+    MIGRATION_CAPABILITY_MAIN_ZERO_PAGE);
 
 /* When we add fault tolerance, we could have several
    migrations at once.  For now we don't need to add
@@ -2611,6 +2612,14 @@ bool migrate_use_multifd(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
 }
 
+bool migrate_use_main_zero_page(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    /* We will enable this when we add the right code. */
+    return true || s->enabled_capabilities[MIGRATION_CAPABILITY_MAIN_ZERO_PAGE];
+}
+
 bool migrate_pause_before_switchover(void)
 {
     MigrationState *s;
@@ -4427,6 +4436,8 @@ static Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-zero-copy-send",
             MIGRATION_CAPABILITY_ZERO_COPY_SEND),
 #endif
+    DEFINE_PROP_MIG_CAP("main-zero-page",
+            MIGRATION_CAPABILITY_MAIN_ZERO_PAGE),
 
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.38.1



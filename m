Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5654F6982E0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:04:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSM7Q-0000Rq-88; Wed, 15 Feb 2023 13:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSM78-0000PT-Qr
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:02:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSM76-0004cd-SW
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:02:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676484159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAFtpDcdONtGky+j+/WmM/4GmehBKT7VfaWqWHIfzPU=;
 b=hxHs0Z+xFaLzV6GnQtiQ9uWM5tTmXQpRj44hqYGNER1SSBJUNWhQ9eg13ElsojNO3mu5k5
 V8Jy7q5Lwl9sapFTvB2oy0S/C2GDQvbiTwFNHIuVgnsqWtAIjKY0BJrQlLQgSiCI9lmSjS
 gmSxdisa2TGETik+b6Vb82Y6YbZOskk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-PCJoHOPWO3SVNmkLAR-Myg-1; Wed, 15 Feb 2023 13:02:36 -0500
X-MC-Unique: PCJoHOPWO3SVNmkLAR-Myg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 016491019CBC;
 Wed, 15 Feb 2023 18:02:36 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60D422026D4B;
 Wed, 15 Feb 2023 18:02:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: [PATCH v6 1/3] multifd: Create property
 multifd-flush-after-each-section
Date: Wed, 15 Feb 2023 19:02:29 +0100
Message-Id: <20230215180231.7644-2-quintela@redhat.com>
In-Reply-To: <20230215180231.7644-1-quintela@redhat.com>
References: <20230215180231.7644-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

We used to flush all channels at the end of each RAM section
sent.  That is not needed, so preparing to only flush after a full
iteration through all the RAM.

Default value of the property is false.  But we return "true" in
migrate_multifd_flush_after_each_section() until we implement the code
in following patches.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>

---

Rename each-iteration to after-each-section
Rename multifd-sync-after-each-section to
       multifd-flush-after-each-section
---
 qapi/migration.json   | 21 ++++++++++++++++++++-
 migration/migration.h |  1 +
 hw/core/machine.c     |  1 +
 migration/migration.c | 17 +++++++++++++++--
 4 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index c84fa10e86..3afd81174d 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -478,6 +478,24 @@
 #                    should not affect the correctness of postcopy migration.
 #                    (since 7.1)
 #
+# @multifd-flush-after-each-section: flush every channel after each
+#                                    section sent.  This assures that
+#                                    we can't mix pages from one
+#                                    iteration through ram pages with
+#                                    pages for the following
+#                                    iteration.  We really only need
+#                                    to do this flush after we have go
+#                                    through all the dirty pages.
+#                                    For historical reasons, we do
+#                                    that after each section.  This is
+#                                    suboptimal (we flush too many
+#                                    times).
+#                                    Default value is false.
+#                                    Setting this capability has no
+#                                    effect until the patch that
+#                                    removes this comment.
+#                                    (since 8.0)
+#
 # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
 #
@@ -492,7 +510,8 @@
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
            'validate-uuid', 'background-snapshot',
-           'zero-copy-send', 'postcopy-preempt'] }
+           'zero-copy-send', 'postcopy-preempt',
+           'multifd-flush-after-each-section'] }
 
 ##
 # @MigrationCapabilityStatus:
diff --git a/migration/migration.h b/migration/migration.h
index 2da2f8a164..7f0f4260ba 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -424,6 +424,7 @@ int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
+bool migrate_multifd_flush_after_each_section(void);
 
 #ifdef CONFIG_LINUX
 bool migrate_use_zero_copy_send(void);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index f73fc4c45c..602e775f34 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -54,6 +54,7 @@ const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
 GlobalProperty hw_compat_7_0[] = {
     { "arm-gicv3-common", "force-8-bit-prio", "on" },
     { "nvme-ns", "eui64-default", "on"},
+    { "migration", "multifd-flush-after-each-section", "on"},
 };
 const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
 
diff --git a/migration/migration.c b/migration/migration.c
index 90fca70cb7..cfba0da005 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -167,7 +167,8 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
     MIGRATION_CAPABILITY_XBZRLE,
     MIGRATION_CAPABILITY_X_COLO,
     MIGRATION_CAPABILITY_VALIDATE_UUID,
-    MIGRATION_CAPABILITY_ZERO_COPY_SEND);
+    MIGRATION_CAPABILITY_ZERO_COPY_SEND,
+    MIGRATION_CAPABILITY_MULTIFD_FLUSH_AFTER_EACH_SECTION);
 
 /* When we add fault tolerance, we could have several
    migrations at once.  For now we don't need to add
@@ -2701,6 +2702,17 @@ bool migrate_use_multifd(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
 }
 
+bool migrate_multifd_flush_after_each_section(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    /*
+     * Until the patch that remove this comment, we always return that
+     * the capability is enabled.
+     */
+    return true || s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_FLUSH_AFTER_EACH_SECTION];
+}
+
 bool migrate_pause_before_switchover(void)
 {
     MigrationState *s;
@@ -4535,7 +4547,8 @@ static Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-zero-copy-send",
             MIGRATION_CAPABILITY_ZERO_COPY_SEND),
 #endif
-
+    DEFINE_PROP_MIG_CAP("multifd-flush-after-each-section",
+                        MIGRATION_CAPABILITY_MULTIFD_FLUSH_AFTER_EACH_SECTION),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.39.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26726DD7E2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:27:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBDB-0001rA-VU; Tue, 11 Apr 2023 06:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmBCw-0001n3-CW
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmBCt-000775-9A
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681208793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4u7A5nkBh1LB4S+cRSFvPOmiBIud4ywqNddiDIhciM=;
 b=e28LnM6YjWdt/9hMxyxAdCJ2dJyY5uH+gMJYG6Gc0ARfHC5c9XcjJF3bXGWGCp4/iJv/Nn
 CBqwzjFZWgy995cVFJZz2LTtv4AkUpduudHAVgRaRCV1s0AUeQvD3x4pwA9JjK/8wz0Fc6
 aqBr0UclGk48qqGjy8sbY72QzIvKHM0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-FtAZ6DTeO7e6orjIpjsf9w-1; Tue, 11 Apr 2023 06:26:24 -0400
X-MC-Unique: FtAZ6DTeO7e6orjIpjsf9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CAF03801FE8;
 Tue, 11 Apr 2023 10:26:24 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E02752027041;
 Tue, 11 Apr 2023 10:26:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v7 1/3] multifd: Create property
 multifd-flush-after-each-section
Date: Tue, 11 Apr 2023 12:26:17 +0200
Message-Id: <20230411102619.8291-2-quintela@redhat.com>
In-Reply-To: <20230411102619.8291-1-quintela@redhat.com>
References: <20230411102619.8291-1-quintela@redhat.com>
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
 migration/migration.h | 13 +++++++++++++
 hw/core/machine.c     |  1 +
 migration/migration.c | 13 +++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/migration/migration.h b/migration/migration.h
index 2da2f8a164..d0d89411e2 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -365,6 +365,18 @@ struct MigrationState {
      */
     bool decompress_error_check;
 
+    /*
+     * flush every channel after each section sent.
+     *
+     * This assures that we can't mix pages from one iteration through
+     * ram pages with pages for the following iteration.  We really
+     * only need to do this flush after we have go through all the
+     * dirty pages.  For historical reasons, we do that after each
+     * section.  This is suboptimal (we flush too many times).
+     * Default value is false.  Setting this property has no effect
+     * until the patch that removes this comment.  (since 8.1)
+     */
+    bool multifd_flush_after_each_section;
     /*
      * This decides the size of guest memory chunk that will be used
      * to track dirty bitmap clearing.  The size of memory chunk will
@@ -424,6 +436,7 @@ int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
+bool migrate_multifd_flush_after_each_section(void);
 
 #ifdef CONFIG_LINUX
 bool migrate_use_zero_copy_send(void);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 45e3d24fdc..3bd92a25b5 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -56,6 +56,7 @@ const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
 GlobalProperty hw_compat_7_0[] = {
     { "arm-gicv3-common", "force-8-bit-prio", "on" },
     { "nvme-ns", "eui64-default", "on"},
+    { "migration", "multifd-flush-after-each-section", "on"},
 };
 const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
 
diff --git a/migration/migration.c b/migration/migration.c
index ae2025d9d8..ca773d00fc 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2701,6 +2701,17 @@ bool migrate_use_multifd(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
 }
 
+bool migrate_multifd_flush_after_each_section(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    /*
+     * Until the patch that remove this comment, we always return that
+     * the property is enabled.
+     */
+    return true || s->multifd_flush_after_each_section;
+}
+
 bool migrate_pause_before_switchover(void)
 {
     MigrationState *s;
@@ -4441,6 +4452,8 @@ static Property migration_properties[] = {
                      send_section_footer, true),
     DEFINE_PROP_BOOL("decompress-error-check", MigrationState,
                       decompress_error_check, true),
+    DEFINE_PROP_BOOL("multifd-flush-after-each-section", MigrationState,
+                      multifd_flush_after_each_section, true),
     DEFINE_PROP_UINT8("x-clear-bitmap-shift", MigrationState,
                       clear_bitmap_shift, CLEAR_BITMAP_SHIFT_DEFAULT),
 
-- 
2.39.2



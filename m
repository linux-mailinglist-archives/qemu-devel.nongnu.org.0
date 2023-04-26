Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A656EF9F2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:19:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prjjY-0000QD-OV; Wed, 26 Apr 2023 14:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prjjW-0000Ph-UT
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:19:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prjjV-0001x8-DD
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682533152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6WC45oisYHqoEu6QVmx4SBuRFuf282V6YK4H8AHjU+0=;
 b=dYBUtUT72kqzVUV7KJT8BVhPrzZX4YIufSj7dDfYEyf/N96FtVmQ7l11ShWqE78JLoLErT
 CqXpgrsiWgmaYo1pBRZwFM4+kSF7HMi92VU7Xu85YOt6+FB04fPIvHHIcfankSfIge2vvs
 pCKA6UQWU081nl1JcK28OsDSnlXSPQw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-tKuSCTRRMMKuBGnU-OIymw-1; Wed, 26 Apr 2023 14:19:06 -0400
X-MC-Unique: tKuSCTRRMMKuBGnU-OIymw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B84D83806636;
 Wed, 26 Apr 2023 18:19:05 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41F361415117;
 Wed, 26 Apr 2023 18:19:04 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v9 1/3] multifd: Create property
 multifd-flush-after-each-section
Date: Wed, 26 Apr 2023 20:18:59 +0200
Message-Id: <20230426181901.13574-2-quintela@redhat.com>
In-Reply-To: <20230426181901.13574-1-quintela@redhat.com>
References: <20230426181901.13574-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

---

Rename each-iteration to after-each-section
Rename multifd-sync-after-each-section to
       multifd-flush-after-each-section
Move to machine-8.0 (peter)
---
 hw/core/machine.c     |  4 +++-
 migration/migration.c |  2 ++
 migration/migration.h | 12 ++++++++++++
 migration/options.c   | 11 +++++++++++
 migration/options.h   |  1 +
 5 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 2ce97a5d3b..47a34841a5 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -39,7 +39,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_8_0[] = {};
+GlobalProperty hw_compat_8_0[] = {
+    { "migration", "multifd-flush-after-each-section", "on"},
+};
 const size_t hw_compat_8_0_len = G_N_ELEMENTS(hw_compat_8_0);
 
 GlobalProperty hw_compat_7_2[] = {
diff --git a/migration/migration.c b/migration/migration.c
index 22e8586623..e82aa69842 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3344,6 +3344,8 @@ static Property migration_properties[] = {
                      send_section_footer, true),
     DEFINE_PROP_BOOL("decompress-error-check", MigrationState,
                       decompress_error_check, true),
+    DEFINE_PROP_BOOL("multifd-flush-after-each-section", MigrationState,
+                      multifd_flush_after_each_section, true),
     DEFINE_PROP_UINT8("x-clear-bitmap-shift", MigrationState,
                       clear_bitmap_shift, CLEAR_BITMAP_SHIFT_DEFAULT),
     DEFINE_PROP_BOOL("x-preempt-pre-7-2", MigrationState,
diff --git a/migration/migration.h b/migration/migration.h
index 2b71df8617..e2247d708f 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -404,6 +404,18 @@ struct MigrationState {
      */
     bool preempt_pre_7_2;
 
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
diff --git a/migration/options.c b/migration/options.c
index c6030587cf..b9d54b4ef7 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -217,6 +217,17 @@ bool migrate_zero_copy_send(void)
 
 /* pseudo capabilities */
 
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
 bool migrate_postcopy(void)
 {
     return migrate_postcopy_ram() || migrate_dirty_bitmaps();
diff --git a/migration/options.h b/migration/options.h
index 89067e59a0..9b9ea0cde8 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -52,6 +52,7 @@ bool migrate_zero_copy_send(void);
  * check, but they are not a capability.
  */
 
+bool migrate_multifd_flush_after_each_section(void);
 bool migrate_postcopy(void);
 bool migrate_tls(void);
 
-- 
2.40.0



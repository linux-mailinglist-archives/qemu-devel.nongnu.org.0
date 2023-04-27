Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7876F0839
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:26:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3VV-00048b-Nk; Thu, 27 Apr 2023 11:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3Ui-0003Co-O9
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3Uh-0000b1-56
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682609114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6yrAmv9D4XCGk4nW1h0Lx9YpWijo4R1mmJfz9rbing=;
 b=Zy7zL+65XSWPxvk8OCaPIm7xRH9nJbpyCqPFUaEihMVliDL8Hkyw2Swk5e60AhUEYiAx9n
 Ws5HmtTSlBbx7qz7t5H7oAutOkw9D4Y4z9k1lpptV4NjTjA+rAX5tL+eokAcyPgbc2dmEh
 nt1YIsVLmYdvPFAqgiGGJtHhAa0HO6o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-pbk8FUCcNlSR0tOF-84fmQ-1; Thu, 27 Apr 2023 11:25:00 -0400
X-MC-Unique: pbk8FUCcNlSR0tOF-84fmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99A598A5219;
 Thu, 27 Apr 2023 15:23:16 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEEA440C2064;
 Thu, 27 Apr 2023 15:23:13 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, John Snow <jsnow@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 13/18] multifd: Create property multifd-flush-after-each-section
Date: Thu, 27 Apr 2023 17:22:29 +0200
Message-Id: <20230427152234.25400-14-quintela@redhat.com>
In-Reply-To: <20230427152234.25400-1-quintela@redhat.com>
References: <20230427152234.25400-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Acked-by: Peter Xu <peterx@redhat.com>

---

Rename each-iteration to after-each-section
Rename multifd-sync-after-each-section to
       multifd-flush-after-each-section
Move to machine-8.0 (peter)
---
 hw/core/machine.c     |  4 +++-
 migration/migration.h | 12 ++++++++++++
 migration/options.c   | 13 +++++++++++++
 migration/options.h   |  1 +
 4 files changed, 29 insertions(+), 1 deletion(-)

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
index f2a77cdef1..690c8f718e 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -88,6 +88,8 @@ Property migration_properties[] = {
                      send_section_footer, true),
     DEFINE_PROP_BOOL("decompress-error-check", MigrationState,
                       decompress_error_check, true),
+    DEFINE_PROP_BOOL("multifd-flush-after-each-section", MigrationState,
+                      multifd_flush_after_each_section, true),
     DEFINE_PROP_UINT8("x-clear-bitmap-shift", MigrationState,
                       clear_bitmap_shift, CLEAR_BITMAP_SHIFT_DEFAULT),
     DEFINE_PROP_BOOL("x-preempt-pre-7-2", MigrationState,
@@ -335,6 +337,17 @@ bool migrate_zero_copy_send(void)
 
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
index 00854d60f9..3c322867cd 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -59,6 +59,7 @@ bool migrate_zero_copy_send(void);
  * check, but they are not a capability.
  */
 
+bool migrate_multifd_flush_after_each_section(void);
 bool migrate_postcopy(void);
 bool migrate_tls(void);
 
-- 
2.40.0



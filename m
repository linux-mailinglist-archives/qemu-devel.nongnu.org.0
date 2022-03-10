Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD064D4CD8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:41:07 +0100 (CET)
Received: from localhost ([::1]:54878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSKuY-0005Tv-FL
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:41:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nSKor-0003Zv-Mn
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:35:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nSKoq-0004HB-4r
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646926511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9c6uZ6c0JZKb0SZcQmE1PNMc5wI9Yl56LU5ySk1ZEkw=;
 b=Qzf5GPWycRqj7ee5f37v86LT+MGvd5wUrcvh70/BEkyxg7L86rkFtQeC1shG57CtKOyq80
 ts0qjZIQK+4UUIhMzHwlQ8NcFdNCOT9v9rzJjXUtyL/vI6dSvoUxqIlykyF1TBqCkUNZiq
 K4xp8LCS4Q9T6KqJKHraMHHbkH813Bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-GHsO-b7nOGKXclFZXjsyFA-1; Thu, 10 Mar 2022 10:35:09 -0500
X-MC-Unique: GHsO-b7nOGKXclFZXjsyFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D24221854E21;
 Thu, 10 Mar 2022 15:35:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB4607DE43;
 Thu, 10 Mar 2022 15:35:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/8] multifd: Add property to enable/disable zero_page
Date: Thu, 10 Mar 2022 16:34:50 +0100
Message-Id: <20220310153454.3929-5-quintela@redhat.com>
In-Reply-To: <20220310153454.3929-1-quintela@redhat.com>
References: <20220310153454.3929-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.h |  3 +++
 hw/core/machine.c     |  4 +++-
 migration/migration.c | 11 +++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/migration/migration.h b/migration/migration.h
index 2de861df01..5048d5241f 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -333,6 +333,8 @@ struct MigrationState {
      * This save hostname when out-going migration starts
      */
     char *hostname;
+    /* Use multifd channel to send zero pages */
+    bool multifd_zero_pages;
 };
 
 void migrate_set_state(int *state, int old_state, int new_state);
@@ -375,6 +377,7 @@ int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
+bool migrate_use_multifd_zero_page(void);
 
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index d856485cb4..5d2bd2144b 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_6_2[] = {};
+GlobalProperty hw_compat_6_2[] = {
+    { "migration", "multifd-zero-pages", "false" },
+};
 const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
 
 GlobalProperty hw_compat_6_1[] = {
diff --git a/migration/migration.c b/migration/migration.c
index 695f0f2900..a655fc0b79 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2511,6 +2511,15 @@ bool migrate_use_multifd(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
 }
 
+bool migrate_use_multifd_zero_page(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->multifd_zero_pages;
+}
+
 bool migrate_pause_before_switchover(void)
 {
     MigrationState *s;
@@ -4158,6 +4167,8 @@ static Property migration_properties[] = {
                       clear_bitmap_shift, CLEAR_BITMAP_SHIFT_DEFAULT),
 
     /* Migration parameters */
+    DEFINE_PROP_BOOL("multifd-zero-pages", MigrationState,
+                      multifd_zero_pages, true),
     DEFINE_PROP_UINT8("x-compress-level", MigrationState,
                       parameters.compress_level,
                       DEFAULT_MIGRATE_COMPRESS_LEVEL),
-- 
2.34.1



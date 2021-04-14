Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B9E35F229
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 13:24:46 +0200 (CEST)
Received: from localhost ([::1]:60430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWddV-0004bS-Q8
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 07:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWdZL-0000Ma-I8
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:20:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWdZJ-0001d6-Mk
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618399224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W30iyeL8m+n9R03d2KBIX6dRO8r/XRXJfaat7xvVwA4=;
 b=fBN0zLecBJQ4MXWdQLs3ERsOtPTz6TruqBKrjwu5CIy3y2y2CJIalKmz+8WaHixcOVlfWK
 L6mLRv2b/L8DD78nlwqPl+x5sGq8cwZbBzKIn5+NO9BA679k3y9xdKkeaoQNRsyqO9iM5n
 txoBNBJkR5AjO9aaRln872sgs2R7XhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-gHGQqYOoNMSJrhaxOcpBxw-1; Wed, 14 Apr 2021 07:20:20 -0400
X-MC-Unique: gHGQqYOoNMSJrhaxOcpBxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 895D78189CB;
 Wed, 14 Apr 2021 11:20:19 +0000 (UTC)
Received: from thuth.com (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E28F101E24F;
 Wed, 14 Apr 2021 11:20:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-6.1 2/4] migration: Move populate_vfio_info() into a
 separate file
Date: Wed, 14 Apr 2021 13:20:02 +0200
Message-Id: <20210414112004.943383-3-thuth@redhat.com>
In-Reply-To: <20210414112004.943383-1-thuth@redhat.com>
References: <20210414112004.943383-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Markus Armbruster <armbru@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CONFIG_VFIO switch only works in target specific code. Since
migration/migration.c is common code, the #ifdef does not have
the intended behavior here. Move the related code to a separate
file now which gets compiled via specific_ss instead.

Fixes: 3710586caa ("qapi: Add VFIO devices migration stats in Migration stats")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 migration/meson.build |  3 ++-
 migration/migration.c | 15 ---------------
 migration/migration.h |  2 ++
 migration/target.c    | 25 +++++++++++++++++++++++++
 4 files changed, 29 insertions(+), 16 deletions(-)
 create mode 100644 migration/target.c

diff --git a/migration/meson.build b/migration/meson.build
index 3ecedce94d..f8714dcb15 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -31,4 +31,5 @@ softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
 softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
 softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
 
-specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('dirtyrate.c', 'ram.c'))
+specific_ss.add(when: 'CONFIG_SOFTMMU',
+                if_true: files('dirtyrate.c', 'ram.c', 'target.c'))
diff --git a/migration/migration.c b/migration/migration.c
index 8ca034136b..db8c378079 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -60,10 +60,6 @@
 #include "qemu/yank.h"
 #include "sysemu/cpus.h"
 
-#ifdef CONFIG_VFIO
-#include "hw/vfio/vfio-common.h"
-#endif
-
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
 /* Amount of time to allocate to each "chunk" of bandwidth-throttled
@@ -1059,17 +1055,6 @@ static void populate_disk_info(MigrationInfo *info)
     }
 }
 
-static void populate_vfio_info(MigrationInfo *info)
-{
-#ifdef CONFIG_VFIO
-    if (vfio_mig_active()) {
-        info->has_vfio = true;
-        info->vfio = g_malloc0(sizeof(*info->vfio));
-        info->vfio->transferred = vfio_mig_bytes_transferred();
-    }
-#endif
-}
-
 static void fill_source_migration_info(MigrationInfo *info)
 {
     MigrationState *s = migrate_get_current();
diff --git a/migration/migration.h b/migration/migration.h
index db6708326b..2730fa05c0 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -376,4 +376,6 @@ void migration_make_urgent_request(void);
 void migration_consume_urgent_request(void);
 bool migration_rate_limit(void);
 
+void populate_vfio_info(MigrationInfo *info);
+
 #endif
diff --git a/migration/target.c b/migration/target.c
new file mode 100644
index 0000000000..907ebf0a0a
--- /dev/null
+++ b/migration/target.c
@@ -0,0 +1,25 @@
+/*
+ * QEMU live migration - functions that need to be compiled target-specific
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2
+ * or (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-types-migration.h"
+#include "migration.h"
+
+#ifdef CONFIG_VFIO
+#include "hw/vfio/vfio-common.h"
+#endif
+
+void populate_vfio_info(MigrationInfo *info)
+{
+#ifdef CONFIG_VFIO
+    if (vfio_mig_active()) {
+        info->has_vfio = true;
+        info->vfio = g_malloc0(sizeof(*info->vfio));
+        info->vfio->transferred = vfio_mig_bytes_transferred();
+    }
+#endif
+}
-- 
2.27.0



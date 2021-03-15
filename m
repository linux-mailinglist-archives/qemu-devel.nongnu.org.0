Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BFF33C6C7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:25:51 +0100 (CET)
Received: from localhost ([::1]:55814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsqc-0003Gw-Dm
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLsZW-000449-TP
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:08:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLsZS-0002gW-T1
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615835285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RFcg85bVb32p9WpN2gTN3Oit+UMeDj4PuGjb0n5h6tc=;
 b=NDQ288LxzJdb7qHP5Zi/PbVpIL2+DVPfv/x9t3qwWGQ3NupqW5oE58lx3pr/DvT0ZU/7Ui
 nrfpnOb/LanGvChhpfLpGn6T4E1nZ8Pj7T0mSMRHyLii3Uz+RviO/JOmZiYZGTneQJLB/N
 uifQZ1S+jAZLaEhcnWAdt5a8Npe3dkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-klDWOZWFNzGVhghPKPwG9Q-1; Mon, 15 Mar 2021 15:08:01 -0400
X-MC-Unique: klDWOZWFNzGVhghPKPwG9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99A4487A82A;
 Mon, 15 Mar 2021 19:08:00 +0000 (UTC)
Received: from thuth.com (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDA5F5D755;
 Mon, 15 Mar 2021 19:07:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH] migration: Move populate_vfio_info() into a separate file
Date: Mon, 15 Mar 2021 20:07:56 +0100
Message-Id: <20210315190756.317710-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>
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
 migration/special.c   | 25 +++++++++++++++++++++++++
 4 files changed, 29 insertions(+), 16 deletions(-)
 create mode 100644 migration/special.c

diff --git a/migration/meson.build b/migration/meson.build
index 9645f44005..e1f72f6ba0 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -30,4 +30,5 @@ softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
 softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
 softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
 
-specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('dirtyrate.c', 'ram.c'))
+specific_ss.add(when: 'CONFIG_SOFTMMU',
+                if_true: files('dirtyrate.c', 'ram.c', 'special.c'))
diff --git a/migration/migration.c b/migration/migration.c
index a5ddf43559..6cc05954c8 100644
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
@@ -1061,17 +1057,6 @@ static void populate_disk_info(MigrationInfo *info)
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
diff --git a/migration/special.c b/migration/special.c
new file mode 100644
index 0000000000..907ebf0a0a
--- /dev/null
+++ b/migration/special.c
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



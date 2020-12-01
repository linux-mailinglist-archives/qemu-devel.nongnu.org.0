Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD5A2CACA5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:46:55 +0100 (CET)
Received: from localhost ([::1]:58012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBby-0001Qj-JO
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:46:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kkBaw-0000va-KT
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:45:51 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kkBal-0003XP-9Y
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:45:45 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fc69d5e0000>; Tue, 01 Dec 2020 11:45:34 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 1 Dec
 2020 19:45:34 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 1 Dec 2020 19:45:31 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <quintela@redhat.com>,
 <dgilbert@redhat.com>, <pbonzini@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH v2 1/1] Fix to show vfio migration stat in migration status
Date: Wed, 2 Dec 2020 00:43:14 +0530
Message-ID: <1606849994-10625-1-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606851934; bh=kLskcCq40vCeyrVzgaH9DU9vW8DtwcYXVYHieIeOYwo=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
 MIME-Version:Content-Type;
 b=TMFxNfNvthEh9Tb5/Anw2d9azq25y5X5fgB3MnSxKg8pHHzLT4z39TA/ACISLQrae
 sSk8BejpxN0ij5VCyA9Ac8aZhpnfP3d9ZRpJfHDEcmacXByQhZuYSljOkexjnmMwbF
 +Sw4669ReDbPSeuIcnAj03T9Kv4i/cdHmCi2+cIyMHKC31TOPDTISj1s+NhOFro913
 d4rsKKTBrp8P7+X15FFIuvmOZIKynwRVSvmBkxC4YlMGi6vVwYKHlzZOAmOx79mUYa
 5XJgF1mgSVtKZUQVjMF1fLrEM6YvU2pJ49on+d70NKhbqbsoyUcAN6GDf+afPiuPc/
 Sz+16jxt5Qwxg==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>, dnigam@nvidia.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Header file where CONFIG_VFIO is defined is not included in migration.c
file.

Moved populate_vfio_info() to hw/vfio/common.c file. Added its stub in
stubs/vfio.c file. Updated header files and meson file accordingly.

Fixes: 3710586caa5d ("qapi: Add VFIO devices migration stats in Migration
stats")

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 hw/vfio/common.c              | 12 +++++++++++-
 include/hw/vfio/vfio-common.h |  1 -
 include/hw/vfio/vfio.h        |  2 ++
 migration/migration.c         | 16 +---------------
 stubs/meson.build             |  1 +
 stubs/vfio.c                  |  7 +++++++
 6 files changed, 22 insertions(+), 17 deletions(-)
 create mode 100644 stubs/vfio.c

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6ff1daa763f8..4868c0fef504 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -25,6 +25,7 @@
 #endif
 #include <linux/vfio.h>
 
+#include "qapi/qapi-types-migration.h"
 #include "hw/vfio/vfio-common.h"
 #include "hw/vfio/vfio.h"
 #include "exec/address-spaces.h"
@@ -292,7 +293,7 @@ const MemoryRegionOps vfio_region_ops = {
  * Device state interfaces
  */
 
-bool vfio_mig_active(void)
+static bool vfio_mig_active(void)
 {
     VFIOGroup *group;
     VFIODevice *vbasedev;
@@ -311,6 +312,15 @@ bool vfio_mig_active(void)
     return true;
 }
 
+void populate_vfio_info(MigrationInfo *info)
+{
+    if (vfio_mig_active()) {
+        info->has_vfio = true;
+        info->vfio = g_malloc0(sizeof(*info->vfio));
+        info->vfio->transferred = vfio_mig_bytes_transferred();
+    }
+}
+
 static bool vfio_devices_all_saving(VFIOContainer *container)
 {
     VFIOGroup *group;
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 6141162d7aea..cc47bd7d4456 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -205,7 +205,6 @@ extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
 extern VFIOGroupList vfio_group_list;
 
-bool vfio_mig_active(void);
 int64_t vfio_mig_bytes_transferred(void);
 
 #ifdef CONFIG_LINUX
diff --git a/include/hw/vfio/vfio.h b/include/hw/vfio/vfio.h
index 86248f54360a..d1e6f4b26f35 100644
--- a/include/hw/vfio/vfio.h
+++ b/include/hw/vfio/vfio.h
@@ -4,4 +4,6 @@
 bool vfio_eeh_as_ok(AddressSpace *as);
 int vfio_eeh_as_op(AddressSpace *as, uint32_t op);
 
+void populate_vfio_info(MigrationInfo *info);
+
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 87a9b59f83f4..c164594c1d8d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -56,10 +56,7 @@
 #include "net/announce.h"
 #include "qemu/queue.h"
 #include "multifd.h"
-
-#ifdef CONFIG_VFIO
-#include "hw/vfio/vfio-common.h"
-#endif
+#include "hw/vfio/vfio.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -1041,17 +1038,6 @@ static void populate_disk_info(MigrationInfo *info)
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
diff --git a/stubs/meson.build b/stubs/meson.build
index 82b7ba60abe5..909956674847 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -53,3 +53,4 @@ if have_system
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('xen-hw-stub.c'))
 endif
+stub_ss.add(files('vfio.c'))
diff --git a/stubs/vfio.c b/stubs/vfio.c
new file mode 100644
index 000000000000..9cc8753cd102
--- /dev/null
+++ b/stubs/vfio.c
@@ -0,0 +1,7 @@
+#include "qemu/osdep.h"
+#include "qapi/qapi-types-migration.h"
+#include "hw/vfio/vfio.h"
+
+void populate_vfio_info(MigrationInfo *info)
+{
+}
-- 
2.7.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54314298AA3
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 11:46:28 +0100 (CET)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX01D-0002nx-Cr
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 06:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kWzUa-0002ed-1K
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 06:12:44 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kWzUV-0000RO-UG
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 06:12:43 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f96a11d0000>; Mon, 26 Oct 2020 03:12:45 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Oct
 2020 10:12:28 +0000
Received: from kwankhede-dev.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 26 Oct 2020 10:12:19 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH v29 17/17] qapi: Add VFIO devices migration stats in Migration
 stats
Date: Mon, 26 Oct 2020 15:06:27 +0530
Message-ID: <1603704987-20977-18-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1603704987-20977-1-git-send-email-kwankhede@nvidia.com>
References: <1603704987-20977-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603707165; bh=IbvRYcO7qbh8ctrnsvRfiDS+EkQBdWbXdekBTs9LAPo=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:X-NVConfidentiality:MIME-Version:Content-Type;
 b=ckuf1G7zXLLMEF8/gIbBbHbmmWU6cxrqcDyRUExP/mnefGtTxMdzgVqlXkHMBbvcI
 jhWMka12HXdRbU7Wkhvw7YGej7XCisUpuN5Mouf6YoJP7GGAIcwCN3O6z+Ppi0tn9P
 iHgqQXIGREunHAz3h/0HqMN2tGimTaVrsWobdEtg3jMVAObUa9+XPCswnKvNXynJGJ
 L45rci2aXNYlsb9YNlNKiZtPrOsPK2MnFcEk2q6aWD1YFxDiB9ChIK34DSWKttuVJv
 l75J8UhsmZKtEDTgF/tYGVRJoOCxwV0DQNLaKpD1n2RGiirHELzv+sKgEKB2Sy27e5
 peimRgpmx16hA==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 06:10:03
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: cohuck@redhat.com, zhi.wang.linux@gmail.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, artemp@nvidia.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, mcrossley@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, dgilbert@redhat.com,
 changpeng.liu@intel.com, eskultet@redhat.com, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com, pbonzini@redhat.com, dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added amount of bytes transferred to the VM at destination by all VFIO
devices

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/vfio/common.c              | 19 +++++++++++++++++++
 hw/vfio/migration.c           |  9 +++++++++
 include/hw/vfio/vfio-common.h |  3 +++
 migration/migration.c         | 17 +++++++++++++++++
 monitor/hmp-cmds.c            |  6 ++++++
 qapi/migration.json           | 17 +++++++++++++++++
 6 files changed, 71 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 49c68a5253ae..56f6fee66a55 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -292,6 +292,25 @@ const MemoryRegionOps vfio_region_ops = {
  * Device state interfaces
  */
 
+bool vfio_mig_active(void)
+{
+    VFIOGroup *group;
+    VFIODevice *vbasedev;
+
+    if (QLIST_EMPTY(&vfio_group_list)) {
+        return false;
+    }
+
+    QLIST_FOREACH(group, &vfio_group_list, next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            if (vbasedev->migration_blocker) {
+                return false;
+            }
+        }
+    }
+    return true;
+}
+
 static bool vfio_devices_all_stopped_and_saving(VFIOContainer *container)
 {
     VFIOGroup *group;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index ffedbcca179d..2d657289c68e 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -45,6 +45,8 @@
 #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
 #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
 
+static int64_t bytes_transferred;
+
 static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
                                   off_t off, bool iswrite)
 {
@@ -255,6 +257,7 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
         *size = data_size;
     }
 
+    bytes_transferred += data_size;
     return ret;
 }
 
@@ -785,6 +788,7 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     case MIGRATION_STATUS_CANCELLING:
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_FAILED:
+        bytes_transferred = 0;
         ret = vfio_migration_set_state(vbasedev,
                       ~(VFIO_DEVICE_STATE_SAVING | VFIO_DEVICE_STATE_RESUMING),
                       VFIO_DEVICE_STATE_RUNNING);
@@ -866,6 +870,11 @@ err:
 
 /* ---------------------------------------------------------------------- */
 
+int64_t vfio_mig_bytes_transferred(void)
+{
+    return bytes_transferred;
+}
+
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
 {
     VFIOContainer *container = vbasedev->group->container;
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index b1c1b18fd228..24e299d97425 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -203,6 +203,9 @@ extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
 extern VFIOGroupList vfio_group_list;
 
+bool vfio_mig_active(void);
+int64_t vfio_mig_bytes_transferred(void);
+
 #ifdef CONFIG_LINUX
 int vfio_get_region_info(VFIODevice *vbasedev, int index,
                          struct vfio_region_info **info);
diff --git a/migration/migration.c b/migration/migration.c
index 0575ecb37953..995ccd96a774 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -57,6 +57,10 @@
 #include "qemu/queue.h"
 #include "multifd.h"
 
+#ifdef CONFIG_VFIO
+#include "hw/vfio/vfio-common.h"
+#endif
+
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
 /* Amount of time to allocate to each "chunk" of bandwidth-throttled
@@ -1002,6 +1006,17 @@ static void populate_disk_info(MigrationInfo *info)
     }
 }
 
+static void populate_vfio_info(MigrationInfo *info)
+{
+#ifdef CONFIG_VFIO
+    if (vfio_mig_active()) {
+        info->has_vfio = true;
+        info->vfio = g_malloc0(sizeof(*info->vfio));
+        info->vfio->transferred = vfio_mig_bytes_transferred();
+    }
+#endif
+}
+
 static void fill_source_migration_info(MigrationInfo *info)
 {
     MigrationState *s = migrate_get_current();
@@ -1026,6 +1041,7 @@ static void fill_source_migration_info(MigrationInfo *info)
         populate_time_info(info, s);
         populate_ram_info(info, s);
         populate_disk_info(info);
+        populate_vfio_info(info);
         break;
     case MIGRATION_STATUS_COLO:
         info->has_status = true;
@@ -1034,6 +1050,7 @@ static void fill_source_migration_info(MigrationInfo *info)
     case MIGRATION_STATUS_COMPLETED:
         populate_time_info(info, s);
         populate_ram_info(info, s);
+        populate_vfio_info(info);
         break;
     case MIGRATION_STATUS_FAILED:
         info->has_status = true;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9789f4277f50..56e9bad33d94 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -357,6 +357,12 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
         }
         monitor_printf(mon, "]\n");
     }
+
+    if (info->has_vfio) {
+        monitor_printf(mon, "vfio device transferred: %" PRIu64 " kbytes\n",
+                       info->vfio->transferred >> 10);
+    }
+
     qapi_free_MigrationInfo(info);
 }
 
diff --git a/qapi/migration.json b/qapi/migration.json
index a5da513c9e05..3c7582052725 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -147,6 +147,18 @@
             'active', 'postcopy-active', 'postcopy-paused',
             'postcopy-recover', 'completed', 'failed', 'colo',
             'pre-switchover', 'device', 'wait-unplug' ] }
+##
+# @VfioStats:
+#
+# Detailed VFIO devices migration statistics
+#
+# @transferred: amount of bytes transferred to the target VM by VFIO devices
+#
+# Since: 5.2
+#
+##
+{ 'struct': 'VfioStats',
+  'data': {'transferred': 'int' } }
 
 ##
 # @MigrationInfo:
@@ -208,11 +220,16 @@
 #
 # @socket-address: Only used for tcp, to know what the real port is (Since 4.0)
 #
+# @vfio: @VfioStats containing detailed VFIO devices migration statistics,
+#        only returned if VFIO device is present, migration is supported by all
+#        VFIO devices and status is 'active' or 'completed' (since 5.2)
+#
 # Since: 0.14.0
 ##
 { 'struct': 'MigrationInfo',
   'data': {'*status': 'MigrationStatus', '*ram': 'MigrationStats',
            '*disk': 'MigrationStats',
+           '*vfio': 'VfioStats',
            '*xbzrle-cache': 'XBZRLECacheStats',
            '*total-time': 'int',
            '*expected-downtime': 'int',
-- 
2.7.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F04B1D715E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 08:56:13 +0200 (CEST)
Received: from localhost ([::1]:41398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaZh6-0003Kv-Je
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 02:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jaZaM-0007Hf-1p
 for qemu-devel@nongnu.org; Mon, 18 May 2020 02:49:14 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jaZaK-0004Pi-R0
 for qemu-devel@nongnu.org; Mon, 18 May 2020 02:49:13 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec22fdb0000>; Sun, 17 May 2020 23:48:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 17 May 2020 23:49:11 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 17 May 2020 23:49:11 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 May
 2020 06:49:11 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 18 May 2020 06:49:03 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH QEMU v22 18/18] qapi: Add VFIO devices migration stats in
 Migration stats
Date: Mon, 18 May 2020 11:43:18 +0530
Message-ID: <1589782398-24406-19-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1589782398-24406-1-git-send-email-kwankhede@nvidia.com>
References: <1589782398-24406-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1589784539; bh=6pqgP0A94Lycn4YxUIV8rIw7Vy32cyS8Bm905ntbsEo=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=gjHkJE685Zzs/PD3XWj96aPe4VNbOHW+sFRjQ/L/lb8oJQwWPzgzGZxy9jYozCq/6
 xiNidvfEJyisFEbLB/wyQzJ8rBwdVp5uWerekGuEeTLnl5c4VZF1rYKGsVel7OvrAH
 8HLy8kte5w+AkzILmXNVCwE+gRSxZwAj5Sxstr08qv5DXsu/bojzyk3X7R6qaF40uu
 UxwoLZAUVKiiqa5mtFzU3fM7lN82KfVbnFNVSQE3L1uzEgaFWcnwsZqETPZNQSTV/8
 z4vlSOt1gTeW6S7qk/eDaxmwpOYReQE5kkhzOdu+/X9cI9dV8COza2zzcmN+E1uLJX
 Li8bvA9kCkUKA==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 02:30:17
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: cohuck@redhat.com, aik@ozlabs.ru, Zhengxiao.zx@Alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, peterx@redhat.com,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, yi.l.liu@intel.com,
 quintela@redhat.com, ziye.yang@intel.com, armbru@redhat.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, felipe@nutanix.com,
 zhi.a.wang@intel.com, kevin.tian@intel.com, yan.y.zhao@intel.com,
 dgilbert@redhat.com, changpeng.liu@intel.com, eskultet@redhat.com,
 Ken.Xue@amd.com, jonathan.davies@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added amount of bytes transferred to the target VM by all VFIO devices

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 hw/vfio/common.c            | 20 ++++++++++++++++++++
 hw/vfio/migration.c         | 10 +++++++++-
 include/qemu/vfio-helpers.h |  3 +++
 migration/migration.c       | 12 ++++++++++++
 monitor/hmp-cmds.c          |  6 ++++++
 qapi/migration.json         | 19 ++++++++++++++++++-
 6 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 9b29de654c7f..3e2ae742575e 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -40,6 +40,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
+#include "qemu/vfio-helpers.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -293,6 +294,25 @@ const MemoryRegionOps vfio_region_ops = {
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
 static bool vfio_devices_are_stopped_and_saving(void)
 {
     VFIOGroup *group;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 7729c90782bd..2eef38fe5c65 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -26,7 +26,7 @@
 #include "exec/ram_addr.h"
 #include "pci.h"
 #include "trace.h"
-
+#include "qemu/vfio-helpers.h"
 /*
  * Flags used as delimiter:
  * 0xffffffff => MSB 32-bit all 1s
@@ -38,6 +38,8 @@
 #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
 #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
 
+static int64_t bytes_transferred;
+
 static void vfio_migration_region_exit(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
@@ -229,6 +231,7 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev)
         return ret;
     }
 
+    bytes_transferred += data_size;
     return data_size;
 }
 
@@ -744,6 +747,11 @@ static int vfio_migration_init(VFIODevice *vbasedev,
 
 /* ---------------------------------------------------------------------- */
 
+int64_t vfio_mig_bytes_transferred(void)
+{
+    return bytes_transferred;
+}
+
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
 {
     struct vfio_region_info *info;
diff --git a/include/qemu/vfio-helpers.h b/include/qemu/vfio-helpers.h
index 1f057c2b9e40..26a7df0767b1 100644
--- a/include/qemu/vfio-helpers.h
+++ b/include/qemu/vfio-helpers.h
@@ -29,4 +29,7 @@ void qemu_vfio_pci_unmap_bar(QEMUVFIOState *s, int index, void *bar,
 int qemu_vfio_pci_init_irq(QEMUVFIOState *s, EventNotifier *e,
                            int irq_type, Error **errp);
 
+bool vfio_mig_active(void);
+int64_t vfio_mig_bytes_transferred(void);
+
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 187ac0410c2d..9d763447261c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -54,6 +54,7 @@
 #include "net/announce.h"
 #include "qemu/queue.h"
 #include "multifd.h"
+#include "qemu/vfio-helpers.h"
 
 #define MAX_THROTTLE  (32 << 20)      /* Migration transfer speed throttling */
 
@@ -967,6 +968,15 @@ static void populate_disk_info(MigrationInfo *info)
     }
 }
 
+static void populate_vfio_info(MigrationInfo *info)
+{
+    if (vfio_mig_active()) {
+        info->has_vfio = true;
+        info->vfio = g_malloc0(sizeof(*info->vfio));
+        info->vfio->bytes = vfio_mig_bytes_transferred();
+    }
+}
+
 static void fill_source_migration_info(MigrationInfo *info)
 {
     MigrationState *s = migrate_get_current();
@@ -992,6 +1002,7 @@ static void fill_source_migration_info(MigrationInfo *info)
         populate_time_info(info, s);
         populate_ram_info(info, s);
         populate_disk_info(info);
+        populate_vfio_info(info);
         break;
     case MIGRATION_STATUS_COLO:
         info->has_status = true;
@@ -1000,6 +1011,7 @@ static void fill_source_migration_info(MigrationInfo *info)
     case MIGRATION_STATUS_COMPLETED:
         populate_time_info(info, s);
         populate_ram_info(info, s);
+        populate_vfio_info(info);
         break;
     case MIGRATION_STATUS_FAILED:
         info->has_status = true;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 7f6e982dc834..d04bc042f2fe 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -353,6 +353,12 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
         }
         monitor_printf(mon, "]\n");
     }
+
+    if (info->has_vfio) {
+        monitor_printf(mon, "vfio device bytes: %" PRIu64 " kbytes\n",
+                       info->vfio->bytes >> 10);
+    }
+
     qapi_free_MigrationInfo(info);
 }
 
diff --git a/qapi/migration.json b/qapi/migration.json
index eca2981d0a33..22548bfff1d2 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -144,6 +144,18 @@
             'active', 'postcopy-active', 'postcopy-paused',
             'postcopy-recover', 'completed', 'failed', 'colo',
             'pre-switchover', 'device', 'wait-unplug' ] }
+##
+# @VfioStats:
+#
+# Detailed VFIO devices migration statistics
+#
+# @bytes: amount of bytes transferred to the target VM by VFIO devices
+#
+# Since: 5.1
+#
+##
+{ 'struct': 'VfioStats',
+  'data': {'bytes': 'int' } }
 
 ##
 # @MigrationInfo:
@@ -205,6 +217,10 @@
 #
 # @socket-address: Only used for tcp, to know what the real port is (Since 4.0)
 #
+# @vfio: @VfioStats containing detailed VFIO devices migration statistics,
+#        only returned if VFIO device is present, migration is supported by all
+#         VFIO devices and status is 'active' or 'completed' (since 5.1)
+#
 # Since: 0.14.0
 ##
 { 'struct': 'MigrationInfo',
@@ -220,7 +236,8 @@
            '*postcopy-blocktime' : 'uint32',
            '*postcopy-vcpu-blocktime': ['uint32'],
            '*compression': 'CompressionStats',
-           '*socket-address': ['SocketAddress'] } }
+           '*socket-address': ['SocketAddress'],
+           '*vfio': 'VfioStats' } }
 
 ##
 # @query-migrate:
-- 
2.7.0



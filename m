Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E4E67D4AC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:51:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7KU-0004XI-Az; Thu, 26 Jan 2023 13:50:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7KS-0004Wp-12
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:32 -0500
Received: from mail-bn8nam12on2055.outbound.protection.outlook.com
 ([40.107.237.55] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7KP-0002Ys-SR
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0U/TZ4Hwko0bfq6DjvhdeD2LvZWyTXuGqPMi7+fISto4iUpRReD9BPCPFe6VsVU+27VTBgpBs6nyMVjUQ7cmNYR7L39yCLNet+Sfyre2U/aN7V34/C0O/4nzO841E29jw5u3lZCEV3dedumA4xC+LaLsxmv4FhEHYsA+hW8I+m0R4BAqwLMOmpliLYq2VOj6aRlzAe/PNkF1i9abEMZe5BEElm6Z68Ub8vyMa5DObW2Ek/rLkDaLJa+IhKcix9FGzUZ/eOzL60eqVBxyFl/NA2iTFRVgWXpf0g/ZPw68XnFCQgHj2PzQ0sMNDl8/ZDSJ8UyoJnCBnKNhU5ClxfKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SI3B9FEdnfEMvYhdUGPQx1QkhgBoanyT6YNvzlHwQoo=;
 b=SieLpfmW0q4GNUOIXMNh21wg+/4rtky8JXdxJVUvCx+K1SsamZfVwOlq8XQIxW4M9vJinNa7J1jqgmjgHIB4qse9NiDQLaNWFh76VevKdHhTtp4KAIQ9CZlPFz3M/NR7pu5bB8xpfZdOSIN9T4ScsFsYovyqMJpMRnqhwkr58ExTeHi8lybOFg8E03uTRVN50onDJ3R+MFUrsBW7tneNHLIgMd8d4HwD+XoG+x7GjiJDwHlqpTxxGahZrffJjj1BgZmJxSk7zDV/T/fcyFqk6pkhwdvwCj+10Sn668d+h9qYFWj6WZralxCR9SgWmpMUfjek2j/2RFCsqjRA15Y6iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SI3B9FEdnfEMvYhdUGPQx1QkhgBoanyT6YNvzlHwQoo=;
 b=ruFVtKLJMxE8H1a3Dm/p8WPSqn561JVUdqQs1ThtUfM32FfY7sFa08kVhPrHUvOE8TloEbY81ewC9PqAHADjdgqD47ifrSnLPQaP0KRZdzZbDt409vk8WKOFtXnd3yAn/D3br0swWEVXqtBjU4wEchkAyKLRu5oyjqLIYOtbgFwoIZpGf4hQwmpDj6voyzmHxm6bSrkZ80MLCQWdQtYOQjm86hC1EG+ieaM8KQsTViCCwmybh4B4iXq+puYMAYDnRaFQ0Ru91LyXVyFYJcm+QdfcWMEaiDMchYjBb4d/R/AKderhrX/CIr59skzCa5FxH3lZo2pgFUUSYGa0A9isAA==
Received: from BN9PR03CA0941.namprd03.prod.outlook.com (2603:10b6:408:108::16)
 by CY5PR12MB6597.namprd12.prod.outlook.com (2603:10b6:930:43::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 18:50:25 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::2b) by BN9PR03CA0941.outlook.office365.com
 (2603:10b6:408:108::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:50:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.17 via Frontend Transport; Thu, 26 Jan 2023 18:50:24 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:50:11 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:50:11 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:50:07 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH 04/18] vfio/common: Abort migration if dirty log
 start/stop/sync fails
Date: Thu, 26 Jan 2023 20:49:34 +0200
Message-ID: <20230126184948.10478-5-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT010:EE_|CY5PR12MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: e904a555-67c4-416c-232c-08daffce2f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2YaLwxDWRT3x8tziZfC9xPDvLpOBAgQMoM5folZz6jwkBuvo6agtZKu3aS2pE36h5+O2S52RkMczSzu2MTiwHY+Iz+r3OQkPu5AajSWpVDYRsTR+HzVfq1wJQQmLZcpv09GDNXRJ5/slSQzCV6A3jDKBW0DwGYlmejyZY+rp2ajTJ8XCmibpDfYt5Eq4SYBnU5DpD7exlKUPkzE19FY9GHmsI/DIs1p6agXSuAshMpjg1Gj7+lt9NsnWAltxH7vYb5GWUrKY9x4L9G/OON6e3oZhCsefKakAdrV+l13dqYDWQUZTukvgPE06zbXwEQSkfoDP2EhUkfBN7FLEi5IffxFR+fPqOKMBih5j47AhkZWZKt/fTaKkiTDvJyyUzLuwaBqPt5P9gpI3Nex3m/zD3qRqD2YQBGy4XZ/wKbqpFpZowlqaf/ppAVe7LRAsuFSawt3kHpFYZ0RPXGybfV9ep0b4RjFXafuea0o7KV2C9uQg5ITDV+JZLIvou3RCyKVlJION6GMOMj2vkaYIknpaarHUQKnYBndxFnSNYBMAYIQGGLx9Lj9nVVGqLwCh4DnIB5t9mLjbbaw2RLXM7ghvDl8nNa7RqX18MktGWhxxPGeZqVMnCYVJ1aw4qFpjXipjhODIFEmHNLuQccV0aznoSzIcTJFYKqop24N+T+rkPiXtG3uU/64uPWxIOcuCuO0X1zglM8xULMrtJdt+/EPeU4/UJNEbi/hXpRB3KH/+6fM=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199018)(46966006)(40470700004)(36840700001)(478600001)(86362001)(2906002)(36756003)(40460700003)(5660300002)(7416002)(4326008)(7636003)(7696005)(82310400005)(6916009)(82740400003)(40480700001)(41300700001)(8676002)(70586007)(70206006)(356005)(8936002)(6666004)(1076003)(36860700001)(54906003)(83380400001)(316002)(336012)(186003)(47076005)(26005)(426003)(2616005)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:50:24.6926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e904a555-67c4-416c-232c-08daffce2f55
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6597
Received-SPF: softfail client-ip=40.107.237.55;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

If VFIO dirty pages log start/stop/sync fails during migration,
migration should be aborted as pages dirtied by VFIO devices might not
be reported properly.

This is not the case today, where in such scenario only an error is
printed.

Fix it by aborting migration in the above scenario.

Fixes: 758b96b61d5c ("vfio/migrate: Move switch of dirty tracking into vfio_memory_listener")
Fixes: b6dd6504e303 ("vfio: Add vfio_listener_log_sync to mark dirty pages")
Fixes: 9e7b0442f23a ("vfio: Add ioctl to get dirty pages bitmap during dma unmap")
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 53 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 643418f6f1..8e8ffbc046 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -41,6 +41,7 @@
 #include "qapi/error.h"
 #include "migration/migration.h"
 #include "migration/misc.h"
+#include "migration/qemu-file.h"
 #include "sysemu/tpm.h"
 
 VFIOGroupList vfio_group_list =
@@ -337,6 +338,19 @@ bool vfio_mig_active(void)
     return true;
 }
 
+static void vfio_set_migration_error(int err)
+{
+    MigrationState *ms = migrate_get_current();
+
+    if (migration_is_setup_or_active(ms->state)) {
+        WITH_QEMU_LOCK_GUARD(&ms->qemu_file_lock) {
+            if (ms->to_dst_file) {
+                qemu_file_set_error(ms->to_dst_file, err);
+            }
+        }
+    }
+}
+
 static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
 {
     VFIOGroup *group;
@@ -633,6 +647,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     if (iotlb->target_as != &address_space_memory) {
         error_report("Wrong target AS \"%s\", only system memory is allowed",
                      iotlb->target_as->name ? iotlb->target_as->name : "none");
+        vfio_set_migration_error(-EINVAL);
         return;
     }
 
@@ -667,6 +682,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
                          "0x%"HWADDR_PRIx") = %d (%s)",
                          container, iova,
                          iotlb->addr_mask + 1, ret, strerror(-ret));
+            vfio_set_migration_error(ret);
         }
     }
 out:
@@ -1212,7 +1228,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
     }
 }
 
-static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
+static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
 {
     int ret;
     struct vfio_iommu_type1_dirty_bitmap dirty = {
@@ -1220,7 +1236,7 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
     };
 
     if (!container->dirty_pages_supported) {
-        return;
+        return 0;
     }
 
     if (start) {
@@ -1231,23 +1247,34 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
 
     ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
     if (ret) {
+        ret = -errno;
         error_report("Failed to set dirty tracking flag 0x%x errno: %d",
                      dirty.flags, errno);
     }
+
+    return ret;
 }
 
 static void vfio_listener_log_global_start(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    int ret;
 
-    vfio_set_dirty_page_tracking(container, true);
+    ret = vfio_set_dirty_page_tracking(container, true);
+    if (ret) {
+        vfio_set_migration_error(ret);
+    }
 }
 
 static void vfio_listener_log_global_stop(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    int ret;
 
-    vfio_set_dirty_page_tracking(container, false);
+    ret = vfio_set_dirty_page_tracking(container, false);
+    if (ret) {
+        vfio_set_migration_error(ret);
+    }
 }
 
 static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
@@ -1323,19 +1350,18 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     VFIOContainer *container = giommu->container;
     hwaddr iova = iotlb->iova + giommu->iommu_offset;
     ram_addr_t translated_addr;
+    int ret = -EINVAL;
 
     trace_vfio_iommu_map_dirty_notify(iova, iova + iotlb->addr_mask);
 
     if (iotlb->target_as != &address_space_memory) {
         error_report("Wrong target AS \"%s\", only system memory is allowed",
                      iotlb->target_as->name ? iotlb->target_as->name : "none");
-        return;
+        goto out;
     }
 
     rcu_read_lock();
     if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
-        int ret;
-
         ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
                                     translated_addr);
         if (ret) {
@@ -1346,6 +1372,11 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
         }
     }
     rcu_read_unlock();
+
+out:
+    if (ret) {
+        vfio_set_migration_error(ret);
+    }
 }
 
 static int vfio_ram_discard_get_dirty_bitmap(MemoryRegionSection *section,
@@ -1438,13 +1469,19 @@ static void vfio_listener_log_sync(MemoryListener *listener,
         MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    int ret;
 
     if (vfio_listener_skipped_section(section)) {
         return;
     }
 
     if (vfio_devices_all_dirty_tracking(container)) {
-        vfio_sync_dirty_bitmap(container, section);
+        ret = vfio_sync_dirty_bitmap(container, section);
+        if (ret) {
+            error_report("vfio: Failed to sync dirty bitmap, err: %d (%s)", ret,
+                         strerror(-ret));
+            vfio_set_migration_error(ret);
+        }
     }
 }
 
-- 
2.26.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93F167D4B1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:53:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7LJ-0005gx-H6; Thu, 26 Jan 2023 13:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7Kj-0004gr-Lt
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:57 -0500
Received: from mail-dm6nam04on2047.outbound.protection.outlook.com
 ([40.107.102.47] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7Kh-0002ob-BD
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaVFjZ/KVmTVWp1o+AUk7gOPMMqkOMOQ++0CfKN6Ezie1gx1WJtZfCdR7M6NfvomhYd7NY0/PRzNcqMSbhnndDs0XN/p2BKs6DUkTeaBKyROrz9R+qvDW5JVfjgOQP9gZblrhe6kLxd1BBaeSjw1qmP6ecYDKlcZg1HiO4g0VKbngDJ/AN6JPs6793c2C1RpTpjepxTXZy1+SniZhszV1EUsoqbT5Jsay44x2HWuRWkRgEhS8PbEw5uvmn5ZO81qm8LPp3/0vY/NqP/Ldgi46z3gKbqiq5TbZ3ibt6n0cKPs1GmrbiIK4covUSYRGRxULFilolRn/B/dS68x6pzAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDhUpA/lzIC42tK94W5IVr5b7fPs8P3l4LlOB5P7rsA=;
 b=Lgc55ZRFWmr3XmCbX8rE7pzCE34I/K1Wc3S0rRCNM2MR4BxjvuiglpcLy3xL88b7WlKoa/Zeyzyy7PNLx0srsj0bQEQcmKRhbPVOV48gHv0sLc2eR+yfgZr6x6Lx3+02tN9fQ7U82G48IgoCaJOi2tX4/oqoGQw9ZnRT1xNSw+YtaDjmKAfBStaLW62/8xGFbE7EHY9XpA4wJaM6efiIJT3PegP8lUBnUsu47D7m7XVtd1LxXUmY5BGnXPiP9RitmPqbr52Wa3BfTd1LL2eZgxNfdaJefbUc/1i/0CnCAMAY1OPOvu2WkPOuJWX66h3RcOnHuSIxdFtjK70LihZ1QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDhUpA/lzIC42tK94W5IVr5b7fPs8P3l4LlOB5P7rsA=;
 b=Ii3DgqcKaTqrHNtnGQBTigaSvaXE2tF/0UJqkzlE01IeaAOsT3Fbag6purtph85CpLz9kfma19khf0P7MO72HJGgCCMFjsV20NqNUuGQhNv8FX1SqxBJ71R2gidTRPfX6fhbBzBUfXQB4LixThN1dn5OOk3rfd6Mbn1MMHnioxcSyE02b10pPlvqw0/v7JZqQBFC7qJQGG8ZLVA1Yhj96Twz0QOtTm6O3pbiG08KEJIabTU0+/8ZcBVrwtFHfTTtjBmTgsT1dE1GpvAVQZ0vNQLhsrM06hNqmcMsHIjFOH1fx4/bz3d2SSAtkTLZXL1j46QjExsTLyZjoukOy1DUlQ==
Received: from BN1PR10CA0030.namprd10.prod.outlook.com (2603:10b6:408:e0::35)
 by CO6PR12MB5428.namprd12.prod.outlook.com (2603:10b6:5:35c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 18:50:43 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::c2) by BN1PR10CA0030.outlook.office365.com
 (2603:10b6:408:e0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:50:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Thu, 26 Jan 2023 18:50:43 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:50:34 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:50:34 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:50:30 -0800
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
Subject: [PATCH 09/18] vfio/common: Add device dirty page tracking start/stop
Date: Thu, 26 Jan 2023 20:49:39 +0200
Message-ID: <20230126184948.10478-10-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT004:EE_|CO6PR12MB5428:EE_
X-MS-Office365-Filtering-Correlation-Id: da20e7b5-8dc5-45b1-12a7-08daffce3a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s3hjxv58ydtTkeRgFRt4GFcoPq60uX1bwkBfRIP2DyRgmv28mtObJgMsV8nXI1iZt0Os9OSE3sRU7k+lyI+mPKhzvVMr11ZbF99Yh+MakDHeP7EY8HOdBzQAXxYMwYBKjAyHwhM1wG6jzuvD5d7D40775XgoCYcZ2ev1y1KTba2tdnDrHwe1XSXb6MXK87gmlPawWXbez9sf/nMpOzaFe68q+tyG5fgUt0GSv3nzYdkaDXuvy4mA3B9n/qUdNoan/BUcIEFVBr+d1ygbcmCCsG5PtqBLIiZR1WrCU2nC6TfTI9CEE816RihHSaL++JPVWFlLgS26HOofxgICXDrZLSHv2d+qdADf2ZqJGiRlCRfY2RPFFJnw7+D2LtGxZA2o2sLurVL2IjDlivXMDfQWCDrP97cqN9G27p8+hpJ7jedaYG0TZJ9n3/uq1xDt84R2I9+v/E48ZGQoXFx2+2qgKDUKf11jiyz2CyZFLiBYyjpyHFzC6oTsm3En+eTNwTEdklUOP0LoH9Jvq4mmyKbGtRznE63VQErIz6XpumMeLc/QtI6UmKIwWKXzf+kBo/iZ93ELBvTJCIhCsgtpp+S22QzV8RT4Ybd0VVrVGK5BXZeE3jNhu1KHKSHiS8OdCkutL5LZ+wbowLtqvFhDALa+ZPPtwmEYdlgquNjqGOcTqr+uZ5WIzV2myJUEYAwv4oxXDIknqUadFslXiKRYKb/ixpWZ48+l/Tp465c2qbMS/s8=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(40460700003)(36756003)(7696005)(8676002)(54906003)(478600001)(316002)(1076003)(5660300002)(7416002)(2906002)(6916009)(4326008)(70586007)(41300700001)(70206006)(8936002)(82740400003)(7636003)(36860700001)(356005)(40480700001)(336012)(26005)(86362001)(2616005)(82310400005)(83380400001)(426003)(186003)(47076005)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:50:43.1667 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da20e7b5-8dc5-45b1-12a7-08daffce3a58
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5428
Received-SPF: softfail client-ip=40.107.102.47;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
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

From: Joao Martins <joao.m.martins@oracle.com>

Add device dirty page tracking start/stop functionality. This uses the
device DMA logging uAPI to start and stop dirty page tracking by device.

Device dirty page tracking is used only if all devices within a
container support device dirty page tracking.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 include/hw/vfio/vfio-common.h |   2 +
 hw/vfio/common.c              | 211 +++++++++++++++++++++++++++++++++-
 2 files changed, 211 insertions(+), 2 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index d54000d7ae..cde6ffb9d6 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -151,6 +151,8 @@ typedef struct VFIODevice {
     VFIOMigration *migration;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
+    bool dirty_pages_supported;
+    bool dirty_tracking;
 } VFIODevice;
 
 struct VFIODeviceOps {
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index fafc361cea..005c060c67 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -422,6 +422,22 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
     return true;
 }
 
+static bool vfio_devices_all_device_dirty_tracking(VFIOContainer *container)
+{
+    VFIOGroup *group;
+    VFIODevice *vbasedev;
+
+    QLIST_FOREACH(group, &container->group_list, container_next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            if (!vbasedev->dirty_pages_supported) {
+                return false;
+            }
+        }
+    }
+
+    return true;
+}
+
 /*
  * Check if all VFIO devices are running and migration is active, which is
  * essentially equivalent to the migration being in pre-copy phase.
@@ -1355,13 +1371,192 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
     return ret;
 }
 
+static int vfio_devices_dma_logging_set(VFIOContainer *container,
+                                        struct vfio_device_feature *feature)
+{
+    bool status = (feature->flags & VFIO_DEVICE_FEATURE_MASK) ==
+                  VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
+    VFIODevice *vbasedev;
+    VFIOGroup *group;
+    int ret = 0;
+
+    QLIST_FOREACH(group, &container->group_list, container_next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            if (vbasedev->dirty_tracking == status) {
+                continue;
+            }
+
+            ret = ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
+            if (ret) {
+                ret = -errno;
+                error_report("%s: Failed to set DMA logging %s, err %d (%s)",
+                             vbasedev->name, status ? "start" : "stop", ret,
+                             strerror(errno));
+                goto out;
+            }
+            vbasedev->dirty_tracking = status;
+        }
+    }
+
+out:
+    return ret;
+}
+
+static int vfio_devices_dma_logging_stop(VFIOContainer *container)
+{
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
+                              sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
+
+    feature->argsz = sizeof(buf);
+    feature->flags = VFIO_DEVICE_FEATURE_SET;
+    feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_STOP;
+
+    return vfio_devices_dma_logging_set(container, feature);
+}
+
+static gboolean vfio_device_dma_logging_range_add(DMAMap *map, gpointer data)
+{
+    struct vfio_device_feature_dma_logging_range **out = data;
+    struct vfio_device_feature_dma_logging_range *range = *out;
+
+    range->iova = map->iova;
+    /* IOVATree is inclusive, DMA logging uAPI isn't, so add 1 to length */
+    range->length = map->size + 1;
+
+    *out = ++range;
+
+    return false;
+}
+
+static gboolean vfio_iova_tree_get_first(DMAMap *map, gpointer data)
+{
+    DMAMap *first = data;
+
+    first->iova = map->iova;
+    first->size = map->size;
+
+    return true;
+}
+
+static gboolean vfio_iova_tree_get_last(DMAMap *map, gpointer data)
+{
+    DMAMap *last = data;
+
+    last->iova = map->iova;
+    last->size = map->size;
+
+    return false;
+}
+
+static struct vfio_device_feature *
+vfio_device_feature_dma_logging_start_create(VFIOContainer *container)
+{
+    struct vfio_device_feature *feature;
+    size_t feature_size;
+    struct vfio_device_feature_dma_logging_control *control;
+    struct vfio_device_feature_dma_logging_range *ranges;
+    unsigned int max_ranges;
+    unsigned int cur_ranges;
+
+    feature_size = sizeof(struct vfio_device_feature) +
+                   sizeof(struct vfio_device_feature_dma_logging_control);
+    feature = g_malloc0(feature_size);
+    feature->argsz = feature_size;
+    feature->flags = VFIO_DEVICE_FEATURE_SET;
+    feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
+
+    control = (struct vfio_device_feature_dma_logging_control *)feature->data;
+    control->page_size = qemu_real_host_page_size();
+
+    QEMU_LOCK_GUARD(&container->mappings_mutex);
+
+    /*
+     * DMA logging uAPI guarantees to support at least num_ranges that fits into
+     * a single host kernel page. To be on the safe side, use this as a limit
+     * from which to merge to a single range.
+     */
+    max_ranges = qemu_real_host_page_size() / sizeof(*ranges);
+    cur_ranges = iova_tree_nnodes(container->mappings);
+    control->num_ranges = (cur_ranges <= max_ranges) ? cur_ranges : 1;
+    ranges = g_try_new0(struct vfio_device_feature_dma_logging_range,
+                        control->num_ranges);
+    if (!ranges) {
+        g_free(feature);
+        errno = ENOMEM;
+
+        return NULL;
+    }
+
+    control->ranges = (uint64_t)ranges;
+    if (cur_ranges <= max_ranges) {
+        iova_tree_foreach(container->mappings,
+                          vfio_device_dma_logging_range_add, &ranges);
+    } else {
+        DMAMap first, last;
+
+        iova_tree_foreach(container->mappings, vfio_iova_tree_get_first,
+                          &first);
+        iova_tree_foreach(container->mappings, vfio_iova_tree_get_last, &last);
+        ranges->iova = first.iova;
+        /* IOVATree is inclusive, DMA logging uAPI isn't, so add 1 to length */
+        ranges->length = (last.iova - first.iova) + last.size + 1;
+    }
+
+    return feature;
+}
+
+static void vfio_device_feature_dma_logging_start_destroy(
+    struct vfio_device_feature *feature)
+{
+    struct vfio_device_feature_dma_logging_control *control =
+        (struct vfio_device_feature_dma_logging_control *)feature->data;
+    struct vfio_device_feature_dma_logging_range *ranges =
+        (struct vfio_device_feature_dma_logging_range *)control->ranges;
+
+    g_free(ranges);
+    g_free(feature);
+}
+
+static int vfio_devices_dma_logging_start(VFIOContainer *container)
+{
+    struct vfio_device_feature *feature;
+    int ret;
+
+    feature = vfio_device_feature_dma_logging_start_create(container);
+    if (!feature) {
+        return -errno;
+    }
+
+    ret = vfio_devices_dma_logging_set(container, feature);
+    if (ret) {
+        vfio_devices_dma_logging_stop(container);
+    }
+
+    vfio_device_feature_dma_logging_start_destroy(feature);
+
+    return ret;
+}
+
 static void vfio_listener_log_global_start(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
     int ret;
 
-    ret = vfio_set_dirty_page_tracking(container, true);
+    if (vfio_devices_all_device_dirty_tracking(container)) {
+        if (vfio_have_giommu(container)) {
+            /* Device dirty page tracking currently doesn't support vIOMMU */
+            return;
+        }
+
+        ret = vfio_devices_dma_logging_start(container);
+    } else {
+        ret = vfio_set_dirty_page_tracking(container, true);
+    }
+
     if (ret) {
+        error_report("vfio: Could not start dirty page tracking, err: %d (%s)",
+                     ret, strerror(-ret));
         vfio_set_migration_error(ret);
     }
 }
@@ -1371,8 +1566,20 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
     int ret;
 
-    ret = vfio_set_dirty_page_tracking(container, false);
+    if (vfio_devices_all_device_dirty_tracking(container)) {
+        if (vfio_have_giommu(container)) {
+            /* Device dirty page tracking currently doesn't support vIOMMU */
+            return;
+        }
+
+        ret = vfio_devices_dma_logging_stop(container);
+    } else {
+        ret = vfio_set_dirty_page_tracking(container, false);
+    }
+
     if (ret) {
+        error_report("vfio: Could not stop dirty page tracking, err: %d (%s)",
+                     ret, strerror(-ret));
         vfio_set_migration_error(ret);
     }
 }
-- 
2.26.3



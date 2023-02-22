Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D695069FA6D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:51:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtGU-0000j0-Dr; Wed, 22 Feb 2023 12:50:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGO-0000cA-4J
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:44 -0500
Received: from mail-dm3nam02on20612.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::612]
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGL-0004d2-Sa
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeYAjPKoJ0CE3RySaNwCG/FUDujpVa7Cs6Pb9ZjQWyoR7VPOqCeVTnqDVVqZvy9QZrPNSQD15fUtCP/Cyy8C4ilQh50VkL3ZF2sx1Lae0Lziagz2nw+AdMPZAJC5RQbeE2c92jXa6rqfstJDQ1BOgZDpRgV204ZnlsQvy2Fa3+VYkPODG8J26o7WlCQVTQbfYhWlX+f61+I7K9aSNlPg6fAEB2SUJ+OBsZkAxqRsPHwGwra2CCF1i4/UeYRCZbXDnTZZXIXJZRjTVlEqusBf0kubk0Mc27ZLlnU1kfsIzVH9RPmabURuvzlTWyxeWVZ74TywmXZPqHI2Y20r8ZL9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogTmVdDZmLID0Fa/54YdVcKIXizIRBlUUe14ENDtHrM=;
 b=U4iBVf7CTTaXw6jp5XnF7820vHMQwwXKPLnlb5fzuh25yIYUlN732063g1nfzaaxjkGWAHtTTiqCs9uxZ6neO3FzM+Zyf2JCjwwz1cR3cybEXBw7QdLTWRpnFgfCqgpau7Q0twwp7PXdQXjAs7F2qcbpYbJywXlp+K4ZzNxFQOkNit/4PxBzMjF/UxsfApEXSqtME/E+AgjsBQ5QDLNRb0v4Vq17YVwbiPC8bpAoIxApDQS9KPBGuFBcAMVb7Zqy++UiP5FjKAfq5nLbXW09R+Zxd6UgUgImk+FAOqAPbroLUQQX3yhSqcSUml4g+TX6J249zD1L2KlF+Ke0GwLecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogTmVdDZmLID0Fa/54YdVcKIXizIRBlUUe14ENDtHrM=;
 b=hme4iFL+eB4ZuU4BqmbSlBQO9oB5I9pjd+MtdLemENX/ZKZUBFp9+1M0R9CHQquQp9QXNrFZbwIbbNp1JvKhpTnEnk8+Olb7RtWafn1xkxcJpFw+eCvZSdiE7kEURr9tjDSn78ilD/K1Aov8jYP+ynnetVCm4om/j2nvWwix0QnXIrUo40y5/E3m9JK8gFrmfWVhJTo18hzjhEj0ddmg+le9c6ASJq0Fdx3zCpERkCi3DqU+uG406cXxNKfcxfpoMV9RGNQuKxNk1jpD/sUnczhjof8ZhgJmCj2CvrT8Kvup63wAv+vDuyBj5IYjTuQ0rDUBMLP2pPhfAaSZmn3HEw==
Received: from BN0PR04CA0124.namprd04.prod.outlook.com (2603:10b6:408:ed::9)
 by DM4PR12MB8521.namprd12.prod.outlook.com (2603:10b6:8:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 17:50:38 +0000
Received: from BL02EPF0000C403.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::67) by BN0PR04CA0124.outlook.office365.com
 (2603:10b6:408:ed::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21 via Frontend
 Transport; Wed, 22 Feb 2023 17:50:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0000C403.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.14 via Frontend Transport; Wed, 22 Feb 2023 17:50:38 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:25 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:25 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:50:20 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, "Jason
 Wang" <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v2 11/20] vfio/common: Add device dirty page tracking
 start/stop
Date: Wed, 22 Feb 2023 19:49:06 +0200
Message-ID: <20230222174915.5647-12-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C403:EE_|DM4PR12MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: 841fada8-49cd-4c93-609d-08db14fd4efa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TrlL4BFw2SIq+dOgrmfKNVasnjGHvYn7OBzSppIFNJ1aB6JyUiUfuXJi5Y13GHNPD09FOGjAiOckr1/jOgk9F0WtoMkhD9hLYkMgNtG7ARraq8MvjWYbE6ZGoLH8KpTaIeNpj9ux0y0TRVl8MDzBg3jW+J/QRHPSMZ/A709OxkyQkgPKjwHkcPCARwF8MNPtna/hz2G2JGqiAvkveXKSudWyDbKV2oveDUBd0yO24lx1rcigqdrD346nRKrG+MpyKUGjdYz4KLCt7WmCNmE8jg46XsfNrLqLK7TfRWzw6PwaIVqQHTyk5b3KpprpcJ/h1nyMskGHOU0ihwt991zNao5HYSP+dKhDCpnaGhBpDJdJFAjlteifb/CLuL18K7+s55UikRegq4RPa17Az5GCzRyfSMDRfcEGjtoSRtfnM2Xpi/TpZ19VUQOTSIuGVbxEcBEV4hj6sJc2CcrHGzL2iFYJOkvgOE50K0lBEZuRI90T0gQRHJg6wM2GgULoYPmUOKjaQWKyBJ1feOS5QYBqFqeP/Iwbd8Qh8DkKMxELzlXFqCn8TMSV7qbJzSa2rjoxLjIliVFueurLFTaC7/Z5seycSH1jSwucZxin0eEVhXSJfy/BfLY98sBgJtqAoQ3iD3sxgTvjfWWnjXzHTjQ8HOaeb0SINO4fwRavTzm06PTPi7y/RHVg9dQPHeap1hz5KJyCUyiDT+3ub4voFJM6sHEGUZzm9qIlgegbk4vZ510=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(7696005)(82310400005)(26005)(336012)(186003)(36756003)(6916009)(478600001)(2616005)(426003)(86362001)(70206006)(83380400001)(70586007)(8676002)(1076003)(6666004)(47076005)(54906003)(316002)(4326008)(41300700001)(7416002)(8936002)(36860700001)(5660300002)(82740400003)(40480700001)(2906002)(7636003)(356005)(40460700003)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:50:38.5182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 841fada8-49cd-4c93-609d-08db14fd4efa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C403.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8521
Received-SPF: softfail client-ip=2a01:111:f400:7e83::612;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 6f36876ce0..1f21e1fa43 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -149,6 +149,8 @@ typedef struct VFIODevice {
     VFIOMigration *migration;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
+    bool dirty_pages_supported;
+    bool dirty_tracking;
 } VFIODevice;
 
 struct VFIODeviceOps {
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6041da6c7e..740153e7d7 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -473,6 +473,22 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
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
@@ -1404,13 +1420,192 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
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
@@ -1420,8 +1615,20 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
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



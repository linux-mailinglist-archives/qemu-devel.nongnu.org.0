Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BAE6AD46B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:05:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZMg7-0006tm-Cw; Mon, 06 Mar 2023 21:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMg5-0006sz-5G
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:45 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMg3-0004ww-4O
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:44 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326Nx6CO025153; Tue, 7 Mar 2023 02:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=vKfbrZSlP3Ezo9kwPcK88VsrHB2i63r60ouvVb4cxac=;
 b=gew/UQ+4CjCZY3KcMVReagpdneXoOE9tSaSIMURblG6gzGvSZsMAAvxJ3zUV7kWm82WA
 RQerPLwh0NxoVLS/LapOg7hSWdaaXK6KTHkAr14LsetGfBw0gcWlre40pAZ7q71gEwEM
 FbzZ+UmRpcFd3RZFrUsw9crrVdLYF3R1H20tV9uC0EAxS1WpimU2He8EVpgrMxvaSZ3W
 9IkbPdIzxyxS+tipa2NGN7UlBiEw2vIPtrGFQzMXef8ekKI98r8AXist/pzwPwUxtny7
 ZRHxDXtkn9xzBWINEBcf0U3gNJJfIm4MPAWb8Va9iFOEk8ZGVxhWYw70gJ25WoUJaIqt Zw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p5nn90s1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:41 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326NT6Kr037009; Tue, 7 Mar 2023 02:03:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txdubyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:40 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272356G016763;
 Tue, 7 Mar 2023 02:03:39 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-187-101.vpn.oracle.com
 [10.175.187.101])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3p4txdubf4-10; Tue, 07 Mar 2023 02:03:39 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 09/14] vfio/common: Add device dirty page tracking
 start/stop
Date: Tue,  7 Mar 2023 02:02:53 +0000
Message-Id: <20230307020258.58215-10-joao.m.martins@oracle.com>
In-Reply-To: <20230307020258.58215-1-joao.m.martins@oracle.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=771 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070017
X-Proofpoint-GUID: 3EbEo4SK8dvwJw8LKRAIoTEz4niRxaCl
X-Proofpoint-ORIG-GUID: 3EbEo4SK8dvwJw8LKRAIoTEz4niRxaCl
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Add device dirty page tracking start/stop functionality. This uses the
device DMA logging uAPI to start and stop dirty page tracking by device.

Device dirty page tracking is used only if all devices within a
container support device dirty page tracking.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/vfio/common.c              | 175 +++++++++++++++++++++++++++++++++-
 hw/vfio/trace-events          |   1 +
 include/hw/vfio/vfio-common.h |   2 +
 3 files changed, 173 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a9b1fc999121..a42f5f1e7ffe 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -450,6 +450,22 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
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
@@ -1407,16 +1423,158 @@ static void vfio_dirty_tracking_init(VFIOContainer *container,
     memory_listener_unregister(&dirty->listener);
 }
 
+static void vfio_devices_dma_logging_stop(VFIOContainer *container)
+{
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
+                              sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
+    VFIODevice *vbasedev;
+    VFIOGroup *group;
+    int ret = 0;
+
+    feature->argsz = sizeof(buf);
+    feature->flags = VFIO_DEVICE_FEATURE_SET |
+                     VFIO_DEVICE_FEATURE_DMA_LOGGING_STOP;
+
+    QLIST_FOREACH(group, &container->group_list, container_next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            if (!vbasedev->dirty_tracking) {
+                continue;
+            }
+
+            ret = ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
+            if (ret) {
+                warn_report("%s: Failed to stop DMA logging, err %d (%s)",
+                             vbasedev->name, ret, strerror(errno));
+            }
+            vbasedev->dirty_tracking = false;
+        }
+    }
+}
+
+static struct vfio_device_feature *
+vfio_device_feature_dma_logging_start_create(VFIOContainer *container,
+                                             VFIODirtyTrackingRange *tracking)
+{
+    struct vfio_device_feature *feature;
+    size_t feature_size;
+    struct vfio_device_feature_dma_logging_control *control;
+    struct vfio_device_feature_dma_logging_range *ranges;
+
+    feature_size = sizeof(struct vfio_device_feature) +
+                   sizeof(struct vfio_device_feature_dma_logging_control);
+    feature = g_try_malloc0(feature_size);
+    if (!feature) {
+        errno = ENOMEM;
+        return NULL;
+    }
+    feature->argsz = feature_size;
+    feature->flags = VFIO_DEVICE_FEATURE_SET |
+                     VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
+
+    control = (struct vfio_device_feature_dma_logging_control *)feature->data;
+    control->page_size = qemu_real_host_page_size();
+
+    /*
+     * DMA logging uAPI guarantees to support at least a number of ranges that
+     * fits into a single host kernel base page.
+     */
+    control->num_ranges = !!tracking->max32 + !!tracking->max64;
+    ranges = g_try_new0(struct vfio_device_feature_dma_logging_range,
+                        control->num_ranges);
+    if (!ranges) {
+        g_free(feature);
+        errno = ENOMEM;
+
+        return NULL;
+    }
+
+    control->ranges = (__u64)(uintptr_t)ranges;
+    if (tracking->max32) {
+        ranges->iova = tracking->min32;
+        ranges->length = (tracking->max32 - tracking->min32) + 1;
+        ranges++;
+    }
+    if (tracking->max64) {
+        ranges->iova = tracking->min64;
+        ranges->length = (tracking->max64 - tracking->min64) + 1;
+    }
+
+    trace_vfio_device_dirty_tracking_start(control->num_ranges,
+                                           tracking->min32, tracking->max32,
+                                           tracking->min64, tracking->max64);
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
+        (struct vfio_device_feature_dma_logging_range *)(uintptr_t) control->ranges;
+
+    g_free(ranges);
+    g_free(feature);
+}
+
+static int vfio_devices_dma_logging_start(VFIOContainer *container)
+{
+    struct vfio_device_feature *feature;
+    VFIODirtyRanges dirty;
+    VFIODevice *vbasedev;
+    VFIOGroup *group;
+    int ret = 0;
+
+    vfio_dirty_tracking_init(container, &dirty);
+    feature = vfio_device_feature_dma_logging_start_create(container,
+                                                           &dirty.ranges);
+    if (!feature) {
+        return -errno;
+    }
+
+    QLIST_FOREACH(group, &container->group_list, container_next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            if (vbasedev->dirty_tracking) {
+                continue;
+            }
+
+            ret = ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
+            if (ret) {
+                ret = -errno;
+                error_report("%s: Failed to start DMA logging, err %d (%s)",
+                             vbasedev->name, ret, strerror(errno));
+                goto out;
+            }
+            vbasedev->dirty_tracking = true;
+        }
+    }
+
+out:
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
-    VFIODirtyRanges dirty;
     int ret;
 
-    vfio_dirty_tracking_init(container, &dirty);
+    if (vfio_devices_all_device_dirty_tracking(container)) {
+        ret = vfio_devices_dma_logging_start(container);
+    } else {
+        ret = vfio_set_dirty_page_tracking(container, true);
+    }
 
-    ret = vfio_set_dirty_page_tracking(container, true);
     if (ret) {
+        error_report("vfio: Could not start dirty page tracking, err: %d (%s)",
+                     ret, strerror(-ret));
         vfio_set_migration_error(ret);
     }
 }
@@ -1424,10 +1582,17 @@ static void vfio_listener_log_global_start(MemoryListener *listener)
 static void vfio_listener_log_global_stop(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
-    int ret;
+    int ret = 0;
+
+    if (vfio_devices_all_device_dirty_tracking(container)) {
+        vfio_devices_dma_logging_stop(container);
+    } else {
+        ret = vfio_set_dirty_page_tracking(container, false);
+    }
 
-    ret = vfio_set_dirty_page_tracking(container, false);
     if (ret) {
+        error_report("vfio: Could not stop dirty page tracking, err: %d (%s)",
+                     ret, strerror(-ret));
         vfio_set_migration_error(ret);
     }
 }
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index d97a6de17921..7a7e0cfe5b23 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -105,6 +105,7 @@ vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t si
 vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
+vfio_device_dirty_tracking_start(int nr_ranges, uint64_t min32, uint64_t max32, uint64_t min64, uint64_t max64) "nr_ranges %d 32:[0x%"PRIx64" - 0x%"PRIx64"], 64:[0x%"PRIx64" - 0x%"PRIx64"]"
 vfio_disconnect_container(int fd) "close container->fd=%d"
 vfio_put_group(int fd) "close group->fd=%d"
 vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 0f84136cceb5..7817ca7d8706 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -156,6 +156,8 @@ typedef struct VFIODevice {
     VFIOMigration *migration;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
+    bool dirty_pages_supported;
+    bool dirty_tracking;
 } VFIODevice;
 
 struct VFIODeviceOps {
-- 
2.17.2



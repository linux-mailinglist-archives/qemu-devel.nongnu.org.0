Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782766AF294
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:54:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZcRB-0003EE-91; Tue, 07 Mar 2023 13:53:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcR8-0003Cx-5j
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcR6-0002WP-2G
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678215198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XGa9NsoxDdSPA2Y+xRCZnmleafRww0BCxSWvzq27ulM=;
 b=K996uoGrGz6e7LPWSKT0b32dHTm+yYyj7TFCjXZpFqxHwZYIWN4mtrEp5CLQzE9WITzRFg
 3FI6BjEnn5UrSge2IbUQ36lISZABeTVmZOWEVdXX9aXWnE2kelf5ZTt4nBaHqzX5i4VHHT
 cCN/fTXiYEZRWSDW1UGdK0npzQ5Sfvg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-BUggXL9TMPmyfxnz7pj1GQ-1; Tue, 07 Mar 2023 13:53:17 -0500
X-MC-Unique: BUggXL9TMPmyfxnz7pj1GQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D72A68027FD;
 Tue,  7 Mar 2023 18:53:16 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.16.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B809492C3E;
 Tue,  7 Mar 2023 18:53:16 +0000 (UTC)
Subject: [PULL 10/17] vfio/common: Add device dirty page tracking start/stop
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com,
 joao.m.martins@oracle.com
Date: Tue, 07 Mar 2023 11:53:16 -0700
Message-ID: <167821519606.619792.17775574953620635917.stgit@omen>
In-Reply-To: <167821508699.619792.1719671327865445814.stgit@omen>
References: <167821508699.619792.1719671327865445814.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Link: https://lore.kernel.org/r/20230307125450.62409-11-joao.m.martins@oracle.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c              |  173 ++++++++++++++++++++++++++++++++++++++++-
 hw/vfio/trace-events          |    1 
 include/hw/vfio/vfio-common.h |    2 
 3 files changed, 171 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 811502dbc97c..55498afeb255 100644
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
@@ -1407,16 +1423,156 @@ static void vfio_dirty_tracking_init(VFIOContainer *container,
     memory_listener_unregister(&dirty.listener);
 }
 
+static void vfio_devices_dma_logging_stop(VFIOContainer *container)
+{
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
+                              sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
+    VFIODevice *vbasedev;
+    VFIOGroup *group;
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
+            if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
+                warn_report("%s: Failed to stop DMA logging, err %d (%s)",
+                             vbasedev->name, -errno, strerror(errno));
+            }
+            vbasedev->dirty_tracking = false;
+        }
+    }
+}
+
+static struct vfio_device_feature *
+vfio_device_feature_dma_logging_start_create(VFIOContainer *container,
+                                             VFIODirtyRanges *tracking)
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
+        (struct vfio_device_feature_dma_logging_range *)(uintptr_t)control->ranges;
+
+    g_free(ranges);
+    g_free(feature);
+}
+
+static int vfio_devices_dma_logging_start(VFIOContainer *container)
+{
+    struct vfio_device_feature *feature;
+    VFIODirtyRanges ranges;
+    VFIODevice *vbasedev;
+    VFIOGroup *group;
+    int ret = 0;
+
+    vfio_dirty_tracking_init(container, &ranges);
+    feature = vfio_device_feature_dma_logging_start_create(container,
+                                                           &ranges);
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
-    VFIODirtyRanges ranges;
     int ret;
 
-    vfio_dirty_tracking_init(container, &ranges);
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
@@ -1424,10 +1580,17 @@ static void vfio_listener_log_global_start(MemoryListener *listener)
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
index dd9fd7b9bddb..bee95dbd977a 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -104,6 +104,7 @@ vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_wi
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
 vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
+vfio_device_dirty_tracking_start(int nr_ranges, uint64_t min32, uint64_t max32, uint64_t min64, uint64_t max64) "nr_ranges %d 32:[0x%"PRIx64" - 0x%"PRIx64"], 64:[0x%"PRIx64" - 0x%"PRIx64"]"
 vfio_disconnect_container(int fd) "close container->fd=%d"
 vfio_put_group(int fd) "close group->fd=%d"
 vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 87524c64a443..9551d2d43025 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -143,6 +143,8 @@ typedef struct VFIODevice {
     VFIOMigration *migration;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
+    bool dirty_pages_supported;
+    bool dirty_tracking;
 } VFIODevice;
 
 struct VFIODeviceOps {




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFD2581787
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:38:40 +0200 (CEST)
Received: from localhost ([::1]:37586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNZu-0003yt-RL
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNA6-0003T1-6d
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:58 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNA3-0006FI-VA
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:57 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn0Wd031705;
 Tue, 26 Jul 2022 16:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=NhL8BhU4N6jC7v2lMf9JIKfTxaOiUv20Gl3ngouOQn4=;
 b=aepuIZnSCDuLBfStW7SpgrAw4310D9lJjFJvSiSVNp6L8LC1AtjpqfbOZ0ExBiQCwZAr
 0Xhq3Vn9CySgEX8QSyGwHEAaN5dd4tdeX7xglEClA6lTno6SWHak4wbFn3G8Sf21zINe
 NQPVJtxucf07dG8KqIH7mt+PlV509Lakh7m7EHwpoq8x5UmpTA+dX+IycaMtoZfX6PKY
 jcEgOZfCFvwDX9msidsqn7OfHYEKXX6Yomn2j1Mw2qNtHLGLMSNrjOrgQdJWAOoZumTf
 aENp9AtbpSrY7+YeL6+qPuc6phneC6oefa8ZuXzgV3V2PCTCRM1D8yM18KuObTYSh1z/ yA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a4q1ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:36 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QEhMp5006143; Tue, 26 Jul 2022 16:11:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq2gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:35 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uTH023334;
 Tue, 26 Jul 2022 16:11:34 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-35; Tue, 26 Jul 2022 16:11:34 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 34/46] vfio-pci: recover from unmap-all-vaddr failure
Date: Tue, 26 Jul 2022 09:10:31 -0700
Message-Id: <1658851843-236870-35-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-ORIG-GUID: ik_M0MRs2MXvL-21vTuoGA3SHS3ms45D
X-Proofpoint-GUID: ik_M0MRs2MXvL-21vTuoGA3SHS3ms45D
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If there are multiple containers and unmap-all fails for some container, we
need to remap vaddr for the other containers for which unmap-all succeeded.
Recover by walking all flat sections of all containers to restore the vaddr
for each.  Do so by invoking the vfio listener callback, and passing a new
"remap" flag that tells it to restore a mapping without re-allocating new
userland data structures.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/common.c              | 79 ++++++++++++++++++++++++++++++++++---------
 hw/vfio/cpr.c                 | 36 ++++++++++++++++++++
 include/hw/vfio/vfio-common.h |  2 +-
 3 files changed, 100 insertions(+), 17 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index b7b35d4..de821e1 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -895,15 +895,35 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
     return true;
 }
 
+static VFIORamDiscardListener *vfio_find_ram_discard_listener(
+    VFIOContainer *container, MemoryRegionSection *section)
+{
+    VFIORamDiscardListener *vrdl;
+
+    QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
+        if (vrdl->mr == section->mr &&
+            vrdl->offset_within_address_space ==
+            section->offset_within_address_space) {
+            break;
+        }
+    }
+
+    if (!vrdl) {
+        hw_error("vfio: Trying to sync missing RAM discard listener");
+        /* does not return */
+    }
+    return vrdl;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
-    vfio_container_region_add(container, section);
+    vfio_container_region_add(container, section, false);
 }
 
 void vfio_container_region_add(VFIOContainer *container,
-                               MemoryRegionSection *section)
+                               MemoryRegionSection *section, bool remap)
 {
     hwaddr iova, end;
     Int128 llend, llsize;
@@ -1033,6 +1053,30 @@ void vfio_container_region_add(VFIOContainer *container,
         int iommu_idx;
 
         trace_vfio_listener_region_add_iommu(iova, end);
+
+        /*
+         * If remap, then VFIO_DMA_UNMAP_FLAG_VADDR has been called, and we
+         * want to remap the vaddr.  vfio_container_region_add was already
+         * called in the past, so the giommu already exists.  Find it and
+         * replay it, which calls vfio_dma_map further down the stack.
+         */
+
+        if (remap) {
+            hwaddr as_offset = section->offset_within_address_space;
+            hwaddr iommu_offset = as_offset - section->offset_within_region;
+
+            QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
+                if (giommu->iommu_mr == iommu_mr &&
+                    giommu->iommu_offset == iommu_offset) {
+                    memory_region_iommu_replay(giommu->iommu_mr, &giommu->n);
+                    return;
+                }
+            }
+            error_report("Container cannot find iommu region %s offset %lx",
+                memory_region_name(section->mr), iommu_offset);
+            goto fail;
+        }
+
         /*
          * FIXME: For VFIO iommu types which have KVM acceleration to
          * avoid bouncing all map/unmaps through qemu this way, this
@@ -1083,7 +1127,21 @@ void vfio_container_region_add(VFIOContainer *container,
      * about changes.
      */
     if (memory_region_has_ram_discard_manager(section->mr)) {
-        vfio_register_ram_discard_listener(container, section);
+        /*
+         * If remap, then VFIO_DMA_UNMAP_FLAG_VADDR has been called, and we
+         * want to remap the vaddr.  vfio_container_region_add was already
+         * called in the past, so the ram discard listener already exists.
+         * Call its populate function directly, which calls vfio_dma_map.
+         */
+        if (remap)  {
+            VFIORamDiscardListener *vrdl =
+                vfio_find_ram_discard_listener(container, section);
+            if (vrdl->listener.notify_populate(&vrdl->listener, section)) {
+                error_report("listener.notify_populate failed");
+            }
+        } else {
+            vfio_register_ram_discard_listener(container, section);
+        }
         return;
     }
 
@@ -1417,19 +1475,8 @@ static int vfio_sync_ram_discard_listener_dirty_bitmap(VFIOContainer *container,
                                                    MemoryRegionSection *section)
 {
     RamDiscardManager *rdm = memory_region_get_ram_discard_manager(section->mr);
-    VFIORamDiscardListener *vrdl = NULL;
-
-    QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
-        if (vrdl->mr == section->mr &&
-            vrdl->offset_within_address_space ==
-            section->offset_within_address_space) {
-            break;
-        }
-    }
-
-    if (!vrdl) {
-        hw_error("vfio: Trying to sync missing RAM discard listener");
-    }
+    VFIORamDiscardListener *vrdl =
+        vfio_find_ram_discard_listener(container, section);
 
     /*
      * We only want/can synchronize the bitmap for actually mapped parts -
diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
index 83f7872..1f682cb 100644
--- a/hw/vfio/cpr.c
+++ b/hw/vfio/cpr.c
@@ -34,6 +34,15 @@ vfio_dma_unmap_vaddr_all(VFIOContainer *container, Error **errp)
     return 0;
 }
 
+static int
+vfio_region_remap(MemoryRegionSection *section, void *handle, Error **errp)
+{
+    VFIOContainer *container = handle;
+    vfio_container_region_add(container, section, true);
+    container->vaddr_unmapped = false;
+    return 0;
+}
+
 static bool vfio_is_cpr_capable(VFIOContainer *container, Error **errp)
 {
     if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UPDATE_VADDR) ||
@@ -99,6 +108,30 @@ static const VMStateDescription vfio_container_vmstate = {
     }
 };
 
+static void vfio_cpr_fail_notifier(Notifier *notifier, void *data)
+{
+    MigrationState *s = data;
+    VFIOContainer *container;
+    Error *err = NULL;
+
+    if (!migration_has_failed(s) || migrate_mode_of(s) != MIG_MODE_CPR_EXEC) {
+        return;
+    }
+
+    container = container_of(notifier, VFIOContainer, cpr_notifier);
+    if (container->vaddr_unmapped) {
+
+        /* Set reused so vfio_dma_map restores vaddr */
+        container->reused = true;
+        if (address_space_flat_for_each_section(container->space->as,
+                                                vfio_region_remap,
+                                                container, &err)) {
+            error_report_err(err);
+        }
+        container->reused = false;
+    }
+}
+
 int vfio_cpr_register_container(VFIOContainer *container, Error **errp)
 {
     container->cpr_blocker = NULL;
@@ -109,6 +142,7 @@ int vfio_cpr_register_container(VFIOContainer *container, Error **errp)
 
     vmstate_register(NULL, -1, &vfio_container_vmstate, container);
 
+    migration_add_notifier(&container->cpr_notifier, vfio_cpr_fail_notifier);
     return 0;
 }
 
@@ -117,4 +151,6 @@ void vfio_cpr_unregister_container(VFIOContainer *container)
     migrate_del_blocker(&container->cpr_blocker);
 
     vmstate_unregister(NULL, &vfio_container_vmstate, container);
+
+    migration_remove_notifier(&container->cpr_notifier);
 }
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 17ad9ba..b682645 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -244,7 +244,7 @@ vfio_get_device_info_cap(struct vfio_device_info *info, uint16_t id);
 extern const MemoryListener vfio_prereg_listener;
 void vfio_listener_register(VFIOContainer *container);
 void vfio_container_region_add(VFIOContainer *container,
-                               MemoryRegionSection *section);
+                               MemoryRegionSection *section, bool remap);
 
 int vfio_spapr_create_window(VFIOContainer *container,
                              MemoryRegionSection *section,
-- 
1.8.3.1



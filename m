Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A8454CC7D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:17:29 +0200 (CEST)
Received: from localhost ([::1]:56982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Uls-0006sE-Gf
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOu-0007tK-JH
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:47 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOs-00017j-L3
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:44 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE0O97002206;
 Wed, 15 Jun 2022 14:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=nJx101IJZVWEr28ZpjAal2ADXBW3GJypga1w1V4oiMc=;
 b=KhXpzTFZ60kv/DBLZfb6b8x2mPFNwx/+3swYryKTIshURceoYd8IQSCwCRCkWFsIX53q
 Z3pA8I66SrXMXkupUjYxXv9pmbRskPfXPzdOQmIrti9Ai35aBx4oOlPvZ2wy2k6WcAiB
 mnQs2y+/J7Z1aLjtnyefPNl9kRleuI3NZnZDBG8bq+Cqa8B1rz0HcZ6/b1t4mXSODE/U
 PqBanBb6DlW6hsM8ztp9s7N2Y83piJCxfYifh3emDndAdnfOeCAuGtsYQojf5/VMgl93
 LBXcrVgYlJgHg6LTlzeg3lQXgwqPtcjrTiSaCoquaH+PEmtfXQFIbFX+Iu2jpz7Jlp1I Ag== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcrskr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:06 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7tR023103; Wed, 15 Jun 2022 14:53:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vq38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:05 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNh018501;
 Wed, 15 Jun 2022 14:53:04 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-31; Wed, 15 Jun 2022 14:53:04 +0000
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
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 30/39] vfio-pci: recover from unmap-all-vaddr failure
Date: Wed, 15 Jun 2022 07:52:17 -0700
Message-Id: <1655304746-102776-31-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: 1YltT1aB1BL_KxijSAo9n8qcGOmbejHY
X-Proofpoint-GUID: 1YltT1aB1BL_KxijSAo9n8qcGOmbejHY
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

If vfio_cpr_save fails to unmap all vaddr's, then recover by walking all
flat sections to restore the vaddr for each.  Do so by invoking the
vfio listener callback, and passing a new "replay" flag that tells it
to replay a mapping without re-allocating new userland data structures.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/common.c              | 66 ++++++++++++++++++++++++++++++++-----------
 hw/vfio/cpr.c                 | 29 +++++++++++++++++++
 include/hw/vfio/vfio-common.h |  2 +-
 3 files changed, 80 insertions(+), 17 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index c7d73b6..5f2bd50 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -895,15 +895,35 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
     return true;
 }
 
+static VFIORamDiscardListener *vfio_find_ram_discard_listener(
+    VFIOContainer *container, MemoryRegionSection *section)
+{
+    VFIORamDiscardListener *vrdl = NULL;
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
+                               MemoryRegionSection *section, bool replay)
 {
     hwaddr iova, end;
     Int128 llend, llsize;
@@ -1033,6 +1053,23 @@ void vfio_container_region_add(VFIOContainer *container,
         int iommu_idx;
 
         trace_vfio_listener_region_add_iommu(iova, end);
+
+        if (replay) {
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
@@ -1083,7 +1120,15 @@ void vfio_container_region_add(VFIOContainer *container,
      * about changes.
      */
     if (memory_region_has_ram_discard_manager(section->mr)) {
-        vfio_register_ram_discard_listener(container, section);
+        if (replay)  {
+            VFIORamDiscardListener *vrdl =
+                vfio_find_ram_discard_listener(container, section);
+            if (vfio_ram_discard_notify_populate(&vrdl->listener, section)) {
+                error_report("ram_discard_manager_replay_populated failed");
+            }
+        } else {
+            vfio_register_ram_discard_listener(container, section);
+        }
         return;
     }
 
@@ -1417,19 +1462,8 @@ static int vfio_sync_ram_discard_listener_dirty_bitmap(VFIOContainer *container,
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
index a227d5e..2b5e77c 100644
--- a/hw/vfio/cpr.c
+++ b/hw/vfio/cpr.c
@@ -32,6 +32,15 @@ vfio_dma_unmap_vaddr_all(VFIOContainer *container, Error **errp)
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
@@ -98,6 +107,22 @@ static const VMStateDescription vfio_container_vmstate = {
     }
 };
 
+static void vfio_cpr_save_failed_notifier(Notifier *notifier, void *data)
+{
+    Error *err;
+    VFIOContainer *container =
+        container_of(notifier, VFIOContainer, cpr_notifier);
+
+    /* Set reused so vfio_dma_map restores vaddr */
+    container->reused = true;
+    if (address_space_flat_for_each_section(container->space->as,
+                                            vfio_region_remap,
+                                            container, &err)) {
+        error_report_err(err);
+    }
+    container->reused = false;
+}
+
 int vfio_cpr_register_container(VFIOContainer *container, Error **errp)
 {
     container->cpr_blocker = NULL;
@@ -108,6 +133,8 @@ int vfio_cpr_register_container(VFIOContainer *container, Error **errp)
 
     vmstate_register(NULL, -1, &vfio_container_vmstate, container);
 
+    cpr_add_notifier(&container->cpr_notifier, vfio_cpr_save_failed_notifier,
+                     CPR_NOTIFY_SAVE_FAILED);
     return 0;
 }
 
@@ -116,4 +143,6 @@ void vfio_cpr_unregister_container(VFIOContainer *container)
     cpr_del_blocker(&container->cpr_blocker);
 
     vmstate_unregister(NULL, &vfio_container_vmstate, container);
+
+    cpr_remove_notifier(&container->cpr_notifier);
 }
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 17ad9ba..dd6bbcf 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -244,7 +244,7 @@ vfio_get_device_info_cap(struct vfio_device_info *info, uint16_t id);
 extern const MemoryListener vfio_prereg_listener;
 void vfio_listener_register(VFIOContainer *container);
 void vfio_container_region_add(VFIOContainer *container,
-                               MemoryRegionSection *section);
+                               MemoryRegionSection *section, bool replay);
 
 int vfio_spapr_create_window(VFIOContainer *container,
                              MemoryRegionSection *section,
-- 
1.8.3.1



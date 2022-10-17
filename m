Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9600600D7D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:14:28 +0200 (CEST)
Received: from localhost ([::1]:57978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okO4h-00058D-OD
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1okNvy-0001Rw-Tu
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:05:27 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136]:46354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1okNvn-0001Fp-Et
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:05:18 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id A89FA60EBB;
 Mon, 17 Oct 2022 13:54:28 +0300 (MSK)
Received: from dellarbn.yandex.net (unknown
 [2a02:6b8:0:107:3e85:844d:5b1d:60a])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 PrI3KDUSQF-sR7KTbLI; Mon, 17 Oct 2022 13:54:27 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1666004067; bh=ecLNYysUvaXK/QBAT76JIStY71ytLFpBTYT85le8ZPo=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=KOVb2sBaA07x55fMBAZBYlPf1jZOHkoYhpwGrjLyYol5NGYvoLYW44HUQccDaektU
 eoXqVhYRvqSKspvjBoq3q8O4BDia4Nx0KJbw+EwtNaYtN/y7t2KW4gU+hJLHo5CBtB
 j38sye8/tlyvSBjDsKAy7ya2M+q8ykMb8CkFRAa4=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
From: Andrey Ryabinin <arbn@yandex-team.com>
To: qemu-devel@nongnu.org
Cc: Steve Sistare <steven.sistare@oracle.com>, yc-core@yandex-team.ru,
 Andrey Ryabinin <arbn@yandex-team.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 3/4] vfio: Add 'group' property to 'vfio-pci' device
Date: Mon, 17 Oct 2022 13:54:06 +0300
Message-Id: <20221017105407.3858-4-arbn@yandex-team.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017105407.3858-1-arbn@yandex-team.com>
References: <20221017105407.3858-1-arbn@yandex-team.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=arbn@yandex-team.com; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Add 'group' properties to 'vfio-pci' device. This allows
to add vfio-pci device using precreated vfio container and group, e.g.

	-object vfio-container,id=ct,fd=5 \
        -object vfio-group,id=grp,fd=6,container=ct \
	-device vfio-pci,host=05:00.0,group=grp

Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
---
 hw/vfio/ap.c                  |  2 +-
 hw/vfio/ccw.c                 |  2 +-
 hw/vfio/common.c              | 45 ++++++++++++++++++++---------------
 hw/vfio/pci.c                 | 10 +++++++-
 hw/vfio/platform.c            |  2 +-
 include/hw/vfio/vfio-common.h |  2 +-
 6 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index e0dd561e85a..2a5c322883b 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -81,7 +81,7 @@ static VFIOGroup *vfio_ap_get_group(VFIOAPDevice *vapdev, Error **errp)
 
     g_free(group_path);
 
-    return vfio_get_group(groupid, &address_space_memory, errp);
+    return vfio_get_group(&vapdev->vdev, groupid, &address_space_memory, errp);
 }
 
 static void vfio_ap_realize(DeviceState *dev, Error **errp)
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 0354737666a..500f0f62163 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -650,7 +650,7 @@ static VFIOGroup *vfio_ccw_get_group(S390CCWDevice *cdev, Error **errp)
         return NULL;
     }
 
-    return vfio_get_group(groupid, &address_space_memory, errp);
+    return vfio_get_group(NULL, groupid, &address_space_memory, errp);
 }
 
 static void vfio_ccw_realize(DeviceState *dev, Error **errp)
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 95722ecf96a..64ace47822d 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -2271,30 +2271,35 @@ static void vfio_disconnect_container(VFIOGroup *group)
     object_unref(OBJECT(container));
 }
 
-VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
+VFIOGroup *vfio_get_group(VFIODevice *vdev, int groupid, AddressSpace *as, Error **errp)
 {
     VFIOGroup *group;
     struct vfio_group_status status = { .argsz = sizeof(status) };
 
-    QLIST_FOREACH(group, &vfio_group_list, next) {
-        if (group->groupid == groupid) {
-            /* Found it.  Now is it already in the right context? */
-            if (group->container->space->as == as) {
-                return group;
-            } else {
-                error_setg(errp, "group %d used in multiple address spaces",
-                           group->groupid);
-                return NULL;
+    if (!vdev->group) {
+        QLIST_FOREACH(group, &vfio_group_list, next) {
+            if (group->groupid == groupid) {
+                /* Found it.  Now is it already in the right context? */
+                if (group->container->space->as == as) {
+                    return group;
+                } else {
+                    error_setg(errp, "group %d used in multiple address spaces",
+                               group->groupid);
+                    return NULL;
+                }
             }
         }
-    }
-
-    group = VFIO_GROUP(object_new(TYPE_VFIO_GROUP));
-    object_property_set_int(OBJECT(group), "groupid", groupid, errp);
-    user_creatable_complete(USER_CREATABLE(group), errp);
-    if (*errp) {
-        object_unref(OBJECT(group));
-        return NULL;
+        group = VFIO_GROUP(object_new(TYPE_VFIO_GROUP));
+        object_property_set_int(OBJECT(group), "groupid", groupid, errp);
+        user_creatable_complete(USER_CREATABLE(group), errp);
+        if (*errp) {
+            object_unref(OBJECT(group));
+            return NULL;
+        }
+    } else {
+        group = vdev->group;
+        group->groupid = groupid;
+        object_ref(OBJECT(group));
     }
 
     if (vfio_connect_container(group, as, errp)) {
@@ -2388,7 +2393,9 @@ void vfio_put_base_device(VFIODevice *vbasedev)
     if (!vbasedev->group) {
         return;
     }
-    QLIST_REMOVE(vbasedev, next);
+    if (!QLIST_EMPTY(&vbasedev->group->device_list)) {
+            QLIST_REMOVE(vbasedev, next);
+    }
     vbasedev->group = NULL;
     trace_vfio_put_base_device(vbasedev->fd);
     close(vbasedev->fd);
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a9..d671eb74881 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -29,6 +29,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
+#include "monitor/monitor.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
@@ -2902,7 +2903,8 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
 
     trace_vfio_realize(vbasedev->name, groupid);
 
-    group = vfio_get_group(groupid, pci_device_iommu_address_space(pdev), errp);
+    group = vfio_get_group(&vdev->vbasedev, groupid,
+                           pci_device_iommu_address_space(pdev), errp);
     if (!group) {
         goto error;
     }
@@ -3190,6 +3192,7 @@ static void vfio_instance_finalize(Object *obj)
 static void vfio_exitfn(PCIDevice *pdev)
 {
     VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOGroup *group = vdev->vbasedev.group;
 
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
@@ -3204,6 +3207,8 @@ static void vfio_exitfn(PCIDevice *pdev)
     vfio_teardown_msi(vdev);
     vfio_bars_exit(vdev);
     vfio_migration_finalize(&vdev->vbasedev);
+
+    vfio_put_group(group);
 }
 
 static void vfio_pci_reset(DeviceState *dev)
@@ -3330,6 +3335,9 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
     pdc->exit = vfio_exitfn;
     pdc->config_read = vfio_pci_read_config;
     pdc->config_write = vfio_pci_write_config;
+    object_class_property_add_link(klass, "group", TYPE_VFIO_GROUP,
+                                   offsetof(VFIOPCIDevice, vbasedev.group),
+                                   object_property_allow_set_link, 0);
 }
 
 static const TypeInfo vfio_pci_dev_info = {
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 5af73f92876..3a72e085026 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -577,7 +577,7 @@ static int vfio_base_device_init(VFIODevice *vbasedev, Error **errp)
 
     trace_vfio_platform_base_device_init(vbasedev->name, groupid);
 
-    group = vfio_get_group(groupid, &address_space_memory, errp);
+    group = vfio_get_group(vbasedev, groupid, &address_space_memory, errp);
     if (!group) {
         return -ENOENT;
     }
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index f2d67093f44..79b43eb76b3 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -216,7 +216,7 @@ void vfio_region_unmap(VFIORegion *region);
 void vfio_region_exit(VFIORegion *region);
 void vfio_region_finalize(VFIORegion *region);
 void vfio_reset_handler(void *opaque);
-VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
+VFIOGroup *vfio_get_group(VFIODevice *vdev, int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
-- 
2.37.3



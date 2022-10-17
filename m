Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0123B600D9C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:20:17 +0200 (CEST)
Received: from localhost ([::1]:42640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okOAJ-0001Sk-UU
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1okNvy-0001Rx-U4
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:05:27 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136]:54284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1okNvq-0001IN-Lk
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:05:20 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 0238160EB0;
 Mon, 17 Oct 2022 13:54:27 +0300 (MSK)
Received: from dellarbn.yandex.net (unknown
 [2a02:6b8:0:107:3e85:844d:5b1d:60a])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 PrI3KDUSQF-sO7K69hh; Mon, 17 Oct 2022 13:54:25 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1666004065; bh=zo7zMEbss00aqj6jZXqzSYwpPO2/VtpkStNC3EWwfRw=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=m1QiDMN2F0PkPGFnW0/2tYkmLVQqBjSC0XXUxSIXIlRmISQRmlPfyZIIi4aaxBBX0
 nusufLJ6dLbhWYPrMZxMsMCT+qhCQ5kKB2I4oW6Vz19APz3tMAmTeioDb3+Ma4ctyd
 I3SBgnw0YPqk5ink6wwqlW3L5/bO5+tN0NIDuTME=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
From: Andrey Ryabinin <arbn@yandex-team.com>
To: qemu-devel@nongnu.org
Cc: Steve Sistare <steven.sistare@oracle.com>, yc-core@yandex-team.ru,
 Andrey Ryabinin <arbn@yandex-team.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 2/4] vfio: add vfio-group user createable object
Date: Mon, 17 Oct 2022 13:54:05 +0300
Message-Id: <20221017105407.3858-3-arbn@yandex-team.com>
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

Add vfio-group type and allow user to create such object via
'-object' command line argument or 'object-add' qmp command.
Parameters are:
 - @fd - file descriptor
 - @container - id of vfio-container object which will be used for
        this VFIO group
 - @groupid - number representing IOMMU group (no needed if @fd
                                           and @container were provided)
E.g.:
     -object vfio-container,id=ct,fd=5 \
     -object vfio-group,id=group,fd=6,container=ct

Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
---
 hw/vfio/common.c              | 267 +++++++++++++++++++++++-----------
 hw/vfio/trace-events          |   2 +-
 include/hw/vfio/vfio-common.h |   4 +
 qapi/qom.json                 |  15 ++
 4 files changed, 205 insertions(+), 83 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 392057d3025..95722ecf96a 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1911,31 +1911,40 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
                                Error **errp)
 {
     int iommu_type, ret;
+    struct vfio_group_status status = { .argsz = sizeof(status) };
 
     iommu_type = vfio_get_iommu_type(container, errp);
     if (iommu_type < 0) {
         return iommu_type;
     }
 
-    ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
+
+    ret = ioctl(group_fd, VFIO_GROUP_GET_STATUS, &status);
     if (ret) {
-        error_setg_errno(errp, errno, "Failed to set group container");
+        error_setg_errno(errp, errno, "Failed to get group status");
         return -errno;
     }
-
-    while (ioctl(container->fd, VFIO_SET_IOMMU, iommu_type)) {
-        if (iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
-            /*
-             * On sPAPR, despite the IOMMU subdriver always advertises v1 and
-             * v2, the running platform may not support v2 and there is no
-             * way to guess it until an IOMMU group gets added to the container.
-             * So in case it fails with v2, try v1 as a fallback.
-             */
-            iommu_type = VFIO_SPAPR_TCE_IOMMU;
-            continue;
+    if (!(status.flags & VFIO_GROUP_FLAGS_CONTAINER_SET)) {
+        ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
+        if (ret) {
+            error_setg_errno(errp, errno, "Failed to set group container");
+            return -errno;
+        }
+
+        while (ioctl(container->fd, VFIO_SET_IOMMU, iommu_type)) {
+            if (iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
+                /*
+                 * On sPAPR, despite the IOMMU subdriver always advertises v1 and
+                 * v2, the running platform may not support v2 and there is no
+                 * way to guess it until an IOMMU group gets added to the container.
+                 * So in case it fails with v2, try v1 as a fallback.
+                 */
+                iommu_type = VFIO_SPAPR_TCE_IOMMU;
+                continue;
+            }
+            error_setg_errno(errp, errno, "Failed to set iommu for container");
+            return -errno;
         }
-        error_setg_errno(errp, errno, "Failed to set iommu for container");
-        return -errno;
     }
 
     container->iommu_type = iommu_type;
@@ -2050,34 +2059,44 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
      * with some IOMMU types. vfio_ram_block_discard_disable() handles the
      * details once we know which type of IOMMU we are using.
      */
-
-    QLIST_FOREACH(container, &space->containers, next) {
-        if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
-            ret = vfio_ram_block_discard_disable(container, true);
-            if (ret) {
-                error_setg_errno(errp, -ret,
-                                 "Cannot set discarding of RAM broken");
-                if (ioctl(group->fd, VFIO_GROUP_UNSET_CONTAINER,
-                          &container->fd)) {
-                    error_report("vfio: error disconnecting group %d from"
-                                 " container", group->groupid);
+    if (!group->container) {
+        QLIST_FOREACH(container, &space->containers, next) {
+            if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
+                ret = vfio_ram_block_discard_disable(container, true);
+                if (ret) {
+                    error_setg_errno(errp, -ret,
+                                     "Cannot set discarding of RAM broken");
+                    if (ioctl(group->fd, VFIO_GROUP_UNSET_CONTAINER,
+                              &container->fd)) {
+                        error_report("vfio: error disconnecting group %d from"
+                                     " container", group->groupid);
+                    }
+                    return ret;
                 }
-                return ret;
+                group->container = container;
+                QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+                vfio_kvm_device_add_group(group);
+                return 0;
             }
-            group->container = container;
-            QLIST_INSERT_HEAD(&container->group_list, group, container_next);
-            vfio_kvm_device_add_group(group);
-            return 0;
         }
-    }
+        container = VFIO_CONTAINER(object_new(TYPE_VFIO_CONTAINER));
+        container->space = space;
 
-    container = VFIO_CONTAINER(object_new(TYPE_VFIO_CONTAINER));
-    container->space = space;
-
-    user_creatable_complete(USER_CREATABLE(container), errp);
-    if (*errp) {
-        ret = -1;
-        goto free_container_exit;
+        user_creatable_complete(USER_CREATABLE(container), errp);
+        if (*errp) {
+            ret = -1;
+            goto free_container_exit;
+        }
+        group->container = container;
+    } else if (group->container->initialized) {
+        object_ref(OBJECT(group->container));
+        QLIST_INSERT_HEAD(&group->container->group_list, group, container_next);
+        vfio_kvm_device_add_group(group);
+        return 0;
+    } else {
+        container = group->container;
+        container->space = space;
+        object_ref(OBJECT(container));
     }
 
     ret = vfio_init_container(container, group->fd, errp);
@@ -2228,6 +2247,10 @@ static void vfio_disconnect_container(VFIOGroup *group)
 {
     VFIOContainer *container = group->container;
 
+    if (!group->container) {
+            return;
+    }
+
     QLIST_REMOVE(group, container_next);
     group->container = NULL;
 
@@ -2251,7 +2274,6 @@ static void vfio_disconnect_container(VFIOGroup *group)
 VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
 {
     VFIOGroup *group;
-    char path[32];
     struct vfio_group_status status = { .argsz = sizeof(status) };
 
     QLIST_FOREACH(group, &vfio_group_list, next) {
@@ -2267,31 +2289,14 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
         }
     }
 
-    group = g_malloc0(sizeof(*group));
-
-    snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
-    group->fd = qemu_open_old(path, O_RDWR);
-    if (group->fd < 0) {
-        error_setg_errno(errp, errno, "failed to open %s", path);
-        goto free_group_exit;
-    }
-
-    if (ioctl(group->fd, VFIO_GROUP_GET_STATUS, &status)) {
-        error_setg_errno(errp, errno, "failed to get group %d status", groupid);
-        goto close_fd_exit;
-    }
-
-    if (!(status.flags & VFIO_GROUP_FLAGS_VIABLE)) {
-        error_setg(errp, "group %d is not viable", groupid);
-        error_append_hint(errp,
-                          "Please ensure all devices within the iommu_group "
-                          "are bound to their vfio bus driver.\n");
-        goto close_fd_exit;
+    group = VFIO_GROUP(object_new(TYPE_VFIO_GROUP));
+    object_property_set_int(OBJECT(group), "groupid", groupid, errp);
+    user_creatable_complete(USER_CREATABLE(group), errp);
+    if (*errp) {
+        object_unref(OBJECT(group));
+        return NULL;
     }
 
-    group->groupid = groupid;
-    QLIST_INIT(&group->device_list);
-
     if (vfio_connect_container(group, as, errp)) {
         error_prepend(errp, "failed to setup container for group %d: ",
                       groupid);
@@ -2302,15 +2307,10 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
         qemu_register_reset(vfio_reset_handler, NULL);
     }
 
-    QLIST_INSERT_HEAD(&vfio_group_list, group, next);
-
     return group;
 
 close_fd_exit:
-    close(group->fd);
-
-free_group_exit:
-    g_free(group);
+    object_unref(OBJECT(group));
 
     return NULL;
 }
@@ -2321,19 +2321,7 @@ void vfio_put_group(VFIOGroup *group)
         return;
     }
 
-    if (!group->ram_block_discard_allowed) {
-        vfio_ram_block_discard_disable(group->container, false);
-    }
-    vfio_kvm_device_del_group(group);
-    vfio_disconnect_container(group);
-    QLIST_REMOVE(group, next);
-    trace_vfio_put_group(group->fd);
-    close(group->fd);
-    g_free(group);
-
-    if (QLIST_EMPTY(&vfio_group_list)) {
-        qemu_unregister_reset(vfio_reset_handler, NULL);
-    }
+    object_unref(OBJECT(group));
 }
 
 int vfio_get_device(VFIOGroup *group, const char *name,
@@ -2676,8 +2664,123 @@ static const TypeInfo vfio_container_info = {
     },
 };
 
+static void vfio_group_set_fd(Object *obj, const char *value,
+                              Error **errp)
+{
+    VFIOGroup *group = VFIO_GROUP(obj);
+
+    group->fd = monitor_fd_param(monitor_cur(), value, errp);
+}
+
+static void vfio_group_set_groupid(Object *obj, Visitor *v,
+                                   const char *name, void *opaque,
+                                   Error **errp)
+{
+    VFIOGroup *group = VFIO_GROUP(obj);
+    Error *error = NULL;
+    uint32_t groupid;
+
+    visit_type_uint32(v, name, &groupid, &error);
+    if (error) {
+        error_propagate(errp, error);
+        return;
+    }
+
+    group->groupid = groupid;
+}
+
+static void vfio_group_complete(UserCreatable *uc, Error **errp)
+{
+    VFIOGroup *group = VFIO_GROUP(uc);
+    struct vfio_group_status status = { .argsz = sizeof(status) };
+
+    if (group->fd < 0 && group->groupid >= 0) {
+        char path[32];
+
+        snprintf(path, sizeof(path), "/dev/vfio/%d", group->groupid);
+
+        group->fd = qemu_open_old(path, O_RDWR);
+        if (group->fd < 0) {
+            error_setg_errno(errp, errno, "failed to open %s", path);
+            return;
+        }
+    }
+
+    if (ioctl(group->fd, VFIO_GROUP_GET_STATUS, &status)) {
+        error_setg_errno(errp, errno, "failed to get group %d status", group->groupid);
+        return;
+    }
+
+    if (!(status.flags & VFIO_GROUP_FLAGS_VIABLE)) {
+        error_setg(errp, "group %d is not viable", group->groupid);
+        error_append_hint(errp,
+                          "Please ensure all devices within the iommu_group "
+                          "are bound to their vfio bus driver.\n");
+    }
+}
+
+static void vfio_group_class_init(ObjectClass *class, void *data)
+{
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(class);
+    ucc->complete = vfio_group_complete;
+
+    object_class_property_add_link(class, "container", TYPE_VFIO_CONTAINER,
+                                   offsetof(VFIOGroup, container),
+                                   object_property_allow_set_link, 0);
+    object_class_property_add_str(class, "fd", NULL, vfio_group_set_fd);
+    object_class_property_add(class, "groupid", "int", NULL,
+                              vfio_group_set_groupid,
+                              NULL, NULL);
+}
+
+static void vfio_group_instance_init(Object *obj)
+{
+    VFIOGroup *group = VFIO_GROUP(obj);
+
+    QLIST_INIT(&group->device_list);
+    group->fd = -1;
+    group->groupid = -1;
+    QLIST_INSERT_HEAD(&vfio_group_list, group, next);
+}
+
+static void
+vfio_group_instance_finalize(Object *obj)
+{
+    VFIOGroup *group = VFIO_GROUP(obj);
+
+    if (!group->ram_block_discard_allowed) {
+        vfio_ram_block_discard_disable(group->container, false);
+    }
+
+    vfio_kvm_device_del_group(group);
+    vfio_disconnect_container(group);
+    QLIST_REMOVE(group, next);
+    trace_vfio_group_instance_finalize(group->fd);
+    if (group->fd >= 0) {
+        close(group->fd);
+    }
+
+    if (QLIST_EMPTY(&vfio_group_list)) {
+        qemu_unregister_reset(vfio_reset_handler, NULL);
+    }
+}
+
+static const TypeInfo vfio_group_info = {
+    .name = TYPE_VFIO_GROUP,
+    .parent = TYPE_OBJECT,
+    .class_init = vfio_group_class_init,
+    .instance_size = sizeof(VFIOGroup),
+    .instance_init = vfio_group_instance_init,
+    .instance_finalize = vfio_group_instance_finalize,
+    .interfaces = (InterfaceInfo[]) {
+        {TYPE_USER_CREATABLE},
+        {}
+    },
+};
+
 static void register_vfio_types(void)
 {
     type_register_static(&vfio_container_info);
+    type_register_static(&vfio_group_info);
 }
 type_init(register_vfio_types)
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 8b79cf33a33..6ae0ed09acd 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -105,7 +105,7 @@ vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t si
 vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_container_instance_finalize(int fd) "close container->fd=%d"
-vfio_put_group(int fd) "close group->fd=%d"
+vfio_group_instance_finalize(int fd) "close group->fd=%d"
 vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
 vfio_put_base_device(int fd) "close vdev->fd=%d"
 vfio_region_setup(const char *dev, int index, const char *name, unsigned long flags, unsigned long offset, unsigned long size) "Device %s, region %d \"%s\", flags: 0x%lx, offset: 0x%lx, size: 0x%lx"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 0ab99060e44..f2d67093f44 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -156,6 +156,7 @@ struct VFIODeviceOps {
 };
 
 typedef struct VFIOGroup {
+    Object parent;
     int fd;
     int groupid;
     VFIOContainer *container;
@@ -194,6 +195,9 @@ typedef struct VFIODisplay {
 #define TYPE_VFIO_CONTAINER "vfio-container"
 OBJECT_DECLARE_SIMPLE_TYPE(VFIOContainer, VFIO_CONTAINER)
 
+#define TYPE_VFIO_GROUP "vfio-group"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOGroup, VFIO_GROUP)
+
 void vfio_put_base_device(VFIODevice *vbasedev);
 void vfio_disable_irqindex(VFIODevice *vbasedev, int index);
 void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index);
diff --git a/qapi/qom.json b/qapi/qom.json
index d1a88e10b52..f46dd6b8034 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -746,6 +746,19 @@
 { 'struct': 'VFIOContainerProperties',
   'data': { 'fd': 'str' } }
 
+##
+# @VFIOGroupProperties:
+#
+# Properties for vfio-group objects.
+#
+# @fd: file descriptor of vfio group
+# @container: container
+#
+# Since: 7.2
+##
+{ 'struct': 'VFIOGroupProperties',
+  'data': { 'fd': 'str', 'container': 'str'} }
+
 ##
 # @VfioUserServerProperties:
 #
@@ -901,6 +914,7 @@
     'tls-creds-x509',
     'tls-cipher-suites',
     'vfio-container',
+    'vfio-group',
     { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
     { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
   ] }
@@ -967,6 +981,7 @@
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
       'vfio-container':             'VFIOContainerProperties',
+      'vfio-group':                 'VFIOGroupProperties',
       'x-remote-object':            'RemoteObjectProperties',
       'x-vfio-user-server':         'VfioUserServerProperties'
   } }
-- 
2.37.3



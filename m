Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621CC600D80
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:14:33 +0200 (CEST)
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okO4m-0005QG-CW
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1okNvy-0001Ry-8i
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:05:27 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136]:54280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1okNvq-0001IJ-LW
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:05:22 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 65AD160E94;
 Mon, 17 Oct 2022 13:54:24 +0300 (MSK)
Received: from dellarbn.yandex.net (unknown
 [2a02:6b8:0:107:3e85:844d:5b1d:60a])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 PrI3KDUSQF-sM7KnEEA; Mon, 17 Oct 2022 13:54:23 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1666004063; bh=kMM+N5Dh3Fi28eWzt4V2B1pW2mzLtqj1Y0XpSfOP7mY=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=WlvErUzyA6X7SkoW/j5092EcTPJ5b2+cqD6rjdLR8+8EnpJ8LfpQbxpnHlsv7b75N
 hClnNVq6ArnZimO6ihku9LFAAnyEhMgN4+H8bLXHEP+JYDzVnJwgoJEIpWB7crqzvk
 dgQMRDi/7PaH460MBGJEF4Ah5l8rdyXTpAE2V18s=
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
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 1/4] vfio: add vfio-container user createable object
Date: Mon, 17 Oct 2022 13:54:04 +0300
Message-Id: <20221017105407.3858-2-arbn@yandex-team.com>
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

Add vfio-container type and allow user to create vfio-container
object via '-object' command line argument or 'object-add' qmp command.
Add 'fd' parameter to this type to allow user provide file descriptor of
a vfio-container.

E.g.
 -object vfio-container,id=ct,fd=5

Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
---
 hw/vfio/common.c              | 183 ++++++++++++++++++++++------------
 hw/vfio/trace-events          |   2 +-
 include/hw/vfio/vfio-common.h |   4 +
 qapi/qom.json                 |  14 +++
 4 files changed, 137 insertions(+), 66 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6b5d8c0bf69..392057d3025 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -31,9 +31,11 @@
 #include "exec/memory.h"
 #include "exec/ram_addr.h"
 #include "hw/hw.h"
+#include "monitor/monitor.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/range.h"
+#include "qom/object_interfaces.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
@@ -2013,7 +2015,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
                                   Error **errp)
 {
     VFIOContainer *container;
-    int ret, fd;
+    int ret;
     VFIOAddressSpace *space;
 
     space = vfio_get_address_space(as);
@@ -2069,31 +2071,15 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
         }
     }
 
-    fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
-    if (fd < 0) {
-        error_setg_errno(errp, errno, "failed to open /dev/vfio/vfio");
-        ret = -errno;
-        goto put_space_exit;
-    }
+    container = VFIO_CONTAINER(object_new(TYPE_VFIO_CONTAINER));
+    container->space = space;
 
-    ret = ioctl(fd, VFIO_GET_API_VERSION);
-    if (ret != VFIO_API_VERSION) {
-        error_setg(errp, "supported vfio version: %d, "
-                   "reported version: %d", VFIO_API_VERSION, ret);
-        ret = -EINVAL;
-        goto close_fd_exit;
+    user_creatable_complete(USER_CREATABLE(container), errp);
+    if (*errp) {
+        ret = -1;
+        goto free_container_exit;
     }
 
-    container = g_malloc0(sizeof(*container));
-    container->space = space;
-    container->fd = fd;
-    container->error = NULL;
-    container->dirty_pages_supported = false;
-    container->dma_max_mappings = 0;
-    QLIST_INIT(&container->giommu_list);
-    QLIST_INIT(&container->hostwin_list);
-    QLIST_INIT(&container->vrdl_list);
-
     ret = vfio_init_container(container, group->fd, errp);
     if (ret) {
         goto free_container_exit;
@@ -2150,7 +2136,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
          * in this file.
          */
         if (!v2) {
-            ret = ioctl(fd, VFIO_IOMMU_ENABLE);
+            ret = ioctl(container->fd, VFIO_IOMMU_ENABLE);
             if (ret) {
                 error_setg_errno(errp, errno, "failed to enable container");
                 ret = -errno;
@@ -2171,7 +2157,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
         }
 
         info.argsz = sizeof(info);
-        ret = ioctl(fd, VFIO_IOMMU_SPAPR_TCE_GET_INFO, &info);
+        ret = ioctl(container->fd, VFIO_IOMMU_SPAPR_TCE_GET_INFO, &info);
         if (ret) {
             error_setg_errno(errp, errno,
                              "VFIO_IOMMU_SPAPR_TCE_GET_INFO failed");
@@ -2209,7 +2195,6 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
 
     vfio_kvm_device_add_group(group);
 
-    QLIST_INIT(&container->group_list);
     QLIST_INSERT_HEAD(&space->containers, container, next);
 
     group->container = container;
@@ -2223,29 +2208,18 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
         ret = -1;
         error_propagate_prepend(errp, container->error,
             "memory listener initialization failed: ");
-        goto listener_release_exit;
+        goto free_container_exit;
     }
 
     container->initialized = true;
 
     return 0;
-listener_release_exit:
-    QLIST_REMOVE(group, container_next);
-    QLIST_REMOVE(container, next);
-    vfio_kvm_device_del_group(group);
-    vfio_listener_release(container);
 
 enable_discards_exit:
     vfio_ram_block_discard_disable(container, false);
 
 free_container_exit:
-    g_free(container);
-
-close_fd_exit:
-    close(fd);
-
-put_space_exit:
-    vfio_put_address_space(space);
+    object_unref(OBJECT(container));
 
     return ret;
 }
@@ -2271,32 +2245,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
                      group->groupid);
     }
 
-    if (QLIST_EMPTY(&container->group_list)) {
-        VFIOAddressSpace *space = container->space;
-        VFIOGuestIOMMU *giommu, *tmp;
-        VFIOHostDMAWindow *hostwin, *next;
-
-        QLIST_REMOVE(container, next);
-
-        QLIST_FOREACH_SAFE(giommu, &container->giommu_list, giommu_next, tmp) {
-            memory_region_unregister_iommu_notifier(
-                    MEMORY_REGION(giommu->iommu_mr), &giommu->n);
-            QLIST_REMOVE(giommu, giommu_next);
-            g_free(giommu);
-        }
-
-        QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next,
-                           next) {
-            QLIST_REMOVE(hostwin, hostwin_next);
-            g_free(hostwin);
-        }
-
-        trace_vfio_disconnect_container(container->fd);
-        close(container->fd);
-        g_free(container);
-
-        vfio_put_address_space(space);
-    }
+    object_unref(OBJECT(container));
 }
 
 VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
@@ -2628,3 +2577,107 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
     }
     return vfio_eeh_container_op(container, op);
 }
+
+static void vfio_container_set_fd(Object *obj, const char *value,
+                                  Error **errp)
+{
+    VFIOContainer *ct = VFIO_CONTAINER(obj);
+
+    ct->fd = monitor_fd_param(monitor_cur(), value, errp);
+}
+
+static void vfio_container_complete(UserCreatable *uc, Error **errp)
+{
+    VFIOContainer *container = VFIO_CONTAINER(uc);
+    int ret;
+
+    if (container->fd < 0) {
+        int fd;
+
+        fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
+        if (fd < 0) {
+            error_setg_errno(errp, errno, "failed to open /dev/vfio/vfio");
+            return;
+        }
+        container->fd = fd;
+    }
+
+    ret = ioctl(container->fd, VFIO_GET_API_VERSION);
+    if (ret != VFIO_API_VERSION) {
+        error_setg(errp, "supported vfio version: %d, "
+                   "reported version: %d", VFIO_API_VERSION, ret);
+        return;
+    }
+}
+
+static void vfio_container_class_init(ObjectClass *class, void *data)
+{
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(class);
+    ucc->complete = vfio_container_complete;
+
+    object_class_property_add_str(class, "fd", NULL, vfio_container_set_fd);
+}
+
+static void vfio_container_instance_init(Object *obj)
+{
+    VFIOContainer *ct = VFIO_CONTAINER(obj);
+
+    ct->dirty_pages_supported = false;
+    ct->dma_max_mappings = 0;
+    ct->fd = -1;
+    QLIST_INIT(&ct->giommu_list);
+    QLIST_INIT(&ct->hostwin_list);
+    QLIST_INIT(&ct->group_list);
+    QLIST_INIT(&ct->vrdl_list);
+}
+
+static void
+vfio_container_instance_finalize(Object *obj)
+{
+    VFIOContainer *container = VFIO_CONTAINER(obj);
+    VFIOAddressSpace *space = container->space;
+    VFIOGuestIOMMU *giommu, *tmp;
+    VFIOHostDMAWindow *hostwin, *next;
+
+    QLIST_REMOVE(container, next);
+
+    QLIST_FOREACH_SAFE(giommu, &container->giommu_list, giommu_next, tmp) {
+        memory_region_unregister_iommu_notifier(
+            MEMORY_REGION(giommu->iommu_mr), &giommu->n);
+        QLIST_REMOVE(giommu, giommu_next);
+        g_free(giommu);
+    }
+    QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next,
+                       next) {
+        QLIST_REMOVE(hostwin, hostwin_next);
+        g_free(hostwin);
+    }
+
+
+    trace_vfio_container_instance_finalize(container->fd);
+    if (container->fd > 0) {
+        close(container->fd);
+    }
+    if (space) {
+        vfio_put_address_space(space);
+    }
+}
+
+static const TypeInfo vfio_container_info = {
+    .name = TYPE_VFIO_CONTAINER,
+    .parent = TYPE_OBJECT,
+    .class_init = vfio_container_class_init,
+    .instance_size = sizeof(VFIOContainer),
+    .instance_init = vfio_container_instance_init,
+    .instance_finalize = vfio_container_instance_finalize,
+    .interfaces = (InterfaceInfo[]) {
+        {TYPE_USER_CREATABLE},
+        {}
+    },
+};
+
+static void register_vfio_types(void)
+{
+    type_register_static(&vfio_container_info);
+}
+type_init(register_vfio_types)
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 73dffe9e00d..8b79cf33a33 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -104,7 +104,7 @@ vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_wi
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
 vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
-vfio_disconnect_container(int fd) "close container->fd=%d"
+vfio_container_instance_finalize(int fd) "close container->fd=%d"
 vfio_put_group(int fd) "close group->fd=%d"
 vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
 vfio_put_base_device(int fd) "close vdev->fd=%d"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index e573f5a9f19..0ab99060e44 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -77,6 +77,7 @@ typedef struct VFIOAddressSpace {
 struct VFIOGroup;
 
 typedef struct VFIOContainer {
+    Object parent;
     VFIOAddressSpace *space;
     int fd; /* /dev/vfio/vfio, empowered by the attached groups */
     MemoryListener listener;
@@ -190,6 +191,9 @@ typedef struct VFIODisplay {
     } dmabuf;
 } VFIODisplay;
 
+#define TYPE_VFIO_CONTAINER "vfio-container"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOContainer, VFIO_CONTAINER)
+
 void vfio_put_base_device(VFIODevice *vbasedev);
 void vfio_disable_irqindex(VFIODevice *vbasedev, int index);
 void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index);
diff --git a/qapi/qom.json b/qapi/qom.json
index 80dd419b392..d1a88e10b52 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -734,6 +734,18 @@
 { 'struct': 'RemoteObjectProperties',
   'data': { 'fd': 'str', 'devid': 'str' } }
 
+##
+# @VFIOContainerProperties:
+#
+# Properties for vfio-container objects.
+#
+# @fd: file descriptor of vfio container
+#
+# Since: 7.2
+##
+{ 'struct': 'VFIOContainerProperties',
+  'data': { 'fd': 'str' } }
+
 ##
 # @VfioUserServerProperties:
 #
@@ -888,6 +900,7 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
+    'vfio-container',
     { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
     { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
   ] }
@@ -953,6 +966,7 @@
       'tls-creds-psk':              'TlsCredsPskProperties',
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
+      'vfio-container':             'VFIOContainerProperties',
       'x-remote-object':            'RemoteObjectProperties',
       'x-vfio-user-server':         'VfioUserServerProperties'
   } }
-- 
2.37.3



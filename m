Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A119454CE1F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:14:08 +0200 (CEST)
Received: from localhost ([::1]:40730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Veg-00008Y-ON
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1VLu-0004Mq-Vy
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:54:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1VLs-0007O8-8Z
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655308479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tl2m+Nu+aFUk+18vHIScDJApxcWbTITea1ilYscgQFY=;
 b=GvInONfeBlIBv9JiM0tKtZkddhTk/Qb8+auVyNuUpzVy6iEESsmB6sTzuYAG7iYvtWux0+
 79ZWzGfddBhOHleAHm4JW4dvywOB3//o/56kl+gkbj2Ew1O7yl6zRpf+x/rmQJ2hb07Obx
 gg6wJBhbW4XNXAhZgAeenEs4Gf8yQwU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-VqVRoE9dMciBFTioZY9C9w-1; Wed, 15 Jun 2022 11:54:32 -0400
X-MC-Unique: VqVRoE9dMciBFTioZY9C9w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D42C3801756;
 Wed, 15 Jun 2022 15:54:31 +0000 (UTC)
Received: from localhost (unknown [10.39.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79F2A492C3B;
 Wed, 15 Jun 2022 15:54:31 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 <qemu-block@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, virtio-fs@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Julia Suvorova <jusual@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: [PULL 12/18] vfio-user: IOMMU support for remote device
Date: Wed, 15 Jun 2022 16:51:23 +0100
Message-Id: <20220615155129.1025811-13-stefanha@redhat.com>
In-Reply-To: <20220615155129.1025811-1-stefanha@redhat.com>
References: <20220615155129.1025811-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Jagannathan Raman <jag.raman@oracle.com>

Assign separate address space for each device in the remote processes.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: afe0b0a97582cdad42b5b25636a29c523265a10a.1655151679.git.jag.raman@oracle.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS               |   2 +
 include/hw/remote/iommu.h |  40 ++++++++++++
 hw/remote/iommu.c         | 131 ++++++++++++++++++++++++++++++++++++++
 hw/remote/machine.c       |  13 +++-
 hw/remote/meson.build     |   1 +
 5 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 hw/remote/iommu.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cbac72e239..563259101b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3644,6 +3644,8 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: hw/remote/iommu.c
+F: include/hw/remote/iommu.h
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/include/hw/remote/iommu.h b/include/hw/remote/iommu.h
new file mode 100644
index 0000000000..33b68a8f4b
--- /dev/null
+++ b/include/hw/remote/iommu.h
@@ -0,0 +1,40 @@
+/**
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_IOMMU_H
+#define REMOTE_IOMMU_H
+
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
+
+#ifndef INT2VOIDP
+#define INT2VOIDP(i) (void *)(uintptr_t)(i)
+#endif
+
+typedef struct RemoteIommuElem {
+    MemoryRegion *mr;
+
+    AddressSpace as;
+} RemoteIommuElem;
+
+#define TYPE_REMOTE_IOMMU "x-remote-iommu"
+OBJECT_DECLARE_SIMPLE_TYPE(RemoteIommu, REMOTE_IOMMU)
+
+struct RemoteIommu {
+    Object parent;
+
+    GHashTable *elem_by_devfn;
+
+    QemuMutex lock;
+};
+
+void remote_iommu_setup(PCIBus *pci_bus);
+
+void remote_iommu_unplug_dev(PCIDevice *pci_dev);
+
+#endif
diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
new file mode 100644
index 0000000000..fd723d91f3
--- /dev/null
+++ b/hw/remote/iommu.c
@@ -0,0 +1,131 @@
+/**
+ * IOMMU for remote device
+ *
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/remote/iommu.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
+#include "exec/memory.h"
+#include "exec/address-spaces.h"
+#include "trace.h"
+
+/**
+ * IOMMU for TYPE_REMOTE_MACHINE - manages DMA address space isolation
+ *     for remote machine. It is used by TYPE_VFIO_USER_SERVER.
+ *
+ * - Each TYPE_VFIO_USER_SERVER instance handles one PCIDevice on a PCIBus.
+ *   There is one RemoteIommu per PCIBus, so the RemoteIommu tracks multiple
+ *   PCIDevices by maintaining a ->elem_by_devfn mapping.
+ *
+ * - memory_region_init_iommu() is not used because vfio-user MemoryRegions
+ *   will be added to the elem->mr container instead. This is more natural
+ *   than implementing the IOMMUMemoryRegionClass APIs since vfio-user
+ *   provides something that is close to a full-fledged MemoryRegion and
+ *   not like an IOMMU mapping.
+ *
+ * - When a device is hot unplugged, the elem->mr reference is dropped so
+ *   all vfio-user MemoryRegions associated with this vfio-user server are
+ *   destroyed.
+ */
+
+static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
+                                              void *opaque, int devfn)
+{
+    RemoteIommu *iommu = opaque;
+    RemoteIommuElem *elem = NULL;
+
+    qemu_mutex_lock(&iommu->lock);
+
+    elem = g_hash_table_lookup(iommu->elem_by_devfn, INT2VOIDP(devfn));
+
+    if (!elem) {
+        elem = g_malloc0(sizeof(RemoteIommuElem));
+        g_hash_table_insert(iommu->elem_by_devfn, INT2VOIDP(devfn), elem);
+    }
+
+    if (!elem->mr) {
+        elem->mr = MEMORY_REGION(object_new(TYPE_MEMORY_REGION));
+        memory_region_set_size(elem->mr, UINT64_MAX);
+        address_space_init(&elem->as, elem->mr, NULL);
+    }
+
+    qemu_mutex_unlock(&iommu->lock);
+
+    return &elem->as;
+}
+
+void remote_iommu_unplug_dev(PCIDevice *pci_dev)
+{
+    AddressSpace *as = pci_device_iommu_address_space(pci_dev);
+    RemoteIommuElem *elem = NULL;
+
+    if (as == &address_space_memory) {
+        return;
+    }
+
+    elem = container_of(as, RemoteIommuElem, as);
+
+    address_space_destroy(&elem->as);
+
+    object_unref(elem->mr);
+
+    elem->mr = NULL;
+}
+
+static void remote_iommu_init(Object *obj)
+{
+    RemoteIommu *iommu = REMOTE_IOMMU(obj);
+
+    iommu->elem_by_devfn = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+
+    qemu_mutex_init(&iommu->lock);
+}
+
+static void remote_iommu_finalize(Object *obj)
+{
+    RemoteIommu *iommu = REMOTE_IOMMU(obj);
+
+    qemu_mutex_destroy(&iommu->lock);
+
+    g_hash_table_destroy(iommu->elem_by_devfn);
+
+    iommu->elem_by_devfn = NULL;
+}
+
+void remote_iommu_setup(PCIBus *pci_bus)
+{
+    RemoteIommu *iommu = NULL;
+
+    g_assert(pci_bus);
+
+    iommu = REMOTE_IOMMU(object_new(TYPE_REMOTE_IOMMU));
+
+    pci_setup_iommu(pci_bus, remote_iommu_find_add_as, iommu);
+
+    object_property_add_child(OBJECT(pci_bus), "remote-iommu", OBJECT(iommu));
+
+    object_unref(OBJECT(iommu));
+}
+
+static const TypeInfo remote_iommu_info = {
+    .name = TYPE_REMOTE_IOMMU,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(RemoteIommu),
+    .instance_init = remote_iommu_init,
+    .instance_finalize = remote_iommu_finalize,
+};
+
+static void remote_iommu_register_types(void)
+{
+    type_register_static(&remote_iommu_info);
+}
+
+type_init(remote_iommu_register_types)
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 4d008ed721..cbb2add291 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -20,6 +20,7 @@
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
+#include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
 
 static void remote_machine_init(MachineState *machine)
@@ -99,6 +100,16 @@ static void remote_machine_instance_init(Object *obj)
     s->auto_shutdown = true;
 }
 
+static void remote_machine_dev_unplug_cb(HotplugHandler *hotplug_dev,
+                                         DeviceState *dev, Error **errp)
+{
+    qdev_unrealize(dev);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        remote_iommu_unplug_dev(PCI_DEVICE(dev));
+    }
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -107,7 +118,7 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     mc->init = remote_machine_init;
     mc->desc = "Experimental remote machine";
 
-    hc->unplug = qdev_simple_device_unplug_cb;
+    hc->unplug = remote_machine_dev_unplug_cb;
 
     object_class_property_add_bool(oc, "vfio-user",
                                    remote_machine_get_vfio_user,
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 0eb5a0f375..ab25c04906 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iommu.c'))
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: libvfio_user_dep)
-- 
2.36.1



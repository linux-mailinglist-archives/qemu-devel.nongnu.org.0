Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A9B6B1D00
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 08:54:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paB5J-0005Lk-0g; Thu, 09 Mar 2023 02:53:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1paB5F-0005LV-Nj
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 02:53:05 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1paB5C-0000el-Us
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 02:53:05 -0500
Received: from dggpemm500002.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PXLv355xBznWtH;
 Thu,  9 Mar 2023 15:50:07 +0800 (CST)
Received: from dggpemm500010.china.huawei.com (7.185.36.134) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 15:52:57 +0800
Received: from dggpemm500010.china.huawei.com ([7.185.36.134]) by
 dggpemm500010.china.huawei.com ([7.185.36.134]) with mapi id 15.01.2507.021;
 Thu, 9 Mar 2023 15:52:57 +0800
To: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "wangzhigang (O)" <wangzhigang17@huawei.com>, "zhangliang (AG)"
 <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
Subject: [PATCH v3] virtio-balloon: optimize the virtio-balloon on the ARM
 platform
Thread-Topic: [PATCH v3] virtio-balloon: optimize the virtio-balloon on the
 ARM platform
Thread-Index: AQHZUi7A5PFV5xA+kk+ShXcQSn47C67yE0aw
Date: Thu, 9 Mar 2023 07:52:57 +0000
Message-ID: <e13bc78f96774bfab4576814c293aa52@huawei.com>
References: <20230309022752.1013-1-xiqi2@huawei.com>
In-Reply-To: <20230309022752.1013-1-xiqi2@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.184.140]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=yangming73@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Yangming <yangming73@huawei.com>
From:  Yangming via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Optimize the virtio-balloon feature on the ARM platform by adding
a variable to keep track of the current hot-plugged pc-dimm size,
instead of traversing the virtual machine's memory modules to count
the current RAM size during the balloon inflation or deflation
process. This variable can be updated only when plugging or unplugging
the device, which will result in an increase of approximately 60%
efficiency of balloon process on the ARM platform.

We tested the total amount of time required for the balloon inflation proce=
ss on ARM:
inflate the balloon to 64GB of a 128GB guest under stress.
Before: 102 seconds
After: 42 seconds

Signed-off-by: Qi Xi <xiqi2@huawei.com>
Signed-off-by: Ming Yang yangming73@huawei.com
---
 hw/mem/pc-dimm.c           |  7 +++++++
 hw/virtio/virtio-balloon.c | 33 +++++----------------------------
 include/hw/boards.h        |  2 ++
 3 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 50ef83215c..37f1f4ccfd 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -81,6 +81,10 @@ void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *mach=
ine)
=20
     memory_device_plug(MEMORY_DEVICE(dimm), machine);
     vmstate_register_ram(vmstate_mr, DEVICE(dimm));
+    /* count only "real" DIMMs, not NVDIMMs */
+    if (!object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM)) {
+        machine->device_memory->dimm_size +=3D memory_region_size(vmstate_=
mr);
+    }
 }
=20
 void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
@@ -90,6 +94,9 @@ void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *mac=
hine)
=20
     memory_device_unplug(MEMORY_DEVICE(dimm), machine);
     vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
+    if (!object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM)) {
+        machine->device_memory->dimm_size -=3D memory_region_size(vmstate_=
mr);
+    }
 }
=20
 static int pc_dimm_slot2bitmap(Object *obj, void *opaque)
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 746f07c4d2..2814a47cb1 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -729,37 +729,14 @@ static void virtio_balloon_get_config(VirtIODevice *v=
dev, uint8_t *config_data)
     memcpy(config_data, &config, virtio_balloon_config_size(dev));
 }
=20
-static int build_dimm_list(Object *obj, void *opaque)
-{
-    GSList **list =3D opaque;
-
-    if (object_dynamic_cast(obj, TYPE_PC_DIMM)) {
-        DeviceState *dev =3D DEVICE(obj);
-        if (dev->realized) { /* only realized DIMMs matter */
-            *list =3D g_slist_prepend(*list, dev);
-        }
-    }
-
-    object_child_foreach(obj, build_dimm_list, opaque);
-    return 0;
-}
-
 static ram_addr_t get_current_ram_size(void)
 {
-    GSList *list =3D NULL, *item;
-    ram_addr_t size =3D current_machine->ram_size;
-
-    build_dimm_list(qdev_get_machine(), &list);
-    for (item =3D list; item; item =3D g_slist_next(item)) {
-        Object *obj =3D OBJECT(item->data);
-        if (!strcmp(object_get_typename(obj), TYPE_PC_DIMM)) {
-            size +=3D object_property_get_int(obj, PC_DIMM_SIZE_PROP,
-                                            &error_abort);
-        }
+    MachineState *machine =3D MACHINE(qdev_get_machine());
+    if (machine->device_memory) {
+        return machine->ram_size + machine->device_memory->dimm_size;
+    } else {
+        return machine->ram_size;
     }
-    g_slist_free(list);
-
-    return size;
 }
=20
 static bool virtio_balloon_page_poison_support(void *opaque)
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 6fbbfd56c8..f840f88d54 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -292,10 +292,12 @@ struct MachineClass {
  * @base: address in guest physical address space where the memory
  * address space for memory devices starts
  * @mr: address space container for memory devices
+ * @dimm_size: the sum of plugged DIMMs' sizes
  */
 typedef struct DeviceMemoryState {
     hwaddr base;
     MemoryRegion mr;
+    uint64_t dimm_size;
 } DeviceMemoryState;
=20
 /**
--=20
2.33.0



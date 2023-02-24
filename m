Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758096A17E1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:24:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTN5-0000jX-M9; Fri, 24 Feb 2023 03:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1pVTN3-0000j0-4W
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:24:01 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1pVTN0-00046u-5D
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:24:00 -0500
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PNNF73CHTzrSKV;
 Fri, 24 Feb 2023 16:23:07 +0800 (CST)
Received: from dggpemm500010.china.huawei.com (7.185.36.134) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 24 Feb 2023 16:23:41 +0800
Received: from dggpemm500010.china.huawei.com ([7.185.36.134]) by
 dggpemm500010.china.huawei.com ([7.185.36.134]) with mapi id 15.01.2507.017;
 Fri, 24 Feb 2023 16:23:41 +0800
To: "mst@redhat.com" <mst@redhat.com>, "david@redhat.com" <david@redhat.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "wangzhigang (O)" <wangzhigang17@huawei.com>, "zhangliang (AG)"
 <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
Subject: [PATCH] virtio-balloon: optimize the virtio-balloon on the ARM
 platform.
Thread-Topic: [PATCH] virtio-balloon: optimize the virtio-balloon on the ARM
 platform.
Thread-Index: AQHZSCQZmUZViEBY20WTjbS5ZdYXUK7dwS0g
Date: Fri, 24 Feb 2023 08:23:40 +0000
Message-ID: <574cdaae1fd64fd7891f87a5899b5827@huawei.com>
References: <20230224074624.1531-1-xiqi2@huawei.com>
In-Reply-To: <20230224074624.1531-1-xiqi2@huawei.com>
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


Optimize the virtio-balloon feature on the ARM platform by adding a variabl=
e to keep track of the current hot-plugged pc-dimm size, instead of travers=
ing the virtual machine's memory modules to count the current RAM size duri=
ng the balloon inflation or deflation process. This variable can be updated=
 only when plugging or unplugging the device, which will result in an incre=
ase of more than 60% efficiency of balloon process on the ARM platform.

Signed-off-by: Qi Xi <xiqi2@huawei.com>
Signed-off-by: Ming Yang yangming73@huawei.com
---
 hw/mem/pc-dimm.c           |  2 ++
 hw/virtio/virtio-balloon.c | 44 +++++++++++++-------------------------
 include/hw/boards.h        |  1 +
 3 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c index 50ef83215c..192fc792=
2c 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -81,6 +81,7 @@ void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machi=
ne)
=20
     memory_device_plug(MEMORY_DEVICE(dimm), machine);
     vmstate_register_ram(vmstate_mr, DEVICE(dimm));
+    machine->device_memory->dimm_size +=3D vmstate_mr->size;
 }
=20
 void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine) @@ -90,6 +9=
1,7 @@ void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
=20
     memory_device_unplug(MEMORY_DEVICE(dimm), machine);
     vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
+    machine->device_memory->dimm_size -=3D vmstate_mr->size;
 }
=20
 static int pc_dimm_slot2bitmap(Object *obj, void *opaque) diff --git a/hw/=
virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c index 746f07c4d2..40fa=
40109d 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -729,37 +729,14 @@ static void virtio_balloon_get_config(VirtIODevice *v=
dev, uint8_t *config_data)
     memcpy(config_data, &config, virtio_balloon_config_size(dev));  }
=20
-static int build_dimm_list(Object *obj, void *opaque) -{
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
 static ram_addr_t get_current_ram_size(void)  {
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
+    if (machine->device_memory !=3D NULL) {
+        return machine->ram_size + machine->device_memory->dimm_size;
+    } else {
+        return machine->ram_size;
     }
-    g_slist_free(list);
-
-    return size;
 }
=20
 static bool virtio_balloon_page_poison_support(void *opaque) @@ -776,7 +75=
3,11 @@ static void virtio_balloon_set_config(VirtIODevice *vdev,
     VirtIOBalloon *dev =3D VIRTIO_BALLOON(vdev);
     struct virtio_balloon_config config;
     uint32_t oldactual =3D dev->actual;
-    ram_addr_t vm_ram_size =3D get_current_ram_size();
+    ram_addr_t vm_ram_size;
+    ram_addr_t vm_ram_size_new;
+
+retry:
+    vm_ram_size =3D get_current_ram_size();
=20
     memcpy(&config, config_data, virtio_balloon_config_size(dev));
     dev->actual =3D le32_to_cpu(config.actual); @@ -784,6 +765,11 @@ stati=
c void virtio_balloon_set_config(VirtIODevice *vdev,
         qapi_event_send_balloon_change(vm_ram_size -
                         ((ram_addr_t) dev->actual << VIRTIO_BALLOON_PFN_SH=
IFT));
     }
+    vm_ram_size_new =3D get_current_ram_size();
+    if (vm_ram_size_new !=3D vm_ram_size) {
+        goto retry;
+    }
+
     dev->poison_val =3D 0;
     if (virtio_balloon_page_poison_support(dev)) {
         dev->poison_val =3D le32_to_cpu(config.poison_val); diff --git a/i=
nclude/hw/boards.h b/include/hw/boards.h index 6fbbfd56c8..551b4b419e 10064=
4
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -296,6 +296,7 @@ struct MachineClass {  typedef struct DeviceMemoryState=
 {
     hwaddr base;
     MemoryRegion mr;
+    ram_addr_t dimm_size;
 } DeviceMemoryState;
=20
 /**
--
2.33.0



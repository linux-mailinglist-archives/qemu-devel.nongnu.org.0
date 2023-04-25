Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212176EDD01
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:46:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDMl-0006az-0l; Tue, 25 Apr 2023 03:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMY-0006U8-VY
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMX-0006fT-Eh
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xg1F/uN1S1AB6RN6Ne0LGmsnJ9OOP5fH2LaG08ayJMo=;
 b=P+iV4euBe/bgy4tMYOfEvSoRzSq3iKmVQzeEs4nh1yCNlVa00akX9vEgWeVkPU8MZX7zep
 JDkpCZE3BMg7uZyWb8c4Fao70lAcmVmTnUkjSE4KDNpOsj0/UU42UWXHWm8UW8cW+g0XYt
 TH5FKZEK4jTMRta+8v2ufLykWgUXq/s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-aeC-HCMgPAWmagLJhxPjLg-1; Tue, 25 Apr 2023 03:45:19 -0400
X-MC-Unique: aeC-HCMgPAWmagLJhxPjLg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f195c06507so51455545e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408717; x=1685000717;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xg1F/uN1S1AB6RN6Ne0LGmsnJ9OOP5fH2LaG08ayJMo=;
 b=jp2QSkAnWtYSDpfTmjdRZLSl50vMwHeFlgzYa2qsXsrTvJVJ8HJV0ATRW3YFibFOto
 5AOe09w+EZ0/GOZO8NLKKgmijwtBVauJ0MqmjpR2LrxIdi8LvoVOQUHWXlM0YQtEpdcA
 RJKxdNe4CUg0w51bZiUPfAfmVDLT6Lpsrh4ZtoKSZaOHTylL7QPkWswxVbx92Aswq1tl
 4YbyTv84EbsjG7tDUofw6xC2yjQY9I3C8ri3E+vZM9guMSJSkkhgdlmK4xq69+9dGWJB
 PIqSueiUuLiS8MB21LBIibfUqI+K/DesiqtCgerKRbmZagGQG/spqfS5SPQc8i8DDq9n
 ZjVw==
X-Gm-Message-State: AAQBX9dsfZB6CG6JmXkpxzvmA0Xdn/k8olePLyQG+1sJzyDIwG1+SBBN
 JIDZHohGStTlpk4xd+A3K1yx8XS/PPpaw8gvvVOXCJPGvel53A4HY3e4SUO/OnpwLEtz5BolA2e
 +FlwE7iJC84wQ26PbYVdgiAlwzQcem0Dgk/i3R5XOIMPzhQzLR8bhqAnx5MxAXCvc56Hz
X-Received: by 2002:a05:600c:28e:b0:3f1:69cc:4765 with SMTP id
 14-20020a05600c028e00b003f169cc4765mr9592285wmk.12.1682408717170; 
 Tue, 25 Apr 2023 00:45:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350bgZNvwrsyEyKP3Vs7ps0GKOR0/3AgObr8TGDIu+Lv+mhCrMhBF0kDlt2d44hZZNN/KBFDH7w==
X-Received: by 2002:a05:600c:28e:b0:3f1:69cc:4765 with SMTP id
 14-20020a05600c028e00b003f169cc4765mr9592266wmk.12.1682408716922; 
 Tue, 25 Apr 2023 00:45:16 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c468500b003f18141a016sm17011190wmo.18.2023.04.25.00.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:16 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yangming <yangming73@huawei.com>, Qi Xi <xiqi2@huawei.com>,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 08/31] virtio-balloon: optimize the virtio-balloon on the ARM
 platform
Message-ID: <e919402b9e05c964561623ddada9d49d0a05b850.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Yangming <yangming73@huawei.com>

Optimize the virtio-balloon feature on the ARM platform by adding
a variable to keep track of the current hot-plugged pc-dimm size,
instead of traversing the virtual machine's memory modules to count
the current RAM size during the balloon inflation or deflation
process. This variable can be updated only when plugging or unplugging
the device, which will result in an increase of approximately 60%
efficiency of balloon process on the ARM platform.

We tested the total amount of time required for the balloon inflation process on ARM:
inflate the balloon to 64GB of a 128GB guest under stress.
Before: 102 seconds
After: 42 seconds

Signed-off-by: Qi Xi <xiqi2@huawei.com>
Signed-off-by: Ming Yang yangming73@huawei.com
Message-Id: <e13bc78f96774bfab4576814c293aa52@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/hw/boards.h        |  2 ++
 hw/mem/pc-dimm.c           |  7 +++++++
 hw/virtio/virtio-balloon.c | 33 +++++----------------------------
 3 files changed, 14 insertions(+), 28 deletions(-)

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
 
 /**
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 50ef83215c..37f1f4ccfd 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -81,6 +81,10 @@ void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine)
 
     memory_device_plug(MEMORY_DEVICE(dimm), machine);
     vmstate_register_ram(vmstate_mr, DEVICE(dimm));
+    /* count only "real" DIMMs, not NVDIMMs */
+    if (!object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM)) {
+        machine->device_memory->dimm_size += memory_region_size(vmstate_mr);
+    }
 }
 
 void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
@@ -90,6 +94,9 @@ void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
 
     memory_device_unplug(MEMORY_DEVICE(dimm), machine);
     vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
+    if (!object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM)) {
+        machine->device_memory->dimm_size -= memory_region_size(vmstate_mr);
+    }
 }
 
 static int pc_dimm_slot2bitmap(Object *obj, void *opaque)
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 746f07c4d2..2814a47cb1 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -729,37 +729,14 @@ static void virtio_balloon_get_config(VirtIODevice *vdev, uint8_t *config_data)
     memcpy(config_data, &config, virtio_balloon_config_size(dev));
 }
 
-static int build_dimm_list(Object *obj, void *opaque)
-{
-    GSList **list = opaque;
-
-    if (object_dynamic_cast(obj, TYPE_PC_DIMM)) {
-        DeviceState *dev = DEVICE(obj);
-        if (dev->realized) { /* only realized DIMMs matter */
-            *list = g_slist_prepend(*list, dev);
-        }
-    }
-
-    object_child_foreach(obj, build_dimm_list, opaque);
-    return 0;
-}
-
 static ram_addr_t get_current_ram_size(void)
 {
-    GSList *list = NULL, *item;
-    ram_addr_t size = current_machine->ram_size;
-
-    build_dimm_list(qdev_get_machine(), &list);
-    for (item = list; item; item = g_slist_next(item)) {
-        Object *obj = OBJECT(item->data);
-        if (!strcmp(object_get_typename(obj), TYPE_PC_DIMM)) {
-            size += object_property_get_int(obj, PC_DIMM_SIZE_PROP,
-                                            &error_abort);
-        }
+    MachineState *machine = MACHINE(qdev_get_machine());
+    if (machine->device_memory) {
+        return machine->ram_size + machine->device_memory->dimm_size;
+    } else {
+        return machine->ram_size;
     }
-    g_slist_free(list);
-
-    return size;
 }
 
 static bool virtio_balloon_page_poison_support(void *opaque)
-- 
MST



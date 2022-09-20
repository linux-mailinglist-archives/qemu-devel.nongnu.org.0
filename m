Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454215BE37E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 12:41:47 +0200 (CEST)
Received: from localhost ([::1]:44532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaahF-0007r0-0G
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 06:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oaZuj-0000PS-7U
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:51:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33998 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oaZuc-0005Tv-Uh
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:51:35 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxnmsCjSljVJ8eAA--.35099S7; 
 Tue, 20 Sep 2022 17:51:28 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL v2 5/9] hw/loongarch: Add hotplug handler for machine
Date: Tue, 20 Sep 2022 17:50:54 +0800
Message-Id: <20220920095058.4124145-6-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220920095058.4124145-1-gaosong@loongson.cn>
References: <20220920095058.4124145-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxnmsCjSljVJ8eAA--.35099S7
X-Coremail-Antispam: 1UD129KBjvJXoW7AFW3JF1DGw13AF4DGw4rKrg_yoW5JrW3pF
 y7ZFyFqr4kWrsF939Iv345WF15Crs3Cay2qFs2yrsaka4DWr98XrW8A34DtFW8J3ykJFyF
 qw1kJ3y7Wa15Kw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Add hotplug handler for LoongArch virt machine and now only support
the dynamic sysbus device.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Acked-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220908094623.73051-6-yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/virt.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 5fd3834c0a..eedff10758 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -803,9 +803,35 @@ static void loongarch_machine_initfn(Object *obj)
     lams->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
 }
 
+static void loongarch_machine_device_plug_cb(HotplugHandler *hotplug_dev,
+                                        DeviceState *dev, Error **errp)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(hotplug_dev);
+    MachineClass *mc = MACHINE_GET_CLASS(lams);
+
+    if (device_is_dynamic_sysbus(mc, dev)) {
+        if (lams->platform_bus_dev) {
+            platform_bus_link_device(PLATFORM_BUS_DEVICE(lams->platform_bus_dev),
+                                     SYS_BUS_DEVICE(dev));
+        }
+    }
+}
+
+static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
+                                                        DeviceState *dev)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+
+    if (device_is_dynamic_sysbus(mc, dev)) {
+        return HOTPLUG_HANDLER(machine);
+    }
+    return NULL;
+}
+
 static void loongarch_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->desc = "Loongson-3A5000 LS7A1000 machine";
     mc->init = loongarch_init;
@@ -818,6 +844,8 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_VIRTIO;
     mc->default_boot_order = "c";
     mc->no_cdrom = 1;
+    mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
+    hc->plug = loongarch_machine_device_plug_cb;
 
     object_class_property_add(oc, "acpi", "OnOffAuto",
         loongarch_get_acpi, loongarch_set_acpi,
@@ -833,6 +861,10 @@ static const TypeInfo loongarch_machine_types[] = {
         .instance_size  = sizeof(LoongArchMachineState),
         .class_init     = loongarch_class_init,
         .instance_init = loongarch_machine_initfn,
+        .interfaces = (InterfaceInfo[]) {
+         { TYPE_HOTPLUG_HANDLER },
+         { }
+        },
     }
 };
 
-- 
2.31.1



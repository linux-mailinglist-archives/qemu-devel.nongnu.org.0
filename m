Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C676E6F54
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 00:23:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poti7-0002tY-BP; Tue, 18 Apr 2023 18:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1poti4-0002tB-GW
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:22:00 -0400
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1poti0-0004DW-Ji
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681856516; x=1713392516;
 h=subject:from:to:cc:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y83SEf3huL2egk1Tk0hLPZdVSqwdxnpe4xWNLb/AoEQ=;
 b=VRRQ1EE6giKqkGECEKWc6J1Ar0LwTZ5kvuExA7a/pFbSDOUNmisfVtCr
 KVW3zWJ/FAMTlKyjXKCxtyj1RG5Q4NN82C8jPdx8o+WwMQ2TUplxEN7oj
 muad7u6ioVasLCtaW9w1jPyoqPYKCA33CodgLISo2hJSZ69CDMKR4Gok8
 jbIZEIgpTfB78Fwa8qDsOD1B170lHeCjtG08soKsQnrCx1oLBZ3iuDunV
 M9rTBcPi1iI5oHLK1fslwyvxbdQEyqgvBh2al2BbVG7W5QqGKKeswpPPH
 pQuYgY8WIv9plCSoTg/rROCXSsvQBa/cz9x4ZKovUOfH91o/kj/xtnwMX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="329472118"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="329472118"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 15:21:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693796525"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="693796525"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [192.168.1.177])
 ([10.212.29.141])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 15:21:54 -0700
Subject: [RFC PATCH 3/3] acpi: add generic port device object
From: Dave Jiang <dave.jiang@intel.com>
To: qemu-devel@nongnu.org
Cc: imammedo@redhat.com, Jonathan.Cameron@huawei.com, ira.weiny@intel.com,
 mst@redhat.com, bwidawsk@kernel.org
Date: Tue, 18 Apr 2023 15:21:54 -0700
Message-ID: <168185651484.899932.17321694701773193620.stgit@djiang5-mobl3>
In-Reply-To: <168185633821.899932.322047053764766056.stgit@djiang5-mobl3>
References: <168185633821.899932.322047053764766056.stgit@djiang5-mobl3>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=dave.jiang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Dave Jiang <dave.jiang@intel.com>
---
 hw/acpi/genport.c           |   61 +++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build         |    1 +
 hw/i386/acpi-build.c        |   32 ++++++++++++++++++-----
 include/hw/acpi/aml-build.h |    4 +--
 softmmu/vl.c                |   26 ++++++++++++++++++
 5 files changed, 115 insertions(+), 9 deletions(-)
 create mode 100644 hw/acpi/genport.c

diff --git a/hw/acpi/genport.c b/hw/acpi/genport.c
new file mode 100644
index 000000000000..5738730323c2
--- /dev/null
+++ b/hw/acpi/genport.c
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Generic Port device implementation
+ *
+ * Copyright (C) 2023 Intel Corporation
+ */
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qom/object_interfaces.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_GENERIC_PORT_DEVICE "genport"
+
+#define GENPORT_NUMA_NODE_PROP "node"
+#define GENPORT_DEV_PROP       "genport"
+
+typedef struct GenericPortDevice {
+    /* private */
+    DeviceState parent_obj;
+
+    /* public */
+    uint32_t node;
+} GenericPortDevice;
+
+typedef struct GenericPortDeviceClass {
+        DeviceClass parent_class;
+} GenericPortDeviceClass;
+
+static Property genport_properties[] = {
+    DEFINE_PROP_UINT32(GENPORT_NUMA_NODE_PROP, GenericPortDevice, node, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+OBJECT_DEFINE_TYPE_WITH_INTERFACES(GenericPortDevice, genport_device,
+                                   GENERIC_PORT_DEVICE, DEVICE,
+                                   { TYPE_USER_CREATABLE },
+                                   { NULL })
+
+static void genport_device_init(Object *obj)
+{
+}
+
+static void genport_device_finalize(Object *obj)
+{
+}
+
+static void genport_device_realize(DeviceState *dev, Error **errp)
+{
+}
+
+static void genport_device_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = genport_device_realize;
+    dc->desc = "Generic Port";
+    device_class_set_props(dc, genport_properties);
+}
+
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index e0bf39bf4cd6..5247554998b0 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -5,6 +5,7 @@ acpi_ss.add(files(
   'bios-linker-loader.c',
   'core.c',
   'utils.c',
+  'genport.c',
 ))
 acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c', 'cpu_hotplug.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_false: files('acpi-cpu-hotplug-stub.c'))
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 0d9e610af12b..db850bfd170d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1514,12 +1514,22 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
             if (pci_bus_is_cxl(bus)) {
-                CxlHBDev *hb_entry;
+                CxlHBDev *hb_entry, *match;
+                bool found = false;
                 struct Aml *pkg = aml_package(2);
 
-                hb_entry = g_malloc0(sizeof(*hb_entry));
-                hb_entry->uid = bus_num;
-                QSLIST_INSERT_HEAD(&cxl_hb_list_head, hb_entry, entry);
+                QSLIST_FOREACH(match, &cxl_hb_list_head, entry)
+                {
+                    if (match->uid == bus_num) {
+                        found = true;
+                        break;
+                    }
+                }
+                if (!found) {
+                    hb_entry = g_malloc0(sizeof(*hb_entry));
+                    hb_entry->uid = bus_num;
+                    QSLIST_INSERT_HEAD(&cxl_hb_list_head, hb_entry, entry);
+                }
 
                 aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0016")));
                 aml_append(pkg, aml_eisaid("PNP0A08"));
@@ -1892,6 +1902,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                                 NULL);
     AcpiTable table = { .sig = "SRAT", .rev = 1, .oem_id = x86ms->oem_id,
                         .oem_table_id = x86ms->oem_table_id };
+    int pxm_domain;
 
     acpi_table_begin(&table, table_data);
     build_append_int_noprefix(table_data, 1, 4); /* Reserved */
@@ -1986,16 +1997,23 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 
     sgx_epc_build_srat(table_data);
 
+    /* FIXME: this is a hack, need a node property for genport */
+    pxm_domain = 6;
     QSLIST_FOREACH(hb_entry, &cxl_hb_list_head, entry)
     {
         ACPIDeviceHandle handle = {
             .hid = "ACPI0016",
-            .uid = hb_entry->uid,
+            .reserved = { 0 },
         };
+        char uid_str[5];
         uint32_t flags = GEN_AFFINITY_ENABLED;
 
-        build_srat_generic_port_affinity(table_data, 0, nb_numa_nodes,
-                                         &handle, flags);
+        snprintf(uid_str, 4, "%u", hb_entry->uid);
+        memcpy(handle.uid, uid_str, 4);
+
+        build_srat_generic_port_affinity(table_data, 0, pxm_domain, &handle,
+                                         flags);
+        pxm_domain++;
     }
 
     /*
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 32a4f574abaa..4ad7f0268f65 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -222,8 +222,8 @@ typedef enum {
 typedef union ACPIDeviceHandle {
     struct {
         uint8_t hid[8];
-        uint32_t uid;
-        uint32_t reserved;
+        uint8_t uid[4];
+        uint8_t reserved[4];
     };
     uint64_t raw[2];
 } ACPIDeviceHandle;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 459588aa7d14..1ef1d9e5f383 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2523,6 +2523,31 @@ static void qemu_init_board(void)
     }
 }
 
+static int genport_realize_cb(Object *obj, void *opaque)
+{
+    DeviceState *dev = DEVICE(object_dynamic_cast(obj, TYPE_DEVICE));
+    ObjectClass *klass = object_get_class(obj);
+    ObjectClass *type_klass = object_class_by_name("genport");
+
+    if (!dev)
+            return 0;
+
+    if (dev->realized)
+            return 0;
+
+    if (klass != type_klass)
+            return 0;
+
+    qdev_realize(dev, NULL, &error_fatal);
+    return 0;
+}
+
+static void genports_realize(void)
+{
+        object_child_foreach_recursive(object_get_root(),
+                        genport_realize_cb, NULL);
+}
+
 static void qemu_create_cli_devices(void)
 {
     DeviceOption *opt;
@@ -2557,6 +2582,7 @@ static void qemu_create_cli_devices(void)
         loc_pop(&opt->loc);
     }
     rom_reset_order_override();
+    genports_realize();
 }
 
 static void qemu_machine_creation_done(void)




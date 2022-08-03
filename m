Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5187F588F05
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 16:59:39 +0200 (CEST)
Received: from localhost ([::1]:34692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJFqU-00014m-A9
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 10:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=207aa399e=bchalios@amazon.es>)
 id 1oJEdy-0005QW-1j
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 09:42:38 -0400
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:58719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=207aa399e=bchalios@amazon.es>)
 id 1oJEdu-00047P-7a
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 09:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.es; i=@amazon.es; q=dns/txt; s=amazon201209;
 t=1659534154; x=1691070154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QXYz39LWwKXIzjCNr/W99HiCY8msg68JHOXOlUPq+ZY=;
 b=cSIHYmaoSjcct8OEMpxqiuJDV4xY/T5ykhPLIRVpajKrtARujIBbR3uM
 YxFUe4etT4kfRukI3eqZHsvjGBwKrZM4WGUsR+KopeBLKo6NCPNxA+sfH
 fP+TapeCq4tAV/+/H1AEkUnn9bvbYVx4EMVICIHB8J+73DUlMRWwUqdXx Y=;
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1a-2d7489a4.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6001.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 13:42:19 +0000
Received: from EX13D37EUA003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1a-2d7489a4.us-east-1.amazon.com (Postfix) with
 ESMTPS id 0609584333; Wed,  3 Aug 2022 13:42:17 +0000 (UTC)
Received: from f4d4887fdcfb.ant.amazon.com (10.43.162.227) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Wed, 3 Aug 2022 13:42:13 +0000
From: <bchalios@amazon.es>
To: <qemu-devel@nongnu.org>
CC: <bchalios@amazon.es>, <ani@anisinha.ca>, <mst@redhat.com>,
 <imammedo@redhat.com>, <dwmw@amazon.co.uk>, <graf@amazon.de>,
 <xmarcalx@amazon.co.uk>
Subject: [PATCH 1/2] vmgenid: make device data size configurable
Date: Wed, 3 Aug 2022 15:41:46 +0200
Message-ID: <20220803134147.31073-2-bchalios@amazon.es>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220803134147.31073-1-bchalios@amazon.es>
References: <20220803134147.31073-1-bchalios@amazon.es>
MIME-Version: 1.0
X-Originating-IP: [10.43.162.227]
X-ClientProxiedBy: EX13D41UWC002.ant.amazon.com (10.43.162.127) To
 EX13D37EUA003.ant.amazon.com (10.43.165.7)
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=52.95.48.154;
 envelope-from=prvs=207aa399e=bchalios@amazon.es; helo=smtp-fw-6001.amazon.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 03 Aug 2022 10:54:38 -0400
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

From: Babis Chalios <bchalios@amazon.es>

When allocating memory for the device data the assumption is we are
dealing with 4K pages. Make this configurable, so that other
architectures can be handled.

Note, than in the original spec this is not a requirement, however, it
is useful for implementing the generation counter (see next commit in
this patchset) in architectures with page sizes other than 4K.

Signed-off-by: Babis Chalios <bchalios@amazon.es>
---
 docs/specs/vmgenid.txt    |  8 +++---
 hw/acpi/vmgenid.c         | 57 ++++++++++++++++++++++++++++++++++++---
 include/hw/acpi/vmgenid.h | 14 +++++-----
 3 files changed, 66 insertions(+), 13 deletions(-)

diff --git a/docs/specs/vmgenid.txt b/docs/specs/vmgenid.txt
index 80ff69f31c..5274b4c895 100644
--- a/docs/specs/vmgenid.txt
+++ b/docs/specs/vmgenid.txt
@@ -225,14 +225,16 @@ following diagram:
 Device Usage:
 -------------
 
-The device has one property, which may be only be set using the command line:
+The device has two properties, which may be only be set using the command line:
 
-  guid - sets the value of the GUID.  A special value "auto" instructs
+  guid - sets the value of the GUID. A special value "auto" instructs
          QEMU to generate a new random GUID.
+  page-size - sets the target machines page size. Currently accepted values
+              are 4096 (default) and 65536.
 
 For example:
 
-  QEMU  -device vmgenid,guid="324e6eaf-d1d1-4bf6-bf41-b9bb6c91fb87"
+  QEMU  -device vmgenid,guid="324e6eaf-d1d1-4bf6-bf41-b9bb6c91fb87",page-size=65536
   QEMU  -device vmgenid,guid=auto
 
 The property may be queried via QMP/HMP:
diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
index 0c9f158ac9..ac2b116b6a 100644
--- a/hw/acpi/vmgenid.c
+++ b/hw/acpi/vmgenid.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/visitor.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine.h"
 #include "qemu/module.h"
@@ -35,7 +36,7 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
     /* Fill in the GUID values.  These need to be converted to little-endian
      * first, since that's what the guest expects
      */
-    g_array_set_size(guid, VMGENID_FW_CFG_SIZE - ARRAY_SIZE(guid_le.data));
+    g_array_set_size(guid, vms->page_size - ARRAY_SIZE(guid_le.data));
     guid_le = qemu_uuid_bswap(vms->guid);
     /* The GUID is written at a fixed offset into the fw_cfg file
      * in order to implement the "OVMF SDT Header probe suppressor"
@@ -94,7 +95,8 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
     g_array_append_vals(table_data, ssdt->buf->data, ssdt->buf->len);
 
     /* Allocate guest memory for the Data fw_cfg blob */
-    bios_linker_loader_alloc(linker, VMGENID_GUID_FW_CFG_FILE, guid, 4096,
+    bios_linker_loader_alloc(linker, VMGENID_GUID_FW_CFG_FILE, guid,
+                             vms->page_size,
                              false /* page boundary, high memory */);
 
     /* Patch address of GUID fw_cfg blob into the ADDR fw_cfg blob
@@ -124,8 +126,7 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
 void vmgenid_add_fw_cfg(VmGenIdState *vms, FWCfgState *s, GArray *guid)
 {
     /* Create a read-only fw_cfg file for GUID */
-    fw_cfg_add_file(s, VMGENID_GUID_FW_CFG_FILE, guid->data,
-                    VMGENID_FW_CFG_SIZE);
+    fw_cfg_add_file(s, VMGENID_GUID_FW_CFG_FILE, guid->data, vms->page_size);
     /* Create a read-write fw_cfg file for Address */
     fw_cfg_add_file_callback(s, VMGENID_ADDR_FW_CFG_FILE, NULL, NULL, NULL,
                              vms->vmgenid_addr_le,
@@ -215,8 +216,56 @@ static void vmgenid_realize(DeviceState *dev, Error **errp)
     vmgenid_update_guest(vms);
 }
 
+static void get_page_size(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint32_t *page_size = object_field_prop_ptr(obj, prop);
+
+    visit_type_uint32(v, name, page_size, errp);
+}
+
+static void set_page_size(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint32_t *page_size = object_field_prop_ptr(obj, prop);
+    uint32_t val;
+    char str[10];
+
+    if (!visit_type_uint32(v, name, &val, errp)) {
+        return;
+    }
+
+    switch (val) {
+    case 4096:
+    case 65536:
+        *page_size = val;
+        break;
+    default:
+        snprintf(str, 10, "%d", val);
+        error_set_from_qdev_prop_error(errp, EINVAL, obj, name, str);
+    }
+}
+
+static void set_default_page_size(ObjectProperty *op, const Property *prop)
+{
+    object_property_set_default_uint(op, VMGENID_DEFAULT_FW_PAGE_SIZE);
+}
+
+const PropertyInfo vmgenid_prop_page_size = {
+    .name = "uint32",
+    .description = "Page size to use for allocating device memory. \""
+                   "\"Valid values: 4096(default) 65536",
+    .get = get_page_size,
+    .set = set_page_size,
+    .set_default_value = set_default_page_size,
+};
+
 static Property vmgenid_device_properties[] = {
     DEFINE_PROP_UUID(VMGENID_GUID, VmGenIdState, guid),
+    DEFINE_PROP_UNSIGNED(VMGENID_PAGE_SIZE, VmGenIdState, page_size, 0,
+                         vmgenid_prop_page_size, uint32_t),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
index dc8bb3433e..e4d83f5c74 100644
--- a/include/hw/acpi/vmgenid.h
+++ b/include/hw/acpi/vmgenid.h
@@ -6,15 +6,16 @@
 #include "qemu/uuid.h"
 #include "qom/object.h"
 
-#define TYPE_VMGENID           "vmgenid"
-#define VMGENID_GUID             "guid"
+#define TYPE_VMGENID                  "vmgenid"
+#define VMGENID_GUID                  "guid"
+#define VMGENID_PAGE_SIZE             "page-size"
 #define VMGENID_GUID_FW_CFG_FILE      "etc/vmgenid_guid"
 #define VMGENID_ADDR_FW_CFG_FILE      "etc/vmgenid_addr"
 
-#define VMGENID_FW_CFG_SIZE      4096 /* Occupy a page of memory */
-#define VMGENID_GUID_OFFSET      40   /* allow space for
-                                       * OVMF SDT Header Probe Supressor
-                                       */
+#define VMGENID_DEFAULT_FW_PAGE_SIZE  4096 /* Assume 4K page by default */
+#define VMGENID_GUID_OFFSET           40   /* allow space for OVMF SDT Header
+                                            * Probe Supressor
+                                            */
 
 OBJECT_DECLARE_SIMPLE_TYPE(VmGenIdState, VMGENID)
 
@@ -22,6 +23,7 @@ struct VmGenIdState {
     DeviceState parent_obj;
     QemuUUID guid;                /* The 128-bit GUID seen by the guest */
     uint8_t vmgenid_addr_le[8];   /* Address of the GUID (little-endian) */
+    uint32_t page_size;           /* Page size to use as a the allocation unit */
 };
 
 /* returns NULL unless there is exactly one device */
-- 
2.32.1 (Apple Git-133)

Amazon Spain Services sociedad limitada unipersonal, Calle Ramirez de Prado 5, 28045 Madrid. Registro Mercantil de Madrid . Tomo 22458 . Folio 102 . Hoja M-401234 . CIF B84570936



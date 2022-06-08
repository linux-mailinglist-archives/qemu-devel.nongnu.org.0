Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69FD5435FE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:04:23 +0200 (CEST)
Received: from localhost ([::1]:46172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyxEM-0002Q9-Nk
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nyx5u-0000c6-GW
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:55:38 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nyx5s-0006S0-LJ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:55:38 -0400
Received: from fraeml742-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LJ9Bx1M9Hz67Zn3;
 Wed,  8 Jun 2022 22:50:49 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml742-chm.china.huawei.com (10.206.15.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 16:55:34 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 15:55:34 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v3 2/8] hw/acpi/cxl: Pass in the CXLState directly rather than
 MachineState
Date: Wed, 8 Jun 2022 15:54:34 +0100
Message-ID: <20220608145440.26106-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220608145440.26106-1-Jonathan.Cameron@huawei.com>
References: <20220608145440.26106-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml703-chm.china.huawei.com (10.201.108.52) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

Refactoring step on path to moving all CXL state out of
MachineState.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
---
 hw/acpi/cxl.c         | 9 ++++-----
 hw/i386/acpi-build.c  | 4 ++--
 include/hw/acpi/cxl.h | 5 +++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index 31d5235136..2bf8c07993 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -65,9 +65,8 @@ static void cedt_build_chbs(GArray *table_data, PXBDev *cxl)
  * Interleave ways encoding in CXL 2.0 ECN: 3, 6, 12 and 16-way memory
  * interleaving.
  */
-static void cedt_build_cfmws(GArray *table_data, MachineState *ms)
+static void cedt_build_cfmws(GArray *table_data, CXLState *cxls)
 {
-    CXLState *cxls = ms->cxl_devices_state;
     GList *it;
 
     for (it = cxls->fixed_windows; it; it = it->next) {
@@ -129,9 +128,9 @@ static int cxl_foreach_pxb_hb(Object *obj, void *opaque)
     return 0;
 }
 
-void cxl_build_cedt(MachineState *ms, GArray *table_offsets, GArray *table_data,
+void cxl_build_cedt(GArray *table_offsets, GArray *table_data,
                     BIOSLinker *linker, const char *oem_id,
-                    const char *oem_table_id)
+                    const char *oem_table_id, CXLState *cxl_state)
 {
     Aml *cedt;
     AcpiTable table = { .sig = "CEDT", .rev = 1, .oem_id = oem_id,
@@ -144,7 +143,7 @@ void cxl_build_cedt(MachineState *ms, GArray *table_offsets, GArray *table_data,
     /* reserve space for CEDT header */
 
     object_child_foreach_recursive(object_get_root(), cxl_foreach_pxb_hb, cedt);
-    cedt_build_cfmws(cedt->buf, ms);
+    cedt_build_cfmws(cedt->buf, cxl_state);
 
     /* copy AML table into ACPI tables blob and patch header there */
     g_array_append_vals(table_data, cedt->buf->data, cedt->buf->len);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c125939ed6..2e3b1dd9a2 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2712,8 +2712,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                           x86ms->oem_id, x86ms->oem_table_id);
     }
     if (machine->cxl_devices_state->is_enabled) {
-        cxl_build_cedt(machine, table_offsets, tables_blob, tables->linker,
-                       x86ms->oem_id, x86ms->oem_table_id);
+        cxl_build_cedt(table_offsets, tables_blob, tables->linker,
+                       x86ms->oem_id, x86ms->oem_table_id, machine->cxl_devices_state);
     }
 
     acpi_add_table(table_offsets, tables_blob);
diff --git a/include/hw/acpi/cxl.h b/include/hw/acpi/cxl.h
index 0c496538c0..acf4418886 100644
--- a/include/hw/acpi/cxl.h
+++ b/include/hw/acpi/cxl.h
@@ -19,10 +19,11 @@
 #define HW_ACPI_CXL_H
 
 #include "hw/acpi/bios-linker-loader.h"
+#include "hw/cxl/cxl.h"
 
-void cxl_build_cedt(MachineState *ms, GArray *table_offsets, GArray *table_data,
+void cxl_build_cedt(GArray *table_offsets, GArray *table_data,
                     BIOSLinker *linker, const char *oem_id,
-                    const char *oem_table_id);
+                    const char *oem_table_id, CXLState *cxl_state);
 void build_cxl_osc_method(Aml *dev);
 
 #endif
-- 
2.32.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757DF3B40DD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:50:44 +0200 (CEST)
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiTz-0001cO-Fe
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwi0F-0003y6-UK
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwi0B-0007Mv-4E
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZpKCaRdusV4eGZe74nOvcDLuOU61Kx6SreNJOZ24EQ=;
 b=FnyyxZW7lVxvWoiED4am5341NRIoLkeWWCKFh10PMA9PSziD2rlnGFUWc8TbyzI/TxYDWc
 CQUh5WTOnXd2647FROMSJhxSt/pEm9n7fkgcLtmsCCossNfDzlQo+15FWirSFBBLbuYmGk
 HeZ3SLJqEzAwXkydk2AWGL3XcWz0Ezg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-tlVCU-JeNSyNKH9-Fzpb5w-1; Fri, 25 Jun 2021 05:19:53 -0400
X-MC-Unique: tlVCU-JeNSyNKH9-Fzpb5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18BA410199A3;
 Fri, 25 Jun 2021 09:19:52 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF51160C05;
 Fri, 25 Jun 2021 09:19:50 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 46/53] acpi: arm: virt: build_iort: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Fri, 25 Jun 2021 05:18:11 -0400
Message-Id: <20210625091818.1047980-48-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: drjones@redhat.com
CC: peter.maydell@linaro.org
CC: shannon.zhaosl@gmail.com
CC: qemu-arm@nongnu.org
---
 include/hw/acpi/acpi-defs.h | 14 ------------
 hw/arm/virt-acpi-build.c    | 43 +++++++++++++++----------------------
 2 files changed, 17 insertions(+), 40 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index bcada37601..195f90caf6 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -188,20 +188,6 @@ struct AcpiGenericTimerTable {
 } QEMU_PACKED;
 typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
 
-/*
- * Input Output Remapping Table (IORT)
- * Conforms to "IO Remapping Table System Software on ARM Platforms",
- * Document number: ARM DEN 0049B, October 2015
- */
-
-struct AcpiIortTable {
-    ACPI_TABLE_HEADER_DEF     /* ACPI common table header */
-    uint32_t node_count;
-    uint32_t node_offset;
-    uint32_t reserved;
-} QEMU_PACKED;
-typedef struct AcpiIortTable AcpiIortTable;
-
 /*
  * IORT node types
  */
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d15e67a39b..ac5e07e43c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -239,18 +239,22 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 }
 #endif
 
+/*
+ * Input Output Remapping Table (IORT)
+ * Conforms to "IO Remapping Table System Software on ARM Platforms",
+ * Document number: ARM DEN 0049B, October 2015
+ */
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-    int nb_nodes, iort_start = table_data->len;
+    int nb_nodes;
     AcpiIortIdMapping *idmap;
     AcpiIortItsGroup *its;
-    AcpiIortTable *iort;
     AcpiIortSmmu3 *smmu;
-    size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
+    size_t node_size, iort_node_offset = 48, smmu_offset = 0;
     AcpiIortRC *rc;
-
-    iort = acpi_data_push(table_data, sizeof(*iort));
+    AcpiTable table = { .sig = "IORT", .rev = 0, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
 
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
         nb_nodes = 3; /* RC, ITS, SMMUv3 */
@@ -258,18 +262,16 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         nb_nodes = 2; /* RC, ITS */
     }
 
-    iort_length = sizeof(*iort);
-    iort->node_count = cpu_to_le32(nb_nodes);
-    /*
-     * Use a copy in case table_data->data moves during acpi_data_push
-     * operations.
-     */
-    iort_node_offset = sizeof(*iort);
-    iort->node_offset = cpu_to_le32(iort_node_offset);
+    /* Table 2 The IORT */
+    acpi_init_table(&table, table_data);
+    /* Number of IORT Nodes */
+    build_append_int_noprefix(table_data, nb_nodes, 4);
+    /* Offset to Array of IORT Nodes */
+    build_append_int_noprefix(table_data, iort_node_offset, 4);
+    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
 
     /* ITS group node */
     node_size =  sizeof(*its) + sizeof(uint32_t);
-    iort_length += node_size;
     its = acpi_data_push(table_data, node_size);
 
     its->type = ACPI_IORT_NODE_ITS_GROUP;
@@ -283,7 +285,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         /* SMMUv3 node */
         smmu_offset = iort_node_offset + node_size;
         node_size = sizeof(*smmu) + sizeof(*idmap);
-        iort_length += node_size;
         smmu = acpi_data_push(table_data, node_size);
 
         smmu->type = ACPI_IORT_NODE_SMMU_V3;
@@ -308,7 +309,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     /* Root Complex Node */
     node_size = sizeof(*rc) + sizeof(*idmap);
-    iort_length += node_size;
     rc = acpi_data_push(table_data, node_size);
 
     rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
@@ -335,16 +335,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         idmap->output_reference = cpu_to_le32(iort_node_offset);
     }
 
-    /*
-     * Update the pointer address in case table_data->data moves during above
-     * acpi_data_push operations.
-     */
-    iort = (AcpiIortTable *)(table_data->data + iort_start);
-    iort->length = cpu_to_le32(iort_length);
-
-    build_header(linker, table_data, (void *)(table_data->data + iort_start),
-                 "IORT", table_data->len - iort_start, 0, vms->oem_id,
-                 vms->oem_table_id);
+    acpi_table_composed(linker, &table);
 }
 
 static void
-- 
2.27.0



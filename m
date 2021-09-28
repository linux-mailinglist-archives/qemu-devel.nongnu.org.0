Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD32141B514
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 19:23:43 +0200 (CEST)
Received: from localhost ([::1]:56998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVGpS-0001ge-Ql
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 13:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVGnm-0008Ou-4D
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:21:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVGnk-0002Wr-7M
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632849715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HEx9cVFT8IZVhLRRRjdcfHY0ePXRMtrxj2puBgmrkPg=;
 b=EZu61/og85ES/F1sKgLDhjVqLddhQdXIDSbblb53hwuxNtLbKmadbt8CeiMaOEKWvm+wXE
 MzdV08puhMNci11x778kE4vmZKukp/E57EF5mcjFekAyeyoRpeCoyx6vB4A+a3R8tfFBHl
 4fevFFIKdrZX7KQNfPurNWLUpY+p8H0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-2jC-Uae3OZ-HYYXbBMzm0Q-1; Tue, 28 Sep 2021 13:21:54 -0400
X-MC-Unique: 2jC-Uae3OZ-HYYXbBMzm0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEFF48145E5;
 Tue, 28 Sep 2021 17:21:52 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 839235C1C5;
 Tue, 28 Sep 2021 17:21:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 drjones@redhat.com
Subject: [PATCH 2/3] hw/arm/virt-acpi-build: IORT upgrade up to revision E.b
Date: Tue, 28 Sep 2021 19:21:32 +0200
Message-Id: <20210928172133.79665-3-eric.auger@redhat.com>
In-Reply-To: <20210928172133.79665-1-eric.auger@redhat.com>
References: <20210928172133.79665-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Upgrade the IORT table from B to E.b specification
revision (ARM DEN 0049E.b).

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c | 47 ++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 257d0fee17..ce9311ac19 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -241,19 +241,20 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 #endif
 
 #define ID_MAPPING_ENTRY_SIZE 20
-#define SMMU_V3_ENTRY_SIZE 60
-#define ROOT_COMPLEX_ENTRY_SIZE 32
+#define SMMU_V3_ENTRY_SIZE 68
+#define ROOT_COMPLEX_ENTRY_SIZE 36
 #define IORT_NODE_OFFSET 48
 
 static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
                                   uint32_t id_count, uint32_t out_ref)
 {
-    /* Identity RID mapping covering the whole input RID range */
+    /* Table 4 ID mapping format */
     build_append_int_noprefix(table_data, input_base, 4); /* Input base */
     build_append_int_noprefix(table_data, id_count, 4); /* Number of IDs */
     build_append_int_noprefix(table_data, input_base, 4); /* Output base */
     build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
-    build_append_int_noprefix(table_data, 0, 4); /* Flags */
+    /* Flags */
+    build_append_int_noprefix(table_data, 0 /* Single mapping */, 4);
 }
 
 struct AcpiIortIdMapping {
@@ -298,7 +299,7 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
 /*
  * Input Output Remapping Table (IORT)
  * Conforms to "IO Remapping Table System Software on ARM Platforms",
- * Document number: ARM DEN 0049B, October 2015
+ * Document number: ARM DEN 0049E, Feb 2021
  */
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
@@ -310,7 +311,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
     GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
 
-    AcpiTable table = { .sig = "IORT", .rev = 0, .oem_id = vms->oem_id,
+    AcpiTable table = { .sig = "IORT", .rev = 3, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
     /* Table 2 The IORT */
     acpi_table_begin(&table, table_data);
@@ -358,12 +359,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, IORT_NODE_OFFSET, 4);
     build_append_int_noprefix(table_data, 0, 4); /* Reserved */
 
-    /* 3.1.1.3 ITS group node */
+    /* Table 12 ITS Group Format */
     build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
     node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
     build_append_int_noprefix(table_data, node_size, 2); /* Length */
-    build_append_int_noprefix(table_data, 0, 1); /* Revision */
-    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+    build_append_int_noprefix(table_data, 3, 1); /* Revision */
+    build_append_int_noprefix(table_data, 0, 4); /* Identifier */
     build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
     build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
     build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
@@ -374,19 +375,19 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
 
         smmu_offset = table_data->len - table.table_offset;
-        /* 3.1.1.2 SMMUv3 */
+        /* Table 9 SMMUv3 Format */
         build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
         node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
         build_append_int_noprefix(table_data, node_size, 2); /* Length */
-        build_append_int_noprefix(table_data, 0, 1); /* Revision */
-        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+        build_append_int_noprefix(table_data, 3, 1); /* Revision */
+        build_append_int_noprefix(table_data, 1, 4); /* Identifier */
         build_append_int_noprefix(table_data, 1, 4); /* Number of ID mappings */
         /* Reference to ID Array */
         build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
         /* Base address */
         build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
         /* Flags */
-        build_append_int_noprefix(table_data, 1 /* COHACC OverrideNote */, 4);
+        build_append_int_noprefix(table_data, 1 /* COHACC Override */, 4);
         build_append_int_noprefix(table_data, 0, 4); /* Reserved */
         build_append_int_noprefix(table_data, 0, 8); /* VATOS address */
         /* Model */
@@ -395,35 +396,43 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, irq + 1, 4); /* PRI */
         build_append_int_noprefix(table_data, irq + 3, 4); /* GERR */
         build_append_int_noprefix(table_data, irq + 2, 4); /* Sync */
+        build_append_int_noprefix(table_data, 0, 4); /* Proximity domain */
+        /* DeviceID mapping index (ignored since interrupts are GSIV based) */
+        build_append_int_noprefix(table_data, 0, 4);
 
         /* output IORT node is the ITS group node (the first node) */
         build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
     }
 
-    /* Table 16 Root Complex Node */
+    /* Table 17 Root Complex Node */
     build_append_int_noprefix(table_data, 2 /* Root complex */, 1); /* Type */
     node_size =  ROOT_COMPLEX_ENTRY_SIZE +
                  ID_MAPPING_ENTRY_SIZE * rc_mapping_count;
     build_append_int_noprefix(table_data, node_size, 2); /* Length */
-    build_append_int_noprefix(table_data, 0, 1); /* Revision */
-    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+    build_append_int_noprefix(table_data, 3, 1); /* Revision */
+    build_append_int_noprefix(table_data, 2, 4); /* Identifier */
     /* Number of ID mappings */
     build_append_int_noprefix(table_data, rc_mapping_count, 4);
     /* Reference to ID Array */
     build_append_int_noprefix(table_data, ROOT_COMPLEX_ENTRY_SIZE, 4);
 
-    /* Table 13 Memory access properties */
+    /* Table 14 Memory access properties */
     /* CCA: Cache Coherent Attribute */
     build_append_int_noprefix(table_data, 1 /* fully coherent */, 4);
     build_append_int_noprefix(table_data, 0, 1); /* AH: Note Allocation Hints */
     build_append_int_noprefix(table_data, 0, 2); /* Reserved */
-    /* MAF: Note Memory Access Flags */
-    build_append_int_noprefix(table_data, 0x3 /* CCA = CPM = DCAS = 1 */, 1);
+    /* Table 15 Memory Access Flags */
+    build_append_int_noprefix(table_data, 0x3 /* CCA = CPM = DACS = 1 */, 1);
 
     build_append_int_noprefix(table_data, 0, 4); /* ATS Attribute */
     /* MCFG pci_segment */
     build_append_int_noprefix(table_data, 0, 4); /* PCI Segment number */
 
+    /* Memory address size limit */
+    build_append_int_noprefix(table_data, 64, 1);
+
+    build_append_int_noprefix(table_data, 0, 3); /* Reserved */
+
     /* Output Reference */
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
         AcpiIortIdMapping *range;
-- 
2.26.3



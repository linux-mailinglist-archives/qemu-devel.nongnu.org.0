Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8261436679
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:41:24 +0200 (CEST)
Received: from localhost ([::1]:36820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaC4-0002yy-0q
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx0-0008Pn-2A
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:50 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZww-00027c-Kl
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:49 -0400
Received: by mail-pl1-x632.google.com with SMTP id i1so628706plr.13
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3uHaaL0MV3Lfbdvi6JXf/ib4D2pgKX/ajlDXIALVybM=;
 b=H7TRRxcyQEXMNnGqPU3DubJEK1XPVTMo+sme+sq3t3nXRsJjAh5I/ZYW+E5L1+GsN0
 OBeggKV8z2yc49BgTp+vcOZU+UQ1gHyfvUIGhdxEdqAqALi2HlC3Sl4yP511V691fj0R
 AebhFax2aNrQyQ2P3HV0gHyhke/dbd0howJHwjcx+DWXj0C38Db3SFeKPS0FlBFukDiW
 J4d7yVmcNrVboDsS98vwMKT7+jrtb+l/cRM8UKQ7gaPKFoM0mOXgr84S3MheVT9xC8JH
 2WIwAttEDDIc0RLpjs8BH9j/oRSmPuYb4nBKDH5fax5gGVX1C6Q+W9Yh8ysjsoMzGwrJ
 lM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3uHaaL0MV3Lfbdvi6JXf/ib4D2pgKX/ajlDXIALVybM=;
 b=4y/bFNbCsXNCc4Dsyc8XcGbIgGvUoJczaZjDJ7A/YmH4YWLWNw1yRgmy8tNQzluHt7
 buskwVGpf1REG55v47+BbzOF/QZWnVpXKl8/Hl42ljAJe9T/Wc6wb83BxVlPNQpu/Lbl
 C4ZgtBgbqPsZAeiIUIxBxvCOIukiFB81MCVoA3YU0RGKcxDZVAa3xGsnLawVJtLJDdbI
 lhI1p0LAy02xmZ4qf7M6vUeaNJimGZPphdxCsLb/Fa2D0gZkMxHDvs+Crpx/ZGtBEyVX
 mHRh/nRCSiVBP9i79NzbILtATADeuQvXYFMyixs9yBXnbcqpcIc7AfGYDRjDe72mwQSh
 4rzA==
X-Gm-Message-State: AOAM531EfdNbAdBw4CGTWuwZWpJ0yC//sTdSLaRfs+24mKVyykC77iuj
 ++2PCtxph/3jAiNReTaoNww7eqbCx3IEaQ==
X-Google-Smtp-Source: ABdhPJwaPYr5MXyMdpjm4cwr4sTT5xo6ufyhkVO+nw2Vp/QLCsGYtljmp8/2SREvE7Co8/+oGAIsCA==
X-Received: by 2002:a17:902:b095:b029:12c:de88:7d3b with SMTP id
 p21-20020a170902b095b029012cde887d3bmr5889023plr.15.1634829943804; 
 Thu, 21 Oct 2021 08:25:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/19] hw/arm/virt-acpi-build: IORT upgrade up to revision E.b
Date: Thu, 21 Oct 2021 08:25:24 -0700
Message-Id: <20211021152541.781175-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Upgrade the IORT table from B to E.b specification
revision (ARM DEN 0049E.b).

The SMMUv3 and root complex node have additional
fields. Also unique IORT node identifiers are
introduced: they are generated in sequential order.
They are not cross-referenced though.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20211014115643.756977-3-eric.auger@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt-acpi-build.c | 48 ++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6cec97352b..9c4730f4ab 100644
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
+    build_append_int_noprefix(table_data, 0 /* Single mapping (disabled) */, 4);
 }
 
 struct AcpiIortIdMapping {
@@ -298,7 +299,7 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
 /*
  * Input Output Remapping Table (IORT)
  * Conforms to "IO Remapping Table System Software on ARM Platforms",
- * Document number: ARM DEN 0049B, October 2015
+ * Document number: ARM DEN 0049E.b, Feb 2021
  */
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
@@ -307,10 +308,11 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     const uint32_t iort_node_offset = IORT_NODE_OFFSET;
     size_t node_size, smmu_offset = 0;
     AcpiIortIdMapping *idmap;
+    uint32_t id = 0;
     GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
     GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
 
-    AcpiTable table = { .sig = "IORT", .rev = 0, .oem_id = vms->oem_id,
+    AcpiTable table = { .sig = "IORT", .rev = 3, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
     /* Table 2 The IORT */
     acpi_table_begin(&table, table_data);
@@ -358,12 +360,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, IORT_NODE_OFFSET, 4);
     build_append_int_noprefix(table_data, 0, 4); /* Reserved */
 
-    /* 3.1.1.3 ITS group node */
+    /* Table 12 ITS Group Format */
     build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
     node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
     build_append_int_noprefix(table_data, node_size, 2); /* Length */
-    build_append_int_noprefix(table_data, 0, 1); /* Revision */
-    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+    build_append_int_noprefix(table_data, 1, 1); /* Revision */
+    build_append_int_noprefix(table_data, id++, 4); /* Identifier */
     build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
     build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
     build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
@@ -374,19 +376,19 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
 
         smmu_offset = table_data->len - table.table_offset;
-        /* 3.1.1.2 SMMUv3 */
+        /* Table 9 SMMUv3 Format */
         build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
         node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
         build_append_int_noprefix(table_data, node_size, 2); /* Length */
-        build_append_int_noprefix(table_data, 0, 1); /* Revision */
-        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+        build_append_int_noprefix(table_data, 4, 1); /* Revision */
+        build_append_int_noprefix(table_data, id++, 4); /* Identifier */
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
@@ -395,35 +397,43 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
+    build_append_int_noprefix(table_data, id++, 4); /* Identifier */
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
2.25.1



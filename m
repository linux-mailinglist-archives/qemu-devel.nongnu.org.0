Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C53F3A4C1D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 03:25:41 +0200 (CEST)
Received: from localhost ([::1]:46852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrsP6-00076e-CX
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 21:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lrsLA-0003Lg-4Q
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 21:21:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lrsL6-0004mN-KC
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 21:21:35 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15C13XPb115235
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 21:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=s5tIOR2SHzn676rLMft8dQeAuHoI4E5PKQBUu8sFdbg=;
 b=hgrq9uKFEXLbUJIZmrAJicY9864ab2Rd/wz7RaWUuo2CuHzGohzGEOI83T8ZzIygyQmL
 aOrnt8KX2C3ba/abJOITg338/yNK57huwUiqfaNgBFoMfjxEb66UqZcWMAPA5V+x31XG
 kTHFhq5pIaqe1PlXtO7hyYUnlGrsBrDYaj7c1p4E74Dg6ZSs60xM/BlrY32rJ3EPnLfN
 O2jZlUn3wjY6p0y7UZDJnhmU+eP89U6c3fIU7vCCb3S3rLbmJOXG4XVQkXUjC/80xE2C
 ZExTenraITO4C1ivBFzcfhmxS2dUIkgdGzFAt/N84m1aUA4t+4teXCrVm8swzjXdCu2r JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 394hmbhnuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 21:21:31 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15C1G7uj188875
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 21:21:30 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 394hmbhnup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 21:21:30 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15C1Bu8f000323;
 Sat, 12 Jun 2021 01:21:29 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 3900wahdhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Jun 2021 01:21:29 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15C1LTrK29884892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Jun 2021 01:21:29 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E06F0112064;
 Sat, 12 Jun 2021 01:21:28 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6A9F11206B;
 Sat, 12 Jun 2021 01:21:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 12 Jun 2021 01:21:28 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: armbru@redhat.com, qemu-devel@nongnu.org
Subject: [RFC PATCH V1 1/3] acpi: Eliminate all TPM related code if CONFIG_TPM
 is not set
Date: Fri, 11 Jun 2021 21:21:00 -0400
Message-Id: <20210612012102.1820063-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210612012102.1820063-1-stefanb@linux.ibm.com>
References: <20210612012102.1820063-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rRzjlthlY0ukQ-DsHElMf_gelh3ez0js
X-Proofpoint-ORIG-GUID: 2JMVHzNGFwEirwRE2Inaw91hUj6okF89
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-11_06:2021-06-11,
 2021-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106120006
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 "M : Michael S . Tsirkin" <mst@redhat.com>, philmd@redhat.com,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: M: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 hw/acpi/aml-build.c      |  2 ++
 hw/arm/virt-acpi-build.c |  2 ++
 hw/i386/acpi-build.c     | 20 ++++++++++++++++++++
 include/hw/acpi/tpm.h    |  4 ++++
 stubs/tpm.c              |  4 ----
 5 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index f0035d2b4a..d5103e6d7b 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2044,6 +2044,7 @@ build_hdr:
                  "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
 }
 
+#ifdef CONFIG_TPM
 /*
  * build_tpm2 - Build the TPM2 table as specified in
  * table 7: TCG Hardware Interface Description Table Format for TPM 2.0
@@ -2101,6 +2102,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                  (void *)(table_data->data + tpm2_start),
                  "TPM2", table_data->len - tpm2_start, 4, oem_id, oem_table_id);
 }
+#endif
 
 Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
                uint32_t mmio32_offset, uint64_t mmio64_offset,
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 60fe2e65a7..6b3c1fdb0a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -745,11 +745,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         build_iort(tables_blob, tables->linker, vms);
     }
 
+#ifdef CONFIG_TPM
     if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
         acpi_add_table(table_offsets, tables_blob);
         build_tpm2(tables_blob, tables->linker, tables->tcpalog, vms->oem_id,
                    vms->oem_table_id);
     }
+#endif
 
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 80bee00da6..796ffc6f5c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -107,7 +107,9 @@ typedef struct AcpiPmInfo {
 typedef struct AcpiMiscInfo {
     bool is_piix4;
     bool has_hpet;
+#ifdef CONFIG_TPM
     TPMVersion tpm_version;
+#endif
     const unsigned char *dsdt_code;
     unsigned dsdt_size;
     uint16_t pvpanic_port;
@@ -286,7 +288,9 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
     }
 
     info->has_hpet = hpet_find();
+#ifdef CONFIG_TPM
     info->tpm_version = tpm_get_version(tpm_find());
+#endif
     info->pvpanic_port = pvpanic_port();
     info->applesmc_io_base = applesmc_port();
 }
@@ -1371,7 +1375,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     uint32_t nr_mem = machine->ram_slots;
     int root_bus_limit = 0xFF;
     PCIBus *bus = NULL;
+#ifdef CONFIG_TPM
     TPMIf *tpm = tpm_find();
+#endif
     int i;
     VMBusBridge *vmbus_bridge = vmbus_bridge_find();
 
@@ -1604,10 +1610,12 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         }
     }
 
+#ifdef CONFIG_TPM
     if (TPM_IS_TIS_ISA(tpm_find())) {
         aml_append(crs, aml_memory32_fixed(TPM_TIS_ADDR_BASE,
                    TPM_TIS_ADDR_SIZE, AML_READ_WRITE));
     }
+#endif
     aml_append(scope, aml_name_decl("_CRS", crs));
 
     /* reserve GPE0 block resources */
@@ -1753,6 +1761,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             /* Scan all PCI buses. Generate tables to support hotplug. */
             build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en);
 
+#ifdef CONFIG_TPM
             if (TPM_IS_TIS_ISA(tpm)) {
                 if (misc->tpm_version == TPM_VERSION_2_0) {
                     dev = aml_device("TPM");
@@ -1780,11 +1789,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
                 aml_append(scope, dev);
             }
+#endif
 
             aml_append(sb_scope, scope);
         }
     }
 
+#ifdef CONFIG_TPM
     if (TPM_IS_CRB(tpm)) {
         dev = aml_device("TPM");
         aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
@@ -1799,6 +1810,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
         aml_append(sb_scope, dev);
     }
+#endif
 
     aml_append(dsdt, sb_scope);
 
@@ -1828,6 +1840,7 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
                  "HPET", sizeof(*hpet), 1, oem_id, oem_table_id);
 }
 
+#ifdef CONFIG_TPM
 static void
 build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                const char *oem_id, const char *oem_table_id)
@@ -1854,6 +1867,7 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                  (void *)(table_data->data + tcpa_start),
                  "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
 }
+#endif
 
 #define HOLE_640K_START  (640 * KiB)
 #define HOLE_640K_END   (1 * MiB)
@@ -2403,6 +2417,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         build_hpet(tables_blob, tables->linker, x86ms->oem_id,
                    x86ms->oem_table_id);
     }
+#ifdef CONFIG_TPM
     if (misc.tpm_version != TPM_VERSION_UNSPEC) {
         if (misc.tpm_version == TPM_VERSION_1_2) {
             acpi_add_table(table_offsets, tables_blob);
@@ -2414,6 +2429,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                        x86ms->oem_id, x86ms->oem_table_id);
         }
     }
+#endif
     if (pcms->numa_nodes) {
         acpi_add_table(table_offsets, tables_blob);
         build_srat(tables_blob, tables->linker, machine);
@@ -2605,8 +2621,10 @@ void acpi_setup(void)
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
     Object *vmgenid_dev;
+#ifdef CONFIG_TPM
     TPMIf *tpm;
     static FwCfgTPMConfig tpm_config;
+#endif
 
     if (!x86ms->fw_cfg) {
         ACPI_BUILD_DPRINTF("No fw cfg. Bailing out.\n");
@@ -2638,6 +2656,7 @@ void acpi_setup(void)
         acpi_add_rom_blob(acpi_build_update, build_state,
                           tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE);
 
+#ifdef CONFIG_TPM
     fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
 
@@ -2651,6 +2670,7 @@ void acpi_setup(void)
         fw_cfg_add_file(x86ms->fw_cfg, "etc/tpm/config",
                         &tpm_config, sizeof tpm_config);
     }
+#endif
 
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
diff --git a/include/hw/acpi/tpm.h b/include/hw/acpi/tpm.h
index 1a2a57a21f..559ba6906c 100644
--- a/include/hw/acpi/tpm.h
+++ b/include/hw/acpi/tpm.h
@@ -21,6 +21,8 @@
 #include "hw/acpi/aml-build.h"
 #include "sysemu/tpm.h"
 
+#ifdef CONFIG_TPM
+
 #define TPM_TIS_ADDR_BASE           0xFED40000
 #define TPM_TIS_ADDR_SIZE           0x5000
 
@@ -209,4 +211,6 @@ REG32(CRB_DATA_BUFFER, 0x80)
 
 void tpm_build_ppi_acpi(TPMIf *tpm, Aml *dev);
 
+#endif /* CONFIG_TPM */
+
 #endif /* HW_ACPI_TPM_H */
diff --git a/stubs/tpm.c b/stubs/tpm.c
index b1dc6370a5..524e534cb1 100644
--- a/stubs/tpm.c
+++ b/stubs/tpm.c
@@ -17,7 +17,3 @@ int tpm_init(void)
 void tpm_cleanup(void)
 {
 }
-
-void tpm_build_ppi_acpi(TPMIf *tpm, Aml *dev)
-{
-}
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639AF3A6EB7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:17:43 +0200 (CEST)
Received: from localhost ([::1]:43552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lss5e-0001jc-Ct
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lss1t-0003oe-T6
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:13:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:61816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lss1m-0001Ji-Vz
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:13:49 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15EJ5kEI088229
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6P+suPRU+vWSncCh2WFihDF8n9RlWk4M0znHp5a22qQ=;
 b=iLy9hLGqS/c4eDC7htsP4Xo1nTpTigfliQO8TlcqO+DT6kavs11IxkyzFwxyoVzmPYD3
 I6n4Wuzu0MdhV/5oiHkSd7FllU5cNd2m6MxucJblNY9R8WeOmhxPj9L7mhIBPEaqUKyu
 ypU8UcRu+cJmQMe3dWTW3NlokF8Vq0YnPR8+gum70uErLyijXH0tSGzIxNRBx88ODYdN
 W4jMjJb2flFiBnTQkTYciCoqXT492XTaXjI39QcBtBnTfjZNfXHsFUz98+WeDbCTLNU7
 ZKVc3D69/CbchCWwMb5TuqZDTAV/VurNF3KLognVeMQJE7uAKAG5q785CkfSwsP4Sx0l hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396c7c1g9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:13:41 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15EJ5pvk088841
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:13:41 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396c7c1g8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 15:13:40 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15EJ7uG6016281;
 Mon, 14 Jun 2021 19:13:39 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 394mj99yx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 19:13:39 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15EJDcpW27918790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 19:13:38 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB91F136055;
 Mon, 14 Jun 2021 19:13:38 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A53313604F;
 Mon, 14 Jun 2021 19:13:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.47.158.152])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Jun 2021 19:13:38 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] i386: Eliminate all TPM related code if CONFIG_TPM is
 not set
Date: Mon, 14 Jun 2021 15:13:32 -0400
Message-Id: <20210614191335.1968807-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614191335.1968807-1-stefanb@linux.ibm.com>
References: <20210614191335.1968807-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8lRM91-RK5alrUIeEJJEaSW9Lv3rvjKT
X-Proofpoint-ORIG-GUID: OtwmP6UEsc3-iqgx7_tAHRhBT9ejm_AR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_13:2021-06-14,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106140121
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 philmd@redhat.com, armbru@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 hw/i386/acpi-build.c | 20 ++++++++++++++++++++
 stubs/tpm.c          |  4 ----
 2 files changed, 20 insertions(+), 4 deletions(-)

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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF0A3A83DC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:24:08 +0200 (CEST)
Received: from localhost ([::1]:59452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltAv9-0003UW-N9
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1ltAtW-0001M6-Kg
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:22:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1ltAtS-0006Og-3C
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:22:26 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15FF3qrV045955; Tue, 15 Jun 2021 11:22:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=cDW+v0140pijcT53TpR/bxVhKV0wpHipd5e2UonGcIE=;
 b=MC6Mm4VEfFk+i+TJPOz0l4pSo2INcj/qg7sIqP12SVwmAxN6OSIaB/3g0H1l/cKmRIgW
 04/EZB3pfk4tk2XuKVODmckROwCXYf2OdmHpRzGeXC2imhBJ98QZdHamcJVkQPhk5KQ6
 cmpZyV10oVOQoFF+thLBgRYqdFCtie+4wXdMtMNeLYSKLx9GK6NRZpZrKUwC692ul/Bo
 RZ8lJ1TBwxZfkPOcnIJaV4nnbLAeMIVJt/PUxi3xlYHgk5LMKKrwl2q6XpgE5QM4o2bN
 7eYzHEjFxHp6q3DEHzhrZXdV5uYVX6L/BDZ9CriiYq6wQ6IRN6UXyMTJa6B3NGcy9pWZ Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396x7w1k28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 11:22:19 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15FF4GOG048004;
 Tue, 15 Jun 2021 11:22:19 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396x7w1k1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 11:22:19 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15FFDPHl012481;
 Tue, 15 Jun 2021 15:22:18 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 394mj9902t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 15:22:18 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15FFMHsP29295000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 15:22:17 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 593CC7805C;
 Tue, 15 Jun 2021 15:22:17 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D41B78064;
 Tue, 15 Jun 2021 15:22:16 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 15:22:16 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 2/5] arm: Eliminate all TPM related code if CONFIG_TPM is
 not set
Date: Tue, 15 Jun 2021 11:21:49 -0400
Message-Id: <20210615152152.2496772-3-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615152152.2496772-1-stefanb@linux.vnet.ibm.com>
References: <20210615152152.2496772-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oKyrigJx1SdfRAlG0xJw067x1PtAHI3z
X-Proofpoint-ORIG-GUID: RjDbrlh0cEx-d-fL32J-dNhpDsDufG7a
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_07:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106150095
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.ibm.com>

Peter Maydell <peter.maydell@linaro.org>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210614191335.1968807-3-stefanb@linux.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/sysbus-fdt.c      | 4 ++++
 hw/arm/virt-acpi-build.c | 6 ++++++
 hw/arm/virt.c            | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 6b6906f4cf..48c5fe9bf1 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -437,6 +437,7 @@ static bool vfio_platform_match(SysBusDevice *sbdev,
 
 #endif /* CONFIG_LINUX */
 
+#ifdef CONFIG_TPM
 /*
  * add_tpm_tis_fdt_node: Create a DT node for TPM TIS
  *
@@ -467,6 +468,7 @@ static int add_tpm_tis_fdt_node(SysBusDevice *sbdev, void *opaque)
     g_free(nodename);
     return 0;
 }
+#endif
 
 static int no_fdt_node(SysBusDevice *sbdev, void *opaque)
 {
@@ -488,7 +490,9 @@ static const BindingEntry bindings[] = {
     TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
     VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
 #endif
+#ifdef CONFIG_TPM
     TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
+#endif
     TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
     TYPE_BINDING("", NULL), /* last element */
 };
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 60fe2e65a7..f1024843dd 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -205,6 +205,7 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
     aml_append(scope, dev);
 }
 
+#ifdef CONFIG_TPM
 static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 {
     PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
@@ -236,6 +237,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
     aml_append(dev, aml_name_decl("_CRS", crs));
     aml_append(scope, dev);
 }
+#endif
 
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
@@ -642,7 +644,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     acpi_dsdt_add_power_button(scope);
+#ifdef CONFIG_TPM
     acpi_dsdt_add_tpm(scope, vms);
+#endif
 
     aml_append(dsdt, scope);
 
@@ -745,11 +749,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
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
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 840758666d..9122e22ee0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2599,7 +2599,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
+#ifdef CONFIG_TPM
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
+#endif
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
-- 
2.31.1



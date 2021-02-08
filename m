Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA7931451F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:55:29 +0100 (CET)
Received: from localhost ([::1]:59076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9HJQ-0003rD-Dv
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l9EYt-0006kL-NK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:59:15 -0500
Received: from mga02.intel.com ([134.134.136.20]:59480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l9EYr-0005DL-Jn
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:59:15 -0500
IronPort-SDR: xQ645V5CzfmO/ZmCeJmCPqJ9q3Np9Y79qDtOsB/OpiFQaJ+UCa9SJauSG6vHblg4G7giQvxWE2
 TZRVVswQGehw==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="168911424"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="168911424"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 13:59:05 -0800
IronPort-SDR: pGu1zOyLiDMujLMM5VrrC4IwiFSPUfxa5D4ErVkKRkrFhAqmXo/Eiq+u+icdDtyABLE1gIbr4i
 tFsW7+w3An3g==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="487608583"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 13:59:05 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@redhat.com
Subject: [PATCH v2 4/9] acpi: set fadt.smi_cmd to zero when SMM is not
 supported
Date: Mon,  8 Feb 2021 13:57:23 -0800
Message-Id: <8156558747a6db89a4e8e015ab0b1e9bea07b27f.1612821109.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612821108.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1612821108.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=isaku.yamahata@intel.com; helo=mga02.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

From table 5.9 SMI_CMD of ACPI spec
> This field is reserved and must be zero on system
> that does not support System Management mode.

When smm is not enabled, set it to zero to comform to the spec.
When -machine smm=off is passed, the change to FACP is as follows.

@@ -1,46 +1,46 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20180105 (64-bit version)
  * Copyright (c) 2000 - 2018 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/FACP, Fri Feb  5 16:57:04 2021
+ * Disassembly of /tmp/aml-1OQYX0, Fri Feb  5 16:57:04 2021
  *
  * ACPI Data Table [FACP]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */

 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 000000F4
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : 1F
+[009h 0009   1]                     Checksum : D6
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPCFACP"
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   4]                 FACS Address : 00000000
 [028h 0040   4]                 DSDT Address : 00000000
 [02Ch 0044   1]                        Model : 01
 [02Dh 0045   1]                   PM Profile : 00 [Unspecified]
 [02Eh 0046   2]                SCI Interrupt : 0009
-[030h 0048   4]             SMI Command Port : 000000B2
-[034h 0052   1]            ACPI Enable Value : 02
-[035h 0053   1]           ACPI Disable Value : 03
+[030h 0048   4]             SMI Command Port : 00000000
+[034h 0052   1]            ACPI Enable Value : 00
+[035h 0053   1]           ACPI Disable Value : 00
 [036h 0054   1]               S4BIOS Command : 00
 [037h 0055   1]              P-State Control : 00
 [038h 0056   4]     PM1A Event Block Address : 00000600
 [03Ch 0060   4]     PM1B Event Block Address : 00000000
 [040h 0064   4]   PM1A Control Block Address : 00000604
 [044h 0068   4]   PM1B Control Block Address : 00000000
 [048h 0072   4]    PM2 Control Block Address : 00000000
 [04Ch 0076   4]       PM Timer Block Address : 00000608
 [050h 0080   4]           GPE0 Block Address : 00000620
 [054h 0084   4]           GPE1 Block Address : 00000000
 [058h 0088   1]       PM1 Event Block Length : 04
 [059h 0089   1]     PM1 Control Block Length : 02
 [05Ah 0090   1]     PM2 Control Block Length : 00
 [05Bh 0091   1]        PM Timer Block Length : 04
 [05Ch 0092   1]            GPE0 Block Length : 10
 [05Dh 0093   1]            GPE1 Block Length : 00

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/i386/acpi-build.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f56d699c7f..c2f11d95d8 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -139,6 +139,8 @@ const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio = {
 static void init_common_fadt_data(MachineState *ms, Object *o,
                                   AcpiFadtData *data)
 {
+    X86MachineState *x86ms = X86_MACHINE(ms);
+    bool smm_enabled = x86_machine_is_smm_enabled(x86ms);
     uint32_t io = object_property_get_uint(o, ACPI_PM_PROP_PM_IO_BASE, NULL);
     AmlAddressSpace as = AML_AS_SYSTEM_IO;
     AcpiFadtData fadt = {
@@ -159,12 +161,16 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
         .rtc_century = RTC_CENTURY,
         .plvl2_lat = 0xfff /* C2 state not supported */,
         .plvl3_lat = 0xfff /* C3 state not supported */,
-        .smi_cmd = ACPI_PORT_SMI_CMD,
+        .smi_cmd = smm_enabled ? ACPI_PORT_SMI_CMD : 0,
         .sci_int = object_property_get_uint(o, ACPI_PM_PROP_SCI_INT, NULL),
         .acpi_enable_cmd =
-            object_property_get_uint(o, ACPI_PM_PROP_ACPI_ENABLE_CMD, NULL),
+            smm_enabled ?
+            object_property_get_uint(o, ACPI_PM_PROP_ACPI_ENABLE_CMD, NULL) :
+            0,
         .acpi_disable_cmd =
-            object_property_get_uint(o, ACPI_PM_PROP_ACPI_DISABLE_CMD, NULL),
+            smm_enabled ?
+            object_property_get_uint(o, ACPI_PM_PROP_ACPI_DISABLE_CMD, NULL) :
+            0,
         .pm1a_evt = { .space_id = as, .bit_width = 4 * 8, .address = io },
         .pm1a_cnt = { .space_id = as, .bit_width = 2 * 8,
                       .address = io + 0x04 },
-- 
2.17.1



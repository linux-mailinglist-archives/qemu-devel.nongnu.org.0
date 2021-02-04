Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D5730EDFF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 09:08:00 +0100 (CET)
Received: from localhost ([::1]:58208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ZgF-0001P0-73
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 03:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l7ZeN-0008W9-C5
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:06:03 -0500
Received: from mga05.intel.com ([192.55.52.43]:43425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l7ZeL-0007bn-PO
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:06:03 -0500
IronPort-SDR: Y2Ut96peg5QAvLUbiKWfX5bQF9uNsjO8DoQtQj4MUqcIQmCLAI6HFv0QKtQlGyVlSC83mtk6+9
 DTtNAhnfV1xw==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="266025484"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="266025484"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 00:05:44 -0800
IronPort-SDR: jAkbOG2Wf/OeSJZ8WTmuyBQsw2RS1VpZN4SEhEkulb3Mh2M0Qn/RKApptl35KeKIiLBcvh/yLt
 kH1MZwaLIvmg==
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="372302433"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 00:05:44 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH 2/4] acpi: set fadt.smi_cmd to zero when SMM is not supported
Date: Thu,  4 Feb 2021 00:04:09 -0800
Message-Id: <194cd393260d2692fac98cc24cfd67e6cc98582b.1612424814.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612424814.git.isaku.yamahata@intel.com>
References: <cover.1612424814.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1612424814.git.isaku.yamahata@intel.com>
References: <cover.1612424814.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=isaku.yamahata@intel.com; helo=mga05.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

So when smm is not enabled, set it to zero to comform to the spec.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/i386/acpi-build.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f56d699c7f..005bcc2886 100644
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
@@ -159,12 +161,12 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
         .rtc_century = RTC_CENTURY,
         .plvl2_lat = 0xfff /* C2 state not supported */,
         .plvl3_lat = 0xfff /* C3 state not supported */,
-        .smi_cmd = ACPI_PORT_SMI_CMD,
+        .smi_cmd = smm_enabled ? ACPI_PORT_SMI_CMD : 0,
         .sci_int = object_property_get_uint(o, ACPI_PM_PROP_SCI_INT, NULL),
         .acpi_enable_cmd =
-            object_property_get_uint(o, ACPI_PM_PROP_ACPI_ENABLE_CMD, NULL),
+            smm_enabled ? object_property_get_uint(o, ACPI_PM_PROP_ACPI_ENABLE_CMD, NULL) : 0,
         .acpi_disable_cmd =
-            object_property_get_uint(o, ACPI_PM_PROP_ACPI_DISABLE_CMD, NULL),
+            smm_enabled ? object_property_get_uint(o, ACPI_PM_PROP_ACPI_DISABLE_CMD, NULL) : 0,
         .pm1a_evt = { .space_id = as, .bit_width = 4 * 8, .address = io },
         .pm1a_cnt = { .space_id = as, .bit_width = 2 * 8,
                       .address = io + 0x04 },
-- 
2.17.1



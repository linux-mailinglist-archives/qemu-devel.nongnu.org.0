Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E6B31C4E8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 02:16:33 +0100 (CET)
Received: from localhost ([::1]:39414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBoye-0002s4-SW
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 20:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBopS-0001xI-08
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 20:07:04 -0500
Received: from mga07.intel.com ([134.134.136.100]:13624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBopQ-0004kI-62
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 20:07:01 -0500
IronPort-SDR: UDICC/reJ26878yK/50EjsSK7SoRM/uuPzB/IYzMn3Dy00MVYKZBMjiGh9UI+ixzksV/PvBtRN
 LOkdRe3ivZuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="246849236"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="246849236"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 17:06:43 -0800
IronPort-SDR: Be+FgN3/n+jTaaZX9+fnTE6kDBd06SVUfrkxIbs4+8FNB5huhfEAtHN0UrA1C5gMDHrC2BYozA
 nAqJb+DnE6hg==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591695481"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 17:06:43 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v4 03/10] ich9, piix4: add properoty, smm-compat,
 to keep compatibility of SMM
Date: Mon, 15 Feb 2021 17:04:08 -0800
Message-Id: <0868535e8cc04534e2f2f95fbaca50afa18d0a0a.1613436967.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613436967.git.isaku.yamahata@intel.com>
References: <cover.1613436967.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613436967.git.isaku.yamahata@intel.com>
References: <cover.1613436967.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=isaku.yamahata@intel.com; helo=mga07.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

The following patch will introduce incompatible behavior of SMM.
Introduce a property to keep the old behavior for compatibility.
To enable smm compat, use "-global ICH9-LPC.smm-compat=on" or
"-global PIIX4.smm-compat=on"

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/acpi/piix4.c        | 2 ++
 hw/core/machine.c      | 5 ++++-
 hw/isa/lpc_ich9.c      | 1 +
 include/hw/acpi/ich9.h | 1 +
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 669be5bbf6..30dd9b2309 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -74,6 +74,7 @@ struct PIIX4PMState {
     qemu_irq irq;
     qemu_irq smi_irq;
     int smm_enabled;
+    bool smm_compat;
     Notifier machine_ready;
     Notifier powerdown_notifier;
 
@@ -642,6 +643,7 @@ static Property piix4_pm_properties[] = {
                      use_acpi_root_pci_hotplug, true),
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),
+    DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index de3b8f1b31..870c9201df 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -33,7 +33,10 @@
 #include "migration/global_state.h"
 #include "migration/vmstate.h"
 
-GlobalProperty hw_compat_5_2[] = {};
+GlobalProperty hw_compat_5_2[] = {
+    { "ICH9-LPC", "smm-compat", "on"},
+    { "PIIX4_PM", "smm-compat", "on"},
+};
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
 
 GlobalProperty hw_compat_5_1[] = {
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index d3145bf014..3963b73520 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -775,6 +775,7 @@ static const VMStateDescription vmstate_ich9_lpc = {
 
 static Property ich9_lpc_properties[] = {
     DEFINE_PROP_BOOL("noreboot", ICH9LPCState, pin_strap.spkr_hi, true),
+    DEFINE_PROP_BOOL("smm-compat", ICH9LPCState, pm.smm_compat, false),
     DEFINE_PROP_BIT64("x-smi-broadcast", ICH9LPCState, smi_host_features,
                       ICH9_LPC_SMI_F_BROADCAST_BIT, true),
     DEFINE_PROP_BIT64("x-smi-cpu-hotplug", ICH9LPCState, smi_host_features,
diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index 54571c77e0..df519e40b5 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -59,6 +59,7 @@ typedef struct ICH9LPCPMRegs {
     uint8_t disable_s4;
     uint8_t s4_val;
     uint8_t smm_enabled;
+    bool smm_compat;
     bool enable_tco;
     TCOIORegs tco_regs;
 } ICH9LPCPMRegs;
-- 
2.17.1



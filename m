Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38CC30EE07
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 09:09:11 +0100 (CET)
Received: from localhost ([::1]:34658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ZhP-0003K1-0N
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 03:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l7ZeL-0008U9-4m
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:06:01 -0500
Received: from mga05.intel.com ([192.55.52.43]:43412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l7ZeJ-0007VQ-HA
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:06:00 -0500
IronPort-SDR: R3hOf81Evuy+5lOXbQb7G283VY/iwUX6VM+jAOe7KcVTrb2rDCaD3B74mJYt7YAr7mXloPyW7x
 KCoDNpSKlSZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="266025480"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="266025480"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 00:05:44 -0800
IronPort-SDR: m8luV541/tpxDU7tugHta+7izQwwO59gFpK8+8LdHBhbIhWadEVdAGcrZ9l6ksBUrroi0N0TDE
 sdW5J618yFuQ==
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="372302429"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 00:05:44 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH 1/4] acpi/core: always set SCI_EN when SMM isn't supported
Date: Thu,  4 Feb 2021 00:04:08 -0800
Message-Id: <644e597907e95c0366502e7124b28c577f896e5c.1612424814.git.isaku.yamahata@intel.com>
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

If SMM is not supported, ACPI fixed hardware doesn't support
legacy-mode. ACPI-only platform. Where SCI_EN in PM1_CNT register is
always set.
The bit tells OS legacy mode(SCI_EN cleared) or ACPI mode(SCI_EN set).

ACPI spec 4.8.10.1 PM1 Event Grouping
PM1 Eanble Registers
> For ACPI-only platforms (where SCI_EN is always set)

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/acpi/core.c         | 11 ++++++++++-
 hw/acpi/ich9.c         |  2 +-
 hw/acpi/piix4.c        |  3 ++-
 hw/isa/vt82c686.c      |  2 +-
 include/hw/acpi/acpi.h |  4 +++-
 5 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 7170bff657..1e004d0078 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -579,6 +579,10 @@ void acpi_pm1_cnt_update(ACPIREGS *ar,
                          bool sci_enable, bool sci_disable)
 {
     /* ACPI specs 3.0, 4.7.2.5 */
+    if (ar->pm1.cnt.acpi_only) {
+        return;
+    }
+
     if (sci_enable) {
         ar->pm1.cnt.cnt |= ACPI_BITMASK_SCI_ENABLE;
     } else if (sci_disable) {
@@ -608,11 +612,13 @@ static const MemoryRegionOps acpi_pm_cnt_ops = {
 };
 
 void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
-                       bool disable_s3, bool disable_s4, uint8_t s4_val)
+                       bool disable_s3, bool disable_s4, uint8_t s4_val,
+                       bool acpi_only)
 {
     FWCfgState *fw_cfg;
 
     ar->pm1.cnt.s4_val = s4_val;
+    ar->pm1.cnt.acpi_only = acpi_only;
     ar->wakeup.notify = acpi_notify_wakeup;
     qemu_register_wakeup_notifier(&ar->wakeup);
 
@@ -638,6 +644,9 @@ void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
 void acpi_pm1_cnt_reset(ACPIREGS *ar)
 {
     ar->pm1.cnt.cnt = 0;
+    if (ar->pm1.cnt.acpi_only) {
+        ar->pm1.cnt.cnt |= ACPI_BITMASK_SCI_ENABLE;
+    }
 }
 
 /* ACPI GPE */
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 5ff4e01c36..1a34d7f621 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -282,7 +282,7 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
     acpi_pm_tmr_init(&pm->acpi_regs, ich9_pm_update_sci_fn, &pm->io);
     acpi_pm1_evt_init(&pm->acpi_regs, ich9_pm_update_sci_fn, &pm->io);
     acpi_pm1_cnt_init(&pm->acpi_regs, &pm->io, pm->disable_s3, pm->disable_s4,
-                      pm->s4_val);
+                      pm->s4_val, !smm_enabled);
 
     acpi_gpe_init(&pm->acpi_regs, ICH9_PMIO_GPE0_LEN);
     memory_region_init_io(&pm->io_gpe, OBJECT(lpc_pci), &ich9_gpe_ops, pm,
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 669be5bbf6..0cddf91de5 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -496,7 +496,8 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
 
     acpi_pm_tmr_init(&s->ar, pm_tmr_timer, &s->io);
     acpi_pm1_evt_init(&s->ar, pm_tmr_timer, &s->io);
-    acpi_pm1_cnt_init(&s->ar, &s->io, s->disable_s3, s->disable_s4, s->s4_val);
+    acpi_pm1_cnt_init(&s->ar, &s->io, s->disable_s3, s->disable_s4, s->s4_val,
+                      !s->smm_enabled);
     acpi_gpe_init(&s->ar, GPE_LEN);
 
     s->powerdown_notifier.notify = piix4_pm_powerdown_req;
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index a6f5a0843d..071b64b497 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -240,7 +240,7 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
 
     acpi_pm_tmr_init(&s->ar, pm_tmr_timer, &s->io);
     acpi_pm1_evt_init(&s->ar, pm_tmr_timer, &s->io);
-    acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2);
+    acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2, false);
 }
 
 static Property via_pm_properties[] = {
diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index 22b0b65bb2..9e8a76f2e2 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -128,6 +128,7 @@ struct ACPIPM1CNT {
     MemoryRegion io;
     uint16_t cnt;
     uint8_t s4_val;
+    bool acpi_only;
 };
 
 struct ACPIGPE {
@@ -163,7 +164,8 @@ void acpi_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
 
 /* PM1a_CNT: piix and ich9 don't implement PM1b CNT. */
 void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
-                       bool disable_s3, bool disable_s4, uint8_t s4_val);
+                       bool disable_s3, bool disable_s4, uint8_t s4_val,
+                       bool acpi_only);
 void acpi_pm1_cnt_update(ACPIREGS *ar,
                          bool sci_enable, bool sci_disable);
 void acpi_pm1_cnt_reset(ACPIREGS *ar);
-- 
2.17.1



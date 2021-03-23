Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1F03467D5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:38:39 +0100 (CET)
Received: from localhost ([::1]:45700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlvK-00085A-Et
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOknq-0004A6-Br
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:26:50 -0400
Received: from mga18.intel.com ([134.134.136.126]:35217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOkno-0003rR-8g
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:26:50 -0400
IronPort-SDR: 2hjemtWXhjWqBP6jXUb0AVmMj3b+FJ1w0KFKfYGKk/vKEsjMsfRfNyLTcTJwY1tXPCzlNydbZw
 NA3r8rl8jaQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="178093240"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="178093240"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 10:26:37 -0700
IronPort-SDR: 9FkQ8kErq6Av0556RLo+I5VUGy2zLvxkb444DPqJnfUVRX9R94VENLLVNqUNxUlebWBvEB2ODS
 h258TkYD2i/Q==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="607801303"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 10:26:36 -0700
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 imammedo@redhat.com, f4bug@amsat.org
Subject: [PATCH v2 3/3] acpi:piix4,
 vt82c686: reinitialize acpi PM device on reset
Date: Tue, 23 Mar 2021 10:24:31 -0700
Message-Id: <a4ac127f85c6787cf8fdf0a002b9dc0f3a7e080b.1616519655.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616519655.git.isaku.yamahata@intel.com>
References: <cover.1616519655.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=isaku.yamahata@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, berrange@redhat.com,
 Reinoud Zandijk <reinoud@NetBSD.org>, isaku.yamahata@gmail.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 6be8cf56bc8b made sure that SCI is enabled in PM1.CNT
on reset in acpi_only mode by modifying acpi_pm1_cnt_reset() and
that worked for q35 as expected.

The function was introduced by commit
  eaba51c573a (acpi, acpi_piix, vt82c686: factor out PM1_CNT logic)
that forgot to actually call it at piix4 reset time and as result
SCI_EN wasn't set as was expected by 6be8cf56bc8b in acpi_only mode.

So Windows crashes when it notices that SCI_EN is not set and FADT is
not providing information about how to enable it anymore.
Reproducer:
   qemu-system-x86_64 -enable-kvm -M pc-i440fx-6.0,smm=off -cdrom any_windows_10x64.iso

Fix it by calling acpi_pm1_cnt_reset() at piix4 reset time.

Occasionally this patch adds reset acpi PM related registers on
piix4/vt582c686 reset time and de-assert sci.
piix4_pm_realize() initializes acpi pm tmr, evt, cnt and gpe.
via_pm_realize() initializes acpi pm tmr, evt and cnt.
reset them on device reset. pm_reset() in ich9.c correctly calls
corresponding reset functions.

Fixes: 6be8cf56bc8b (acpi/core: always set SCI_EN when SMM isn't supported)
Reported-by: Reinoud Zandijk <reinoud@NetBSD.org>
Co-developed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
CC: imammedo@redhat.com
CC: isaku.yamahata@intel.com
CC: mst@redhat.com
CC: reinoud@NetBSD.org
CC: isaku.yamahata@gmail.com
CC: berrange@redhat.com
CC: pbonzini@redhat.com
CC: f4bug@amsat.org
CC: aurelien@aurel32.net
---
 hw/acpi/piix4.c   | 7 +++++++
 hw/isa/vt82c686.c | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 6056d51667..8f8b0e95e5 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -326,6 +326,13 @@ static void piix4_pm_reset(DeviceState *dev)
         /* Mark SMM as already inited (until KVM supports SMM). */
         pci_conf[0x5B] = 0x02;
     }
+
+    acpi_pm1_evt_reset(&s->ar);
+    acpi_pm1_cnt_reset(&s->ar);
+    acpi_pm_tmr_reset(&s->ar);
+    acpi_gpe_reset(&s->ar);
+    acpi_update_sci(&s->ar, s->irq);
+
     pm_io_space_update(s);
     acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotplug);
 }
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index f0fb309f12..98325bb32b 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -178,6 +178,11 @@ static void via_pm_reset(DeviceState *d)
     /* SMBus IO base */
     pci_set_long(s->dev.config + 0x90, 1);
 
+    acpi_pm1_evt_reset(&s->ar);
+    acpi_pm1_cnt_reset(&s->ar);
+    acpi_pm_tmr_reset(&s->ar);
+    pm_update_sci(s);
+
     pm_io_space_update(s);
     smb_io_space_update(s);
 }
-- 
2.25.1



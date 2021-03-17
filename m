Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C133FAA8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 22:52:45 +0100 (CET)
Received: from localhost ([::1]:58028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMe5r-0002d2-Iy
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 17:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lMe53-00026e-7T
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:51:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:56330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lMe4z-0005Df-TK
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:51:52 -0400
IronPort-SDR: EOgu7rKNYsToXt5YYLvUrIaRTMI5bDI0nrGkZoQvA0f5pCZZ9yL3lMpgu48yhCVbZKVMzltkW2
 Dpbwvj7qKIGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="186194601"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="186194601"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 14:51:42 -0700
IronPort-SDR: t6pkbIFussvQYx6jzhj6/Wtj0MGcGrksNkGGMVhM8MbCXM19J5rbRb3A62R2RIMDreLT9qJx71
 V8tBj3/Gw/JQ==
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="412816439"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 14:51:39 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH] acpi:piix4, vt82c686: reinitialize acpi PM device on reset
Date: Wed, 17 Mar 2021 14:49:31 -0700
Message-Id: <1ceb31c6782f701674d3b907a419f5a82adb37bc.1616012290.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317104146.784de0c1@redhat.com>
References: <20210317104146.784de0c1@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=isaku.yamahata@intel.com; helo=mga11.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: isaku.yamahata@intel.com, berrange@redhat.com, mst@redhat.com,
 f4bug@amsat.org, Reinoud Zandijk <reinoud@NetBSD.org>, aurelien@aurel32.net,
 pbonzini@redhat.com, Igor Mammedov <imammedo@redhat.com>,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

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
index 1efc0ded9f..a00525025b 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -325,6 +325,13 @@ static void piix4_pm_reset(DeviceState *dev)
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
index 05d084f698..7bacad03e2 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -167,6 +167,11 @@ static void via_pm_reset(DeviceState *d)
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



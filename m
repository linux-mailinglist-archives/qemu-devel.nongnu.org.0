Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FC1346A88
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:58:45 +0100 (CET)
Received: from localhost ([::1]:41802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOo6u-00082F-LR
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOo2z-00027C-Py
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:54:41 -0400
Received: from mga11.intel.com ([192.55.52.93]:35910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOo2v-0000Ds-38
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:54:41 -0400
IronPort-SDR: Wpn9gFRQVVCI1OzaOghxov/Www/PlZAylDTmzZRDBMWUxdxT4J2eKORoEXjSvxq7GZX4srz2if
 bUlUng4yMHkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="187248555"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="187248555"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 13:54:28 -0700
IronPort-SDR: KqThw6/KJA5a9Kc8xjdI/MW997bNdrhuZnq1Rb2wsR4hPdf7dVO6FI/ptbDRQ8V3hK5onUS0xE
 1yJRw6e4Wg2Q==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="607869568"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 13:54:26 -0700
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 imammedo@redhat.com, f4bug@amsat.org
Subject: [PATCH v3 1/4] acpi/piix4: reinitialize acpi PM device on reset
Date: Tue, 23 Mar 2021 13:52:24 -0700
Message-Id: <8a5bbd19727045ec863523830078dd4ca63f6a9a.1616532563.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616532563.git.isaku.yamahata@intel.com>
References: <cover.1616532563.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=isaku.yamahata@intel.com; helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
piix4 reset time and de-assert sci.
piix4_pm_realize() initializes acpi pm tmr, evt, cnt and gpe.
Reset them on device reset. pm_reset() in ich9.c correctly calls
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
 hw/acpi/piix4.c | 7 +++++++
 1 file changed, 7 insertions(+)

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
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6FB30EE0C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 09:11:06 +0100 (CET)
Received: from localhost ([::1]:38616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ZjF-00057b-K5
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 03:11:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l7ZeO-00006F-Cw
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:06:04 -0500
Received: from mga05.intel.com ([192.55.52.43]:43427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l7ZeM-0007ds-IM
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:06:04 -0500
IronPort-SDR: feX8yt0esTLxlpydBvze27UXDvi1oEvfC6H/9/nzsCWpjUvc70mmSeXM51tku1aWW1IEd91Mc0
 ew4gj3u4KOFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="266025487"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="266025487"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 00:05:45 -0800
IronPort-SDR: XlJJZeXo220pxYhtCsOhzdY32/VgQnE5Lse3RUuRRD8/wWgF1URv2G7IVaVyFfmmyc4uetwG5c
 p0OGwF9B33cQ==
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="372302442"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 00:05:45 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH 4/4] i386: acpi: Don't build HPET ACPI entry if HPET is
 disabled
Date: Thu,  4 Feb 2021 00:04:11 -0800
Message-Id: <d62e491a87a698dc8fd703815867013e04f49c2c.1612424814.git.isaku.yamahata@intel.com>
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
Cc: Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Omit HPET AML if the HPET is disabled, QEMU is not emulating it and the
guest may get confused by seeing HPET in the ACPI tables without a
"physical" device present.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 hw/i386/acpi-build.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 6e38f67120..a4fcd14a93 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1401,7 +1401,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
-        build_hpet_aml(dsdt);
+        if (misc->has_hpet) {
+            build_hpet_aml(dsdt);
+        }
         build_piix4_isa_bridge(dsdt);
         build_isa_devices_aml(dsdt);
         if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
@@ -1446,7 +1448,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
         aml_append(dsdt, sb_scope);
 
-        build_hpet_aml(dsdt);
+        if (misc->has_hpet) {
+            build_hpet_aml(dsdt);
+        }
         build_q35_isa_bridge(dsdt);
         build_isa_devices_aml(dsdt);
         build_q35_pci0_int(dsdt);
-- 
2.17.1



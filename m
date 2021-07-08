Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A323BF363
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:17:27 +0200 (CEST)
Received: from localhost ([::1]:49058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IfO-00069X-Rr
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1ILM-0002uN-CR
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:44 -0400
Received: from mga12.intel.com ([192.55.52.136]:57600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1ILK-0007Kk-KH
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="189101748"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="189101748"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:56:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770134"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:56:00 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 44/44] i386/tdx: disable S3/S4 unconditionally
Date: Wed,  7 Jul 2021 17:55:14 -0700
Message-Id: <a3b3965d7ec4c462aa5dc9c7820ca12d5ef5635b.1625704981.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=isaku.yamahata@intel.com; helo=mga12.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Disable S3/S4 unconditionally when TDX is enabled.  Because cpu state is
protected, it's not allowed to reset cpu state.  So S3/S4 can't be
supported.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 target/i386/kvm/tdx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 0621317b0a..0dd6d94c2a 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -31,6 +31,9 @@
 #include "sysemu/tdx.h"
 #include "tdx.h"
 
+#include "hw/southbridge/piix.h"
+#include "hw/i386/ich9.h"
+
 #define TDX1_TD_ATTRIBUTE_DEBUG BIT_ULL(0)
 #define TDX1_TD_ATTRIBUTE_PERFMON BIT_ULL(63)
 #define TDX1_MIN_TSC_FREQUENCY_KHZ (100 * 1000)
@@ -103,10 +106,27 @@ static TdxFirmwareEntry *tdx_get_hob_entry(TdxGuest *tdx)
 
 static void tdx_finalize_vm(Notifier *notifier, void *unused)
 {
+    Object *pm;
+    bool ambig;
     MachineState *ms = MACHINE(qdev_get_machine());
     TdxGuest *tdx = TDX_GUEST(ms->cgs);
     TdxFirmwareEntry *entry;
 
+    /*
+     * object look up logic is copied from acpi_get_pm_info()
+     * @ hw/ie86/acpi-build.c
+     * This property override needs to be done after machine initialization
+     * as there is no ordering of creation of objects/properties.
+     */
+    pm = object_resolve_path_type("", TYPE_PIIX4_PM, &ambig);
+    if (ambig || !pm) {
+        pm = object_resolve_path_type("", TYPE_ICH9_LPC_DEVICE, &ambig);
+    }
+    if (!ambig && pm) {
+        object_property_set_uint(pm, ACPI_PM_PROP_S3_DISABLED, 1, NULL);
+        object_property_set_uint(pm, ACPI_PM_PROP_S4_DISABLED, 1, NULL);
+    }
+
     tdvf_hob_create(tdx, tdx_get_hob_entry(tdx));
 
     for_each_fw_entry(&tdx->fw, entry) {
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC87403615
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:27:11 +0200 (CEST)
Received: from localhost ([::1]:53094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNsvG-0005dT-1g
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mNstb-0002qq-31
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:25:27 -0400
Received: from mga14.intel.com ([192.55.52.115]:13020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mNstZ-0003r6-14
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:25:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220102696"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="220102696"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 01:25:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="538450892"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2021 01:25:16 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] i386: Add sgx_get_info() interface
Date: Wed,  8 Sep 2021 16:19:33 +0800
Message-Id: <20210908081937.77254-4-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210908081937.77254-1-yang.zhong@intel.com>
References: <20210908081937.77254-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, eblake@redhat.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the sgx_get_info() interface for hmp and QMP usage, which
will get the SGX info from this API.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/sgx.c         | 21 +++++++++++++++++++++
 include/hw/i386/sgx.h | 11 +++++++++++
 target/i386/monitor.c | 32 ++++++++++++++++++++++++++++----
 3 files changed, 60 insertions(+), 4 deletions(-)
 create mode 100644 include/hw/i386/sgx.h

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 5f988c6368..a3cd671a70 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -17,6 +17,27 @@
 #include "monitor/qdev.h"
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
+#include "hw/i386/sgx.h"
+
+SGXInfo *sgx_get_info(void)
+{
+    SGXInfo *info = NULL;
+    MachineState *ms = MACHINE(qdev_get_machine());
+    X86MachineState *x86ms = X86_MACHINE(qdev_get_machine());
+
+    if (x86ms->sgx_epc_list) {
+        PCMachineState *pcms = PC_MACHINE(ms);
+        SGXEPCState *sgx_epc = &pcms->sgx_epc;
+        info = g_new0(SGXInfo, 1);
+
+        info->sgx = true;
+        info->sgx1 = true;
+        info->sgx2 = true;
+        info->flc = true;
+        info->section_size = sgx_epc->size;
+    }
+    return info;
+}
 
 int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
 {
diff --git a/include/hw/i386/sgx.h b/include/hw/i386/sgx.h
new file mode 100644
index 0000000000..ea8672f8eb
--- /dev/null
+++ b/include/hw/i386/sgx.h
@@ -0,0 +1,11 @@
+#ifndef QEMU_SGX_H
+#define QEMU_SGX_H
+
+#include "qom/object.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qapi/qapi-types-misc-target.h"
+
+SGXInfo *sgx_get_info(void);
+
+#endif
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index f1861fe6c2..0f1b48b4f8 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -35,6 +35,7 @@
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
 #include "hw/i386/pc.h"
+#include "hw/i386/sgx.h"
 
 /* Perform linear address sign extension */
 static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
@@ -766,12 +767,35 @@ qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
 
 SGXInfo *qmp_query_sgx(Error **errp)
 {
-    error_setg(errp, QERR_FEATURE_DISABLED, "query-sgx");
-    return NULL;
+    SGXInfo *info;
+
+    info = sgx_get_info();
+    if (!info) {
+        error_setg(errp, "SGX features are not available");
+        return NULL;
+    }
+
+    return info;
 }
 
 void hmp_info_sgx(Monitor *mon, const QDict *qdict)
 {
-    error_setg(errp, QERR_FEATURE_DISABLED, "query-sgx");
-    return NULL;
+    SGXInfo *info = qmp_query_sgx(NULL);
+
+    if (info && info->sgx) {
+        monitor_printf(mon, "SGX support: %s\n",
+                       info->sgx ? "enabled" : "disabled");
+        monitor_printf(mon, "SGX1 support: %s\n",
+                       info->sgx1 ? "enabled" : "disabled");
+        monitor_printf(mon, "SGX2 support: %s\n",
+                       info->sgx2 ? "enabled" : "disabled");
+        monitor_printf(mon, "FLC support: %s\n",
+                       info->flc ? "enabled" : "disabled");
+        monitor_printf(mon, "size: %" PRIu64 "\n",
+                       info->section_size);
+    } else {
+        monitor_printf(mon, "SGX is not enabled\n");
+    }
+
+    qapi_free_SGXInfo(info);
 }


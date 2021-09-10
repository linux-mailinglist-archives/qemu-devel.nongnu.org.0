Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9350A406A2E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 12:34:20 +0200 (CEST)
Received: from localhost ([::1]:60978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOdrP-0003tc-NL
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 06:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mOdmP-000662-RQ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:29:13 -0400
Received: from mga17.intel.com ([192.55.52.151]:47080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mOdmN-0002IY-Tr
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:29:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="201241626"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="201241626"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 03:28:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="540545518"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Sep 2021 03:28:50 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] monitor: Add HMP and QMP interfaces
Date: Fri, 10 Sep 2021 18:22:56 +0800
Message-Id: <20210910102258.46648-2-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210910102258.46648-1-yang.zhong@intel.com>
References: <20210910102258.46648-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, philmd@redhat.com,
 eblake@redhat.com, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QMP and HMP interfaces can be used by monitor or QMP tools to retrieve
the SGX information from VM side when SGX is enabled on Intel platform.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hmp-commands-info.hx         | 15 +++++++++++++
 hw/i386/sgx.c                | 29 ++++++++++++++++++++++++
 include/hw/i386/sgx.h        | 11 +++++++++
 include/monitor/hmp-target.h |  1 +
 qapi/misc-target.json        | 43 ++++++++++++++++++++++++++++++++++++
 target/i386/monitor.c        | 36 ++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c   |  1 +
 7 files changed, 136 insertions(+)
 create mode 100644 include/hw/i386/sgx.h

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 27206ac049..4c966e8a6b 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -877,3 +877,18 @@ SRST
   ``info dirty_rate``
     Display the vcpu dirty rate information.
 ERST
+
+#if defined(TARGET_I386)
+    {
+        .name       = "sgx",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show intel SGX information",
+        .cmd        = hmp_info_sgx,
+    },
+#endif
+
+SRST
+  ``info sgx``
+    Show intel SGX information.
+ERST
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 02fa6487c3..8a32d62d7e 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -17,6 +17,35 @@
 #include "monitor/qdev.h"
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
+#include "hw/i386/sgx.h"
+
+SGXInfo *sgx_get_info(void)
+{
+    SGXInfo *info = NULL;
+    X86MachineState *x86ms;
+    PCMachineState *pcms =
+        (PCMachineState *)object_dynamic_cast(qdev_get_machine(),
+                                              TYPE_PC_MACHINE);
+    if (!pcms) {
+        return NULL;
+    }
+
+    x86ms = X86_MACHINE(pcms);
+    if (!x86ms->sgx_epc_list) {
+        return NULL;
+    }
+
+    SGXEPCState *sgx_epc = &pcms->sgx_epc;
+    info = g_new0(SGXInfo, 1);
+
+    info->sgx = true;
+    info->sgx1 = true;
+    info->sgx2 = true;
+    info->flc = true;
+    info->section_size = sgx_epc->size;
+
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
diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index 60fc92722a..dc53add7ee 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -49,5 +49,6 @@ void hmp_info_tlb(Monitor *mon, const QDict *qdict);
 void hmp_mce(Monitor *mon, const QDict *qdict);
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
 void hmp_info_io_apic(Monitor *mon, const QDict *qdict);
+void hmp_info_sgx(Monitor *mon, const QDict *qdict);
 
 #endif /* MONITOR_HMP_TARGET_H */
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 3b05ad3dbf..e2a347cc23 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -333,3 +333,46 @@
 { 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
   'returns': 'SevAttestationReport',
   'if': 'TARGET_I386' }
+
+##
+# @SGXInfo:
+#
+# Information about intel Safe Guard eXtension (SGX) support
+#
+# @sgx: true if SGX is supported
+#
+# @sgx1: true if SGX1 is supported
+#
+# @sgx2: true if SGX2 is supported
+#
+# @flc: true if FLC is supported
+#
+# @section-size: The EPC section size for guest
+#
+# Since: 6.2
+##
+{ 'struct': 'SGXInfo',
+  'data': { 'sgx': 'bool',
+            'sgx1': 'bool',
+            'sgx2': 'bool',
+            'flc': 'bool',
+            'section-size': 'uint64'},
+   'if': 'TARGET_I386' }
+
+##
+# @query-sgx:
+#
+# Returns information about SGX
+#
+# Returns: @SGXInfo
+#
+# Since: 6.2
+#
+# Example:
+#
+# -> { "execute": "query-sgx" }
+# <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
+#                  "flc": true, "section-size" : 0 } }
+#
+##
+{ 'command': 'query-sgx', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 119211f0b0..0f1b48b4f8 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -35,6 +35,7 @@
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
 #include "hw/i386/pc.h"
+#include "hw/i386/sgx.h"
 
 /* Perform linear address sign extension */
 static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
@@ -763,3 +764,38 @@ qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
 {
     return sev_get_attestation_report(mnonce, errp);
 }
+
+SGXInfo *qmp_query_sgx(Error **errp)
+{
+    SGXInfo *info;
+
+    info = sgx_get_info();
+    if (!info) {
+        error_setg(errp, "SGX features are not available");
+        return NULL;
+    }
+
+    return info;
+}
+
+void hmp_info_sgx(Monitor *mon, const QDict *qdict)
+{
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
+}
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index c98b78d033..b75f3364f3 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -100,6 +100,7 @@ static bool query_is_ignored(const char *cmd)
         /* Success depends on Host or Hypervisor SEV support */
         "query-sev",
         "query-sev-capabilities",
+        "query-sgx",
         NULL
     };
     int i;


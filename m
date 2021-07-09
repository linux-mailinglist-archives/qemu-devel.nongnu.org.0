Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3240E3C2323
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:46:00 +0200 (CEST)
Received: from localhost ([::1]:47710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1oxB-0006nO-LQ
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oUU-0001iY-0j
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:16:18 -0400
Received: from mga06.intel.com ([134.134.136.31]:37173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oUS-0005A9-5T
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:16:17 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="270800882"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="270800882"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 04:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="428730355"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2021 04:15:12 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/33] qmp: Add the qmp_query_sgx_capabilities()
Date: Fri,  9 Jul 2021 19:09:52 +0800
Message-Id: <20210709110955.73256-31-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210709110955.73256-1-yang.zhong@intel.com>
References: <20210709110955.73256-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Libvirt can use qmp_query_sgx_capabilities() to get the host
sgx capabilities.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>

v1-->v2:
   - Changed the blurb error and "Since: 5.1" to "Since: 6.1"(Eric Blake).
---
 hw/i386/sgx.c              | 66 ++++++++++++++++++++++++++++++++++++++
 include/hw/i386/pc.h       |  1 +
 monitor/qmp-cmds.c         |  5 +++
 qapi/misc.json             | 19 +++++++++++
 stubs/sgx-stub.c           |  5 +++
 tests/qtest/qmp-cmd-test.c |  1 +
 6 files changed, 97 insertions(+)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index cbc8da94cc..bd0587a376 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -17,6 +17,72 @@
 #include "monitor/qdev.h"
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
+#include "sysemu/hw_accel.h"
+
+#define SGX_MAX_EPC_SECTIONS            8
+#define SGX_CPUID_EPC_INVALID           0x0
+
+/* A valid EPC section. */
+#define SGX_CPUID_EPC_SECTION           0x1
+#define SGX_CPUID_EPC_MASK              GENMASK(3, 0)
+
+static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
+{
+    return (low & GENMASK_ULL(31, 12)) +
+           ((high & GENMASK_ULL(19, 0)) << 32);
+}
+
+static uint64_t sgx_calc_host_epc_section_size(void)
+{
+    uint32_t i, type;
+    uint32_t eax, ebx, ecx, edx;
+    uint64_t size = 0;
+
+    for (i = 0; i < SGX_MAX_EPC_SECTIONS; i++) {
+        host_cpuid(0x12, i + 2, &eax, &ebx, &ecx, &edx);
+
+        type = eax & SGX_CPUID_EPC_MASK;
+        if (type == SGX_CPUID_EPC_INVALID) {
+            break;
+        }
+
+        if (type != SGX_CPUID_EPC_SECTION) {
+            break;
+        }
+
+        size += sgx_calc_section_metric(ecx, edx);
+    }
+
+    return size;
+}
+
+SGXInfo *sgx_get_capabilities(Error **errp)
+{
+    SGXInfo *info = NULL;
+    uint32_t eax, ebx, ecx, edx;
+
+    int fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
+    if (fd < 0) {
+        error_setg(errp, "SGX is not enabled in KVM");
+        return NULL;
+    }
+
+    info = g_new0(SGXInfo, 1);
+    host_cpuid(0x7, 0, &eax, &ebx, &ecx, &edx);
+
+    info->sgx = ebx & (1U << 2) ? true : false;
+    info->flc = ecx & (1U << 30) ? true : false;
+
+    host_cpuid(0x12, 0, &eax, &ebx, &ecx, &edx);
+    info->sgx1 = eax & (1U << 0) ? true : false;
+    info->sgx2 = eax & (1U << 1) ? true : false;
+
+    info->section_size = sgx_calc_host_epc_section_size();
+
+    close(fd);
+
+    return info;
+}
 
 SGXInfo *sgx_get_info(void)
 {
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 2dba83aee2..7e595a0431 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -205,6 +205,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms);
 void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
                               Error **errp);
 SGXInfo *sgx_get_info(void);
+SGXInfo *sgx_get_capabilities(Error **errp);
 
 extern GlobalProperty pc_compat_5_2[];
 extern const size_t pc_compat_5_2_len;
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 48f7708ffe..f1360e9f4e 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -365,3 +365,8 @@ SGXInfo *qmp_query_sgx(Error **errp)
 
     return info;
 }
+
+SGXInfo *qmp_query_sgx_capabilities(Error **errp)
+{
+    return sgx_get_capabilities(errp);
+}
diff --git a/qapi/misc.json b/qapi/misc.json
index 83b45a1460..8d1a78d138 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -561,3 +561,22 @@
 #
 ##
 { 'command': 'query-sgx', 'returns': 'SGXInfo' }
+
+
+##
+# @query-sgx-capabilities:
+#
+# Returns information from host SGX capabilities
+#
+# Returns: @SGXInfo
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute": "query-sgx-capabilities" }
+# <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
+#                  "flc": true, "section-size" : 0 } }
+#
+##
+{ 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo' }
diff --git a/stubs/sgx-stub.c b/stubs/sgx-stub.c
index c2b59a88fd..1dedf3f3db 100644
--- a/stubs/sgx-stub.c
+++ b/stubs/sgx-stub.c
@@ -5,3 +5,8 @@ SGXInfo *sgx_get_info(void)
 {
     return NULL;
 }
+
+SGXInfo *sgx_get_capabilities(Error **errp)
+{
+    return NULL;
+}
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index b75f3364f3..1af2f74c28 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -101,6 +101,7 @@ static bool query_is_ignored(const char *cmd)
         "query-sev",
         "query-sev-capabilities",
         "query-sgx",
+        "query-sgx-capabilities",
         NULL
     };
     int i;
-- 
2.29.2.334.gfaefdd61ec



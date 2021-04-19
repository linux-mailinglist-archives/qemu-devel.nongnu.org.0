Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A7A363FBD
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:43:36 +0200 (CEST)
Received: from localhost ([::1]:44908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRNP-000256-Li
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR4m-0006de-20
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:24:21 -0400
Received: from mga17.intel.com ([192.55.52.151]:24096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR4j-000256-Vi
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:24:19 -0400
IronPort-SDR: wo/Y1Mu6PoPcGn71GNDnqS/38rk3wey+j8MNqhwGz3GZbA6bDumCJUUcVoRW2khkSmE7+jqgrD
 8QfpZJdFXXkg==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="175409343"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="175409343"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 03:23:18 -0700
IronPort-SDR: f2Lcc+a4Tyiwab9GrXw294YjVUyvWmtwVgT6YgMfzP37cMzER6VKU5mEtdNeh47ZRf1o8TaMRi
 dvJcvboXMQ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="419947540"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2021 03:23:17 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/32] qmp: Add the qmp_query_sgx_capabilities()
Date: Mon, 19 Apr 2021 18:01:53 +0800
Message-Id: <20210419100156.53504-30-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210419100156.53504-1-yang.zhong@intel.com>
References: <20210419100156.53504-1-yang.zhong@intel.com>
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The libvirt can use qmp_query_sgx_capabilities() to get the host
sgx capabilitis.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/sgx-epc.c          | 64 ++++++++++++++++++++++++++++++++++++++
 include/hw/i386/pc.h       |  1 +
 monitor/qmp-cmds.c         |  5 +++
 qapi/misc.json             | 19 +++++++++++
 stubs/sgx-stub.c           |  5 +++
 tests/qtest/qmp-cmd-test.c |  1 +
 6 files changed, 95 insertions(+)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index 7daea0613b..7b198595d5 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -27,6 +27,14 @@
 
 uint32_t epc_num;
 
+#define SGX_MAX_EPC_SECTIONS            8
+#define SGX_CPUID_EPC_INVALID           0x0
+
+/* A valid EPC section. */
+#define SGX_CPUID_EPC_SECTION           0x1
+
+#define SGX_CPUID_EPC_MASK              GENMASK(3, 0)
+
 static Property sgx_epc_properties[] = {
     DEFINE_PROP_UINT64(SGX_EPC_ADDR_PROP, SGXEPCDevice, addr, 0),
     DEFINE_PROP_LINK(SGX_EPC_MEMDEV_PROP, SGXEPCDevice, hostmem,
@@ -344,6 +352,62 @@ SGXInfo *sgx_get_info(void)
     return info;
 }
 
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
+    int fd = open("/dev/sgx_vepc", O_RDWR);
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
+    return info;
+}
+
 static QemuOptsList sgx_epc_opts = {
     .name = "sgx-epc",
     .implied_opt_name = "id",
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index cb74298117..a66795da0f 100644
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
index 112a2f71cf..3f50b42d37 100644
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
+# Since: 5.1
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



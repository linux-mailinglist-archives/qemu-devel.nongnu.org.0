Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0A437A01F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:55:14 +0200 (CEST)
Received: from localhost ([::1]:42296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgMIT-0001PX-Jd
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLtd-0008FK-Nr
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:29:35 -0400
Received: from mga06.intel.com ([134.134.136.31]:46437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLtV-0004hV-1o
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:29:33 -0400
IronPort-SDR: j00LxtgjdeQ6ZYXJJZ36eGHgiWopDd/lakieuNlKXja/Kiwqk6UdvAHTMRSq0Z7374h4A6rlu2
 /WFLB8WRA59Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260631593"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="260631593"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:28:26 -0700
IronPort-SDR: +M50JVNs95tobVngUVCjumRQZpacXR1wU5q7XEL5gEAunJlXZHIWZ3kDFuqnGTcyCd/DTCVvbC
 tM99fvSDiwUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391281414"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 23:28:24 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/32] qmp: Add the qmp_query_sgx_capabilities()
Date: Tue, 11 May 2021 14:20:48 +0800
Message-Id: <20210511062051.41948-30-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210511062051.41948-1-yang.zhong@intel.com>
References: <20210511062051.41948-1-yang.zhong@intel.com>
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Libvirt can use qmp_query_sgx_capabilities() to get the host
sgx capabilities.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>

v1-->v2:
   - Changed the blurb error and "Since: 5.1" to "Since: 6.1"(Eric Blake).
---
 hw/i386/sgx-epc.c          | 66 ++++++++++++++++++++++++++++++++++++++
 include/hw/i386/pc.h       |  1 +
 monitor/qmp-cmds.c         |  5 +++
 qapi/misc.json             | 19 +++++++++++
 stubs/sgx-stub.c           |  5 +++
 tests/qtest/qmp-cmd-test.c |  1 +
 6 files changed, 97 insertions(+)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index 7daea0613b..0995956f99 100644
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
@@ -344,6 +352,64 @@ SGXInfo *sgx_get_info(void)
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
+
 static QemuOptsList sgx_epc_opts = {
     .name = "sgx-epc",
     .implied_opt_name = "id",
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 021de8026f..b3ce44099a 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -208,6 +208,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms);
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



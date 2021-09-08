Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330D440361A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:29:00 +0200 (CEST)
Received: from localhost ([::1]:60944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNsx1-0002V8-9Y
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mNstc-0002sb-Gw
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:25:28 -0400
Received: from mga14.intel.com ([192.55.52.115]:13021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mNstZ-0003sa-Iw
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:25:28 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220102704"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="220102704"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 01:25:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="538450920"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2021 01:25:20 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] qmp: Add the qmp_query_sgx_capabilities()
Date: Wed,  8 Sep 2021 16:19:35 +0800
Message-Id: <20210908081937.77254-6-yang.zhong@intel.com>
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

Libvirt can use qmp_query_sgx_capabilities() to get the host
sgx capabilities.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/sgx.c              | 66 ++++++++++++++++++++++++++++++++++++++
 include/hw/i386/sgx.h      |  1 +
 qapi/misc-target.json      | 18 +++++++++++
 target/i386/monitor.c      |  5 +++
 tests/qtest/qmp-cmd-test.c |  1 +
 5 files changed, 91 insertions(+)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index a3cd671a70..854532fb98 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -18,6 +18,72 @@
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
 #include "hw/i386/sgx.h"
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
diff --git a/include/hw/i386/sgx.h b/include/hw/i386/sgx.h
index ea8672f8eb..28437cffc6 100644
--- a/include/hw/i386/sgx.h
+++ b/include/hw/i386/sgx.h
@@ -7,5 +7,6 @@
 #include "qapi/qapi-types-misc-target.h"
 
 SGXInfo *sgx_get_info(void);
+SGXInfo *sgx_get_capabilities(Error **errp);
 
 #endif
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index e2a347cc23..594fbd1577 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -376,3 +376,21 @@
 #
 ##
 { 'command': 'query-sgx', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
+
+##
+# @query-sgx-capabilities:
+#
+# Returns information from host SGX capabilities
+#
+# Returns: @SGXInfo
+#
+# Since: 6.2
+#
+# Example:
+#
+# -> { "execute": "query-sgx-capabilities" }
+# <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
+#                  "flc": true, "section-size" : 0 } }
+#
+##
+{ 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 0f1b48b4f8..23a6dc3b7d 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -799,3 +799,8 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
 
     qapi_free_SGXInfo(info);
 }
+
+SGXInfo *qmp_query_sgx_capabilities(Error **errp)
+{
+    return sgx_get_capabilities(errp);
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


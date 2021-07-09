Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468743C2309
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:42:13 +0200 (CEST)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1otY-0003B7-Ad
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oUI-0001Hy-Dh
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:16:06 -0400
Received: from mga06.intel.com ([134.134.136.31]:37176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oUF-0005Av-2d
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:16:06 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="270800860"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="270800860"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 04:15:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="428730338"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2021 04:15:08 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/33] i386: Add sgx_get_info() interface
Date: Fri,  9 Jul 2021 19:09:50 +0800
Message-Id: <20210709110955.73256-29-yang.zhong@intel.com>
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

Add the sgx_get_info() interface for hmp and QMP usage, which
will get the SGX info from this API.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/sgx.c             | 23 +++++++++++++++++++++++
 include/hw/i386/pc.h      |  1 +
 include/hw/i386/sgx-epc.h |  1 +
 monitor/hmp-cmds.c        | 20 ++++++++++++++++++--
 monitor/qmp-cmds.c        | 12 ++++++++++--
 stubs/meson.build         |  1 +
 stubs/sgx-stub.c          |  7 +++++++
 7 files changed, 61 insertions(+), 4 deletions(-)
 create mode 100644 stubs/sgx-stub.c

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 8f322e4e3d..cbc8da94cc 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -18,6 +18,29 @@
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
 
+SGXInfo *sgx_get_info(void)
+{
+    SGXInfo *info = NULL;
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    if (ms->sgx_epc.memdev) {
+        PCMachineState *pcms = PC_MACHINE(ms);
+        SGXEPCState *sgx_epc = pcms->sgx_epc;
+
+        info = g_new0(SGXInfo, 1);
+
+        info->sgx = true;
+        info->sgx1 = true;
+        info->sgx2 = true;
+        info->flc = true;
+
+        if (sgx_epc) {
+            info->section_size = sgx_epc->size;
+        }
+    }
+    return info;
+}
+
 int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index f603e2f75a..2dba83aee2 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -204,6 +204,7 @@ extern const size_t pc_compat_6_0_len;
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
                               Error **errp);
+SGXInfo *sgx_get_info(void);
 
 extern GlobalProperty pc_compat_5_2[];
 extern const size_t pc_compat_5_2_len;
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index 155e8fad3e..8f9c7becb9 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -13,6 +13,7 @@
 #define QEMU_SGX_EPC_H
 
 #include "sysemu/hostmem.h"
+#include "qapi/qapi-types-misc.h"
 
 #define TYPE_SGX_EPC "sgx-epc"
 #define SGX_EPC(obj) \
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9ebc86190f..053d210535 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2233,6 +2233,22 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
 
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
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index d63d59149f..48f7708ffe 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -40,6 +40,7 @@
 #include "qapi/qmp/qerror.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
+#include "hw/i386/pc.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
@@ -354,6 +355,13 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
 
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
diff --git a/stubs/meson.build b/stubs/meson.build
index 2e79ff9f4d..5d394267f5 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -55,3 +55,4 @@ if have_system
 else
   stub_ss.add(files('qdev.c'))
 endif
+stub_ss.add(files('sgx-stub.c'))
diff --git a/stubs/sgx-stub.c b/stubs/sgx-stub.c
new file mode 100644
index 0000000000..c2b59a88fd
--- /dev/null
+++ b/stubs/sgx-stub.c
@@ -0,0 +1,7 @@
+#include "qemu/osdep.h"
+#include "hw/i386/pc.h"
+
+SGXInfo *sgx_get_info(void)
+{
+    return NULL;
+}
-- 
2.29.2.334.gfaefdd61ec



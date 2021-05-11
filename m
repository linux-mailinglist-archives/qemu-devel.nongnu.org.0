Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBD737A03F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:00:32 +0200 (CEST)
Received: from localhost ([::1]:53760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgMNb-0000iI-L1
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLtK-0007q9-P4
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:29:14 -0400
Received: from mga06.intel.com ([134.134.136.31]:46423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLtI-0004ZR-M3
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:29:14 -0400
IronPort-SDR: Cu2F4W7SkWrV7QSEiDlIdDT4lyx1CfIiCGRefieGEEgZPwRahMSs0Fi7J6flhOcd96PJiZDuu3
 pVTOvCI7vaZA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260631585"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="260631585"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:28:22 -0700
IronPort-SDR: rpdY+i1dakaOjof7gqh2AY+6zJ39gfz3EvKVTP9WpuBbcL+8S+IJcBf6hVJo9hjWDYyDmDinOE
 cNyaLe4MWG4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391281385"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 23:28:20 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/32] i386: Add sgx_get_info() interface
Date: Tue, 11 May 2021 14:20:46 +0800
Message-Id: <20210511062051.41948-28-yang.zhong@intel.com>
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

Add the sgx_get_info() interface for hmp and QMP usage, which
will get the SGX info from this API.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/sgx-epc.c         | 22 ++++++++++++++++++++++
 include/hw/i386/pc.h      |  1 +
 include/hw/i386/sgx-epc.h |  1 +
 monitor/hmp-cmds.c        | 20 ++++++++++++++++++--
 monitor/qmp-cmds.c        | 12 ++++++++++--
 stubs/meson.build         |  1 +
 stubs/sgx-stub.c          |  7 +++++++
 7 files changed, 60 insertions(+), 4 deletions(-)
 create mode 100644 stubs/sgx-stub.c

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index fbacec6e00..7daea0613b 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -322,6 +322,28 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
     memory_region_set_size(&sgx_epc->mr, sgx_epc->size);
 }
 
+SGXInfo *sgx_get_info(void)
+{
+    SGXInfo *info;
+
+    info = g_new0(SGXInfo, 1);
+    if (sgx_epc_enabled) {
+        PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+        SGXEPCState *sgx_epc = pcms->sgx_epc;
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
+
+    return info;
+}
+
 static QemuOptsList sgx_epc_opts = {
     .name = "sgx-epc",
     .implied_opt_name = "id",
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index a9167e3c3f..021de8026f 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -207,6 +207,7 @@ extern const size_t pc_compat_6_0_len;
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
                               Error **errp);
+SGXInfo *sgx_get_info(void);
 
 extern GlobalProperty pc_compat_5_2[];
 extern const size_t pc_compat_5_2_len;
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index 743d0a943c..30a1c61b60 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -13,6 +13,7 @@
 #define QEMU_SGX_EPC_H
 
 #include "sysemu/hostmem.h"
+#include "qapi/qapi-types-misc.h"
 
 #define TYPE_SGX_EPC "sgx-epc"
 #define SGX_EPC(obj) \
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 1d1efca713..bd539e0c1e 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2229,6 +2229,22 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
 
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
index be6f6d609e..1cba20a9a8 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -54,3 +54,4 @@ if have_system
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



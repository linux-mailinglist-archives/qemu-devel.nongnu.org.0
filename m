Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44303A5EF7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:13:43 +0200 (CEST)
Received: from localhost ([::1]:49252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsif8-0008RA-Qf
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1lsiUg-0005IC-D5
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:02:54 -0400
Received: from zamok.crans.org ([2a0c:700:2:0:ec4:7aff:fe59:a1ad]:57066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1lsiUa-0003vz-GA
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:02:53 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id 820FEE0080; Mon, 14 Jun 2021 11:02:36 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] contrib/plugins: add execlog to log instruction execution and
 memory access
Date: Mon, 14 Jun 2021 11:01:16 +0200
Message-Id: <20210614090116.816833-1-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a0c:700:2:0:ec4:7aff:fe59:a1ad;
 envelope-from=erdnaxe@crans.org; helo=zamok.crans.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Log instruction execution and memory access to a file.
This plugin can be used for reverse engineering or for side-channel analysis
using QEMU.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
---
 MAINTAINERS               |   1 +
 contrib/plugins/Makefile  |   1 +
 contrib/plugins/execlog.c | 112 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 contrib/plugins/execlog.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d9cd29042..65942d5802 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2974,6 +2974,7 @@ F: include/tcg/
 
 TCG Plugins
 M: Alex Bennée <alex.bennee@linaro.org>
+R: Alexandre Iooss <erdnaxe@crans.org>
 S: Maintained
 F: docs/devel/tcg-plugins.rst
 F: plugins/
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index b9d7935e5e..51093acd17 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -13,6 +13,7 @@ include $(BUILD_DIR)/config-host.mak
 VPATH += $(SRC_PATH)/contrib/plugins
 
 NAMES :=
+NAMES += execlog
 NAMES += hotblocks
 NAMES += hotpages
 NAMES += howvec
diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
new file mode 100644
index 0000000000..80716e8eed
--- /dev/null
+++ b/contrib/plugins/execlog.c
@@ -0,0 +1,112 @@
+/*
+ * Copyright (C) 2021, Alexandre Iooss <erdnaxe@crans.org>
+ *
+ * Log instruction execution and memory access to a file.
+ * You may pass the output filename as argument.
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+#include <glib.h>
+#include <inttypes.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include <qemu-plugin.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+/* Execution trace buffer */
+FILE *output;
+
+/**
+ * Log memory read or write
+ */
+static void vcpu_mem(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
+                     uint64_t vaddr, void *udata)
+{
+    struct qemu_plugin_hwaddr *hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
+    if (!hwaddr) {
+        return;
+    }
+
+    /* Add data to execution log */
+    const char *name = qemu_plugin_hwaddr_device_name(hwaddr);
+    uint64_t addr = qemu_plugin_hwaddr_phys_addr(hwaddr);
+    if (qemu_plugin_mem_is_store(info)) {
+        fprintf(output, "mem: %s store at 0x%08lx\n", name, addr);
+    } else {
+        fprintf(output, "mem: %s load at 0x%08lx\n", name, addr);
+    }
+}
+
+/**
+ * Log instruction execution
+ */
+static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
+{
+    char *insn_disas = (char *)udata;
+
+    /* Add data to execution log */
+    fprintf(output, "insn: %s\n", insn_disas);
+}
+
+/**
+ * On translation block new translation
+ *
+ * QEMU convert code by translation block (TB). By hooking here we can then hook
+ * a callback on each instruction and memory access.
+ */
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    size_t n = qemu_plugin_tb_n_insns(tb);
+    for (size_t i = 0; i < n; i++) {
+        /* insn is shared between translations in QEMU, copy needed data here */
+        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
+        char *insn_disas = qemu_plugin_insn_disas(insn);
+
+        /* Register callback on memory read or write */
+        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem,
+                                         QEMU_PLUGIN_CB_NO_REGS,
+                                         QEMU_PLUGIN_MEM_RW, NULL);
+
+        /* Register callback on instruction */
+        qemu_plugin_register_vcpu_insn_exec_cb(
+            insn, vcpu_insn_exec, QEMU_PLUGIN_CB_R_REGS, insn_disas);
+    }
+}
+
+/**
+ * On plugin exit, close output file
+ */
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    fclose(output);
+}
+
+/**
+ * Install the plugin
+ */
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info, int argc,
+                                           char **argv)
+{
+    /* Parse arguments to get output name and open for writing */
+    char *filename = "execution.log";
+    if (argc > 0) {
+        filename = argv[0];
+    }
+    output = fopen(filename, "w");
+    if (output == NULL) {
+        qemu_plugin_outs("Cannot open output file for writing.\n");
+        return -1;
+    }
+
+    /* Register translation block and exit callbacks */
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+
+    return 0;
+}
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C829E3B9D62
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 10:14:49 +0200 (CEST)
Received: from localhost ([::1]:46594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzEK0-0004oH-24
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 04:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1lzEIi-0002mV-2Q
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 04:13:28 -0400
Received: from zamok.crans.org ([2a0c:700:2:0:ec4:7aff:fe59:a1ad]:57818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1lzEIf-0002l6-58
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 04:13:27 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id B865EE00F3; Fri,  2 Jul 2021 10:13:20 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: "open list : All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/2] contrib/plugins: add execlog to log instruction
 execution and memory access
Date: Fri,  2 Jul 2021 10:13:06 +0200
Message-Id: <20210702081307.1653644-2-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210702081307.1653644-1-erdnaxe@crans.org>
References: <20210702081307.1653644-1-erdnaxe@crans.org>
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
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Log instruction execution and memory access to a file.
This plugin can be used for reverse engineering or for side-channel analysis
using QEMU.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS               |   1 +
 contrib/plugins/Makefile  |   1 +
 contrib/plugins/execlog.c | 153 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 155 insertions(+)
 create mode 100644 contrib/plugins/execlog.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cfbf7ef79b..709ae43864 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2978,6 +2978,7 @@ F: include/tcg/
 
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
index 0000000000..2de9f0d7d4
--- /dev/null
+++ b/contrib/plugins/execlog.c
@@ -0,0 +1,153 @@
+/*
+ * Copyright (C) 2021, Alexandre Iooss <erdnaxe@crans.org>
+ *
+ * Log instruction execution with memory access.
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
+/* Store last executed instruction on each vCPU as a GString */
+GArray *last_exec;
+
+/**
+ * Add memory read or write information to current instruction log
+ */
+static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t info,
+                     uint64_t vaddr, void *udata)
+{
+    GString *s;
+
+    /* Find vCPU in array */
+    g_assert(cpu_index < last_exec->len);
+    s = g_array_index(last_exec, GString *, cpu_index);
+
+    /* Indicate type of memory access */
+    if (qemu_plugin_mem_is_store(info)) {
+        g_string_append(s, ", store");
+    } else {
+        g_string_append(s, ", load");
+    }
+
+    /* If full system emulation log physical address and device name */
+    struct qemu_plugin_hwaddr *hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
+    if (hwaddr) {
+        uint64_t addr = qemu_plugin_hwaddr_phys_addr(hwaddr);
+        const char *name = qemu_plugin_hwaddr_device_name(hwaddr);
+        g_string_append_printf(s, ", 0x%08"PRIx64", %s", addr, name);
+    } else {
+        g_string_append_printf(s, ", 0x%08"PRIx64, vaddr);
+    }
+}
+
+/**
+ * Log instruction execution
+ */
+static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
+{
+    GString *s;
+
+    /* Find or create vCPU in array */
+    while (cpu_index >= last_exec->len) {
+        s = g_string_new(NULL);
+        g_array_append_val(last_exec, s);
+    }
+    s = g_array_index(last_exec, GString *, cpu_index);
+
+    /* Print previous instruction in cache */
+    if (s->len) {
+        qemu_plugin_outs(s->str);
+        qemu_plugin_outs("s\n");
+    }
+
+    /* Store new instruction in cache */
+    /* vcpu_mem will add memory access information to last_exec */
+    g_string_printf(s, "%u, ", cpu_index);
+    g_string_append(s, (char *)udata);
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
+    struct qemu_plugin_insn *insn;
+    uint64_t insn_vaddr;
+    uint32_t insn_opcode;
+    char *insn_disas;
+
+    size_t n = qemu_plugin_tb_n_insns(tb);
+    for (size_t i = 0; i < n; i++) {
+        /*
+         * `insn` is shared between translations in QEMU, copy needed data here.
+         * `output` is never freed as it might be used multiple times during
+         * the emulation lifetime.
+         * We only consider the first 32 bits of the instruction, this may be
+         * a limitation for CISC architectures.
+         */
+        insn = qemu_plugin_tb_get_insn(tb, i);
+        insn_vaddr = qemu_plugin_insn_vaddr(insn);
+        insn_opcode = *((uint32_t *)qemu_plugin_insn_data(insn));
+        insn_disas = qemu_plugin_insn_disas(insn);
+        char *output = g_strdup_printf("0x%"PRIx64", 0x%"PRIx32", \"%s\"",
+                                       insn_vaddr, insn_opcode, insn_disas);
+
+        /* Register callback on memory read or write */
+        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem,
+                                         QEMU_PLUGIN_CB_NO_REGS,
+                                         QEMU_PLUGIN_MEM_RW, NULL);
+
+        /* Register callback on instruction */
+        qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
+                                               QEMU_PLUGIN_CB_NO_REGS, output);
+    }
+}
+
+/**
+ * On plugin exit, print last instruction in cache
+ */
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    guint i;
+    GString *s;
+    for (i = 0; i < last_exec->len; i++) {
+        s = g_array_index(last_exec, GString *, i);
+        if (s->str) {
+            qemu_plugin_outs(s->str);
+            qemu_plugin_outs("\n");
+        }
+    }
+}
+
+/**
+ * Install the plugin
+ */
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info, int argc,
+                                           char **argv)
+{
+    /*
+     * Initialize dynamic array to cache vCPU instruction. In user mode
+     * we don't know the size before emulation.
+     */
+    last_exec = g_array_new(FALSE, FALSE, sizeof(GString *));
+
+    /* Register translation block and exit callbacks */
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+
+    return 0;
+}
-- 
2.31.1



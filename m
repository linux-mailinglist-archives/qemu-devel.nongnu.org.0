Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E584A3F3A03
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 11:47:53 +0200 (CEST)
Received: from localhost ([::1]:58664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHNbV-00088x-0g
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 05:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.hauschild@fs.ei.tum.de>)
 id 1mHNZi-0006kD-Dx
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 05:46:02 -0400
Received: from mail.fs.ei.tum.de ([2001:4ca0:22ff:10::7]:56053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.hauschild@fs.ei.tum.de>)
 id 1mHNZf-00034t-5S
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 05:46:02 -0400
Received: from Lucy.fritz.box (pc19f2504.dip0.t-ipconnect.de [193.159.37.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.fs.ei.tum.de (Postfix) with ESMTPSA id 20095118756E;
 Sat, 21 Aug 2021 11:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fs.ei.tum.de;
 s=default; t=1629539156;
 bh=Ale4YdJ/3XGyRiYreWclPMN0cqwTrntQtHuld0rV+Pw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A/fRb08ftvnF7UAolN8AY0LB39HNdG2NPOwX2Ctxawvj98KTOQH8v+EziuUQKI10C
 V9cEWtGwXOVY/f+MWsldMDxxq+AeZ8h684JmMWgth3byEu9pxSGyarnRZRnhSnNvRc
 wpSSlGJoOFprEooUKk0bQk1tY3LEng2honeMaMNM=
From: Florian Hauschild <florian.hauschild@fs.ei.tum.de>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Florian Hauschild <florian.hauschild@fs.ei.tum.de>
Subject: [RFC PATCH 1/1] QEMU plugin interface extension
Date: Sat, 21 Aug 2021 11:45:27 +0200
Message-Id: <20210821094527.491232-2-florian.hauschild@fs.ei.tum.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210821094527.491232-1-florian.hauschild@fs.ei.tum.de>
References: <20210821094527.491232-1-florian.hauschild@fs.ei.tum.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4ca0:22ff:10::7;
 envelope-from=florian.hauschild@fs.ei.tum.de; helo=mail.fs.ei.tum.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This extension covers functions:
  * to read and write guest memory
  * to read and write guest registers
  * to flush tb cache
  * to control single stepping of qemu from plugin

These changes allow the user to
  * collect more information about the behaviour of the system
  * change the guest state with a plugin during execution
  * control cache of tcg
  * allow for precise instrumentation in execution flow

Signed-off-by: Florian Hauschild <florian.hauschild@fs.ei.tum.de>
---
 include/qemu/qemu-plugin.h   |  35 ++++++++++++
 plugins/meson.build          |   1 +
 plugins/readwriteextension.c | 106 +++++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 plugins/readwriteextension.c

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index e6e815abc5..c7a0c5f379 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -577,4 +577,39 @@ int qemu_plugin_n_max_vcpus(void);
  */
 void qemu_plugin_outs(const char *string);
 
+
+/**
+ * read_reg() read a register
+ * @reg: Number of the register
+ *
+ * Returns the value of the register
+ */
+uint64_t read_reg(int reg);
+
+/**
+ * write_reg() - write to a register
+ * @reg: number of the register
+ * @val: value written to register
+ */
+void write_reg(int reg, uint64_t val);
+
+/**
+ * plugin_flush_tb() - Flush the tb cache
+ */
+void plugin_flush_tb(void);
+
+/**
+ * plugin_rw_memory_cpu() - Function to read from and write to a guest address.
+ * @address: baseaddress of the memory section
+ * @buffer: buffer managed by caller the value should be written to
+ * @buf_size: size of the buffer and memory size read/written.
+ * @write: 1 if write, 0 if read
+ */
+int plugin_rw_memory_cpu(uint64_t address, uint8_t buffer[], size_t buf_size, char write);
+
+/**
+ * plugin_single_step() - Function to change single step behaviour from the plugin.
+ */
+void plugin_single_step(int enable);
+
 #endif /* QEMU_PLUGIN_API_H */
diff --git a/plugins/meson.build b/plugins/meson.build
index e77723010e..b95cbab0b1 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -10,4 +10,5 @@ specific_ss.add(when: 'CONFIG_PLUGIN', if_true: [files(
   'loader.c',
   'core.c',
   'api.c',
+  'readwriteextension.c',
 ), declare_dependency(link_args: plugin_ldflags)])
diff --git a/plugins/readwriteextension.c b/plugins/readwriteextension.c
new file mode 100644
index 0000000000..47460c396f
--- /dev/null
+++ b/plugins/readwriteextension.c
@@ -0,0 +1,106 @@
+/**
+ * QEMU Plugin read write extension code
+ *
+ * This is the code that allows the plugin to read and write
+ * memory and registers and flush the tb cache. Also allows
+ * to set QEMU into singlestep mode from Plugin.
+ *
+ * Based on plugin interface:
+ * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
+ * Copyright (C) 2019, Linaro
+ *
+ * Copyright (C) 2021 Florian Hauschild <florian.hauschild@tum.de>
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+
+
+#include "qemu/osdep.h"
+#include "qemu/plugin.h"
+#include "hw/core/cpu.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+
+void plugin_async_flush_tb(CPUState *cpu, run_on_cpu_data arg);
+void plugin_async_flush_tb(CPUState *cpu, run_on_cpu_data arg)
+{
+    g_assert(cpu_in_exclusive_context(cpu));
+    tb_flush(cpu);
+}
+
+
+
+int plugin_rw_memory_cpu(uint64_t address, uint8_t buffer[], size_t buf_size, char write)
+{
+    return cpu_memory_rw_debug(current_cpu, address, buffer, buf_size, write);
+
+}
+
+
+void plugin_flush_tb(void)
+{
+    async_safe_run_on_cpu(current_cpu, plugin_async_flush_tb, RUN_ON_CPU_NULL);
+}
+
+static int plugin_read_register(CPUState *cpu, GByteArray *buf, int reg)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    if (reg < cc->gdb_num_core_regs) {
+        return cc->gdb_read_register(cpu, buf, reg);
+    }
+    return 0;
+}
+
+uint64_t read_reg(int reg)
+{
+    GByteArray *val = g_byte_array_new();
+    uint64_t reg_ret = 0;
+    int ret_bytes = plugin_read_register(current_cpu, val, reg);
+    if (ret_bytes == 1) {
+        reg_ret = val->data[0];
+    }
+    if (ret_bytes == 2) {
+        reg_ret = *(uint16_t *) &(val->data[0]);
+    }
+    if (ret_bytes == 4) {
+        reg_ret = *(uint32_t *) &(val->data[0]);
+    }
+    if (ret_bytes == 8) {
+        reg_ret = *(uint64_t *) &(val->data[0]);
+    }
+    return reg_ret;
+}
+
+void write_reg(int reg, uint64_t val)
+{
+    CPUState *cpu = current_cpu;
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (reg < cc->gdb_num_core_regs) {
+        cc->gdb_write_register(cpu, (uint8_t *) &val, reg);
+    }
+}
+
+void plugin_single_step(int enable)
+{
+    /* singlestep is set in softmmu/vl.c*/
+    static int orig_value;
+    static int executed = 1;
+
+    if (unlikely(executed == 1)) {
+        orig_value = singlestep;
+        executed = 2;
+    }
+
+    if (enable == 1) {
+        singlestep = 1;
+    } else {
+        singlestep = orig_value;
+    }
+
+    tb_flush(current_cpu);
+}
-- 
2.25.1



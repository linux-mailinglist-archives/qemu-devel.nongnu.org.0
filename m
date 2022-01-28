Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BEA49F244
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 05:12:05 +0100 (CET)
Received: from localhost ([::1]:37996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDIcH-0004E9-2C
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 23:12:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nDIBs-00084A-QF
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:48 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40492 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nDIBp-0002Lo-C9
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:48 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGuCMZvNhWCkFAA--.15604S15; 
 Fri, 28 Jan 2022 11:44:32 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 13/30] target/loongarch: Add gdb support.
Date: Thu, 27 Jan 2022 22:43:55 -0500
Message-Id: <20220128034412.1262452-14-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxGuCMZvNhWCkFAA--.15604S15
X-Coremail-Antispam: 1UD129KBjvAXoWfJry7ArWDZr43GF1fWF1DAwb_yoW8Jr4UCo
 WagFsxtr18C39Yy3WrAFn0qa9FqF1jyFs7ua43ur98Gan5C3yfGryqgwn0vFyrJrs3Wry5
 J3yS9a97Wrn7Xr1fn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 configs/targets/loongarch64-softmmu.mak |  1 +
 gdb-xml/loongarch-base64.xml            | 43 +++++++++++
 gdb-xml/loongarch-fpu64.xml             | 57 +++++++++++++++
 target/loongarch/cpu.c                  |  7 ++
 target/loongarch/gdbstub.c              | 97 +++++++++++++++++++++++++
 target/loongarch/internals.h            | 10 +++
 target/loongarch/meson.build            |  1 +
 7 files changed, 216 insertions(+)
 create mode 100644 configs/targets/loongarch64-softmmu.mak
 create mode 100644 gdb-xml/loongarch-base64.xml
 create mode 100644 gdb-xml/loongarch-fpu64.xml
 create mode 100644 target/loongarch/gdbstub.c

diff --git a/configs/targets/loongarch64-softmmu.mak b/configs/targets/loongarch64-softmmu.mak
new file mode 100644
index 0000000000..f33fa1590b
--- /dev/null
+++ b/configs/targets/loongarch64-softmmu.mak
@@ -0,0 +1 @@
+TARGET_XML_FILES= gdb-xml/loongarch-base64.xml gdb-xml/loongarch-fpu64.xml
diff --git a/gdb-xml/loongarch-base64.xml b/gdb-xml/loongarch-base64.xml
new file mode 100644
index 0000000000..f2af2a4b6e
--- /dev/null
+++ b/gdb-xml/loongarch-base64.xml
@@ -0,0 +1,43 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2021 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.loongarch.base">
+  <reg name="r0" bitsize="64" type="uint64" group="general"/>
+  <reg name="r1" bitsize="64" type="uint64" group="general"/>
+  <reg name="r2" bitsize="64" type="uint64" group="general"/>
+  <reg name="r3" bitsize="64" type="uint64" group="general"/>
+  <reg name="r4" bitsize="64" type="uint64" group="general"/>
+  <reg name="r5" bitsize="64" type="uint64" group="general"/>
+  <reg name="r6" bitsize="64" type="uint64" group="general"/>
+  <reg name="r7" bitsize="64" type="uint64" group="general"/>
+  <reg name="r8" bitsize="64" type="uint64" group="general"/>
+  <reg name="r9" bitsize="64" type="uint64" group="general"/>
+  <reg name="r10" bitsize="64" type="uint64" group="general"/>
+  <reg name="r11" bitsize="64" type="uint64" group="general"/>
+  <reg name="r12" bitsize="64" type="uint64" group="general"/>
+  <reg name="r13" bitsize="64" type="uint64" group="general"/>
+  <reg name="r14" bitsize="64" type="uint64" group="general"/>
+  <reg name="r15" bitsize="64" type="uint64" group="general"/>
+  <reg name="r16" bitsize="64" type="uint64" group="general"/>
+  <reg name="r17" bitsize="64" type="uint64" group="general"/>
+  <reg name="r18" bitsize="64" type="uint64" group="general"/>
+  <reg name="r19" bitsize="64" type="uint64" group="general"/>
+  <reg name="r20" bitsize="64" type="uint64" group="general"/>
+  <reg name="r21" bitsize="64" type="uint64" group="general"/>
+  <reg name="r22" bitsize="64" type="uint64" group="general"/>
+  <reg name="r23" bitsize="64" type="uint64" group="general"/>
+  <reg name="r24" bitsize="64" type="uint64" group="general"/>
+  <reg name="r25" bitsize="64" type="uint64" group="general"/>
+  <reg name="r26" bitsize="64" type="uint64" group="general"/>
+  <reg name="r27" bitsize="64" type="uint64" group="general"/>
+  <reg name="r28" bitsize="64" type="uint64" group="general"/>
+  <reg name="r29" bitsize="64" type="uint64" group="general"/>
+  <reg name="r30" bitsize="64" type="uint64" group="general"/>
+  <reg name="r31" bitsize="64" type="uint64" group="general"/>
+  <reg name="pc" bitsize="64" type="code_ptr" group="general"/>
+</feature>
diff --git a/gdb-xml/loongarch-fpu64.xml b/gdb-xml/loongarch-fpu64.xml
new file mode 100644
index 0000000000..e52cf89fbc
--- /dev/null
+++ b/gdb-xml/loongarch-fpu64.xml
@@ -0,0 +1,57 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2021 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.loongarch.fpu">
+
+  <union id="fpu64type">
+    <field name="f" type="ieee_single"/>
+    <field name="d" type="ieee_double"/>
+  </union>
+
+  <reg name="f0" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f1" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f2" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f3" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f4" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f5" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f6" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f7" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f8" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f9" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f10" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f11" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f12" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f13" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f14" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f15" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f16" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f17" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f18" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f19" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f20" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f21" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f22" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f23" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f24" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f25" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f26" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f27" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f28" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f29" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f30" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="f31" bitsize="64" type="fpu64type" group="float"/>
+  <reg name="fcc0" bitsize="8" type="uint8" group="float"/>
+  <reg name="fcc1" bitsize="8" type="uint8" group="float"/>
+  <reg name="fcc2" bitsize="8" type="uint8" group="float"/>
+  <reg name="fcc3" bitsize="8" type="uint8" group="float"/>
+  <reg name="fcc4" bitsize="8" type="uint8" group="float"/>
+  <reg name="fcc5" bitsize="8" type="uint8" group="float"/>
+  <reg name="fcc6" bitsize="8" type="uint8" group="float"/>
+  <reg name="fcc7" bitsize="8" type="uint8" group="float"/>
+  <reg name="fcsr" bitsize="32" type="uint32" group="float"/>
+</feature>
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 962d3ab803..6a31ca08e5 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -146,11 +146,18 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
                      " TLBRERA " TARGET_FMT_lx " %s exception\n", __func__,
                      env->pc, env->CSR_ERA, env->CSR_TLBRERA, name);
     }
+    if (cs->exception_index == EXCCODE_INT &&
+       (FIELD_EX64(env->CSR_DBG, CSR_DBG, DST))) {
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DEI, 1);
+        goto set_DERA;
+    }
 
     switch (cs->exception_index) {
     case EXCCODE_DBP:
         env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DCL, 1);
         env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, ECODE, 0xC);
+        goto set_DERA;
+    set_DERA:
         env->CSR_DERA = env->pc;
         env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DST, 1);
         env->pc = env->CSR_EENTRY + 0x480;
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
new file mode 100644
index 0000000000..2fec9364de
--- /dev/null
+++ b/target/loongarch/gdbstub.c
@@ -0,0 +1,97 @@
+/*
+ * LOONGARCH gdb server stub
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/gdbstub.h"
+#include "exec/helper-proto.h"
+
+int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    if (0 <= n && n < 32) {
+        return gdb_get_regl(mem_buf, env->gpr[n]);
+    } else if (n == 32) {
+        return gdb_get_regl(mem_buf, env->pc);
+    }
+    return 0;
+}
+
+int loongarch_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    target_ulong tmp = ldtul_p(mem_buf);
+
+    if (0 <= n && n < 32) {
+        return env->gpr[n] = tmp, sizeof(target_ulong);
+    } else if (n == 32) {
+        return env->pc = tmp, sizeof(target_ulong);
+    }
+    return 0;
+}
+
+static int loongarch_gdb_get_fpu(CPULoongArchState *env,
+                                 GByteArray *mem_buf, int n)
+{
+    if (0 <= n && n < 32) {
+        return gdb_get_reg64(mem_buf, env->fpr[n]);
+    } else if (32 <= n && n < 40) {
+        return gdb_get_reg8(mem_buf, env->cf[n - 32]);
+    } else if (n == 40) {
+        return gdb_get_reg32(mem_buf, env->fcsr0);
+    }
+    return 0;
+}
+
+static int loongarch_gdb_set_fpu(CPULoongArchState *env,
+                                 uint8_t *mem_buf, int n)
+{
+    if (0 <= n && n < 32) {
+        return env->fpr[n] = ldq_p(mem_buf), 8;
+    } else if (32 <= n && n < 40) {
+        return env->cf[n - 32] = ldub_p(mem_buf), 1;
+    } else if (n == 40) {
+        return env->fcsr0 = ldl_p(mem_buf), 4;
+    }
+    return 0;
+}
+
+void loongarch_cpu_register_gdb_regs_for_features(CPUState *cs)
+{
+    gdb_register_coprocessor(cs, loongarch_gdb_get_fpu, loongarch_gdb_set_fpu,
+                             41, "loongarch-fpu64.xml", 0);
+}
+
+int loongarch_read_qxfer(CPUState *cs, const char *annex, uint8_t *read_buf,
+                         unsigned long offset, unsigned long len)
+{
+    if (strncmp(annex, "cpucfg", sizeof("cpucfg") - 1) == 0) {
+        if (offset % 4 != 0 || len % 4 != 0) {
+            return 0;
+        }
+
+        size_t i;
+        for (i = offset; i < offset + len; i += 4)
+            ((uint32_t *)read_buf)[(i - offset) / 4] =
+                helper_cpucfg(&(LOONGARCH_CPU(cs)->env), i / 4);
+        return 32 * 4;
+    }
+    return 0;
+}
+
+int loongarch_write_qxfer(CPUState *cs, const char *annex,
+                          const uint8_t *write_buf, unsigned long offset,
+                          unsigned long len)
+{
+    return 0;
+}
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 92f0a9aa5b..e3fa3d951f 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -42,5 +42,15 @@ bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 hwaddr loongarch_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif
+int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n);
+int loongarch_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n);
+int loongarch_read_qxfer(CPUState *cs, const char *annex,
+                         uint8_t *read_buf,
+                         unsigned long offset, unsigned long len);
+int loongarch_write_qxfer(CPUState *cs, const char *annex,
+                          const uint8_t *write_buf,
+                          unsigned long offset, unsigned long len);
+
+void loongarch_cpu_register_gdb_regs_for_features(CPUState *cs);
 
 #endif
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 072684ca6d..4fb0c96e52 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -11,6 +11,7 @@ loongarch_tcg_ss.add(files(
   'fpu_helper.c',
   'op_helper.c',
   'translate.c',
+  'gdbstub.c',
 ))
 loongarch_tcg_ss.add(zlib)
 
-- 
2.27.0



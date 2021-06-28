Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797BF3B5E06
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:32:42 +0200 (CEST)
Received: from localhost ([::1]:37730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqRN-0005qo-3t
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq6f-0004cQ-LV
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:11:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47008 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq6d-00045Y-2x
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:11:17 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S7;
 Mon, 28 Jun 2021 20:04:47 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/20] target/loongarch: Add memory management support
Date: Mon, 28 Jun 2021 20:04:30 +0800
Message-Id: <1624881885-31692-6-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S7
X-Coremail-Antispam: 1UD129KBjvJXoWxWFWkKryrWw4rtrW7Gr17Wrg_yoWrArW5pr
 9rCryUGF48X39xZ3yfXa4FqF15ua1xGryIva1ft34Sk34aqr1jvr4vg3srXF15Cw4UJw4I
 v3WrZw1jgF1UZaDanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces one memory-management-related functions
- loongarch_cpu_tlb_fill()

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c        |   1 +
 target/loongarch/internal.h   |   9 ++++
 target/loongarch/tlb_helper.c | 109 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 target/loongarch/tlb_helper.c

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index c3ecc4b..a39a3bd 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -379,6 +379,7 @@ static struct TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_tcg_init,
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
+    .tlb_fill = loongarch_cpu_tlb_fill,
 };
 #endif /* CONFIG_TCG */
 
diff --git a/target/loongarch/internal.h b/target/loongarch/internal.h
index 09e667c..40454ee 100644
--- a/target/loongarch/internal.h
+++ b/target/loongarch/internal.h
@@ -95,4 +95,13 @@ static inline void compute_hflags(CPULoongArchState *env)
 
 const char *loongarch_exception_name(int32_t exception);
 
+/* tlb_helper.c */
+bool loongarch_cpu_tlb_fill(CPUState *cs,
+                            vaddr address,
+                            int size,
+                            MMUAccessType access_type,
+                            int mmu_idx,
+                            bool probe,
+                            uintptr_t retaddr);
+
 #endif
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
new file mode 100644
index 0000000..3889109
--- /dev/null
+++ b/target/loongarch/tlb_helper.c
@@ -0,0 +1,109 @@
+/*
+ * LoongArch tlb emulation helpers for qemu.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internal.h"
+#include "cpu-csr.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "exec/log.h"
+
+enum {
+    TLBRET_PE = -7,
+    TLBRET_XI = -6,
+    TLBRET_RI = -5,
+    TLBRET_DIRTY = -4,
+    TLBRET_INVALID = -3,
+    TLBRET_NOMATCH = -2,
+    TLBRET_BADADDR = -1,
+    TLBRET_MATCH = 0
+};
+
+static void raise_mmu_exception(CPULoongArchState *env, target_ulong address,
+                                MMUAccessType access_type, int tlb_error)
+{
+    CPUState *cs = env_cpu(env);
+    int exception = 0, error_code = 0;
+
+    if (access_type == MMU_INST_FETCH) {
+        error_code |= INST_INAVAIL;
+    }
+
+    switch (tlb_error) {
+    default:
+    case TLBRET_BADADDR:
+        exception = EXCP_ADE;
+        break;
+    case TLBRET_NOMATCH:
+        /* No TLB match for a mapped address */
+        if (access_type == MMU_DATA_STORE) {
+            exception = EXCP_TLBS;
+        } else {
+            exception = EXCP_TLBL;
+        }
+        error_code |= TLB_NOMATCH;
+        break;
+    case TLBRET_INVALID:
+        /* TLB match with no valid bit */
+        if (access_type == MMU_DATA_STORE) {
+            exception = EXCP_TLBS;
+        } else {
+            exception = EXCP_TLBL;
+        }
+        break;
+    case TLBRET_DIRTY:
+        exception = EXCP_TLBM;
+        break;
+    case TLBRET_XI:
+        /* Execute-Inhibit Exception */
+        exception = EXCP_TLBXI;
+        break;
+    case TLBRET_RI:
+        /* Read-Inhibit Exception */
+        exception = EXCP_TLBRI;
+        break;
+    case TLBRET_PE:
+        /* Privileged Exception */
+        exception = EXCP_TLBPE;
+        break;
+    }
+
+    if (env->insn_flags & INSN_LOONGARCH) {
+        if (tlb_error == TLBRET_NOMATCH) {
+            env->CSR_TLBRBADV = address;
+            env->CSR_TLBREHI = address & (TARGET_PAGE_MASK << 1);
+            cs->exception_index = exception;
+            env->error_code = error_code;
+            return;
+        }
+    }
+
+    /* Raise exception */
+    env->CSR_BADV = address;
+    cs->exception_index = exception;
+    env->error_code = error_code;
+
+    if (env->insn_flags & INSN_LOONGARCH) {
+        env->CSR_TLBEHI = address & (TARGET_PAGE_MASK << 1);
+    }
+}
+
+bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool probe, uintptr_t retaddr)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    int ret = TLBRET_BADADDR;
+
+    /* data access */
+    raise_mmu_exception(env, address, access_type, ret);
+    do_raise_exception_err(env, cs->exception_index, env->error_code, retaddr);
+}
-- 
1.8.3.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC11B3D0C22
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:13:41 +0200 (CEST)
Received: from localhost ([::1]:33290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69ES-00055y-Ls
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m691A-0001nd-QH
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:59:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51336 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m6918-0006Lz-Do
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:59:56 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0CO7vdg5VEiAA--.21107S7; 
 Wed, 21 Jul 2021 17:53:21 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/22] target/loongarch: Add memory management support
Date: Wed, 21 Jul 2021 17:53:01 +0800
Message-Id: <1626861198-6133-6-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0CO7vdg5VEiAA--.21107S7
X-Coremail-Antispam: 1UD129KBjvJXoWxWFWkKryrWw4ruF4kuw17KFg_yoWrWrWUpr
 9rZry5GF48XrZxZ3yfX34YqFn8ua1xGryIqa1ft34Sk342qr10vrWvg3srXF1rCa1UJw4I
 vF1rZr1jgF1UZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 maobibo@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces one memory-management-related functions
- loongarch_cpu_tlb_fill()

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c        |   1 +
 target/loongarch/cpu.h        |   9 ++++
 target/loongarch/tlb_helper.c | 103 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 target/loongarch/tlb_helper.c

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 8eaa778..6269dd9 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -269,6 +269,7 @@ static struct TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_tcg_init,
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
+    .tlb_fill = loongarch_cpu_tlb_fill,
 };
 #endif /* CONFIG_TCG */
 
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 1db8bb5..5c06122 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -287,4 +287,13 @@ static inline void compute_hflags(CPULoongArchState *env)
 
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
 #endif /* LOONGARCH_CPU_H */
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
new file mode 100644
index 0000000..b59a995
--- /dev/null
+++ b/target/loongarch/tlb_helper.c
@@ -0,0 +1,103 @@
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
+    if (tlb_error == TLBRET_NOMATCH) {
+        env->CSR_TLBRBADV = address;
+        env->CSR_TLBREHI = address & (TARGET_PAGE_MASK << 1);
+        cs->exception_index = exception;
+        env->error_code = error_code;
+        return;
+    }
+
+    /* Raise exception */
+    env->CSR_BADV = address;
+    cs->exception_index = exception;
+    env->error_code = error_code;
+    env->CSR_TLBEHI = address & (TARGET_PAGE_MASK << 1);
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



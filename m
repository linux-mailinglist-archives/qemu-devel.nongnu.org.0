Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD155147B8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 13:03:57 +0200 (CEST)
Received: from localhost ([::1]:58804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkOPk-0004wC-B6
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 07:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nkNep-0006Sy-HI
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:15:28 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49004 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nkNen-00042E-0n
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:15:27 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9vhuGtiZicDAA--.14518S22; 
 Fri, 29 Apr 2022 18:07:51 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/43] target/loongarch: Add basic vmstate description of
 CPU.
Date: Fri, 29 Apr 2022 18:07:06 +0800
Message-Id: <20220429100729.1572481-21-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9vhuGtiZicDAA--.14518S22
X-Coremail-Antispam: 1UD129KBjvJXoW3GryxGF45Ww1fXr1xXry5Arb_yoW7tF1Dpr
 y3uF17KFsFvrWxZw48G3s8Wrs8WF47W3WSkayakr1kGr1kJw4kWr10vw12qF1rJ34Yg342
 vr4rXasrWa1jyrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c       |  1 +
 target/loongarch/internals.h |  2 +
 target/loongarch/machine.c   | 85 ++++++++++++++++++++++++++++++++++++
 target/loongarch/meson.build |  6 +++
 4 files changed, 94 insertions(+)
 create mode 100644 target/loongarch/machine.c

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index f14724b78b..ef16779fc9 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -331,6 +331,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->class_by_name = loongarch_cpu_class_by_name;
     cc->dump_state = loongarch_cpu_dump_state;
     cc->set_pc = loongarch_cpu_set_pc;
+    dc->vmsd = &vmstate_loongarch_cpu;
     cc->disas_set_info = loongarch_cpu_disas_set_info;
 #ifdef CONFIG_TCG
     cc->tcg_ops = &loongarch_tcg_ops;
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 1a3b39e0be..39960dee27 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -25,4 +25,6 @@ const char *loongarch_exception_name(int32_t exception);
 
 void restore_fp_status(CPULoongArchState *env);
 
+extern const VMStateDescription vmstate_loongarch_cpu;
+
 #endif
diff --git a/target/loongarch/machine.c b/target/loongarch/machine.c
new file mode 100644
index 0000000000..49a06fdf28
--- /dev/null
+++ b/target/loongarch/machine.c
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch Machine State
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "migration/cpu.h"
+
+/* LoongArch CPU state */
+
+const VMStateDescription vmstate_loongarch_cpu = {
+    .name = "cpu",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+
+        VMSTATE_UINTTL_ARRAY(env.gpr, LoongArchCPU, 32),
+        VMSTATE_UINTTL(env.pc, LoongArchCPU),
+        VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
+        VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
+        VMSTATE_BOOL_ARRAY(env.cf, LoongArchCPU, 8),
+
+        /* Remaining CSRs */
+        VMSTATE_UINT64(env.CSR_CRMD, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PRMD, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_EUEN, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MISC, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_ECFG, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_ESTAT, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_ERA, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_BADV, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_BADI, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_EENTRY, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBIDX, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBEHI, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBELO0, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBELO1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_ASID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PGDL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PGDH, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PGD, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PWCL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PWCH, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_STLBPS, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_RVACFG, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PRCFG1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PRCFG2, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PRCFG3, LoongArchCPU),
+        VMSTATE_UINT64_ARRAY(env.CSR_SAVE, LoongArchCPU, 16),
+        VMSTATE_UINT64(env.CSR_TID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TCFG, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TVAL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_CNTC, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TICLR, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_LLBCTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IMPCTL1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IMPCTL2, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBRENTRY, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBRBADV, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBRERA, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBRSAVE, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBRELO0, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBRELO1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBREHI, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TLBRPRMD, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRCTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRINFO1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRINFO2, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRENTRY, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRERA, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRSAVE, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_CTAG, LoongArchCPU),
+        VMSTATE_UINT64_ARRAY(env.CSR_DMW, LoongArchCPU, 4),
+
+        /* Debug CSRs */
+        VMSTATE_UINT64(env.CSR_DBG, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DERA, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DSAVE, LoongArchCPU),
+
+        VMSTATE_END_OF_LIST()
+    },
+};
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index bcb076e55f..103f36ee15 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -14,6 +14,12 @@ loongarch_tcg_ss.add(files(
 ))
 loongarch_tcg_ss.add(zlib)
 
+loongarch_softmmu_ss = ss.source_set()
+loongarch_softmmu_ss.add(files(
+  'machine.c',
+))
+
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
 
 target_arch += {'loongarch': loongarch_ss}
+target_softmmu_arch += {'loongarch': loongarch_softmmu_ss}
-- 
2.31.1



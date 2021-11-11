Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C621A44CF13
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:38:24 +0100 (CET)
Received: from localhost ([::1]:58842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkz2l-000875-Vc
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:38:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0A-0005Yo-SF
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:42 -0500
Received: from mail.loongson.cn ([114.242.206.163]:53910 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz07-0001gE-U7
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:42 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S5;
 Thu, 11 Nov 2021 09:35:36 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 03/30] target/loongarch: Add basic vmstate description
 of CPU.
Date: Thu, 11 Nov 2021 09:35:01 +0800
Message-Id: <1636594528-8175-4-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Cw13ZF1fuw4ktr17Jw1rXrb_yoWDXFWfpr
 y3uF17tFZFvrWxZw48G3s8Wrs8GF4jg3WSkayYkr1kGr1kJw4DWr10vw1UXr1rJ34Yg342
 yr4FqasrW3WjyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces vmstate_loongarch_cpu

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c       |   4 +
 target/loongarch/internals.h |   4 +
 target/loongarch/machine.c   | 154 +++++++++++++++++++++++++++++++++++
 target/loongarch/meson.build |   6 ++
 4 files changed, 168 insertions(+)
 create mode 100644 target/loongarch/machine.c

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 01a17d8221..a53c8ebfb5 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -12,6 +12,7 @@
 #include "sysemu/qtest.h"
 #include "exec/exec-all.h"
 #include "qapi/qapi-commands-machine-target.h"
+#include "migration/vmstate.h"
 #include "cpu.h"
 #include "internals.h"
 #include "fpu/softfloat-helpers.h"
@@ -297,6 +298,9 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->has_work = loongarch_cpu_has_work;
     cc->dump_state = loongarch_cpu_dump_state;
     cc->set_pc = loongarch_cpu_set_pc;
+#ifndef CONFIG_USER_ONLY
+    dc->vmsd = &vmstate_loongarch_cpu;
+#endif
     cc->disas_set_info = loongarch_cpu_disas_set_info;
 #ifdef CONFIG_TCG
     cc->tcg_ops = &loongarch_tcg_ops;
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index e9e63742c4..49ed6829d7 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -25,4 +25,8 @@ const char *loongarch_exception_name(int32_t exception);
 
 void restore_fp_status(CPULoongArchState *env);
 
+#ifndef CONFIG_USER_ONLY
+extern const VMStateDescription vmstate_loongarch_cpu;
+#endif
+
 #endif
diff --git a/target/loongarch/machine.c b/target/loongarch/machine.c
new file mode 100644
index 0000000000..b628374814
--- /dev/null
+++ b/target/loongarch/machine.c
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch machine State
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
+
+        /* Remaining CSR registers */
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
+        VMSTATE_UINT64(env.CSR_CPUID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PRCFG1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PRCFG2, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PRCFG3, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_SAVE0, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_SAVE1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_SAVE2, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_SAVE3, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_SAVE4, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_SAVE5, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_SAVE6, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_SAVE7, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TMID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TCFG, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TVAL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_CNTC, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_TINTCLR, LoongArchCPU),
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
+        VMSTATE_UINT64(env.CSR_MERRINFO, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRINFO1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRENT, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRERA, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MERRSAVE, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_CTAG, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DMWIN0, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DMWIN1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DMWIN2, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DMWIN3, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PERFCTRL0, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PERFCNTR0, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PERFCTRL1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PERFCNTR1, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PERFCTRL2, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PERFCNTR2, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PERFCTRL3, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_PERFCNTR3, LoongArchCPU),
+        /* debug */
+        VMSTATE_UINT64(env.CSR_MWPC, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_MWPS, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB0ADDR, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB0MASK, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB0CTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB0ASID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB1ADDR, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB1MASK, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB1CTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB1ASID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB2ADDR, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB2MASK, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB2CTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB2ASID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB3ADDR, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB3MASK, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB3CTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DB3ASID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_FWPC, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_FWPS, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB0ADDR, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB0MASK, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB0CTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB0ASID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB1ADDR, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB1MASK, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB1CTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB1ASID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB2ADDR, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB2MASK, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB2CTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB2ASID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB3ADDR, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB3MASK, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB3CTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB3ASID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB4ADDR, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB4MASK, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB4CTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB4ASID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB5ADDR, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB5MASK, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB5CTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB5ASID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB6ADDR, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB6MASK, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB6CTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB6ASID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB7ADDR, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB7MASK, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB7CTL, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_IB7ASID, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DBG, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DERA, LoongArchCPU),
+        VMSTATE_UINT64(env.CSR_DESAVE, LoongArchCPU),
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
2.27.0



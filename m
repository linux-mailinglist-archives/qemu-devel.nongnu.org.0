Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5123433007
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:47:06 +0200 (CEST)
Received: from localhost ([::1]:33798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjpw-0004Wf-P3
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mcjex-0001GQ-4t
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:43 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34692 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mcjes-0004OH-DQ
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:42 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2s1dW5h3HwcAA--.43474S5; 
 Tue, 19 Oct 2021 15:35:26 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/31] target/loongarch: Set default csr values.
Date: Tue, 19 Oct 2021 15:34:49 +0800
Message-Id: <1634628917-10031-4-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9DxP2s1dW5h3HwcAA--.43474S5
X-Coremail-Antispam: 1UD129KBjvJXoWxGry5Gr1fXFyrZFy8Gw13CFg_yoW5Xw4xpr
 9rur90yr4xtrsrA3s3Aas8Wrn8Zw4xC34Iva9Ikw1vkFW7Xr1fXFWkt397GF9rA34rAFWI
 9Fn7AayUWF4DZ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 gaosong@loongson.cn, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set default csr values Mainly used for
cpu_initfn and cpu_reset.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c | 40 ++++++++++++++++++++++++++++++++++++++++
 target/loongarch/cpu.h |  6 ++++++
 2 files changed, 46 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index e9f67cf976..57f9264c1f 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -106,6 +106,40 @@ static void set_loongarch_cpucfg(CPULoongArchState *env)
     env->cpucfg[20] = 0x60f000f;
 }
 
+#ifndef CONFIG_USER_ONLY
+static void set_loongarch_csr(CPULoongArchState *env)
+{
+    uint64_t t;
+
+    t = FIELD_DP64(0, CSR_PRCFG1, SAVE_NUM, 8);
+    t = FIELD_DP64(t, CSR_PRCFG1, TIMER_BITS, 0x2f);
+    t = FIELD_DP64(t, CSR_PRCFG1, VSMAX, 0x7);
+    env->CSR_PRCFG1 = t;
+
+    env->CSR_PRCFG2 = 0x3ffff000;
+
+    t = FIELD_DP64(0, CSR_PRCFG3, TLB_TYPE, 2);
+    t = FIELD_DP64(t, CSR_PRCFG3, MTLB_ENTRY, 0x3f);
+    t = FIELD_DP64(t, CSR_PRCFG3, STLB_WAYS, 0x7);
+    t = FIELD_DP64(t, CSR_PRCFG3, STLB_SETS, 0x8);
+    env->CSR_PRCFG3 = t;
+
+    t = FIELD_DP64(0, CSR_CRMD, PLV, 0);
+    t = FIELD_DP64(t, CSR_CRMD, IE, 0);
+    t = FIELD_DP64(t, CSR_CRMD, DA, 1);
+    t = FIELD_DP64(t, CSR_CRMD, PG, 0);
+    t = FIELD_DP64(t, CSR_CRMD, DATF, 1);
+    t = FIELD_DP64(t, CSR_CRMD, DATM, 1);
+    env->CSR_CRMD = t;
+
+    env->CSR_ECFG = FIELD_DP64(0, CSR_ECFG, VS, 7);
+    env->CSR_STLBPS  = 0xe;
+    env->CSR_RVACFG = 0x0;
+    env->CSR_ASID = 0xa0000;
+    env->CSR_ERA = env->pc;
+}
+#endif
+
 /* LoongArch CPU definitions */
 static void loongarch_3a5000_initfn(Object *obj)
 {
@@ -113,6 +147,9 @@ static void loongarch_3a5000_initfn(Object *obj)
     CPULoongArchState *env = &cpu->env;
 
     set_loongarch_cpucfg(env);
+#ifndef CONFIG_USER_ONLY
+    set_loongarch_csr(env);
+#endif
 }
 
 static void loongarch_cpu_list_entry(gpointer data, gpointer user_data)
@@ -140,6 +177,9 @@ static void loongarch_cpu_reset(DeviceState *dev)
     lacc->parent_reset(dev);
 
     set_loongarch_cpucfg(env);
+#ifndef CONFIG_USER_ONLY
+    set_loongarch_csr(env);
+#endif
     env->fcsr0_mask = 0x1f1f031f;
     env->fcsr0 = 0x0;
 
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index a4991f9481..5aa0c75ad9 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -12,6 +12,7 @@
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
 #include "hw/registerfields.h"
+#include "cpu-csr.h"
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
@@ -68,6 +69,11 @@ struct CPULoongArchState {
     uint64_t llval;
 
     uint64_t badaddr;
+
+#ifndef CONFIG_USER_ONLY
+    /* LoongArch CSR registers */
+    CPU_LOONGARCH_CSR
+#endif
 };
 
 /**
-- 
2.27.0



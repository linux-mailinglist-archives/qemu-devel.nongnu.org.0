Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2749358A50E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 05:37:36 +0200 (CEST)
Received: from localhost ([::1]:35526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJo9W-0004WW-UM
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 23:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oJo7b-0000H1-QM
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:35:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49490 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oJo7Z-00029y-Lz
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:35:35 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxSs37j+xiQD4HAA--.15649S7; 
 Fri, 05 Aug 2022 11:35:31 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 gaosong@loongson.cn, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
Subject: [PATCH for-7.1 v2 5/5] target/loongarch: Update gdb_set_fpu() and
 gdb_get_fpu()
Date: Fri,  5 Aug 2022 11:35:23 +0800
Message-Id: <20220805033523.1416837-6-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220805033523.1416837-1-gaosong@loongson.cn>
References: <20220805033523.1416837-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxSs37j+xiQD4HAA--.15649S7
X-Coremail-Antispam: 1UD129KBjvJXoWxAFyDtr4UZF1fuw47tF17GFg_yoWrAr4kpr
 yfCr43AF10gFZrZas3J3s8WFn8Cr1xGrWa9F1fG34FkF4UXFn8Za4vg392qF48A3yvgF4f
 ZF4Fy3W5uFyxXrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB LoongArch fpu use fcc register,  update gdb_set_fpu() and gdb_get_fpu() to match it.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 linux-user/loongarch64/signal.c | 24 ++---------------------
 target/loongarch/gdbstub.c      | 34 ++++++++++++++++++++++++++-------
 target/loongarch/internals.h    |  3 +++
 3 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/linux-user/loongarch64/signal.c b/linux-user/loongarch64/signal.c
index 65fd5f3857..7c7afb652e 100644
--- a/linux-user/loongarch64/signal.c
+++ b/linux-user/loongarch64/signal.c
@@ -71,26 +71,6 @@ struct extctx_layout {
     struct ctx_layout end;
 };
 
-/* The kernel's sc_save_fcc macro is a sequence of MOVCF2GR+BSTRINS. */
-static uint64_t read_all_fcc(CPULoongArchState *env)
-{
-    uint64_t ret = 0;
-
-    for (int i = 0; i < 8; ++i) {
-        ret |= (uint64_t)env->cf[i] << (i * 8);
-    }
-
-    return ret;
-}
-
-/* The kernel's sc_restore_fcc macro is a sequence of BSTRPICK+MOVGR2CF. */
-static void write_all_fcc(CPULoongArchState *env, uint64_t val)
-{
-    for (int i = 0; i < 8; ++i) {
-        env->cf[i] = (val >> (i * 8)) & 1;
-    }
-}
-
 static abi_ptr extframe_alloc(struct extctx_layout *extctx,
                               struct ctx_layout *sctx, unsigned size,
                               unsigned align, abi_ptr orig_sp)
@@ -150,7 +130,7 @@ static void setup_sigframe(CPULoongArchState *env,
     for (i = 0; i < 32; ++i) {
         __put_user(env->fpr[i], &fpu_ctx->regs[i]);
     }
-    __put_user(read_all_fcc(env), &fpu_ctx->fcc);
+    __put_user(read_fcc(env), &fpu_ctx->fcc);
     __put_user(env->fcsr0, &fpu_ctx->fcsr);
 
     /*
@@ -216,7 +196,7 @@ static void restore_sigframe(CPULoongArchState *env,
             __get_user(env->fpr[i], &fpu_ctx->regs[i]);
         }
         __get_user(fcc, &fpu_ctx->fcc);
-        write_all_fcc(env, fcc);
+        write_fcc(env, fcc);
         __get_user(env->fcsr0, &fpu_ctx->fcsr);
         restore_fp_status(env);
     }
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index d3a5e404b0..a4d1e28e36 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -11,6 +11,24 @@
 #include "internals.h"
 #include "exec/gdbstub.h"
 
+uint64_t read_fcc(CPULoongArchState *env)
+{
+    uint64_t ret = 0;
+
+    for (int i = 0; i < 8; ++i) {
+        ret |= (uint64_t)env->cf[i] << (i * 8);
+    }
+
+    return ret;
+}
+
+void write_fcc(CPULoongArchState *env, uint64_t val)
+{
+    for (int i = 0; i < 8; ++i) {
+        env->cf[i] = (val >> (i * 8)) & 1;
+    }
+}
+
 int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
@@ -51,9 +69,10 @@ static int loongarch_gdb_get_fpu(CPULoongArchState *env,
 {
     if (0 <= n && n < 32) {
         return gdb_get_reg64(mem_buf, env->fpr[n]);
-    } else if (32 <= n && n < 40) {
-        return gdb_get_reg8(mem_buf, env->cf[n - 32]);
-    } else if (n == 40) {
+    } else if (n == 32) {
+        uint64_t val = read_fcc(env);
+        return gdb_get_reg64(mem_buf, val);
+    } else if (n == 33) {
         return gdb_get_reg32(mem_buf, env->fcsr0);
     }
     return 0;
@@ -67,10 +86,11 @@ static int loongarch_gdb_set_fpu(CPULoongArchState *env,
     if (0 <= n && n < 32) {
         env->fpr[n] = ldq_p(mem_buf);
         length = 8;
-    } else if (32 <= n && n < 40) {
-        env->cf[n - 32] = ldub_p(mem_buf);
-        length = 1;
-    } else if (n == 40) {
+    } else if (n == 32) {
+        uint64_t val = ldq_p(mem_buf);
+        write_fcc(env, val);
+        length = 8;
+    } else if (n == 33) {
         env->fcsr0 = ldl_p(mem_buf);
         length = 4;
     }
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index ea227362b6..f01635aed6 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -51,6 +51,9 @@ bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 hwaddr loongarch_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif /* !CONFIG_USER_ONLY */
 
+uint64_t read_fcc(CPULoongArchState *env);
+void write_fcc(CPULoongArchState *env, uint64_t val);
+
 int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n);
 int loongarch_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n);
 void loongarch_cpu_register_gdb_regs_for_features(CPUState *cs);
-- 
2.31.1



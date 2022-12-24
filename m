Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168BA655951
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:33:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zil-0006L2-FN; Sat, 24 Dec 2022 03:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zi5-00068H-Ro
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:03 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zhy-0000G6-JF
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:16:49 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxI_BitaZjB0kIAA--.18955S3;
 Sat, 24 Dec 2022 16:16:34 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S3; 
 Sat, 24 Dec 2022 16:16:34 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 01/43] target/loongarch: Add vector data type vec_t
Date: Sat, 24 Dec 2022 16:15:51 +0800
Message-Id: <20221224081633.4185445-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAFyDCr17GF1UXrykXFyxKrg_yoWrGFy3pr
 WfuFn8tFW8GFZrAas3J345Wrn8Wr1xGFWa9a1fG34rCF48Xr9rua4kt392qF1kA340gr1F
 vF4Fvw15WF4rXrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 linux-user/loongarch64/signal.c |  4 ++--
 target/loongarch/cpu.c          |  2 +-
 target/loongarch/cpu.h          | 18 +++++++++++++++++-
 target/loongarch/gdbstub.c      |  4 ++--
 target/loongarch/machine.c      |  2 +-
 5 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/linux-user/loongarch64/signal.c b/linux-user/loongarch64/signal.c
index 7c7afb652e..40dba974d0 100644
--- a/linux-user/loongarch64/signal.c
+++ b/linux-user/loongarch64/signal.c
@@ -128,7 +128,7 @@ static void setup_sigframe(CPULoongArchState *env,
 
     fpu_ctx = (struct target_fpu_context *)(info + 1);
     for (i = 0; i < 32; ++i) {
-        __put_user(env->fpr[i], &fpu_ctx->regs[i]);
+        __put_user(env->fpr[i].d, &fpu_ctx->regs[i]);
     }
     __put_user(read_fcc(env), &fpu_ctx->fcc);
     __put_user(env->fcsr0, &fpu_ctx->fcsr);
@@ -193,7 +193,7 @@ static void restore_sigframe(CPULoongArchState *env,
         uint64_t fcc;
 
         for (i = 0; i < 32; ++i) {
-            __get_user(env->fpr[i], &fpu_ctx->regs[i]);
+            __get_user(env->fpr[i].d, &fpu_ctx->regs[i]);
         }
         __get_user(fcc, &fpu_ctx->fcc);
         write_fcc(env, fcc);
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 290ab4d526..59ae29a3b4 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -653,7 +653,7 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     /* fpr */
     if (flags & CPU_DUMP_FPU) {
         for (i = 0; i < 32; i++) {
-            qemu_fprintf(f, " %s %016" PRIx64, fregnames[i], env->fpr[i]);
+            qemu_fprintf(f, " %s %016" PRIx64, fregnames[i], env->fpr[i].d);
             if ((i & 3) == 3) {
                 qemu_fprintf(f, "\n");
             }
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index e35cf65597..d37df63bde 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -239,6 +239,22 @@ FIELD(TLB_MISC, ASID, 1, 10)
 FIELD(TLB_MISC, VPPN, 13, 35)
 FIELD(TLB_MISC, PS, 48, 6)
 
+#define LSX_LEN   (128)
+typedef union vec_t vec_t;
+union vec_t {
+    int8_t   B[LSX_LEN / 8];
+    int16_t  H[LSX_LEN / 16];
+    int32_t  W[LSX_LEN / 32];
+    int64_t  D[LSX_LEN / 64];
+    __int128 Q[LSX_LEN / 128];
+};
+
+typedef union fpr_t fpr_t;
+union fpr_t {
+    uint64_t d;
+    vec_t vec;
+};
+
 struct LoongArchTLB {
     uint64_t tlb_misc;
     /* Fields corresponding to CSR_TLBELO0/1 */
@@ -251,7 +267,7 @@ typedef struct CPUArchState {
     uint64_t gpr[32];
     uint64_t pc;
 
-    uint64_t fpr[32];
+    fpr_t fpr[32];
     float_status fp_status;
     bool cf[8];
 
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index a4d1e28e36..18cba6f8f3 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -68,7 +68,7 @@ static int loongarch_gdb_get_fpu(CPULoongArchState *env,
                                  GByteArray *mem_buf, int n)
 {
     if (0 <= n && n < 32) {
-        return gdb_get_reg64(mem_buf, env->fpr[n]);
+        return gdb_get_reg64(mem_buf, env->fpr[n].d);
     } else if (n == 32) {
         uint64_t val = read_fcc(env);
         return gdb_get_reg64(mem_buf, val);
@@ -84,7 +84,7 @@ static int loongarch_gdb_set_fpu(CPULoongArchState *env,
     int length = 0;
 
     if (0 <= n && n < 32) {
-        env->fpr[n] = ldq_p(mem_buf);
+        env->fpr[n].d = ldq_p(mem_buf);
         length = 8;
     } else if (n == 32) {
         uint64_t val = ldq_p(mem_buf);
diff --git a/target/loongarch/machine.c b/target/loongarch/machine.c
index b1e523ea72..b3598cce3f 100644
--- a/target/loongarch/machine.c
+++ b/target/loongarch/machine.c
@@ -33,7 +33,7 @@ const VMStateDescription vmstate_loongarch_cpu = {
 
         VMSTATE_UINTTL_ARRAY(env.gpr, LoongArchCPU, 32),
         VMSTATE_UINTTL(env.pc, LoongArchCPU),
-        VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
+        VMSTATE_UINT64_ARRAY(env.fpr.d, LoongArchCPU, 32),
         VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
         VMSTATE_BOOL_ARRAY(env.cf, LoongArchCPU, 8),
 
-- 
2.31.1



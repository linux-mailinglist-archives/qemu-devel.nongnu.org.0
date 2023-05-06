Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243516F8F41
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 08:38:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvBWZ-0005hb-TV; Sat, 06 May 2023 02:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pvBWQ-0005g8-7D
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:35:59 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pvBWL-0004Ax-SV
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:35:57 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Dxi+pC9VVkuKQFAA--.9350S3;
 Sat, 06 May 2023 14:35:46 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxDbM89VVkhCNNAA--.9773S3; 
 Sat, 06 May 2023 14:35:45 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL v2 01/45] target/loongarch: Add LSX data type VReg
Date: Sat,  6 May 2023 14:34:56 +0800
Message-Id: <20230506063540.178794-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230506063540.178794-1-gaosong@loongson.cn>
References: <20230506063540.178794-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxDbM89VVkhCNNAA--.9773S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKFWxKF4kCrWfCrWkXr15CFg_yoW3GF4rpr
 9xuFy7KFyUKFZ7Aw1fG345WFs8Wr1xGF429a1xC34FkF47JrZ8urykt392qFn5Aa4rWr1Y
 9F10v345WF4xZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-2-gaosong@loongson.cn>
---
 linux-user/loongarch64/signal.c |  4 +-
 target/loongarch/cpu.c          |  2 +-
 target/loongarch/cpu.h          | 21 ++++++++-
 target/loongarch/gdbstub.c      |  4 +-
 target/loongarch/internals.h    | 22 +++++++++
 target/loongarch/machine.c      | 79 ++++++++++++++++++++++++++++++---
 6 files changed, 119 insertions(+), 13 deletions(-)

diff --git a/linux-user/loongarch64/signal.c b/linux-user/loongarch64/signal.c
index 7c7afb652e..bb8efb1172 100644
--- a/linux-user/loongarch64/signal.c
+++ b/linux-user/loongarch64/signal.c
@@ -128,7 +128,7 @@ static void setup_sigframe(CPULoongArchState *env,
 
     fpu_ctx = (struct target_fpu_context *)(info + 1);
     for (i = 0; i < 32; ++i) {
-        __put_user(env->fpr[i], &fpu_ctx->regs[i]);
+        __put_user(env->fpr[i].vreg.D(0), &fpu_ctx->regs[i]);
     }
     __put_user(read_fcc(env), &fpu_ctx->fcc);
     __put_user(env->fcsr0, &fpu_ctx->fcsr);
@@ -193,7 +193,7 @@ static void restore_sigframe(CPULoongArchState *env,
         uint64_t fcc;
 
         for (i = 0; i < 32; ++i) {
-            __get_user(env->fpr[i], &fpu_ctx->regs[i]);
+            __get_user(env->fpr[i].vreg.D(0), &fpu_ctx->regs[i]);
         }
         __get_user(fcc, &fpu_ctx->fcc);
         write_fcc(env, fcc);
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 97e6579f6a..18b41221a6 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -656,7 +656,7 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     /* fpr */
     if (flags & CPU_DUMP_FPU) {
         for (i = 0; i < 32; i++) {
-            qemu_fprintf(f, " %s %016" PRIx64, fregnames[i], env->fpr[i]);
+            qemu_fprintf(f, " %s %016" PRIx64, fregnames[i], env->fpr[i].vreg.D(0));
             if ((i & 3) == 3) {
                 qemu_fprintf(f, "\n");
             }
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index e11c875188..fd0f61936d 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -8,6 +8,7 @@
 #ifndef LOONGARCH_CPU_H
 #define LOONGARCH_CPU_H
 
+#include "qemu/int128.h"
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
 #include "hw/registerfields.h"
@@ -241,6 +242,24 @@ FIELD(TLB_MISC, ASID, 1, 10)
 FIELD(TLB_MISC, VPPN, 13, 35)
 FIELD(TLB_MISC, PS, 48, 6)
 
+#define LSX_LEN   (128)
+typedef union VReg {
+    int8_t   B[LSX_LEN / 8];
+    int16_t  H[LSX_LEN / 16];
+    int32_t  W[LSX_LEN / 32];
+    int64_t  D[LSX_LEN / 64];
+    uint8_t  UB[LSX_LEN / 8];
+    uint16_t UH[LSX_LEN / 16];
+    uint32_t UW[LSX_LEN / 32];
+    uint64_t UD[LSX_LEN / 64];
+    Int128   Q[LSX_LEN / 128];
+}VReg;
+
+typedef union fpr_t fpr_t;
+union fpr_t {
+    VReg  vreg;
+};
+
 struct LoongArchTLB {
     uint64_t tlb_misc;
     /* Fields corresponding to CSR_TLBELO0/1 */
@@ -253,7 +272,7 @@ typedef struct CPUArchState {
     uint64_t gpr[32];
     uint64_t pc;
 
-    uint64_t fpr[32];
+    fpr_t fpr[32];
     float_status fp_status;
     bool cf[8];
 
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index fa3e034d15..0752fff924 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -69,7 +69,7 @@ static int loongarch_gdb_get_fpu(CPULoongArchState *env,
                                  GByteArray *mem_buf, int n)
 {
     if (0 <= n && n < 32) {
-        return gdb_get_reg64(mem_buf, env->fpr[n]);
+        return gdb_get_reg64(mem_buf, env->fpr[n].vreg.D(0));
     } else if (n == 32) {
         uint64_t val = read_fcc(env);
         return gdb_get_reg64(mem_buf, val);
@@ -85,7 +85,7 @@ static int loongarch_gdb_set_fpu(CPULoongArchState *env,
     int length = 0;
 
     if (0 <= n && n < 32) {
-        env->fpr[n] = ldq_p(mem_buf);
+        env->fpr[n].vreg.D(0) = ldq_p(mem_buf);
         length = 8;
     } else if (n == 32) {
         uint64_t val = ldq_p(mem_buf);
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index f01635aed6..4c5752fc01 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -21,6 +21,28 @@
 /* Global bit for huge page */
 #define LOONGARCH_HGLOBAL_SHIFT     12
 
+#if  HOST_BIG_ENDIAN
+#define B(x)  B[15 - (x)]
+#define H(x)  H[7 - (x)]
+#define W(x)  W[3 - (x)]
+#define D(x)  D[1 - (x)]
+#define UB(x) UB[15 - (x)]
+#define UH(x) UH[7 - (x)]
+#define UW(x) UW[3 - (x)]
+#define UD(x) UD[1 -(x)]
+#define Q(x)  Q[x]
+#else
+#define B(x)  B[x]
+#define H(x)  H[x]
+#define W(x)  W[x]
+#define D(x)  D[x]
+#define UB(x) UB[x]
+#define UH(x) UH[x]
+#define UW(x) UW[x]
+#define UD(x) UD[x]
+#define Q(x)  Q[x]
+#endif
+
 void loongarch_translate_init(void);
 
 void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
diff --git a/target/loongarch/machine.c b/target/loongarch/machine.c
index b1e523ea72..7adc1bdff9 100644
--- a/target/loongarch/machine.c
+++ b/target/loongarch/machine.c
@@ -10,6 +10,72 @@
 #include "migration/cpu.h"
 #include "internals.h"
 
+static const VMStateDescription vmstate_fpu_reg = {
+    .name = "fpu_reg",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(UD(0), VReg),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+#define VMSTATE_FPU_REGS(_field, _state, _start)            \
+    VMSTATE_STRUCT_SUB_ARRAY(_field, _state, _start, 32, 0, \
+                             vmstate_fpu_reg, fpr_t)
+
+static bool fpu_needed(void *opaque)
+{
+    LoongArchCPU *cpu = opaque;
+
+    return FIELD_EX64(cpu->env.cpucfg[2], CPUCFG2, FP);
+}
+
+static const VMStateDescription vmstate_fpu = {
+    .name = "cpu/fpu",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = fpu_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_FPU_REGS(env.fpr, LoongArchCPU, 0),
+        VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
+        VMSTATE_BOOL_ARRAY(env.cf, LoongArchCPU, 8),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static const VMStateDescription vmstate_lsxh_reg = {
+    .name = "lsxh_reg",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(UD(1), VReg),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+#define VMSTATE_LSXH_REGS(_field, _state, _start)           \
+    VMSTATE_STRUCT_SUB_ARRAY(_field, _state, _start, 32, 0, \
+                             vmstate_lsxh_reg, fpr_t)
+
+static bool lsx_needed(void *opaque)
+{
+    LoongArchCPU *cpu = opaque;
+
+    return FIELD_EX64(cpu->env.cpucfg[2], CPUCFG2, LSX);
+}
+
+static const VMStateDescription vmstate_lsx = {
+    .name = "cpu/lsx",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = lsx_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_LSXH_REGS(env.fpr, LoongArchCPU, 0),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 /* TLB state */
 const VMStateDescription vmstate_tlb = {
     .name = "cpu/tlb",
@@ -24,18 +90,13 @@ const VMStateDescription vmstate_tlb = {
 };
 
 /* LoongArch CPU state */
-
 const VMStateDescription vmstate_loongarch_cpu = {
     .name = "cpu",
-    .version_id = 0,
-    .minimum_version_id = 0,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-
         VMSTATE_UINTTL_ARRAY(env.gpr, LoongArchCPU, 32),
         VMSTATE_UINTTL(env.pc, LoongArchCPU),
-        VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
-        VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
-        VMSTATE_BOOL_ARRAY(env.cf, LoongArchCPU, 8),
 
         /* Remaining CSRs */
         VMSTATE_UINT64(env.CSR_CRMD, LoongArchCPU),
@@ -99,4 +160,8 @@ const VMStateDescription vmstate_loongarch_cpu = {
 
         VMSTATE_END_OF_LIST()
     },
+    .subsections = (const VMStateDescription*[]) {
+        &vmstate_fpu,
+        &vmstate_lsx,
+    }
 };
-- 
2.31.1



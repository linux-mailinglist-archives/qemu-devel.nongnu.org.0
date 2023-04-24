Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55E86E8C2B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:07:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPKB-0003sY-5R; Thu, 20 Apr 2023 04:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1ppPK6-0003fe-HD
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:07:22 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1ppPK2-00080J-BI
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:07:22 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxIk6w8kBkPmUfAA--.48742S3;
 Thu, 20 Apr 2023 16:07:12 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxur2u8kBkdNUwAA--.59556S3; 
 Thu, 20 Apr 2023 16:07:12 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [RFC PATCH v3 01/44] target/loongarch: Add LSX data type VReg
Date: Thu, 20 Apr 2023 16:06:26 +0800
Message-Id: <20230420080709.3352575-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230420080709.3352575-1-gaosong@loongson.cn>
References: <20230420080709.3352575-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxur2u8kBkdNUwAA--.59556S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKFWxKFyrZw47Kr1fXr15CFg_yoW3CF4Upr
 ZxuFyUKFyUKrZ7Cw1fGa45WFs8Wr4xGF4a9ayxG340kF4UJrZ8urZ5t392qFn3Aa4rWrya
 vF4UJ345WF47ZrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b08Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xAC
 xx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx2
 6rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
 14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 linux-user/loongarch64/signal.c |   4 +-
 target/loongarch/cpu.c          |   2 +-
 target/loongarch/cpu.h          |  21 +++++-
 target/loongarch/gdbstub.c      |   4 +-
 target/loongarch/internals.h    |  22 ++++++
 target/loongarch/machine.c      | 115 ++++++++++++++++++++++++++++++--
 6 files changed, 157 insertions(+), 11 deletions(-)

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
index b1e523ea72..a67b735a32 100644
--- a/target/loongarch/machine.c
+++ b/target/loongarch/machine.c
@@ -10,6 +10,112 @@
 #include "migration/cpu.h"
 #include "internals.h"
 
+/* FPU state */
+static int get_fpr(QEMUFile *f, void *pv, size_t size,
+                   const VMStateField *field)
+{
+    fpr_t *v = pv;
+
+    qemu_get_sbe64s(f, &v->vreg.D(0));
+    return 0;
+}
+
+static int put_fpr(QEMUFile *f, void *pv, size_t size,
+                   const VMStateField *field, JSONWriter *vmdesc)
+{
+    fpr_t *v = pv;
+
+    qemu_put_sbe64s(f, &v->vreg.D(0));
+    return 0;
+}
+
+static const VMStateInfo vmstate_info_fpr = {
+    .name = "fpr",
+    .get  = get_fpr,
+    .put  = put_fpr,
+};
+
+#define VMSTATE_FPR_ARRAY_V(_f, _s, _n, _v)                       \
+    VMSTATE_SUB_ARRAY(_f, _s, 0, _n, _v, vmstate_info_fpr, fpr_t)
+
+#define VMSTATE_FPR_ARRAY(_f, _s, _n)                             \
+    VMSTATE_FPR_ARRAY_V(_f, _s, _n, 0)
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
+        VMSTATE_FPR_ARRAY(env.fpr, LoongArchCPU, 32),
+        VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
+        VMSTATE_BOOL_ARRAY(env.cf, LoongArchCPU, 8),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+/* LSX state*/
+static int get_lsx(QEMUFile *f, void *pv, size_t size,
+                   const VMStateField *field)
+{
+    int i;
+    fpr_t *v = pv;
+
+    for (i = 0; i < LSX_LEN/64; i++) {
+        qemu_get_sbe64s(f, &v->vreg.D(i));
+    }
+    return 0;
+}
+
+static int put_lsx(QEMUFile *f, void *pv, size_t size,
+                   const VMStateField *field, JSONWriter *vmdesc)
+{
+    int i;
+    fpr_t *v = pv;
+
+    for (i = 0; i < LSX_LEN/8; i++) {
+        qemu_put_sbe64s(f, &v->vreg.D(i));
+    }
+    return 0;
+}
+
+static const VMStateInfo vmstate_info_lsx = {
+    .name = "lsx",
+    .get  = get_lsx,
+    .put  = put_lsx,
+};
+
+#define VMSTATE_LSX_ARRAY_V(_f, _s, _n, _v)                       \
+    VMSTATE_SUB_ARRAY(_f, _s, 0, _n, _v, vmstate_info_lsx, fpr_t)
+
+#define VMSTATE_LSX_ARRAY(_f, _s, _n)                             \
+    VMSTATE_LSX_ARRAY_V(_f, _s, _n, 0)
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
+        VMSTATE_LSX_ARRAY(env.fpr, LoongArchCPU, 32),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 /* TLB state */
 const VMStateDescription vmstate_tlb = {
     .name = "cpu/tlb",
@@ -24,18 +130,13 @@ const VMStateDescription vmstate_tlb = {
 };
 
 /* LoongArch CPU state */
-
 const VMStateDescription vmstate_loongarch_cpu = {
     .name = "cpu",
     .version_id = 0,
     .minimum_version_id = 0,
     .fields = (VMStateField[]) {
-
         VMSTATE_UINTTL_ARRAY(env.gpr, LoongArchCPU, 32),
         VMSTATE_UINTTL(env.pc, LoongArchCPU),
-        VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
-        VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
-        VMSTATE_BOOL_ARRAY(env.cf, LoongArchCPU, 8),
 
         /* Remaining CSRs */
         VMSTATE_UINT64(env.CSR_CRMD, LoongArchCPU),
@@ -99,4 +200,8 @@ const VMStateDescription vmstate_loongarch_cpu = {
 
         VMSTATE_END_OF_LIST()
     },
+    .subsections = (const VMStateDescription*[]) {
+        &vmstate_fpu,
+        &vmstate_lsx,
+    }
 };
-- 
2.31.1



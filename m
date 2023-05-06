Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8FC6F8F51
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 08:40:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvBWf-0005lH-1n; Sat, 06 May 2023 02:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pvBWP-0005fz-KK
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:35:59 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pvBWL-0004BO-2J
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:35:57 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Dxh+lC9VVkvaQFAA--.9529S3;
 Sat, 06 May 2023 14:35:46 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxDbM89VVkhCNNAA--.9773S5; 
 Sat, 06 May 2023 14:35:46 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL v2 03/45] target/loongarch: Add CHECK_SXE maccro for check LSX
 enable
Date: Sat,  6 May 2023 14:34:58 +0800
Message-Id: <20230506063540.178794-4-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230506063540.178794-1-gaosong@loongson.cn>
References: <20230506063540.178794-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxDbM89VVkhCNNAA--.9773S5
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXF1fXryDArW3WrW7Wr1ftFb_yoW5GFWkpF
 Z7Cry7KF4rGFZ2y3saqa90grn8Xr15Gw4xta1Sg3s5GFsxXr1Fqa1vq39FgFW3Gayrury2
 vF1fAw13WF4xWaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY
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
Message-Id: <20230504122810.4094787-4-gaosong@loongson.cn>
---
 target/loongarch/cpu.c                      |  2 ++
 target/loongarch/cpu.h                      |  2 ++
 target/loongarch/insn_trans/trans_lsx.c.inc | 11 +++++++++++
 3 files changed, 15 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 18b41221a6..55d7f9255e 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -52,6 +52,7 @@ static const char * const excp_names[] = {
     [EXCCODE_FPE] = "Floating Point Exception",
     [EXCCODE_DBP] = "Debug breakpoint",
     [EXCCODE_BCE] = "Bound Check Exception",
+    [EXCCODE_SXD] = "128 bit vector instructions Disable exception",
 };
 
 const char *loongarch_exception_name(int32_t exception)
@@ -187,6 +188,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
     case EXCCODE_FPD:
     case EXCCODE_FPE:
     case EXCCODE_BCE:
+    case EXCCODE_SXD:
         env->CSR_BADV = env->pc;
         QEMU_FALLTHROUGH;
     case EXCCODE_ADEM:
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index fd0f61936d..6755b1f0c7 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -419,6 +419,7 @@ static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
 #define HW_FLAGS_PLV_MASK   R_CSR_CRMD_PLV_MASK  /* 0x03 */
 #define HW_FLAGS_CRMD_PG    R_CSR_CRMD_PG_MASK   /* 0x10 */
 #define HW_FLAGS_EUEN_FPE   0x04
+#define HW_FLAGS_EUEN_SXE   0x08
 
 static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
                                         target_ulong *pc,
@@ -429,6 +430,7 @@ static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
     *cs_base = 0;
     *flags = env->CSR_CRMD & (R_CSR_CRMD_PLV_MASK | R_CSR_CRMD_PG_MASK);
     *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, FPE) * HW_FLAGS_EUEN_FPE;
+    *flags |= FIELD_EX64(env->CSR_EUEN, CSR_EUEN, SXE) * HW_FLAGS_EUEN_SXE;
 }
 
 void loongarch_cpu_list(void);
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 1cf3ab34a9..5dedb044d7 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -3,3 +3,14 @@
  * LSX translate functions
  * Copyright (c) 2022-2023 Loongson Technology Corporation Limited
  */
+
+#ifndef CONFIG_USER_ONLY
+#define CHECK_SXE do { \
+    if ((ctx->base.tb->flags & HW_FLAGS_EUEN_SXE) == 0) { \
+        generate_exception(ctx, EXCCODE_SXD); \
+        return true; \
+    } \
+} while (0)
+#else
+#define CHECK_SXE
+#endif
-- 
2.31.1



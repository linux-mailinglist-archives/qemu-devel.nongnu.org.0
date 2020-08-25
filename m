Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5DE252282
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 23:11:09 +0200 (CEST)
Received: from localhost ([::1]:50072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAgDk-0005fu-7B
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 17:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg3C-0007JL-PA
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:00:14 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg39-0001gV-W1
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:00:14 -0400
Received: by mail-pg1-x541.google.com with SMTP id p37so7680704pgl.3
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 14:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vLvNC5AlBnMMj5Xypoodm2v5NfVH1pHkbk/5dT3fkns=;
 b=ecipNhGoBKQ02TFbaj93oCSwUtgmXchdRW+KyRkuqHGEhP+HYSHLrpYoGYpZ8bPWor
 AaNzAQG+dRa0p3LHKkpzWB7v9GoPRHImvr2F1GlvhIzYS3v9BrnhXnl/dOfuLtU6IJfZ
 8BbVdX8OC7PMr0sY1ujrCLu9mrAeNbyobQOldhc0t6u97fx8JgHfWeMzPoWmCBeCF6M1
 PRBbc+pZ8HGGaWFcX2Lyid/u+sccwbUCuMVYSUHZwI5ZfAD6cch41X3LOpYXlpL8Tu/w
 gCpyELHhW725yNXvk9gTWzxVa8gqZMKUcDcZf0Ya9rozm+5INRX1gUByKj7I3NsTZIdV
 YgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vLvNC5AlBnMMj5Xypoodm2v5NfVH1pHkbk/5dT3fkns=;
 b=M7BYj1J9B1kX6N1mb7kAatcaCIWbnQuInwvh/QlF1GU36bP/WZbND/zb3hp0h1k/Kw
 XH4h5U20GvsPgMQfGki5Mbrk7SuHBwLmFAzlAVlN0NmrlXzqgsVu6QRAiYMM5eESimxb
 hHXGxjaaD0FmiPMgEYmWaOcv8FHSs3Squiir2EOxPbtM7xqx52HmkJeCZ7BLLd4CRcJ7
 q+DmgWDxo7CP5vlMWU/jHhFYe3Lkg+fXj3VS6fhLI85eQ01l1T83fPdKDXy25jOQQIXS
 xtF2Lz0jXdEQMytAgOvL/SeAnE47C//9HR+WNuCS+3KwTlbsG2PJTg4xAougmjvUTCK/
 U/mA==
X-Gm-Message-State: AOAM531FTe52uZhDL1Jb0DzRCACuyezN58L+8BGqJmZB2+HcuJRLFrCa
 dBWiijSTncmLYbafh4Bk1M7aCQ9S0xVGNw==
X-Google-Smtp-Source: ABdhPJyuCs2jI9ABs6i8r57lAA98cs5p3ASNH/VqixxhhVuyMa/5AHf9/V9iLUOSD305SyPFAdeR1A==
X-Received: by 2002:a17:902:9888:: with SMTP id
 s8mr9203826plp.111.1598389210032; 
 Tue, 25 Aug 2020 14:00:10 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id k4sm16074pgr.87.2020.08.25.14.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:00:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/77] target/microblaze: Fix width of MSR
Date: Tue, 25 Aug 2020 13:58:47 -0700
Message-Id: <20200825205950.730499-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825205950.730499-1-richard.henderson@linaro.org>
References: <20200825205950.730499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The machine status register is only 32-bits wide.
Do not use a 64-bit type to represent it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h       |  2 +-
 target/microblaze/helper.c    |  4 ++--
 target/microblaze/op_helper.c |  2 +-
 target/microblaze/translate.c | 38 ++++++++++++-----------------------
 4 files changed, 17 insertions(+), 29 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index f4c3c09b09..019e5dfa26 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -237,7 +237,7 @@ struct CPUMBState {
     uint32_t imm;
     uint32_t regs[32];
     uint32_t pc;
-    uint64_t msr;
+    uint32_t msr;
     uint64_t ear;
     uint64_t esr;
     uint64_t fsr;
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index b95617a81a..af79091fd2 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -222,7 +222,7 @@ void mb_cpu_do_interrupt(CPUState *cs)
             }
 #endif
             qemu_log_mask(CPU_LOG_INT,
-                         "interrupt at pc=%x msr=%" PRIx64 " %x iflags=%x\n",
+                         "interrupt at pc=%x msr=%x %x iflags=%x\n",
                          env->pc, env->msr, t, env->iflags);
 
             env->msr &= ~(MSR_VMS | MSR_UMS | MSR_VM | MSR_UM | MSR_IE);
@@ -239,7 +239,7 @@ void mb_cpu_do_interrupt(CPUState *cs)
             assert(!(env->iflags & D_FLAG));
             t = (env->msr & (MSR_VM | MSR_UM)) << 1;
             qemu_log_mask(CPU_LOG_INT,
-                          "break at pc=%x msr=%" PRIx64 " %x iflags=%x\n",
+                          "break at pc=%x msr=%x %x iflags=%x\n",
                           env->pc, env->msr, t, env->iflags);
             log_cpu_state_mask(CPU_LOG_INT, cs, 0);
             env->msr &= ~(MSR_VMS | MSR_UMS | MSR_VM | MSR_UM);
diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index fdf706a723..a7f6cb71f1 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -76,7 +76,7 @@ void helper_debug(CPUMBState *env)
     int i;
 
     qemu_log("PC=%08x\n", env->pc);
-    qemu_log("rmsr=%" PRIx64 " resr=%" PRIx64 " rear=%" PRIx64 " "
+    qemu_log("rmsr=%x resr=%" PRIx64 " rear=%" PRIx64 " "
              "debug[%x] imm=%x iflags=%x\n",
              env->msr, env->esr, env->ear,
              env->debug, env->imm, env->iflags);
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 72783c1d8a..0e71e7ed01 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -56,7 +56,7 @@
 static TCGv_i32 env_debug;
 static TCGv_i32 cpu_R[32];
 static TCGv_i32 cpu_pc;
-static TCGv_i64 cpu_msr;
+static TCGv_i32 cpu_msr;
 static TCGv_i64 cpu_ear;
 static TCGv_i64 cpu_esr;
 static TCGv_i64 cpu_fsr;
@@ -152,8 +152,7 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 
 static void read_carry(DisasContext *dc, TCGv_i32 d)
 {
-    tcg_gen_extrl_i64_i32(d, cpu_msr);
-    tcg_gen_shri_i32(d, d, 31);
+    tcg_gen_shri_i32(d, cpu_msr, 31);
 }
 
 /*
@@ -162,12 +161,9 @@ static void read_carry(DisasContext *dc, TCGv_i32 d)
  */
 static void write_carry(DisasContext *dc, TCGv_i32 v)
 {
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    tcg_gen_extu_i32_i64(t0, v);
     /* Deposit bit 0 into MSR_C and the alias MSR_CC.  */
-    tcg_gen_deposit_i64(cpu_msr, cpu_msr, t0, 2, 1);
-    tcg_gen_deposit_i64(cpu_msr, cpu_msr, t0, 31, 1);
-    tcg_temp_free_i64(t0);
+    tcg_gen_deposit_i32(cpu_msr, cpu_msr, v, 2, 1);
+    tcg_gen_deposit_i32(cpu_msr, cpu_msr, v, 31, 1);
 }
 
 static void write_carryi(DisasContext *dc, bool carry)
@@ -437,21 +433,14 @@ static void dec_xor(DisasContext *dc)
 
 static inline void msr_read(DisasContext *dc, TCGv_i32 d)
 {
-    tcg_gen_extrl_i64_i32(d, cpu_msr);
+    tcg_gen_mov_i32(d, cpu_msr);
 }
 
 static inline void msr_write(DisasContext *dc, TCGv_i32 v)
 {
-    TCGv_i64 t;
-
-    t = tcg_temp_new_i64();
     dc->cpustate_changed = 1;
-    /* PVR bit is not writable.  */
-    tcg_gen_extu_i32_i64(t, v);
-    tcg_gen_andi_i64(t, t, ~MSR_PVR);
-    tcg_gen_andi_i64(cpu_msr, cpu_msr, MSR_PVR);
-    tcg_gen_or_i64(cpu_msr, cpu_msr, t);
-    tcg_temp_free_i64(t);
+    /* PVR bit is not writable, and is never set. */
+    tcg_gen_andi_i32(cpu_msr, v, ~MSR_PVR);
 }
 
 static void dec_msr(DisasContext *dc)
@@ -773,8 +762,7 @@ static void dec_bit(DisasContext *dc)
             t0 = tcg_temp_new_i32();
 
             LOG_DIS("src r%d r%d\n", dc->rd, dc->ra);
-            tcg_gen_extrl_i64_i32(t0, cpu_msr);
-            tcg_gen_andi_i32(t0, t0, MSR_CC);
+            tcg_gen_andi_i32(t0, cpu_msr, MSR_CC);
             write_carry(dc, cpu_R[dc->ra]);
             if (dc->rd) {
                 tcg_gen_shri_i32(cpu_R[dc->rd], cpu_R[dc->ra], 1);
@@ -1326,7 +1314,7 @@ static inline void do_rti(DisasContext *dc)
     TCGv_i32 t0, t1;
     t0 = tcg_temp_new_i32();
     t1 = tcg_temp_new_i32();
-    tcg_gen_extrl_i64_i32(t1, cpu_msr);
+    tcg_gen_mov_i32(t1, cpu_msr);
     tcg_gen_shri_i32(t0, t1, 1);
     tcg_gen_ori_i32(t1, t1, MSR_IE);
     tcg_gen_andi_i32(t0, t0, (MSR_VM | MSR_UM));
@@ -1344,7 +1332,7 @@ static inline void do_rtb(DisasContext *dc)
     TCGv_i32 t0, t1;
     t0 = tcg_temp_new_i32();
     t1 = tcg_temp_new_i32();
-    tcg_gen_extrl_i64_i32(t1, cpu_msr);
+    tcg_gen_mov_i32(t1, cpu_msr);
     tcg_gen_andi_i32(t1, t1, ~MSR_BIP);
     tcg_gen_shri_i32(t0, t1, 1);
     tcg_gen_andi_i32(t0, t0, (MSR_VM | MSR_UM));
@@ -1363,7 +1351,7 @@ static inline void do_rte(DisasContext *dc)
     t0 = tcg_temp_new_i32();
     t1 = tcg_temp_new_i32();
 
-    tcg_gen_extrl_i64_i32(t1, cpu_msr);
+    tcg_gen_mov_i32(t1, cpu_msr);
     tcg_gen_ori_i32(t1, t1, MSR_EE);
     tcg_gen_andi_i32(t1, t1, ~MSR_EIP);
     tcg_gen_shri_i32(t0, t1, 1);
@@ -1809,7 +1797,7 @@ void mb_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
     qemu_fprintf(f, "IN: PC=%x %s\n",
                  env->pc, lookup_symbol(env->pc));
-    qemu_fprintf(f, "rmsr=%" PRIx64 " resr=%" PRIx64 " rear=%" PRIx64 " "
+    qemu_fprintf(f, "rmsr=%x resr=%" PRIx64 " rear=%" PRIx64 " "
                  "debug=%x imm=%x iflags=%x fsr=%" PRIx64 " "
                  "rbtr=%" PRIx64 "\n",
                  env->msr, env->esr, env->ear,
@@ -1874,7 +1862,7 @@ void mb_tcg_init(void)
     cpu_pc =
         tcg_global_mem_new_i32(cpu_env, offsetof(CPUMBState, pc), "rpc");
     cpu_msr =
-        tcg_global_mem_new_i64(cpu_env, offsetof(CPUMBState, msr), "rmsr");
+        tcg_global_mem_new_i32(cpu_env, offsetof(CPUMBState, msr), "rmsr");
     cpu_ear =
         tcg_global_mem_new_i64(cpu_env, offsetof(CPUMBState, ear), "rear");
     cpu_esr =
-- 
2.25.1



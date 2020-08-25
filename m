Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC47252278
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 23:08:26 +0200 (CEST)
Received: from localhost ([::1]:41590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAgB7-0002Ch-3c
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 17:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg3A-0007FR-Ms
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:00:12 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:35617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg38-0001gA-4O
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:00:12 -0400
Received: by mail-pj1-x1044.google.com with SMTP id g6so128914pjl.0
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 14:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mWZxIEkP4nZuOtJzfgZGg0mAj4EW15ubIN08DOn/YHw=;
 b=RC6zNY84l5SEbDULSwoVTK/rpCSSMntFEwn/7wJhAlDStBlc/K8rTF6HqceQ0Sr1fF
 oXniV059a4UXS65ZkQHxhhJImZ71dXWmSIYR2Rrnd9DYheyj89cCV31zKBuXzaj5hGhk
 EqRgv4+yf/IHmJzXPLUFxw+e74b9SWvAZre9wz2SN+GzCtimYA64gKhjhHSLb0gkqt4G
 WR141VUEAqxzkFoBUWDwpHEYim/Z/s7rUWNUI2VJ91UpUcpW0ZWIYFxdiEp+NdfO5uHU
 lSeHRCaNA51UzL5+pR8xLc980mw1ItY5c2qGJ940tXCpIknhJNTowNNG4qjkXzy23Zbt
 1M7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mWZxIEkP4nZuOtJzfgZGg0mAj4EW15ubIN08DOn/YHw=;
 b=T8gEQ1zGjuiWKwf8ZEBFzgIQX3s799oL5rslNJ1ZIPX+wxsKfEl7X/dTknetVHLDuu
 XjGK2IrTBVHftcQpcgAxI2D7uQ1aqnNZtffd0gjd2ZNVePn3s9CrhJdPJQ9Sdw1JmuN+
 clb5o3q/TRwZJOxV199oqwr0qQw7XfGafl3f6r+w+TmBEg0TbKbWNgfblznilNN0Vx5+
 I6udYKuuOlYwxLI7FDvotsN41N6uF8AfxdRi/JGUlQydYqFA4myf2fiLXFecOPMes8h/
 CsT0QJl5zVrIu6eNhJkmDpapjVBmLpMukaADkjGgoozgBsD/EoBCZ/jpB5YHtRf8qwvB
 0eCw==
X-Gm-Message-State: AOAM531tf6rAPXy1EHIKGaU6ETan0rXa/eLZ40iJ72da/kaa/AvXSWLf
 SJjnsp4qUsK6iJzZWy9FjMcf+IzPdJO0Fw==
X-Google-Smtp-Source: ABdhPJzK3pjjKYnLw+WGibuE3m3MfG3qR5dvPeo9pyOUkgZQ87i9UB3X438AO4CXYrs9JHWE61h5ug==
X-Received: by 2002:a17:90b:40cb:: with SMTP id
 hj11mr3224573pjb.67.1598389207825; 
 Tue, 25 Aug 2020 14:00:07 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id k4sm16074pgr.87.2020.08.25.14.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:00:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/77] target/microblaze: Split the cpu_SR array
Date: Tue, 25 Aug 2020 13:58:45 -0700
Message-Id: <20200825205950.730499-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825205950.730499-1-richard.henderson@linaro.org>
References: <20200825205950.730499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
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

Similar to splitting the sregs array, this will allow further
fixes and cleanups.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 106 +++++++++++++++++++++-------------
 1 file changed, 65 insertions(+), 41 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 7d307e6b48..19d7b8abfd 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -55,7 +55,13 @@
 
 static TCGv_i32 env_debug;
 static TCGv_i32 cpu_R[32];
-static TCGv_i64 cpu_SR[14];
+static TCGv_i64 cpu_pc;
+static TCGv_i64 cpu_msr;
+static TCGv_i64 cpu_ear;
+static TCGv_i64 cpu_esr;
+static TCGv_i64 cpu_fsr;
+static TCGv_i64 cpu_btr;
+static TCGv_i64 cpu_edr;
 static TCGv_i32 env_imm;
 static TCGv_i32 env_btaken;
 static TCGv_i64 env_btarget;
@@ -117,7 +123,7 @@ static inline void t_gen_raise_exception(DisasContext *dc, uint32_t index)
     TCGv_i32 tmp = tcg_const_i32(index);
 
     t_sync_flags(dc);
-    tcg_gen_movi_i64(cpu_SR[SR_PC], dc->pc);
+    tcg_gen_movi_i64(cpu_pc, dc->pc);
     gen_helper_raise_exception(cpu_env, tmp);
     tcg_temp_free_i32(tmp);
     dc->is_jmp = DISAS_UPDATE;
@@ -136,17 +142,17 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 {
     if (use_goto_tb(dc, dest)) {
         tcg_gen_goto_tb(n);
-        tcg_gen_movi_i64(cpu_SR[SR_PC], dest);
+        tcg_gen_movi_i64(cpu_pc, dest);
         tcg_gen_exit_tb(dc->tb, n);
     } else {
-        tcg_gen_movi_i64(cpu_SR[SR_PC], dest);
+        tcg_gen_movi_i64(cpu_pc, dest);
         tcg_gen_exit_tb(NULL, 0);
     }
 }
 
 static void read_carry(DisasContext *dc, TCGv_i32 d)
 {
-    tcg_gen_extrl_i64_i32(d, cpu_SR[SR_MSR]);
+    tcg_gen_extrl_i64_i32(d, cpu_msr);
     tcg_gen_shri_i32(d, d, 31);
 }
 
@@ -159,8 +165,8 @@ static void write_carry(DisasContext *dc, TCGv_i32 v)
     TCGv_i64 t0 = tcg_temp_new_i64();
     tcg_gen_extu_i32_i64(t0, v);
     /* Deposit bit 0 into MSR_C and the alias MSR_CC.  */
-    tcg_gen_deposit_i64(cpu_SR[SR_MSR], cpu_SR[SR_MSR], t0, 2, 1);
-    tcg_gen_deposit_i64(cpu_SR[SR_MSR], cpu_SR[SR_MSR], t0, 31, 1);
+    tcg_gen_deposit_i64(cpu_msr, cpu_msr, t0, 2, 1);
+    tcg_gen_deposit_i64(cpu_msr, cpu_msr, t0, 31, 1);
     tcg_temp_free_i64(t0);
 }
 
@@ -180,7 +186,7 @@ static bool trap_illegal(DisasContext *dc, bool cond)
 {
     if (cond && (dc->tb_flags & MSR_EE_FLAG)
         && dc->cpu->cfg.illegal_opcode_exception) {
-        tcg_gen_movi_i64(cpu_SR[SR_ESR], ESR_EC_ILLEGAL_OP);
+        tcg_gen_movi_i64(cpu_esr, ESR_EC_ILLEGAL_OP);
         t_gen_raise_exception(dc, EXCP_HW_EXCP);
     }
     return cond;
@@ -196,7 +202,7 @@ static bool trap_userspace(DisasContext *dc, bool cond)
     bool cond_user = cond && mem_index == MMU_USER_IDX;
 
     if (cond_user && (dc->tb_flags & MSR_EE_FLAG)) {
-        tcg_gen_movi_i64(cpu_SR[SR_ESR], ESR_EC_PRIVINSN);
+        tcg_gen_movi_i64(cpu_esr, ESR_EC_PRIVINSN);
         t_gen_raise_exception(dc, EXCP_HW_EXCP);
     }
     return cond_user;
@@ -431,7 +437,7 @@ static void dec_xor(DisasContext *dc)
 
 static inline void msr_read(DisasContext *dc, TCGv_i32 d)
 {
-    tcg_gen_extrl_i64_i32(d, cpu_SR[SR_MSR]);
+    tcg_gen_extrl_i64_i32(d, cpu_msr);
 }
 
 static inline void msr_write(DisasContext *dc, TCGv_i32 v)
@@ -443,8 +449,8 @@ static inline void msr_write(DisasContext *dc, TCGv_i32 v)
     /* PVR bit is not writable.  */
     tcg_gen_extu_i32_i64(t, v);
     tcg_gen_andi_i64(t, t, ~MSR_PVR);
-    tcg_gen_andi_i64(cpu_SR[SR_MSR], cpu_SR[SR_MSR], MSR_PVR);
-    tcg_gen_or_i64(cpu_SR[SR_MSR], cpu_SR[SR_MSR], t);
+    tcg_gen_andi_i64(cpu_msr, cpu_msr, MSR_PVR);
+    tcg_gen_or_i64(cpu_msr, cpu_msr, t);
     tcg_temp_free_i64(t);
 }
 
@@ -503,7 +509,7 @@ static void dec_msr(DisasContext *dc)
         msr_write(dc, t0);
         tcg_temp_free_i32(t0);
         tcg_temp_free_i32(t1);
-        tcg_gen_movi_i64(cpu_SR[SR_PC], dc->pc + 4);
+        tcg_gen_movi_i64(cpu_pc, dc->pc + 4);
         dc->is_jmp = DISAS_UPDATE;
         return;
     }
@@ -535,15 +541,25 @@ static void dec_msr(DisasContext *dc)
     if (to) {
         LOG_DIS("m%ss sr%x r%d imm=%x\n", to ? "t" : "f", sr, dc->ra, dc->imm);
         switch (sr) {
-            case 0:
+            case SR_PC:
                 break;
-            case 1:
+            case SR_MSR:
                 msr_write(dc, cpu_R[dc->ra]);
                 break;
             case SR_EAR:
+                tcg_gen_extu_i32_i64(cpu_ear, cpu_R[dc->ra]);
+                break;
             case SR_ESR:
+                tcg_gen_extu_i32_i64(cpu_esr, cpu_R[dc->ra]);
+                break;
             case SR_FSR:
-                tcg_gen_extu_i32_i64(cpu_SR[sr], cpu_R[dc->ra]);
+                tcg_gen_extu_i32_i64(cpu_fsr, cpu_R[dc->ra]);
+                break;
+            case SR_BTR:
+                tcg_gen_extu_i32_i64(cpu_btr, cpu_R[dc->ra]);
+                break;
+            case SR_EDR:
+                tcg_gen_extu_i32_i64(cpu_edr, cpu_R[dc->ra]);
                 break;
             case 0x800:
                 tcg_gen_st_i32(cpu_R[dc->ra],
@@ -561,22 +577,30 @@ static void dec_msr(DisasContext *dc)
         LOG_DIS("m%ss r%d sr%x imm=%x\n", to ? "t" : "f", dc->rd, sr, dc->imm);
 
         switch (sr) {
-            case 0:
+            case SR_PC:
                 tcg_gen_movi_i32(cpu_R[dc->rd], dc->pc);
                 break;
-            case 1:
+            case SR_MSR:
                 msr_read(dc, cpu_R[dc->rd]);
                 break;
             case SR_EAR:
                 if (extended) {
-                    tcg_gen_extrh_i64_i32(cpu_R[dc->rd], cpu_SR[sr]);
-                    break;
+                    tcg_gen_extrh_i64_i32(cpu_R[dc->rd], cpu_ear);
+                } else {
+                    tcg_gen_extrl_i64_i32(cpu_R[dc->rd], cpu_ear);
                 }
+                break;
             case SR_ESR:
+                tcg_gen_extrl_i64_i32(cpu_R[dc->rd], cpu_esr);
+                break;
             case SR_FSR:
+                tcg_gen_extrl_i64_i32(cpu_R[dc->rd], cpu_fsr);
+                break;
             case SR_BTR:
+                tcg_gen_extrl_i64_i32(cpu_R[dc->rd], cpu_btr);
+                break;
             case SR_EDR:
-                tcg_gen_extrl_i64_i32(cpu_R[dc->rd], cpu_SR[sr]);
+                tcg_gen_extrl_i64_i32(cpu_R[dc->rd], cpu_edr);
                 break;
             case 0x800:
                 tcg_gen_ld_i32(cpu_R[dc->rd],
@@ -749,7 +773,7 @@ static void dec_bit(DisasContext *dc)
             t0 = tcg_temp_new_i32();
 
             LOG_DIS("src r%d r%d\n", dc->rd, dc->ra);
-            tcg_gen_extrl_i64_i32(t0, cpu_SR[SR_MSR]);
+            tcg_gen_extrl_i64_i32(t0, cpu_msr);
             tcg_gen_andi_i32(t0, t0, MSR_CC);
             write_carry(dc, cpu_R[dc->ra]);
             if (dc->rd) {
@@ -995,7 +1019,7 @@ static void dec_load(DisasContext *dc)
         TCGv_i32 treg = tcg_const_i32(dc->rd);
         TCGv_i32 tsize = tcg_const_i32(size - 1);
 
-        tcg_gen_movi_i64(cpu_SR[SR_PC], dc->pc);
+        tcg_gen_movi_i64(cpu_pc, dc->pc);
         gen_helper_memalign(cpu_env, addr, treg, t0, tsize);
 
         tcg_temp_free_i32(t0);
@@ -1115,7 +1139,7 @@ static void dec_store(DisasContext *dc)
         TCGv_i32 treg = tcg_const_i32(dc->rd);
         TCGv_i32 tsize = tcg_const_i32(size - 1);
 
-        tcg_gen_movi_i64(cpu_SR[SR_PC], dc->pc);
+        tcg_gen_movi_i64(cpu_pc, dc->pc);
         /* FIXME: if the alignment is wrong, we should restore the value
          *        in memory. One possible way to achieve this is to probe
          *        the MMU prior to the memaccess, thay way we could put
@@ -1169,7 +1193,7 @@ static void eval_cond_jmp(DisasContext *dc, TCGv_i64 pc_true, TCGv_i64 pc_false)
     TCGv_i64 tmp_zero = tcg_const_i64(0);
 
     tcg_gen_extu_i32_i64(tmp_btaken, env_btaken);
-    tcg_gen_movcond_i64(TCG_COND_NE, cpu_SR[SR_PC],
+    tcg_gen_movcond_i64(TCG_COND_NE, cpu_pc,
                         tmp_btaken, tmp_zero,
                         pc_true, pc_false);
 
@@ -1253,7 +1277,7 @@ static void dec_br(DisasContext *dc)
             tcg_gen_st_i32(tmp_1, cpu_env,
                            -offsetof(MicroBlazeCPU, env)
                            +offsetof(CPUState, halted));
-            tcg_gen_movi_i64(cpu_SR[SR_PC], dc->pc + 4);
+            tcg_gen_movi_i64(cpu_pc, dc->pc + 4);
             gen_helper_raise_exception(cpu_env, tmp_hlt);
             tcg_temp_free_i32(tmp_hlt);
             tcg_temp_free_i32(tmp_1);
@@ -1309,7 +1333,7 @@ static inline void do_rti(DisasContext *dc)
     TCGv_i32 t0, t1;
     t0 = tcg_temp_new_i32();
     t1 = tcg_temp_new_i32();
-    tcg_gen_extrl_i64_i32(t1, cpu_SR[SR_MSR]);
+    tcg_gen_extrl_i64_i32(t1, cpu_msr);
     tcg_gen_shri_i32(t0, t1, 1);
     tcg_gen_ori_i32(t1, t1, MSR_IE);
     tcg_gen_andi_i32(t0, t0, (MSR_VM | MSR_UM));
@@ -1327,7 +1351,7 @@ static inline void do_rtb(DisasContext *dc)
     TCGv_i32 t0, t1;
     t0 = tcg_temp_new_i32();
     t1 = tcg_temp_new_i32();
-    tcg_gen_extrl_i64_i32(t1, cpu_SR[SR_MSR]);
+    tcg_gen_extrl_i64_i32(t1, cpu_msr);
     tcg_gen_andi_i32(t1, t1, ~MSR_BIP);
     tcg_gen_shri_i32(t0, t1, 1);
     tcg_gen_andi_i32(t0, t0, (MSR_VM | MSR_UM));
@@ -1346,7 +1370,7 @@ static inline void do_rte(DisasContext *dc)
     t0 = tcg_temp_new_i32();
     t1 = tcg_temp_new_i32();
 
-    tcg_gen_extrl_i64_i32(t1, cpu_SR[SR_MSR]);
+    tcg_gen_extrl_i64_i32(t1, cpu_msr);
     tcg_gen_ori_i32(t1, t1, MSR_EE);
     tcg_gen_andi_i32(t1, t1, ~MSR_EIP);
     tcg_gen_shri_i32(t0, t1, 1);
@@ -1401,7 +1425,7 @@ static void dec_rts(DisasContext *dc)
 static int dec_check_fpuv2(DisasContext *dc)
 {
     if ((dc->cpu->cfg.use_fpu != 2) && (dc->tb_flags & MSR_EE_FLAG)) {
-        tcg_gen_movi_i64(cpu_SR[SR_ESR], ESR_EC_FPU);
+        tcg_gen_movi_i64(cpu_esr, ESR_EC_FPU);
         t_gen_raise_exception(dc, EXCP_HW_EXCP);
     }
     return (dc->cpu->cfg.use_fpu == 2) ? PVR2_USE_FPU2_MASK : 0;
@@ -1652,7 +1676,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 
 #if SIM_COMPAT
         if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
-            tcg_gen_movi_i64(cpu_SR[SR_PC], dc->pc);
+            tcg_gen_movi_i64(cpu_pc, dc->pc);
             gen_helper_debug();
         }
 #endif
@@ -1730,7 +1754,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     if (dc->jmp == JMP_DIRECT || dc->jmp == JMP_DIRECT_CC) {
         if (dc->tb_flags & D_FLAG) {
             dc->is_jmp = DISAS_UPDATE;
-            tcg_gen_movi_i64(cpu_SR[SR_PC], npc);
+            tcg_gen_movi_i64(cpu_pc, npc);
             sync_jmpstate(dc);
         } else
             npc = dc->jmp_pc;
@@ -1740,7 +1764,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     if (dc->is_jmp == DISAS_NEXT
         && (dc->cpustate_changed || org_flags != dc->tb_flags)) {
         dc->is_jmp = DISAS_UPDATE;
-        tcg_gen_movi_i64(cpu_SR[SR_PC], npc);
+        tcg_gen_movi_i64(cpu_pc, npc);
     }
     t_sync_flags(dc);
 
@@ -1748,7 +1772,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
         TCGv_i32 tmp = tcg_const_i32(EXCP_DEBUG);
 
         if (dc->is_jmp != DISAS_JUMP) {
-            tcg_gen_movi_i64(cpu_SR[SR_PC], npc);
+            tcg_gen_movi_i64(cpu_pc, npc);
         }
         gen_helper_raise_exception(cpu_env, tmp);
         tcg_temp_free_i32(tmp);
@@ -1863,19 +1887,19 @@ void mb_tcg_init(void)
                           regnames[i]);
     }
 
-    cpu_SR[SR_PC] =
+    cpu_pc =
         tcg_global_mem_new_i64(cpu_env, offsetof(CPUMBState, pc), "rpc");
-    cpu_SR[SR_MSR] =
+    cpu_msr =
         tcg_global_mem_new_i64(cpu_env, offsetof(CPUMBState, msr), "rmsr");
-    cpu_SR[SR_EAR] =
+    cpu_ear =
         tcg_global_mem_new_i64(cpu_env, offsetof(CPUMBState, ear), "rear");
-    cpu_SR[SR_ESR] =
+    cpu_esr =
         tcg_global_mem_new_i64(cpu_env, offsetof(CPUMBState, esr), "resr");
-    cpu_SR[SR_FSR] =
+    cpu_fsr =
         tcg_global_mem_new_i64(cpu_env, offsetof(CPUMBState, fsr), "rfsr");
-    cpu_SR[SR_BTR] =
+    cpu_btr =
         tcg_global_mem_new_i64(cpu_env, offsetof(CPUMBState, btr), "rbtr");
-    cpu_SR[SR_EDR] =
+    cpu_edr =
         tcg_global_mem_new_i64(cpu_env, offsetof(CPUMBState, edr), "redr");
 }
 
-- 
2.25.1



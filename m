Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCA22522B5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 23:24:06 +0200 (CEST)
Received: from localhost ([::1]:51890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAgQH-0004Gy-Mx
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 17:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg3c-0007uR-Bi
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:00:40 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg3Z-0001qe-Oe
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:00:39 -0400
Received: by mail-pj1-x1034.google.com with SMTP id kx11so117296pjb.5
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 14:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wse7zD0pJo6WjEez5LvLZIudG6q/fbgb3bbbGW9ilgU=;
 b=qvup682KlHmC6NHpdjStw6DoA6H7z+FFELiqX1kk3MhAe3NdEI4K856PV9u8uqE3Yq
 lZQrTdSVRGxEawqC0LTxRiKVq+P5iEOxTK/3sBBFnrPSVuOLT9qSeI93LTE/pGQBOdSQ
 xBvUv05slXAMSHJ9kHRUWuyf6o71LzbJETBfzTL+lEnTVjU7dzlyWrkFGCtIobPRu2a3
 +M0IGDGT1f6mom9jbShcNMHwp7U9mspy6rIhaiCzM8tGnrxw32HDZLPb0FZLXFM66lzp
 mVDR92iTE6Sa9SyeYSHbj1N+4+hoQVxrUZhQbtaW14GzyXNScAxEnvS9L4c/YdtKSB6h
 Hoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wse7zD0pJo6WjEez5LvLZIudG6q/fbgb3bbbGW9ilgU=;
 b=rp7E+rJqNXmxo9uc8UDiImpWAt62zWvVATqJ77/p4DqLaiJBkkBejK15o/JNSi8Jxv
 UUL2I1sQGHKMOeeOtNYp2sDVPUaIbzegvO2kmb+3s++lQieG0iUCyNWU9WPj1OECSUtT
 Vy33WSposO4XXlJLk77bUmOe9xEoBDv7ugwuu8iBr+Zh19CaV71pt3Sz+GxntnS/d9yi
 SVGHNcDsI3Dkswkx5tJSkyuyPF2vbawrmoWpdh7nKHEIgCGsgM1VykBS+SLy+xe5ALFI
 YcIhrzb7Mt1xKU6hVwukiJhoi4Vo1CtqsVMPMDBr6l0tITw/WRJ2AyXpdFoTTlkg4Rpm
 Z4jQ==
X-Gm-Message-State: AOAM531byIW58JfGCDCmWBMjDjXDAZMPi3Ve7Oe49zFd7c4BovbpuiRC
 iEDnnbJftg6ln21u0vS+jId6NyXEF2/jWQ==
X-Google-Smtp-Source: ABdhPJz4nHZ9fPnjKq8LNvUpv7voVQ8QEWrFWVB/JlSjN2zeZjkZPm8CZp0Y61igN+gWwxC8DZa3tw==
X-Received: by 2002:a17:90a:a101:: with SMTP id
 s1mr2841013pjp.205.1598389235827; 
 Tue, 25 Aug 2020 14:00:35 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id k4sm16074pgr.87.2020.08.25.14.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:00:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 34/77] target/microblaze: Ensure imm constant is always
 available
Date: Tue, 25 Aug 2020 13:59:07 -0700
Message-Id: <20200825205950.730499-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825205950.730499-1-richard.henderson@linaro.org>
References: <20200825205950.730499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Include the env->imm value in the TB values when IMM_FLAG is set.
This means that we can always reconstruct the complete 32-bit imm.
Discard env_imm when its contents can no longer be accessed.

Fix user-mode checks for BRK/BRKI, which depend on IMM.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h       |   2 +-
 target/microblaze/translate.c | 111 ++++++++++++++++++++--------------
 2 files changed, 67 insertions(+), 46 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 7066878ac7..013858b8e0 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -374,9 +374,9 @@ static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
     *pc = env->pc;
-    *cs_base = 0;
     *flags = (env->iflags & IFLAGS_TB_MASK) |
              (env->msr & (MSR_UM | MSR_VM | MSR_EE));
+    *cs_base = (*flags & IMM_FLAG ? env->imm : 0);
 }
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 133ec24870..65ce8f3cd6 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -61,6 +61,7 @@ typedef struct DisasContext {
     /* Decoder.  */
     int type_b;
     uint32_t ir;
+    uint32_t ext_imm;
     uint8_t opcode;
     uint8_t rd, ra, rb;
     uint16_t imm;
@@ -169,24 +170,23 @@ static bool trap_userspace(DisasContext *dc, bool cond)
     return cond_user;
 }
 
-/* True if ALU operand b is a small immediate that may deserve
-   faster treatment.  */
-static inline int dec_alu_op_b_is_small_imm(DisasContext *dc)
+static int32_t dec_alu_typeb_imm(DisasContext *dc)
 {
-    /* Immediate insn without the imm prefix ?  */
-    return dc->type_b && !(dc->tb_flags & IMM_FLAG);
+    tcg_debug_assert(dc->type_b);
+    if (dc->tb_flags & IMM_FLAG) {
+        return dc->ext_imm | dc->imm;
+    } else {
+        return (int16_t)dc->imm;
+    }
 }
 
 static inline TCGv_i32 *dec_alu_op_b(DisasContext *dc)
 {
     if (dc->type_b) {
-        if (dc->tb_flags & IMM_FLAG)
-            tcg_gen_ori_i32(cpu_imm, cpu_imm, dc->imm);
-        else
-            tcg_gen_movi_i32(cpu_imm, (int32_t)((int16_t)dc->imm));
+        tcg_gen_movi_i32(cpu_imm, dec_alu_typeb_imm(dc));
         return &cpu_imm;
-    } else
-        return &cpu_R[dc->rb];
+    }
+    return &cpu_R[dc->rb];
 }
 
 static void dec_add(DisasContext *dc)
@@ -776,14 +776,14 @@ static inline void sync_jmpstate(DisasContext *dc)
 
 static void dec_imm(DisasContext *dc)
 {
-    tcg_gen_movi_i32(cpu_imm, (dc->imm << 16));
+    dc->ext_imm = dc->imm << 16;
+    tcg_gen_movi_i32(cpu_imm, dc->ext_imm);
     dc->tb_flags |= IMM_FLAG;
     dc->clear_imm = 0;
 }
 
 static inline void compute_ldst_addr(DisasContext *dc, bool ea, TCGv t)
 {
-    bool extimm = dc->tb_flags & IMM_FLAG;
     /* Should be set to true if r1 is used by loadstores.  */
     bool stackprot = false;
     TCGv_i32 t32;
@@ -836,11 +836,7 @@ static inline void compute_ldst_addr(DisasContext *dc, bool ea, TCGv t)
     }
     /* Immediate.  */
     t32 = tcg_temp_new_i32();
-    if (!extimm) {
-        tcg_gen_addi_i32(t32, cpu_R[dc->ra], (int16_t)dc->imm);
-    } else {
-        tcg_gen_add_i32(t32, cpu_R[dc->ra], *(dec_alu_op_b(dc)));
-    }
+    tcg_gen_addi_i32(t32, cpu_R[dc->ra], dec_alu_typeb_imm(dc));
     tcg_gen_extu_i32_tl(t, t32);
     tcg_temp_free_i32(t32);
 
@@ -1134,15 +1130,13 @@ static void dec_bcc(DisasContext *dc)
         dec_setup_dslot(dc);
     }
 
-    if (dec_alu_op_b_is_small_imm(dc)) {
-        int32_t offset = (int32_t)((int16_t)dc->imm); /* sign-extend.  */
-
-        tcg_gen_movi_i32(cpu_btarget, dc->base.pc_next + offset);
+    if (dc->type_b) {
         dc->jmp = JMP_DIRECT_CC;
-        dc->jmp_pc = dc->base.pc_next + offset;
+        dc->jmp_pc = dc->base.pc_next + dec_alu_typeb_imm(dc);
+        tcg_gen_movi_i32(cpu_btarget, dc->jmp_pc);
     } else {
         dc->jmp = JMP_INDIRECT;
-        tcg_gen_addi_i32(cpu_btarget, *dec_alu_op_b(dc), dc->base.pc_next);
+        tcg_gen_addi_i32(cpu_btarget, cpu_R[dc->rb], dc->base.pc_next);
     }
     eval_cc(dc, cc, cpu_btaken, cpu_R[dc->ra]);
 }
@@ -1192,38 +1186,63 @@ static void dec_br(DisasContext *dc)
         return;
     }
 
+    if (abs && link && !dslot) {
+        if (dc->type_b) {
+            /* BRKI */
+            uint32_t imm = dec_alu_typeb_imm(dc);
+            if (trap_userspace(dc, imm != 8 && imm != 0x18)) {
+                return;
+            }
+        } else {
+            /* BRK */
+            if (trap_userspace(dc, true)) {
+                return;
+            }
+        }
+    }
+
     dc->delayed_branch = 1;
     if (dslot) {
         dec_setup_dslot(dc);
     }
-    if (link && dc->rd)
+    if (link && dc->rd) {
         tcg_gen_movi_i32(cpu_R[dc->rd], dc->base.pc_next);
+    }
 
-    dc->jmp = JMP_INDIRECT;
     if (abs) {
-        tcg_gen_movi_i32(cpu_btaken, 1);
-        tcg_gen_mov_i32(cpu_btarget, *(dec_alu_op_b(dc)));
-        if (link && !dslot) {
-            if (!(dc->tb_flags & IMM_FLAG) &&
-                (dc->imm == 8 || dc->imm == 0x18)) {
+        if (dc->type_b) {
+            uint32_t dest = dec_alu_typeb_imm(dc);
+
+            dc->jmp = JMP_DIRECT;
+            dc->jmp_pc = dest;
+            tcg_gen_movi_i32(cpu_btarget, dest);
+            if (link && !dslot) {
+                switch (dest) {
+                case 8:
+                case 0x18:
+                    gen_raise_exception_sync(dc, EXCP_BREAK);
+                    break;
+                case 0:
+                    gen_raise_exception_sync(dc, EXCP_DEBUG);
+                    break;
+                }
+            }
+        } else {
+            dc->jmp = JMP_INDIRECT;
+            tcg_gen_mov_i32(cpu_btarget, cpu_R[dc->rb]);
+            if (link && !dslot) {
                 gen_raise_exception_sync(dc, EXCP_BREAK);
             }
-            if (dc->imm == 0) {
-                if (trap_userspace(dc, true)) {
-                    return;
-                }
-                gen_raise_exception_sync(dc, EXCP_DEBUG);
-            }
         }
+    } else if (dc->type_b) {
+        dc->jmp = JMP_DIRECT;
+        dc->jmp_pc = dc->base.pc_next + dec_alu_typeb_imm(dc);
+        tcg_gen_movi_i32(cpu_btarget, dc->jmp_pc);
     } else {
-        if (dec_alu_op_b_is_small_imm(dc)) {
-            dc->jmp = JMP_DIRECT;
-            dc->jmp_pc = dc->base.pc_next + (int32_t)((int16_t)dc->imm);
-        } else {
-            tcg_gen_movi_i32(cpu_btaken, 1);
-            tcg_gen_addi_i32(cpu_btarget, *dec_alu_op_b(dc), dc->base.pc_next);
-        }
+        dc->jmp = JMP_INDIRECT;
+        tcg_gen_addi_i32(cpu_btarget, cpu_R[dc->rb], dc->base.pc_next);
     }
+    tcg_gen_movi_i32(cpu_btaken, 1);
 }
 
 static inline void do_rti(DisasContext *dc)
@@ -1529,6 +1548,7 @@ static void mb_tr_init_disas_context(DisasContextBase *dcb, CPUState *cs)
     dc->jmp = dc->delayed_branch ? JMP_INDIRECT : JMP_NOJMP;
     dc->cpustate_changed = 0;
     dc->abort_at_next_insn = 0;
+    dc->ext_imm = dc->base.tb->cs_base;
 
     bound = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
     dc->base.max_insns = MIN(dc->base.max_insns, bound);
@@ -1573,8 +1593,9 @@ static void mb_tr_translate_insn(DisasContextBase *dcb, CPUState *cs)
 
     dc->clear_imm = 1;
     decode(dc, cpu_ldl_code(env, dc->base.pc_next));
-    if (dc->clear_imm) {
+    if (dc->clear_imm && (dc->tb_flags & IMM_FLAG)) {
         dc->tb_flags &= ~IMM_FLAG;
+        tcg_gen_discard_i32(cpu_imm);
     }
     dc->base.pc_next += 4;
 
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426295AE606
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:56:53 +0200 (CEST)
Received: from localhost ([::1]:36124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWGC-0000IH-AP
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWp-0000JZ-Oy
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:10:00 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWn-0003d3-S2
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:59 -0400
Received: by mail-wr1-x433.google.com with SMTP id b5so14667680wrr.5
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5rVxX7cwFYjaY/PTysSF/QB8P94g3uGsgTmxIOtpn1U=;
 b=Ug6r60uOdeQouYrAkuZh9jYHbjG2ap4TnRolAkQAyGkOSVe31cskoJaXqgSqFX1BmA
 p+WfQKsGoZE8ehFMmiKbxwuKsrohLPXG3BoAnXHemyGn475h/q70Qh8JWeLXNlwK+rrs
 r2MSovtUMr6HXAGgKILKTEMWMFMpO4/Vqjk2fPlSHEtZy8+oywfWgjqcPV3WtqsuiezS
 snzQlYTNvLDqwCMfeksSWjAElOaNQAFbAJjG8b6EGiu6pq8IiaqseUJkuEjxdyYz4dLJ
 UPua3TmcmPEcMxbb4mKK//J9PmbhzqA6bOl2T+MUXmhGk3spL7WN/ex2loP90Rcg6/ex
 HwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5rVxX7cwFYjaY/PTysSF/QB8P94g3uGsgTmxIOtpn1U=;
 b=h3QDJy0lOQjwUunq3P5st60FAFRrgAOIkUNpxLEmhM/fv8QdvfHE/1u+SVSxUTvF5I
 YH31DtF5sEQp+vVhEMBvZ2DXMsTdXBPyM9jNE8YAPfrZXG35+QOZpjEtFoH0jMn8etLp
 B0eC3ieFja+L09AmkjBoOw75hqguT1g+FtJD2suqw5Q9SNUEmMwo+CZ5RCYBcLM4GR4P
 5/Tgro1mibHIGIDFKELXvB1rJWa/WfzVZxRNebuGnGxF1MZ0EZF/vCGeG0izo/wcBdpt
 4Wh3yNMF+4Z0iv1waXS/vEEwbaa3ktph2iPcP8ykxdiIu9qJj9X1DrFV9Ajuad436+x2
 bAWA==
X-Gm-Message-State: ACgBeo1CDx0G+cAtXaqN/+ZwZQ2m465TWw3Jfj/mvffhfEr97oVbdeWm
 1HVAyAVwnchG7DmQMuY9NJNZZ6m3qj6D2Gqn
X-Google-Smtp-Source: AA6agR7Rmx50dIV9K4BlrZSfAApwVdwiD9wN/RXTtFBdZyefRwoE7GoFwsz4UZiwHeGWnrrZOWKFPA==
X-Received: by 2002:adf:fbc7:0:b0:220:6004:18ca with SMTP id
 d7-20020adffbc7000000b00220600418camr25957781wrs.632.1662458996543; 
 Tue, 06 Sep 2022 03:09:56 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 23/23] target/i386: Enable TARGET_TB_PCREL
Date: Tue,  6 Sep 2022 11:09:32 +0100
Message-Id: <20220906100932.343523-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu-param.h     |  1 +
 target/i386/tcg/tcg-cpu.c   |  8 ++--
 target/i386/tcg/translate.c | 86 ++++++++++++++++++++++++++++++-------
 3 files changed, 77 insertions(+), 18 deletions(-)

diff --git a/target/i386/cpu-param.h b/target/i386/cpu-param.h
index 9740bd7abd..51a3f153bf 100644
--- a/target/i386/cpu-param.h
+++ b/target/i386/cpu-param.h
@@ -24,5 +24,6 @@
 #endif
 #define TARGET_PAGE_BITS 12
 #define NB_MMU_MODES 3
+#define TARGET_TB_PCREL 1
 
 #endif
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 76989a5a9d..74333247c5 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -49,9 +49,11 @@ static void x86_cpu_exec_exit(CPUState *cs)
 static void x86_cpu_synchronize_from_tb(CPUState *cs,
                                         const TranslationBlock *tb)
 {
-    X86CPU *cpu = X86_CPU(cs);
-
-    cpu->env.eip = tb_pc(tb) - tb->cs_base;
+    /* The instruction pointer is always up to date with TARGET_TB_PCREL. */
+    if (!TARGET_TB_PCREL) {
+        CPUX86State *env = cs->env_ptr;
+        env->eip = tb_pc(tb) - tb->cs_base;
+    }
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 39bcb7263b..249309ddbc 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -64,6 +64,7 @@
 
 /* global register indexes */
 static TCGv cpu_cc_dst, cpu_cc_src, cpu_cc_src2;
+static TCGv cpu_eip;
 static TCGv_i32 cpu_cc_op;
 static TCGv cpu_regs[CPU_NB_REGS];
 static TCGv cpu_seg_base[6];
@@ -77,6 +78,7 @@ typedef struct DisasContext {
 
     target_ulong pc;       /* pc = eip + cs_base */
     target_ulong cs_base;  /* base of CS segment */
+    target_ulong pc_save;
 
     MemOp aflag;
     MemOp dflag;
@@ -481,7 +483,7 @@ static void gen_add_A0_im(DisasContext *s, int val)
 
 static inline void gen_op_jmp_v(TCGv dest)
 {
-    tcg_gen_st_tl(dest, cpu_env, offsetof(CPUX86State, eip));
+    tcg_gen_mov_tl(cpu_eip, dest);
 }
 
 static inline
@@ -516,24 +518,36 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
     }
 }
 
-static TCGv gen_eip_cur(DisasContext *s)
+static void gen_jmp_im(DisasContext *s, target_ulong eip)
 {
-    return tcg_constant_tl(s->base.pc_next - s->cs_base);
-}
-
-static void gen_jmp_im(DisasContext *s, target_ulong pc)
-{
-    gen_op_jmp_v(tcg_constant_tl(pc));
+    if (TARGET_TB_PCREL) {
+        target_ulong eip_save = s->pc_save - s->cs_base;
+        tcg_gen_addi_tl(cpu_eip, cpu_eip, eip - eip_save);
+    } else {
+        tcg_gen_movi_tl(cpu_eip, eip);
+    }
 }
 
 static void gen_update_eip_cur(DisasContext *s)
 {
     gen_jmp_im(s, s->base.pc_next - s->cs_base);
+    s->pc_save = s->base.pc_next;
 }
 
 static void gen_update_eip_next(DisasContext *s)
 {
     gen_jmp_im(s, s->pc - s->cs_base);
+    s->pc_save = s->pc;
+}
+
+static TCGv gen_eip_cur(DisasContext *s)
+{
+    if (TARGET_TB_PCREL) {
+        gen_update_eip_cur(s);
+        return cpu_eip;
+    } else {
+        return tcg_constant_tl(s->base.pc_next - s->cs_base);
+    }
 }
 
 static int cur_insn_len(DisasContext *s)
@@ -548,12 +562,25 @@ static TCGv_i32 cur_insn_len_i32(DisasContext *s)
 
 static TCGv_i32 eip_next_i32(DisasContext *s)
 {
-    return tcg_constant_i32(s->pc - s->cs_base);
+    if (TARGET_TB_PCREL) {
+        TCGv_i32 ret = tcg_temp_new_i32();
+        tcg_gen_trunc_tl_i32(ret, cpu_eip);
+        tcg_gen_addi_i32(ret, ret, s->pc - s->pc_save);
+        return ret;
+    } else {
+        return tcg_constant_i32(s->pc - s->cs_base);
+    }
 }
 
 static TCGv eip_next_tl(DisasContext *s)
 {
-    return tcg_constant_tl(s->pc - s->cs_base);
+    if (TARGET_TB_PCREL) {
+        TCGv ret = tcg_temp_new();
+        tcg_gen_addi_tl(ret, cpu_eip, s->pc - s->pc_save);
+        return ret;
+    } else {
+        return tcg_constant_tl(s->pc - s->cs_base);
+    }
 }
 
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
@@ -2252,7 +2279,12 @@ static TCGv gen_lea_modrm_1(DisasContext *s, AddressParts a)
         ea = cpu_regs[a.base];
     }
     if (!ea) {
-        tcg_gen_movi_tl(s->A0, a.disp);
+        if (TARGET_TB_PCREL && a.base == -2) {
+            /* With cpu_eip ~= pc_save, the expression is pc-relative. */
+            tcg_gen_addi_tl(s->A0, cpu_eip, a.disp - s->pc_save);
+        } else {
+            tcg_gen_movi_tl(s->A0, a.disp);
+        }
         ea = s->A0;
     } else if (a.disp != 0) {
         tcg_gen_addi_tl(s->A0, ea, a.disp);
@@ -2366,8 +2398,13 @@ static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
 
     if (translator_use_goto_tb(&s->base, pc))  {
         /* jump to same page: we can use a direct jump */
-        tcg_gen_goto_tb(tb_num);
-        gen_jmp_im(s, eip);
+        if (TARGET_TB_PCREL) {
+            gen_jmp_im(s, eip);
+            tcg_gen_goto_tb(tb_num);
+        } else {
+            tcg_gen_goto_tb(tb_num);
+            gen_jmp_im(s, eip);
+        }
         tcg_gen_exit_tb(s->base.tb, tb_num);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
@@ -8571,6 +8608,13 @@ void tcg_x86_init(void)
         [R_EDI] = "edi",
         [R_EBP] = "ebp",
         [R_ESP] = "esp",
+#endif
+    };
+    static const char eip_name[] = {
+#ifdef TARGET_X86_64
+        "rip"
+#else
+        "eip"
 #endif
     };
     static const char seg_base_names[6][8] = {
@@ -8597,6 +8641,7 @@ void tcg_x86_init(void)
                                     "cc_src");
     cpu_cc_src2 = tcg_global_mem_new(cpu_env, offsetof(CPUX86State, cc_src2),
                                      "cc_src2");
+    cpu_eip = tcg_global_mem_new(cpu_env, offsetof(CPUX86State, eip), eip_name);
 
     for (i = 0; i < CPU_NB_REGS; ++i) {
         cpu_regs[i] = tcg_global_mem_new(cpu_env,
@@ -8633,6 +8678,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     int iopl = (flags >> IOPL_SHIFT) & 3;
 
     dc->cs_base = dc->base.tb->cs_base;
+    dc->pc_save = dc->base.pc_next;
     dc->flags = flags;
 #ifndef CONFIG_USER_ONLY
     dc->cpl = cpl;
@@ -8696,9 +8742,14 @@ static void i386_tr_tb_start(DisasContextBase *db, CPUState *cpu)
 static void i386_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
+    target_ulong pc_arg = dc->base.pc_next;
 
     dc->prev_insn_end = tcg_last_op();
-    tcg_gen_insn_start(dc->base.pc_next, dc->cc_op);
+    if (TARGET_TB_PCREL) {
+        pc_arg -= dc->cs_base;
+        pc_arg &= ~TARGET_PAGE_MASK;
+    }
+    tcg_gen_insn_start(pc_arg, dc->cc_op);
 }
 
 static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
@@ -8799,7 +8850,12 @@ void restore_state_to_opc(CPUX86State *env, TranslationBlock *tb,
                           target_ulong *data)
 {
     int cc_op = data[1];
-    env->eip = data[0] - tb->cs_base;
+
+    if (TARGET_TB_PCREL) {
+        env->eip = (env->eip & TARGET_PAGE_MASK) | data[0];
+    } else {
+        env->eip = data[0] - tb->cs_base;
+    }
     if (cc_op != CC_OP_DYNAMIC) {
         env->cc_op = cc_op;
     }
-- 
2.34.1



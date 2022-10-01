Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF725F1CC7
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:31:35 +0200 (CEST)
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedWh-0004m2-0G
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBv-0002fG-SI
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:07 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:37679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBq-0003zv-Tm
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:07 -0400
Received: by mail-qk1-x72d.google.com with SMTP id s9so4414512qkg.4
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nizDZA6P0MGdtrEN9hnUFogHCGHwX8TYMEu5ZF6Sq1o=;
 b=Xe9VmNBnEMlK5e4YcNSCjvLOcPygSRvldirHT7zuZEV+aDgFx6M2QM3tKjLRzD/5mb
 2f/33va/oeUW1lpvtFQRl9tPiAtK6tWfTt1ohHCMXJu/ejBLG6Bi+rVu7ywncUg2IHpD
 ZNtPbzVbRZ3+88jU5PHVhPQaLYpzWoAK7Pn3bvQNcS0rmcsZLo05AELy/b3nBiD8DXSM
 4gtxFS88fh432VeVYP+q3/od6i84yYWwXepxn8q09gSLMxr9HDFu8XLrTE92N3G0RY8V
 ohnbu5i1KlJ19Q/GKnyuWNMpP0sjnXTT+26KTsZaaGzqVukV0gp9TKX/7QVCMAX/urEp
 kXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nizDZA6P0MGdtrEN9hnUFogHCGHwX8TYMEu5ZF6Sq1o=;
 b=VxkQUi9JYdfUO3ywpov8/ZtV+qa7EB18NSjswtDHxbclF5iW5pqYd9wAMchpVoyn8B
 rsBzADdPyJ4uvYdPrnQlD5u8fZEz/tUwsU/ax7p9FB5pHGibYO+OULlMx8gDO8ulyVlP
 SkQMjBi6xcGSVukdJPwIhEX38k4ULjMVcgRhMmk20QikHmswxCOLEVFw5yT/GYPzFb1T
 1Nq6QUmVqhUVb5QFcfAJci8rxzICU57vNXE+g7to+hMhYlU+MBV/6KA/gVugOqZk7qfJ
 Za549vL+JT9RtjNqaP+gDZFeJLFUSc9v7Ye+5y3VGqpFwTMnwxHTyGKOe6FTZkr5p+sB
 Kw5g==
X-Gm-Message-State: ACrzQf2LxN7XoCZd7WgK2/NaRQHOQySZIZTJovryNnEp6S6mJyIG6vow
 FIb8H/n3PPyzcFiPfMJHkXoFyzdcUs3LKFlA
X-Google-Smtp-Source: AMsMyM5PFsyPituaRBlCTigeTQL0QAJ3ZBIXxxSYsi/aqAvFOv/AsVtozCUtYaF5l6JQB42GrDvVAQ==
X-Received: by 2002:a05:620a:4052:b0:6ce:d5bc:a905 with SMTP id
 i18-20020a05620a405200b006ced5bca905mr9604747qko.629.1664633392839; 
 Sat, 01 Oct 2022 07:09:52 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:09:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 05/26] target/i386: Create gen_update_eip_cur
Date: Sat,  1 Oct 2022 07:09:14 -0700
Message-Id: <20221001140935.465607-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Like gen_update_cc_op, sync EIP before doing something
that could raise an exception.  Replace all gen_jmp_im
that use s->base.pc_next.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 52 ++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5a9c3b1e71..85253e1e17 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -511,10 +511,14 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
     }
 }
 
-static inline void gen_jmp_im(DisasContext *s, target_ulong pc)
+static void gen_jmp_im(DisasContext *s, target_ulong pc)
 {
-    tcg_gen_movi_tl(s->tmp0, pc);
-    gen_op_jmp_v(s->tmp0);
+    gen_op_jmp_v(tcg_constant_tl(pc));
+}
+
+static void gen_update_eip_cur(DisasContext *s)
+{
+    gen_jmp_im(s, s->base.pc_next - s->cs_base);
 }
 
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
@@ -703,7 +707,7 @@ static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
         target_ulong next_eip = s->pc - s->cs_base;
 
         gen_update_cc_op(s);
-        gen_jmp_im(s, cur_eip);
+        gen_update_eip_cur(s);
         if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
             svm_flags |= SVM_IOIO_REP_MASK;
         }
@@ -1335,7 +1339,7 @@ static void gen_helper_fp_arith_STN_ST0(int op, int opreg)
 static void gen_exception(DisasContext *s, int trapno)
 {
     gen_update_cc_op(s);
-    gen_jmp_im(s, s->base.pc_next - s->cs_base);
+    gen_update_eip_cur(s);
     gen_helper_raise_exception(cpu_env, tcg_const_i32(trapno));
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -2630,7 +2634,7 @@ static void gen_unknown_opcode(CPUX86State *env, DisasContext *s)
 static void gen_interrupt(DisasContext *s, int intno)
 {
     gen_update_cc_op(s);
-    gen_jmp_im(s, s->base.pc_next - s->cs_base);
+    gen_update_eip_cur(s);
     gen_helper_raise_interrupt(cpu_env, tcg_constant_i32(intno),
                                tcg_constant_i32(s->pc - s->base.pc_next));
     s->base.is_jmp = DISAS_NORETURN;
@@ -6831,7 +6835,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     do_lret:
         if (PE(s) && !VM86(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
                                       tcg_const_i32(val));
         } else {
@@ -7327,7 +7331,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (prefixes & PREFIX_REPZ) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_pause(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
         }
@@ -7353,7 +7357,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (CODE64(s))
             goto illegal_op;
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         gen_helper_into(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
         break;
 #ifdef WANT_ICEBP
@@ -7460,7 +7464,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x132: /* rdmsr */
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             if (b & 2) {
                 gen_helper_rdmsr(cpu_env);
             } else {
@@ -7472,7 +7476,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x131: /* rdtsc */
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
@@ -7483,7 +7487,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x133: /* rdpmc */
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         gen_helper_rdpmc(cpu_env);
         s->base.is_jmp = DISAS_NORETURN;
         break;
@@ -7513,7 +7517,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x105: /* syscall */
         /* XXX: is it usable in real mode ? */
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
         /* TF handling for the syscall insn is different. The TF bit is  checked
            after the syscall insn completes. This allows #DB to not be
@@ -7539,13 +7543,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 #endif
     case 0x1a2: /* cpuid */
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         gen_helper_cpuid(cpu_env);
         break;
     case 0xf4: /* hlt */
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
         }
@@ -7642,7 +7646,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
             gen_extu(s->aflag, s->A0);
             gen_add_A0_ds_seg(s);
@@ -7654,7 +7658,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
             break;
@@ -7732,7 +7736,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
                              tcg_const_i32(s->pc - s->base.pc_next));
             tcg_gen_exit_tb(NULL, 0);
@@ -7744,7 +7748,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmmcall(cpu_env);
             break;
 
@@ -7756,7 +7760,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmload(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7768,7 +7772,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmsave(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7794,7 +7798,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_clgi(cpu_env);
             break;
 
@@ -7940,7 +7944,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
             }
@@ -8853,7 +8857,7 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     if (dc->base.is_jmp == DISAS_TOO_MANY) {
-        gen_jmp_im(dc, dc->base.pc_next - dc->cs_base);
+        gen_update_eip_cur(dc);
         gen_eob(dc);
     }
 }
-- 
2.34.1



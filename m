Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EF15AE56A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:32:43 +0200 (CEST)
Received: from localhost ([::1]:42586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVso-0001PZ-G5
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWY-00009H-Nf
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:43 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWW-0003YD-Mt
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:42 -0400
Received: by mail-wr1-x433.google.com with SMTP id bq9so1754545wrb.4
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=XY3jiDR+YnmV+m9xmzJFb65HCrzmHvlIwh0Te8PR9uk=;
 b=FECEh/M9nlqgQI9aCuzuURkNn+Ln0nBITLMCdbF4Ib/EsEkLj3Ndp4qyVMorIX0cCQ
 XDv7V/zHe1ooNTIppg0rd6fQI4o5mEe+MFp/icJh6Q1S/H6u58kcUGeYUB83g5UiRX8P
 hbeiYN4DLmN4/RR2xCPnzj2wRGRPGm2cuhBK4xKBXrUbSzv9axxNpsnyeNBGX8HSwJOQ
 wS3KYIyxGQ3kXpV52Nz8i2QUJcyWYkB6hGqhfMfq4WsKm73vxKgFX3RSpg9d6chNhMRI
 YNMD+6Tr3YIz1WJtJ80uk8Czr7WAvt/cgB3oipvbJFhFK87nwpvcjv1p9dsgEd9xDsvK
 mKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XY3jiDR+YnmV+m9xmzJFb65HCrzmHvlIwh0Te8PR9uk=;
 b=reUUBkVP6xlrxs9+Q1GZkpgCoSxGZJ4QauSA3zMXfQZRtFEIwKEywBurtdHEmT6G4n
 ndht4ejSkQ8oc5lpqoANLqvn0EH5/HdlGYOtdi24q460ELQ6hhnyZxB0AvCvMaWyOS+I
 xpNOVUedy3q0I6A37b9vOcJsj2HddOWzQ60l0NgxOJvF9eaII02bHlEEXu8333kwhYO2
 0K0G3F6Ws1lx6AQK6C1hDJfvlaVyulknS911zBIHvrtekrggwFTvk+k9ybSp60oL/qNS
 2dRlOXB7T6Eop26N08Yr9GTW4TlwDK5OtJLvZd1k1IrI2+EkydKXrwakYTWS4seaww9T
 eV5g==
X-Gm-Message-State: ACgBeo2s32sZ7+aye8QG5bp3rZLB2a9wLqE6AwkNvS5UDYhG4Ceix2oB
 YV6FVL2EdNJ0VjJjvl2558cDd9aBbxXL+Hjo
X-Google-Smtp-Source: AA6agR4P3Hn9PguMwvuk+V/g/hZAL67XIO0FGqXzxgrZcItjGjDnbPYOTZrLPed/y7C89QMjgEneZA==
X-Received: by 2002:a5d:464e:0:b0:228:c179:6b0a with SMTP id
 j14-20020a5d464e000000b00228c1796b0amr3545767wrs.402.1662458979034; 
 Tue, 06 Sep 2022 03:09:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 05/23] target/i386: Create gen_update_eip_cur
Date: Tue,  6 Sep 2022 11:09:14 +0100
Message-Id: <20220906100932.343523-6-richard.henderson@linaro.org>
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

Like gen_update_cc_op, sync EIP before doing something
that could raise an exception.  Replace all gen_jmp_im
that use s->base.pc_next.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 52 ++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 0210382f77..83cb925571 100644
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
@@ -2605,7 +2609,7 @@ static void gen_unknown_opcode(CPUX86State *env, DisasContext *s)
 static void gen_interrupt(DisasContext *s, int intno)
 {
     gen_update_cc_op(s);
-    gen_jmp_im(s, s->base.pc_next - s->cs_base);
+    gen_update_eip_cur(s);
     gen_helper_raise_interrupt(cpu_env, tcg_constant_i32(intno),
                                tcg_constant_i32(s->pc - s->base.pc_next));
     s->base.is_jmp = DISAS_NORETURN;
@@ -6796,7 +6800,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     do_lret:
         if (PE(s) && !VM86(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
                                       tcg_const_i32(val));
         } else {
@@ -7292,7 +7296,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (prefixes & PREFIX_REPZ) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_pause(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
         }
@@ -7318,7 +7322,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (CODE64(s))
             goto illegal_op;
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         gen_helper_into(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
         break;
 #ifdef WANT_ICEBP
@@ -7425,7 +7429,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x132: /* rdmsr */
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             if (b & 2) {
                 gen_helper_rdmsr(cpu_env);
             } else {
@@ -7437,7 +7441,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x131: /* rdtsc */
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
@@ -7448,7 +7452,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x133: /* rdpmc */
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         gen_helper_rdpmc(cpu_env);
         s->base.is_jmp = DISAS_NORETURN;
         break;
@@ -7478,7 +7482,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x105: /* syscall */
         /* XXX: is it usable in real mode ? */
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
         /* TF handling for the syscall insn is different. The TF bit is  checked
            after the syscall insn completes. This allows #DB to not be
@@ -7504,13 +7508,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -7607,7 +7611,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
             gen_extu(s->aflag, s->A0);
             gen_add_A0_ds_seg(s);
@@ -7619,7 +7623,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
             break;
@@ -7697,7 +7701,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
                              tcg_const_i32(s->pc - s->base.pc_next));
             tcg_gen_exit_tb(NULL, 0);
@@ -7709,7 +7713,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmmcall(cpu_env);
             break;
 
@@ -7721,7 +7725,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmload(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7733,7 +7737,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmsave(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7759,7 +7763,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_clgi(cpu_env);
             break;
 
@@ -7905,7 +7909,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
             }
@@ -8818,7 +8822,7 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     if (dc->base.is_jmp == DISAS_TOO_MANY) {
-        gen_jmp_im(dc, dc->base.pc_next - dc->cs_base);
+        gen_update_eip_cur(dc);
         gen_eob(dc);
     }
 }
-- 
2.34.1



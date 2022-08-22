Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C113459CC80
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:51:11 +0200 (CEST)
Received: from localhost ([::1]:54816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHCI-0004eG-RF
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvB-0005oz-Rl
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:29 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGv8-0007FB-Vw
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:29 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r69so10781032pgr.2
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=xieXJDbaGMET8lCcNrHn8au1fAE3fNDPoQPAmokw8bA=;
 b=Wj78MifH39tuYhmgChP6taqS0KMbxuEf9kcZOGF2ytOph0hl1Yi0ww/Hf/dn1/ryBE
 5GZnAFlTNrMbVsJkBmN/eiSAijqYusWof5RcUDtiKlRtknmy4AHzQiErEP0VCSxwPy06
 13qQqG7WEmYDlKj4T/ePyH43DKU3f4mBjmcjcvS5EWMykUUIeMYqWZQjBaWZ98H6eMWp
 DMc2Q6XeozbbsFBLF5warlN3/hS+O0oGpHvxsFKkGA6nHzXwF+dipFAO19RTnmsJrTGB
 MD8Ok3hQhkD1SHL/Tqh18G+0ZNaGUj5KeLwm1oOQHyT2ovyZkyE9ny4aNitCdWkxG0XX
 jMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=xieXJDbaGMET8lCcNrHn8au1fAE3fNDPoQPAmokw8bA=;
 b=M59v5TX/qOlNG4aDBADnEUAS2A7uyHkFIvk9ZmzNvT8/PrYEu0ZkqaHkRwVBNAnGw/
 dp+p6kG1T71sMhYmO4nOThsuXZ+xYbxignpZPLHWbgjzp4rx1atnDnIp3SvoCkgIlT9y
 xET7Rq3wfWtJwv8Tl2bQTjW28v6Xn/I0O9xNSa37Css/cB9znlXgro/lRgO5UknXghft
 SJ1B6yfhu6MF41c1whl5YXBf2oQjtIhJwuK8r0x389U+LtjCydLtzNxtxX6CLvozaVGE
 uuhqrTTp/4SzIwXea89fao72RSdg4xDwSfxSVk4mBJLSmvPDY57TcYmVzrriDU4Kdxh9
 tr8w==
X-Gm-Message-State: ACgBeo0jBLj9Jf5Ssiz2Hx23zIDw7UE83DtoWZVPq9DJzgavl7z57PgV
 0fqo73fQ1HnKFFlas7tIF2soCyOtvABMAQ==
X-Google-Smtp-Source: AA6agR6pqlmM90/PTbPQ9JJxP3fIPDIoOdMI+LUF/scScxZGgOcaEh6hJzzkq22yAA9IBXGZZIzy+Q==
X-Received: by 2002:aa7:8a4d:0:b0:52e:2a8b:46a with SMTP id
 n13-20020aa78a4d000000b0052e2a8b046amr22948870pfa.64.1661211205406; 
 Mon, 22 Aug 2022 16:33:25 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/22] target/i386: Create gen_update_eip_cur
Date: Mon, 22 Aug 2022 16:33:00 -0700
Message-Id: <20220822233318.1728621-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
index d3b16ea28c..78b7641786 100644
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
@@ -6683,7 +6687,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     do_lret:
         if (PE(s) && !VM86(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
                                       tcg_const_i32(val));
         } else {
@@ -7179,7 +7183,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (prefixes & PREFIX_REPZ) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_pause(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
         }
@@ -7205,7 +7209,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (CODE64(s))
             goto illegal_op;
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         gen_helper_into(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
         break;
 #ifdef WANT_ICEBP
@@ -7312,7 +7316,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x132: /* rdmsr */
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             if (b & 2) {
                 gen_helper_rdmsr(cpu_env);
             } else {
@@ -7324,7 +7328,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x131: /* rdtsc */
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
@@ -7335,7 +7339,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x133: /* rdpmc */
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         gen_helper_rdpmc(cpu_env);
         s->base.is_jmp = DISAS_NORETURN;
         break;
@@ -7365,7 +7369,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x105: /* syscall */
         /* XXX: is it usable in real mode ? */
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_update_eip_cur(s);
         gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
         /* TF handling for the syscall insn is different. The TF bit is  checked
            after the syscall insn completes. This allows #DB to not be
@@ -7391,13 +7395,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -7494,7 +7498,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
             gen_extu(s->aflag, s->A0);
             gen_add_A0_ds_seg(s);
@@ -7506,7 +7510,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
             break;
@@ -7584,7 +7588,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
                              tcg_const_i32(s->pc - s->base.pc_next));
             tcg_gen_exit_tb(NULL, 0);
@@ -7596,7 +7600,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmmcall(cpu_env);
             break;
 
@@ -7608,7 +7612,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmload(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7620,7 +7624,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_vmsave(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7646,7 +7650,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             gen_helper_clgi(cpu_env);
             break;
 
@@ -7792,7 +7796,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_update_eip_cur(s);
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
             }
@@ -8705,7 +8709,7 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     if (dc->base.is_jmp == DISAS_TOO_MANY) {
-        gen_jmp_im(dc, dc->base.pc_next - dc->cs_base);
+        gen_update_eip_cur(dc);
         gen_eob(dc);
     }
 }
-- 
2.34.1



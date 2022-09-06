Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421185AE554
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:27:53 +0200 (CEST)
Received: from localhost ([::1]:54148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVo8-0003ji-8S
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWX-00008t-3u
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:42 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:46735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWU-0003YP-9K
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:40 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so7123749wms.5
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=g1YA9FxQccmu2H8CMS7h3AeGXoljRh9DUavFTIAc29Y=;
 b=UKGee/qqU9yr2uWwfL+h6VdkgfSAIz1NI+rto93B3nADS2Ahdcb0wxor5JheQoqMe9
 O6EoJyIpOliT+wxiyTIIOQi6hkt/QfTTxHbCGTMHmpr7rVZ/ZCpcQmjqyHdX5oaqs0tV
 2hhcxI/AaBNiMnNiL1noaNJ+X7E3362eyJg8S1g242QEGGztSWoUxkeJrXThE/cDp15C
 EetBzwVsjvfQqnp08d9T3ehzBd9U8aI8j0jMYElWjIi/cAY0EGjC0SjBRQrrgUC0rwQX
 FrqZfIcIgWJZXtde6C1eYcFyfCzQfNaUgd5eUWu5H0nohABGTk50D4JVAsghLNpSTGs0
 LDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=g1YA9FxQccmu2H8CMS7h3AeGXoljRh9DUavFTIAc29Y=;
 b=a5Aq69q0wXdYNeD9UaJ0gRcKuwSwPjmsXtEtvrWL6/tbCs+acFZ/hHFKJLdjIjXUs0
 H8eS0sZPkpEaXMSbfyMXZRa0HYXtvd2u7lhsrNpEAoMO/INuuPhaK0g9ZdxNLR4w4h4W
 69X7zFDv5PhsyB8HX0AqY7cYEQdHfAtMxSY1OsWiKOHGfZpV7Lp4dy05qlndeaIcJS1q
 c08eoawH5MQ6vZcVAz4ryb1MWuPYrXJPQr/DTXf1bTuXNScnKkQjt22ZJfdjnym+dq3V
 es8qolmvinfheNZvQu3F6n5aSWiSihj7HM1oZmCKojGvk5zn0EBi54I4rbEa3D07HjVN
 7xog==
X-Gm-Message-State: ACgBeo2rqMfHuxDBLrWaAr+RABisffRLy1Djiyy3ZLqO5r0dZC7sGfJa
 yCorhJMwMLmRk99a+p5MQFViUMKQHsV6Xq2h
X-Google-Smtp-Source: AA6agR5AC3l9xigy0v/RzxDlfTInImRrLyNYne9eN5/Kyd7dHxHaqPE38zN/HCzJkwc+OgYIf1Y4aw==
X-Received: by 2002:a1c:c91a:0:b0:3a6:38bf:2c36 with SMTP id
 f26-20020a1cc91a000000b003a638bf2c36mr13347306wmb.38.1662458975433; 
 Tue, 06 Sep 2022 03:09:35 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 01/23] target/i386: Remove pc_start
Date: Tue,  6 Sep 2022 11:09:10 +0100
Message-Id: <20220906100932.343523-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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

The DisasContext member and the disas_insn local variable of
the same name are identical to DisasContextBase.pc_next.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 114 +++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 54 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d6420df31d..1e24bb2985 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -76,7 +76,6 @@ typedef struct DisasContext {
     DisasContextBase base;
 
     target_ulong pc;       /* pc = eip + cs_base */
-    target_ulong pc_start; /* pc at TB entry */
     target_ulong cs_base;  /* base of CS segment */
 
     MemOp aflag;
@@ -1345,13 +1344,13 @@ static void gen_exception(DisasContext *s, int trapno, target_ulong cur_eip)
    the instruction is known, but it isn't allowed in the current cpu mode.  */
 static void gen_illegal_opcode(DisasContext *s)
 {
-    gen_exception(s, EXCP06_ILLOP, s->pc_start - s->cs_base);
+    gen_exception(s, EXCP06_ILLOP, s->base.pc_next - s->cs_base);
 }
 
 /* Generate #GP for the current instruction. */
 static void gen_exception_gpf(DisasContext *s)
 {
-    gen_exception(s, EXCP0D_GPF, s->pc_start - s->cs_base);
+    gen_exception(s, EXCP0D_GPF, s->base.pc_next - s->cs_base);
 }
 
 /* Check for cpl == 0; if not, raise #GP and return false. */
@@ -2016,7 +2015,7 @@ static uint64_t advance_pc(CPUX86State *env, DisasContext *s, int num_bytes)
     }
 
     s->pc += num_bytes;
-    if (unlikely(s->pc - s->pc_start > X86_MAX_INSN_LENGTH)) {
+    if (unlikely(s->pc - s->base.pc_next > X86_MAX_INSN_LENGTH)) {
         /* If the instruction's 16th byte is on a different page than the 1st, a
          * page fault on the second page wins over the general protection fault
          * caused by the instruction being too long.
@@ -2589,7 +2588,7 @@ static void gen_unknown_opcode(CPUX86State *env, DisasContext *s)
     if (qemu_loglevel_mask(LOG_UNIMP)) {
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
-            target_ulong pc = s->pc_start, end = s->pc;
+            target_ulong pc = s->base.pc_next, end = s->pc;
 
             fprintf(logfile, "ILLOPC: " TARGET_FMT_lx ":", pc);
             for (; pc < end; ++pc) {
@@ -3199,8 +3198,7 @@ static const struct SSEOpHelper_table7 sse_op_table7[256] = {
         goto illegal_op; \
     } while (0)
 
-static void gen_sse(CPUX86State *env, DisasContext *s, int b,
-                    target_ulong pc_start)
+static void gen_sse(CPUX86State *env, DisasContext *s, int b)
 {
     int b1, op1_offset, op2_offset, is_xmm, val;
     int modrm, mod, rm, reg;
@@ -3242,7 +3240,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
     }
     /* simple MMX/SSE operation */
     if (s->flags & HF_TS_MASK) {
-        gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+        gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
         return;
     }
     if (s->flags & HF_EM_MASK) {
@@ -4675,11 +4673,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     MemOp ot, aflag, dflag;
     int modrm, reg, rm, mod, op, opreg, val;
     target_ulong next_eip, tval;
-    target_ulong pc_start = s->base.pc_next;
     bool orig_cc_op_dirty = s->cc_op_dirty;
     CCOp orig_cc_op = s->cc_op;
 
-    s->pc_start = s->pc = pc_start;
+    s->pc = s->base.pc_next;
     s->override = -1;
 #ifdef TARGET_X86_64
     s->rex_w = false;
@@ -4703,7 +4700,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         s->base.num_insns--;
         tcg_remove_ops_after(s->prev_insn_end);
         s->base.is_jmp = DISAS_TOO_MANY;
-        return pc_start;
+        return s->base.pc_next;
     default:
         g_assert_not_reached();
     }
@@ -6044,7 +6041,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
                 /* if CR0.EM or CR0.TS are set, generate an FPU exception */
                 /* XXX: what to do if illegal op ? */
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
                 break;
             }
             modrm = x86_ldub_code(env, s);
@@ -6585,7 +6582,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                                offsetof(CPUX86State, segs[R_CS].selector));
                 tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
                                  offsetof(CPUX86State, fpcs));
-                tcg_gen_st_tl(tcg_constant_tl(pc_start - s->cs_base),
+                tcg_gen_st_tl(tcg_constant_tl(s->base.pc_next - s->cs_base),
                               cpu_env, offsetof(CPUX86State, fpip));
             }
         }
@@ -6597,7 +6594,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xa5:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_movs(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_movs(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base);
         } else {
             gen_movs(s, ot);
         }
@@ -6607,7 +6605,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xab:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_stos(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_stos(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base);
         } else {
             gen_stos(s, ot);
         }
@@ -6616,7 +6615,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xad:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_lods(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_lods(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base);
         } else {
             gen_lods(s, ot);
         }
@@ -6625,9 +6625,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xaf:
         ot = mo_b_d(b, dflag);
         if (prefixes & PREFIX_REPNZ) {
-            gen_repz_scas(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 1);
+            gen_repz_scas(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base, 1);
         } else if (prefixes & PREFIX_REPZ) {
-            gen_repz_scas(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 0);
+            gen_repz_scas(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base, 0);
         } else {
             gen_scas(s, ot);
         }
@@ -6637,9 +6639,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xa7:
         ot = mo_b_d(b, dflag);
         if (prefixes & PREFIX_REPNZ) {
-            gen_repz_cmps(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 1);
+            gen_repz_cmps(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base, 1);
         } else if (prefixes & PREFIX_REPZ) {
-            gen_repz_cmps(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 0);
+            gen_repz_cmps(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base, 0);
         } else {
             gen_cmps(s, ot);
         }
@@ -6657,7 +6661,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_io_start();
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_ins(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_ins(s, ot, s->base.pc_next - s->cs_base,
+                         s->pc - s->cs_base);
             /* jump generated by gen_repz_ins */
         } else {
             gen_ins(s, ot);
@@ -6678,7 +6683,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_io_start();
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_outs(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_repz_outs(s, ot, s->base.pc_next - s->cs_base,
+                          s->pc - s->cs_base);
             /* jump generated by gen_repz_outs */
         } else {
             gen_outs(s, ot);
@@ -6790,7 +6796,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     do_lret:
         if (PE(s) && !VM86(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
                                       tcg_const_i32(val));
         } else {
@@ -7260,7 +7266,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             goto illegal_op;
         val = x86_ldub_code(env, s);
         if (val == 0) {
-            gen_exception(s, EXCP00_DIVZ, pc_start - s->cs_base);
+            gen_exception(s, EXCP00_DIVZ, s->base.pc_next - s->cs_base);
         } else {
             gen_helper_aam(cpu_env, tcg_const_i32(val));
             set_cc_op(s, CC_OP_LOGICB);
@@ -7286,34 +7292,34 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (prefixes & PREFIX_REPZ) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - pc_start));
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
     case 0x9b: /* fwait */
         if ((s->flags & (HF_MP_MASK | HF_TS_MASK)) ==
             (HF_MP_MASK | HF_TS_MASK)) {
-            gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+            gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
         } else {
             gen_helper_fwait(cpu_env);
         }
         break;
     case 0xcc: /* int3 */
-        gen_interrupt(s, EXCP03_INT3, pc_start - s->cs_base, s->pc - s->cs_base);
+        gen_interrupt(s, EXCP03_INT3, s->base.pc_next - s->cs_base, s->pc - s->cs_base);
         break;
     case 0xcd: /* int N */
         val = x86_ldub_code(env, s);
         if (check_vm86_iopl(s)) {
-            gen_interrupt(s, val, pc_start - s->cs_base, s->pc - s->cs_base);
+            gen_interrupt(s, val, s->base.pc_next - s->cs_base, s->pc - s->cs_base);
         }
         break;
     case 0xce: /* into */
         if (CODE64(s))
             goto illegal_op;
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
-        gen_helper_into(cpu_env, tcg_const_i32(s->pc - pc_start));
+        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_helper_into(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
         break;
 #ifdef WANT_ICEBP
     case 0xf1: /* icebp (undocumented, exits to external debugger) */
@@ -7419,7 +7425,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x132: /* rdmsr */
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             if (b & 2) {
                 gen_helper_rdmsr(cpu_env);
             } else {
@@ -7431,7 +7437,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x131: /* rdtsc */
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
+        gen_jmp_im(s, s->base.pc_next - s->cs_base);
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
@@ -7442,7 +7448,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x133: /* rdpmc */
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
+        gen_jmp_im(s, s->base.pc_next - s->cs_base);
         gen_helper_rdpmc(cpu_env);
         s->base.is_jmp = DISAS_NORETURN;
         break;
@@ -7472,8 +7478,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x105: /* syscall */
         /* XXX: is it usable in real mode ? */
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
-        gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - pc_start));
+        gen_jmp_im(s, s->base.pc_next - s->cs_base);
+        gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
         /* TF handling for the syscall insn is different. The TF bit is  checked
            after the syscall insn completes. This allows #DB to not be
            generated after one has entered CPL0 if TF is set in FMASK.  */
@@ -7498,14 +7504,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #endif
     case 0x1a2: /* cpuid */
         gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
+        gen_jmp_im(s, s->base.pc_next - s->cs_base);
         gen_helper_cpuid(cpu_env);
         break;
     case 0xf4: /* hlt */
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - pc_start));
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
@@ -7601,7 +7607,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
             gen_extu(s->aflag, s->A0);
             gen_add_A0_ds_seg(s);
@@ -7613,8 +7619,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - pc_start));
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
+            gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
             s->base.is_jmp = DISAS_NORETURN;
             break;
 
@@ -7691,9 +7697,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
-                             tcg_const_i32(s->pc - pc_start));
+                             tcg_const_i32(s->pc - s->base.pc_next));
             tcg_gen_exit_tb(NULL, 0);
             s->base.is_jmp = DISAS_NORETURN;
             break;
@@ -7703,7 +7709,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             gen_helper_vmmcall(cpu_env);
             break;
 
@@ -7715,7 +7721,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             gen_helper_vmload(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7727,7 +7733,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             gen_helper_vmsave(cpu_env, tcg_const_i32(s->aflag - 1));
             break;
 
@@ -7753,7 +7759,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             gen_helper_clgi(cpu_env);
             break;
 
@@ -7899,7 +7905,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_jmp_im(s, s->base.pc_next - s->cs_base);
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
             }
@@ -8351,7 +8357,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8364,7 +8370,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8376,7 +8382,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->flags & HF_TS_MASK) {
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8389,7 +8395,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->flags & HF_TS_MASK) {
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
                 break;
             }
             gen_helper_update_mxcsr(cpu_env);
@@ -8598,7 +8604,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1c2:
     case 0x1c4 ... 0x1c6:
     case 0x1d0 ... 0x1fe:
-        gen_sse(env, s, b, pc_start);
+        gen_sse(env, s, b);
         break;
     default:
         goto unknown_op;
-- 
2.34.1



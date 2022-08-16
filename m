Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A3E596432
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 23:07:26 +0200 (CEST)
Received: from localhost ([::1]:53340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3mW-0005t5-Us
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 17:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3H9-00059i-Ho
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:59 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:33706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3H1-0004b6-85
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:59 -0400
Received: by mail-oi1-x235.google.com with SMTP id n133so13346296oib.0
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=bUME8MpMD2f2x488JPZ5xVT2EqUsTLKQqkc1TJ7vid4=;
 b=ru9piWj1DG/8wGV3czJ4jOYtZrnk0GcFSYAZqwIRX8ghXOZwUQjz1EAYViYOqPRnSw
 R5Z/z1aBYfsGr8LGO/72L8Ny5mCgNosFfeap2YbV56nGlTMVp810766pwiZhugDlhP4C
 kA/jID++bYHRYfu2aDkeffDRUel23iVlEzq6Kz+FnlM11OdCaH0spF8W7velQUacQ+mH
 smDWCbst3ouEu4VK8GIwWQwbrwT0vYxvm/ViA370zzJOCq/P3q6+zYB+zy4FczT/iN0p
 KBH6G4UFeJ8nl6iy9qKxejDxpldca1k/DqyQU04i74DJAdFrAwguc1vlZRL0OwV2G71c
 i9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=bUME8MpMD2f2x488JPZ5xVT2EqUsTLKQqkc1TJ7vid4=;
 b=4AgZPI4LxZOUKPIijs8D6CrQRBBrSePLmKGQSF0hb06B2aSOd1TihdOB3E1+pJxMmq
 YepQC5bciFsi0pvhallst3JivWoJa7ycSMYSo8N0Wg8IiHclJuikJAEREq6i0fvOOCF0
 SIphmiqUTse/BhfPb3pxXCjx8rAxO4ESh5BNhNutpnd8GdHSSjK7PnAxTMl7LOi3Gt7W
 WUv1l90mjQ4a1MVDYiX+5AgZDU66Z+GBnTRnYWqckufnFNmmS4Uo16aVgq461larOWfb
 vSIKQEwn1VNJPO+jwSo+QsXsKH9/khN4PKqYyyYAs51cCZ/BaL+3FU3cxCvnBfAvZqru
 Fegw==
X-Gm-Message-State: ACgBeo3matiAiI2nG4lemIj2tgT9PjfK55m2OV55TJxWVhV9bt5XqdBY
 FF+H031lXrfYBrZM1u/8VZrtEyo9u7jzbw==
X-Google-Smtp-Source: AA6agR5QLQ38iVVxAVPjoNIpiOx9gY9oedePUZqozsaZpMd+dBlYsL+s3+o7fjud/zIRdAQNjhgRhg==
X-Received: by 2002:a54:480a:0:b0:344:9d67:f3de with SMTP id
 j10-20020a54480a000000b003449d67f3demr143485oij.236.1660682084587; 
 Tue, 16 Aug 2022 13:34:44 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 17/33] accel/tcg: Add pc and host_pc params to
 gen_intermediate_code
Date: Tue, 16 Aug 2022 15:33:44 -0500
Message-Id: <20220816203400.161187-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Pass these along to translator_loop -- pc may be used instead
of tb->pc, and host_pc is currently unused.  Adjust all targets
at one time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h       |  1 -
 include/exec/translator.h     | 24 ++++++++++++++++++++----
 accel/tcg/translate-all.c     |  3 ++-
 accel/tcg/translator.c        |  9 +++++----
 target/alpha/translate.c      |  5 +++--
 target/arm/translate.c        |  5 +++--
 target/avr/translate.c        |  5 +++--
 target/cris/translate.c       |  5 +++--
 target/hexagon/translate.c    |  6 ++++--
 target/hppa/translate.c       |  5 +++--
 target/i386/tcg/translate.c   |  5 +++--
 target/loongarch/translate.c  |  6 ++++--
 target/m68k/translate.c       |  5 +++--
 target/microblaze/translate.c |  5 +++--
 target/mips/tcg/translate.c   |  5 +++--
 target/nios2/translate.c      |  5 +++--
 target/openrisc/translate.c   |  6 ++++--
 target/ppc/translate.c        |  5 +++--
 target/riscv/translate.c      |  5 +++--
 target/rx/translate.c         |  5 +++--
 target/s390x/tcg/translate.c  |  5 +++--
 target/sh4/translate.c        |  5 +++--
 target/sparc/translate.c      |  5 +++--
 target/tricore/translate.c    |  6 ++++--
 target/xtensa/translate.c     |  6 ++++--
 25 files changed, 95 insertions(+), 52 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 7a6dc44d86..4ad166966b 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -39,7 +39,6 @@ typedef ram_addr_t tb_page_addr_t;
 #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
 #endif
 
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns);
 void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
                           target_ulong *data);
 
diff --git a/include/exec/translator.h b/include/exec/translator.h
index 45b9268ca4..69db0f5c21 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -26,6 +26,19 @@
 #include "exec/translate-all.h"
 #include "tcg/tcg.h"
 
+/**
+ * gen_intermediate_code
+ * @cpu: cpu context
+ * @tb: translation block
+ * @max_insns: max number of instructions to translate
+ * @pc: guest virtual program counter address
+ * @host_pc: host physical program counter address
+ *
+ * This function must be provided by the target, which should create
+ * the target-specific DisasContext, and then invoke translator_loop.
+ */
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc);
 
 /**
  * DisasJumpType:
@@ -123,11 +136,13 @@ typedef struct TranslatorOps {
 
 /**
  * translator_loop:
- * @ops: Target-specific operations.
- * @db: Disassembly context.
  * @cpu: Target vCPU.
  * @tb: Translation block.
  * @max_insns: Maximum number of insns to translate.
+ * @pc: guest virtual program counter address
+ * @host_pc: host physical program counter address
+ * @ops: Target-specific operations.
+ * @db: Disassembly context.
  *
  * Generic translator loop.
  *
@@ -141,8 +156,9 @@ typedef struct TranslatorOps {
  * - When single-stepping is enabled (system-wide or on the current vCPU).
  * - When too many instructions have been translated.
  */
-void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
-                     CPUState *cpu, TranslationBlock *tb, int max_insns);
+void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
+                     target_ulong pc, void *host_pc,
+                     const TranslatorOps *ops, DisasContextBase *db);
 
 void translator_loop_temp_check(DisasContextBase *db);
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index a5ca424f13..7360ecdb38 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -46,6 +46,7 @@
 
 #include "exec/cputlb.h"
 #include "exec/translate-all.h"
+#include "exec/translator.h"
 #include "qemu/bitmap.h"
 #include "qemu/qemu-print.h"
 #include "qemu/timer.h"
@@ -1391,7 +1392,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tcg_func_start(tcg_ctx);
 
     tcg_ctx->cpu = env_cpu(env);
-    gen_intermediate_code(cpu, tb, max_insns);
+    gen_intermediate_code(cpu, tb, max_insns, pc, host_pc);
     assert(tb->size != 0);
     tcg_ctx->cpu = NULL;
     max_insns = tb->icount;
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index fe7af9b943..3eef30d93a 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -51,16 +51,17 @@ static inline void translator_page_protect(DisasContextBase *dcbase,
 #endif
 }
 
-void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
-                     CPUState *cpu, TranslationBlock *tb, int max_insns)
+void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
+                     target_ulong pc, void *host_pc,
+                     const TranslatorOps *ops, DisasContextBase *db)
 {
     uint32_t cflags = tb_cflags(tb);
     bool plugin_enabled;
 
     /* Initialize DisasContext */
     db->tb = tb;
-    db->pc_first = tb->pc;
-    db->pc_next = db->pc_first;
+    db->pc_first = pc;
+    db->pc_next = pc;
     db->is_jmp = DISAS_NEXT;
     db->num_insns = 0;
     db->max_insns = max_insns;
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 9af1627079..6766350f56 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -3043,10 +3043,11 @@ static const TranslatorOps alpha_tr_ops = {
     .disas_log          = alpha_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext dc;
-    translator_loop(&alpha_tr_ops, &dc.base, cpu, tb, max_insns);
+    translator_loop(cpu, tb, max_insns, pc, host_pc, &alpha_tr_ops, &dc.base);
 }
 
 void restore_state_to_opc(CPUAlphaState *env, TranslationBlock *tb,
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ad617b9948..9474e4b44b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9892,7 +9892,8 @@ static const TranslatorOps thumb_translator_ops = {
 };
 
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext dc = { };
     const TranslatorOps *ops = &arm_translator_ops;
@@ -9907,7 +9908,7 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns)
     }
 #endif
 
-    translator_loop(ops, &dc.base, cpu, tb, max_insns);
+    translator_loop(cpu, tb, max_insns, pc, host_pc, ops, &dc.base);
 }
 
 void restore_state_to_opc(CPUARMState *env, TranslationBlock *tb,
diff --git a/target/avr/translate.c b/target/avr/translate.c
index dc9c3d6bcc..1da34da103 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -3031,10 +3031,11 @@ static const TranslatorOps avr_tr_ops = {
     .disas_log          = avr_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext dc = { };
-    translator_loop(&avr_tr_ops, &dc.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &avr_tr_ops, &dc.base);
 }
 
 void restore_state_to_opc(CPUAVRState *env, TranslationBlock *tb,
diff --git a/target/cris/translate.c b/target/cris/translate.c
index ac101344a3..73385b0b3c 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3286,10 +3286,11 @@ static const TranslatorOps cris_tr_ops = {
     .disas_log          = cris_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext dc;
-    translator_loop(&cris_tr_ops, &dc.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &cris_tr_ops, &dc.base);
 }
 
 void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags)
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index d4fc92f7e9..0e8a0772f7 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -850,11 +850,13 @@ static const TranslatorOps hexagon_tr_ops = {
     .disas_log          = hexagon_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
 
-    translator_loop(&hexagon_tr_ops, &ctx.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc,
+                    &hexagon_tr_ops, &ctx.base);
 }
 
 #define NAME_LEN               64
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index b8dbfee5e9..8b861957e0 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -4340,10 +4340,11 @@ static const TranslatorOps hppa_tr_ops = {
     .disas_log          = hppa_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
-    translator_loop(&hppa_tr_ops, &ctx.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &hppa_tr_ops, &ctx.base);
 }
 
 void restore_state_to_opc(CPUHPPAState *env, TranslationBlock *tb,
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index a23417d058..4836c889e0 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8708,11 +8708,12 @@ static const TranslatorOps i386_tr_ops = {
 };
 
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext dc;
 
-    translator_loop(&i386_tr_ops, &dc.base, cpu, tb, max_insns);
+    translator_loop(cpu, tb, max_insns, pc, host_pc, &i386_tr_ops, &dc.base);
 }
 
 void restore_state_to_opc(CPUX86State *env, TranslationBlock *tb,
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 51ba291430..95b37ea180 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -241,11 +241,13 @@ static const TranslatorOps loongarch_tr_ops = {
     .disas_log          = loongarch_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
 
-    translator_loop(&loongarch_tr_ops, &ctx.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc,
+                    &loongarch_tr_ops, &ctx.base);
 }
 
 void loongarch_translate_init(void)
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 8f3c298ad0..5098f7e570 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6361,10 +6361,11 @@ static const TranslatorOps m68k_tr_ops = {
     .disas_log          = m68k_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext dc;
-    translator_loop(&m68k_tr_ops, &dc.base, cpu, tb, max_insns);
+    translator_loop(cpu, tb, max_insns, pc, host_pc, &m68k_tr_ops, &dc.base);
 }
 
 static double floatx80_to_double(CPUM68KState *env, uint16_t high, uint64_t low)
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index bf01384d33..c5546f93aa 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1849,10 +1849,11 @@ static const TranslatorOps mb_tr_ops = {
     .disas_log          = mb_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext dc;
-    translator_loop(&mb_tr_ops, &dc.base, cpu, tb, max_insns);
+    translator_loop(cpu, tb, max_insns, pc, host_pc, &mb_tr_ops, &dc.base);
 }
 
 void mb_cpu_dump_state(CPUState *cs, FILE *f, int flags)
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index de1511baaf..0d936e2648 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16155,11 +16155,12 @@ static const TranslatorOps mips_tr_ops = {
     .disas_log          = mips_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
 
-    translator_loop(&mips_tr_ops, &ctx.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &mips_tr_ops, &ctx.base);
 }
 
 void mips_tcg_init(void)
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 3a037a68cc..c588e8e885 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -1038,10 +1038,11 @@ static const TranslatorOps nios2_tr_ops = {
     .disas_log          = nios2_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext dc;
-    translator_loop(&nios2_tr_ops, &dc.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &nios2_tr_ops, &dc.base);
 }
 
 void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 7b8ad43d5f..8154f9d744 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1705,11 +1705,13 @@ static const TranslatorOps openrisc_tr_ops = {
     .disas_log          = openrisc_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
 
-    translator_loop(&openrisc_tr_ops, &ctx.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc,
+                    &openrisc_tr_ops, &ctx.base);
 }
 
 void openrisc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 388337f81b..000b1e518d 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7719,11 +7719,12 @@ static const TranslatorOps ppc_tr_ops = {
     .disas_log          = ppc_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
 
-    translator_loop(&ppc_tr_ops, &ctx.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &ppc_tr_ops, &ctx.base);
 }
 
 void restore_state_to_opc(CPUPPCState *env, TranslationBlock *tb,
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 63b04e8a94..38666ddc91 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1196,11 +1196,12 @@ static const TranslatorOps riscv_tr_ops = {
     .disas_log          = riscv_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
 
-    translator_loop(&riscv_tr_ops, &ctx.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &riscv_tr_ops, &ctx.base);
 }
 
 void riscv_translate_init(void)
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 62aee66937..ea5653bc95 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2363,11 +2363,12 @@ static const TranslatorOps rx_tr_ops = {
     .disas_log          = rx_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext dc;
 
-    translator_loop(&rx_tr_ops, &dc.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &rx_tr_ops, &dc.base);
 }
 
 void restore_state_to_opc(CPURXState *env, TranslationBlock *tb,
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index e2ee005671..d4c0b9b3a2 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6676,11 +6676,12 @@ static const TranslatorOps s390x_tr_ops = {
     .disas_log          = s390x_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext dc;
 
-    translator_loop(&s390x_tr_ops, &dc.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &s390x_tr_ops, &dc.base);
 }
 
 void restore_state_to_opc(CPUS390XState *env, TranslationBlock *tb,
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index f1b190e7cf..01056571c3 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -2368,11 +2368,12 @@ static const TranslatorOps sh4_tr_ops = {
     .disas_log          = sh4_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
 
-    translator_loop(&sh4_tr_ops, &ctx.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &sh4_tr_ops, &ctx.base);
 }
 
 void restore_state_to_opc(CPUSH4State *env, TranslationBlock *tb,
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 2e28222d31..2cbbe2396a 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5917,11 +5917,12 @@ static const TranslatorOps sparc_tr_ops = {
     .disas_log          = sparc_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext dc = {};
 
-    translator_loop(&sparc_tr_ops, &dc.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc, &sparc_tr_ops, &dc.base);
 }
 
 void sparc_tcg_init(void)
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index d170500fa5..a0558ead71 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8878,10 +8878,12 @@ static const TranslatorOps tricore_tr_ops = {
 };
 
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext ctx;
-    translator_loop(&tricore_tr_ops, &ctx.base, cs, tb, max_insns);
+    translator_loop(cs, tb, max_insns, pc, host_pc,
+                    &tricore_tr_ops, &ctx.base);
 }
 
 void
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 70e11eeb45..8b864ef925 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1279,10 +1279,12 @@ static const TranslatorOps xtensa_translator_ops = {
     .disas_log          = xtensa_tr_disas_log,
 };
 
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns)
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
+                           target_ulong pc, void *host_pc)
 {
     DisasContext dc = {};
-    translator_loop(&xtensa_translator_ops, &dc.base, cpu, tb, max_insns);
+    translator_loop(cpu, tb, max_insns, pc, host_pc,
+                    &xtensa_translator_ops, &dc.base);
 }
 
 void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469345AE5B9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:46:48 +0200 (CEST)
Received: from localhost ([::1]:58772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVW6R-0007Sd-AU
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWf-0000Bq-Gv
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:49 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWc-0003ad-V2
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:49 -0400
Received: by mail-wm1-x32d.google.com with SMTP id ay12so6607782wmb.1
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ImMdEaTX3CEfZPkJk9oCqKJjJXONXGkJ+5PrZsNb4SQ=;
 b=Rkx6iLz4ZMhSWarAUvpEJSAaUZe8RBtTQSgeFw+/34SAa0CoaeVxhM6y5hz5r9mLKS
 NQP4K+bjCOES7ldZTTn30uxwFvCi58tgLozZ6CKbb1EirSKq1P4NW0URKVLucbSIZa+9
 zzg3JXTOyBApOt29dCxkz3ACtSiQXqCRMmXmR6gwZaFdhlsBXlebgvuhjw33E0M8uoLT
 +tOy7hlcCCSGDl11UrmGCW/zAjzhvLw7+Qm2O2fzCZPpnzFgyLFncvXmcmeXlZqTP2KE
 lg1OBupl+UxEwuryClJwxv04+BrL4Nh68RU6o/hqmkZGfFMesSXLPcgvQGcaprSE+NJy
 BdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ImMdEaTX3CEfZPkJk9oCqKJjJXONXGkJ+5PrZsNb4SQ=;
 b=MBJ6lCpO2LvHPVnjI4jJc7kq3NMZcA8iZjv1W8VLQfCIzi+IYKasOhttGZZnZOap7+
 m/96em6FSUX8bvZH+YgC2Eo6sNlMSRZEwE/daqDnj3/0nzYjmyfiF2a6zIrl4O0GCD/6
 A7J0fIf+LHlckNVo3kwjB/aWrwn4aj0kKIAGYA0/XjF4RV4Q6glDq3+udQDtCp/LoWTt
 FMkzBrpdsmAZICwqZDo7O0s2c5NA9f9MMNU3cdFHp0/bVbW+wFsU4J2gDAr0/4D9L8WP
 EUXL9VK8hUaG8/ML+BS3gzjRcq5MpmYvgeGNLhA0zrO6t3Fdp4UE2SnO3USJ7/moPhbX
 ivag==
X-Gm-Message-State: ACgBeo0ibMGCUCEJIjaOCGPQWdZIbPO5yTFBAGTbfedhPEnq+IZQu6mz
 LLXgLr6ZpMwVoRM9i9xR7lMnzb5ZzeI2fcln
X-Google-Smtp-Source: AA6agR5jYSbHSTqQmK45O2uaWGqhakyC8riz1RKTQEiT5H3TuCJuBbgwQooJGLfJEKlU1O9I8rm22Q==
X-Received: by 2002:a05:600c:3509:b0:3a6:1888:a4bd with SMTP id
 h9-20020a05600c350900b003a61888a4bdmr13499011wmq.191.1662458985555; 
 Tue, 06 Sep 2022 03:09:45 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 12/23] target/i386: Remove cur_eip,
 next_eip arguments to gen_repz*
Date: Tue,  6 Sep 2022 11:09:21 +0100
Message-Id: <20220906100932.343523-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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

All callers pass s->base.pc_next and s->pc, which we can just
as well compute within the functions.  Pull out common helpers
and reduce the amount of code under macros.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 116 ++++++++++++++++++------------------
 1 file changed, 57 insertions(+), 59 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 393a1c1075..f3c26a9956 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -736,7 +736,7 @@ static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
 #endif
 }
 
-static inline void gen_movs(DisasContext *s, MemOp ot)
+static void gen_movs(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_ESI(s);
     gen_op_ld_v(s, ot, s->T0, s->A0);
@@ -1156,18 +1156,18 @@ static inline void gen_jcc1(DisasContext *s, int b, TCGLabel *l1)
 
 /* XXX: does not work with gdbstub "ice" single step - not a
    serious problem */
-static TCGLabel *gen_jz_ecx_string(DisasContext *s, target_ulong next_eip)
+static TCGLabel *gen_jz_ecx_string(DisasContext *s)
 {
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
     gen_op_jnz_ecx(s, s->aflag, l1);
     gen_set_label(l2);
-    gen_jmp_tb(s, next_eip, 1);
+    gen_jmp_tb(s, s->pc - s->cs_base, 1);
     gen_set_label(l1);
     return l2;
 }
 
-static inline void gen_stos(DisasContext *s, MemOp ot)
+static void gen_stos(DisasContext *s, MemOp ot)
 {
     gen_op_mov_v_reg(s, MO_32, s->T0, R_EAX);
     gen_string_movl_A0_EDI(s);
@@ -1176,7 +1176,7 @@ static inline void gen_stos(DisasContext *s, MemOp ot)
     gen_op_add_reg_T0(s, s->aflag, R_EDI);
 }
 
-static inline void gen_lods(DisasContext *s, MemOp ot)
+static void gen_lods(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_ESI(s);
     gen_op_ld_v(s, ot, s->T0, s->A0);
@@ -1185,7 +1185,7 @@ static inline void gen_lods(DisasContext *s, MemOp ot)
     gen_op_add_reg_T0(s, s->aflag, R_ESI);
 }
 
-static inline void gen_scas(DisasContext *s, MemOp ot)
+static void gen_scas(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_EDI(s);
     gen_op_ld_v(s, ot, s->T1, s->A0);
@@ -1194,7 +1194,7 @@ static inline void gen_scas(DisasContext *s, MemOp ot)
     gen_op_add_reg_T0(s, s->aflag, R_EDI);
 }
 
-static inline void gen_cmps(DisasContext *s, MemOp ot)
+static void gen_cmps(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_EDI(s);
     gen_op_ld_v(s, ot, s->T1, s->A0);
@@ -1222,7 +1222,7 @@ static void gen_bpt_io(DisasContext *s, TCGv_i32 t_port, int ot)
     }
 }
 
-static inline void gen_ins(DisasContext *s, MemOp ot)
+static void gen_ins(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_EDI(s);
     /* Note: we must do this dummy write first to be restartable in
@@ -1238,7 +1238,7 @@ static inline void gen_ins(DisasContext *s, MemOp ot)
     gen_bpt_io(s, s->tmp2_i32, ot);
 }
 
-static inline void gen_outs(DisasContext *s, MemOp ot)
+static void gen_outs(DisasContext *s, MemOp ot)
 {
     gen_string_movl_A0_ESI(s);
     gen_op_ld_v(s, ot, s->T0, s->A0);
@@ -1252,42 +1252,49 @@ static inline void gen_outs(DisasContext *s, MemOp ot)
     gen_bpt_io(s, s->tmp2_i32, ot);
 }
 
-/* same method as Valgrind : we generate jumps to current or next
-   instruction */
-#define GEN_REPZ(op)                                                          \
-static inline void gen_repz_ ## op(DisasContext *s, MemOp ot,              \
-                                 target_ulong cur_eip, target_ulong next_eip) \
-{                                                                             \
-    TCGLabel *l2;                                                             \
-    gen_update_cc_op(s);                                                      \
-    l2 = gen_jz_ecx_string(s, next_eip);                                      \
-    gen_ ## op(s, ot);                                                        \
-    gen_op_add_reg_im(s, s->aflag, R_ECX, -1);                                \
-    /* a loop would cause two single step exceptions if ECX = 1               \
-       before rep string_insn */                                              \
-    if (s->repz_opt)                                                          \
-        gen_op_jz_ecx(s, s->aflag, l2);                                       \
-    gen_jmp(s, cur_eip);                                                      \
+/* Generate jumps to current or next instruction */
+static void gen_repz(DisasContext *s, MemOp ot,
+                     void (*fn)(DisasContext *s, MemOp ot))
+{
+    TCGLabel *l2;
+    gen_update_cc_op(s);
+    l2 = gen_jz_ecx_string(s);
+    fn(s, ot);
+    gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
+    /*
+     * A loop would cause two single step exceptions if ECX = 1
+     * before rep string_insn
+     */
+    if (s->repz_opt) {
+        gen_op_jz_ecx(s, s->aflag, l2);
+    }
+    gen_jmp(s, s->base.pc_next - s->cs_base);
 }
 
-#define GEN_REPZ2(op)                                                         \
-static inline void gen_repz_ ## op(DisasContext *s, MemOp ot,              \
-                                   target_ulong cur_eip,                      \
-                                   target_ulong next_eip,                     \
-                                   int nz)                                    \
-{                                                                             \
-    TCGLabel *l2;                                                             \
-    gen_update_cc_op(s);                                                      \
-    l2 = gen_jz_ecx_string(s, next_eip);                                      \
-    gen_ ## op(s, ot);                                                        \
-    gen_op_add_reg_im(s, s->aflag, R_ECX, -1);                                \
-    gen_update_cc_op(s);                                                      \
-    gen_jcc1(s, (JCC_Z << 1) | (nz ^ 1), l2);                                 \
-    if (s->repz_opt)                                                          \
-        gen_op_jz_ecx(s, s->aflag, l2);                                       \
-    gen_jmp(s, cur_eip);                                                      \
+#define GEN_REPZ(op) \
+    static inline void gen_repz_ ## op(DisasContext *s, MemOp ot) \
+    { gen_repz(s, ot, gen_##op); }
+
+static void gen_repz2(DisasContext *s, MemOp ot, int nz,
+                      void (*fn)(DisasContext *s, MemOp ot))
+{
+    TCGLabel *l2;
+    gen_update_cc_op(s);
+    l2 = gen_jz_ecx_string(s);
+    fn(s, ot);
+    gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
+    gen_update_cc_op(s);
+    gen_jcc1(s, (JCC_Z << 1) | (nz ^ 1), l2);
+    if (s->repz_opt) {
+        gen_op_jz_ecx(s, s->aflag, l2);
+    }
+    gen_jmp(s, s->base.pc_next - s->cs_base);
 }
 
+#define GEN_REPZ2(op) \
+    static inline void gen_repz_ ## op(DisasContext *s, MemOp ot, int nz) \
+    { gen_repz2(s, ot, nz, gen_##op); }
+
 GEN_REPZ(movs)
 GEN_REPZ(stos)
 GEN_REPZ(lods)
@@ -6588,8 +6595,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xa5:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_movs(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base);
+            gen_repz_movs(s, ot);
         } else {
             gen_movs(s, ot);
         }
@@ -6599,8 +6605,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xab:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_stos(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base);
+            gen_repz_stos(s, ot);
         } else {
             gen_stos(s, ot);
         }
@@ -6609,8 +6614,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xad:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_lods(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base);
+            gen_repz_lods(s, ot);
         } else {
             gen_lods(s, ot);
         }
@@ -6619,11 +6623,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xaf:
         ot = mo_b_d(b, dflag);
         if (prefixes & PREFIX_REPNZ) {
-            gen_repz_scas(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base, 1);
+            gen_repz_scas(s, ot, 1);
         } else if (prefixes & PREFIX_REPZ) {
-            gen_repz_scas(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base, 0);
+            gen_repz_scas(s, ot, 0);
         } else {
             gen_scas(s, ot);
         }
@@ -6633,11 +6635,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xa7:
         ot = mo_b_d(b, dflag);
         if (prefixes & PREFIX_REPNZ) {
-            gen_repz_cmps(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base, 1);
+            gen_repz_cmps(s, ot, 1);
         } else if (prefixes & PREFIX_REPZ) {
-            gen_repz_cmps(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base, 0);
+            gen_repz_cmps(s, ot, 0);
         } else {
             gen_cmps(s, ot);
         }
@@ -6655,8 +6655,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_io_start();
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_ins(s, ot, s->base.pc_next - s->cs_base,
-                         s->pc - s->cs_base);
+            gen_repz_ins(s, ot);
             /* jump generated by gen_repz_ins */
         } else {
             gen_ins(s, ot);
@@ -6677,8 +6676,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_io_start();
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_outs(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base);
+            gen_repz_outs(s, ot);
             /* jump generated by gen_repz_outs */
         } else {
             gen_outs(s, ot);
-- 
2.34.1



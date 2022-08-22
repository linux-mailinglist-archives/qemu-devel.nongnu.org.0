Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A625059CCE9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:11:42 +0200 (CEST)
Received: from localhost ([::1]:55752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHW9-0000BU-P4
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvb-0006AO-SX
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:57 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvW-0007FP-Az
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:54 -0400
Received: by mail-pl1-x634.google.com with SMTP id x19so11307984plc.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=9Arjo42FMfgOHUOKPnaNXPkKeSDs2OlIA7G2pgMh604=;
 b=oRJcB4J/rAnLz2zMQ69ha5QOspBg74tylUxtGUxlbB0oWfYGxogzZofig1QuAssG5f
 kER3jmrIMGbgbkUdWVJi2FCSTosQ9EH1OG4tY9GdWIf8Keycylv9N+8k1fyH2ZexYV+0
 HMfFEc7hVtZZdpRi+a1PxE1qMG+1J4HNvuSvSzaGaH8UHpc5d44pljUS3AfoXQ+yyu2s
 oRD6ibdEwsux257RZwngit+wkeAtJajs9euw4tvPDtOtsNhItO40YnAXhwOhu6HhoTQn
 fSF8XC7ccdpfMuhW4mHtsU85/KFVgToymfcDHyaCT4gN4zkor8VJOm7Z+HUm+kxgO+Tf
 w0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=9Arjo42FMfgOHUOKPnaNXPkKeSDs2OlIA7G2pgMh604=;
 b=sVTP8lyoxewZ4XL3SV8/A6Y5WY57bkA9OVhTPgL8KAKbkaWLRDRMgXrgOlQXISwOCZ
 O6yKAY1y89IBOQsuWfwbzmMxGiQmX8tYAC8KIhSMjcqlfW5pnmzlwab9IGIzxelDtEbX
 LtM7MyxVrue66XBSk/yXlz7TQIMdvX5dhj5ZmmMgY7NSRrEJ6qHUwfPNcbKsUH+LQ+Nj
 ZmE9K4LpDdolH2ndABQ7YEPrRquLujSW76LaMtD4uwPtLmS97ztedGeqoEnCGnRpartx
 q6WRYB8ByAzM/pCrjasrAdjp8QkrqBIiGDK7UTE776Oan4ZEVyxD67+OMTqcYclYU/DZ
 QDrg==
X-Gm-Message-State: ACgBeo1l17RXCZaDaYb8xeNbMqazo0qLTJVDsZlEnvh7U8sHwSJxN4Vp
 jxx4CSB1CEnYZtrAmH/eMqMQjevt+73A/w==
X-Google-Smtp-Source: AA6agR7zJYNX/59Lzj+NwjwpewvP8gDUpkqU84PiJOL09WoWpYpLhVa6A85ZgaeDTmlkpD5t25fyew==
X-Received: by 2002:a17:902:d403:b0:172:9f0a:e591 with SMTP id
 b3-20020a170902d40300b001729f0ae591mr22491176ple.109.1661211213925; 
 Mon, 22 Aug 2022 16:33:33 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/22] target/i386: Remove cur_eip,
 next_eip arguments to gen_repz*
Date: Mon, 22 Aug 2022 16:33:07 -0700
Message-Id: <20220822233318.1728621-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
index ee8e87a617..38f4589fd2 100644
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
@@ -6475,8 +6482,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xa5:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_movs(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base);
+            gen_repz_movs(s, ot);
         } else {
             gen_movs(s, ot);
         }
@@ -6486,8 +6492,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xab:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_stos(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base);
+            gen_repz_stos(s, ot);
         } else {
             gen_stos(s, ot);
         }
@@ -6496,8 +6501,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xad:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_lods(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base);
+            gen_repz_lods(s, ot);
         } else {
             gen_lods(s, ot);
         }
@@ -6506,11 +6510,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6520,11 +6522,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6542,8 +6542,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_io_start();
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_ins(s, ot, s->base.pc_next - s->cs_base,
-                         s->pc - s->cs_base);
+            gen_repz_ins(s, ot);
             /* jump generated by gen_repz_ins */
         } else {
             gen_ins(s, ot);
@@ -6564,8 +6563,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 975645F1CC3
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:28:55 +0200 (CEST)
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedU6-0000ML-He
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedC3-0002oW-Ly
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:15 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:47014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBx-0004D8-RM
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:15 -0400
Received: by mail-qk1-x729.google.com with SMTP id d17so4395707qko.13
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=eBPHJH5T2g1Bto2wBvrUksQV/vCBE8FozehRnmNI404=;
 b=L94unGx9z7eG1kDC6vZ0LPVbwVlRRn+zT4sDfDbElI9twFhuL1zRyxvJoQbhdnxQCx
 FfDFGo7b7nHu0e6gepVZH8jmX9RxN8GDkIuxy7PNdbPPS/U6TMACNrdLbMZ/hzzjMy0/
 /kSCBLvhK3GmfygQAJBY9QEl3LANx7uMy5VRdFxaaAtFoAwYmtE7tvHuBLpfVrE5f3jK
 /jmvrMDm582796YAFYaVydfrT2LAvN3lEtqBaPPW1wq4L6cD1h3CU/D0hgm0Zd1hxPH0
 N5cS+IGJbwO7EP3KQsxZoI0DkwRNFHhka2x2eHCVkqTr+yHNTWPwnK46P/bp7gz2jyNv
 Ie+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eBPHJH5T2g1Bto2wBvrUksQV/vCBE8FozehRnmNI404=;
 b=winkurzY10w5YRZGGYDFYbAvO3uqCt+oG/R8V3kifveBWj89zudZB3go7xtT/9/kxt
 lWVwfjZkreJhwDYu2Lrn+plEYpQUXVpnNYQbJx5hrJWdz8LVrfYNIzRqvot1iR1iDh3K
 EK2gzrd9rk9xBKQ45+58nFnO7zP4fQtv8XTbN1d0WMd2xqqkfxSKzOl4ZsA1bqmy2reE
 StTfTaQpQDNVx+zQEEJEKrFSe91Rzf1IaO5V/4zuiVAL+Ip5nN2v/EoNCMEF2QAccvKx
 Pz++vw1QeiLtokYeSDvu5NAV9rABGiT+67p810xk8bv+ur9+lpFjcIx/3PMnu6K5NWh7
 iYKg==
X-Gm-Message-State: ACrzQf0Hl4CXIoWpfaCauulsUDKUTzTcKoDSIBCRWsWNZRc2/Wst6Kzt
 KUnEP/rhjmXi7Gsbr5K1y0pgi98llix/oUog
X-Google-Smtp-Source: AMsMyM6r1uF0tTl9QIzJ2j/eHK4KL+X990RaODrYl9CDbKZYofUDPChGFJHzbugiF93MOaSIGF/5/A==
X-Received: by 2002:a37:a982:0:b0:6cf:6de9:1bee with SMTP id
 s124-20020a37a982000000b006cf6de91beemr9338002qke.423.1664633408311; 
 Sat, 01 Oct 2022 07:10:08 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 12/26] target/i386: Remove cur_eip,
 next_eip arguments to gen_repz*
Date: Sat,  1 Oct 2022 07:09:21 -0700
Message-Id: <20221001140935.465607-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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

All callers pass s->base.pc_next and s->pc, which we can just
as well compute within the functions.  Pull out common helpers
and reduce the amount of code under macros.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 116 ++++++++++++++++++------------------
 1 file changed, 57 insertions(+), 59 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index fe99c4361c..c8ef9f0356 100644
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
@@ -6623,8 +6630,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xa5:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_movs(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base);
+            gen_repz_movs(s, ot);
         } else {
             gen_movs(s, ot);
         }
@@ -6634,8 +6640,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xab:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_stos(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base);
+            gen_repz_stos(s, ot);
         } else {
             gen_stos(s, ot);
         }
@@ -6644,8 +6649,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xad:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_lods(s, ot, s->base.pc_next - s->cs_base,
-                          s->pc - s->cs_base);
+            gen_repz_lods(s, ot);
         } else {
             gen_lods(s, ot);
         }
@@ -6654,11 +6658,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6668,11 +6670,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6690,8 +6690,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_io_start();
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_ins(s, ot, s->base.pc_next - s->cs_base,
-                         s->pc - s->cs_base);
+            gen_repz_ins(s, ot);
             /* jump generated by gen_repz_ins */
         } else {
             gen_ins(s, ot);
@@ -6712,8 +6711,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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



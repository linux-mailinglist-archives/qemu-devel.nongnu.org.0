Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D849E6A2815
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:04:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQJ-00029z-Mm; Sat, 25 Feb 2023 04:00:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPp-0000nX-Hn
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:26 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPn-00057b-78
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:25 -0500
Received: by mail-pf1-x442.google.com with SMTP id n5so813250pfv.11
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I5RvwRAEFJ45NwIooEievLS2EX+7gKV47O/JdDJH4Sg=;
 b=jZJBEgbXEK6HrphhQpwXXqnEE2wjk9BbUA8sucM41RutJP/MKuS6rQLTuxbC1iK1cl
 XwzPpGBq4u+OjWwX1XcaE4XZ6WkHC+2MJ9wXzJ2Y48Ke/s2oCI50ylQr9BgdutFZpkUU
 v/VwsBLZMlmy1L2qmUTjXApQqApE0DECzDjgiwf3nl/Mz0fTo8IvL67Paj/MZMylN7Ux
 Ml8nXZQtzUGDQNNN3baT0PeJhlt4V8r4+oGrTlS5+TMCwJKHJLbf6so96ko1y1XYdymx
 OTSih7gybfMcnEcC/ciO3k2LwX4h8FRdP2fK1DIVrwlO1JIm91Ap/+n+0vlyGQiLQXY2
 BDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I5RvwRAEFJ45NwIooEievLS2EX+7gKV47O/JdDJH4Sg=;
 b=UQA4rOeicR+yKWw4wVihSi6dB9Y44trMoi6erb7cGyVxDSann0fHXcLLSmdf1yvVRH
 YDD5d2WH/62Jqe0mzWbAPQw/lOES9Zi/n5SGg+mCycdyFBdx2g6BARgDiqMPa8+hAVvC
 +d/gIPswPjXG3ZnfyYE9Q1caWtUt7AaScUBIRMjEYv2jqBFhia6qAQGSel8pbSkkDW07
 NQ9KtY/+89JncL+2w8ggK+fdiKRnOrKC7w+BNj/N8T/vSVMk4cAi8s5DpUwzSrUk4XAz
 0wWT26tqDlohIMoBL8P0D5KQUa/kbFwc1TnLoj+2MSyvv1jRCezFP9ueirZFBn1Z2ILa
 DHkQ==
X-Gm-Message-State: AO0yUKVid6F1SPwQJnsfvxqU7HeTrorzo9wdaK/c10OcSPlB1AI1VF9A
 6Phdxpo6sgFhUuBLWAJBybZig0O6EBveApG/9B5dUA==
X-Google-Smtp-Source: AK7set+husDNCXoaOHGvzP/gy3+GNcWSGlFsCP95+7sWcz/s4Cq/HYFCEAwy8qf+bXSy6cszyUfToA==
X-Received: by 2002:a62:7bd8:0:b0:5ab:c004:5fc9 with SMTP id
 w207-20020a627bd8000000b005abc0045fc9mr16965133pfc.17.1677315621772; 
 Sat, 25 Feb 2023 01:00:21 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 22/30] target/hexagon: Don't use tcg_temp_local_new_*
Date: Fri, 24 Feb 2023 22:59:37 -1000
Message-Id: <20230225085945.1798188-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since tcg_temp_new_* is now identical, use those.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/README.rst       |  4 ++--
 target/hexagon/gen_tcg.h                    |  4 ++--
 target/hexagon/genptr.c                     | 16 ++++++++--------
 target/hexagon/idef-parser/parser-helpers.c |  4 ++--
 target/hexagon/translate.c                  |  2 +-
 target/hexagon/README                       |  8 ++++----
 target/hexagon/gen_tcg_funcs.py             | 18 +++++++-----------
 7 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/target/hexagon/idef-parser/README.rst b/target/hexagon/idef-parser/README.rst
index ff6d14150a..c230fec124 100644
--- a/target/hexagon/idef-parser/README.rst
+++ b/target/hexagon/idef-parser/README.rst
@@ -294,9 +294,9 @@ generators the previous declarations are mapped to
 
 ::
 
-    int var1;           ->      TCGv_i32 var1 = tcg_temp_local_new_i32();
+    int var1;           ->      TCGv_i32 var1 = tcg_temp_new_i32();
 
-    int var2 = 0;       ->      TCGv_i32 var1 = tcg_temp_local_new_i32();
+    int var2 = 0;       ->      TCGv_i32 var1 = tcg_temp_new_i32();
                                 tcg_gen_movi_i32(j, ((int64_t) 0ULL));
 
 which are later automatically freed at the end of the function they're declared
diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index 19697b42a5..a219a7f5dd 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -337,7 +337,7 @@
  */
 #define fGEN_TCG_PRED_LOAD(GET_EA, PRED, SIZE, SIGN) \
     do { \
-        TCGv LSB = tcg_temp_local_new(); \
+        TCGv LSB = tcg_temp_new(); \
         TCGLabel *label = gen_new_label(); \
         tcg_gen_movi_tl(EA, 0); \
         PRED;  \
@@ -397,7 +397,7 @@
 /* Predicated loads into a register pair */
 #define fGEN_TCG_PRED_LOAD_PAIR(GET_EA, PRED) \
     do { \
-        TCGv LSB = tcg_temp_local_new(); \
+        TCGv LSB = tcg_temp_new(); \
         TCGLabel *label = gen_new_label(); \
         tcg_gen_movi_tl(EA, 0); \
         PRED;  \
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 90db99024f..591461b043 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -706,7 +706,7 @@ static void gen_cond_call(DisasContext *ctx, TCGv pred,
                           TCGCond cond, int pc_off)
 {
     TCGv next_PC;
-    TCGv lsb = tcg_temp_local_new();
+    TCGv lsb = tcg_temp_new();
     TCGLabel *skip = gen_new_label();
     tcg_gen_andi_tl(lsb, pred, 1);
     gen_write_new_pc_pcrel(ctx, pc_off, cond, lsb);
@@ -720,7 +720,7 @@ static void gen_cond_call(DisasContext *ctx, TCGv pred,
 
 static void gen_endloop0(DisasContext *ctx)
 {
-    TCGv lpcfg = tcg_temp_local_new();
+    TCGv lpcfg = tcg_temp_new();
 
     GET_USR_FIELD(USR_LPCFG, lpcfg);
 
@@ -852,7 +852,7 @@ static void gen_sar(TCGv dst, TCGv src, TCGv shift_amt)
 /* Bidirectional shift right with saturation */
 static void gen_asr_r_r_sat(TCGv RdV, TCGv RsV, TCGv RtV)
 {
-    TCGv shift_amt = tcg_temp_local_new();
+    TCGv shift_amt = tcg_temp_new();
     TCGLabel *positive = gen_new_label();
     TCGLabel *done = gen_new_label();
 
@@ -876,7 +876,7 @@ static void gen_asr_r_r_sat(TCGv RdV, TCGv RsV, TCGv RtV)
 /* Bidirectional shift left with saturation */
 static void gen_asl_r_r_sat(TCGv RdV, TCGv RsV, TCGv RtV)
 {
-    TCGv shift_amt = tcg_temp_local_new();
+    TCGv shift_amt = tcg_temp_new();
     TCGLabel *positive = gen_new_label();
     TCGLabel *done = gen_new_label();
 
@@ -918,7 +918,7 @@ static void gen_log_vreg_write(DisasContext *ctx, intptr_t srcoff, int num,
     intptr_t dstoff;
 
     if (is_predicated) {
-        TCGv cancelled = tcg_temp_local_new();
+        TCGv cancelled = tcg_temp_new();
         label_end = gen_new_label();
 
         /* Don't do anything if the slot was cancelled */
@@ -959,7 +959,7 @@ static void gen_log_qreg_write(intptr_t srcoff, int num, int vnew,
     intptr_t dstoff;
 
     if (is_predicated) {
-        TCGv cancelled = tcg_temp_local_new();
+        TCGv cancelled = tcg_temp_new();
         label_end = gen_new_label();
 
         /* Don't do anything if the slot was cancelled */
@@ -1164,10 +1164,10 @@ void gen_satu_i64_ovfl(TCGv ovfl, TCGv_i64 dest, TCGv_i64 source, int width)
 /* Implements the fADDSAT64 macro in TCG */
 void gen_add_sat_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 sum = tcg_temp_local_new_i64();
+    TCGv_i64 sum = tcg_temp_new_i64();
     TCGv_i64 xor = tcg_temp_new_i64();
     TCGv_i64 cond1 = tcg_temp_new_i64();
-    TCGv_i64 cond2 = tcg_temp_local_new_i64();
+    TCGv_i64 cond2 = tcg_temp_new_i64();
     TCGv_i64 cond3 = tcg_temp_new_i64();
     TCGv_i64 mask = tcg_constant_i64(0x8000000000000000ULL);
     TCGv_i64 max_pos = tcg_constant_i64(0x7FFFFFFFFFFFFFFFLL);
diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 8110686c51..dfb9c65b52 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -322,7 +322,7 @@ HexValue gen_tmp_local(Context *c,
     rvalue.is_manual = false;
     rvalue.tmp.index = c->inst.tmp_count;
     OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
-        " = tcg_temp_local_new_i", &bit_width, "();\n");
+        " = tcg_temp_new_i", &bit_width, "();\n");
     c->inst.tmp_count++;
     return rvalue;
 }
@@ -554,7 +554,7 @@ void gen_varid_allocate(Context *c,
     new_var.signedness = signedness;
 
     EMIT_HEAD(c, "TCGv_%s %s", bit_suffix, varid->var.name->str);
-    EMIT_HEAD(c, " = tcg_temp_local_new_%s();\n", bit_suffix);
+    EMIT_HEAD(c, " = tcg_temp_new_%s();\n", bit_suffix);
     g_array_append_val(c->inst.allocated, new_var);
 }
 
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index fc3061a540..381fdaa3a8 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -539,7 +539,7 @@ void process_store(DisasContext *ctx, int slot_num)
         tcg_temp_free(cancelled);
     }
     {
-        TCGv address = tcg_temp_local_new();
+        TCGv address = tcg_temp_new();
         tcg_gen_mov_tl(address, hex_store_addr[slot_num]);
 
         /*
diff --git a/target/hexagon/README b/target/hexagon/README
index 6cb5affddb..2e32639fb7 100644
--- a/target/hexagon/README
+++ b/target/hexagon/README
@@ -81,7 +81,7 @@ tcg_funcs_generated.c.inc
                     Insn *insn,
                     Packet *pkt)
     {
-        TCGv RdV = tcg_temp_local_new();
+        TCGv RdV = tcg_temp_new();
         const int RdN = insn->regno[0];
         TCGv RsV = hex_gpr[insn->regno[1]];
         TCGv RtV = hex_gpr[insn->regno[2]];
@@ -146,16 +146,16 @@ istruction.
         const int VdN = insn->regno[0];
         const intptr_t VdV_off =
             ctx_future_vreg_off(ctx, VdN, 1, true);
-        TCGv_ptr VdV = tcg_temp_local_new_ptr();
+        TCGv_ptr VdV = tcg_temp_new_ptr();
         tcg_gen_addi_ptr(VdV, cpu_env, VdV_off);
         const int VuN = insn->regno[1];
         const intptr_t VuV_off =
             vreg_src_off(ctx, VuN);
-        TCGv_ptr VuV = tcg_temp_local_new_ptr();
+        TCGv_ptr VuV = tcg_temp_new_ptr();
         const int VvN = insn->regno[2];
         const intptr_t VvV_off =
             vreg_src_off(ctx, VvN);
-        TCGv_ptr VvV = tcg_temp_local_new_ptr();
+        TCGv_ptr VvV = tcg_temp_new_ptr();
         tcg_gen_addi_ptr(VuV, cpu_env, VuV_off);
         tcg_gen_addi_ptr(VvV, cpu_env, VvV_off);
         TCGv slot = tcg_constant_tl(insn->slot);
diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index 7e8ba17ca2..dfc90712fb 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -26,18 +26,14 @@
 ## Helpers for gen_tcg_func
 ##
 def gen_decl_ea_tcg(f, tag):
-    if ('A_CONDEXEC' in hex_common.attribdict[tag] or
-        'A_LOAD' in hex_common.attribdict[tag]):
-        f.write("    TCGv EA = tcg_temp_local_new();\n")
-    else:
-        f.write("    TCGv EA = tcg_temp_new();\n")
+    f.write("    TCGv EA = tcg_temp_new();\n")
 
 def gen_free_ea_tcg(f):
     f.write("    tcg_temp_free(EA);\n")
 
 def genptr_decl_pair_writable(f, tag, regtype, regid, regno):
     regN="%s%sN" % (regtype,regid)
-    f.write("    TCGv_i64 %s%sV = tcg_temp_local_new_i64();\n" % \
+    f.write("    TCGv_i64 %s%sV = tcg_temp_new_i64();\n" % \
         (regtype, regid))
     if (regtype == "C"):
         f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
@@ -56,7 +52,7 @@ def genptr_decl_pair_writable(f, tag, regtype, regid, regno):
 
 def genptr_decl_writable(f, tag, regtype, regid, regno):
     regN="%s%sN" % (regtype,regid)
-    f.write("    TCGv %s%sV = tcg_temp_local_new();\n" % \
+    f.write("    TCGv %s%sV = tcg_temp_new();\n" % \
         (regtype, regid))
     if (regtype == "C"):
         f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
@@ -73,7 +69,7 @@ def genptr_decl(f, tag, regtype, regid, regno):
     regN="%s%sN" % (regtype,regid)
     if (regtype == "R"):
         if (regid in {"ss", "tt"}):
-            f.write("    TCGv_i64 %s%sV = tcg_temp_local_new_i64();\n" % \
+            f.write("    TCGv_i64 %s%sV = tcg_temp_new_i64();\n" % \
                 (regtype, regid))
             f.write("    const int %s = insn->regno[%d];\n" % \
                 (regN, regno))
@@ -96,14 +92,14 @@ def genptr_decl(f, tag, regtype, regid, regno):
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "C"):
         if (regid == "ss"):
-            f.write("    TCGv_i64 %s%sV = tcg_temp_local_new_i64();\n" % \
+            f.write("    TCGv_i64 %s%sV = tcg_temp_new_i64();\n" % \
                 (regtype, regid))
             f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
                 (regN, regno))
         elif (regid == "dd"):
             genptr_decl_pair_writable(f, tag, regtype, regid, regno)
         elif (regid == "s"):
-            f.write("    TCGv %s%sV = tcg_temp_local_new();\n" % \
+            f.write("    TCGv %s%sV = tcg_temp_new();\n" % \
                 (regtype, regid))
             f.write("    const int %s%sN = insn->regno[%d] + HEX_REG_SA0;\n" % \
                 (regtype, regid, regno))
@@ -575,7 +571,7 @@ def genptr_dst_write_opn(f,regtype, regid, tag):
 ##     We produce:
 ##    static void generate_A2_add(DisasContext *ctx)
 ##       {
-##           TCGv RdV = tcg_temp_local_new();
+##           TCGv RdV = tcg_temp_new();
 ##           const int RdN = insn->regno[0];
 ##           TCGv RsV = hex_gpr[insn->regno[1]];
 ##           TCGv RtV = hex_gpr[insn->regno[2]];
-- 
2.34.1



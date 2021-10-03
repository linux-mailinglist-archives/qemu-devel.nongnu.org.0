Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BBC41FEFA
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 02:49:30 +0200 (CEST)
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWph3-0002b9-8q
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 20:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWpfg-0001C3-Uq
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 20:48:04 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWpff-0006En-09
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 20:48:04 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 q17-20020a7bce91000000b0030d4e298215so3095921wmj.0
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 17:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5VI85G4294es99iD21jmCA+4Em454SmAFRcuqCppvkI=;
 b=YXjMkyD/RxN1rWeQUjTvTqv3RNb46GZg7Lm62yv1m/xPgIBLYO+MwgQNVHTcSl9Shh
 IaTOp2uBB1THMNpvPfb0JKurUdZwqa1HO9UB5EI6fZM/NO7LeSOJi25Tj7or4MqSNH5q
 WmjysWh9ua3zVgfy9BEF6Nu+ETzwuDGdm9biSDZUt/PHUcR3u8BEpczPYR5+xA4or81O
 F4QltE7ChHy0MfVSRSEoYnch/Derecu0lgMIM2lU3SpsgpKW5qpfg60NiyS/OvIjugVw
 OT736Ce47+2dWFxDPQRdPkK6/aIs6FE7yAbEpduwB1GSPVw3ecqo/qZ9I8monHY3b4aW
 3n9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5VI85G4294es99iD21jmCA+4Em454SmAFRcuqCppvkI=;
 b=IJOEcxdA3t4OY6Amw2iqj65oHLVsYH62H7YrFQF2jCG0isUMGev0IMwsSgU1thukNS
 EhE5Ga6ebbTyh4dCXecNOg57rGQCSnSN7hjC3XYu5agS2eqU9BgKqFd5ALIH/OW0Eib/
 Im1Y75TVqmUYgaU4LfXheTwVc2sb39fiuabDfAWMKA4idJj91bjQU2TLD90x7R0asqjJ
 dvp4Z2ZWUmpugTIxQ4sNVpNve9K/Mh5R70WYdE4GlEf4W/OpnLCq50lnnr3HuwiZRR48
 IIAQ4uiyzjvlpajUEVYJFYTdyADH+XMG1FjvfYufHyIDMOqC5KTzBp2CvGdiyekjhWZM
 5LHw==
X-Gm-Message-State: AOAM5319UmLocgm9lD9nPJLrFk0eXCNUnj2qSIhvHrmnuLq49NyNE4Tq
 ZRtetGIyfgg1+OO7NTIP0RZW06Bbc8I=
X-Google-Smtp-Source: ABdhPJx7C45fxc9UnPOZqXNMsNyUrIJ1mRW0IF+WrqfnMoOTImHiMkSCY5LTcsU4bmzj7RJjzHVPbA==
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr11455546wmi.37.1633222081457; 
 Sat, 02 Oct 2021 17:48:01 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 g1sm12779856wmk.2.2021.10.02.17.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 17:48:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/hexagon: Use tcg_constant_*
Date: Sun,  3 Oct 2021 02:47:50 +0200
Message-Id: <20211003004750.3608983-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003004750.3608983-1-f4bug@amsat.org>
References: <20211003004750.3608983-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace uses of tcg_const_* with the allocate and free close together.

Inspired-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hexagon/gen_tcg.h        |  6 ++---
 target/hexagon/macros.h         |  3 +--
 target/hexagon/genptr.c         | 39 +++++++++++----------------------
 target/hexagon/translate.c      | 26 +++++++---------------
 target/hexagon/gen_tcg_funcs.py |  4 +---
 5 files changed, 25 insertions(+), 53 deletions(-)

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index ee94c903dba..03615641042 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -684,9 +684,8 @@
     gen_helper_sfmin(RdV, cpu_env, RsV, RtV)
 #define fGEN_TCG_F2_sfclass(SHORTCODE) \
     do { \
-        TCGv imm = tcg_const_tl(uiV); \
+        TCGv imm = tcg_constant_tl(uiV); \
         gen_helper_sfclass(PdV, cpu_env, RsV, imm); \
-        tcg_temp_free(imm); \
     } while (0)
 #define fGEN_TCG_F2_sffixupn(SHORTCODE) \
     gen_helper_sffixupn(RdV, cpu_env, RsV, RtV)
@@ -712,9 +711,8 @@
     gen_helper_dfcmpuo(PdV, cpu_env, RssV, RttV)
 #define fGEN_TCG_F2_dfclass(SHORTCODE) \
     do { \
-        TCGv imm = tcg_const_tl(uiV); \
+        TCGv imm = tcg_constant_tl(uiV); \
         gen_helper_dfclass(PdV, cpu_env, RssV, imm); \
-        tcg_temp_free(imm); \
     } while (0)
 #define fGEN_TCG_F2_sfmpy(SHORTCODE) \
     gen_helper_sfmpy(RdV, cpu_env, RsV, RtV)
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index ae6663c09fe..44e9b857b56 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -189,14 +189,13 @@ static inline void gen_pred_cancel(TCGv pred, int slot_num)
  {
     TCGv slot_mask = tcg_const_tl(1 << slot_num);
     TCGv tmp = tcg_temp_new();
-    TCGv zero = tcg_const_tl(0);
+    TCGv zero = tcg_constant_tl(0);
     tcg_gen_or_tl(slot_mask, hex_slot_cancelled, slot_mask);
     tcg_gen_andi_tl(tmp, pred, 1);
     tcg_gen_movcond_tl(TCG_COND_EQ, hex_slot_cancelled, tmp, zero,
                        slot_mask, hex_slot_cancelled);
     tcg_temp_free(slot_mask);
     tcg_temp_free(tmp);
-    tcg_temp_free(zero);
 }
 #define PRED_LOAD_CANCEL(PRED, EA) \
     gen_pred_cancel(PRED, insn->is_endloop ? 4 : insn->slot)
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 73332996156..4a21fa590ff 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -29,7 +29,7 @@
 
 static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
 {
-    TCGv zero = tcg_const_tl(0);
+    TCGv zero = tcg_constant_tl(0);
     TCGv slot_mask = tcg_temp_new();
 
     tcg_gen_andi_tl(slot_mask, hex_slot_cancelled, 1 << slot);
@@ -47,7 +47,6 @@ static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
         tcg_gen_or_tl(hex_reg_written[rnum], hex_reg_written[rnum], slot_mask);
     }
 
-    tcg_temp_free(zero);
     tcg_temp_free(slot_mask);
 }
 
@@ -63,7 +62,7 @@ static inline void gen_log_reg_write(int rnum, TCGv val)
 static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, int slot)
 {
     TCGv val32 = tcg_temp_new();
-    TCGv zero = tcg_const_tl(0);
+    TCGv zero = tcg_constant_tl(0);
     TCGv slot_mask = tcg_temp_new();
 
     tcg_gen_andi_tl(slot_mask, hex_slot_cancelled, 1 << slot);
@@ -92,7 +91,6 @@ static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, int slot)
     }
 
     tcg_temp_free(val32);
-    tcg_temp_free(zero);
     tcg_temp_free(slot_mask);
 }
 
@@ -181,9 +179,8 @@ static inline void gen_read_ctrl_reg_pair(DisasContext *ctx, const int reg_num,
         tcg_gen_concat_i32_i64(dest, p3_0, hex_gpr[reg_num + 1]);
         tcg_temp_free(p3_0);
     } else if (reg_num == HEX_REG_PC - 1) {
-        TCGv pc = tcg_const_tl(ctx->base.pc_next);
+        TCGv pc = tcg_constant_tl(ctx->base.pc_next);
         tcg_gen_concat_i32_i64(dest, hex_gpr[reg_num], pc);
-        tcg_temp_free(pc);
     } else if (reg_num == HEX_REG_QEMU_PKT_CNT) {
         TCGv pkt_cnt = tcg_temp_new();
         TCGv insn_cnt = tcg_temp_new();
@@ -331,15 +328,13 @@ static inline void gen_store_conditional4(DisasContext *ctx,
 
     tcg_gen_brcond_tl(TCG_COND_NE, vaddr, hex_llsc_addr, fail);
 
-    one = tcg_const_tl(0xff);
-    zero = tcg_const_tl(0);
+    one = tcg_constant_tl(0xff);
+    zero = tcg_constant_tl(0);
     tmp = tcg_temp_new();
     tcg_gen_atomic_cmpxchg_tl(tmp, hex_llsc_addr, hex_llsc_val, src,
                               ctx->mem_idx, MO_32);
     tcg_gen_movcond_tl(TCG_COND_EQ, pred, tmp, hex_llsc_val,
                        one, zero);
-    tcg_temp_free(one);
-    tcg_temp_free(zero);
     tcg_temp_free(tmp);
     tcg_gen_br(done);
 
@@ -359,16 +354,14 @@ static inline void gen_store_conditional8(DisasContext *ctx,
 
     tcg_gen_brcond_tl(TCG_COND_NE, vaddr, hex_llsc_addr, fail);
 
-    one = tcg_const_i64(0xff);
-    zero = tcg_const_i64(0);
+    one = tcg_constant_i64(0xff);
+    zero = tcg_constant_i64(0);
     tmp = tcg_temp_new_i64();
     tcg_gen_atomic_cmpxchg_i64(tmp, hex_llsc_addr, hex_llsc_val_i64, src,
                                ctx->mem_idx, MO_64);
     tcg_gen_movcond_i64(TCG_COND_EQ, tmp, tmp, hex_llsc_val_i64,
                         one, zero);
     tcg_gen_extrl_i64_i32(pred, tmp);
-    tcg_temp_free_i64(one);
-    tcg_temp_free_i64(zero);
     tcg_temp_free_i64(tmp);
     tcg_gen_br(done);
 
@@ -396,9 +389,8 @@ static inline void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv src,
 static inline void gen_store1i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
                                DisasContext *ctx, int slot)
 {
-    TCGv tmp = tcg_const_tl(src);
+    TCGv tmp = tcg_constant_tl(src);
     gen_store1(cpu_env, vaddr, tmp, ctx, slot);
-    tcg_temp_free(tmp);
 }
 
 static inline void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src,
@@ -411,9 +403,8 @@ static inline void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src,
 static inline void gen_store2i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
                                DisasContext *ctx, int slot)
 {
-    TCGv tmp = tcg_const_tl(src);
+    TCGv tmp = tcg_constant_tl(src);
     gen_store2(cpu_env, vaddr, tmp, ctx, slot);
-    tcg_temp_free(tmp);
 }
 
 static inline void gen_store4(TCGv_env cpu_env, TCGv vaddr, TCGv src,
@@ -426,9 +417,8 @@ static inline void gen_store4(TCGv_env cpu_env, TCGv vaddr, TCGv src,
 static inline void gen_store4i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
                                DisasContext *ctx, int slot)
 {
-    TCGv tmp = tcg_const_tl(src);
+    TCGv tmp = tcg_constant_tl(src);
     gen_store4(cpu_env, vaddr, tmp, ctx, slot);
-    tcg_temp_free(tmp);
 }
 
 static inline void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src,
@@ -443,18 +433,15 @@ static inline void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src,
 static inline void gen_store8i(TCGv_env cpu_env, TCGv vaddr, int64_t src,
                                DisasContext *ctx, int slot)
 {
-    TCGv_i64 tmp = tcg_const_i64(src);
+    TCGv_i64 tmp = tcg_constant_i64(src);
     gen_store8(cpu_env, vaddr, tmp, ctx, slot);
-    tcg_temp_free_i64(tmp);
 }
 
 static TCGv gen_8bitsof(TCGv result, TCGv value)
 {
-    TCGv zero = tcg_const_tl(0);
-    TCGv ones = tcg_const_tl(0xff);
+    TCGv zero = tcg_constant_tl(0);
+    TCGv ones = tcg_constant_tl(0xff);
     tcg_gen_movcond_tl(TCG_COND_NE, result, value, zero, ones, zero);
-    tcg_temp_free(zero);
-    tcg_temp_free(ones);
 
     return result;
 }
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 6fb4e6853c1..8959683d0eb 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -54,9 +54,7 @@ static const char * const hexagon_prednames[] = {
 
 static void gen_exception_raw(int excp)
 {
-    TCGv_i32 helper_tmp = tcg_const_i32(excp);
-    gen_helper_raise_exception(cpu_env, helper_tmp);
-    tcg_temp_free_i32(helper_tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
 }
 
 static void gen_exec_counters(DisasContext *ctx)
@@ -288,7 +286,7 @@ static void gen_pred_writes(DisasContext *ctx, Packet *pkt)
      * write of the predicates.
      */
     if (pkt->pkt_has_endloop) {
-        TCGv zero = tcg_const_tl(0);
+        TCGv zero = tcg_constant_tl(0);
         TCGv pred_written = tcg_temp_new();
         for (i = 0; i < ctx->preg_log_idx; i++) {
             int pred_num = ctx->preg_log[i];
@@ -299,7 +297,6 @@ static void gen_pred_writes(DisasContext *ctx, Packet *pkt)
                                hex_new_pred_value[pred_num],
                                hex_pred[pred_num]);
         }
-        tcg_temp_free(zero);
         tcg_temp_free(pred_written);
     } else {
         for (i = 0; i < ctx->preg_log_idx; i++) {
@@ -317,11 +314,9 @@ static void gen_pred_writes(DisasContext *ctx, Packet *pkt)
 static void gen_check_store_width(DisasContext *ctx, int slot_num)
 {
     if (HEX_DEBUG) {
-        TCGv slot = tcg_const_tl(slot_num);
-        TCGv check = tcg_const_tl(ctx->store_width[slot_num]);
+        TCGv slot = tcg_constant_tl(slot_num);
+        TCGv check = tcg_constant_tl(ctx->store_width[slot_num]);
         gen_helper_debug_check_store_width(cpu_env, slot, check);
-        tcg_temp_free(slot);
-        tcg_temp_free(check);
     }
 }
 
@@ -403,9 +398,8 @@ void process_store(DisasContext *ctx, Packet *pkt, int slot_num)
                  * TCG generation time, we'll use a helper to
                  * avoid branching based on the width at runtime.
                  */
-                TCGv slot = tcg_const_tl(slot_num);
+                TCGv slot = tcg_constant_tl(slot_num);
                 gen_helper_commit_store(cpu_env, slot);
-                tcg_temp_free(slot);
             }
         }
         tcg_temp_free(address);
@@ -436,7 +430,7 @@ static void process_dczeroa(DisasContext *ctx, Packet *pkt)
     if (pkt->pkt_has_dczeroa) {
         /* Store 32 bytes of zero starting at (addr & ~0x1f) */
         TCGv addr = tcg_temp_new();
-        TCGv_i64 zero = tcg_const_i64(0);
+        TCGv_i64 zero = tcg_constant_i64(0);
 
         tcg_gen_andi_tl(addr, hex_dczero_addr, ~0x1f);
         tcg_gen_qemu_st64(zero, addr, ctx->mem_idx);
@@ -448,7 +442,6 @@ static void process_dczeroa(DisasContext *ctx, Packet *pkt)
         tcg_gen_qemu_st64(zero, addr, ctx->mem_idx);
 
         tcg_temp_free(addr);
-        tcg_temp_free_i64(zero);
     }
 }
 
@@ -478,15 +471,12 @@ static void gen_commit_packet(DisasContext *ctx, Packet *pkt)
     update_exec_counters(ctx, pkt);
     if (HEX_DEBUG) {
         TCGv has_st0 =
-            tcg_const_tl(pkt->pkt_has_store_s0 && !pkt->pkt_has_dczeroa);
+            tcg_constant_tl(pkt->pkt_has_store_s0 && !pkt->pkt_has_dczeroa);
         TCGv has_st1 =
-            tcg_const_tl(pkt->pkt_has_store_s1 && !pkt->pkt_has_dczeroa);
+            tcg_constant_tl(pkt->pkt_has_store_s1 && !pkt->pkt_has_dczeroa);
 
         /* Handy place to set a breakpoint at the end of execution */
         gen_helper_debug_commit_end(cpu_env, has_st0, has_st1);
-
-        tcg_temp_free(has_st0);
-        tcg_temp_free(has_st1);
     }
 
     if (pkt->pkt_has_cof) {
diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index 7ceb25b5f68..ca8a801baa0 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -403,7 +403,7 @@ def gen_tcg_func(f, tag, regs, imms):
         if hex_common.need_part1(tag):
             f.write("    TCGv part1 = tcg_const_tl(insn->part1);\n")
         if hex_common.need_slot(tag):
-            f.write("    TCGv slot = tcg_const_tl(insn->slot);\n")
+            f.write("    TCGv slot = tcg_constant_tl(insn->slot);\n")
         f.write("    gen_helper_%s(" % (tag))
         i=0
         ## If there is a scalar result, it is the return type
@@ -424,8 +424,6 @@ def gen_tcg_func(f, tag, regs, imms):
         if hex_common.need_slot(tag): f.write(", slot")
         if hex_common.need_part1(tag): f.write(", part1" )
         f.write(");\n")
-        if hex_common.need_slot(tag):
-            f.write("    tcg_temp_free(slot);\n")
         if hex_common.need_part1(tag):
             f.write("    tcg_temp_free(part1);\n")
         for immlett,bits,immshift in imms:
-- 
2.31.1



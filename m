Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB32D9A38
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:44:25 +0100 (CET)
Received: from localhost ([::1]:39656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kop5M-0005Uj-Fl
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSo-0002PB-SQ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:36 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:38654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSi-00042i-Ui
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:34 -0500
Received: by mail-oi1-x244.google.com with SMTP id x13so10203383oic.5
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7XP/q5eBCNmpZFQJA85me1/1KiBm/v6kAiLB9c+2Pvs=;
 b=GiV7gcv3XKDbVZGsX0vvXKovQKYimffbuvzUyTEJmK+5o6eLq0wwgUT42Mqqdr9JFB
 qQ/Q3pwlsWe7v+W2/TgzVs9+LzZ9jGLXpMU38fNeLcj/OZEHfix6/3xgj4eAQZkfCJKm
 sG0aZeKIfxUjppzPRvtIhWLDsiM+f9vIp73MMAmgdj75Fu/mxNhCOtLYUTDn546u23qv
 Nxib5/v6p0jxYmM3DW1JSdCMO4dub43aIdBjicX/CEfAzz7enRk0eC4PfuNf5qRG373Q
 606/IiOk3t0JIIp/QM/Y3kLa1pcaelC01lXt/d/NqZaoWddCKlIN03oyfSBcLhQ2UBkI
 bX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7XP/q5eBCNmpZFQJA85me1/1KiBm/v6kAiLB9c+2Pvs=;
 b=XmK5nMuIWknQu2tVTsQkkNxDGoW87VnnVzsd4CmT9gjeph5GCBXmrrM7MuJWanLMET
 6Z3amzPqTOM0wtf0T7tKeEb0nsmog8NRLjkcy/flvbWWiauU1h89xNjypLghQu8Xcl4W
 TQIs8V1+x2uGHcVt6K1sliwNc5KB+l2D6/UOOLbQcnEV69TAlJmsAX/Opa+dI2Nl6RTv
 9PmCJYqCGr3GB7182BTNE9Z+9l8GCQpZZnzgV+IIDNm5JUe0oJ5WLzqmDpZ5/pJTmPkb
 r/ClWNWU+Ce/Gqz8rKOUjERgLcwliBCnVq+IFo72x9XQJccQnXZUF8KA18T3lCTYSgRg
 lV+A==
X-Gm-Message-State: AOAM5325yMwUbkmQ3/87qFwXsJXyxT+kaM3CT7bu3881uGTVTOpsZDu/
 P3u/DVXioKIRTNlhYxsRmwmJzd+TEB9n7gma
X-Google-Smtp-Source: ABdhPJyhsM+kbCO+mNElsTKw9KD6cimKojW+9EJ/uePcwi7FZiBaV3Ag8QP9xotoJRg/Qruziwcfwg==
X-Received: by 2002:aca:bd0b:: with SMTP id n11mr17596790oif.11.1607954664570; 
 Mon, 14 Dec 2020 06:04:24 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 39/43] tcg/mips: Support split-wx code generation
Date: Mon, 14 Dec 2020 08:03:10 -0600
Message-Id: <20201214140314.18544-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h     |  2 +-
 tcg/mips/tcg-target.c.inc | 43 ++++++++++++++++++++++-----------------
 2 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index d6dff897bf..c200ac02ea 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -200,7 +200,7 @@ extern bool use_mips32r2_instructions;
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
-#define TCG_TARGET_SUPPORT_MIRROR       0
+#define TCG_TARGET_SUPPORT_MIRROR       1
 
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 37faf1356c..a2201bd1dd 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -139,17 +139,18 @@ static const TCGReg tcg_target_call_oarg_regs[2] = {
     TCG_REG_V1
 };
 
-static tcg_insn_unit *tb_ret_addr;
-static tcg_insn_unit *bswap32_addr;
-static tcg_insn_unit *bswap32u_addr;
-static tcg_insn_unit *bswap64_addr;
+static const tcg_insn_unit *tb_ret_addr;
+static const tcg_insn_unit *bswap32_addr;
+static const tcg_insn_unit *bswap32u_addr;
+static const tcg_insn_unit *bswap64_addr;
 
-static bool reloc_pc16(tcg_insn_unit *pc, const tcg_insn_unit *target)
+static bool reloc_pc16(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 {
     /* Let the compiler perform the right-shift as part of the arithmetic.  */
-    ptrdiff_t disp = target - (pc + 1);
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    ptrdiff_t disp = target - (src_rx + 1);
     if (disp == (int16_t)disp) {
-        *pc = deposit32(*pc, 0, 16, disp);
+        *src_rw = deposit32(*src_rw, 0, 16, disp);
         return true;
     }
     return false;
@@ -505,7 +506,7 @@ static void tcg_out_opc_sa64(TCGContext *s, MIPSInsn opc1, MIPSInsn opc2,
 static bool tcg_out_opc_jmp(TCGContext *s, MIPSInsn opc, const void *target)
 {
     uintptr_t dest = (uintptr_t)target;
-    uintptr_t from = (uintptr_t)s->code_ptr + 4;
+    uintptr_t from = (uintptr_t)tcg_splitwx_to_rx(s->code_ptr) + 4;
     int32_t inst;
 
     /* The pc-region branch happens within the 256MB region of
@@ -617,7 +618,7 @@ static inline void tcg_out_bswap16s(TCGContext *s, TCGReg ret, TCGReg arg)
     }
 }
 
-static void tcg_out_bswap_subr(TCGContext *s, tcg_insn_unit *sub)
+static void tcg_out_bswap_subr(TCGContext *s, const tcg_insn_unit *sub)
 {
     bool ok = tcg_out_opc_jmp(s, OPC_JAL, sub);
     tcg_debug_assert(ok);
@@ -1282,7 +1283,8 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOpIdx oi,
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
     label->addrhi_reg = addrhi;
-    label->raddr = raddr;
+    /* TODO: Cast goes away when all hosts converted */
+    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr[0];
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
         label->label_ptr[1] = label_ptr[1];
@@ -1291,15 +1293,16 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOpIdx oi,
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
+    const tcg_insn_unit *tgt_rx = tcg_splitwx_to_rx(s->code_ptr);
     TCGMemOpIdx oi = l->oi;
     MemOp opc = get_memop(oi);
     TCGReg v0;
     int i;
 
     /* resolve label address */
-    if (!reloc_pc16(l->label_ptr[0], s->code_ptr)
+    if (!reloc_pc16(l->label_ptr[0], tgt_rx)
         || (TCG_TARGET_REG_BITS < TARGET_LONG_BITS
-            && !reloc_pc16(l->label_ptr[1], s->code_ptr))) {
+            && !reloc_pc16(l->label_ptr[1], tgt_rx))) {
         return false;
     }
 
@@ -1344,15 +1347,16 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
+    const tcg_insn_unit *tgt_rx = tcg_splitwx_to_rx(s->code_ptr);
     TCGMemOpIdx oi = l->oi;
     MemOp opc = get_memop(oi);
     MemOp s_bits = opc & MO_SIZE;
     int i;
 
     /* resolve label address */
-    if (!reloc_pc16(l->label_ptr[0], s->code_ptr)
+    if (!reloc_pc16(l->label_ptr[0], tgt_rx)
         || (TCG_TARGET_REG_BITS < TARGET_LONG_BITS
-            && !reloc_pc16(l->label_ptr[1], s->code_ptr))) {
+            && !reloc_pc16(l->label_ptr[1], tgt_rx))) {
         return false;
     }
 
@@ -2469,11 +2473,12 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    tcg_code_gen_epilogue = s->code_ptr;
+    /* TODO: Cast goes away when all hosts converted */
+    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_V0, TCG_REG_ZERO);
 
     /* TB epilogue */
-    tb_ret_addr = s->code_ptr;
+    tb_ret_addr = tcg_splitwx_to_rx(s->code_ptr);
     for (i = 0; i < ARRAY_SIZE(tcg_target_callee_save_regs); i++) {
         tcg_out_ld(s, TCG_TYPE_REG, tcg_target_callee_save_regs[i],
                    TCG_REG_SP, SAVE_OFS + i * REG_SIZE);
@@ -2493,7 +2498,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     /*
      * bswap32 -- 32-bit swap (signed result for mips64).  a0 = abcd.
      */
-    bswap32_addr = align_code_ptr(s);
+    bswap32_addr = tcg_splitwx_to_rx(align_code_ptr(s));
     /* t3 = (ssss)d000 */
     tcg_out_opc_sa(s, OPC_SLL, TCG_TMP3, TCG_TMP0, 24);
     /* t1 = 000a */
@@ -2521,7 +2526,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     /*
      * bswap32u -- unsigned 32-bit swap.  a0 = ....abcd.
      */
-    bswap32u_addr = align_code_ptr(s);
+    bswap32u_addr = tcg_splitwx_to_rx(align_code_ptr(s));
     /* t1 = (0000)000d */
     tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP1, TCG_TMP0, 0xff);
     /* t3 = 000a */
@@ -2547,7 +2552,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     /*
      * bswap64 -- 64-bit swap.  a0 = abcdefgh
      */
-    bswap64_addr = align_code_ptr(s);
+    bswap64_addr = tcg_splitwx_to_rx(align_code_ptr(s));
     /* t3 = h0000000 */
     tcg_out_dsll(s, TCG_TMP3, TCG_TMP0, 56);
     /* t1 = 0000000a */
-- 
2.25.1



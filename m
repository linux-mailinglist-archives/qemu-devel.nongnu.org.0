Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A622D997E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:12:50 +0100 (CET)
Received: from localhost ([::1]:34510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooan-00020g-B9
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooST-00028g-9T
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:13 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:42841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSO-000413-Br
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:12 -0500
Received: by mail-oi1-x236.google.com with SMTP id l200so19211465oig.9
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5mvFKOnWShEy7XopvqpBj0eW6OOFV8aAjUBBwextvEA=;
 b=CfyeYFV8SdC7hbLv4LvDFNzS81tkpl+g4l+8/Lwig2OIvyrcMIKj4R+d1QGJAywpwH
 0qXY4hyPWuN3wYj2MYkD48YwO+Eegws3QN4uCOEY/3TDgcXbvYQ4Z3ak1GqRvjfWLPK5
 ymY61fZuE716ATT2TKfPvTc2gBm6yHs2Dfpof4/Vhv/vySAej28/0UrlnzvoOKSbGegW
 U2sIn5TdugofVSVeVd0g2N7AZsdEhKdyzFcLrxzL0wkZYm7pYCQP60mDv+7IOfhc4exq
 17FVmoG7xNF9L3TZiDAIavDqp/qrW7qfGANRdgz0MXw2xli4y4TPtVTGXK1uEKX6vW6e
 5pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5mvFKOnWShEy7XopvqpBj0eW6OOFV8aAjUBBwextvEA=;
 b=Tm0Cmm/bSBpRcKmJATLZM3FezxaIntB8Jl4SE9ifjQ0kVA2Yt9a++5MNuEtuV5wOd6
 J8tYSYJWB5rF8F736D4DfbE7HkyEBpgqDIE+8svfwPoAwRVskfKTGbTZEn96iTA7DZro
 aztvCAF5fIVxcZ/hQN99mopiEPhwzzJS3l/PdswLbUV4Y+p3t9A/xSSQPqg7p5mxn9Cm
 zsZViEWzMlsxSl39cIw4bP5OWMnPX2WjE+O/e334XPrKLMn+TKL4CDQbOYsYttPNmXgK
 50YZzx1EF1MTwT+Eqz+7BN4wdu+QL5pfWzBpkdDkEQnfd4Pt3XOOxx9NfeH7TFI7TkTS
 6Tkw==
X-Gm-Message-State: AOAM531NSQ8qe4pryAxAtjj37kVo+xdJnFTE8RU+4MEFxzf2qIJ434GH
 oPaElDD/Pz+CBhg1JjEbo8EScnSnAmEwVldI
X-Google-Smtp-Source: ABdhPJxVw138CBf5HXorjU4QHUTj+TdOjWhp3c5umivmQXdL/gGXtxlQtkdmmN4rs1nZGtTh9C38qw==
X-Received: by 2002:aca:d842:: with SMTP id p63mr18468904oig.139.1607954646961; 
 Mon, 14 Dec 2020 06:04:06 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 31/43] tcg/sparc: Support split-wx code generation
Date: Mon, 14 Dec 2020 08:03:02 -0600
Message-Id: <20201214140314.18544-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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
 tcg/sparc/tcg-target.h     |  2 +-
 tcg/sparc/tcg-target.c.inc | 24 +++++++++++++-----------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 21e7e2f56f..54b9da9aeb 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -171,6 +171,6 @@ extern bool use_vis3_instructions;
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       0
+#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 8f04fdf981..182124b96c 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -291,14 +291,15 @@ static inline int check_fit_i32(int32_t val, unsigned int bits)
 # define check_fit_ptr  check_fit_i32
 #endif
 
-static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
+static bool patch_reloc(tcg_insn_unit *src_rw, int type,
                         intptr_t value, intptr_t addend)
 {
-    uint32_t insn = *code_ptr;
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    uint32_t insn = *src_rw;
     intptr_t pcrel;
 
     value += addend;
-    pcrel = tcg_ptr_byte_diff((tcg_insn_unit *)value, code_ptr);
+    pcrel = tcg_ptr_byte_diff((tcg_insn_unit *)value, src_rx);
 
     switch (type) {
     case R_SPARC_WDISP16:
@@ -315,7 +316,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
         g_assert_not_reached();
     }
 
-    *code_ptr = insn;
+    *src_rw = insn;
     return true;
 }
 
@@ -868,8 +869,8 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
 }
 
 #ifdef CONFIG_SOFTMMU
-static tcg_insn_unit *qemu_ld_trampoline[16];
-static tcg_insn_unit *qemu_st_trampoline[16];
+static const tcg_insn_unit *qemu_ld_trampoline[16];
+static const tcg_insn_unit *qemu_st_trampoline[16];
 
 static void emit_extend(TCGContext *s, TCGReg r, int op)
 {
@@ -930,7 +931,7 @@ static void build_trampolines(TCGContext *s)
         while ((uintptr_t)s->code_ptr & 15) {
             tcg_out_nop(s);
         }
-        qemu_ld_trampoline[i] = s->code_ptr;
+        qemu_ld_trampoline[i] = tcg_splitwx_to_rx(s->code_ptr);
 
         if (SPARC64 || TARGET_LONG_BITS == 32) {
             ra = TCG_REG_O3;
@@ -958,7 +959,7 @@ static void build_trampolines(TCGContext *s)
         while ((uintptr_t)s->code_ptr & 15) {
             tcg_out_nop(s);
         }
-        qemu_st_trampoline[i] = s->code_ptr;
+        qemu_st_trampoline[i] = tcg_splitwx_to_rx(s->code_ptr);
 
         if (SPARC64) {
             emit_extend(s, TCG_REG_O2, i);
@@ -1038,7 +1039,8 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out_nop(s);
 
     /* Epilogue for goto_ptr.  */
-    tcg_code_gen_epilogue = s->code_ptr;
+    /* TODO: Cast goes away when all hosts converted */
+    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
     /* delay slot */
     tcg_out_movi_imm13(s, TCG_REG_O0, 0);
@@ -1163,7 +1165,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 #ifdef CONFIG_SOFTMMU
     unsigned memi = get_mmuidx(oi);
     TCGReg addrz, param;
-    tcg_insn_unit *func;
+    const tcg_insn_unit *func;
     tcg_insn_unit *label_ptr;
 
     addrz = tcg_out_tlb_load(s, addr, memi, memop,
@@ -1245,7 +1247,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
 #ifdef CONFIG_SOFTMMU
     unsigned memi = get_mmuidx(oi);
     TCGReg addrz, param;
-    tcg_insn_unit *func;
+    const tcg_insn_unit *func;
     tcg_insn_unit *label_ptr;
 
     addrz = tcg_out_tlb_load(s, addr, memi, memop,
-- 
2.25.1



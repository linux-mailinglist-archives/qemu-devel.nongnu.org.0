Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EE36F8AF2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:27:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vV-0000oS-Sg; Fri, 05 May 2023 17:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vT-0000mj-F9
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:15 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vN-0004ev-9E
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3062c1e7df8so1561438f8f.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321906; x=1685913906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9gzBsBjNi69rBqU30/4XrEpjrpJ6MM+4FytYgW6co40=;
 b=GF4IS9Km+m4zOmTaU20reXjv2kLIAOHtBpaSiPKFtGyWn/Seq4t54+q0TZNeUA3EBr
 qK0910pMZEXXwfOmY0xTR49HfDILTxtTawCBVUfSx7ovKSawuqifLlMg8Ie73gSmGjBe
 GSEL3UBkcxelahdpcn0MLXtZHnkqz1E/kbjZNxnyYsBJmJOeIAj7BgMyN/ukVfFFZ4MY
 lGv5nmaogn4quAfKoE3M124svQCYj6Cl+9UHLIQl7ATQbg0Aa3aiPEUrTQ7OJzAwM6km
 sfzs81FwBHm3resoVKZw9XQILvgiEjSvme4RhbwcfSAjT7T7A+PoF5OtO8pqFvrkTs4A
 lknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321906; x=1685913906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gzBsBjNi69rBqU30/4XrEpjrpJ6MM+4FytYgW6co40=;
 b=M5QyA+nQ9WZ43pMNJmE68sNGS+luOCQzMps7Cy9AlTXit2DIU8jMcMXn6QvlBJnY34
 U5FzLdGLEjat3ovrPL41svvCOMuzM4q5Xp8qqvK01Qn+JTKN3HyIJimMn4u9bOiZaYTO
 M12sKJqmiundaubsKXjkR743MLny3zuouHKlB0V/NfHSRKGC4K7sYbDhHzobERiCuxxn
 uyZlT2kvdvB94zhsdAUwgqGkwdPawLnHcuR3FFS4sCnOB4bgg6rb570IL+BS4kroT5Ei
 cWC5oo6baqRcAjPeC/fpE+ahkhKMs6s/0gzqlMPJQacg3J8gXsK5N05MwMzBWUOZCenK
 ygxw==
X-Gm-Message-State: AC+VfDy4fBCX29w9hLfyttgzkYlOm4vEBzNJHBstpfdu/NaSxa8e+cdP
 fLZkC8eu7yznlnaIS0IlO1jyzD9kPKCQxI95sEMz2Q==
X-Google-Smtp-Source: ACHHUZ4hIt92OiGaSvzj0CDGeGspPtaIzVzi92HWZ8xnMwanP1MCj+uQIr9Kdi2hNnxKWWmPkMm0Hg==
X-Received: by 2002:a05:6000:cd:b0:306:37ac:ef8c with SMTP id
 q13-20020a05600000cd00b0030637acef8cmr2493281wrx.39.1683321906587; 
 Fri, 05 May 2023 14:25:06 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:25:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 32/42] tcg/ppc: Introduce HostAddress
Date: Fri,  5 May 2023 22:24:37 +0100
Message-Id: <20230505212447.374546-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Collect the parts of the host address into a struct.
Reorg tcg_out_qemu_{ld,st} to use it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 90 +++++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 43 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index d1aa2a9f53..cd473deb36 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2287,67 +2287,71 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     return tcg_out_fail_alignment(s, l);
 }
-
 #endif /* SOFTMMU */
 
+typedef struct {
+    TCGReg base;
+    TCGReg index;
+} HostAddress;
+
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             TCGReg addrlo, TCGReg addrhi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
     MemOp s_bits = opc & MO_SIZE;
-    TCGReg rbase;
+    HostAddress h;
 
 #ifdef CONFIG_SOFTMMU
     tcg_insn_unit *label_ptr;
 
-    addrlo = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), true);
+    h.index = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), true);
+    h.base = TCG_REG_R3;
 
     /* Load a pointer into the current opcode w/conditional branch-link. */
     label_ptr = s->code_ptr;
     tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
-
-    rbase = TCG_REG_R3;
 #else  /* !CONFIG_SOFTMMU */
     unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
     }
-    rbase = guest_base ? TCG_GUEST_BASE_REG : 0;
+    h.base = guest_base ? TCG_GUEST_BASE_REG : 0;
+    h.index = addrlo;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
         tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
-        addrlo = TCG_REG_TMP1;
+        h.index = TCG_REG_TMP1;
     }
 #endif
 
     if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
         if (opc & MO_BSWAP) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, LWBRX | TAB(datalo, rbase, addrlo));
-            tcg_out32(s, LWBRX | TAB(datahi, rbase, TCG_REG_R0));
-        } else if (rbase != 0) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, LWZX | TAB(datahi, rbase, addrlo));
-            tcg_out32(s, LWZX | TAB(datalo, rbase, TCG_REG_R0));
-        } else if (addrlo == datahi) {
-            tcg_out32(s, LWZ | TAI(datalo, addrlo, 4));
-            tcg_out32(s, LWZ | TAI(datahi, addrlo, 0));
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, h.index, 4));
+            tcg_out32(s, LWBRX | TAB(datalo, h.base, h.index));
+            tcg_out32(s, LWBRX | TAB(datahi, h.base, TCG_REG_R0));
+        } else if (h.base != 0) {
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, h.index, 4));
+            tcg_out32(s, LWZX | TAB(datahi, h.base, h.index));
+            tcg_out32(s, LWZX | TAB(datalo, h.base, TCG_REG_R0));
+        } else if (h.index == datahi) {
+            tcg_out32(s, LWZ | TAI(datalo, h.index, 4));
+            tcg_out32(s, LWZ | TAI(datahi, h.index, 0));
         } else {
-            tcg_out32(s, LWZ | TAI(datahi, addrlo, 0));
-            tcg_out32(s, LWZ | TAI(datalo, addrlo, 4));
+            tcg_out32(s, LWZ | TAI(datahi, h.index, 0));
+            tcg_out32(s, LWZ | TAI(datalo, h.index, 4));
         }
     } else {
         uint32_t insn = qemu_ldx_opc[opc & (MO_BSWAP | MO_SSIZE)];
         if (!have_isa_2_06 && insn == LDBRX) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, LWBRX | TAB(datalo, rbase, addrlo));
-            tcg_out32(s, LWBRX | TAB(TCG_REG_R0, rbase, TCG_REG_R0));
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, h.index, 4));
+            tcg_out32(s, LWBRX | TAB(datalo, h.base, h.index));
+            tcg_out32(s, LWBRX | TAB(TCG_REG_R0, h.base, TCG_REG_R0));
             tcg_out_rld(s, RLDIMI, datalo, TCG_REG_R0, 32, 0);
         } else if (insn) {
-            tcg_out32(s, insn | TAB(datalo, rbase, addrlo));
+            tcg_out32(s, insn | TAB(datalo, h.base, h.index));
         } else {
             insn = qemu_ldx_opc[opc & (MO_SIZE | MO_BSWAP)];
-            tcg_out32(s, insn | TAB(datalo, rbase, addrlo));
+            tcg_out32(s, insn | TAB(datalo, h.base, h.index));
             tcg_out_movext(s, TCG_TYPE_REG, datalo,
                            TCG_TYPE_REG, opc & MO_SSIZE, datalo);
         }
@@ -2365,52 +2369,52 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
 {
     MemOp opc = get_memop(oi);
     MemOp s_bits = opc & MO_SIZE;
-    TCGReg rbase;
+    HostAddress h;
 
 #ifdef CONFIG_SOFTMMU
     tcg_insn_unit *label_ptr;
 
-    addrlo = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), false);
+    h.index = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), false);
+    h.base = TCG_REG_R3;
 
     /* Load a pointer into the current opcode w/conditional branch-link. */
     label_ptr = s->code_ptr;
     tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
-
-    rbase = TCG_REG_R3;
 #else  /* !CONFIG_SOFTMMU */
     unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
     }
-    rbase = guest_base ? TCG_GUEST_BASE_REG : 0;
+    h.base = guest_base ? TCG_GUEST_BASE_REG : 0;
+    h.index = addrlo;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
         tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
-        addrlo = TCG_REG_TMP1;
+        h.index = TCG_REG_TMP1;
     }
 #endif
 
     if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
         if (opc & MO_BSWAP) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, STWBRX | SAB(datalo, rbase, addrlo));
-            tcg_out32(s, STWBRX | SAB(datahi, rbase, TCG_REG_R0));
-        } else if (rbase != 0) {
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
-            tcg_out32(s, STWX | SAB(datahi, rbase, addrlo));
-            tcg_out32(s, STWX | SAB(datalo, rbase, TCG_REG_R0));
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, h.index, 4));
+            tcg_out32(s, STWBRX | SAB(datalo, h.base, h.index));
+            tcg_out32(s, STWBRX | SAB(datahi, h.base, TCG_REG_R0));
+        } else if (h.base != 0) {
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, h.index, 4));
+            tcg_out32(s, STWX | SAB(datahi, h.base, h.index));
+            tcg_out32(s, STWX | SAB(datalo, h.base, TCG_REG_R0));
         } else {
-            tcg_out32(s, STW | TAI(datahi, addrlo, 0));
-            tcg_out32(s, STW | TAI(datalo, addrlo, 4));
+            tcg_out32(s, STW | TAI(datahi, h.index, 0));
+            tcg_out32(s, STW | TAI(datalo, h.index, 4));
         }
     } else {
         uint32_t insn = qemu_stx_opc[opc & (MO_BSWAP | MO_SIZE)];
         if (!have_isa_2_06 && insn == STDBRX) {
-            tcg_out32(s, STWBRX | SAB(datalo, rbase, addrlo));
-            tcg_out32(s, ADDI | TAI(TCG_REG_TMP1, addrlo, 4));
+            tcg_out32(s, STWBRX | SAB(datalo, h.base, h.index));
+            tcg_out32(s, ADDI | TAI(TCG_REG_TMP1, h.index, 4));
             tcg_out_shri64(s, TCG_REG_R0, datalo, 32);
-            tcg_out32(s, STWBRX | SAB(TCG_REG_R0, rbase, TCG_REG_TMP1));
+            tcg_out32(s, STWBRX | SAB(TCG_REG_R0, h.base, TCG_REG_TMP1));
         } else {
-            tcg_out32(s, insn | SAB(datalo, rbase, addrlo));
+            tcg_out32(s, insn | SAB(datalo, h.base, h.index));
         }
     }
 
-- 
2.34.1



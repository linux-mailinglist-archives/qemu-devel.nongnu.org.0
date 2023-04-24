Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C751F6EC50A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:48:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqozw-0005De-KW; Mon, 24 Apr 2023 01:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxg-0005kf-8o
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowz-0004OO-Kh
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:03 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so41271405e9.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314880; x=1684906880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4Mzsk+fdTdRzO55PgLGhFQu8iRIHSF0DlOUqjWQl44=;
 b=hmxM+fRHFwdj9LtEJ53wM0yG0Yi5V6s4w2ts/PIjVVF3UQIsDxEHylRwLvG+mZ71m0
 jy5rpxYkizKfFz+1P9egnjW6C+UVNpZWODOCZstQMS0l31t1zuYmpZA/3PwFWySrAIjr
 BsgAcVTicz1T+ChqxyH/LNlcsmrOu+tXF2e23kEMC8d9yt2WM5EeYdJUpA0eSbixu7Ax
 bSFhT+BGsuyTIvdV9mL2TsvvhGZJjv8gljIb4bMJVv8aS163Emy+g1Pla5wCprpXdz7U
 ZOpeigJgLWlmm8qMcRqvHcCAKoMx98RYsC8mJkMFs9dJT+V01qraxy3OZG24J0i9hQCl
 Jbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314880; x=1684906880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z4Mzsk+fdTdRzO55PgLGhFQu8iRIHSF0DlOUqjWQl44=;
 b=DTAHj9usWLHUW7hlq8G5eKzNbFttD5YmDKCC8g1eFq1LXwTpjwGbagMgav+ESrD/NI
 DsVYuywOM0dp+gNNCkaHChfKSyuFucY0OTLnnPQb+NOPxl/Px4i309kjutWUiePR7Vrj
 9LPbQ1BBwtCbQ/v3U4O/u6zSOR25V1eAR5/ruqqPeJ6KVwouvysNIRcCba4QR1cg2spD
 KOa1167lcr3BDLrydn2Llp1fSxOlvKNs7Xahmz4BM1iMuWBuz8ySGBzDOSZxjXlWsp1j
 uK5XeRklQde7g8aLNYXhfhQ8ZAo5RdxbtaNPyTA6SQA/lajYgAAB7PfcDwXyjjaol2Ke
 8mUg==
X-Gm-Message-State: AAQBX9d3eM/hPBq5vz6i+qlGDdqlF7bmRI//84Q17lE/RZb76p/eTg7D
 /ZEhnce9lEKGedGO1XnmP2UkLJCEew0jTOd5jK5/LA==
X-Google-Smtp-Source: AKy350ZpQrfhnf7TjmYJJJfB2EH3TukmqtYb1VC+oZa+a1ZOkgH/cyqiV6ONiJ7mFJo/4cMPFV7zvg==
X-Received: by 2002:a7b:cd96:0:b0:3f1:8338:4b8c with SMTP id
 y22-20020a7bcd96000000b003f183384b8cmr6893866wmj.1.1682314880009; 
 Sun, 23 Apr 2023 22:41:20 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 24/57] tcg/ppc: Introduce HostAddress
Date: Mon, 24 Apr 2023 06:40:32 +0100
Message-Id: <20230424054105.1579315-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Collect the parts of the host address into a struct.
Reorg tcg_out_qemu_{ld,st} to use it.

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



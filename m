Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CD84B1BBA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:58:46 +0100 (CET)
Received: from localhost ([::1]:39624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nILCv-0005CO-4N
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:58:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnZ-0004s7-Jp
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:34 -0500
Received: from [2607:f8b0:4864:20::1035] (port=40562
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnX-0007S1-3w
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:33 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 c8-20020a17090a674800b001b91184b732so7978036pjm.5
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pHwGtxTPnKymye/vw/7yD1dXIO9OSaibyYfhujQ3zXk=;
 b=abYgKwCtySDPROOH18RqPEe1kKpXg75l4jk2gelP7aiSJA1rLOUoz3R0YPYy49+zak
 OqR/RoT3b5JpxOsONf+0v+LYiBshi8L0IBNxgnwvh04wkwbECrWE/t09uyBrhtXTRMDa
 T5Y0+Jt97j+5NPNltIwrdMzeZlcur3dd7vGw4rFEvYwKC71SgPL10ltRadM6a/uJ9wY8
 9MxYcUpTcShLWP3CjV0yXuXhlfOyMDL6snjvHH9OQ5LgE2l4nVvQCLA74CEfohAYc9hM
 VGoa401f3277mVKITYZGOY7FDfeLljYvHKj2gql0sMPIwvv9golsUa7yHlY6v5g3RYoU
 erxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pHwGtxTPnKymye/vw/7yD1dXIO9OSaibyYfhujQ3zXk=;
 b=Yv/w0NGcRJjvDkNC+RtF3FjTwIOT5Pyn0SwTelo3fsvA0rjeSElazYZcCDhZK+6Q1l
 qvKmzmyy6b1Z4dnJNEiBglDZxjNcvJTsIyYDkwoFeXu1chW0LK9vGLdzkpFrS+iPb3LR
 dan2rOqEdbrRKRwPBLNmv3hm7g+jUnYTEjhbST7GSJaZERXuv9tQarlR5uukM3V4Zbzg
 VmcyL6k7cJEWe/epg693R+hhuI1Jw4PDOI/IkozJ60Rxxiwk8ZmkDp5s91+7ab3kcXI7
 8oAmi21dgO9Si040RvpB6YxxGkdN1jBiJELgTVTx7QPADZrKgeruJnjABKZttocG419J
 SqAg==
X-Gm-Message-State: AOAM533yVET2S1i7vMyXLowV4fFXkkER2ExNgIYcrvouQsGNAxattUzj
 RsDlKltPpaLCjTDPIHrn8fpstKd1/Zxq2TcX
X-Google-Smtp-Source: ABdhPJyVJoga69sMANR3Y5bcF25BcFcrCuzz3fEQyxN2ZO4EA4u8iepSbJMUvizifZHNidkOqnnBuw==
X-Received: by 2002:a17:902:a512:: with SMTP id
 s18mr9813555plq.51.1644543149917; 
 Thu, 10 Feb 2022 17:32:29 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/34] tcg/arm: Reserve a register for guest_base
Date: Fri, 11 Feb 2022 12:30:47 +1100
Message-Id: <20220211013059.17994-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reserve a register for the guest_base using aarch64 for reference.
By doing so, we do not have to recompute it for every memory load.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index d290b4556c..7eebbfaf02 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -84,6 +84,9 @@ static const int tcg_target_call_oarg_regs[2] = {
 
 #define TCG_REG_TMP  TCG_REG_R12
 #define TCG_VEC_TMP  TCG_REG_Q15
+#ifndef CONFIG_SOFTMMU
+#define TCG_REG_GUEST_BASE  TCG_REG_R11
+#endif
 
 typedef enum {
     COND_EQ = 0x0,
@@ -1593,7 +1596,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
                                   TCGReg datalo, TCGReg datahi,
-                                  TCGReg addrlo, TCGReg addend)
+                                  TCGReg addrlo, TCGReg addend,
+                                  bool scratch_addend)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
@@ -1619,7 +1623,7 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
         if (get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, addend);
-        } else if (datalo != addend) {
+        } else if (scratch_addend) {
             tcg_out_ld32_rwb(s, COND_AL, datalo, addend, addrlo);
             tcg_out_ld32_12(s, COND_AL, datahi, addend, 4);
         } else {
@@ -1703,14 +1707,14 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
     label_ptr = s->code_ptr;
     tcg_out_bl_imm(s, COND_NE, 0);
 
-    tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, addend);
+    tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, addend, true);
 
     add_qemu_ldst_label(s, true, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     if (guest_base) {
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP, guest_base);
-        tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, TCG_REG_TMP);
+        tcg_out_qemu_ld_index(s, opc, datalo, datahi,
+                              addrlo, TCG_REG_GUEST_BASE, false);
     } else {
         tcg_out_qemu_ld_direct(s, opc, datalo, datahi, addrlo);
     }
@@ -1719,7 +1723,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 
 static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
                                   TCGReg datalo, TCGReg datahi,
-                                  TCGReg addrlo, TCGReg addend)
+                                  TCGReg addrlo, TCGReg addend,
+                                  bool scratch_addend)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
@@ -1739,9 +1744,14 @@ static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
         if (get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_strd_r(s, cond, datalo, addrlo, addend);
-        } else {
+        } else if (scratch_addend) {
             tcg_out_st32_rwb(s, cond, datalo, addend, addrlo);
             tcg_out_st32_12(s, cond, datahi, addend, 4);
+        } else {
+            tcg_out_dat_reg(s, cond, ARITH_ADD, TCG_REG_TMP,
+                            addend, addrlo, SHIFT_IMM_LSL(0));
+            tcg_out_st32_12(s, cond, datalo, TCG_REG_TMP, 0);
+            tcg_out_st32_12(s, cond, datahi, TCG_REG_TMP, 4);
         }
         break;
     default:
@@ -1804,7 +1814,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     mem_index = get_mmuidx(oi);
     addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, mem_index, 0);
 
-    tcg_out_qemu_st_index(s, COND_EQ, opc, datalo, datahi, addrlo, addend);
+    tcg_out_qemu_st_index(s, COND_EQ, opc, datalo, datahi,
+                          addrlo, addend, true);
 
     /* The conditional call must come last, as we're going to return here.  */
     label_ptr = s->code_ptr;
@@ -1814,9 +1825,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     if (guest_base) {
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP, guest_base);
-        tcg_out_qemu_st_index(s, COND_AL, opc, datalo,
-                              datahi, addrlo, TCG_REG_TMP);
+        tcg_out_qemu_st_index(s, COND_AL, opc, datalo, datahi,
+                              addrlo, TCG_REG_GUEST_BASE, false);
     } else {
         tcg_out_qemu_st_direct(s, opc, datalo, datahi, addrlo);
     }
@@ -2958,6 +2968,13 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
     tcg_out_mov(s, TCG_TYPE_PTR, TCG_AREG0, tcg_target_call_iarg_regs[0]);
 
+#ifndef CONFIG_SOFTMMU
+    if (guest_base) {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_GUEST_BASE, guest_base);
+        tcg_regset_set_reg(s->reserved_regs, TCG_REG_GUEST_BASE);
+    }
+#endif
+
     tcg_out_b_reg(s, COND_AL, tcg_target_call_iarg_regs[1]);
 
     /*
-- 
2.25.1



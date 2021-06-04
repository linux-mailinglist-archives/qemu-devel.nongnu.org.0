Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5556739C116
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:14:06 +0200 (CEST)
Received: from localhost ([::1]:50262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGCi-0008WV-A2
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGAy-0005cn-Hf
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:16 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGAv-0005IR-Vq
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:16 -0400
Received: by mail-pf1-x431.google.com with SMTP id t28so8234733pfg.10
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7WBmKaaDBnqx8/b/uuVnTF9efjpwsBpvtLLAQjoYELA=;
 b=XdEORA1RyO62HcVC+8uicyaXd2SRLNJrFk/ZMpJcOJ6a32JoDtuQaX8/gljsb/CqMl
 DNZf/kv9vk0E4VVhNpZsdu2LTHets3gdRhfvfZSEG24mk88ZsJNXv0OkQRFd3ePazyGg
 Br0vcw94cMCDM2EtWyReNxgtfEcfCV6gBHaJJ+xapSpKOceCQb/fmAgkovdE6SeuJp2G
 ixgeSshRFPzQZzK1+xYROVrlooEPFCkeZ/TNTGXop7/nIHgxNDYSmJRNw9uqdfv9F4Y/
 nsse8DNRODswdX2i0sWpqeTaa36RIev7pKtrJzBPFbzCx6Tb5QSrbV6cQC4trxkNEQ1E
 qvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7WBmKaaDBnqx8/b/uuVnTF9efjpwsBpvtLLAQjoYELA=;
 b=GVfqKeuaOtjoVhp8NLUvs7y6Y/Se0Uqxo2afs5rzcI9xyHnULEzKWTD5S3eQKgSdJx
 I9uk0i/0T25E1wlOyaRBvuMuQdDIv8LpbT8SDpGHCm2c3ITCf9wT8PJc6M99D0qG4pJp
 1Aiy/N1fkb8C1OM5f8atP4ZyJWAfIpya5neHVC2KMoJHdgCQ5c66G+eWJJhj3RkjOcYf
 nesr7YBGGNltBWElCQsaLpHBvakNnex2bU2kJPd6sl1jl8Avx0xyyWSGzqIpgzaGhysh
 2nsdvZ6o9FgGgm9q8Da0JSZQNPfOvt9PKJAr/Yb5isk4xL7sTecO8+IblkQ2ebWtspc5
 oH+g==
X-Gm-Message-State: AOAM533SHWniYZtOkGEdbM4hWLsoEAO4+D5wJw/2dlnr0AweBcPDLdge
 tDZa7VRyVqODZtKLQu7PHp/HoLyN3C9w0g==
X-Google-Smtp-Source: ABdhPJzuuwYRygfwax5MazBttOxqSouOei54seNf8DKEA4ESnQuWGj75027xRo/doyiAaHdzVSCShQ==
X-Received: by 2002:a65:6291:: with SMTP id f17mr6560512pgv.280.1622837532677; 
 Fri, 04 Jun 2021 13:12:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/15] tcg/arm: Implement tcg_out_ld/st for vector types
Date: Fri,  4 Jun 2021 13:11:58 -0700
Message-Id: <20210604201210.920136-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 70 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 64 insertions(+), 6 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 4770d0c537..c6cfb83308 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -172,6 +172,9 @@ typedef enum {
     INSN_NOP_v6k   = 0xe320f000,
     /* Otherwise the assembler uses mov r0,r0 */
     INSN_NOP_v4    = (COND_AL << 28) | ARITH_MOV,
+
+    INSN_VLD1      = 0xf4200000,  /* VLD1 (multiple single elements) */
+    INSN_VST1      = 0xf4000000,  /* VST1 (multiple single elements) */
 } ARMInsn;
 
 #define INSN_NOP   (use_armv7_instructions ? INSN_NOP_v6k : INSN_NOP_v4)
@@ -1093,6 +1096,33 @@ static TCGCond tcg_out_cmp2(TCGContext *s, const TCGArg *args,
     }
 }
 
+/*
+ * Note that TCGReg references Q-registers.
+ * Q-regno = 2 * D-regno, so shift left by 1 whlie inserting.
+ */
+static uint32_t encode_vd(TCGReg rd)
+{
+    tcg_debug_assert(rd >= TCG_REG_Q0);
+    return (extract32(rd, 3, 1) << 22) | (extract32(rd, 0, 3) << 13);
+}
+
+static void tcg_out_vldst(TCGContext *s, ARMInsn insn,
+                          TCGReg rd, TCGReg rn, int offset)
+{
+    if (offset != 0) {
+        if (check_fit_imm(offset) || check_fit_imm(-offset)) {
+            tcg_out_dat_rIN(s, COND_AL, ARITH_ADD, ARITH_SUB,
+                            TCG_REG_TMP, rn, offset, true);
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP, offset);
+            tcg_out_dat_reg(s, COND_AL, ARITH_ADD,
+                            TCG_REG_TMP, TCG_REG_TMP, rn, 0);
+        }
+        rn = TCG_REG_TMP;
+    }
+    tcg_out32(s, insn | (rn << 16) | encode_vd(rd) | 0xf);
+}
+
 #ifdef CONFIG_SOFTMMU
 #include "../tcg-ldst.c.inc"
 
@@ -2200,16 +2230,44 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP);
 }
 
-static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
-                              TCGReg arg1, intptr_t arg2)
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
 {
-    tcg_out_ld32u(s, COND_AL, arg, arg1, arg2);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_ld32u(s, COND_AL, arg, arg1, arg2);
+        return;
+    case TCG_TYPE_V64:
+        /* regs 1; size 8; align 8 */
+        tcg_out_vldst(s, INSN_VLD1 | 0x7d0, arg, arg1, arg2);
+        return;
+    case TCG_TYPE_V128:
+        /* regs 2; size 8; align 16 */
+        tcg_out_vldst(s, INSN_VLD1 | 0xae0, arg, arg1, arg2);
+        return;
+    default:
+        g_assert_not_reached();
+    }
 }
 
-static inline void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
-                              TCGReg arg1, intptr_t arg2)
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
 {
-    tcg_out_st32(s, COND_AL, arg, arg1, arg2);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_st32(s, COND_AL, arg, arg1, arg2);
+        return;
+    case TCG_TYPE_V64:
+        /* regs 1; size 8; align 8 */
+        tcg_out_vldst(s, INSN_VST1 | 0x7d0, arg, arg1, arg2);
+        return;
+    case TCG_TYPE_V128:
+        /* regs 2; size 8; align 16 */
+        tcg_out_vldst(s, INSN_VST1 | 0xae0, arg, arg1, arg2);
+        return;
+    default:
+        g_assert_not_reached();
+    }
 }
 
 static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
-- 
2.25.1



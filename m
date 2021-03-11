Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D0E3376E0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:21:47 +0100 (CET)
Received: from localhost ([::1]:34782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKN8E-0002oS-1D
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVS-0004HN-Uj
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:43 -0500
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:40819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVP-0006vm-9E
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:42 -0500
Received: by mail-qk1-x729.google.com with SMTP id l132so20786050qke.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+hYXlItoM/Z3+fP1AldUiXSVWyrROjLm9Iu89IH+Ds=;
 b=PiVBKKAPdg8tVmMnBPqcZkOMxbhY7keCl2Ic+fyd6pCcIVDf5HBig08Q00SDtPUjIy
 1hrD2qYoNbtBujo1nUgzmWnaWO1RKjVWwEIB6h73TDQU+imp5wo1v1S7XOUWiME6fJWu
 b/Qd/VDvT09xLpGuYpbvjV8XnfvtjR6GG8xwDqulHqo9z9NSxulTj27qZJgTWiKuk0qv
 FVZZ/eY6nupJgeGLsRxL1j8vKT+lElPmif43gxH+oB+OrOFssevq/cVNfcA4BUCCX3+L
 f0+ALWhvS5axyagVev9MBc3yBHZfSn9pQfeLKpj37RZGd658JwsLojoplUvqNGdE3I+k
 oBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+hYXlItoM/Z3+fP1AldUiXSVWyrROjLm9Iu89IH+Ds=;
 b=lRdGqyXHDbvGo693hDmc2phNgJer5YN3PrwXq13pc94f46/AaozQHUVAy5lYpeAEbH
 7zBnuJQt8ut4lvxGy+B+88e/0lm2GOo2gHorDIEC8g4cv9nINfwB4nsERyl2QovJtIJD
 0sJpy5bj/PzXZgFNXcxCzFNDDj2cWSGvWGeVin12vXarj42sYIwmpzwKHDBR7lrxQ7p2
 NnmT6dT54zMTJ3SzkFL26CSpXoRjTBH14460lLITfUbdvKsx+uLmb3XFDLMx7twAA0pD
 Cdj4bIpE4fJ2I4FNUkeixXzxD2i40J9qPjhhlfFUTKBPi4bA+w9KXEO6fBtUAAmULDRr
 pDOg==
X-Gm-Message-State: AOAM532j3m6aBPL34GMwVLS0gotxHgZc6dKV5HYdu3ilw4EX6Gjvx8n2
 t99fQbwE5CnX+QAhBaWQWcrPOlFsxTx12hQM
X-Google-Smtp-Source: ABdhPJx6sN9WDtoa+6WTXbnkOLyVte2qqEbsrUEGMHl61fhQQkoUjLJnHVrWCuI2nHrOWsYHcHtG2g==
X-Received: by 2002:a05:620a:55a:: with SMTP id
 o26mr7853657qko.43.1615473698141; 
 Thu, 11 Mar 2021 06:41:38 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g14sm1962421qkm.98.2021.03.11.06.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:41:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 51/57] tcg/tci: Implement clz, ctz, ctpop
Date: Thu, 11 Mar 2021 08:39:52 -0600
Message-Id: <20210311143958.562625-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     | 12 +++++------
 tcg/tci.c                | 44 ++++++++++++++++++++++++++++++++++++++++
 tcg/tci/tcg-target.c.inc |  9 ++++++++
 3 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 60b67b196b..59859bd8a6 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -75,9 +75,9 @@
 #define TCG_TARGET_HAS_eqv_i32          1
 #define TCG_TARGET_HAS_nand_i32         1
 #define TCG_TARGET_HAS_nor_i32          1
-#define TCG_TARGET_HAS_clz_i32          0
-#define TCG_TARGET_HAS_ctz_i32          0
-#define TCG_TARGET_HAS_ctpop_i32        0
+#define TCG_TARGET_HAS_clz_i32          1
+#define TCG_TARGET_HAS_ctz_i32          1
+#define TCG_TARGET_HAS_ctpop_i32        1
 #define TCG_TARGET_HAS_neg_i32          1
 #define TCG_TARGET_HAS_not_i32          1
 #define TCG_TARGET_HAS_orc_i32          1
@@ -112,9 +112,9 @@
 #define TCG_TARGET_HAS_eqv_i64          1
 #define TCG_TARGET_HAS_nand_i64         1
 #define TCG_TARGET_HAS_nor_i64          1
-#define TCG_TARGET_HAS_clz_i64          0
-#define TCG_TARGET_HAS_ctz_i64          0
-#define TCG_TARGET_HAS_ctpop_i64        0
+#define TCG_TARGET_HAS_clz_i64          1
+#define TCG_TARGET_HAS_ctz_i64          1
+#define TCG_TARGET_HAS_ctpop_i64        1
 #define TCG_TARGET_HAS_neg_i64          1
 #define TCG_TARGET_HAS_not_i64          1
 #define TCG_TARGET_HAS_orc_i64          1
diff --git a/tcg/tci.c b/tcg/tci.c
index dcf8dc418f..068d742a80 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -588,6 +588,26 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (uint32_t)regs[r1] % (uint32_t)regs[r2];
             break;
+#if TCG_TARGET_HAS_clz_i32
+        case INDEX_op_clz_i32:
+            tci_args_rrr(insn, &r0, &r1, &r2);
+            tmp32 = regs[r1];
+            regs[r0] = tmp32 ? clz32(tmp32) : regs[r2];
+            break;
+#endif
+#if TCG_TARGET_HAS_ctz_i32
+        case INDEX_op_ctz_i32:
+            tci_args_rrr(insn, &r0, &r1, &r2);
+            tmp32 = regs[r1];
+            regs[r0] = tmp32 ? ctz32(tmp32) : regs[r2];
+            break;
+#endif
+#if TCG_TARGET_HAS_ctpop_i32
+        case INDEX_op_ctpop_i32:
+            tci_args_rr(insn, &r0, &r1);
+            regs[r0] = ctpop32(regs[r1]);
+            break;
+#endif
 
             /* Shift/rotate operations (32 bit). */
 
@@ -740,6 +760,24 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (uint64_t)regs[r1] % (uint64_t)regs[r2];
             break;
+#if TCG_TARGET_HAS_clz_i64
+        case INDEX_op_clz_i64:
+            tci_args_rrr(insn, &r0, &r1, &r2);
+            regs[r0] = regs[r1] ? clz64(regs[r1]) : regs[r2];
+            break;
+#endif
+#if TCG_TARGET_HAS_ctz_i64
+        case INDEX_op_ctz_i64:
+            tci_args_rrr(insn, &r0, &r1, &r2);
+            regs[r0] = regs[r1] ? ctz64(regs[r1]) : regs[r2];
+            break;
+#endif
+#if TCG_TARGET_HAS_ctpop_i64
+        case INDEX_op_ctpop_i64:
+            tci_args_rr(insn, &r0, &r1);
+            regs[r0] = ctpop64(regs[r1]);
+            break;
+#endif
 
             /* Shift/rotate operations (64 bit). */
 
@@ -1166,6 +1204,8 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     case INDEX_op_not_i64:
     case INDEX_op_neg_i32:
     case INDEX_op_neg_i64:
+    case INDEX_op_ctpop_i32:
+    case INDEX_op_ctpop_i64:
         tci_args_rr(insn, &r0, &r1);
         info->fprintf_func(info->stream, "%-12s  %s,%s",
                            op_name, str_r(r0), str_r(r1));
@@ -1211,6 +1251,10 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     case INDEX_op_rotl_i64:
     case INDEX_op_rotr_i32:
     case INDEX_op_rotr_i64:
+    case INDEX_op_clz_i32:
+    case INDEX_op_clz_i64:
+    case INDEX_op_ctz_i32:
+    case INDEX_op_ctz_i64:
         tci_args_rrr(insn, &r0, &r1, &r2);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s",
                            op_name, str_r(r0), str_r(r1), str_r(r2));
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index cedd0328df..664d715440 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -67,6 +67,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extract_i64:
     case INDEX_op_sextract_i32:
     case INDEX_op_sextract_i64:
+    case INDEX_op_ctpop_i32:
+    case INDEX_op_ctpop_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
@@ -122,6 +124,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_setcond_i64:
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
+    case INDEX_op_clz_i32:
+    case INDEX_op_clz_i64:
+    case INDEX_op_ctz_i32:
+    case INDEX_op_ctz_i64:
         return C_O1_I2(r, r, r);
 
     case INDEX_op_brcond_i32:
@@ -657,6 +663,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_32_64(divu)     /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(rem)      /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(remu)     /* Optional (TCG_TARGET_HAS_div_*). */
+    CASE_32_64(clz)      /* Optional (TCG_TARGET_HAS_clz_*). */
+    CASE_32_64(ctz)      /* Optional (TCG_TARGET_HAS_ctz_*). */
         tcg_out_op_rrr(s, opc, args[0], args[1], args[2]);
         break;
 
@@ -705,6 +713,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
     CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
     CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
+    CASE_32_64(ctpop)    /* Optional (TCG_TARGET_HAS_ctpop_*). */
         tcg_out_op_rr(s, opc, args[0], args[1]);
         break;
 
-- 
2.25.1



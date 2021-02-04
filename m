Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A130EA7B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:55:59 +0100 (CET)
Received: from localhost ([::1]:51714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UoI-0002ft-PS
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tu4-0002Gw-RV
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:57:52 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:43349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tty-0007MH-Uf
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:57:52 -0500
Received: by mail-pg1-x535.google.com with SMTP id n10so1031981pgl.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rhMhsBiepdz6ZgRnVQ9WJVuiU6dgvoZgG9ax0hIWeII=;
 b=dv0kRLdxnki77yl79jdX5C7LDWxj0itfIMxMUn0eY9MHaxJ+Dr/dYZThufsoEvZFoE
 ah4KL5oooiCeQ0u1/01G/zi52dJlJPRiQ1CG76Y60ar70ok+393+mvtPBaZACwZaPsEz
 LU15Mx06TZJAWYEF+uCfho0lf787NUZ9oyr/FzoGVESJG4t5bu37SEOLXuODOUXjAMHE
 0MnG9+W7rfX8VanX7A7+f1MXuwQkg1eee1zIbq3hgMyuTI9sjibYPSdH9wlGD7WKSPcS
 YT7KaDGTrtEC2Ntg87ks/3AQ5MMXD/UutiT6obz7+MY+VhKGK9JIoQqe2PgV7ns+b7fy
 FxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rhMhsBiepdz6ZgRnVQ9WJVuiU6dgvoZgG9ax0hIWeII=;
 b=fsxY/DYC0LvJTdIjSZ3G4y+My86hf2dueZNh1NGFa8vQgXNB51cYYuDL4dx9J5OokR
 I2xjAFaxKnrNPS5b2+pmcl+IePCddOnqXp1FKPAD5NrWgtGMlgGV1D64o4fao2qgwi44
 oiSRNrVvw8BouqsvT1yTifYcfk8bJ7cSwzGUg75y3D+WL15kXQ4PYP7unOdmmAixKq2o
 a7RBYdFJ6EV6T/nBf5VEFc5i4s9hbvpbEASeNahXI3knXIFsFOUPUJvEiV196m7VUbVv
 +XnIP2XU0NcTbwULMFxBnKChOCq49F+N7PhUzaJSR8lpX7znashCM7NTzYSQJyQ4clvX
 9x1g==
X-Gm-Message-State: AOAM533pUUgckQGkmT+r9rIoLAcqG8GgN9Ynr+CtFeCJuD5i2yV3ZJU4
 d9StCUFX4Jr7rOR+tRb6CaqGt/YT+RYragl0
X-Google-Smtp-Source: ABdhPJyw+1+6vfpHmtjXjey676Ug8pZ+ceyBMzp4wORGURMN6ELajWbqVnP8T2fH3stZzMaxmVsoIg==
X-Received: by 2002:a62:5505:0:b029:1c9:2c59:b1ff with SMTP id
 j5-20020a6255050000b02901c92c59b1ffmr5553008pfb.69.1612403863656; 
 Wed, 03 Feb 2021 17:57:43 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s65sm3681085pfc.95.2021.02.03.17.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:57:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 89/93] tcg/tci: Implement andc, orc, eqv, nand, nor
Date: Wed,  3 Feb 2021 15:57:40 -1000
Message-Id: <20210204015740.885763-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These were already present in tcg-target.c.inc,
but not in the interpreter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h | 20 ++++++++++----------
 tcg/tci.c            | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index f53773a555..5945272a43 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -67,20 +67,20 @@
 #define TCG_TARGET_HAS_ext16s_i32       1
 #define TCG_TARGET_HAS_ext8u_i32        1
 #define TCG_TARGET_HAS_ext16u_i32       1
-#define TCG_TARGET_HAS_andc_i32         0
+#define TCG_TARGET_HAS_andc_i32         1
 #define TCG_TARGET_HAS_deposit_i32      1
 #define TCG_TARGET_HAS_extract_i32      0
 #define TCG_TARGET_HAS_sextract_i32     0
 #define TCG_TARGET_HAS_extract2_i32     0
-#define TCG_TARGET_HAS_eqv_i32          0
-#define TCG_TARGET_HAS_nand_i32         0
-#define TCG_TARGET_HAS_nor_i32          0
+#define TCG_TARGET_HAS_eqv_i32          1
+#define TCG_TARGET_HAS_nand_i32         1
+#define TCG_TARGET_HAS_nor_i32          1
 #define TCG_TARGET_HAS_clz_i32          0
 #define TCG_TARGET_HAS_ctz_i32          0
 #define TCG_TARGET_HAS_ctpop_i32        0
 #define TCG_TARGET_HAS_neg_i32          1
 #define TCG_TARGET_HAS_not_i32          1
-#define TCG_TARGET_HAS_orc_i32          0
+#define TCG_TARGET_HAS_orc_i32          1
 #define TCG_TARGET_HAS_rot_i32          1
 #define TCG_TARGET_HAS_movcond_i32      1
 #define TCG_TARGET_HAS_muls2_i32        0
@@ -108,16 +108,16 @@
 #define TCG_TARGET_HAS_ext8u_i64        1
 #define TCG_TARGET_HAS_ext16u_i64       1
 #define TCG_TARGET_HAS_ext32u_i64       1
-#define TCG_TARGET_HAS_andc_i64         0
-#define TCG_TARGET_HAS_eqv_i64          0
-#define TCG_TARGET_HAS_nand_i64         0
-#define TCG_TARGET_HAS_nor_i64          0
+#define TCG_TARGET_HAS_andc_i64         1
+#define TCG_TARGET_HAS_eqv_i64          1
+#define TCG_TARGET_HAS_nand_i64         1
+#define TCG_TARGET_HAS_nor_i64          1
 #define TCG_TARGET_HAS_clz_i64          0
 #define TCG_TARGET_HAS_ctz_i64          0
 #define TCG_TARGET_HAS_ctpop_i64        0
 #define TCG_TARGET_HAS_neg_i64          1
 #define TCG_TARGET_HAS_not_i64          1
-#define TCG_TARGET_HAS_orc_i64          0
+#define TCG_TARGET_HAS_orc_i64          1
 #define TCG_TARGET_HAS_rot_i64          1
 #define TCG_TARGET_HAS_movcond_i64      1
 #define TCG_TARGET_HAS_muls2_i64        0
diff --git a/tcg/tci.c b/tcg/tci.c
index 2a39f8f5a0..9c17947e6b 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -540,6 +540,36 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = regs[r1] ^ regs[r2];
             break;
+#if TCG_TARGET_HAS_andc_i32 || TCG_TARGET_HAS_andc_i64
+        CASE_32_64(andc)
+            tci_args_rrr(insn, &r0, &r1, &r2);
+            regs[r0] = regs[r1] & ~regs[r2];
+            break;
+#endif
+#if TCG_TARGET_HAS_orc_i32 || TCG_TARGET_HAS_orc_i64
+        CASE_32_64(orc)
+            tci_args_rrr(insn, &r0, &r1, &r2);
+            regs[r0] = regs[r1] | ~regs[r2];
+            break;
+#endif
+#if TCG_TARGET_HAS_eqv_i32 || TCG_TARGET_HAS_eqv_i64
+        CASE_32_64(eqv)
+            tci_args_rrr(insn, &r0, &r1, &r2);
+            regs[r0] = ~(regs[r1] ^ regs[r2]);
+            break;
+#endif
+#if TCG_TARGET_HAS_nand_i32 || TCG_TARGET_HAS_nand_i64
+        CASE_32_64(nand)
+            tci_args_rrr(insn, &r0, &r1, &r2);
+            regs[r0] = ~(regs[r1] & regs[r2]);
+            break;
+#endif
+#if TCG_TARGET_HAS_nor_i32 || TCG_TARGET_HAS_nor_i64
+        CASE_32_64(nor)
+            tci_args_rrr(insn, &r0, &r1, &r2);
+            regs[r0] = ~(regs[r1] | regs[r2]);
+            break;
+#endif
 
             /* Arithmetic operations (32 bit). */
 
@@ -1130,6 +1160,16 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     case INDEX_op_or_i64:
     case INDEX_op_xor_i32:
     case INDEX_op_xor_i64:
+    case INDEX_op_andc_i32:
+    case INDEX_op_andc_i64:
+    case INDEX_op_orc_i32:
+    case INDEX_op_orc_i64:
+    case INDEX_op_eqv_i32:
+    case INDEX_op_eqv_i64:
+    case INDEX_op_nand_i32:
+    case INDEX_op_nand_i64:
+    case INDEX_op_nor_i32:
+    case INDEX_op_nor_i64:
     case INDEX_op_div_i32:
     case INDEX_op_div_i64:
     case INDEX_op_rem_i32:
-- 
2.25.1



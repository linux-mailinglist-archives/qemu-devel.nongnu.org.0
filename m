Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5649B312950
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:26:10 +0100 (CET)
Received: from localhost ([::1]:43652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xBh-0006Va-9X
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSm-00037u-7F
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:44 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSj-0006EE-NG
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:43 -0500
Received: by mail-pg1-x536.google.com with SMTP id e7so315842pge.0
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rhMhsBiepdz6ZgRnVQ9WJVuiU6dgvoZgG9ax0hIWeII=;
 b=gf+qE9Phnjphx4PsF+uWOpAKIUaBQXBdb94rf2iuNFiGiWNsxc5bKJTCgng8c++4xz
 TNQ2Jox3CxqkdDbanm6uwfb5HxqzhsZPdKupaTt6kF59RqZ1bv9MXjYb9pmfCGypvVHB
 BKS7LUuTX1pyWjSCbxTk3AgunbxbKLeHyBka59APrb+LAJoTWhrLu0bB2zzt4p8TweSW
 9613to/za00QAx0WRdNTC2bLoTveCEOzS39wFpa1NR4ZpwzH2Ap77bTV2ngrjIf+p40v
 ewZ5xUCclZNvUHVM/SNcaYkXLHu30PeXpOWUClKHLb01xbX8BCHJAomvrkWq9qUTyi4J
 v/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rhMhsBiepdz6ZgRnVQ9WJVuiU6dgvoZgG9ax0hIWeII=;
 b=UfklTgcFR88tzxbGoyR1JdWiTP0S+9MzGiN3lui+/GUXBucBImWJGMGZpdWiqNi77T
 sUnP0a3QQWWiPjhlM1xDeSw6wqQ5T2Slha2WqGuDpbopXausrxli/MTzjZLVF9/2Tdo3
 7oUhdCTiG48IJToEdFky4p8mntBfiPN8h0n2laTw1Mk4He/GcSpXOJeCt895LpsXgzGC
 MU8ClDEzsHH2UMckj77AyKfbOABQ2yHFFJEafta9YXJD+FpXOeB1LdTVVDjwq6L9bSYw
 ADPBRig3dTzfIH/evgov+okbofL0wELiU4SIE8pTav1CocLoHhLGY9gPR3APNR35Uc0M
 nd0g==
X-Gm-Message-State: AOAM531FjLQ9p3QH3OJkP80ekd0H7d7ESMfkIsvhvYBpfo0hEpj6TUxO
 Z6IuSsCylvyLyD16cz34sZ7PbNKT2ElVXg==
X-Google-Smtp-Source: ABdhPJzNfj88yFN5jxAIl8c7nknTLIGis6hUF3mpWZ/r9OkOOMQKiETRubaKnQkxNIiExzSzAvbVtw==
X-Received: by 2002:a63:1458:: with SMTP id 24mr15452406pgu.441.1612751980458; 
 Sun, 07 Feb 2021 18:39:40 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 64/70] tcg/tci: Implement andc, orc, eqv, nand, nor
Date: Sun,  7 Feb 2021 18:37:46 -0800
Message-Id: <20210208023752.270606-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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



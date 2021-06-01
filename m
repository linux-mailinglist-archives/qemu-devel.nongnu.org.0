Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78728397646
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:14:55 +0200 (CEST)
Received: from localhost ([::1]:44944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo66Y-0002it-GU
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tr-0002Va-S6
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:48 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:36743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5ti-0002fQ-NL
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:47 -0400
Received: by mail-il1-x12e.google.com with SMTP id e7so1719863ils.3
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K8kBk5VRRKGkWMuBZlwPHvIAv2OPF200A9ajA6iI0uk=;
 b=leeS6LmZ47sCHeM0REA82wgtDAO6GX53SHQXJc62Ub8/Si+u79pIUNL96xeZHp7q1S
 rF4nEZDSvYjX4kP/pQCQ1Cc5uSuJGC41vUMMiK9upIyxLbO4ekkZ8ligcMG2WpKnR1NT
 URqH7h+pmNo/EfZJLGaUVhcgfRSxvbK2IPLeIhU77yrLNV0IUmR2ic0Xr59e/Dcv5U/4
 3/4iLHUnB+iEpHUnpdJnT7jLaJa+sQ6QFi92CQeKeFhRnYzkihnmiLithswicYeO6bZA
 +qdYautZ9tikKhAHdBJxrB9XrYLYOzn2ArPgdiXYHwO66YoqggT+Qmb4EtCk1kSaLDE9
 VANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K8kBk5VRRKGkWMuBZlwPHvIAv2OPF200A9ajA6iI0uk=;
 b=dX3/kUn/HQxa23BYUlola11REDDPm5LQOeWmZbP7Ff72mXGFqEhGqFvr0MIbbnHT0t
 QPN2gDWhBX7061BMjuhA0RdOHAP2QsfC5GuGsyYzGw9ZkJb5kb9bM/TUx2CU66COeTfu
 ZXSG4CMqG+FIGaadKHW0CNslz/3oX3NpIQoi2seiMGBp6ZLwr5p3Bj6xI0TMzOK7EITR
 HgUE/edhAECkWI7WkRmw/YovGzFXvpigPTxOLkCCCU54TOEdWi6IbRIDhMSszXleR2pu
 ROxc6yvZ7QUpXIBVTtJtAWN4OIW0V0uqVGajyifSJJCuvAbLgi6Jfz0LoyriAIb+PWsx
 S+CQ==
X-Gm-Message-State: AOAM532dFj3PctDXzXg6IQ+lpZRWdm4gagKOYLgjBl8bDalk8HGa01F2
 arMi8rMN5jMpFnVJeRw5ha9QEH9JFTQwLmV3
X-Google-Smtp-Source: ABdhPJxx+iasU76JAoyxBLQ4NAtnD81Qrw67fpwgaeBM8NsDpbNwLc2ScQSKN+kvbxDNY5Bse9j19g==
X-Received: by 2002:a05:6e02:1002:: with SMTP id
 n2mr21261008ilj.260.1622559695005; 
 Tue, 01 Jun 2021 08:01:35 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 19/27] tcg/tci: Implement extract, sextract
Date: Tue,  1 Jun 2021 08:00:58 -0700
Message-Id: <20210601150106.12761-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12e.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  8 ++++----
 tcg/tci.c                | 42 ++++++++++++++++++++++++++++++++++++++++
 tcg/tci/tcg-target.c.inc | 32 ++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+), 4 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 5945272a43..60b67b196b 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -69,8 +69,8 @@
 #define TCG_TARGET_HAS_ext16u_i32       1
 #define TCG_TARGET_HAS_andc_i32         1
 #define TCG_TARGET_HAS_deposit_i32      1
-#define TCG_TARGET_HAS_extract_i32      0
-#define TCG_TARGET_HAS_sextract_i32     0
+#define TCG_TARGET_HAS_extract_i32      1
+#define TCG_TARGET_HAS_sextract_i32     1
 #define TCG_TARGET_HAS_extract2_i32     0
 #define TCG_TARGET_HAS_eqv_i32          1
 #define TCG_TARGET_HAS_nand_i32         1
@@ -97,8 +97,8 @@
 #define TCG_TARGET_HAS_bswap32_i64      1
 #define TCG_TARGET_HAS_bswap64_i64      1
 #define TCG_TARGET_HAS_deposit_i64      1
-#define TCG_TARGET_HAS_extract_i64      0
-#define TCG_TARGET_HAS_sextract_i64     0
+#define TCG_TARGET_HAS_extract_i64      1
+#define TCG_TARGET_HAS_sextract_i64     1
 #define TCG_TARGET_HAS_extract2_i64     0
 #define TCG_TARGET_HAS_div_i64          1
 #define TCG_TARGET_HAS_rem_i64          1
diff --git a/tcg/tci.c b/tcg/tci.c
index 068ee8f1f4..22ee32bc24 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -124,6 +124,15 @@ static void tci_args_rrs(uint32_t insn, TCGReg *r0, TCGReg *r1, int32_t *i2)
     *i2 = sextract32(insn, 16, 16);
 }
 
+static void tci_args_rrbb(uint32_t insn, TCGReg *r0, TCGReg *r1,
+                          uint8_t *i2, uint8_t *i3)
+{
+    *r0 = extract32(insn, 8, 4);
+    *r1 = extract32(insn, 12, 4);
+    *i2 = extract32(insn, 16, 6);
+    *i3 = extract32(insn, 22, 6);
+}
+
 static void tci_args_rrrc(uint32_t insn,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
 {
@@ -608,6 +617,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_args_rrrbb(insn, &r0, &r1, &r2, &pos, &len);
             regs[r0] = deposit32(regs[r1], pos, len, regs[r2]);
             break;
+#endif
+#if TCG_TARGET_HAS_extract_i32
+        case INDEX_op_extract_i32:
+            tci_args_rrbb(insn, &r0, &r1, &pos, &len);
+            regs[r0] = extract32(regs[r1], pos, len);
+            break;
+#endif
+#if TCG_TARGET_HAS_sextract_i32
+        case INDEX_op_sextract_i32:
+            tci_args_rrbb(insn, &r0, &r1, &pos, &len);
+            regs[r0] = sextract32(regs[r1], pos, len);
+            break;
 #endif
         case INDEX_op_brcond_i32:
             tci_args_rl(insn, tb_ptr, &r0, &ptr);
@@ -748,6 +769,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_args_rrrbb(insn, &r0, &r1, &r2, &pos, &len);
             regs[r0] = deposit64(regs[r1], pos, len, regs[r2]);
             break;
+#endif
+#if TCG_TARGET_HAS_extract_i64
+        case INDEX_op_extract_i64:
+            tci_args_rrbb(insn, &r0, &r1, &pos, &len);
+            regs[r0] = extract64(regs[r1], pos, len);
+            break;
+#endif
+#if TCG_TARGET_HAS_sextract_i64
+        case INDEX_op_sextract_i64:
+            tci_args_rrbb(insn, &r0, &r1, &pos, &len);
+            regs[r0] = sextract64(regs[r1], pos, len);
+            break;
 #endif
         case INDEX_op_brcond_i64:
             tci_args_rl(insn, tb_ptr, &r0, &ptr);
@@ -1189,6 +1222,15 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            op_name, str_r(r0), str_r(r1), str_r(r2), pos, len);
         break;
 
+    case INDEX_op_extract_i32:
+    case INDEX_op_extract_i64:
+    case INDEX_op_sextract_i32:
+    case INDEX_op_sextract_i64:
+        tci_args_rrbb(insn, &r0, &r1, &pos, &len);
+        info->fprintf_func(info->stream, "%-12s  %s,%s,%d,%d",
+                           op_name, str_r(r0), str_r(r1), pos, len);
+        break;
+
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
     case INDEX_op_setcond2_i32:
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index e7a07c1811..677ae2dceb 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -63,6 +63,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_bswap32_i32:
     case INDEX_op_bswap32_i64:
     case INDEX_op_bswap64_i64:
+    case INDEX_op_extract_i32:
+    case INDEX_op_extract_i64:
+    case INDEX_op_sextract_i32:
+    case INDEX_op_sextract_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
@@ -352,6 +356,21 @@ static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
     tcg_out32(s, insn);
 }
 
+static void tcg_out_op_rrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
+                            TCGReg r1, uint8_t b2, uint8_t b3)
+{
+    tcg_insn_unit insn = 0;
+
+    tcg_debug_assert(b2 == extract32(b2, 0, 6));
+    tcg_debug_assert(b3 == extract32(b3, 0, 6));
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    insn = deposit32(insn, 12, 4, r1);
+    insn = deposit32(insn, 16, 6, b2);
+    insn = deposit32(insn, 22, 6, b3);
+    tcg_out32(s, insn);
+}
+
 static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGCond c3)
 {
@@ -651,6 +670,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    CASE_32_64(extract)  /* Optional (TCG_TARGET_HAS_extract_*). */
+    CASE_32_64(sextract) /* Optional (TCG_TARGET_HAS_sextract_*). */
+        {
+            TCGArg pos = args[2], len = args[3];
+            TCGArg max = tcg_op_defs[opc].flags & TCG_OPF_64BIT ? 64 : 32;
+
+            tcg_debug_assert(pos < max);
+            tcg_debug_assert(pos + len <= max);
+
+            tcg_out_op_rrbb(s, opc, args[0], args[1], pos, len);
+        }
+        break;
+
     CASE_32_64(brcond)
         tcg_out_op_rrrc(s, (opc == INDEX_op_brcond_i32
                             ? INDEX_op_setcond_i32 : INDEX_op_setcond_i64),
-- 
2.25.1



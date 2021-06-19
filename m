Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21DD3ADB45
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:22:35 +0200 (CEST)
Received: from localhost ([::1]:50620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufc2-0006rO-WB
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUq-0000ru-Rr
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:10 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUo-0002L7-0n
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:08 -0400
Received: by mail-pf1-x42a.google.com with SMTP id w71so335074pfd.4
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0SOAybo6J+ne2yDH7134TCtulNcLcAOxalT/wR4e4eg=;
 b=ZcfucyzLKrgHsuAuvhlDhS65SSZVATs2//NcjNFqmmPePe5wIFBdPkuxGjhe6N0pr9
 pVa88veiG8N7Rq39CQ8Y9OgggSlVLNKKy++7PYhUoIhWEtV11tJvvkc57k6Cvp/VHoyb
 GECJRYMXWdKVVjeLR4hNPg1eo6FEeqEZyA4ZbyGENgbJeRumGkhyGpYQneeL7mDNGkPj
 RF2eVMqo3N8dmrpzHp0w9A57qAQp9DUm6USC3yoiZvN/z+AeExKOTRCBw10wIpaID+qR
 N043ACH2QcCTLbfDL/D7ntyLjviORLEPSXLMDYiGx4MjwYqtMzSEDLmPENc7t78w5tqJ
 9hzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0SOAybo6J+ne2yDH7134TCtulNcLcAOxalT/wR4e4eg=;
 b=NA+z7WUxL31rAV242BWCUupYH0U6jpJV9HFDe/MFxpAQ5/wFVkDkdknqtqb5gExWtC
 JxhrKBdzE/wcwGyKRsMaZ48/P8aol3hGr3w6maYSCMTrMp9qpjmm1GOKx31j8xSoJ7yL
 5LWO96ncdkyc2/zM0VY21kINsfp9B3waHmy4m1dX2x0qd5WWjw8ZbBn6p525uZFswo1H
 VA/IYM+pKua1zNVQeVnsjROnpkweQYVLCb4q/7HAm2cv7TbA2a17fCHtZg7NbAR1/E2R
 Mcjo3b8jSNxkQFuHVHEzt6NtVaUxAxdazf7oEpewZkZPRxYbTy9GruyYxRgTvlcbC9Eb
 m4+g==
X-Gm-Message-State: AOAM532sQPcDrNd1WDRU27NwXg9zWSKB4hFM1JXdgichRh5SGZE+T311
 E/I2dA6WAXG2QEg7i4va/qWxzFTB/kHxvQ==
X-Google-Smtp-Source: ABdhPJwasRnESbXu8T/ugfW48DNa73NwkjzjXJtx2j2Jm3IdX9gnqowXfWClSW/9/KwP7BToofzDew==
X-Received: by 2002:aa7:8509:0:b029:2e5:8cfe:bc17 with SMTP id
 v9-20020aa785090000b02902e58cfebc17mr11313546pfn.2.1624126504239; 
 Sat, 19 Jun 2021 11:15:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/33] tcg/tci: Implement extract, sextract
Date: Sat, 19 Jun 2021 11:14:38 -0700
Message-Id: <20210619181452.877683-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index ac8c2d85bd..f35813bd01 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -70,8 +70,8 @@
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
@@ -98,8 +98,8 @@
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
index 8af82c7da7..788f0235bc 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -126,6 +126,15 @@ static void tci_args_rrs(uint32_t insn, TCGReg *r0, TCGReg *r1, int32_t *i2)
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
@@ -610,6 +619,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -750,6 +771,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -1191,6 +1224,15 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
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
index 2db189673c..65cdc26812 100644
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



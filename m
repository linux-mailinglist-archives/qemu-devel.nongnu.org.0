Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B1E3ADB60
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:35:56 +0200 (CEST)
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufow-0001h9-O3
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUt-0000uM-PQ
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:14 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUo-0002LK-46
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:11 -0400
Received: by mail-pl1-x62a.google.com with SMTP id h1so6343582plt.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+uASXuWPiHASia1640RtC4Epc/VWwyRiO4sJJNxaueo=;
 b=MniVet8f5OncXvUYg/tpqMwzOwgrG4PKngLNxmMN5nXhIcXZYAcfhqOHanEHyF77Au
 MkjtWi+90aDWmTdNPzOmvxCWCbHGkcPeMIEkVO4RHuFa4UmnaAk0ln4a1zVpiQR46MnN
 51q5eJr60lOLosx5wxSzgYsv/chLLFV2URbNBdpy7WnV1Ggv3S5bHniIAx1U/QQZEeNa
 T7526GVuYvlVXSYje+g4T0OCTPBtPM3oJwAlac1KO5XK/EXyNqnJMpyiVOXQhYr3fifm
 M27g5q9v9S8EANbdRRGYxcgMOBDIIkDDa0Rk1GjWJ6wLXFFVc/9uPnzhKSBfSmecH2Ax
 fYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+uASXuWPiHASia1640RtC4Epc/VWwyRiO4sJJNxaueo=;
 b=VoNIjndzwXn9fZJwv6XgTy8J7wgZhBhG+cHHvpqMngI5so+/+xAlxY/k6JzvZfYEac
 s/3zoc8pAbKS+TlqjpzzOISmUksmSQ6L5aPTnuGPuwPxvDtk1lCSoVvaLhEOIS/rIiBH
 Qdbav1DqYZhmb8zSoWdpFs5hNACyr/2IRehAUtnp+GU5bt1xtCntqQ5nLXzvnxnUosX2
 TVw8IYqkUF2J5DFKlYZjhI2PVUMTr7oE/R5p1FgOISgiPLyl6qOm1mGmtJ1ef0sQPBSO
 TfCrikv6qFQ1EV/DlYFZh0WgPhotv9K+3tT+9VjGj3jKQN7ojuxjOe4QXXL2wCqE8+Fx
 Czmg==
X-Gm-Message-State: AOAM5330dKgZxviIZrUd9sgmhbwmVnc7OkyM2YOmpCIwX16QId3HZvqZ
 okYVxRADEuDV6cdoAONdydwcrDjSF/n35A==
X-Google-Smtp-Source: ABdhPJwUXPY/cfGtLTaeTyqivkWvD8438BvYPyZDQMOPRjP6hybrll6tx3H+Q1UaPU5fJZGw6wNUTw==
X-Received: by 2002:a17:902:8d92:b029:113:91e7:89d6 with SMTP id
 v18-20020a1709028d92b029011391e789d6mr10278746plo.85.1624126504850; 
 Sat, 19 Jun 2021 11:15:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/33] tcg/tci: Implement clz, ctz, ctpop
Date: Sat, 19 Jun 2021 11:14:39 -0700
Message-Id: <20210619181452.877683-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
 tcg/tci/tcg-target.h     | 12 +++++------
 tcg/tci.c                | 44 ++++++++++++++++++++++++++++++++++++++++
 tcg/tci/tcg-target.c.inc |  9 ++++++++
 3 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index f35813bd01..5614e16857 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -76,9 +76,9 @@
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
@@ -113,9 +113,9 @@
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
index 788f0235bc..adfca71c0f 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -589,6 +589,26 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
 
@@ -741,6 +761,24 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
 
@@ -1167,6 +1205,8 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     case INDEX_op_not_i64:
     case INDEX_op_neg_i32:
     case INDEX_op_neg_i64:
+    case INDEX_op_ctpop_i32:
+    case INDEX_op_ctpop_i64:
         tci_args_rr(insn, &r0, &r1);
         info->fprintf_func(info->stream, "%-12s  %s, %s",
                            op_name, str_r(r0), str_r(r1));
@@ -1212,6 +1252,10 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     case INDEX_op_rotl_i64:
     case INDEX_op_rotr_i32:
     case INDEX_op_rotr_i64:
+    case INDEX_op_clz_i32:
+    case INDEX_op_clz_i64:
+    case INDEX_op_ctz_i32:
+    case INDEX_op_ctz_i64:
         tci_args_rrr(insn, &r0, &r1, &r2);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s",
                            op_name, str_r(r0), str_r(r1), str_r(r2));
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 65cdc26812..69f41659be 100644
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
@@ -655,6 +661,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     CASE_32_64(divu)     /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(rem)      /* Optional (TCG_TARGET_HAS_div_*). */
     CASE_32_64(remu)     /* Optional (TCG_TARGET_HAS_div_*). */
+    CASE_32_64(clz)      /* Optional (TCG_TARGET_HAS_clz_*). */
+    CASE_32_64(ctz)      /* Optional (TCG_TARGET_HAS_ctz_*). */
         tcg_out_op_rrr(s, opc, args[0], args[1], args[2]);
         break;
 
@@ -703,6 +711,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
     CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
     CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
+    CASE_32_64(ctpop)    /* Optional (TCG_TARGET_HAS_ctpop_*). */
         tcg_out_op_rr(s, opc, args[0], args[1]);
         break;
 
-- 
2.25.1



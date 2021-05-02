Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B63371000
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:07:48 +0200 (CEST)
Received: from localhost ([::1]:53498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldM7n-0002q3-3h
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLyA-0007m3-B2
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:50 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLy6-0000gD-Af
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:50 -0400
Received: by mail-pj1-x102a.google.com with SMTP id ge1so2085164pjb.2
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=M0rs96WnpKQD2v2xjYP7C1UizZUszjcMNi5nFesZlrY=;
 b=VBT+CAvU11vhJ979IwiWFe4PeFpW7I8aIZ23V12UaXvrWV3nXgwq6ruXT2CsuL7MU7
 Kd4I1IutXzHS9pgfbNgtp5U7YkJzuDABN+CXEWjT2mmI5NeLAndwxDxRTOZ1rjBC2Yx4
 /XgBjTE9l7dJ28j+Cxkh32goYz8GO+6br5V/eNYoyKacPrSqoMjOXkL5w9/HWnzye4eB
 V4rJPjo/Jja+8YSGC9LtB98jPv/z/In5a3IdDsswUFcR4e9GomofrM2dTc0CdhwJEHCr
 AAy7B/y1mmDGm+jfyf7s1Wm5hGfHe2ICpMZmXDA0KVN+6ctzRqKV4f0CBMB0nOZd6nXn
 +LcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0rs96WnpKQD2v2xjYP7C1UizZUszjcMNi5nFesZlrY=;
 b=N3/7f9LalyH5/aZ9jgdeYiadD4qxz8vxppS3l1FWa2OepgxqMbE3w4YD1iE0TdPu0S
 htTTnhX1TFgZG9YKlQe6oCRwqRzfxE5xS5ZqGw7HRPIPGyRaUgLVUK6OWAT0oxnR3bbZ
 1v6GxZcBbLCYIQzbuAe5skKsmdSIS7F/o+pHcTA4oqIeMgwjcA98GD1ovB/cj5YJVsxu
 1L/5AP9hoBu0NR+ULYS7PJt2aU0Z4yEZ75VzCtGgDy3X6UrrD7kIPdjB/cTayAuxVMAE
 7POPIOV2c0Vg+5SmtR1e4P1C5qwRqGhmRdlQlYzRA+uX+Jg3Amkupv1L9/w7W8mbbf8S
 t0Nw==
X-Gm-Message-State: AOAM531vVGrfnr1ZN7xEyOF1xp6n9kNPPZOo35W5aQrTeby9WImJTQgb
 wxgxjpmMk2Xjj1k3Qdai+9EWH0YaXy+FYg==
X-Google-Smtp-Source: ABdhPJwXl1RrAVLiwaq+YxMbrud5UXRE3ex0Wvh1CJqEOek3H5P+5ProZD/gz61ERkZF4n1l75bZ1A==
X-Received: by 2002:a17:902:e54e:b029:ed:6ed2:d0ab with SMTP id
 n14-20020a170902e54eb02900ed6ed2d0abmr17321220plf.24.1619999865041; 
 Sun, 02 May 2021 16:57:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 20/26] tcg/tci: Implement clz, ctz, ctpop
Date: Sun,  2 May 2021 16:57:21 -0700
Message-Id: <20210502235727.1979457-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
index d9a00f9f3a..c5ed80bc57 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -586,6 +586,26 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
 
@@ -738,6 +758,24 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
 
@@ -1164,6 +1202,8 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     case INDEX_op_not_i64:
     case INDEX_op_neg_i32:
     case INDEX_op_neg_i64:
+    case INDEX_op_ctpop_i32:
+    case INDEX_op_ctpop_i64:
         tci_args_rr(insn, &r0, &r1);
         info->fprintf_func(info->stream, "%-12s  %s, %s",
                            op_name, str_r(r0), str_r(r1));
@@ -1209,6 +1249,10 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
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
index 677ae2dceb..748bc13d4e 100644
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



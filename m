Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852ED31E142
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:23:13 +0100 (CET)
Received: from localhost ([::1]:60176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUHw-0005sa-G4
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTN4-000268-GL
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:26 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTN0-0007mn-0F
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:26 -0500
Received: by mail-pf1-x435.google.com with SMTP id t29so9156238pfg.11
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+hYXlItoM/Z3+fP1AldUiXSVWyrROjLm9Iu89IH+Ds=;
 b=rhyPQBUrRbS7Qtp/Yu3OXuMW+meeShZu68i9YAcSLBRK8K4953Vyw65tI/PptPEo/v
 GtkYkzGlBnoWpb7YGK/U30KHNSjUVUuBPtuOYpS47E9IaXO8MJw7pQ1B2iJobl+19aUT
 Sa+cU+vj2tGFvu0EOMm22NS+QaILR9v+FtEdkbh+CP9U/9yLMKmOFehm1QkOICzHqIIp
 5sEO1XxwTLndMKsKIM0dcpHsq/iGZYhCkZwhwxPYBdgQU9Ds08+BrXE3icppa+nMLb9q
 AURlgMdIXRlnbmd7hU2OdnxD2d5f04U6D2dhMu1w+W1s2c0sE8vc0NGZh/atm+LcFPze
 1JXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+hYXlItoM/Z3+fP1AldUiXSVWyrROjLm9Iu89IH+Ds=;
 b=H4Uf7JpWfRA5drhKAPSJds6CWBuQtnoAh/HnRvYDWBr4kzs2pPH7kbZ23eHztF+tEF
 WKZjjemz8VvI8UiFDTiEskKVfaMYOtNttH5Zx39JonkcCjJpdYjWgnNIztMglzY9MaSX
 Ao1dMP9QxDtwyAJtwdKnpggLA0K1Ms2fV2Ho/QI6Xsu7lyVw7bjQf2Mb7B3tQ8iA+Eq7
 mJtzHCF/9QBAzjehpP6bTRVXASUf44MAodUzEnPM0K0VGmLUAwn6IKgAgnWnt/cUVj/i
 BMzZK+Ixbrbv2Ppyj//glWyCs73U0Clswki9ynP7gJQfH9kbSNCcaxIMfguzDddNhwxS
 gBRQ==
X-Gm-Message-State: AOAM533ae0RRdplYOQJ7MSBTnYCeFaBfjJ03ZNXUbUIuIeaMQ9DMoDR+
 BnJRCbcnU1mwRyhfk1mkzROdvPUTO3AtQg==
X-Google-Smtp-Source: ABdhPJxRNV7hFxTAw9ZeIhq/CbKcKnmW7gl8S2AopfEXSwkW0iI0onYHAqs4lP4f4XYu0oBLocYC7g==
X-Received: by 2002:a62:7fcb:0:b029:1da:36b1:8ac7 with SMTP id
 a194-20020a627fcb0000b02901da36b18ac7mr995388pfd.13.1613593460786; 
 Wed, 17 Feb 2021 12:24:20 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 66/71] tcg/tci: Implement clz, ctz, ctpop
Date: Wed, 17 Feb 2021 12:20:31 -0800
Message-Id: <20210217202036.1724901-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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



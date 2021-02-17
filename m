Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65C31E121
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:18:07 +0100 (CET)
Received: from localhost ([::1]:43376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUD0-00074U-NM
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:18:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTN0-0001zW-JV
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:22 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMy-0007m4-NR
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:22 -0500
Received: by mail-pf1-x435.google.com with SMTP id 189so9169611pfy.6
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R3Xq5mi4KWyitR5salt2lYEIY+qV+wkNAizGGObuYbw=;
 b=A1ND+q4F65vaNYZjdYj9bdTNS0sWiL2hTnhKQ5S6/739VPDBTuYio2Gg/Xc0AkI6Ue
 GzGC5WIq3CR0W60ZZKuRA7SfXc26YPAWsK1hH6cebjzaaoIHVX686rfOnruALWZUqrYl
 sL1T1Q9mw8yJj7Iov8bzkkH5OxDwotyDVIV0KURBWPwujhBuxSA+koDjrTB20F6HEtm4
 d3PktVbQCf/LKIaXM/nnUCMTTSbBsTjdHg23Arx5FwIFLY4H8qzcXixS+1QWCVYyNZwE
 NfkSe0chudlZ5HT3UQk5OD6k6iI8TMhVFULFNymdq/1mnP3Ol3A1FUN2gGEQv25sAQ+j
 XrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R3Xq5mi4KWyitR5salt2lYEIY+qV+wkNAizGGObuYbw=;
 b=Bqk+zelA+DuOQzdz+2Ch6lRDBIW5sz4svwTz/viBo0QloiRd59oO5bxFDODgw2eEcM
 8InwyiOaMC2aTGOCjk8MzBrw6u3VPeyeZctRJ6bJP3fuSndz8bEsT8+pm4LJH1RScF+E
 pe+4Vb7Pqazpm1Yp3+m3ATVX0rhyiRu4NrdLjKKIoaOZz8rou7BylGHjUVuHSynegQjQ
 emY2SBDnYGOxbsDMbFpMFwEqHn0Tjd2IFFHPFFCCwSWR52frfQDt6gV3AfDNuYFs4PQQ
 iV7tSGpC3jYM6WnOcYQ7Nbxa907wtkadiLzmupfTST6DWLhgr4u3ViTyz5AI+b3nQi4V
 Jx1A==
X-Gm-Message-State: AOAM533EdHECSZ7w4rsAhYNs8ZA0g6CYjKDxjG7Z6fQxo5adDfkcwLbm
 mzvxfceV1CukfVFudS1aLZ3d4Q++/eou3g==
X-Google-Smtp-Source: ABdhPJz05cMY/UnWunzn6Ojpkbu5tXdCUTVA573pkZY687bftDFVDyYB+LDlpED1JwDeYAhs1nAcuw==
X-Received: by 2002:a62:ea08:0:b029:1ec:a029:c04a with SMTP id
 t8-20020a62ea080000b02901eca029c04amr990370pfh.40.1613593459357; 
 Wed, 17 Feb 2021 12:24:19 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 65/71] tcg/tci: Implement extract, sextract
Date: Wed, 17 Feb 2021 12:20:30 -0800
Message-Id: <20210217202036.1724901-66-richard.henderson@linaro.org>
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
index 02fad3370d..dcf8dc418f 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -122,6 +122,15 @@ static void tci_args_rrs(uint32_t insn, TCGReg *r0, TCGReg *r1, int32_t *i2)
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
@@ -609,6 +618,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -749,6 +770,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -1190,6 +1223,15 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
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
index a0c458a60a..cedd0328df 100644
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
@@ -653,6 +672,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
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



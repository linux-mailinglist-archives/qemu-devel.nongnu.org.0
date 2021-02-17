Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9789131E136
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:21:00 +0100 (CET)
Received: from localhost ([::1]:53802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUFn-00034E-Ia
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:20:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMz-0001z6-U0
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:22 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMx-0007ln-1P
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:21 -0500
Received: by mail-pj1-x1034.google.com with SMTP id gb24so2147311pjb.4
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8UhCzfaKYlwmE690TaVTdGnsli7nQ9Ath2fy3ZA2wa8=;
 b=AP3b9FxbA0Vkh8EdThmuZDPiknz3Nl/Lig36mk3YIOaZ0ATiXMcQ5AY3c8Bo7ya+30
 /SBoMDyISVQXRDTOrJzWF+LqlPKlU+K4Z8ddkbi7HI8639XcBKSemww3g7DXcWy9swmF
 +Kp2mKpJzbfadj7VCSMduNdV7YD4OPclFSPfKw90sCKg3D86rqHRXjyMf60MF3NOMtO/
 SWbQC/FWOKczJMxfaZ/MwEk8iQ4tA4+dOo+O0XrUEbJj6IT8p9N4qUqxNQHimjdO0Me5
 lg8wwOoil+UsGGXCghEbJLA7jUNXqTr8q9TS4/KAgXhSYmIy+9XVtXdKGEDQ0B7A53Jr
 xkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8UhCzfaKYlwmE690TaVTdGnsli7nQ9Ath2fy3ZA2wa8=;
 b=ib+dR3iSsRf4hzyG+gQ16Hda9J1FuV0W/tsNuI4ydrdfHggGjIH4tazNs//3J+0qaM
 HfLpJPZRrAfT5R78H52NaSun1gtsouxrqW9NB5aGE6dRmEaqy2zbfft00rpy1fsnh/sw
 vgGahF4uD6rEBw86V4Qnt940RJnvacAW8FYP+QRFeXNNLQVzLo/wN71Z7LmN1n4uVn3V
 ArfuPHbxZlkkskEsYgXBxnbrhGk3lZqTJJVzIifJTkp4CmSwqKo5YyIgwpX83Dr1pViv
 ZVFYNvQ+MN2AeWTx5XT7viJY0knqEUVdHleBWSftKJWczjZ9MyTAAUAiroSYBVc1685w
 o30Q==
X-Gm-Message-State: AOAM532QSU/APEkBrykenpO3OZFbCJxP8uqp5jE3FwPdDUBTZ+HsrOcT
 ux3LTClr1faJpcJvFHrWIC9osFDo5N7E/g==
X-Google-Smtp-Source: ABdhPJzB0wiV9lhQFtLuP8QRHFADFqhC+i99J/qn66sEn8rmlKhlU8ZH1PXCBhw4nGWwLXFser5yEA==
X-Received: by 2002:a17:902:d48b:b029:e1:f87:265d with SMTP id
 c11-20020a170902d48bb02900e10f87265dmr669310plg.1.1613593457668; 
 Wed, 17 Feb 2021 12:24:17 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 64/71] tcg/tci: Implement andc, orc, eqv, nand, nor
Date: Wed, 17 Feb 2021 12:20:29 -0800
Message-Id: <20210217202036.1724901-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
index 2391dd4d3b..02fad3370d 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -530,6 +530,36 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
 
@@ -1120,6 +1150,16 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
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



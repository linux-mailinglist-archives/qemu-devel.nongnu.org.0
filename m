Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F16337713
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:24:35 +0100 (CET)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNAw-0006L4-Ox
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVU-0004Ka-Cb
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:44 -0500
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:38721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVO-0006vN-PX
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:44 -0500
Received: by mail-qv1-xf35.google.com with SMTP id t5so2640652qvs.5
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8UhCzfaKYlwmE690TaVTdGnsli7nQ9Ath2fy3ZA2wa8=;
 b=C4i9ohrvUTTzKS8W6UgMQ82QlAlHpUjB9v6VR47Gwy90LH42pGi2kqpB/+lHr7Z/0Y
 wx887VxNlH5FpEzWTJuGjbl+hMw+lZGDgl74uCxLbFHBjlDjRMb4ZWw4ZiL6vUGDpR9s
 pD9Gj28lPQXSRXkBk++acPO1ootVjL0N0zXQT3vCawoHLLWhY1YI9Ms/CSnsTCXSrVQz
 fSmFE9ppoXY8tJRK+wygcvoO3IaKbU/z7wmPkdx34324zFu+mArjsZM5xKYrQUHMCA9f
 +lM/TKGF70pSBig0JPgNhe5W4CGLntBz7XLb7V/xrGFntSGlvm8ZrK6h1CcIVaTYtKyX
 7Z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8UhCzfaKYlwmE690TaVTdGnsli7nQ9Ath2fy3ZA2wa8=;
 b=AnZtdgnlwqQMu8yDEUZJAKXB/u+MfX+vmZ2gDH6pl86RqsWXL0tX/5dTXbQ9FexN7K
 V66e45HlHYwcK7oJNinXR3BrWJ+2JH0wSWJFXJYomz2wjaZW7uJJn32bIcX2+hfbDgMw
 2saMqCyc77bEldoIjfeDj9FslYzQOzPC/JkmYmY8rH19Z+LCEQ+6tV9syVF4DQa1vi6b
 mF57/bNz4SuD+cFewjicu/JkWa7B96eOHD6XRwBVlft751+sMzKcDBeH+1XNmYcoN9Ie
 eWQzzc82bwXo5l2ScPK+cJmOihTFsHVa8DRi+l9tFWBWprOeZj2da4NOK/N+3jlMhOlI
 meSw==
X-Gm-Message-State: AOAM532znzYJfLb/+LPpxQ/kllF0fA6gsWDrLZTNZr3EnfMzpYuh7VpT
 exWBdNuuZoxmLPNZ1OPDjEbMxea///EiHbVF
X-Google-Smtp-Source: ABdhPJxVhT82G/u/f+iI7GP9VaoFNrriP3WTiRt5HtjnB2gGj+ncyugE7SpPKxli3+xi7vrCQ3Cg2Q==
X-Received: by 2002:a05:6214:f6d:: with SMTP id
 iy13mr8063150qvb.24.1615473696022; 
 Thu, 11 Mar 2021 06:41:36 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g14sm1962421qkm.98.2021.03.11.06.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:41:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 49/57] tcg/tci: Implement andc, orc, eqv, nand, nor
Date: Thu, 11 Mar 2021 08:39:50 -0600
Message-Id: <20210311143958.562625-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
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



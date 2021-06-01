Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE64C397662
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:18:15 +0200 (CEST)
Received: from localhost ([::1]:55540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo69m-0001lm-RF
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5ts-0002X5-On
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:48 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:37749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5ti-0002eS-UZ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:48 -0400
Received: by mail-io1-xd29.google.com with SMTP id q7so9857791iob.4
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=29VWBE/uKCUXaWudKXqxflEqzE/RP7wyHl6uNJ3qmhw=;
 b=nhpxpcT3ercJuN8YyzJXg0qQ83brRrUUwVLb7awo80hVblGrPtRwoTeJrvM/MkZvkw
 Xc9AGs2gK7VW0hmpe/LKAEr841quFjGD9c9xqzA32WQ+iKX4doyju/QVnUf3bktvFNo2
 8eJMDdgEz38lRzcZBjYSAC78UScWobASjYK3x70Yuuo7opsUpTASnsC8N7j2Nc32/Y4u
 19Xgs7/NDlXdYwCzt3ZaZzCQ0vZRwWZg0Oph0mAE/Fe3ySQe/qHnK/25m34m1mMS+lF4
 +vSBLONgXM8NGVpkc5dTUpdBJTBOxvHrnxEKPw/CXGCW6XnlsuAOlqvDwKhnX/pwUzjd
 SNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=29VWBE/uKCUXaWudKXqxflEqzE/RP7wyHl6uNJ3qmhw=;
 b=n9FgrHiiPrJtI7qsndmdq133kUjpSU688J6M2kkR7Q7Jwp2O2+sSGMLbV4G4F8RwrA
 2vUkWEflONNivTOdPehpY6Sj/jbdCpFIcXxVRRDxgZx51Kc0e9j4QgLdMIHFkRgptb+d
 lZxT3DUJyVlnkEZrdE4rHzIeIHdvcDHZjcY7e77SWZbutryoRUyir4ED0yOAXyuNndik
 p6l+NLMPWDw8hnvpQMtq3gab61PUhIMMQGGuNCBBqLOqNxgNX4XHtbFmwOTkR0rc7uJq
 2rTaLCzEqOnHctYOnEY8mYJOScbtBp94BSnVH9JkODz8SzqLeWbVWHtfW86nqHpNVMSZ
 6gUw==
X-Gm-Message-State: AOAM533Ti3ZCYxSncvRkBhYktcQCFIk3H8aX5PQoB6nuSC1iNJO2oJEW
 /trRqwdxBuGj90hoxDuWvBCAPU3rXCwO8xlF
X-Google-Smtp-Source: ABdhPJyV/4vJjAp9nowwz0znr38eW5L/VG5qpyBaTaS55/YUgEXsFfNPtgbbFCyigUKFoNabmBEjeg==
X-Received: by 2002:a05:6638:37a9:: with SMTP id
 w41mr26217861jal.12.1622559693800; 
 Tue, 01 Jun 2021 08:01:33 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 18/27] tcg/tci: Implement andc, orc, eqv, nand, nor
Date: Tue,  1 Jun 2021 08:00:57 -0700
Message-Id: <20210601150106.12761-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd29.google.com
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

These were already present in tcg-target.c.inc,
but not in the interpreter.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 1f4f52bac8..068ee8f1f4 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -529,6 +529,36 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
 
@@ -1119,6 +1149,16 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
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



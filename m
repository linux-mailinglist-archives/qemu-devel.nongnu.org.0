Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA352E18E1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:24:52 +0100 (CET)
Received: from localhost ([::1]:40660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxZr-000386-GO
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEU-00006C-VB
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:47 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxED-0000Qw-RV
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:46 -0500
Received: by mail-pj1-x102d.google.com with SMTP id lb18so2473933pjb.5
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0q5ANbZEj0KFtnrT7+j+pQ6Kp2i0ZGMJCtKydc5+1vo=;
 b=jncAwTjJUX9ZtO9H9CkUrKTXSR4MqhRFb1K9irwUKWw6lu3yyuLjpNA6u9dgit78VQ
 Vl1yHzVqQVPLd6sdPby8zdnbA9R9GUmLFmxVFXGwLrIe1SVmjExq3SNtEnDzV8GwTTK5
 D/1i41hQH9QA8HgthaSfnQVCCiVlh0giqdsiEcm1ClHHLvBSSuwaeBdi9Tv7Rg29Bify
 f0cNqQJfYGa7oX60TP7VCqZGmKYmjNahtjIJjPohfeeQTLnq0LbZMKYI5xHnzsMgkbIh
 diNMY/nuQqvzBe7Nbk5cEPivdE/6P8icYq6HODCZM0zwGbGVWCOi4rYz16EAAs57uhhE
 aLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0q5ANbZEj0KFtnrT7+j+pQ6Kp2i0ZGMJCtKydc5+1vo=;
 b=kR/JVii2GKkCLDXmHsulpc/Dvd8qcq1BDLczwJrlhHlIhYXmcCznhg+Ow8OcWV05Yp
 9RhBwmIqRqCa6GBzFumn8RiLXZLLJn7yo/RfUA7W+7zd66IgJvsnQQiGVn+LpTmlzEMk
 4GtQxYp5h67D1hrqWPctbdxTJQSALCMIwM3ClkptEZVCm5iWthVwFdsi0WpDnNzNA+O9
 xBko2ZVzIhuOdV0G4hTIE9VzJ9dTs+xAn9cvzITbwDFuEhanGx+ZQiov7jrJLeAStN2p
 LFQRPpkOIS97uZM7JkungAG8j2WIZOAI7ZaeEzxHuFF4lR9/RUiFc/thBHg+G46U/Ka9
 1LdQ==
X-Gm-Message-State: AOAM530rUKjYI+0X0EiBj7TY3L/YMJmkaVzwM9K+iOlOR6dwsRfz+9gp
 6avbsfHGT4sIKBMHQnOApFJAbvgTr3GOfw==
X-Google-Smtp-Source: ABdhPJwHmlMrl1nObblAeW59+YxWxmhQHDlX+wrhM2/mx+ZvnTDx/NvH4386VPI5LX741/M07jOeVw==
X-Received: by 2002:a17:90b:217:: with SMTP id
 fy23mr25324210pjb.199.1608703348016; 
 Tue, 22 Dec 2020 22:02:28 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/22] tcg/riscv: Convert to tcg-target-conset.h
Date: Tue, 22 Dec 2020 22:02:00 -0800
Message-Id: <20201223060204.576856-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
 tcg/riscv/tcg-target-conset.h | 25 +++++++++++
 tcg/riscv/tcg-target.h        |  1 +
 tcg/riscv/tcg-target.c.inc    | 83 ++++++++++-------------------------
 3 files changed, 49 insertions(+), 60 deletions(-)
 create mode 100644 tcg/riscv/tcg-target-conset.h

diff --git a/tcg/riscv/tcg-target-conset.h b/tcg/riscv/tcg-target-conset.h
new file mode 100644
index 0000000000..116dd75db2
--- /dev/null
+++ b/tcg/riscv/tcg-target-conset.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * RISC-V target-specific constaint sets.
+ * Copyright (c) 2020 Linaro
+ */
+
+C_O0_I1(r)
+C_O0_I2(LZ, L)
+C_O0_I2(rZ, r)
+C_O0_I2(rZ, rZ)
+C_O0_I3(LZ, L, L)
+C_O0_I3(LZ, LZ, L)
+C_O0_I4(LZ, LZ, L, L)
+C_O0_I4(rZ, rZ, rZ, rZ)
+C_O1_I1(r, L)
+C_O1_I1(r, r)
+C_O1_I2(r, L, L)
+C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rI)
+C_O1_I2(r, rZ, rN)
+C_O1_I2(r, rZ, rZ)
+C_O1_I4(r, rZ, rZ, rZ, rZ)
+C_O2_I1(r, r, L)
+C_O2_I2(r, r, L, L)
+C_O2_I4(r, r, rZ, rZ, rM, rM)
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 032439d806..a357962e01 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -175,5 +175,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
+#define TCG_TARGET_CONSET_H
 
 #endif
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 33047c1951..d222692704 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1571,50 +1571,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     }
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static int tcg_target_op_def(TCGOpcode op)
 {
-    static const TCGTargetOpDef r
-        = { .args_ct_str = { "r" } };
-    static const TCGTargetOpDef r_r
-        = { .args_ct_str = { "r", "r" } };
-    static const TCGTargetOpDef rZ_r
-        = { .args_ct_str = { "rZ", "r" } };
-    static const TCGTargetOpDef rZ_rZ
-        = { .args_ct_str = { "rZ", "rZ" } };
-    static const TCGTargetOpDef rZ_rZ_rZ_rZ
-        = { .args_ct_str = { "rZ", "rZ", "rZ", "rZ" } };
-    static const TCGTargetOpDef r_r_ri
-        = { .args_ct_str = { "r", "r", "ri" } };
-    static const TCGTargetOpDef r_r_rI
-        = { .args_ct_str = { "r", "r", "rI" } };
-    static const TCGTargetOpDef r_rZ_rN
-        = { .args_ct_str = { "r", "rZ", "rN" } };
-    static const TCGTargetOpDef r_rZ_rZ
-        = { .args_ct_str = { "r", "rZ", "rZ" } };
-    static const TCGTargetOpDef r_rZ_rZ_rZ_rZ
-        = { .args_ct_str = { "r", "rZ", "rZ", "rZ", "rZ" } };
-    static const TCGTargetOpDef r_L
-        = { .args_ct_str = { "r", "L" } };
-    static const TCGTargetOpDef r_r_L
-        = { .args_ct_str = { "r", "r", "L" } };
-    static const TCGTargetOpDef r_L_L
-        = { .args_ct_str = { "r", "L", "L" } };
-    static const TCGTargetOpDef r_r_L_L
-        = { .args_ct_str = { "r", "r", "L", "L" } };
-    static const TCGTargetOpDef LZ_L
-        = { .args_ct_str = { "LZ", "L" } };
-    static const TCGTargetOpDef LZ_L_L
-        = { .args_ct_str = { "LZ", "L", "L" } };
-    static const TCGTargetOpDef LZ_LZ_L
-        = { .args_ct_str = { "LZ", "LZ", "L" } };
-    static const TCGTargetOpDef LZ_LZ_L_L
-        = { .args_ct_str = { "LZ", "LZ", "L", "L" } };
-    static const TCGTargetOpDef r_r_rZ_rZ_rM_rM
-        = { .args_ct_str = { "r", "r", "rZ", "rZ", "rM", "rM" } };
-
     switch (op) {
     case INDEX_op_goto_ptr:
-        return &r;
+        return C_O0_I1(r);
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8s_i32:
@@ -1646,7 +1607,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_extrh_i64_i32:
     case INDEX_op_ext_i32_i64:
-        return &r_r;
+        return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
     case INDEX_op_st16_i32:
@@ -1655,7 +1616,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st16_i64:
     case INDEX_op_st32_i64:
     case INDEX_op_st_i64:
-        return &rZ_r;
+        return C_O0_I2(rZ, r);
 
     case INDEX_op_add_i32:
     case INDEX_op_and_i32:
@@ -1665,11 +1626,11 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_and_i64:
     case INDEX_op_or_i64:
     case INDEX_op_xor_i64:
-        return &r_r_rI;
+        return C_O1_I2(r, r, rI);
 
     case INDEX_op_sub_i32:
     case INDEX_op_sub_i64:
-        return &r_rZ_rN;
+        return C_O1_I2(r, rZ, rN);
 
     case INDEX_op_mul_i32:
     case INDEX_op_mulsh_i32:
@@ -1687,7 +1648,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rem_i64:
     case INDEX_op_remu_i64:
     case INDEX_op_setcond_i64:
-        return &r_rZ_rZ;
+        return C_O1_I2(r, rZ, rZ);
 
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
@@ -1695,39 +1656,41 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shl_i64:
     case INDEX_op_shr_i64:
     case INDEX_op_sar_i64:
-        return &r_r_ri;
+        return C_O1_I2(r, r, ri);
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-        return &rZ_rZ;
+        return C_O0_I2(rZ, rZ);
 
     case INDEX_op_add2_i32:
     case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
     case INDEX_op_sub2_i64:
-        return &r_r_rZ_rZ_rM_rM;
+        return C_O2_I4(r, r, rZ, rZ, rM, rM);
 
     case INDEX_op_brcond2_i32:
-        return &rZ_rZ_rZ_rZ;
+        return C_O0_I4(rZ, rZ, rZ, rZ);
 
     case INDEX_op_setcond2_i32:
-        return &r_rZ_rZ_rZ_rZ;
+        return C_O1_I4(r, rZ, rZ, rZ, rZ);
 
     case INDEX_op_qemu_ld_i32:
-        return TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &r_L : &r_L_L;
+        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
+                ? C_O1_I1(r, L) : C_O1_I2(r, L, L));
     case INDEX_op_qemu_st_i32:
-        return TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &LZ_L : &LZ_L_L;
+        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
+                ? C_O0_I2(LZ, L) : C_O0_I3(LZ, L, L));
     case INDEX_op_qemu_ld_i64:
-        return TCG_TARGET_REG_BITS == 64 ? &r_L
-               : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &r_r_L
-               : &r_r_L_L;
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
+               : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O2_I1(r, r, L)
+               : C_O2_I2(r, r, L, L));
     case INDEX_op_qemu_st_i64:
-        return TCG_TARGET_REG_BITS == 64 ? &LZ_L
-               : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &LZ_LZ_L
-               : &LZ_LZ_L_L;
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(LZ, L)
+               : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O0_I3(LZ, LZ, L)
+               : C_O0_I4(LZ, LZ, L, L));
 
     default:
-        return NULL;
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1



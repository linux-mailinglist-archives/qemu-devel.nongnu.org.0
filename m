Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F802E18D4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:20:16 +0100 (CET)
Received: from localhost ([::1]:60326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxVP-0007on-Ve
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:20:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEW-00006U-Em
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:48 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEG-0000RC-Dt
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:48 -0500
Received: by mail-pj1-x102d.google.com with SMTP id l23so2621728pjg.1
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=i8gt3VnD/hjlZ07ZVemULHRXuFsYp1d7hadsdqF1IbM=;
 b=RS82DjbK7TVVEyHjugFCFWvTniKIn1MhdsZILVAmH2z9Nb/AMcolVL46EOUzXMRz1U
 SnKYvgyENFS4sO+xOcA4qgAb5S2ST5pHndnz3QWapXMVkcMDioI6tGuedSQ0UfrAYU0X
 fBZhrnaggiRrf1PstlNPH3rL4h8t44ZIe36WtQxBFU3GEpkkUxwATIlnN81rHimrQ4p7
 DfFYG5OLxI1fNHuczoumF+1TFjJDqEF/oNoZfqO7V+4cyBDRmeu5mmRPtk02sZgwOfwy
 izOd+MowQqprohLOilbUZtTk4OUhkuqyC955S0q3pxC4WBYpzFh/95eEu4bEE1+jNiIi
 uoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i8gt3VnD/hjlZ07ZVemULHRXuFsYp1d7hadsdqF1IbM=;
 b=PNB2CRbkAhrb2pMxXAwjIPk8ZtvmmuUq5LQIpyo9H0gkzFTQ5aVjUzN3uRQ3aXBP+h
 EZPKfB5CkYqujzgnp8/xSYc2ZDRRIq9MrjNrac8CLBuF3hqJ5912fOls1+EU7C63H3xx
 v8sBz1YkBa+aoMKBKkop+2iB/eR9oxuTlJenuD9ZxmO9cXM5grh91E8x5YcUOYMFRPEI
 U5iUpOfWcBglC8UsBKEnEiOD11bBhfnLUptXWqx5AQL0m+Co8QY8Nu8cFMSShGzDruHH
 brsiF4cV39ui4BNjPLFwygguhdIrO0qffldB5/lKK67buFvrtxl9ht6+GCSrR/o5W771
 aMzg==
X-Gm-Message-State: AOAM530C3jKb+slR5MEfG73Pf0zhB0NygM//S+JK8tgh7/7QBSTfLwQr
 hJWE9zoQ3GI9EeIZ6qqGQZre+Z7BFE+l9g==
X-Google-Smtp-Source: ABdhPJwxMzbvuVSuYDA1UYLLTceT7BpOWzZ5oJKUDZpBlXF5oBdlXcGPSNsWSKfizCXSRcSTj5r64Q==
X-Received: by 2002:a17:90a:6f01:: with SMTP id
 d1mr23902111pjk.155.1608703350486; 
 Tue, 22 Dec 2020 22:02:30 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/22] tcg/sparc: Convert to tcg-target-conset.h
Date: Tue, 22 Dec 2020 22:02:02 -0800
Message-Id: <20201223060204.576856-21-richard.henderson@linaro.org>
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
 tcg/sparc/tcg-target-conset.h | 27 +++++++++++++
 tcg/sparc/tcg-target.h        |  1 +
 tcg/sparc/tcg-target.c.inc    | 75 +++++++++++------------------------
 3 files changed, 51 insertions(+), 52 deletions(-)
 create mode 100644 tcg/sparc/tcg-target-conset.h

diff --git a/tcg/sparc/tcg-target-conset.h b/tcg/sparc/tcg-target-conset.h
new file mode 100644
index 0000000000..fe7324af9a
--- /dev/null
+++ b/tcg/sparc/tcg-target-conset.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Sparc target-specific constaint sets.
+ * Copyright (c) 2020 Linaro
+ */
+
+C_O0_I1(r)
+C_O0_I2(rZ, r)
+C_O0_I2(RZ, r)
+C_O0_I2(rZ, rJ)
+C_O0_I2(RZ, RJ)
+C_O0_I2(sZ, A)
+C_O0_I2(SZ, A)
+C_O1_I1(r, A)
+C_O1_I1(R, A)
+C_O1_I1(r, r)
+C_O1_I1(r, R)
+C_O1_I1(R, r)
+C_O1_I1(R, R)
+C_O1_I2(R, R, R)
+C_O1_I2(r, rZ, rJ)
+C_O1_I2(R, RZ, RJ)
+C_O1_I4(r, rZ, rJ, rI, 0)
+C_O1_I4(R, RZ, RJ, RI, 0)
+C_O2_I2(r, r, rZ, rJ)
+C_O2_I4(R, R, RZ, RZ, RJ, RI)
+C_O2_I4(r, r, rZ, rZ, rJ, rJ)
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 633841ebf2..1304c225b1 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -179,5 +179,6 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CONSET_H
 
 #endif
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index c92742aaec..c225bdd7bd 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -1555,40 +1555,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     }
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static int tcg_target_op_def(TCGOpcode op)
 {
-    static const TCGTargetOpDef r = { .args_ct_str = { "r" } };
-    static const TCGTargetOpDef r_r = { .args_ct_str = { "r", "r" } };
-    static const TCGTargetOpDef R_r = { .args_ct_str = { "R", "r" } };
-    static const TCGTargetOpDef r_R = { .args_ct_str = { "r", "R" } };
-    static const TCGTargetOpDef R_R = { .args_ct_str = { "R", "R" } };
-    static const TCGTargetOpDef r_A = { .args_ct_str = { "r", "A" } };
-    static const TCGTargetOpDef R_A = { .args_ct_str = { "R", "A" } };
-    static const TCGTargetOpDef rZ_r = { .args_ct_str = { "rZ", "r" } };
-    static const TCGTargetOpDef RZ_r = { .args_ct_str = { "RZ", "r" } };
-    static const TCGTargetOpDef sZ_A = { .args_ct_str = { "sZ", "A" } };
-    static const TCGTargetOpDef SZ_A = { .args_ct_str = { "SZ", "A" } };
-    static const TCGTargetOpDef rZ_rJ = { .args_ct_str = { "rZ", "rJ" } };
-    static const TCGTargetOpDef RZ_RJ = { .args_ct_str = { "RZ", "RJ" } };
-    static const TCGTargetOpDef R_R_R = { .args_ct_str = { "R", "R", "R" } };
-    static const TCGTargetOpDef r_rZ_rJ
-        = { .args_ct_str = { "r", "rZ", "rJ" } };
-    static const TCGTargetOpDef R_RZ_RJ
-        = { .args_ct_str = { "R", "RZ", "RJ" } };
-    static const TCGTargetOpDef r_r_rZ_rJ
-        = { .args_ct_str = { "r", "r", "rZ", "rJ" } };
-    static const TCGTargetOpDef movc_32
-        = { .args_ct_str = { "r", "rZ", "rJ", "rI", "0" } };
-    static const TCGTargetOpDef movc_64
-        = { .args_ct_str = { "R", "RZ", "RJ", "RI", "0" } };
-    static const TCGTargetOpDef add2_32
-        = { .args_ct_str = { "r", "r", "rZ", "rZ", "rJ", "rJ" } };
-    static const TCGTargetOpDef add2_64
-        = { .args_ct_str = { "R", "R", "RZ", "RZ", "RJ", "RI" } };
-
     switch (op) {
     case INDEX_op_goto_ptr:
-        return &r;
+        return C_O0_I1(r);
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8s_i32:
@@ -1597,12 +1568,12 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld_i32:
     case INDEX_op_neg_i32:
     case INDEX_op_not_i32:
-        return &r_r;
+        return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
     case INDEX_op_st16_i32:
     case INDEX_op_st_i32:
-        return &rZ_r;
+        return C_O0_I2(rZ, r);
 
     case INDEX_op_add_i32:
     case INDEX_op_mul_i32:
@@ -1618,18 +1589,18 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shr_i32:
     case INDEX_op_sar_i32:
     case INDEX_op_setcond_i32:
-        return &r_rZ_rJ;
+        return C_O1_I2(r, rZ, rJ);
 
     case INDEX_op_brcond_i32:
-        return &rZ_rJ;
+        return C_O0_I2(rZ, rJ);
     case INDEX_op_movcond_i32:
-        return &movc_32;
+        return C_O1_I4(r, rZ, rJ, rI, 0);
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-        return &add2_32;
+        return C_O2_I4(r, r, rZ, rZ, rJ, rJ);
     case INDEX_op_mulu2_i32:
     case INDEX_op_muls2_i32:
-        return &r_r_rZ_rJ;
+        return C_O2_I2(r, r, rZ, rJ);
 
     case INDEX_op_ld8u_i64:
     case INDEX_op_ld8s_i64:
@@ -1640,13 +1611,13 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
-        return &R_r;
+        return C_O1_I1(R, r);
 
     case INDEX_op_st8_i64:
     case INDEX_op_st16_i64:
     case INDEX_op_st32_i64:
     case INDEX_op_st_i64:
-        return &RZ_r;
+        return C_O0_I2(RZ, r);
 
     case INDEX_op_add_i64:
     case INDEX_op_mul_i64:
@@ -1662,39 +1633,39 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shr_i64:
     case INDEX_op_sar_i64:
     case INDEX_op_setcond_i64:
-        return &R_RZ_RJ;
+        return C_O1_I2(R, RZ, RJ);
 
     case INDEX_op_neg_i64:
     case INDEX_op_not_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
-        return &R_R;
+        return C_O1_I1(R, R);
 
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_extrh_i64_i32:
-        return &r_R;
+        return C_O1_I1(r, R);
 
     case INDEX_op_brcond_i64:
-        return &RZ_RJ;
+        return C_O0_I2(RZ, RJ);
     case INDEX_op_movcond_i64:
-        return &movc_64;
+        return C_O1_I4(R, RZ, RJ, RI, 0);
     case INDEX_op_add2_i64:
     case INDEX_op_sub2_i64:
-        return &add2_64;
+        return C_O2_I4(R, R, RZ, RZ, RJ, RI);
     case INDEX_op_muluh_i64:
-        return &R_R_R;
+        return C_O1_I2(R, R, R);
 
     case INDEX_op_qemu_ld_i32:
-        return &r_A;
+        return C_O1_I1(r, A);
     case INDEX_op_qemu_ld_i64:
-        return &R_A;
+        return C_O1_I1(R, A);
     case INDEX_op_qemu_st_i32:
-        return &sZ_A;
+        return C_O0_I2(sZ, A);
     case INDEX_op_qemu_st_i64:
-        return &SZ_A;
+        return C_O0_I2(SZ, A);
 
     default:
-        return NULL;
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1



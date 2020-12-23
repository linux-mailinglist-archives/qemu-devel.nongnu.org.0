Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160DF2E18D6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:20:39 +0100 (CET)
Received: from localhost ([::1]:60924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxVm-00083J-3e
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:20:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEP-0008Tt-Nm
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:41 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEA-0000Py-Vk
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:41 -0500
Received: by mail-pj1-x1031.google.com with SMTP id lj6so2483606pjb.0
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yGmI0QnYWg43jv8xLi9von8FNP2RJruA54pGCztFbJA=;
 b=h/LtO7PQ/tFSMA8xl3uEzC3ctNYiaQ6mzu2nSRkCRKnl1CLmxOuID7J9Upec+kQQkP
 aHagMK+vlmaLECk8TNZCQxNcQPJsnOpFGsKPuhz9/OvAYWkkgHo+gvyzM0VNv9Xgi2SE
 VYVuNcLjtq4YnsHAQCsg7o34K568UHY5gc5IGZi4wL1nRvWDfyKgTthv9bIojsq0Nv2V
 Y9du5ISmOvpdPJ4Q6g8sML5UE/goa++pLrgTRFJZR6sLhfRtqFAZpxCetnR2usSlN7zO
 IBEPW09QrHf1h6pjpCaIvCD3WzwkPE+kgMA6Hec9DShFfOkrF4CYKOYO81YLoahwG/OK
 9RwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yGmI0QnYWg43jv8xLi9von8FNP2RJruA54pGCztFbJA=;
 b=MgqiqtFL0HhcIrJUhCsmuhm6H1oDdIhi7Nxb+RhDghnyBnc6wFc93DKwSSsVfZY3W+
 Z+boOEGnDyit0n0xZeO9t+bgN7fwDfC1XDZ5A5TaeJ9U0JFRfqE4qXGanta0jhuUnBnp
 CeFNqdDYe4lkNzsJ5X6DNLjXGsSRI+0viDgkCBuTxT0ZIoL4LghzFcMfLMApLM6e5iTr
 skaj8cpmVEZ8qK0E2xbAptD3eLJummHFTnb6NwPWDI4n18R6hFJMwF858h0sJi3XvNDe
 HmP67DHLDydjAB4GMmJR/6NGgBGRT8Bvt1lbJ4UYGImWRVD55EAsBnIxmqrPlhScNfVO
 NNxg==
X-Gm-Message-State: AOAM530MZPResQOzFzcJzqo07dOBsEguLmS3DnLhEM0LamXPQKCJuCMx
 EXXI+Nkyr2upRagYE+rM7FWVDNGeV9vhEQ==
X-Google-Smtp-Source: ABdhPJyqfDH/eg68Wym9h2XMMvvopjduw6cZkwt9t3qOdkSlstlgGj/2isdW4ZcjO69KlEzkfU1FFw==
X-Received: by 2002:a17:902:7b84:b029:da:60e0:9d38 with SMTP id
 w4-20020a1709027b84b02900da60e09d38mr23965631pll.55.1608703344329; 
 Tue, 22 Dec 2020 22:02:24 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/22] tcg/arm: Convert to tcg-target-conset.h
Date: Tue, 22 Dec 2020 22:01:57 -0800
Message-Id: <20201223060204.576856-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
 tcg/arm/tcg-target-conset.h | 30 ++++++++++++
 tcg/arm/tcg-target.h        |  1 +
 tcg/arm/tcg-target.c.inc    | 94 +++++++++++++------------------------
 3 files changed, 63 insertions(+), 62 deletions(-)
 create mode 100644 tcg/arm/tcg-target-conset.h

diff --git a/tcg/arm/tcg-target-conset.h b/tcg/arm/tcg-target-conset.h
new file mode 100644
index 0000000000..7e972e70e0
--- /dev/null
+++ b/tcg/arm/tcg-target-conset.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Arm target-specific constaint sets.
+ * Copyright (c) 2020 Linaro
+ */
+
+C_O0_I1(r)
+C_O0_I2(r, r)
+C_O0_I2(r, rIN)
+C_O0_I2(s, s)
+C_O0_I3(s, s, s)
+C_O0_I4(r, r, rI, rI)
+C_O0_I4(s, s, s, s)
+C_O1_I1(r, l)
+C_O1_I1(r, r)
+C_O1_I2(r, 0, rZ)
+C_O1_I2(r, l, l)
+C_O1_I2(r, r, r)
+C_O1_I2(r, r, rI)
+C_O1_I2(r, r, rIK)
+C_O1_I2(r, r, rIN)
+C_O1_I2(r, r, ri)
+C_O1_I2(r, rZ, rZ)
+C_O1_I4(r, r, r, rI, rI)
+C_O1_I4(r, r, rIN, rIK, 0)
+C_O2_I1(r, r, l)
+C_O2_I2(r, r, l, l)
+C_O2_I2(r, r, r, r)
+C_O2_I4(r, r, r, r, rIN, rIK)
+C_O2_I4(r, r, rI, rI, rIN, rIK)
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 17e771374d..918f09239a 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -146,5 +146,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CONSET_H
 
 #endif
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index ab1b295293..029d58e4b7 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2012,57 +2012,17 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     }
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static int tcg_target_op_def(TCGOpcode op)
 {
-    static const TCGTargetOpDef r = { .args_ct_str = { "r" } };
-    static const TCGTargetOpDef r_r = { .args_ct_str = { "r", "r" } };
-    static const TCGTargetOpDef s_s = { .args_ct_str = { "s", "s" } };
-    static const TCGTargetOpDef r_l = { .args_ct_str = { "r", "l" } };
-    static const TCGTargetOpDef r_r_r = { .args_ct_str = { "r", "r", "r" } };
-    static const TCGTargetOpDef r_r_l = { .args_ct_str = { "r", "r", "l" } };
-    static const TCGTargetOpDef r_l_l = { .args_ct_str = { "r", "l", "l" } };
-    static const TCGTargetOpDef s_s_s = { .args_ct_str = { "s", "s", "s" } };
-    static const TCGTargetOpDef r_r_ri = { .args_ct_str = { "r", "r", "ri" } };
-    static const TCGTargetOpDef r_r_rI = { .args_ct_str = { "r", "r", "rI" } };
-    static const TCGTargetOpDef r_r_rIN
-        = { .args_ct_str = { "r", "r", "rIN" } };
-    static const TCGTargetOpDef r_r_rIK
-        = { .args_ct_str = { "r", "r", "rIK" } };
-    static const TCGTargetOpDef r_r_r_r
-        = { .args_ct_str = { "r", "r", "r", "r" } };
-    static const TCGTargetOpDef r_r_l_l
-        = { .args_ct_str = { "r", "r", "l", "l" } };
-    static const TCGTargetOpDef s_s_s_s
-        = { .args_ct_str = { "s", "s", "s", "s" } };
-    static const TCGTargetOpDef br
-        = { .args_ct_str = { "r", "rIN" } };
-    static const TCGTargetOpDef ext2
-        = { .args_ct_str = { "r", "rZ", "rZ" } };
-    static const TCGTargetOpDef dep
-        = { .args_ct_str = { "r", "0", "rZ" } };
-    static const TCGTargetOpDef movc
-        = { .args_ct_str = { "r", "r", "rIN", "rIK", "0" } };
-    static const TCGTargetOpDef add2
-        = { .args_ct_str = { "r", "r", "r", "r", "rIN", "rIK" } };
-    static const TCGTargetOpDef sub2
-        = { .args_ct_str = { "r", "r", "rI", "rI", "rIN", "rIK" } };
-    static const TCGTargetOpDef br2
-        = { .args_ct_str = { "r", "r", "rI", "rI" } };
-    static const TCGTargetOpDef setc2
-        = { .args_ct_str = { "r", "r", "r", "rI", "rI" } };
-
     switch (op) {
     case INDEX_op_goto_ptr:
-        return &r;
+        return C_O0_I1(r);
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld16u_i32:
     case INDEX_op_ld16s_i32:
     case INDEX_op_ld_i32:
-    case INDEX_op_st8_i32:
-    case INDEX_op_st16_i32:
-    case INDEX_op_st_i32:
     case INDEX_op_neg_i32:
     case INDEX_op_not_i32:
     case INDEX_op_bswap16_i32:
@@ -2072,62 +2032,72 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ext16u_i32:
     case INDEX_op_extract_i32:
     case INDEX_op_sextract_i32:
-        return &r_r;
+        return C_O1_I1(r, r);
+
+    case INDEX_op_st8_i32:
+    case INDEX_op_st16_i32:
+    case INDEX_op_st_i32:
+        return C_O0_I2(r, r);
 
     case INDEX_op_add_i32:
     case INDEX_op_sub_i32:
     case INDEX_op_setcond_i32:
-        return &r_r_rIN;
+        return C_O1_I2(r, r, rIN);
+
     case INDEX_op_and_i32:
     case INDEX_op_andc_i32:
     case INDEX_op_clz_i32:
     case INDEX_op_ctz_i32:
-        return &r_r_rIK;
+        return C_O1_I2(r, r, rIK);
+
     case INDEX_op_mul_i32:
     case INDEX_op_div_i32:
     case INDEX_op_divu_i32:
-        return &r_r_r;
+        return C_O1_I2(r, r, r);
+
     case INDEX_op_mulu2_i32:
     case INDEX_op_muls2_i32:
-        return &r_r_r_r;
+        return C_O2_I2(r, r, r, r);
+
     case INDEX_op_or_i32:
     case INDEX_op_xor_i32:
-        return &r_r_rI;
+        return C_O1_I2(r, r, rI);
+
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
     case INDEX_op_sar_i32:
     case INDEX_op_rotl_i32:
     case INDEX_op_rotr_i32:
-        return &r_r_ri;
+        return C_O1_I2(r, r, ri);
 
     case INDEX_op_brcond_i32:
-        return &br;
+        return C_O0_I2(r, rIN);
     case INDEX_op_deposit_i32:
-        return &dep;
+        return C_O1_I2(r, 0, rZ);
     case INDEX_op_extract2_i32:
-        return &ext2;
+        return C_O1_I2(r, rZ, rZ);
     case INDEX_op_movcond_i32:
-        return &movc;
+        return C_O1_I4(r, r, rIN, rIK, 0);
     case INDEX_op_add2_i32:
-        return &add2;
+        return C_O2_I4(r, r, r, r, rIN, rIK);
     case INDEX_op_sub2_i32:
-        return &sub2;
+        return C_O2_I4(r, r, rI, rI, rIN, rIK);
     case INDEX_op_brcond2_i32:
-        return &br2;
+        return C_O0_I4(r, r, rI, rI);
     case INDEX_op_setcond2_i32:
-        return &setc2;
+        return C_O1_I4(r, r, r, rI, rI);
 
     case INDEX_op_qemu_ld_i32:
-        return TARGET_LONG_BITS == 32 ? &r_l : &r_l_l;
+        return TARGET_LONG_BITS == 32 ? C_O1_I1(r, l) : C_O1_I2(r, l, l);
     case INDEX_op_qemu_ld_i64:
-        return TARGET_LONG_BITS == 32 ? &r_r_l : &r_r_l_l;
+        return TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, l) : C_O2_I2(r, r, l, l);
     case INDEX_op_qemu_st_i32:
-        return TARGET_LONG_BITS == 32 ? &s_s : &s_s_s;
+        return TARGET_LONG_BITS == 32 ? C_O0_I2(s, s) : C_O0_I3(s, s, s);
     case INDEX_op_qemu_st_i64:
-        return TARGET_LONG_BITS == 32 ? &s_s_s : &s_s_s_s;
+        return TARGET_LONG_BITS == 32 ? C_O0_I3(s, s, s) : C_O0_I4(s, s, s, s);
 
     default:
-        return NULL;
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1



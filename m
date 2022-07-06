Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995456825C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:02:16 +0200 (CEST)
Received: from localhost ([::1]:41258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o90vG-0004lq-Pz
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LD-00062H-4s
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:59 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LA-0000QJ-2z
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:58 -0400
Received: by mail-pl1-x62f.google.com with SMTP id b2so13044366plx.7
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PhJtFSrquOFUVO5QY9Q5zh4pNEWnYjCw2RgtobhuW2s=;
 b=InQ1T/RN1FSGUZR4yPyN5eUxjgUYpEgJKgM976T5+xv9fYn4hymprDs91Rz1TJG+hu
 pGHv+c3mxCZGAC2oatBgahx1E7oKmgl6q6ffJwEovF9S+2RwlwkMGSX5p+6LhXPraTLq
 nnLLiRbStcxD2dDm3xj+ah/uqjwGJYtUtJ8Zkn8OERwpLuJ1PXI3t4oc0a5HTGStSa3B
 BsRvD4MQwI74KX84zgDi/UEfrR4SqCpky2v8MiFfLAlht+6OQMpZmSSufzm5WncIIqth
 ewitVKSO2pb1pZWQCu1xlaCW2CnNcCXifWNTJzk7aLLr8MNHRs/Y8IBhNhizkjxmdKPG
 I3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PhJtFSrquOFUVO5QY9Q5zh4pNEWnYjCw2RgtobhuW2s=;
 b=Sriurc1m9h0YvPTncYIsANh0yC61ofsPHkZk0sA1tVf5yjSieVJ1watp7ShlT+WqOj
 4ezJ1ouAPLz3fRc9z5RHId0CY/SoE0P9uNyZz3s7OkNEGs/oAAHHOWxIINOxPK9Veog0
 /rKqCuAs8JvcJSu7A0LqLyh4qR/sV86DvTS7TJjgxvZFmKjJN1dMMMwShWbO0XjbS9Hk
 emNobpFmv6aveOBm+5FQA8xyLSg4r0BNJfiv21WbrISUHO/oqCsvsCiqIE9T7d/BVRK0
 aOxK0qF8JPfcSTRTta+H64xYguIedNOLy6piKzpA8OLkKQ5gOkSum3iCYMz7xe8dW+QD
 3XWQ==
X-Gm-Message-State: AJIora+vD2mEl12JKofeCf3GxRm59VUN10KPP0xOk1MBbh1MvMkpSKQK
 qMS8Z5qOTmtiXIcpvRLzz9adTQn9wnOgwsmj
X-Google-Smtp-Source: AGRyM1vcEAGBxBzM1VyoeSSab+okQ8R92qqgwjx1elON9fnvjXZ63c1S27NHeKO5NFZ31DbBjGx8vQ==
X-Received: by 2002:a17:90b:17c6:b0:1ec:dcc8:370a with SMTP id
 me6-20020a17090b17c600b001ecdcc8370amr48274934pjb.63.1657095894672; 
 Wed, 06 Jul 2022 01:24:54 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 15/45] target/arm: Add SME enablement checks
Date: Wed,  6 Jul 2022 13:53:41 +0530
Message-Id: <20220706082411.1664825-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

These functions will be used to verify that the cpu
is in the correct state for a given instruction.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h | 21 +++++++++++++++++++++
 target/arm/translate-a64.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 789b6e8e78..02fb95e019 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -29,6 +29,27 @@ void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v);
 bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
 bool sve_access_check(DisasContext *s);
+bool sme_enabled_check(DisasContext *s);
+bool sme_enabled_check_with_svcr(DisasContext *s, unsigned);
+
+/* This function corresponds to CheckStreamingSVEEnabled. */
+static inline bool sme_sm_enabled_check(DisasContext *s)
+{
+    return sme_enabled_check_with_svcr(s, R_SVCR_SM_MASK);
+}
+
+/* This function corresponds to CheckSMEAndZAEnabled. */
+static inline bool sme_za_enabled_check(DisasContext *s)
+{
+    return sme_enabled_check_with_svcr(s, R_SVCR_ZA_MASK);
+}
+
+/* Note that this function corresponds to CheckStreamingSVEAndZAEnabled. */
+static inline bool sme_smza_enabled_check(DisasContext *s)
+{
+    return sme_enabled_check_with_svcr(s, R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
+}
+
 TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7fab7f64f8..b16d81bf19 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1216,6 +1216,40 @@ static bool sme_access_check(DisasContext *s)
     return true;
 }
 
+/* This function corresponds to CheckSMEEnabled. */
+bool sme_enabled_check(DisasContext *s)
+{
+    /*
+     * Note that unlike sve_excp_el, we have not constrained sme_excp_el
+     * to be zero when fp_excp_el has priority.  This is because we need
+     * sme_excp_el by itself for cpregs access checks.
+     */
+    if (!s->fp_excp_el || s->sme_excp_el < s->fp_excp_el) {
+        s->fp_access_checked = true;
+        return sme_access_check(s);
+    }
+    return fp_access_check_only(s);
+}
+
+/* Common subroutine for CheckSMEAnd*Enabled. */
+bool sme_enabled_check_with_svcr(DisasContext *s, unsigned req)
+{
+    if (!sme_enabled_check(s)) {
+        return false;
+    }
+    if (FIELD_EX64(req, SVCR, SM) && !s->pstate_sm) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_NotStreaming, false));
+        return false;
+    }
+    if (FIELD_EX64(req, SVCR, ZA) && !s->pstate_za) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_InactiveZA, false));
+        return false;
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
-- 
2.34.1



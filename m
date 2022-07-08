Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F2156BCF1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:34:03 +0200 (CEST)
Received: from localhost ([::1]:37948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9pzW-0002rj-RN
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pid-0002b8-1o
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:36 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:38884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pia-0002J7-Qd
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:34 -0400
Received: by mail-pf1-x435.google.com with SMTP id o12so10217842pfp.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PhJtFSrquOFUVO5QY9Q5zh4pNEWnYjCw2RgtobhuW2s=;
 b=lWMF37XJ1jJ0MLY6VWKtYw/pp9ZqCPFDYoUDGnTqI6tvWpYlox6HKjlbtbjvpK0d+C
 rWWjUSmZrEEICbn/tVKAxOBnfU+ws2kR1YK2qf+hPqFCaB0+I6Fg+Pu5enn4HDoY2Vfn
 9YFcS2FTz5lTyTYZDb+QsB1YqGfIDiHpDSN74bJoeKqk1pb1bnCgJxlNBtRvrz/WQ50e
 Rjco1rdq8GO8YZ9pZWBLny5j77IV0OjXG9ua/lQloW1YOtZzqM45PCQrGOSWnsv4e53R
 IRMNASxmT6a5TR1hNBLZZSu3lAea+0K5UkOTisqiUpABrKAfCHITMprcJMy4ZA1399HQ
 r77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PhJtFSrquOFUVO5QY9Q5zh4pNEWnYjCw2RgtobhuW2s=;
 b=lQWbh8NJ7VxwUCHkDejljFizWrHCZ4vVfxRVH7KILiRnnzHIQXfCWLhyI+Lk3iQSFf
 Q4NYoQpVBqDKkTrJDNGtqaMpcNW7NPzgSzx2rX1zB0/xS8OyFlCSkGOh/upuCq9XYYH4
 ss9FYbCRpzaSK74KrBqYKXqDYdGJshrZNdd74o54eIP1WdShQQaeNNlBisImi5/z7zek
 +SJQgzeb0SHCuDwMBXJuf1qHtF6+7XCLT5LNcTpPZluYhgpmqNqda/Y8Eqbl5qOIwU6n
 Ird2p1VeYNnroDSDNtgVGJQvXAIuR+tT2UlSdB/I08GVtvWJWUatg7Zwjkejm9IeHJoX
 tjow==
X-Gm-Message-State: AJIora/6oQgzxkz/d3neDr7IpgvAwhNaYy4u4bNpdzQyaCh98FVSrS9s
 f9N+NYdVY84QUZFJit0zAXDixVoOl54kFrHp
X-Google-Smtp-Source: AGRyM1vpNq5G6cl1W2tlRC6yiRM2vuQC5TOlD/nmNttKUGJkTUGoAV9nOzgcpNemD+vxekWjiO7OUw==
X-Received: by 2002:a63:6703:0:b0:413:1f40:6cb5 with SMTP id
 b3-20020a636703000000b004131f406cb5mr3771235pgc.614.1657293391467; 
 Fri, 08 Jul 2022 08:16:31 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 15/45] target/arm: Add SME enablement checks
Date: Fri,  8 Jul 2022 20:45:10 +0530
Message-Id: <20220708151540.18136-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



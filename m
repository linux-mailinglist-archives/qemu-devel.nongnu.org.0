Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7584055BE31
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:32:45 +0200 (CEST)
Received: from localhost ([::1]:42054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o62u4-0008P2-Hw
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jf-0001qy-7a
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:59 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:55177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jd-0003gw-8r
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:58 -0400
Received: by mail-pj1-x1034.google.com with SMTP id cv13so11357044pjb.4
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mlCVT85toSdHrRWejOQM9lSkLy9gos1+nWc5fKuZS4Q=;
 b=IjfE0EVFsi9fLS+mbQEHGlgDaeeVkQ1lmYOyth1YVao78E2w/Bi2fMPB2SiDXBjJpY
 pbkhn3dzCF/UziS6lsE5w8DA+xDrOOljAc/ctweGPPvam2elAuwh2yNSQ7uYQt3zm/kE
 no/PRIoF5Qfj+Ovm0r3LwndaK5DnOcdwDq5OJymRFzOYPLj8dCIw3PCgtz2kU31YkkKF
 VLMp5h0ULkEWNnXb2IG4uLhLmthQrrVCiqB+dFfKFwqIM7xTr/S/LWkZa7eOhJwSd5kG
 5i+c05HNUGIb9cUNbqTNcTaxNkQ+UZYFKPvbD6TQQB3HPVlR8IGVhccAUX18gqpYxWSB
 7Xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mlCVT85toSdHrRWejOQM9lSkLy9gos1+nWc5fKuZS4Q=;
 b=ZvKNLXNGp3QlmchBjWOpiptuY3cyqe7JKVI19z9WJmbzgZPLYuNOFyTqD/oj1JGQVt
 ienLWrw3WvvrBjGdfqxDszhhg2cn18vqLriA64m+KGxo/+xE2DCV3rl+zmz8zG+YcnEe
 yGzg/+6LuulVo6UYBO48gdu+nfUHDQDhodW3+bSl+y+9U3a6rD/rKg+hB2I79+HVoqmy
 BtpltlEL2wx3tLrN2HcX49M42klztLlUEZ1fweGZVVgf56qV4JfJakdfyFkJKclIQGUQ
 sh8j4A1JHp0IvvXhUi42ZZooDOyHbHYMsTT0Chud0mOlCpDPzpua+Lmpph/ZuimXHhJS
 dZGw==
X-Gm-Message-State: AJIora8bEtzjdj9E+RSjYua1oQIZvH0HNuuV/GgajjAYky8ACpB0/D8k
 r9KN8BcPScZH6CYgSRkxgWbqnCkYJIgKQg==
X-Google-Smtp-Source: AGRyM1uti2E0io5KSRNjIqz3cAErB7hlqK+KbXG9SdlyDh7AIgQc+nDpaeQTzPslPzhI6ssm8bGGxQ==
X-Received: by 2002:a17:90b:1d0c:b0:1ed:54c3:dcaf with SMTP id
 on12-20020a17090b1d0c00b001ed54c3dcafmr14088801pjb.217.1656390116436; 
 Mon, 27 Jun 2022 21:21:56 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 15/45] target/arm: Add SME enablement checks
Date: Tue, 28 Jun 2022 09:50:47 +0530
Message-Id: <20220628042117.368549-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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



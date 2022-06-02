Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4E953C0E2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:43:18 +0200 (CEST)
Received: from localhost ([::1]:60492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtXA-0000LB-5o
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskD-0001Un-2H
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:41 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsk8-0000sL-MT
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:40 -0400
Received: by mail-pl1-x62c.google.com with SMTP id q18so5509233pln.12
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s3jNY3UkHfmIkcwzioHwZsMLqfT+fqIVUcaYJ3PqXa4=;
 b=Ug29dcRh+NQvOHPfisITUC11YFeXMnhVV2YnflbwhY/tkYv8AHsuEnU85lT6TMttem
 uuUOqU0feSicrJH1WUjwsTAWQIo7GXmpvISY2PgYZcIb7Lx/gAmdYFsuFdqyM7SufJyQ
 hdPD4gFApphD46l/snmrA6XEvHCmnb4DgFLD3cjx9VXvD0Wp6QvncN3AJhWluEO197S+
 wvginT5YFdOv2o+FED4VMjtqKYxRVPZZJCyantLiUxN/BqSezHxJFL5AnzGAMh9Pgyb6
 TjabZz3+XnmrzBu/qcY/1ENlLVKG2Yn939PFrG+vRXx/t3wrd2RcHnIEE8f3OESYkcCY
 A+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s3jNY3UkHfmIkcwzioHwZsMLqfT+fqIVUcaYJ3PqXa4=;
 b=4SHRCUyeCTE7LamvAxz3x9F/CYM1QCtrYOZX/SiYfzHn1duL0qBa/Tld5VNm7lAIcY
 KTg3VJTWIjkvGqMJ+IC9t6yMSKvZ0XZysO3Jb+lSDzXeJoXb1tq6toWVofFqgLlNiJut
 Vl70m7TCyJJz/eLp6C0gHEtdGy8PZy6JDdmWnlH7XAghaaj0sbjlvo4c9M2nU3Vvfxx1
 W/YQyzfVHGZ7j6J/gN7CAu3iYl+qk0bacUuzcLy+w1kTd4QEe8LGI2DxRRWu2vM7f45X
 nvHcinNmHQd8Wix1Jxkbcqo9OXGrQKxF/K8jjpsd3hG0at1gSm38+8pXMyy2bno7pgn1
 xSUQ==
X-Gm-Message-State: AOAM533y8E2JjaF8NtEcJkqZyTYPfShZRMCs6RWLblfJc4tS4tma/k59
 Xpo1zWFgkqOJT2dfMhl9JDObFBwojuBoyA==
X-Google-Smtp-Source: ABdhPJyOXYj7sIeCmZ7KqhyFkMzalvmywISHy7PrmAcL1Mx+zgZqFw/+NGQCk73YuVp6nZFuoyh2qA==
X-Received: by 2002:a17:90b:1642:b0:1e0:96b:c3f2 with SMTP id
 il2-20020a17090b164200b001e0096bc3f2mr7543108pjb.228.1654206753432; 
 Thu, 02 Jun 2022 14:52:33 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 44/71] target/arm: Implement SME ZERO
Date: Thu,  2 Jun 2022 14:48:26 -0700
Message-Id: <20220602214853.496211-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/translate-a64.h |  1 +
 target/arm/sme.decode      |  4 ++++
 target/arm/sme_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-a64.c | 15 +++++++++++++++
 target/arm/translate-sme.c | 13 +++++++++++++
 6 files changed, 60 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 3bd48c235f..c4ee1f09e4 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -19,3 +19,5 @@
 
 DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
+
+DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 6bd1b2eb4b..ec5d580ba0 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -30,6 +30,7 @@ bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
 bool sve_access_check(DisasContext *s);
 bool sme_enabled_check(DisasContext *s);
+bool sme_za_enabled_check(DisasContext *s);
 TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index c25c031a71..6e4483fdce 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -18,3 +18,7 @@
 #
 # This file is processed by scripts/decodetree.py
 #
+
+### SME Misc
+
+ZERO            11000000 00 001 00000000000 imm:8
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index c34d1b2e6b..4172b788f9 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -58,3 +58,28 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
         memset(env->zarray, 0, sizeof(env->zarray));
     }
 }
+
+void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
+{
+    uint32_t i;
+
+    /*
+     * Special case clearing the entire ZA space.
+     * This falls into the CONSTRAINED UNPREDICTABLE zeroing of any
+     * parts of the ZA storage outside of SVL.
+     */
+    if (imm == 0xff) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+        return;
+    }
+
+    /*
+     * Recall that ZAnH.D[m] is spread across ZA[n+8*m].
+     * Unless SVL == ARM_MAX_VQ, each row is discontiguous.
+     */
+    for (i = 0; i < svl; i++) {
+        if (imm & (1 << (i % 8))) {
+            memset(&env->zarray[i], 0, svl);
+        }
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 222f93d42d..660c5dbf5b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1231,6 +1231,21 @@ bool sme_enabled_check(DisasContext *s)
     return fp_access_check_only(s);
 }
 
+/* Note that this function corresponds to CheckSMEAndZAEnabled. */
+bool sme_za_enabled_check(DisasContext *s)
+{
+    if (!sme_enabled_check(s)) {
+        return false;
+    }
+    if (!s->pstate_za) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_InactiveZA, false),
+                           default_exception_el(s));
+        return false;
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 786c93fb2d..d526c74456 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -33,3 +33,16 @@
  */
 
 #include "decode-sme.c.inc"
+
+
+static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_za_enabled_check(s)) {
+        gen_helper_sme_zero(cpu_env, tcg_constant_i32(a->imm),
+                            tcg_constant_i32(s->svl));
+    }
+    return true;
+}
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5386B541959
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:22:06 +0200 (CEST)
Received: from localhost ([::1]:58594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygeL-0004cQ-DV
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwb-0006O2-Vp
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:36:54 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwX-0008E0-SL
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:36:53 -0400
Received: by mail-pj1-x1031.google.com with SMTP id j7so16657334pjn.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wPGkoMeCdhx99y01psdS4/penQAneUPj/+BZk+ezxUo=;
 b=MBCABkNBS4UKmJbfBgclu2IurQIf5vGeWY84AAlUMzfS+YB0isS2FI+IO59pbSyh8c
 sfWhpdTK1IlJnqOx9d72JI4XfZwymEnztH+YQbHTdV3R7oHq9D/6wPx3N/vMnRJp64pE
 /UnWzzgDd3NQYIJirrMCrLM4ASNJ5B0KLiTvwjYeSe5Gm3B7DdNltN8zbdCs9PBn1CfR
 +3CiMbOnbcS35exXIKRf53lY/iOi+vm7xMDYwYGCddVZxLBKb6UZAWERsi4B/zBWfTCU
 yL+uIwk8Zte6uOGTpxO48ATWcJdqEJv9a63TusAPd4XlyQhk7/HHBUNObdS/MZUtN+EP
 05qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wPGkoMeCdhx99y01psdS4/penQAneUPj/+BZk+ezxUo=;
 b=Q89qzqFlKo/7L6nhNYbLBZV50v9QiMCYbGP73BLCo2Em6GzMs1xKFXC28CqZ4uF0KT
 aEBy5at0dScbQcGFOpIBgqoH3PQ40a3IjLT3xj3ZFkPNrFMSlspLpc2V7Ua/U6U/iyeR
 Pb54zsWem1e2Z9U83O/eTjoSRAYE5zfkfB+by1U39Vo1vhNarRxz3KR1ZtmLVjk8v+ig
 8Q2rjK2np5M3oVgtkmfa3ZqvrluRXRMOfbS5fOMP8/2M35Y0tC2MzpcWx4PENuOb3VAO
 riWKriJaxzwVzOsZJeBWAnElJ7CpaGXD+AUPGjmi6g+bBmT/OncmQ6j2AfcMHfZKpcXL
 iPWQ==
X-Gm-Message-State: AOAM533T2L+CzhyT20qOF2d+yv15hW8+YezrsCzaSolp3+89Mj7HBsgZ
 0k8Q+gEKVr5VTR6MrWwijElTIzGuQhI/2w==
X-Google-Smtp-Source: ABdhPJx7KTiWxUPl+C2z15537MVRjJHZyfHfUzqs8W/i1dk+m0QbeAw/qOeTN9EEhyc1Aq04uKK0ZQ==
X-Received: by 2002:a17:902:d102:b0:167:4f35:9580 with SMTP id
 w2-20020a170902d10200b001674f359580mr21741088plw.38.1654634208500; 
 Tue, 07 Jun 2022 13:36:48 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:36:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 44/71] target/arm: Implement SME ZERO
Date: Tue,  7 Jun 2022 13:32:39 -0700
Message-Id: <20220607203306.657998-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/translate-a64.h |  1 +
 target/arm/sme_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-a64.c | 15 +++++++++++++++
 target/arm/translate-sme.c | 13 +++++++++++++
 target/arm/sme.decode      |  4 ++++
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
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index b215725594..e5b5723a15 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -59,3 +59,28 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
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
-- 
2.34.1



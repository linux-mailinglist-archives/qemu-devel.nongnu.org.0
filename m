Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064AC5417C0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:06:29 +0200 (CEST)
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygPE-0001Ve-3v
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftg-0000TN-2j
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:52 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftY-0007UU-Rn
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:51 -0400
Received: by mail-pl1-x62f.google.com with SMTP id f9so5339584plg.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/BExpvNtfeOaLygKWpS4gykSxDaWFRszDLVZHG0ddOs=;
 b=rJGZ3JN4OKBU1KQw89iQN+g+iPge1iOVfJsVnWT21IFxVLebZ/EGUO/fOD6Q1Snl1v
 d1LqkT9atDKjvLT65sQQB7qObN1hGyFKGvzA69t6DOCemPan1SkgQQxdnWs9AF30NFUu
 QF0vU0W06M3z2nuyu0dWzqzwMS3y4ruTV+fYbtB1tbhvDLEYr3cKVpaVOfJs15Re1ISW
 WhC53+BKUvgbD6+biN91cI0odEHYH510pB4s5GDdzrA4vhMD7xx2BhwT+pdEbBc/HYS+
 iOgyqZt0btkbXwNHfcZVBvzFxwbn3bFPfQzAE7/jd63A51JD++2rH2jSoJ7SNRVOEfU1
 mFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/BExpvNtfeOaLygKWpS4gykSxDaWFRszDLVZHG0ddOs=;
 b=AhL/613ZUy2PoclmeI1q6a8tuG6w7uaV+OOdn7jQqrtEu2cVw3+wg5ic5jXhowAlu2
 Jv6cuBPnQ4YjHh6l5VxJRmVekKMOJwmxt+mZn91GrOmfmQWt9jqZiUz9vaBWD+01k+KS
 jwo+iYUZSElrWuMMSLs7XiUz1EhFzjeIQQLGik45rwMnk6yxs7rHZG/IGbqsC9xBEMQ6
 D6SMZro4nJ1kntInTeI42HWfwj0srGcDdeai3sJ7djQM7DjK2nrIujTm0nJg/Ykovw9R
 0g4FnHZv2W1/yp9Zdz8P0giUy+6jug5TvZGTCJoq2IE2kDVkdpk5ByaUu7MdFAO5J1J0
 uVjg==
X-Gm-Message-State: AOAM533YbrwvYzcw5IsWWLWr0FrKzifjkUnZH3381gSGeTflJyV+vrPA
 TZYdk2E0fSQ8BJ+xYeajI0NMA2Ytpw3eAw==
X-Google-Smtp-Source: ABdhPJzKQACKGA3zPxfMzfjEMNmp1PMQh/aNXH2PcoP2g3MipoPuOQBuFf6mx5bY7JNh+GENsFpsjA==
X-Received: by 2002:a17:90a:df16:b0:1e3:1cd:6c6f with SMTP id
 gp22-20020a17090adf1600b001e301cd6c6fmr50299220pjb.10.1654634023471; 
 Tue, 07 Jun 2022 13:33:43 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 39/71] target/arm: Add SVL to TB flags
Date: Tue,  7 Jun 2022 13:32:34 -0700
Message-Id: <20220607203306.657998-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
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

We need SVL separate from VL for RDSVL at al, as well as
ZA storage loads and stores, which do not require PSTATE.SM.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 12 ++++++++++++
 target/arm/translate.h     |  1 +
 target/arm/helper.c        |  8 +++++++-
 target/arm/translate-a64.c |  1 +
 4 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d7d364abbb..23d46c7d7d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3292,6 +3292,7 @@ FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
 FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
 FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
 FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
+FIELD(TBFLAG_A64, SVL, 24, 4)
 
 /*
  * Helpers for using the above.
@@ -3337,6 +3338,17 @@ static inline int sve_vq(CPUARMState *env)
     return EX_TBFLAG_A64(env->hflags, VL) + 1;
 }
 
+/**
+ * sme_vq
+ * @env: the cpu context
+ *
+ * Return the SVL cached within env->hflags, in units of quadwords.
+ */
+static inline int sme_vq(CPUARMState *env)
+{
+    return EX_TBFLAG_A64(env->hflags, SVL) + 1;
+}
+
 static inline bool bswap_code(bool sctlr_b)
 {
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/translate.h b/target/arm/translate.h
index fbd6713572..1330281f8b 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -44,6 +44,7 @@ typedef struct DisasContext {
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
     int sme_excp_el; /* SME exception EL or 0 if enabled */
     int vl;          /* current vector length in bytes */
+    int svl;         /* current streaming vector length in bytes */
     /* Flag indicating that exceptions from secure mode are routed to EL3. */
     bool secure_routed_to_el3;
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b1ca819597..2b38e82c22 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13874,7 +13874,13 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
     }
     if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
-        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_exception_el(env, el));
+        int sme_el = sme_exception_el(env, el);
+
+        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_el);
+        if (sme_el == 0) {
+            /* Similarly, do not compute SVL if SME is disabled. */
+            DP_TBFLAG_A64(flags, SVL, sve_vqm1_for_el_sm(env, el, true));
+        }
         if (FIELD_EX64(env->svcr, SVCR, SM)) {
             DP_TBFLAG_A64(flags, PSTATE_SM, 1);
         }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 40f2e53983..b1d2840819 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14652,6 +14652,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sme_excp_el = EX_TBFLAG_A64(tb_flags, SMEEXC_EL);
     dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
+    dc->svl = (EX_TBFLAG_A64(tb_flags, SVL) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
     dc->btype = EX_TBFLAG_A64(tb_flags, BTYPE);
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44453C0AA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:14:42 +0200 (CEST)
Received: from localhost ([::1]:44174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwt5V-0001Eq-HY
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgv-0004oL-DC
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:17 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgs-0008VG-Bw
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:17 -0400
Received: by mail-pf1-x42e.google.com with SMTP id p8so5795319pfh.8
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6xMWEOVCvEJI1KC6zgVAv9+GA3g0PTUVPfSZbthulxo=;
 b=YTtmezVtqWJQ2Djjac7C5I6VjZ0ID+vIeMTDTZtn9Dcwo4m0VA84XvFvHPvXHxGXKb
 jq0v0gsprUokXueTdTA/+V7uXF1tzIwca43UuW0/lPcZaqTzHGKfTkJIP27qRTu+GSAp
 a66D0mUNTGsmPYoTqYyBIANyCPtcjySDpZ3dRPmF6jGRyi/m7zfISyor/OxUY40gvvmn
 GHAo+fbMVOJLfgZTlh6TPit9urdk5vx9Pc0/nsAST52STLnQl4Z9712vgk5d21adxUNI
 1q1Wa9TIk1zuA3uI+knygzfbiz0A2WuIo+DlznKk+T6dqsrtyJGw5Y8a4989Y2gIFoGP
 9d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6xMWEOVCvEJI1KC6zgVAv9+GA3g0PTUVPfSZbthulxo=;
 b=AWvwaDXrqjzztdfeEUYENItBtwHySUQ06wi4SGQTe+m86Q4XOoFZ1tIQbBqENPKLEr
 qR4ie+RQjTlbmSqqm44ZCE8CT/xq81yvX2J7aYinxmxcfFu162ecpAgvz+BqL/K35bg2
 iLFbuDhHWbIqc+5reMm1qrK1JfbeoTBbV3O1FPtIfIzjULxKHMHljWkQOmcBko4xBfEb
 V7h2ZO4THvlBaj+OfT827vzCRo8+eQrHdt98CHJ+iR/FS2O66Y8chrY5jXjSscjJ+/cX
 Her6GXl+FgDMZI9S2WoipirjSK2riai8tkF4p8KlP0TYEtCNHW+pD+PbDp6Sgsb+ZN/H
 GXfA==
X-Gm-Message-State: AOAM531ujur9JSmm3yAlBtTr64ndMdaPnRzs54h4trR9Sfz9uIKbZNkp
 sqQYoUS+Q/He9ewTUya0hE1GXI2UVxa5hQ==
X-Google-Smtp-Source: ABdhPJzOthaaoFeUXbDQiAbAEyIbVclyURqGtx5hMxY2HPnCnRbSkFdeFQKWti/E9LbIKCLcASDlSQ==
X-Received: by 2002:a63:f407:0:b0:3fa:91cf:270 with SMTP id
 g7-20020a63f407000000b003fa91cf0270mr6085708pgi.428.1654206553484; 
 Thu, 02 Jun 2022 14:49:13 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 22/71] target/arm: Add SMEEXC_EL to TB flags
Date: Thu,  2 Jun 2022 14:48:04 -0700
Message-Id: <20220602214853.496211-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

This is CheckSMEAccess, which is the basis for a set of
related tests for various SME cpregs and instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  2 ++
 target/arm/translate.h     |  1 +
 target/arm/helper.c        | 52 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  1 +
 4 files changed, 56 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 245d144fa1..31f812eda7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1134,6 +1134,7 @@ void aarch64_sync_64_to_32(CPUARMState *env);
 
 int fp_exception_el(CPUARMState *env, int cur_el);
 int sve_exception_el(CPUARMState *env, int cur_el);
+int sme_exception_el(CPUARMState *env, int cur_el);
 
 /**
  * sve_vqm1_for_el:
@@ -3272,6 +3273,7 @@ FIELD(TBFLAG_A64, ATA, 15, 1)
 FIELD(TBFLAG_A64, TCMA, 16, 2)
 FIELD(TBFLAG_A64, MTE_ACTIVE, 18, 1)
 FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
+FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
 
 /*
  * Helpers for using the above.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index f473a21ed4..a492e4217b 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -42,6 +42,7 @@ typedef struct DisasContext {
     bool ns;        /* Use non-secure CPREG bank on access */
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
+    int sme_excp_el; /* SME exception EL or 0 if enabled */
     int vl;          /* current vector length in bytes */
     /* Flag indicating that exceptions from secure mode are routed to EL3. */
     bool secure_routed_to_el3;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 204c5cf849..98de2c797f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6222,6 +6222,55 @@ int sve_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
+/*
+ * Return the exception level to which exceptions should be taken for SME.
+ * C.f. the ARM pseudocode function CheckSMEAccess.
+ */
+int sme_exception_el(CPUARMState *env, int el)
+{
+#ifndef CONFIG_USER_ONLY
+    if (el <= 1 && !el_is_in_host(env, el)) {
+        switch (FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, SMEN)) {
+        case 1:
+            if (el != 0) {
+                break;
+            }
+            /* fall through */
+        case 0:
+        case 2:
+            return 1;
+        }
+    }
+
+    if (el <= 2 && arm_is_el2_enabled(env)) {
+        /* CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE). */
+        if (env->cp15.hcr_el2 & HCR_E2H) {
+            switch (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, SMEN)) {
+            case 1:
+                if (el != 0 || !(env->cp15.hcr_el2 & HCR_TGE)) {
+                    break;
+                }
+                /* fall through */
+            case 0:
+            case 2:
+                return 2;
+            }
+        } else {
+            if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TSM)) {
+                return 2;
+            }
+        }
+    }
+
+    /* CPTR_EL3.  Since EZ is negative we must check for EL3.  */
+    if (arm_feature(env, ARM_FEATURE_EL3)
+        && !FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, ESM)) {
+        return 3;
+    }
+#endif
+    return 0;
+}
+
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
@@ -13719,6 +13768,9 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
     }
+    if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_exception_el(env, el));
+    }
 
     sctlr = regime_sctlr(env, stage1);
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d438fb89e7..8bbd1b7f07 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14608,6 +14608,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
+    dc->sme_excp_el = EX_TBFLAG_A64(tb_flags, SMEEXC_EL);
     dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
-- 
2.34.1



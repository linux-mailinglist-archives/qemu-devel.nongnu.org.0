Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E4F55235A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:58:32 +0200 (CEST)
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LfT-000636-F6
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZp-0005Qm-TL
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:41 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZo-0001Kh-2c
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:41 -0400
Received: by mail-pl1-x632.google.com with SMTP id r1so10369537plo.10
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yVT+UI50/PYOEmnVNQqi/8aoRVsoMhwcwBhlW25btKs=;
 b=Nw8WejnXy0kW2BWW9mzeVaRzJA8vWFuta9G/w2YL7ihnQvbb52ddbIvXCimFBtxuJZ
 c2thyj1c1dnBYSt4wfB50+pX/BFYSO+QrAdaPGLPdiZQF/vp0Bq+Bm5/Jh+d1E9IO/vm
 dyBl9UkWDhBWY6os7dVYrPSfqAUBJu7nqKVrJi6czSnSv1DKt5AEs3JrzAYgrpw8aNtW
 CRq2IQAS8+jH9pUygUnE7/laOiI3q4MdaYj9Mx9hjIYP+XD75AlwO8ef2c+M5ux4nEt8
 mqm+8AZSGrBcDn0ufcO89k01YkAPfea3xItjrim0Lm3ijR0/0MtoU4tYBQZxhP6mITqm
 CKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yVT+UI50/PYOEmnVNQqi/8aoRVsoMhwcwBhlW25btKs=;
 b=b3XT4nLD6qPgLvRejhr4v3SjQNrX166O84qgFVjbKPJhvbcpwsSmJ5OFKamcvITPPi
 94Ly6LOKd/KJDgGv7/14ZhH3J888Evz/oM8mq4QCHn4gBbqIz+gEuo4YpyyJcy7Ik+Ui
 Cn5FU8iWR6L8EFIyThiuDwN0YxYPOENl6mQ2zuKevfWSXn+ErEHISrmXCdB42LWbq015
 4iDi1a+rO5Bfkqrjcglic/gTySOcW2BiSi1FgKTPuj6JWMX88AdOoFjjz8u1DDS3cvUr
 amCyrcpyXMj3KjWEdHM/uMw7LncXixfW7j6RCeQ5Gkwiazngw7Ntr2pdkrR9PUBxw7SV
 biaQ==
X-Gm-Message-State: AJIora8Os/jJ95w4gCxbO6JSRJn9lfgN2N59eM7dz2jOHhpLXjzguhAu
 TuF6xzUDC+oSJ2a/oQs5lbJgwJzF8/dSbQ==
X-Google-Smtp-Source: AGRyM1sH7WVpBnJm0BAcqteEZ3/Pg3+hXgas7PTuNqu3UWjTAiJNQLGveMtlm1JOUeNVOWsPH4AKPg==
X-Received: by 2002:a17:903:48b:b0:16a:555:414a with SMTP id
 jj11-20020a170903048b00b0016a0555414amr18447303plb.67.1655747558728; 
 Mon, 20 Jun 2022 10:52:38 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 02/51] target/arm: Add SMEEXC_EL to TB flags
Date: Mon, 20 Jun 2022 10:51:46 -0700
Message-Id: <20220620175235.60881-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

This is CheckSMEAccess, which is the basis for a set of
related tests for various SME cpregs and instructions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  2 ++
 target/arm/translate.h     |  1 +
 target/arm/helper.c        | 52 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  1 +
 4 files changed, 56 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 05d1e2e8dd..e99de18097 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1134,6 +1134,7 @@ void aarch64_sync_64_to_32(CPUARMState *env);
 
 int fp_exception_el(CPUARMState *env, int cur_el);
 int sve_exception_el(CPUARMState *env, int cur_el);
+int sme_exception_el(CPUARMState *env, int cur_el);
 
 /**
  * sve_vqm1_for_el:
@@ -3148,6 +3149,7 @@ FIELD(TBFLAG_A64, ATA, 15, 1)
 FIELD(TBFLAG_A64, TCMA, 16, 2)
 FIELD(TBFLAG_A64, MTE_ACTIVE, 18, 1)
 FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
+FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
 
 /*
  * Helpers for using the above.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 88dc18a034..c88c953325 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -42,6 +42,7 @@ typedef struct DisasContext {
     bool ns;        /* Use non-secure CPREG bank on access */
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
+    int sme_excp_el; /* SME exception EL or 0 if enabled */
     int vl;          /* current vector length in bytes */
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
     int vec_len;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d21ba7ab83..2c080c6cac 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6218,6 +6218,55 @@ int sve_exception_el(CPUARMState *env, int el)
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
+    /* CPTR_EL3.  Since ESM is negative we must check for EL3.  */
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
@@ -11197,6 +11246,9 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
     }
+    if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_exception_el(env, el));
+    }
 
     sctlr = regime_sctlr(env, stage1);
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4c64546090..9a285dd177 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14603,6 +14603,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
+    dc->sme_excp_el = EX_TBFLAG_A64(tb_flags, SMEEXC_EL);
     dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
-- 
2.34.1



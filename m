Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54BA39BC81
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:03:52 +0200 (CEST)
Received: from localhost ([::1]:46440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCIZ-0006w0-SR
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8f-0003D3-Sh
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:37 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8c-00009K-Vp
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:37 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 t16-20020a05600c1990b02901a0d45ff03aso4661238wmq.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kkP+MYbBmAzVDrfIZPpeRjBWZ6tsRXqrVrjsv5uYDeI=;
 b=iJNOkhUHHnJyguCif0Hbohyg8LrW1hxcTTqcCOYVAIh2SPCQ81ypnOkda20WuHQR1g
 Jwxh1g28Rju1oeE14+KBJM75CsPXJps+C+NWsvbQUlMj/MwWV+AnoJAAGOqRacFpVceG
 1sYynQ4pqis/e+ruhvMDNGvGAtV13jDWPNo0WyWGQDk2QE04J6/BOW7jIHxAuGVF8/l2
 OiNPCPYRRb7lzv31CA4GZbdH6DEvG9+0p2hbFd2g1lpdajOnZeAindapNLdi8+519EJW
 yTX3N3JtHBga90IjEHm41VKtGvO0w7XM/0Cbm2EUINX4bFEHJFlEl/acwbsQ0K75wW9K
 dC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kkP+MYbBmAzVDrfIZPpeRjBWZ6tsRXqrVrjsv5uYDeI=;
 b=q73l3Ux+Bkzxi9J1xgtN0yV0d0CMNBugX+ModgzmY9ADMTKjQJUKUtcg5Ig+UFlwxs
 unK+7bCAlic4MFR2Bs50EbVUCWkAJkeEZYUQx9x5TJ+K5YR2U3yz0/G1f3cXzIhBJ+lt
 z9+Y1HrP8Ex5/K4/b6Hv7hYkSvMQTau3q5TF+ozKvtp9tbWcfhK1fGD6X0jSkmngAtnF
 XiKb0ZlUcTrr7kPHkCOtY+OcHF0EtHQ4nH6tymA9fRZJGZxuGMYcRZ0iFx6D78x1zLGH
 necDl0RIW/KimFzXb3SkTdc9AH8Qj8CENE11JAfbSfC/E2ZVWxvZE7T3mw0aS81mK7kq
 dChA==
X-Gm-Message-State: AOAM530ByqM1FBjRJ8t1u/DnI5cMD2RVseIACXSnMZWVPXDSutZrDz62
 YQWmFPX7/0dvTymbDSP772BEWnfStjOW+Q==
X-Google-Smtp-Source: ABdhPJzrkVhvMvpuxMYki5YjoAI1fgbQOON/JX/4S5EsJp5bNZLSgMwpjpCmi3Khvd9+I4RaqmQdDA==
X-Received: by 2002:a1c:98d0:: with SMTP id a199mr4387062wme.22.1622822013426; 
 Fri, 04 Jun 2021 08:53:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o6sm8006091wre.73.2021.06.04.08.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7163C20007;
 Fri,  4 Jun 2021 16:53:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 87/99] target/arm: move arm_cpu_finalize_features into
 cpu64
Date: Fri,  4 Jun 2021 16:53:00 +0100
Message-Id: <20210604155312.15902-88-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

all the features in arm_cpu_finalize_features are actually
TARGET_AARCH64-only now, since KVM is now only supported on 64bit.

Therefore move the function to cpu64.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c     | 36 ++----------------------------------
 target/arm/cpu64.c   | 34 ++++++++++++++++++++++++++++++++++
 target/arm/monitor.c |  4 ++++
 3 files changed, 40 insertions(+), 34 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8709c11784..0adbf36347 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -820,40 +820,6 @@ static void arm_cpu_finalizefn(Object *obj)
 #endif
 }
 
-void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
-{
-    Error *local_err = NULL;
-
-#ifdef TARGET_AARCH64
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        if (!cpu_sve_finalize_features(cpu, &local_err)) {
-            error_propagate(errp, local_err);
-            return;
-        }
-
-        /*
-         * KVM does not support modifications to this feature.
-         * We have not registered the cpu properties when KVM
-         * is in use, so the user will not be able to set them.
-         */
-        if (tcg_enabled()) {
-            if (!cpu_pauth_finalize(cpu, &local_err)) {
-                error_propagate(errp, local_err);
-                return;
-            }
-        }
-    }
-#endif /* TARGET_AARCH64 */
-
-    if (kvm_enabled()) {
-        kvm_arm_steal_time_finalize(cpu, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
-            return;
-        }
-    }
-}
-
 static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -876,6 +842,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+#ifdef TARGET_AARCH64
     arm_cpu_finalize_features(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -892,6 +859,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                    "AArch64 CPUs must have both VFP and Neon or neither");
         return;
     }
+#endif /* TARGET_AARCH64 */
 
     if (!cpu->has_vfp) {
         uint64_t t;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index fefb6954fc..c762f3f07a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -469,6 +469,40 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
     return g_strdup("aarch64");
 }
 
+void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
+{
+    Error *local_err = NULL;
+
+#ifdef TARGET_AARCH64
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        if (!cpu_sve_finalize_features(cpu, &local_err)) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        /*
+         * KVM does not support modifications to this feature.
+         * We have not registered the cpu properties when KVM
+         * is in use, so the user will not be able to set them.
+         */
+        if (tcg_enabled()) {
+            if (!cpu_pauth_finalize(cpu, &local_err)) {
+                error_propagate(errp, local_err);
+                return;
+            }
+        }
+    }
+#endif /* TARGET_AARCH64 */
+
+    if (kvm_enabled()) {
+        kvm_arm_steal_time_finalize(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+}
+
 static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 0c72bf7c31..95c1e72cd1 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -184,9 +184,11 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         if (!err) {
             visit_check_struct(visitor, &err);
         }
+#ifdef TARGET_AARCH64
         if (!err) {
             arm_cpu_finalize_features(ARM_CPU(obj), &err);
         }
+#endif /* TARGET_AARCH64 */
         visit_end_struct(visitor, NULL);
         visit_free(visitor);
         if (err) {
@@ -195,7 +197,9 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
             return NULL;
         }
     } else {
+#ifdef TARGET_AARCH64
         arm_cpu_finalize_features(ARM_CPU(obj), &error_abort);
+#endif /* TARGET_AARCH64 */
     }
 
     expansion_info = g_new0(CpuModelExpansionInfo, 1);
-- 
2.20.1



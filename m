Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929D22F2309
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 00:13:45 +0100 (CET)
Received: from localhost ([::1]:49638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz6Nc-0006cT-MB
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 18:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz6LJ-0004f0-E7
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:11:22 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz6LF-0006CP-Ad
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:11:21 -0500
Received: by mail-pl1-x635.google.com with SMTP id r4so319969pls.11
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 15:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U455LnEVSnoXmT1SthMNmvTNVVMjJpc4M0FyXL5sXrI=;
 b=iu0T6y9EmcCQbyAlTyctcEd/3+Aoqz5w6T2srPCSv6s+E5GnBX+J2sMzTuYWpvcjfg
 UOMLsoJpNCRF7WD+ZmFQnfWESdlZmjf+gdSknibrcNvirL8j7V4Ch9RnbIAx1A3mLhOp
 MC/BOJMJsOv44sgnua4073qlezV0VPRvphY+LmddXN+1m3i0ccXuPRcnjs9NZ6jbw6mP
 1/u1UbcpbE4PznyjhEQtdfwvskdOUc2hD6BtQ4QTmEd5I0V04xavd/Shxp0BZyiNH771
 ozaVM6exLpFzjnQ+s2qvBUfxuvdrqY9ZhmVhjYMFtiw8gakerB7t8i8HzgJtpifuAcRZ
 Mn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U455LnEVSnoXmT1SthMNmvTNVVMjJpc4M0FyXL5sXrI=;
 b=sgyjhn44n4+JNth7UU3AwI4pispoFwpUP4lo0eqVTibQXSA9FBPdcL7SURLhx9V41o
 08ZOzi9w8ODJPX3A4el+pOzSLubTLauS1FbY2WxumLw8+os0G2B/mKz3kCgunLdamZlV
 rsprwo1Oe/2Un2XbaDDz4y8UdkJNdwfaUtZY2Y5JeUFYrnAFjt2SK9u6Z3kF9cpITnns
 ONb75RcJzjpAaGbJklHLowaXbR5XUpJE5cwg/DSsyEZbzcY+FZ60bnU1qeZ7BiCRnbOm
 KpkgS5JJMZrJHJ8ajHRNO8VKAzr9Hw8TUEEAUhEuRLWOROsoOuBWAxpxcM/9dSMPELJM
 wxEA==
X-Gm-Message-State: AOAM530192nCNFMnPrPSREboiBZGPZ3irJpewT8RlOPJoYYmuBZtph7E
 I0Q/PcU+zzsigH94y9eeMhfnwwkocIj6rw==
X-Google-Smtp-Source: ABdhPJyIS0almxyUub2B8VZ8TE9B0SK2lqI9ShNb6XWabwcV5iUYYpFY3UBFkZaee1N36Fh+rq/VJg==
X-Received: by 2002:a17:90a:68ca:: with SMTP id
 q10mr1266866pjj.15.1610406675430; 
 Mon, 11 Jan 2021 15:11:15 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id g202sm658105pfb.196.2021.01.11.15.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 15:11:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/3] target/arm: Add cpu properties to control pauth
Date: Mon, 11 Jan 2021 13:11:07 -1000
Message-Id: <20210111231108.461088-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111231108.461088-1-richard.henderson@linaro.org>
References: <20210111231108.461088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: Mark Rutland <mark.rutland@arm.com>, peter.maydell@linaro.org,
 Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The crypto overhead of emulating pauth can be significant for
some workloads.  Add two boolean properties that allows the
feature to be turned off, on with the architected algorithm,
or on with an implementation defined algorithm.

We need two intermediate booleans to control the state while
parsing properties lest we clobber ID_AA64ISAR1 into an invalid
intermediate state.

Tested-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Use boolean properties instead of an enum (drjones).
v3: Add tests (drjones).
v6: Add documentation (pmm).
---
 docs/system/arm/cpu-features.rst | 21 +++++++++++++++++
 target/arm/cpu.h                 | 10 ++++++++
 target/arm/cpu.c                 | 13 +++++++++++
 target/arm/cpu64.c               | 40 ++++++++++++++++++++++++++++----
 target/arm/monitor.c             |  3 ++-
 tests/qtest/arm-cpu-features.c   | 13 +++++++++++
 6 files changed, 95 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 35196a6b75..70e0e4ef78 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -211,6 +211,27 @@ the list of KVM VCPU features and their descriptions.
                            influence the guest scheduler behavior and/or be
                            exposed to the guest userspace.
 
+TCG VCPU Features
+=================
+
+TCG VCPU features are CPU features that are specific to TCG.
+Below is the list of TCG VCPU features and their descriptions.
+
+  pauth                    Enable or disable `FEAT_Pauth`, pointer
+                           authentication.  By default, the feature is
+                           enabled with `-cpu max`.
+
+  pauth-impdef             When `FEAT_Pauth` is enabled, either the
+                           *impdef* (Implementation Definined) algorithm
+                           is enabled or the *architected* QARMA algorithm
+                           is enabled.  By default the impdef algorithm
+                           is disabled, and QARMA is enabled.
+
+                           The architected QARMA algorithm has good
+                           cryptographic properties, but can be quite slow
+                           to emulate.  The impdef algorithm is
+                           non-cryptographic but significantly faster.
+
 SVE CPU Properties
 ==================
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 70e9618d13..06f5169f45 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -197,9 +197,11 @@ typedef struct {
 #ifdef TARGET_AARCH64
 # define ARM_MAX_VQ    16
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
 static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
+static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 typedef struct ARMVectorReg {
@@ -947,6 +949,14 @@ struct ARMCPU {
     uint64_t reset_cbar;
     uint32_t reset_auxcr;
     bool reset_hivecs;
+
+    /*
+     * Intermediate values used during property parsing.
+     * Once finalized, the values should be read from ID_AA64ISAR1.
+     */
+    bool prop_pauth;
+    bool prop_pauth_impdef;
+
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint32_t dcz_blocksize;
     uint64_t rvbar;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8387e94b94..be18df5464 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1320,6 +1320,19 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             error_propagate(errp, local_err);
             return;
         }
+
+        /*
+         * KVM does not support modifications to this feature.
+         * We have not registered the cpu properties when KVM
+         * is in use, so the user will not be able to set them.
+         */
+        if (!kvm_enabled()) {
+            arm_cpu_pauth_finalize(cpu, &local_err);
+            if (local_err != NULL) {
+                error_propagate(errp, local_err);
+                return;
+            }
+        }
     }
 
     if (kvm_enabled()) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 7cf9fc4bc6..d9feaa9cdb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -28,6 +28,8 @@
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
 #include "qapi/visitor.h"
+#include "hw/qdev-properties.h"
+
 
 #ifndef CONFIG_USER_ONLY
 static uint64_t a57_a53_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -572,6 +574,36 @@ void aarch64_add_sve_properties(Object *obj)
     }
 }
 
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
+{
+    int arch_val = 0, impdef_val = 0;
+    uint64_t t;
+
+    /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
+    if (cpu->prop_pauth) {
+        if (cpu->prop_pauth_impdef) {
+            impdef_val = 1;
+        } else {
+            arch_val = 1;
+        }
+    } else if (cpu->prop_pauth_impdef) {
+        error_setg(errp, "cannot enable pauth-impdef without pauth");
+        error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
+    }
+
+    t = cpu->isar.id_aa64isar1;
+    t = FIELD_DP64(t, ID_AA64ISAR1, APA, arch_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, arch_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
+    cpu->isar.id_aa64isar1 = t;
+}
+
+static Property arm_cpu_pauth_property =
+    DEFINE_PROP_BOOL("pauth", ARMCPU, prop_pauth, true);
+static Property arm_cpu_pauth_impdef_property =
+    DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -627,10 +659,6 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
         t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, APA, 1); /* PAuth, architected only */
-        t = FIELD_DP64(t, ID_AA64ISAR1, API, 0);
-        t = FIELD_DP64(t, ID_AA64ISAR1, GPA, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, GPI, 0);
         t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
@@ -720,6 +748,10 @@ static void aarch64_max_initfn(Object *obj)
         cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
         cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
+
+        /* Default to PAUTH on, with the architected algorithm. */
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
     }
 
     aarch64_add_sve_properties(obj);
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 198b14e95e..1fdb965eb8 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -94,7 +94,8 @@ static const char *cpu_model_advertised_features[] = {
     "sve128", "sve256", "sve384", "sve512",
     "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
-    "kvm-no-adjvtime", "kvm-steal-time",
+    "kvm-no-adjvtime",
+    "pauth", "pauth-impdef",
     NULL
 };
 
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index bc681a95d5..8252b85bb8 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -427,6 +427,18 @@ static void sve_tests_sve_off_kvm(const void *data)
     qtest_quit(qts);
 }
 
+static void pauth_tests_default(QTestState *qts, const char *cpu_type)
+{
+    assert_has_feature_enabled(qts, cpu_type, "pauth");
+    assert_has_feature_disabled(qts, cpu_type, "pauth-impdef");
+    assert_set_feature(qts, cpu_type, "pauth", false);
+    assert_set_feature(qts, cpu_type, "pauth", true);
+    assert_set_feature(qts, cpu_type, "pauth-impdef", true);
+    assert_set_feature(qts, cpu_type, "pauth-impdef", false);
+    assert_error(qts, cpu_type, "cannot enable pauth-impdef without pauth",
+                 "{ 'pauth': false, 'pauth-impdef': true }");
+}
+
 static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
@@ -462,6 +474,7 @@ static void test_query_cpu_model_expansion(const void *data)
         assert_has_feature_enabled(qts, "cortex-a57", "aarch64");
 
         sve_tests_default(qts, "max");
+        pauth_tests_default(qts, "max");
 
         /* Test that features that depend on KVM generate errors without. */
         assert_error(qts, "max",
-- 
2.25.1



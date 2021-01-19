Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF232FBAF4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:21:36 +0100 (CET)
Received: from localhost ([::1]:48398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sp5-0002EW-Pp
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:21:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf8-0007NQ-1b
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:18 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf0-00018I-30
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:17 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a9so16621584wrt.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JUeetDRODCf1dgNmIm+hrnswLUE73SVxPqF3AG8XrIE=;
 b=thG1WcE9eLE83tXpo2GjZgOMCx8UsHasdnir5G4ZDpdA1zkB7op4Nu0Y2KQ0J+Lz3S
 bFpdOE9f6WnfQfUTAaUljZeEWkbmXw14ugKCWWsYDLEv2cUd8vH9A2pWa5TpfcswrVKp
 YiEdWgXF56ppojIFrf1htLmMpuilUmLC5qz5ruHG3YC/y/EO6tuXk6tkA2edamPZ7U+d
 gMp6IhcV24QVLvNypeHkIWiR2loLgaeD4KBioRce54hLHZnF7onpr6tdIriejStT6rb4
 Vhsdt5wzzWVm1Vku4N5yaVrB+hvGYvnJy1L2Ncz4qyI/WMsvhnCbuyxEftHWvycjSpZy
 DWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JUeetDRODCf1dgNmIm+hrnswLUE73SVxPqF3AG8XrIE=;
 b=QXVJJ6EuFxQ1+P+FRvlC336hpAQi4nMz4f+ouwgX/K3xhAWFZYC1ixXBfFv2/3slbi
 4kJLNmmwt9BtHzlq53MTXAyslO9lyCxRrLo8XgswmKhyYzj7ZcqgnFBIVpwWUrMi9ty5
 6WqYKYE70ceDtxmkfpfQqSc6Z1R1rySTzbJzlVnQZJGdOT406zugYiukFovzlTBRefcB
 0uTX54dwh0OBMQwFdBYV/pcxMlBiFtrXK7zIT50F51HnsKSvSsU4og4r8wqcL7d137AR
 uDM8V3Xa5mR8rzGr4Rbc/kDI52h3udWphxRADlSPuumq1J4G6nzR1XyTi0eI/FxNYFpt
 bROA==
X-Gm-Message-State: AOAM530lqw6E4x5qgAX9t3LD2dv3IcRlc4k3du0uCXr6FEX9I3ka6OsD
 ddnlsWkMdrOdjZCNTfYpeQcmvRyjhNAHLA==
X-Google-Smtp-Source: ABdhPJzoiFv+2JkBm0BffFlghDLf3k0BFhDPd0gaNIe9LBZDsqJzKsruZmo3d/yLtiCjRZWbYWvNLg==
X-Received: by 2002:a5d:5304:: with SMTP id e4mr2092763wrv.167.1611069068221; 
 Tue, 19 Jan 2021 07:11:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/33] target/arm: Add cpu properties to control pauth
Date: Tue, 19 Jan 2021 15:10:33 +0000
Message-Id: <20210119151104.16264-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

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
Message-id: 20210111235740.462469-3-richard.henderson@linaro.org
[PMM: fixed docs typo, tweaked text to clarify that the impdef
algorithm is specific to QEMU]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/cpu-features.rst | 21 +++++++++++++++++
 target/arm/cpu.h                 | 10 ++++++++
 target/arm/cpu.c                 | 13 +++++++++++
 target/arm/cpu64.c               | 40 ++++++++++++++++++++++++++++----
 target/arm/monitor.c             |  1 +
 tests/qtest/arm-cpu-features.c   | 13 +++++++++++
 6 files changed, 94 insertions(+), 4 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 35196a6b759..c455442eaf5 100644
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
+                           *impdef* (Implementation Defined) algorithm
+                           is enabled or the *architected* QARMA algorithm
+                           is enabled.  By default the impdef algorithm
+                           is disabled, and QARMA is enabled.
+
+                           The architected QARMA algorithm has good
+                           cryptographic properties, but can be quite slow
+                           to emulate.  The impdef algorithm used by QEMU
+                           is non-cryptographic but significantly faster.
+
 SVE CPU Properties
 ==================
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 84784070a74..f58aada4104 100644
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
index 8387e94b944..be18df5464d 100644
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
index da24f94baa2..fa58211f7e6 100644
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
@@ -721,6 +749,10 @@ static void aarch64_max_initfn(Object *obj)
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
index 198b14e95e2..80c64fa3556 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -95,6 +95,7 @@ static const char *cpu_model_advertised_features[] = {
     "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
     "kvm-no-adjvtime", "kvm-steal-time",
+    "pauth", "pauth-impdef",
     NULL
 };
 
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index bc681a95d52..8252b85bb85 100644
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
2.20.1



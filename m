Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AABE4B3947
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 05:00:03 +0100 (CET)
Received: from localhost ([::1]:51176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ63N-00079L-RQ
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 23:00:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ61U-0005iy-Bq; Sat, 12 Feb 2022 22:58:04 -0500
Received: from [2607:f8b0:4864:20::42e] (port=39758
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ61S-0002cL-2f; Sat, 12 Feb 2022 22:58:04 -0500
Received: by mail-pf1-x42e.google.com with SMTP id m22so4131463pfk.6;
 Sat, 12 Feb 2022 19:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hgKkhyGa1MZG+6xTJAHxPgWUd5NWDxfubWdlwv7McIM=;
 b=NOain2WZKo0UUaeoGAXjeJSPdxoXs4d9np2wGC3boKhJUSsooQtcMosFPYDy4scrBR
 F8Tr/IEQCouXe2lKM1fuEA1a0fX7bi5AjiXimIc3A7drox1lntoZRmSn0o/fv9WgQsB9
 33BaM08X7nrBWuG43a6ZL3uJqNt6L/fjLJ/9xmLADAebFTEgVR1cXWDjlaykiaOlbti6
 z5XrGzYbWv7sebEna2sDCmYpZU31GeEc40R1EBPSHzPuPHWaP4DcmFEI/OFv8bzqO92e
 /LWawO1QInloMR5suHGFrSdytiWyHIqIWMjA2yBxPiDPXrVqSc9GBI1CYUF8IS5yQ+ll
 DePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hgKkhyGa1MZG+6xTJAHxPgWUd5NWDxfubWdlwv7McIM=;
 b=BDemuM4QEmj3bWzOkUdMzAomyQpCapOXM6KaAllKmy3Q0OR4pD34tOtJviCg7J0dDs
 ggGWqos9D2Wwlql3e/Gipswm+9NLw1ZcICN16yJqUxc3mAHPLCHirhm4KkMRZXu/TwpK
 +k1RxQ+8/vEOhldvrWKRrfLQY3z9OVjvmkALrsdMIzIBPJz1TwCZq6vA3PGd1+mrUjeM
 jfj6BEiEzvJlBXRRLdecKXfHPs3zh1WIP1ha04KTHEjeKdvAhbaGn8/vD6aSxQ3vNcje
 IBGxSHyvKVn58dlBTmT9avohHFnXy1+T++wRd5OYY0P8twaRtw6hKlav7bp8zGfeaoA/
 0sXg==
X-Gm-Message-State: AOAM533GYuFI7AwoE0ugj4Io4LHyGslU2VGrnZt/CV6e8bnBoBC59Nmq
 rXSmGXgZGiKMARlxtCZdtXWySRqtBLA=
X-Google-Smtp-Source: ABdhPJw2G3smK0LBb39I+7ai6hgAuT0MeP2q1eIerdxt5RVKc98MbH5eE7FqeOJCz/he/50AEigR5A==
X-Received: by 2002:a63:6a87:: with SMTP id f129mr7042808pgc.0.1644724680089; 
 Sat, 12 Feb 2022 19:58:00 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d85b:35dd:dae2:b7a9])
 by smtp.gmail.com with ESMTPSA id u13sm33581348pfg.151.2022.02.12.19.57.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Feb 2022 19:57:59 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] target/arm: Support PSCI 1.1 and SMCCC 1.0
Date: Sun, 13 Feb 2022 12:57:53 +0900
Message-Id: <20220213035753.34577-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support the latest PSCI on TCG and HVF. A 64-bit function called from
AArch32 now returns NOT_SUPPORTED, which is necessary to adhere to SMC
Calling Convention 1.0. It is still not compliant with SMCCC 1.3 since
they do not implement mandatory functions.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/arm/boot.c           | 12 +++++++++---
 target/arm/cpu.c        |  5 +++--
 target/arm/hvf/hvf.c    | 27 ++++++++++++++++++++++++++-
 target/arm/kvm-consts.h |  8 ++++++--
 target/arm/kvm64.c      |  2 +-
 target/arm/psci.c       | 35 ++++++++++++++++++++++++++++++++---
 6 files changed, 77 insertions(+), 12 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b1e95978f26..0eeef94ceb5 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -488,9 +488,15 @@ static void fdt_add_psci_node(void *fdt)
     }
 
     qemu_fdt_add_subnode(fdt, "/psci");
-    if (armcpu->psci_version == 2) {
-        const char comp[] = "arm,psci-0.2\0arm,psci";
-        qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
+    if (armcpu->psci_version == QEMU_PSCI_VERSION_0_2 ||
+        armcpu->psci_version == QEMU_PSCI_VERSION_1_1) {
+        if (armcpu->psci_version == QEMU_PSCI_VERSION_0_2) {
+            const char comp[] = "arm,psci-0.2\0arm,psci";
+            qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
+        } else {
+            const char comp[] = "arm,psci-1.0\0arm,psci-0.2\0arm,psci";
+            qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
+        }
 
         cpu_off_fn = QEMU_PSCI_0_2_FN_CPU_OFF;
         if (arm_feature(&armcpu->env, ARM_FEATURE_AARCH64)) {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5a9c02a2561..307a83a7bb6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1110,11 +1110,12 @@ static void arm_cpu_initfn(Object *obj)
      * picky DTB consumer will also provide a helpful error message.
      */
     cpu->dtb_compatible = "qemu,unknown";
-    cpu->psci_version = 1; /* By default assume PSCI v0.1 */
+    cpu->psci_version = QEMU_PSCI_VERSION_0_1; /* By default assume PSCI v0.1 */
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
 
     if (tcg_enabled() || hvf_enabled()) {
-        cpu->psci_version = 2; /* TCG and HVF implement PSCI 0.2 */
+        /* TCG and HVF implement PSCI 1.1 */
+        cpu->psci_version = QEMU_PSCI_VERSION_1_1;
     }
 }
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0dc96560d34..1701fb8bbdb 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -653,7 +653,7 @@ static bool hvf_handle_psci_call(CPUState *cpu)
 
     switch (param[0]) {
     case QEMU_PSCI_0_2_FN_PSCI_VERSION:
-        ret = QEMU_PSCI_0_2_RET_VERSION_0_2;
+        ret = QEMU_PSCI_VERSION_1_1;
         break;
     case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
         ret = QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED; /* No trusted OS */
@@ -721,6 +721,31 @@ static bool hvf_handle_psci_call(CPUState *cpu)
     case QEMU_PSCI_0_2_FN_MIGRATE:
         ret = QEMU_PSCI_RET_NOT_SUPPORTED;
         break;
+    case QEMU_PSCI_1_0_FN_PSCI_FEATURES:
+        switch (param[1]) {
+        case QEMU_PSCI_0_2_FN_PSCI_VERSION:
+        case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
+        case QEMU_PSCI_0_2_FN_AFFINITY_INFO:
+        case QEMU_PSCI_0_2_FN64_AFFINITY_INFO:
+        case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
+        case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
+        case QEMU_PSCI_0_1_FN_CPU_ON:
+        case QEMU_PSCI_0_2_FN_CPU_ON:
+        case QEMU_PSCI_0_2_FN64_CPU_ON:
+        case QEMU_PSCI_0_1_FN_CPU_OFF:
+        case QEMU_PSCI_0_2_FN_CPU_OFF:
+        case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
+        case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
+        case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
+        case QEMU_PSCI_1_0_FN_PSCI_FEATURES:
+            ret = 0;
+            break;
+        case QEMU_PSCI_0_1_FN_MIGRATE:
+        case QEMU_PSCI_0_2_FN_MIGRATE:
+        default:
+            ret = QEMU_PSCI_RET_NOT_SUPPORTED;
+        }
+        break;
     default:
         return false;
     }
diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index 580f1c1fee0..ee877aa3a5c 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -77,6 +77,8 @@ MISMATCH_CHECK(QEMU_PSCI_0_1_FN_MIGRATE, KVM_PSCI_FN_MIGRATE);
 #define QEMU_PSCI_0_2_FN64_AFFINITY_INFO QEMU_PSCI_0_2_FN64(4)
 #define QEMU_PSCI_0_2_FN64_MIGRATE QEMU_PSCI_0_2_FN64(5)
 
+#define QEMU_PSCI_1_0_FN_PSCI_FEATURES QEMU_PSCI_0_2_FN(10)
+
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN_CPU_SUSPEND, PSCI_0_2_FN_CPU_SUSPEND);
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN_CPU_OFF, PSCI_0_2_FN_CPU_OFF);
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN_CPU_ON, PSCI_0_2_FN_CPU_ON);
@@ -84,14 +86,16 @@ MISMATCH_CHECK(QEMU_PSCI_0_2_FN_MIGRATE, PSCI_0_2_FN_MIGRATE);
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN64_CPU_SUSPEND, PSCI_0_2_FN64_CPU_SUSPEND);
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN64_CPU_ON, PSCI_0_2_FN64_CPU_ON);
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN64_MIGRATE, PSCI_0_2_FN64_MIGRATE);
+MISMATCH_CHECK(QEMU_PSCI_1_0_FN_PSCI_FEATURES, PSCI_1_0_FN_PSCI_FEATURES);
 
 /* PSCI v0.2 return values used by TCG emulation of PSCI */
 
 /* No Trusted OS migration to worry about when offlining CPUs */
 #define QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED        2
 
-/* We implement version 0.2 only */
-#define QEMU_PSCI_0_2_RET_VERSION_0_2                       2
+#define QEMU_PSCI_VERSION_0_1                     0x00001
+#define QEMU_PSCI_VERSION_0_2                     0x00002
+#define QEMU_PSCI_VERSION_1_1                     0x10001
 
 MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
 MISMATCH_CHECK(QEMU_PSCI_0_2_RET_VERSION_0_2,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 71c3ca69717..64d48bfb19d 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -864,7 +864,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_POWER_OFF;
     }
     if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
-        cpu->psci_version = 2;
+        cpu->psci_version = QEMU_PSCI_VERSION_0_2;
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PSCI_0_2;
     }
     if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
diff --git a/target/arm/psci.c b/target/arm/psci.c
index b279c0b9a45..6c1239bb968 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -57,7 +57,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
 {
     /*
      * This function partially implements the logic for dispatching Power State
-     * Coordination Interface (PSCI) calls (as described in ARM DEN 0022B.b),
+     * Coordination Interface (PSCI) calls (as described in ARM DEN 0022D.b),
      * to the extent required for bringing up and taking down secondary cores,
      * and for handling reset and poweroff requests.
      * Additional information about the calling convention used is available in
@@ -80,7 +80,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
     }
 
     if ((param[0] & QEMU_PSCI_0_2_64BIT) && !is_a64(env)) {
-        ret = QEMU_PSCI_RET_INVALID_PARAMS;
+        ret = QEMU_PSCI_RET_NOT_SUPPORTED;
         goto err;
     }
 
@@ -89,7 +89,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
         ARMCPU *target_cpu;
 
     case QEMU_PSCI_0_2_FN_PSCI_VERSION:
-        ret = QEMU_PSCI_0_2_RET_VERSION_0_2;
+        ret = QEMU_PSCI_VERSION_1_1;
         break;
     case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
         ret = QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED; /* No trusted OS */
@@ -170,6 +170,35 @@ void arm_handle_psci_call(ARMCPU *cpu)
         }
         helper_wfi(env, 4);
         break;
+    case QEMU_PSCI_1_0_FN_PSCI_FEATURES:
+        switch (param[1]) {
+        case QEMU_PSCI_0_2_FN_PSCI_VERSION:
+        case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
+        case QEMU_PSCI_0_2_FN_AFFINITY_INFO:
+        case QEMU_PSCI_0_2_FN64_AFFINITY_INFO:
+        case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
+        case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
+        case QEMU_PSCI_0_1_FN_CPU_ON:
+        case QEMU_PSCI_0_2_FN_CPU_ON:
+        case QEMU_PSCI_0_2_FN64_CPU_ON:
+        case QEMU_PSCI_0_1_FN_CPU_OFF:
+        case QEMU_PSCI_0_2_FN_CPU_OFF:
+        case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
+        case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
+        case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
+        case QEMU_PSCI_1_0_FN_PSCI_FEATURES:
+            if (!(param[1] & QEMU_PSCI_0_2_64BIT) || is_a64(env)) {
+                ret = 0;
+                break;
+            }
+            /* fallthrough */
+        case QEMU_PSCI_0_1_FN_MIGRATE:
+        case QEMU_PSCI_0_2_FN_MIGRATE:
+        default:
+            ret = QEMU_PSCI_RET_NOT_SUPPORTED;
+            break;
+        }
+        break;
     case QEMU_PSCI_0_1_FN_MIGRATE:
     case QEMU_PSCI_0_2_FN_MIGRATE:
     default:
-- 
2.32.0 (Apple Git-132)



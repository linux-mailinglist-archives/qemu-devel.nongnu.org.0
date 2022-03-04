Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1D24CDDBB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:10:15 +0100 (CET)
Received: from localhost ([::1]:59744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQEFi-0006US-Pr
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:10:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQE8q-0004zu-Bd
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:03:08 -0500
Received: from [2607:f8b0:4864:20::62e] (port=40806
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQE8o-0005xu-K4
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:03:08 -0500
Received: by mail-pl1-x62e.google.com with SMTP id z11so8694624pla.7
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 12:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TLjgVybJvPoE9KhD4vPFEO3Qby2QVt4ZAtq9+cFyp24=;
 b=m2ehXtTaHFJ87qpPsfMv9GvJbGPuTBmbxAyLMzwWufNEnLaFqDmJ8cSyHUfYMOIivi
 RWYNwoxKf2G0BmYRdOJUfbc/91U0X2UbWJVl/a4hpHa0YMGdo/TvRdD103lftdL/gzxn
 w6WbYXJWNDp6WXcT3YntgUsxMyGHggxoKMTGBt8rOX9s7nlmxsOxKIdUZo586lhzaXUL
 2cX9rCHj3KbadTgKzrq7iR4Vx55AbHWil8/9HzC5X850Ut4jzQhCoWUv3moTxfd4u5dY
 FvbEB8v5H1AzzKxr8it1kv2vzOhmXVEidJkoQufmdgVqRTxkFjSGNrW1rJmjVJobxboU
 pFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TLjgVybJvPoE9KhD4vPFEO3Qby2QVt4ZAtq9+cFyp24=;
 b=CEDgjfrYJyp+PWh2ocNHG6g/6HYpiAWsTVx1YIYM7wk7Wrh2vuDZ6rjgfT/iSrCO6b
 Qu/FA8k+ubuwtgrLROtUzt6pqEw67l6Rr4IhFiM9eFT2tYb0zETotOrecbBG2ObsFtse
 gNbAEciw7YumFsTD7jwQVIF/bBpRiwNdkXlXwvwLUtLaqic7Oj3aGufbr++mlfEavKHC
 4LU7PzWFX3/eGIihBzoJQ2D8mfnwmJZVBEt40/se0Me+etJcIrrcDodeK5YuzD6Vzg01
 iMWKUzG6sWTnWbThnjD8vNen7fCGiu2X63qHdhenOxXfcNKZvMf7Xr9cxerMr1Muu/g0
 jJJA==
X-Gm-Message-State: AOAM532c8wZ12ceYkEvV5GH9HZ/mhuExSnTIpCnvt9e7a1Zo7cbYGBmg
 rcMW8H17k/BfKbd9X/ecLezgHsbPI+c0Mg==
X-Google-Smtp-Source: ABdhPJwvZYylHKLSFzOTDHqLLmzx5p7VlsAwm1TGGIo1OcRnoaSYpLcF0xEyYvk/4428nvgJGtquDQ==
X-Received: by 2002:a17:903:11c4:b0:151:9bf6:f481 with SMTP id
 q4-20020a17090311c400b001519bf6f481mr122410plh.50.1646424185235; 
 Fri, 04 Mar 2022 12:03:05 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 hk2-20020a17090b224200b001bf0a7d9da3sm5716744pjb.9.2022.03.04.12.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:03:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/2] target/arm: Provide cpu property for controling
 FEAT_LPA2
Date: Fri,  4 Mar 2022 10:03:00 -1000
Message-Id: <20220304200301.524525-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304200301.524525-1-richard.henderson@linaro.org>
References: <20220304200301.524525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a Linux kernel bug present until v5.12 that prevents
booting with FEAT_LPA2 enabled.  As a workaround for TCG, allow
the feature to be disabled from -cpu max.

Since this kernel bug is present in the Fedora 31 image that
we test in avocado, disable lpa2 on the command-line.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h            |  5 ++++-
 target/arm/cpu.c            |  6 ++++++
 target/arm/cpu64.c          | 24 ++++++++++++++++++++++++
 tests/avocado/boot_linux.py |  2 ++
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 24d9fff170..4aa70ceca1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -204,10 +204,12 @@ typedef struct {
 # define ARM_MAX_VQ    16
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
 static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
 static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
+static inline void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 typedef struct ARMVectorReg {
@@ -975,10 +977,11 @@ struct ARMCPU {
 
     /*
      * Intermediate values used during property parsing.
-     * Once finalized, the values should be read from ID_AA64ISAR1.
+     * Once finalized, the values should be read from ID_AA64*.
      */
     bool prop_pauth;
     bool prop_pauth_impdef;
+    bool prop_lpa2;
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint32_t dcz_blocksize;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7091684a16..185d4e774d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1392,6 +1392,12 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             error_propagate(errp, local_err);
             return;
         }
+
+        arm_cpu_lpa2_finalize(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
 
     if (kvm_enabled()) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2fdc16bf18..eb44c05822 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -688,6 +688,29 @@ void aarch64_add_pauth_properties(Object *obj)
     }
 }
 
+static Property arm_cpu_lpa2_property =
+    DEFINE_PROP_BOOL("lpa2", ARMCPU, prop_lpa2, true);
+
+void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
+{
+    uint64_t t;
+
+    /*
+     * We only install the property for tcg -cpu max; this is the
+     * only situation in which the cpu field can be true.
+     */
+    if (!cpu->prop_lpa2) {
+        return;
+    }
+
+    t = cpu->isar.id_aa64mmfr0;
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 2);   /* 16k pages w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4, 1);    /*  4k pages w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 3); /* 16k stage2 w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 3);  /*  4k stage2 w/ LPA2 */
+    cpu->isar.id_aa64mmfr0 = t;
+}
+
 static void aarch64_host_initfn(Object *obj)
 {
 #if defined(CONFIG_KVM)
@@ -897,6 +920,7 @@ static void aarch64_max_initfn(Object *obj)
     aarch64_add_sve_properties(obj);
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
+    qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
 }
 
 static void aarch64_a64fx_initfn(Object *obj)
diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index ab19146d1e..ee584d2fdf 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -79,6 +79,7 @@ def test_virt_tcg_gicv2(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
+        self.vm.add_args("-cpu", "max,lpa2=off")
         self.vm.add_args("-machine", "virt,gic-version=2")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
@@ -91,6 +92,7 @@ def test_virt_tcg_gicv3(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
+        self.vm.add_args("-cpu", "max,lpa2=off")
         self.vm.add_args("-machine", "virt,gic-version=3")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
-- 
2.25.1


